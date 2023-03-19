const app = Vue.createApp({
    data() {
        return {
            columns: ['ID', 'Title', 'Status', 'Labels', 'Created'],
            tableData: [
                {id: 1, title: 'Create project structure', status: 'In progress', labels: 'frontend,backend', description: 'Setup the project structure and tools', created: new Date(2023, 1, 5), completed: null},
                {id: 2, title: 'Design UI', status: 'Open', labels: 'design', description: 'Design the user interface for the application', created: new Date(2023, 1, 6), completed: null},
                {id: 3, title: 'Implement backend', status: 'In progress', labels: 'backend', description: 'Develop the backend functionality and APIs', created: new Date(2023, 1, 10), completed: null},
                {id: 4, title: 'Write tests', status: 'Open', labels: 'testing', description: 'Write unit and integration tests for the project', created: new Date(2023, 1, 12), completed: null},
                ],
                filter: '',
                statusFilter: '',
                labelsFilter: '',
                editing: false,
                editingDescription: true,
                currentRow: {},
                statuses: ['Open', 'In progress', 'Completed', 'Closed'],
                sortDirection: 'asc',
                };
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
                addRow() {
                this.editing = true;
                this.currentRow = {id: null, title: '', status: 'Open', labels: '', description: '', created: new Date(), completed: null};
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
                saveRow() {
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
                this.editing = false;
                this.currentRow = {};
                },
                deleteRow(id) {
                this.tableData = this.tableData.filter(row => row.id !== id);
                this.editing = false;
                this.currentRow = {};
                },
                cancelEdit() {
                this.editing = false;
                this.currentRow = {};
                },
                updateStatus(row) {
                if (row.status === 'Completed' || row.status === 'Closed') {
                row.completed = new Date();
                } else {
                row.completed = null;
                }
                },
                toggleSort() {
                this.sortDirection = this.sortDirection === 'asc' ? 'desc' : 'asc';
                },
                },
                });
                
                app.mount('#app');
