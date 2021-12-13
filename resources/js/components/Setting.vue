<template>

<div class="content" style="min-height: 660px;">
    <div class="container-fluid container-fixed-lg">
        <!-- <ol class="breadcrumb">
            <li class="breadcrumb-item"><a >Pages</a></li>
            <li class="breadcrumb-item active">Blank template</li>
        </ol> -->
    </div>
        <div class="social " data-pages="social">
            <!-- START JUMBOTRON -->
            <div class="jumbotron" data-social="cover" data-pages="parallax" style="height: 200px">
                <div class="cover-photo">
                <img alt="Cover photo" src="assets/img/cover/c1.jpg" />
                </div>
                <div class=" container-fluid   container-fixed-lg sm-p-l-0 sm-p-r-0">
                <div class="inner">
                    <div class="pull-bottom bottom-left m-b-40 sm-p-l-15">
                    <h1 class="text-white no-margin" style="text-shadow: 3px 2px 5px #131313"><span class="bold">Pengaturan</span> Pengguna</h1>
                    </div>
                </div>
                </div>
            </div>
        </div>

    <div class="container-fluid container-fixed-lg ">

    </div>
    <div class="container-fluid container-fixed-lg bg-white">
        <div class="row">
            <div class="col-xl-5 col-lg-6">
            <!-- START card -->
                <div class="card card-transparent">
                    <img src="images/setting.svg" alt="setting" class="my-5 mx-3" style="height: 300px">
                </div>
            <!-- END card -->
            </div>
            <div class="col-xl-7 col-lg-6 ">
            <!-- START card -->
            <div class="card card-transparent">
                <div class="card-body">
                <form id="form-personal" role="form" autocomplete="off">
                    <div class="row clearfix">
                        <div class="form-group form-group-default required" :class="{ 'has-error': form.errors.has('name')}">
                        <label>Nama</label>
                        <input v-model="form.name" type="text" class="form-control" name="name" placeholder="input nama user"
                        :class="{ 'is-invalid': form.errors.has('name')}" required>
                        <has-error :form="form" field="name"></has-error>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="form-group form-group-default required" :class="{ 'has-error': form.errors.has('email')}">
                        <label>Email</label>
                        <input v-model="form.email" type="email" class="form-control" name="email" placeholder="enter your mail address"
                        :class="{ 'is-invalid': form.errors.has('email')}" required>
                        <has-error :form="form" field="email"></has-error>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group form-group-default" :class="{ 'has-error': form.errors.has('password')}">
                            <label>Password</label>
                            <input v-model="form.password" type="password" class="form-control" name="password"
                            :class="{ 'is-invalid': form.errors.has('password')}"
                            placeholder="Kosongkan jika tidak ingin merubah password">
                            <has-error :form="form" field="password"></has-error>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                       <div class="col-md-12">
                            <div class="form-group form-group-default" :class="{ 'has-error': form.errors.has('password')}">
                            <label>Konfirmasi Password</label>
                            <input v-model="form.password_confirmation" type="password" class="form-control" name="password"
                            :class="{ 'is-invalid': form.errors.has('password')}" placeholder="Minimum 6 karakter.">
                            </div>
                            <has-error :form="form" field="password"></has-error>
                        </div>
                    </div>
                    <br>
                    <div class="clearfix"></div>
                    <button class="btn btn-primary" @click.prevent="saveSetting" type="submit">Simpan Pengaturan</button>
                </form>
                </div>
            </div>
            <!-- END card -->
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
                id: 1,
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
            loadProfile() {
                this.$Progress.start();
                axios.get('api/setting')
                .then(({ data }) => {
                    this.$Progress.finish();
                    return this.form.fill(data);
                })
                .catch(() => {
                    this.$Progress.fail();
                });
            },
            saveSetting(){
                this.$Progress.start();

                if(this.form.password == ""){
                    this.form.password = undefined;
                }

                this.form.put('api/setting')
                .then(() => {
                    Swal.fire({
                        title: 'Pengaturan Berhasil Disimpan!',
                        icon : 'success',
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.loadProfile();
                    this.$Progress.finish();
                })
                .catch(() => {
                    this.$Progress.fail();
                    Swal.fire({
                        title: 'Pengaturan Gagal Disimpan!',
                        icon : 'warning',
                        showConfirmButton: false,
                        timer: 1500
                    })
                })
            },
        },
        created(){
            window.scrollTo(0,0);
            $('.modal').modal('hide');
            $('.modal-backdrop').remove();
            this.loadProfile();
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
    }
</script>
