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
                this.currentRow = {id: null, title: '', status: 'Open', labels: '', description: '', created: new Date(), completed: null};

                await sendData(this.tableData);
                },
                resetFilters() {
                    this.filter = '';
                    this.statusFilter = '';
                    this.labelsFilter = '';
                },
                renderMarkdown(text) {
                    return marked(text);
                },
                toggleEditingDescription() {
                    this.editingDescription = !this.editingDescription;
                },
                editRow(row) {
                this.editing = true;
                this.currentRow = {...row};
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

                this.editing = false;
                this.currentRow = {};

                await sendData(this.tableData);
                },
                async deleteRow(id) {
                this.tableData = this.tableData.filter(row => row.id !== id);
                this.editing = false;
                this.currentRow = {};

                await sendData(this.tableData);
                },
                cancelEdit() {
                this.editing = false;
                this.currentRow = {};
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
