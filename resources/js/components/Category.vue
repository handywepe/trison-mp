<template>

<div class="content" style="min-height: 660px;">
    <div v-if="$gate.isAdmin() || $gate.isManager()">
        <!-- <div class="container-fluid container-fixed-lg">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a >Pages</a></li>
                <li class="breadcrumb-item active">Blank template</li>
            </ol>
        </div> -->
        <div class="social " data-pages="social">
            <!-- START JUMBOTRON -->
            <div class="jumbotron" data-social="cover" data-pages="parallax" style="height: 200px">
                <div class="cover-photo">
                <img alt="Cover photo" src="assets/img/cover/c7.jpg" style="width: 100%" />
                </div>
                <div class=" container-fluid   container-fixed-lg sm-p-l-0 sm-p-r-0">
                <div class="inner">
                    <div class="pull-bottom bottom-left m-b-40 sm-p-l-15">
                    <h1 class="text-white no-margin" style="text-shadow: 3px 2px 5px #131313"><span class="semi-bold">Kategori</span> Produk</h1>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <!-- START CONTAINER FLUID -->
        <div class="container-fluid container-fixed-lg ">
            <div class="row jutify-content-center">
                <div class="col-sm-6 col-12 px-4">
                    <div class="card card-transparent">
                        <div class="input-group">
                            <select class="custom-select col-4" id="filter" v-model="filters.name.keys[0]" title="Filter By" @change="reset">
                                <option value="nama">Nama</option>
                            </select>
                            <input type="search" class="form-control" v-model="filters.name.value" placeholder="ketik untuk mencari">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-12 px-4">
                    <div class="float-right">
                        <button class="btn btn-success mr-2" @click="addModal">
                        <i class="fas fa-plus fa-fw"></i>    Kategori</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-body">
                    <div class="table-responsive sm-m-b-15">
                        <v-table class="wrap table table-hover tableFixHead text-nowrap" id="table"
                            :data="categories"
                            :currentPage.sync="currentPage"
                            :pageSize="pagination"
                            :filters="filters"
                            @totalItemsChanged="totalItem = $event"
                            @totalPagesChanged="totalPages = $event">
                            <thead slot="head" style="bg-white">
                                <tr>
                                    <v-th sortKey="id">id</v-th>
                                    <v-th sortKey="nama">Nama</v-th>
                                    <v-th sortKey="updated_at" defaultSort="desc">Aksi</v-th>
                                </tr>
                            </thead>
                            <tbody slot="body" slot-scope="{displayData}">
                                <!-- loading -->
                                <tr role="row" class="b-table-busy-slot" v-if="loading === true">
                                    <td colspan="9" role="cell" class="">
                                        <div class="text-center text-success my-2">
                                            <span aria-hidden="true" class="align-middle spinner-border"></span>
                                            <strong>Loading...</strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr role="row" class="b-table-busy-slot" v-if="totalItem === 0 && loading === false">
                                    <td colspan="9" role="cell" class="">
                                        <div class="text-center text-success my-2">
                                            <strong>Kategori tidak ditemukan</strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr v-for="row in displayData" :key="row.id">
                                    <td>{{row.id}}</td>
                                    <td>{{row.nama}}</td>
                                    <td hidden>{{row.updated_at}}</td>
                                    <td>
                                        <div class="btn-group btn-group">
                                            <a  @click="editModal(row)" class="btn btn-success" data-toggle="tooltip" data-placement="top"
                                            title="Edit"><i class="fas fa-pen"></i></a>

                                            <a  @click="deleteData(row.id)" class="btn btn-danger" data-toggle="tooltip" data-placement="top"
                                            title="Hapus"><i class="fas fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </v-table>
                    </div>
                </div>
                <div class="card-footer bg-white">
                    <div class="row">
                        <div class="col">
                            <label for="pagination">show</label>
                            <select class="custom-select" v-model.number="pagination" type="number" style="width: auto" @change="scroll">
                                <option>10</option>
                                <option>50</option>
                                <option>100</option>
                            </select>
                            from {{ totalItem }}
                        </div>
                        <smart-pagination :currentPage.sync="currentPage" :totalPages="totalPages" :maxPageLinks="4" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt-4" v-if="!$gate.isAdmin() && !$gate.isManager()">
        <not-found-page></not-found-page>
    </div>

    <!-- Modal Add + Edit-->
    <div class="modal fade" id="formData" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" v-show="!editmode" id="exampleModalCenterTitle">Tambah Kategori Baru</h5>
                    <h5 class="modal-title" v-show="editmode" id="exampleModalCenterTitle">Edit Kategori</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent ="editmode ? updateData() : createData()">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Nama</label>
                            <div class="col-sm-10">
                                <input v-model="form.nama" type="text" name="nama" placeholder="Nama Kategori"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('nama')}">
                                <has-error :form="form" field="nama"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                            <button v-if="btnload === true" class="btn btn-success" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Loading...
                            </button>
                            <button v-show="editmode" v-if="btnload === false" type="submit" class="btn btn-success">Perbarui</button>
                            <button v-show="!editmode" v-if="btnload === false" type="submit" class="btn btn-success">Simpan</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
</template>

<script>
import Swal from 'sweetalert2';
    export default {
        data(){
            return{
                btnload: false,
                loading: true,
                categories : [],
                editmode: false,
                currentPage: 1,
                totalPages: 0,
                pagination: 10,
                totalItem: 0,
                filters: {
                    name: { value: '', keys: ['nama'] }
                },
                form: new Form ({
                    id:'',
                    nama : '',
                }),
            }
        },
        methods:{
            toggleLoading() {
                this.loading = false;
            },
            updateData(){
                this.$Progress.start();
                this.btnload = true;
                this.form.put('api/category/'+this.form.id)
                .then(() => {
                    this.loadData();
                    $('#formData').modal('hide');
                    Swal.fire({
                        icon: 'success',
                        title: 'Diperbarui!',
                        text: 'Kategori berhasil diperbarui',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.finish();
                })
                .catch(() => {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Gagal!',
                        text: 'Kategori gagal diperbarui',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.fail();
                    this.btnload = false;
                })
            },
            createData(){
                this.$Progress.start();
                this.btnload = true;
                this.form.post('api/category')
                .then(()=>{
                    this.loadData();
                    $('#formData').modal('hide')
                    Swal.fire({
                        icon: 'success',
                        title: 'Created!',
                        text: 'Kategori berhasil ditambah',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.finish();
                })
                .catch(()=>{
                    Swal.fire({
                        icon: 'warning',
                        title: 'Gagal!',
                        text: 'Kategori gagal ditambah',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.fail();
                    this.btnload = false;
                })
            },
            reset(){
                this.filters.name.value = '';
            },
            editModal(categories){
                this.form.errors.errors = {};
                this.btnload = false;
                this.editmode = true;
                this.form.reset();
                $('#formData').modal('show');
                this.form.fill(categories);
            },
            addModal(){
                this.form.errors.errors = {};
                this.btnload = false;
                this.editmode = false;
                this.form.reset();
                $('#formData').modal('show');
            },
            scroll(){
                $(function() {
                    $("body").getNiceScroll().resize();
                    $("body").niceScroll();
                });
            },
            loadData(){
                this.$Progress.start();
                axios.get("api/category").then(( data ) => (this.categories = data.data));
                this.$Progress.finish();
            },
            deleteData(id){
                Swal.fire({
                    title: 'Anda Yakin?',
                    text: "Kategori yang dihapus tidak dapat dikembalikan!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#e95555',
                    cancelButtonColor: '#2eaeb3',
                    confirmButtonText: 'Ya, Hapus saja!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    //send request to the server
                    if (result.value) {
                        this.form.delete('api/category/'+id).then(()=>{
                            this.loadData();
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: 'Kategori berhasil dihapus',
                                showConfirmButton: false,
                                timer: 1500,
                            })
                        }).catch(()=>{
                            Swal.fire({
                                icon: 'warning',
                                title: 'Gagal!',
                                text: 'Anda tidak memiliki akses',
                                showConfirmButton: false,
                                timer: 1500,
                            })
                        });
                    }
                })
            },
        },
        created(){
            window.scrollTo(0,0);
            $('.modal').modal('hide');
            $('.modal-backdrop').remove();
            if (this.$gate.isManager() || this.$gate.isAdmin()) {
                this.loadData();
            }
        },
        mounted() {
            // console.log('Component mounted.')
        },
        updated(){
            $(function() {
                // $("body").getNiceScroll().resize();
                // $("body").niceScroll();
            });
        },
        watch:{
            categories : 'toggleLoading',
        },
    }
</script>
