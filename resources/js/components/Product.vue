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
            <img alt="Cover photo" src="assets/img/cover/c3.jpg" style="width: 100%"/>
            </div>
            <div class=" container-fluid container-fixed-lg sm-p-l-0 sm-p-r-0">
            <div class="inner">
                <div class="pull-bottom bottom-left m-b-40 sm-p-l-15">
                <h1 class="text-white no-margin" style="text-shadow: 3px 2px 5px #131313"><span class="semi-bold">Produk</span></h1>
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
                            <option value="namaProduct">Produk</option>
                            <option value="kategori">Kategori</option>
                            <option value="qty">Jumlah</option>
                            <option value="harga">Harga</option>
                            <option v-if="$gate.isManagerAndAdmin()" value="harga_modal">Harga Modal</option>
                        </select>
                        <input v-if="filters.name.keys[0] !== 'qty'" type="search" class="form-control" v-model="filters.name.value" placeholder="ketik untuk mencari">
                        <input v-if="filters.name.keys[0] === 'qty'" type="number" class="form-control" v-model="filters.qty.value" placeholder="input barang kurang dari">
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-12 px-4" v-if="$gate.isManagerAndAdmin()">
                <div class="float-right">
                    <button class="btn btn-success mr-2" @click="addModal">
                    <i class="fas fa-plus fa-fw"></i>    Produk</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid container-fixed-lg bg-white">
        <div class="card card-transparent">
            <div class="card-body">
                <div class="table-responsive sm-m-b-15">
                    <v-table class="wrap table table-hover tableFixHead text-nowrap" id="table"
                        :data="products"
                        :currentPage.sync="currentPage"
                        :pageSize="pagination"
                        :filters="filters"
                        @totalItemsChanged="totalItem = $event"
                        @totalPagesChanged="totalPages = $event">
                        <thead slot="head" style="bg-white">
                            <tr>
                                <v-th sortKey="kategori">Kategori</v-th>
                                <v-th sortKey="kategori">Produk</v-th>
                                <v-th sortKey="qty">Jumlah</v-th>
                                <v-th sortKey="harga">Harga Jual</v-th>
                                <v-th v-if="$gate.isManagerAndAdmin()" sortKey="harga_modal">Harga Modal</v-th>
                                <v-th sortKey="keterangan">Keterangan</v-th>
                                <v-th sortKey="created_at" defaultSort="desc">Aksi</v-th>
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
                                        <strong>Produk tidak ditemukan</strong>
                                    </div>
                                </td>
                            </tr>
                            <tr v-for="row in displayData" :key="row.id">
                                <td>{{row.kategori}}</td>
                                <td>{{row.namaProduct}}</td>
                                <td>{{row.qty}}</td>
                                <td>{{row.harga}}</td>
                                <td v-if="$gate.isManagerAndAdmin()">{{row.harga_modal}}</td>
                                <td>{{row.keterangan}}</td>
                                <td hidden>{{row.updated_at}}</td>
                                <td style="width: 100px">
                                    <div class="btn-group btn-group">
                                        <a @click="imageModal(row)" class="btn btn-primary" data-toggle="tooltip" data-placement="top"
                                        title="Lihat Foto"><i class="fas fa-camera"></i></a>
                                    <template v-if="$gate.isManagerAndAdmin()">
                                        <a @click="editModal(row)" class="btn btn-success" data-toggle="tooltip" data-placement="top"
                                        title="Edit"><i class="fas fa-pen"></i></a>

                                        <a @click="deleteData(row.id)" class="btn btn-danger" data-toggle="tooltip" data-placement="top"
                                        title="Hapus"><i class="fas fa-trash"></i></a>
                                    </template>
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

    <!-- Modal Add + Edit-->
    <div class="modal fade" id="formData" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" v-show="!editmode" id="exampleModalCenterTitle">Tambah Produk Baru</h5>
                    <h5 class="modal-title" v-show="editmode" id="exampleModalCenterTitle">Edit Produk</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent ="editmode ? updateData() : createData()">
                    <div class="modal-body">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Kategori</label>
                            <div class="col-sm-10">
                                <select class="full-width selectsearch" name="customer_id" :class="{ 'is-invalid': form.errors.has('category_id')}"
                                    data-placeholder="Pilih Kategori" data-init-plugin="select2" v-model="form.category_id" v-select2>
                                    <option v-for="cat in categories" :key="cat.id" :value="cat.id">{{cat.nama}}</option>
                                </select>
                                <has-error :form="form" field="category_id"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Merek</label>
                            <div class="col-sm-10">
                                <input v-model="form.merek" type="text" name="merek" placeholder="Nama Produk"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('merek')}">
                                <has-error :form="form" field="merek"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tipe</label>
                            <div class="col-sm-10">
                                <input v-model="form.tipe" type="text" name="tipe" placeholder="Nama Produk"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('tipe')}">
                                <has-error :form="form" field="tipe"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Keterangan</label>
                            <div class="col-sm-10">
                                <input v-model="form.keterangan" type="text" name="keterangan" placeholder="Keterangan Produk"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('keterangan')}">
                                <has-error :form="form" field="keterangan"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Harga Jual</label>
                            <div class="col-sm-10">
                                <input v-model="form.harga" type="number" name="harga" placeholder="Harga Produk"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('harga')}">
                                <has-error :form="form" field="harga"></has-error>
                            </div>
                        </div>
                        <div class="form-group row" v-if="$gate.isManagerAndAdmin()">
                            <label class="col-sm-2 col-form-label">Harga Modal</label>
                            <div class="col-sm-10">
                                <input  v-model="form.harga_modal" type="number" name="harga_modal" placeholder="Harga Modal Produk"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('harga_modal')}">
                                <has-error :form="form" field="harga_modal"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Jumlah</label>
                            <div class="col-sm-10">
                                <input v-model="form.qty" type="number" name="qty" placeholder="Jumlah Produk"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('qty')}">
                                <has-error :form="form" field="qty"></has-error>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Foto</label>
                            <div class="col-sm-10">
                                <div class="dropbox-image">
                                <input v-if="input" type="file" name="file" id="image" ref="image" @change="updateImage"
                                     class="input-file-image" accept="image/*">
                                    <p v-if="!image"> Drag your file here or click to browse </p>
                                    <p v-if="image"> {{ image.name }} </p>
                                </div>
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

    <!-- Modal image -->
    <div class="modal fade" id="formImage" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="width: auto;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Foto Produk</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <div class="modal-body">
                        <div class="b-table-busy-slot" v-if="loadingImage === true">
                            <div class="text-center text-success my-2">
                                <span aria-hidden="true" class="align-middle spinner-border"></span>
                                <strong>Loading...</strong>
                            </div>
                        </div>
                        <div v-if="loadingImage === false" >
                            <img alt="image" :src="getImage()" class=" " style="max-height: 700px; max-width: 600px">
                        </div>
                    </div>
            </div>
        </div>
    </div>

</div>
</template>

<script>
Vue.directive('select2', {
    inserted(el) {
        $(el).on('select2:select', () => {
            const event = new Event('change', { bubbles: true, cancelable: true });
            el.dispatchEvent(event);
        });

        $(el).on('select2:unselect', () => {
            const event = new Event('change', {bubbles: true, cancelable: true})
            el.dispatchEvent(event)
        })
    },
});
import Swal from 'sweetalert2';
    export default {
        data(){
            return{
                test: '',
                image: null,
                input: true,
                btnload: false,
                loading: true,
                loadingImage: true,
                categories : [],
                products : [],
                editmode: false,
                currentPage: 1,
                totalPages: 0,
                pagination: 10,
                totalItem: 0,
                filters: {
                    name: { value: '', keys: ['namaProduct'] },
                    qty: { value: '', custom: this.qtyFilter },
                },
                form: new Form ({
                    id:'',
                    merek : '',
                    tipe : '',
                    category_id : null,
                    harga : '',
                    harga_modal : '',
                    qty : '',
                    image : null,
                    keterangan : '',
                }),
                dataCategory(node) {
                    return {
                        id: node.id,
                        label: node.nama,
                    }
                },
            }
        },
        methods:{
            qtyFilter(filterValue, row){
                if(this.filters.qty.value === ''){
                    return row;
                }else{
                    return row.qty <= this.filters.qty.value;
                }
            },
            getImage(){
                let imageProduct = this.form.image;
                return "images/product/"+imageProduct;
            },
            updateImage(e){
                //console.log('Uploading')
                let file = e.target.files[0];
                this.image = file;
                // console.log(file);
                let reader = new FileReader();
                if(file['type'] === 'image/jpeg' || file['type'] === 'image/png' ||
                    file['type'] === 'image/gif' || file['type'] === 'image/bmp') {
                    reader.onloadend = (file) =>{
                        //console.log('RESULT', reader.result)
                        this.form.image = reader.result;
                    }
                    reader.readAsDataURL(file);
                }else{
                    this.image = '';
                    this.input = false;
                    this.$nextTick(() => {
                        this.input = true;
                    })
                    Swal.fire(
                        'Oopss..',
                        'Tipe file harus jpg, png, gif, atau bmp',
                        'error'
                    )
                }
            },
            // formatNames(files) {
            //     return files.length === 1 ? files[0].name : `${files.length} files selected`
            // },
            toggleLoading() {
                this.loading = false;
            },
            updateData(){
                this.$Progress.start();
                this.btnload = true;
                this.form.put('api/product/'+this.form.id)
                .then(() => {
                    this.loadData();
                    $('#formData').modal('hide');
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: 'Produk berhasil diupdate',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.finish();
                })
                .catch(() => {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Gagal!',
                        text: 'Produk gagal diupdate',
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
                this.form.post('api/product')
                .then(()=>{
                    this.loadData();
                    $('#formData').modal('hide')
                    Swal.fire({
                        icon: 'success',
                        title: 'Created!',
                        text: 'User berhasil dibuat',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.finish();
                })
                .catch(()=>{
                    Swal.fire({
                        icon: 'warning',
                        title: 'Gagal!',
                        text: 'Produk gagal ditambah',
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
            imageModal(products){
                this.image = null;
                this.btnload = false;
                this.form.reset();
                this.form.fill(products);
                this.getImage();
                $('#formImage').modal('show');
            },
            editModal(products){
                this.image = null;
                this.form.errors.errors = {};
                this.btnload = false;
                this.editmode = true;
                this.form.reset();
                $('#formData').modal('show');
                this.form.fill(products);
            },
            addModal(){
                this.image = null;
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
                axios.get("api/product").then(( data ) => (this.products = data.data));
                this.$Progress.finish();
            },
            loadCategory(){
                this.$Progress.start();
                axios.get("api/category").then(( data ) => (this.categories = data.data));
                this.$Progress.finish();
            },
            deleteData(id){
                Swal.fire({
                    title: 'Anda Yakin?',
                    text: "Produk yang dihapus tidak dapat dikembalikan!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#e95555',
                    cancelButtonColor: '#2eaeb3',
                    confirmButtonText: 'Ya, Hapus saja!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    //send request to the server
                    if (result.value) {
                        this.form.delete('api/product/'+id).then(()=>{
                            this.loadData();
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: 'Produk berhasil dihapus',
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
            this.loadData();
            this.loadCategory();
        },
        mounted() {
            // console.log('Component mounted.')
        },
        updated(){
            // this.getImage();
            $(function() {
                // $("body").getNiceScroll().resize();
                // $("body").niceScroll();
                $('.selectsearch').select2();
            });
        },
        watch:{
            products : 'toggleLoading',
            'form.image' (to, from){
                this.loadingImage = false;
            },
        },
    }
</script>
<style>
.dropbox-image {
    outline: 2px dashed grey; /* the dash box */
    outline-offset: -10px;
    /* background: lightcyan; */
    color: dimgray;
    padding: 10px 10px;
    height: 50px; /* minimum height */
    position: relative;
    cursor: pointer;
    border: 1px solid rgba(0, 0, 0, 0.07);
}

.input-file-image {
    opacity: 0; /* invisible but it's there! */
    width: 100%;
    height: 50px;
    position: absolute;
    cursor: pointer;
}

.dropbox-image:hover {
    background: #e6e6e6; /* when mouse over to the drop zone, change color */
}

.dropbox-image p {
    font-size: 11pt;
    text-align: center;
}
</style>
