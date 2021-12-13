<template>

<div class="content" style="min-height: 660px;">
    <div v-if="$gate.isManager()">
        <div class="social " data-pages="social">
            <!-- START JUMBOTRON -->
            <!-- style="height: 200px; width: 100% !important" -->
            <div class="jumbotron" data-social="cover" data-pages="parallax" style="height: 200px;">
                <div class="cover-photo">
                <img alt="Cover photo" src="assets/img/cover/c4.jpg" style="width: 100%"/>
                </div>
                <div class=" container-fluid   container-fixed-lg sm-p-l-0 sm-p-r-0">
                <div class="inner">
                    <div class="pull-bottom bottom-left m-b-40 sm-p-l-15">
                    <h1 class="text-white no-margin" style="text-shadow: 3px 2px 5px #131313"><span class="semi-bold">Manajemen</span> Pengguna</h1>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <div class="container-fluid container-fixed-lg ">
            <div class="row jutify-content-center">
                <div class="col-sm-6 col-12 px-4">
                    <div class="card card-transparent">
                        <div class="input-group">
                            <select class="custom-select col-4" id="filter" v-model="filters.name.keys[0]" title="Filter By" @change="reset">
                                <option value="name">Nama</option>
                                <option value="type">Tipe</option>
                            </select>
                            <input type="search" class="form-control" v-model="filters.name.value" placeholder="ketik untuk mencari">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-12 px-4">
                    <div class="float-right">
                        <button class="btn btn-success mr-2" @click="addModal">
                        <i class="fas fa-plus fa-fw"></i>    Pengguna</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-body">
                    <div class="table-responsive sm-m-b-15">
                        <v-table class="wrap table table-hover tableFixHead text-nowrap" id="table"
                            :data="users"
                            :currentPage.sync="currentPage"
                            :pageSize="pagination"
                            :filters="filters"
                            @totalItemsChanged="totalItem = $event"
                            @totalPagesChanged="totalPages = $event">
                            <thead slot="head" style="bg-white">
                                <tr>
                                    <v-th sortKey="id">id</v-th>
                                    <v-th sortKey="name">Nama</v-th>
                                    <v-th sortKey="email">E-mail</v-th>
                                    <v-th sortKey="type">Tipe</v-th>
                                    <v-th sortKey="updated_at" defaultSort="desc">Aksi</v-th>
                                </tr>
                            </thead>
                            <tbody slot="body" slot-scope="{displayData}">
                                <tr v-for="row in displayData" :key="row.id">
                                    <td>{{row.id}}</td>
                                    <td>{{row.name}}</td>
                                    <td>{{row.email}}</td>
                                    <td>{{row.type}}</td>
                                    <td hidden>{{row.updated_at}}</td>
                                    <td>
                                        <div class="btn-group btn-group">
                                            <a @click="editModal(row)" class="btn btn-success" data-toggle="tooltip" data-placement="top"
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
    <!-- Modal Add + Edit-->
    <div class="modal fade" id="formData" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" v-show="!editmode" id="exampleModalCenterTitle">Tambah Pengguna Baru</h5>
                    <h5 class="modal-title" v-show="editmode" id="exampleModalCenterTitle">Edit Data Pengguna</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent ="editmode ? updateData() : createData()">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Nama</label>
                            <div class="col-sm-10">
                                <input v-model="form.name" type="text" name="name" placeholder="Nama Pengguna"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('name')}">
                                <has-error :form="form" field="name"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">E-mail</label>
                            <div class="col-sm-10">
                                <input v-model="form.email" type="email" name="email" placeholder="email"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('email')}">
                                <has-error :form="form" field="email"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tipe</label>
                            <div class="col-sm-10">
                                <select v-model="form.type" name="type" id="type" class="form-control" :class="{ 'is-invalid': form.errors.has('type')}">
                                    <option disabled value="">Pilih tipe pengguna</option>
                                    <option value="manager">Manager</option>
                                    <option value="produksi">Produksi</option>
                                    <option value="admin">Admin</option>
                                    <option value="sales">Sales</option>
                                    <option value="pramuniaga">Pramuniaga</option>
                                </select>
                                <has-error :form="form" field="type"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input v-show="editmode" v-model="form.password" type="password" name="password" placeholder="Password Baru"
                                class="form-control mb-2" :class="{ 'is-invalid': form.errors.has('password')}">
                                <input v-show="!editmode" v-model="form.password" type="password" name="password" placeholder="Password"
                                class="form-control mb-2" :class="{ 'is-invalid': form.errors.has('password')}">
                                <has-error :form="form" field="password"></has-error>
                                <input v-model="form.password_confirmation" type="password" name="password_confirmation" placeholder="Konfirmasi password"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('password')}">
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
    <div v-if="!$gate.isManager()" class="mt-4">
        <not-found-page></not-found-page>
    </div>
</div>
</template>

<script>
import Swal from 'sweetalert2';
    export default {
        data(){
            return{
                btnload: false,
                users : [],
                editmode: false,
                currentPage: 1,
                totalPages: 0,
                pagination: 10,
                totalItem: 0,
                filters: {
                    name: { value: '', keys: ['name'] }
                },
                form: new Form ({
                    id:'',
                    name : '',
                    email : '',
                    type : '',
                    password : '',
                    password_confirmation : '',
                    photo : ''
                }),
            }
        },
        methods:{
            updateData(){
                this.$Progress.start();
                if(this.form.password == ""){
                    this.form.password = undefined;
                }
                if(this.form.type == ""){
                    this.form.type = "user";
                }
                this.btnload = true;
                this.form.put('api/user/'+this.form.id)
                .then(() => {
                    this.loadData();
                    $('#formData').modal('hide');
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: 'Data pengguna berhasil diperbarui',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.finish();
                })
                .catch(() => {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Gagal!',
                        text: 'Data pengguna gagal diperbarui',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.btnload = false;
                    this.$Progress.fail();
                })
            },
            createData(){
                this.$Progress.start();
                if(this.form.type == ""){
                    this.form.type = "user";
                }
                this.btnload = true;
                this.form.post('api/user')
                .then(()=>{
                    this.loadData();
                    $('#formData').modal('hide')
                    Swal.fire({
                        icon: 'success',
                        title: 'Created!',
                        text: 'Pengguna berhasil ditambah',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                })
                .catch(()=>{
                    Swal.fire({
                        icon: 'warning',
                        title: 'Gagal!',
                        text: 'Pengguna gagal ditambah',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.fail()
                    this.btnload = false;
                })
                this.$Progress.finish();
            },
            reset(){
                this.filters.name.value = '';
            },
            editModal(users){
                this.form.errors.errors = {};
                this.btnload = false;
                this.editmode = true;
                this.form.reset();
                $('#formData').modal('show');
                this.form.fill(users);
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
                if(this.$gate.isManager()){
                    this.$Progress.start();
                    axios.get("api/user").then(( data ) => (this.users = data.data));
                    this.$Progress.finish();
                }
            },
            deleteData(id){
                Swal.fire({
                    title: 'Anda Yakin?',
                    text: "Pengguna yang dihapus tidak dapat dikembalikan!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#e95555',
                    cancelButtonColor: '#2eaeb3',
                    confirmButtonText: 'Ya, Hapus saja!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    //send request to the server
                    if (result.value) {
                        this.form.delete('api/user/'+id).then(()=>{
                            this.loadData();
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: 'Pengguna berhasil dihapus',
                                showConfirmButton: false,
                                timer: 1500,
                            })
                        }).catch(()=>{
                            Swal.fire({
                                icon: 'warning',
                                title: 'Gagal!',
                                text: 'Sepertinya ada masalah',
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
            this.loadData();
        },
        mounted() {
            // console.log('Component mounted.')
        },
        updated(){
            $(function() {
                    // $("body").getNiceScroll().resize();
                    // $("body").niceScroll();
                    // $("#table").floatThead({
                    //     position: 'fixed',
                    //     top: 60,
                    // });
            });
        },
    }
</script>
