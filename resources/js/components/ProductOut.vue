<template>

<div class="content" style="min-height: 660px;">
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
                <img alt="Cover photo" src="assets/img/cover/c6.jpg" style="width: 100%"/>
                </div>
                <div class=" container-fluid   container-fixed-lg sm-p-l-0 sm-p-r-0">
                <div class="inner">
                    <div class="pull-bottom bottom-left m-b-40 sm-p-l-15">
                    <h1 class="text-white no-margin" style="text-shadow: 3px 2px 5px #131313"><span class="semi-bold">Penjualan</span> Produk</h1>
                    </div>
                </div>
                </div>
            </div>
        </div>

    <!-- START CONTAINER FLUID -->
    <div class="container-fluid container-fixed-lg">
        <div class="row jutify-content-center ">
            <div class="col-md-7 col-12 px-4">
                <div class="card card-transparent">
                    <div class="input-group">
                        <select class="custom-select col-4" id="filter" v-model="filters.name.keys[0]" title="Filter By" @change="reset">
                            <option value="namaProduct">Produk</option>
                            <option value="namaCustomer">Pelanggan</option>
                            <option value="tanggal">Tanggal</option>
                        </select>
                        <input v-if="filters.name.keys[0] !== 'tanggal' " type="search" class="form-control" v-model="filters.name.value" placeholder="ketik untuk mencari">
                        <input v-if="filters.name.keys[0] === 'tanggal' " type="date" class="form-control" v-model="filters.date.value.start" title="dari tanggal">
                        <input v-if="filters.name.keys[0] === 'tanggal' " type="date" class="form-control" v-model="filters.date.value.end" title="hinggal tanggal">
                    </div>
                </div>
            </div>
            <div class="col-md-5 col-12 px-4 d-flex pb-2"
                :class="{ 'justify-content-between' : !$gate.isAdmin(), 'justify-content-end' : $gate.isAdmin() }">
                <div class="input-group w-50">
                    <input type="month" class="form-control" v-model="formDate.tanggal" @change="changeMonth()"
                    :class="{ 'is-invalid': form.errors.has('tanggal_masuk')}">
                </div>
                <div v-if="!$gate.isAdmin()">
                    <button class="btn btn-success mr-2" @click="addModal">
                    <i class="fas fa-plus fa-fw"></i>    Penjualan</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid container-fixed-lg bg-white">
        <div class="card card-transparent">
            <div class="card-body" >
                <div class="table-responsive sm-m-b-15">
                    <v-table class="wrap table table-hover tableFixHead text-nowrap" id="table"
                        :data="product_outs"
                        :currentPage.sync="currentPage"
                        :pageSize="pagination"
                        :filters="filters"
                        @totalItemsChanged="totalItem = $event"
                        @totalPagesChanged="totalPages = $event">
                        <thead slot="head" class="bg-white">
                            <tr>
                                <v-th sortKey="namaProduct">Produk</v-th>
                                <v-th sortKey="namaCustomer">Pelanggan</v-th>
                                <v-th sortKey="qty">Jumlah</v-th>
                                <v-th v-if="$gate.isManagerAndAdmin()" sortKey="pemasukan">Pemasukan</v-th>
                                <v-th sortKey="tanggal">Tanggal Penjualan</v-th>
                                <v-th sortKey="updated_at" v-if="!$gate.isAdmin()">Aksi</v-th>
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
                                        <strong>Belum ada Data Penjualan</strong>
                                    </div>
                                </td>
                            </tr>
                            <template v-if="loading === false">
                            <tr v-for="row in displayData" :key="row.id">
                                <td>{{row.namaProduct}}</td>
                                <td>{{row.namaCustomer}}</td>
                                <td>{{row.qty}}</td>
                                <td v-if="$gate.isManagerAndAdmin()">{{row.pemasukan | rp}}</td>
                                <td>{{row.tanggal | dayDate}}</td>
                                <td hidden>{{row.updated_at}}</td>
                                <td style="width: 100px"  v-if="!$gate.isAdmin()">
                                    <div class="btn-group btn-group">
                                        <a @click="editModal(row)" class="btn btn-success" data-toggle="tooltip" data-placement="top"
                                        title="Edit"><i class="fas fa-pen"></i></a>
                                        <a @click="deleteData(row)" class="btn btn-danger" data-toggle="tooltip" data-placement="top"
                                        title="Hapus"><i class="fas fa-trash"></i></a>
                                    </div>
                                </td>
                            </tr>
                            </template>
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


    <!-- Modal Add + Edit-->
    <div class="modal fade" id="formData" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" v-show="!editmode" id="exampleModalCenterTitle">Tambah Data Penjualan</h5>
                    <h5 class="modal-title" v-show="editmode" id="exampleModalCenterTitle">Edit Data Penjualan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent ="editmode ? updateData() : createData()">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Produk</label>
                            <div class="col-sm-10">
                                <treeselect v-if="!editmode"
                                :options="products"
                                placeholder="Pilih produk"
                                v-model="form.product_id"
                                :normalizer="dataProduct"
                                :disabled="false"
                                @input="pilihProduct"
                                />
                                <treeselect v-if="editmode"
                                :options="products"
                                placeholder="Pilih Produk"
                                v-model="form.product_id"
                                :normalizer="dataProduct"
                                :disabled="true"
                                />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Pelanggan</label>
                            <div class="col-sm-10">
                                <treeselect
                                :options="customers"
                                placeholder="Pilih pelanggan"
                                v-model="form.customer_id"
                                :normalizer="dataCustomer"
                                />
                            </div>
                        </div>
                        <div class="form-group row" v-show="!editmode">
                            <label class="col-sm-2 col-form-label">Jumlah</label>
                            <div class="col-sm-10">
                                <input v-model="form.qty" type="number" name="qty" placeholder="Jumlah Produk"
                                @change="pilihProduct" class="form-control" :class="{ 'is-invalid': form.errors.has('qty')}">
                                <has-error :form="form" field="qty"></has-error>
                            </div>
                        </div>
                        <div class="form-group row" v-show="editmode">
                            <label class="col-sm-2 col-form-label">Jumlah</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-2">
                                        <input v-model="form.qty" type="number" name="qty" placeholder="Jumlah Produk"
                                            class="form-control" style="color: black" disabled>
                                    </div>
                                    <div class="col-10">
                                        <input v-model="qtyEdit" type="number" name="qtyEdit" placeholder="Jumlah Produk edit" @input="form.qtyNew = qtyEdit - form.qty"
                                            class="form-control" :class="{ 'is-invalid': form.errors.has('qty')}">
                                    </div>
                                </div>
                                <has-error :form="form" field="qty"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tanggal</label>
                            <div class="col-sm-10">
                                <b-form-datepicker id="datepicker-buttons" v-model="form.tanggal" locale="id" style="font-size: 11px;"
                                    today-button reset-button close-button :class="{ 'is-invalid': form.errors.has('tanggal')}">
                                </b-form-datepicker>
                                <has-error :form="form" field="tanggal"></has-error>
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
<style>
    div.sticky {
        position: -webkit-sticky !important;
        position: sticky !important;
        top: 0 !important;
        z-index: 1 !important;
    }
</style>

<script>
import Swal from 'sweetalert2';
import moment from 'moment';
    export default {
        data(){
            return{
                selectId: null,
                btnload: false,
                qtyEdit: null,
                loading: true,
                loadingImage: true,
                selectedProduct: {},
                customers : [],
                products : [],
                product_outs : [],
                editmode: false,
                currentPage: 1,
                totalPages: 0,
                pagination: 10,
                totalItem: 0,
                filters: {
                    name: { value: '', keys: ['namaProduct'] },
                    date: { value: { start: null,  end: null }, custom: this.dateFilter },
                },
                form: new Form ({
                    id:'',
                    product_id : null,
                    customer_id : null,
                    qty : null,
                    qtyNew : null,
                    tanggal : '',
                }),
                formDate: new Form ({
                    tanggal: '',
                }),
                dataProduct(node) {
                    return {
                        id: node.id,
                        label: node.kategori+' '+node.merek+' '+node.tipe+' (' + node.qty + ')',
                    }
                },
                dataCustomer(node) {
                    return {
                        id: node.id,
                        label: node.nama + ' (' + node.perusahaan + ')',
                    }
                },
            }
        },
        methods:{
            changeMonth(){
                this.loading = true;
                this.formDate.post("api/penjualan/bymonth").then(( data ) => (this.product_outs = data.data));
            },
            dateFilter (filterValue, row) {
                if(this.filters.date.value.start !== null){
                     return row.tanggal >= filterValue.start && row.tanggal <= filterValue.end
                } else{
                    return row;
                }
            },
            pilihProduct(){
                if(this.form.product_id !== this.selectedProduct.id && this.form.product_id !== undefined){
                    axios.get("api/product/"+this.form.product_id).then(( data ) => (this.selectedProduct = data.data));
                }
            },
            toggleLoading() {
                this.loading = false;
            },
            letQty(){
                this.form.qtyNew = this.qtyEdit - this.form.qty;
                    if(this.qtyedit == ""){
                        this.form.qtyNew = undefined;
                    }
            },
            updateData(){
                if((this.form.qty + this.selectedProduct.qty) >= this.qtyEdit){
                    if(this.qtyEdit == ""){
                        this.form.qtyNew = undefined;
                    }
                    if(this.qtyEdit != "" && this.qtyEdit != null ){
                        this.form.qty = this.qtyEdit;
                    }
                    if(this.form.customer_id === undefined){
                        this.form.customer_id = null;
                    }
                    this.$Progress.start();
                    this.btnload = true;
                    this.form.put('api/productout/'+this.form.id)
                    .then(() => {
                        this.changeMonth();
                        $('#formData').modal('hide');
                        this.loadProduct();
                        Swal.fire({
                            icon: 'success',
                            title: 'Updated!',
                            text: 'Data penjualan berhasil diperbarui',
                            showConfirmButton: false,
                            timer: 1500,
                        })
                        this.$Progress.finish();
                    })
                    .catch(() => {
                        this.btnload = false;
                        Swal.fire({
                            icon: 'error',
                            title: 'Gagal!',
                            text: 'Data penjualan gagal diperbarui',
                            showConfirmButton: false,
                            timer: 1500,
                        })
                        this.$Progress.fail();
                    })
                }else{
                    this.btnload = false;
                    Swal.fire({
                            icon: 'error',
                            title: 'Gagal!',
                            text: 'Jumlah Produk tidak mencukupi',
                            showConfirmButton: false,
                            timer: 1500,
                        })
                }
            },
            createData(){
                if(this.form.product_id == undefined){
                    this.btnload = false;
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Harap pilih Produk terlebih dahulu',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                }else if(this.form.qty <= this.selectedProduct.qty){
                    this.$Progress.start();
                    this.btnload = true;
                    this.form.post('api/productout')
                    .then(()=>{
                        this.changeMonth();
                        this.loadProduct();
                        $('#formData').modal('hide')
                        Swal.fire({
                            icon: 'success',
                            title: 'Created!',
                            text: 'Data Penjualan berhasil ditambah',
                            showConfirmButton: false,
                            timer: 1500,
                        })
                        this.$Progress.finish();
                    })
                    .catch(()=>{
                        this.btnload = false;
                        Swal.fire({
                            icon: 'error',
                            title: 'Gagal!',
                            text: 'Data Penjualan gagal ditambah',
                            showConfirmButton: false,
                            timer: 1500,
                        })
                        this.$Progress.fail()
                    })
                }else{
                    this.btnload = false;
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Jumlah Produk tidak mencukupi',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                }
            },
            reset(){
                this.filters.name.value = null;
                this.filters.date.value.start = null;
                this.filters.date.value.end = null ;
            },
            editModal(product_outs){
                this.qtyEdit = null;
                this.form.errors.errors = {};
                this.editmode = true;
                this.btnload = false;
                this.form.reset();
                $('#formData').modal('show');
                this.form.fill(product_outs);
                this.pilihProduct();
            },
            addModal(){
                this.form.errors.errors = {};
                this.editmode = false;
                this.btnload = false;
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
                axios.get("api/productout").then(( data ) => (this.product_outs = data.data));
                this.$Progress.finish();
            },
            loadProduct(){
                this.$Progress.start();
                axios.get("api/product").then(( data ) => (this.products = data.data));
                this.$Progress.finish();
            },
            loadCustomer(){
                this.$Progress.start();
                axios.get("api/customer").then(( data ) => (this.customers = data.data));
                this.$Progress.finish();
            },
            deleteData(product_outs){
                this.form.fill(product_outs);
                Swal.fire({
                    title: 'Anda Yakin?',
                    text: "Data Penjualan yang dihapus tidak dapat dikembalikan!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#e95555',
                    cancelButtonColor: '#2eaeb3',
                    confirmButtonText: 'Ya, Hapus saja!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    //send request to the server
                    this.loadProduct();
                    if (result.value) {
                        this.form.post('api/undoaddout');
                        this.form.delete('api/productout/'+this.form.id).then(()=>{
                            this.changeMonth();
                            this.loadProduct();
                            Swal.fire({
                                icon: 'success',
                                title: 'Dihapus!',
                                text: 'Data penjualan berhasil dihapus.',
                                showConfirmButton: false,
                                timer: 1500,
                            })
                        }).catch(()=>{
                            Swal.fire({
                                icon: 'error',
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
            this.loadData();
            this.loadProduct();
            this.loadCustomer();
            this.formDate.tanggal = moment(new Date()).format('YYYY-MM');
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
            product_outs : 'toggleLoading',
            // 'qtyEdit' (to, from){
            //     this.letQty();
            // },
        },
    }
</script>
