async function fetchData() {
  const response = await fetch('data.json');
  const data = await response.json();
  return data.projects;
}

async function sendData(data) {
  await fetch('update', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ projects: data }),
  });
}

// New marked.js renderer to add class to ul for task-list
const renderer = new marked.Renderer();
const defaultListRenderer = renderer.list;

renderer.list = function(body, ordered, start) {
  // If there's input elements in body, add task list class
  if (body.includes('<input')){
    var temp = "<ul class='task-list'>" + body + "</ul>";
    return temp;
  }
  // else, use default list renderer for ordered lists, unordered lists, etc.
  return defaultListRenderer.call(this, body, ordered, start);
};

// Set the custom renderer as the renderer for marked
marked.setOptions({
  renderer: renderer,
});

const app = Vue.createApp({
  data() {
    return {
      columns: ['ID', 'Title', 'Status', 'Labels', 'Created'],
      tableData: [],
      filter: '',
      statusFilter: '',
      labelsFilter: '',
      editing: false,
      editingDescription: false,
      currentRow: {},
      statuses: ['Open', 'In progress', 'Completed', 'Closed'],
      sortDirection: 'desc',
    };
  },
  async mounted() {
    this.tableData = await fetchData();
  },
  computed: {
    filteredAndSortedTableData() {
      let data = this.tableData.filter(row => row.title.toLowerCase().includes(this.filter.toLowerCase()) && (this.statusFilter === '' || row.status === this.statusFilter) && (this.labelsFilter === '' || row.labels.toLowerCase().includes(this.labelsFilter.toLowerCase())));
      data.sort((a, b) => {
        const dateA = new Date(a.created);
        const dateB = new Date(b.created);
        return this.sortDirection === 'asc' ? dateA - dateB : dateB - dateA;
      });
      return data;
    }
  },
  methods: {
    async addRow() {
      this.editing = true;
      this.currentRow = { id: null, title: '', status: 'Open', labels: '', description: '', created: new Date(), completed: null };

      await sendData(this.tableData);
    },
    resetFilters() {
      this.filter = '';
      this.statusFilter = '';
      this.labelsFilter = '';
    },
    renderMarkdown(text) {
      // regex to wrap all task-list text in a span
      const regex_add_span_to_task_item = /(<li>\s*<input[^>]*>)([^<]*)(<\/li>)/g;
      // regex to make check boxes not disabled
      const regex_remove_disabled_from_checkbox = /(<input[^>]*)\s*disabled([^>]*>)/g;
      return marked(text).replace(regex_add_span_to_task_item, '$1<span>$2</span>$3').replace(regex_remove_disabled_from_checkbox, '$1$2');
    },
    toggleEditingDescription() {
      this.editingDescription = !this.editingDescription;
    },
    editRow(row) {
      this.editing = true;
      this.currentRow = { ...row };
    },
    async saveRow() {
      if (this.currentRow.id === null) {
        const maxId = this.tableData.reduce((max, row) => Math.max(max, row.id), 0);
        this.currentRow.id = maxId + 1;
        this.tableData.push(this.currentRow);
      } else {
        const rowIndex = this.tableData.findIndex(row => row.id === this.currentRow.id);
        if (rowIndex > -1) {
          this.tableData.splice(rowIndex, 1, this.currentRow);
        }
      }

      if (this.currentRow.status === 'Completed' || this.currentRow.status === 'Closed') {
        this.currentRow.completed = new Date();
      } else {
        this.currentRow.completed = null;
      }
      
      // reset to markdown view
      this.editingDescription = false;

      // Don't close after saving
      //this.editing = false;
      //this.currentRow = {};

      await sendData(this.tableData);
    },
    formatDate(value) {
      if (!value) return '';

      const date = new Date(value);
      const options = {
        timeZone: 'America/New_York',
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: 'numeric',
        minute: 'numeric',
        hour12: true,
      };

      return new Intl.DateTimeFormat('en-US', options).format(date);
    },
    async deleteRow(id) {

      if (confirm('Delete this task?')) {
        this.tableData = this.tableData.filter(row => row.id !== id);
        this.editing = false;
        this.currentRow = {};
      }

      await sendData(this.tableData);
    },
    cancelEdit() {
      this.editing = false;
      this.currentRow = {};
      this.editingDescription = false;
    },
    async updateStatus(row) {
      if (row.status === 'Completed' || row.status === 'Closed') {
        row.completed = new Date();
      } else {
        row.completed = null;
      }

      await sendData(this.tableData);
    },
    toggleSort() {
      this.sortDirection = this.sortDirection === 'asc' ? 'desc' : 'asc';
    },
  },
});


app.mount('#app');


