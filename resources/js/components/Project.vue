<template>

<div class="content" style="min-height: 660px;">
    <div v-if="!$gate.isPramuniaga()">
        <div class="social " data-pages="social">
            <!-- START JUMBOTRON -->
            <div class="jumbotron" data-social="cover" data-pages="parallax" style="height: 200px">
                <div class="cover-photo">
                <img alt="Cover photo" src="assets/img/cover/c9.jpg" style="width: 100%"/>
                </div>
                <div class=" container-fluid container-fixed-lg sm-p-l-0 sm-p-r-0">
                <div class="inner">
                    <div class="pull-bottom bottom-left m-b-40 sm-p-l-15">
                    <h1 class="text-white no-margin" style="text-shadow: 3px 2px 5px #131313"><span class="semi-bold">Proyek</span> Percetakan</h1>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <!-- START CONTAINER FLUID -->
        <div class="container-fluid container-fixed-lg ">
            <div class="row jutify-content-center">
                <div class="col-md-7 col-12 px-4">
                    <div class="card card-transparent">
                        <div class="input-group">
                            <select class="custom-select col-4" id="filter" v-model="filters.name.keys[0]" title="Filter By" @change="reset">
                                <option value="nama_project">Nama Proyek</option>
                                <option value="namaCustomer">Nama Pelanggan</option>
                                <option value="status">Status</option>
                                <option value="sisa_pembayaran">Pembayaran</option>
                            </select>
                            <input v-if="filters.name.keys[0] !== 'status' && filters.name.keys[0] !== 'sisa_pembayaran'" type="search" class="form-control" v-model="filters.name.value" placeholder="ketik untuk mencari">
                            <select v-if="filters.name.keys[0] === 'status'" class="custom-select" id="filter" v-model="filters.name.value" title="Filter By">
                                <option value="" disabled>Pilih status</option>
                                <option value="Konsep">Konsep</option>
                                <option value="Penawaran">Penawaran</option>
                                <option value="Produksi">Produksi</option>
                                <option value="Selesai">Selesai</option>
                                <option value="Dikirim">Dikirim</option>
                            </select>
                            <select v-if="filters.name.keys[0] === 'sisa_pembayaran'" class="custom-select" id="filter" v-model="filters.pay.value" title="Filter By">
                                <option value="" disabled>Pilih status pembayaran</option>
                                <option value="0">Lunas</option>
                                <option value="1">Belum Lunas</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-12 px-4 d-flex pb-2" :class="{'justify-content-between' : $gate.isManager() || $gate.isSales(), 'justify-content-end' : $gate.isProduksi() || $gate.isAdmin() }">
                    <div class="input-group w-50">
                        <input type="month" class="form-control" v-model="formDate.tanggal" @change="changeMonth()"
                        :class="{ 'is-invalid': form.errors.has('tanggal_masuk')}">
                    </div>
                    <div class="float-right">
                        <button class="btn btn-success mr-2" @click="addModal" v-if="$gate.isManager() || $gate.isSales()">
                        <i class="fas fa-plus fa-fw"></i>    Proyek</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-body">
                    <div class="table-responsive sm-m-b-15">
                        <v-table class="wrap table table-hover tableFixHead text-nowrap" id="table"
                            :data="projects"
                            :currentPage.sync="currentPage"
                            :pageSize="pagination"
                            :filters="filters"
                            @totalItemsChanged="totalItem = $event"
                            @totalPagesChanged="totalPages = $event">
                            <thead slot="head" style="bg-white">
                                <tr>
                                    <v-th sortKey="nama_project">Nama Proyek</v-th>
                                    <v-th sortKey="namaCustomer">Pelanggan</v-th>
                                    <v-th sortKey="qty">Jumlah</v-th>
                                    <v-th sortKey="status">Status</v-th>
                                    <v-th v-if="!$gate.isProduksi()" sortKey="harga">Harga</v-th>
                                    <v-th v-if="!$gate.isProduksi()" sortKey="sisa_pembayaran">Sisa Pembayaran</v-th>
                                    <v-th v-if="!$gate.isProduksi()" sortKey="disable">harga satuan</v-th>
                                    <v-th v-if="$gate.isManagerAndAdmin()" sortKey="disable">keuntungan</v-th>
                                    <v-th sortKey="disable" class="bg-white" style="position: -webkit-sticky; position: sticky; right: 0; z-index: 2 !important; linear-gradient(to right, rgba(255,255,255,0), rgba(255,255,255,1))">Aksi</v-th>
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
                                            <strong>Belum ada proyek percetakan</strong>
                                        </div>
                                    </td>
                                </tr>
                                <template v-if="loading === false">
                                    <tr v-for="row in displayData" :key="row.id">
                                        <td>{{row.nama_project}}</td>
                                        <td>{{row.namaCustomer}}</td>
                                        <td>{{row.qty}} {{row.satuan}}</td>
                                        <td>{{row.status}}</td>
                                        <td v-if="!$gate.isProduksi() && row.harga !== null">{{row.harga | rp}}</td>
                                        <td v-if="!$gate.isProduksi() && row.harga == null"> Menunggu </td>
                                        <td v-if="!$gate.isProduksi() && row.sisa_pembayaran !== null">{{row.sisa_pembayaran | payment}}</td>
                                        <td v-if="!$gate.isProduksi() && row.sisa_pembayaran == null"> Menunggu </td>
                                        <td v-if="!$gate.isProduksi() && row.harga !== null">{{row.harga / row.qty}}</td>
                                        <td v-if="!$gate.isProduksi() && row.harga == null"> Menunggu </td>
                                        <td v-if="$gate.isManagerAndAdmin() && row.harga !== null && row.harga_modal !== null">{{row.harga - row.harga_modal}}</td>
                                        <td v-if="$gate.isManagerAndAdmin() && row.harga_modal == null"> Menunggu </td>
                                        <td style="width: 100px; position: -webkit-sticky; position: sticky; right: 0; z-index: 1 !important; background-color: rgba(255, 255, 255, 0.85)">
                                            <div class="btn-group btn-group">
                                                <button @click="docModal(row)" class="btn btn-info" data-toggle="tooltip" data-placement="top"
                                                title="Dokumen"><i class="fas fa-paperclip"></i></button>
                                                <template v-if="$gate.isAdmin() || $gate.isManager()">
                                                    <button @click="payModal(row)" class="btn btn-primary" data-toggle="tooltip" data-placement="top" :disabled="row.harga == null"
                                                    title="Pembayaran"><i class="fas fa-dollar"></i></button>
                                                </template>
                                                <button @click="editModal(row)" class="btn btn-success" data-toggle="tooltip" data-placement="top"
                                                title="Lihat"><i class="fas fa-eye"></i></button>
                                                <template v-if="$gate.isManager() || $gate.isSales()">
                                                    <button @click="deleteData(row.id)" class="btn btn-danger" data-toggle="tooltip" data-placement="top"
                                                    title="Hapus" :disabled="row.status !== 'Konsep' && row.status !== 'Penawaran'"><i class="fas fa-trash"></i></button>
                                                </template>
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
    </div>

    <div v-if="$gate.isPramuniaga()" class="mt-4">
        <not-found-page></not-found-page>
    </div>

    <!-- Modal Add + Edit-->
    <div class="modal fade" id="formData" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" v-show="!editmode" id="exampleModalCenterTitle">Tambah Proyek Baru</h5>
                    <h5 class="modal-title" v-show="editmode" id="exampleModalCenterTitle">Data Proyek : {{ form.nama_project}} ({{form.status }})</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent="editmode ? updateData() : createData()" enctype="multipart/form-data">
                    <div class="modal-body">
                        <p>Informasi Proyek</p>
                        <div class="form-group-attached">
                            <div class="form-group form-group-default required" :class="{ 'has-error': form.errors.has('satuan')}">
                                <label>Nama Proyek</label>
                                <input type="text" class="form-control" name="nama_project" v-model="form.nama_project" :disabled="!$gate.isSales() && !$gate.isManager()"
                                :class="{ 'is-invalid': form.errors.has('nama_project')}">
                                <has-error :form="form" field="nama_project"></has-error>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <div class="form-group form-group-default form-group-default-select2 required" :class="{ 'has-error': form.errors.has('satuan')}">
                                        <label>Nama Pelanggan</label>
                                        <select class="full-width selectsearch" name="customer_id" :class="{ 'is-invalid': form.errors.has('customer_id')}" :disabled="!$gate.isSales() && !$gate.isManager()"
                                        data-placeholder="Pilih Pelanggan" data-init-plugin="select2" v-model="form.customer_id" v-select2>
                                            <option v-for="cus in customers" :key="cus.id" :value="cus.id">{{cus.nama}}</option>
                                        </select>
                                        <has-error :form="form" field="customer_id" style="margin-left: 12px"></has-error>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-group-default form-group-default-select2 required" :class="{ 'has-error': form.errors.has('satuan')}">
                                        <label>Kategori Proyek</label>
                                        <select class="full-width selectsearch" :class="{ 'is-invalid': form.errors.has('cat_project_id')}" :disabled="!$gate.isSales() && !$gate.isManager()"
                                        data-placeholder="Pilih Kategori" data-init-plugin="select2" v-model="form.cat_project_id" v-select2>
                                            <option v-for="cat in catprojects" :key="cat.id" :value="cat.id">{{cat.nama}}</option>
                                        </select>
                                        <has-error :form="form" field="cat_project_id" style="margin-left: 12px"></has-error>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="form-group form-group-default" v-if="form.cat_project_id === 1">
                                    <label>Spesifikasi Cover</label>
                                    <textarea type="text" class="form-control" v-model="form.spec_cover" :disabled="!$gate.isSales() && !$gate.isManager()"
                                    :class="{ 'is-invalid': form.errors.has('spec_cover')}"></textarea>
                                    <has-error :form="form" field="spec_cover"></has-error>
                                </div>
                                <div class="form-group form-group-default">
                                    <label>Spesifikasi</label>
                                    <textarea type="text" class="form-control" v-model="form.spec" :disabled="!$gate.isSales() && !$gate.isManager()"
                                    :class="{ 'is-invalid': form.errors.has('spec')}"></textarea>
                                    <has-error :form="form" field="spec"></has-error>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="form-group form-group-default required" :class="{ 'has-error': form.errors.has('satuan')}">
                                        <label>Jumlah</label>
                                        <input type="text" class="form-control" v-model="form.qty" :disabled="!$gate.isSales() && !$gate.isManager()"
                                        :class="{ 'is-invalid': form.errors.has('qty')}">
                                        <has-error :form="form" field="qty"></has-error>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-group-default form-group-default-select2 required" :class="{ 'has-error': form.errors.has('satuan')}">
                                        <label>Satuan</label>
                                        <select class="full-width selectsearch" :class="{ 'is-invalid': form.errors.has('satuan')}" :disabled="!$gate.isSales() && !$gate.isManager()"
                                        data-placeholder="Pilih Satuan" data-init-plugin="select2" v-model="form.satuan" v-select2>
                                            <option value="rim">RIM</option>
                                            <option value="pcs">Pcs</option>
                                            <option value="box">Box</option>
                                        </select>
                                        <has-error :form="form" field="satuan" style="margin-left: 12px"></has-error>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group form-group-default required" :class="{ 'has-error': form.errors.has('satuan')}">
                                        <label>Ukuran</label>
                                        <input type="text" class="form-control" v-model="form.size" :disabled="!$gate.isSales() && !$gate.isManager()"
                                        :class="{ 'is-invalid': form.errors.has('size')}">
                                        <has-error :form="form" field="size"></has-error>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="form-group form-group-default">
                                    <label>Finishing</label>
                                    <input type="text" class="form-control" v-model="form.finishing" :disabled="!$gate.isSales() && !$gate.isManager()"
                                    :class="{ 'is-invalid': form.errors.has('finishing')}">
                                    <has-error :form="form" field="finishing"></has-error>
                                </div>
                            </div>
                        </div>
                            <template v-if="editmode">
                                <template v-if="!$gate.isProduksi()">
                                    <p class="m-t-10">Harga Proyek</p>
                                    <div class="form-group-attached">
                                        <div class="row clearfix">
                                            <div class="" :class="{ 'col-md-6': $gate.isManagerAndAdmin(), 'col-md-12': $gate.isProduksi() || $gate.isSales() }" >
                                                <div class="form-group form-group-default" :class="{ 'has-error': form.errors.has('harga'), 'required' : $gate.isAdmin(), 'highlight': $gate.isAdmin()}">
                                                    <label>Harga Total</label>
                                                    <input type="number" class="form-control" v-model="form.harga" @input="form.sisa_pembayaran = form.harga - form.pembayaran" :disabled="$gate.isProduksi() || $gate.isSales()"
                                                    placeholder="menunggu" :class="{ 'is-invalid': form.errors.has('harga')}" :required="$gate.isAdmin()">
                                                    <has-error :form="form" field="harga"></has-error>
                                                </div>
                                            </div>
                                            <div class="col-md-6" v-if="$gate.isManagerAndAdmin()">
                                                <div class="form-group form-group-default" :class="{'required' : $gate.isAdmin(), 'highlight': $gate.isAdmin()}">
                                                    <label>Harga Modal</label>
                                                    <input type="number" class="form-control" v-model="form.harga_modal" :disabled="$gate.isProduksi()" :required="$gate.isAdmin()"
                                                    placeholder="menunggu" :class="{ 'is-invalid': form.errors.has('harga_modal')}">
                                                    <has-error :form="form" field="harga_modal"></has-error>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </template>
                                <p class="m-t-10">Status Proyek</p>
                                <div class="form-group-attached">
                                    <div class="row clearfix">
                                        <div class="form-group form-group-default form-group-default-select2 required"
                                            :class="{
                                                'has-error': form.errors.has('satuan'),
                                                'highlight': $gate.isProduksi() || ($gate.isSales() && form.status === 'Penawaran') || ($gate.isSales() && form.status == 'Disetujui')
                                            }">
                                            <label>Status Proyek</label>
                                            <select class="full-width selectsearch" :class="{ 'is-invalid': form.errors.has('status'), 'highlight': ($gate.isProduksi() && form.status !== 'Konsep' && form.status !== 'Penawaran')}"
                                            :disabled="
                                                $gate.isAdmin()
                                                || ($gate.isSales() && form.status == 'Konsep')
                                                || ($gate.isSales() && form.status == 'Produksi')
                                                || ($gate.isSales() && form.status == 'Selesai')
                                                || ($gate.isSales() && form.status == 'Dikirim')
                                            "
                                            data-placeholder="Pilih Status" data-init-plugin="select2" v-model="form.status" v-select2>
                                                <option :disabled="$gate.isSales() || $gate.isProduksi()" value="Konsep">Konsep</option>
                                                <option :disabled="$gate.isProduksi() || form.harga === null || form.harga === ''" value="Penawaran">Penawaran</option>
                                                <option :disabled="$gate.isProduksi() || form.harga === null || form.harga === ''" value="Disetujui">Disetujui</option>
                                                <option :disabled="$gate.isSales() || form.harga === null || form.harga === ''" value="Produksi">Produksi</option>
                                                <option :disabled="$gate.isSales() || form.harga === null || form.harga === ''" value="Selesai">Selesai</option>
                                                <option :disabled="$gate.isSales() || form.harga === null || form.harga === ''" value="Dikirim">Dikirim</option>
                                            </select>
                                            <has-error :form="form" field="status" style="margin-left: 12px"></has-error>
                                        </div>
                                    </div>
                                </div>
                                <p class="m-t-10">Tanggal Proyek</p>
                                <div class="form-group-attached">
                                    <div class="row clearfix">
                                        <div class="col-md-6">
                                            <div class="form-group form-group-default" :class="{ 'has-error': form.errors.has('satuan')}">
                                                <label>Tanggal Order</label>
                                                <input type="date" class="form-control" v-model="form.tanggal_masuk" disabled
                                                :class="{ 'is-invalid': form.errors.has('tanggal_masuk')}">
                                                <has-error :form="form" field="tanggal_masuk"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-group-default">
                                                <label>Estimasi Selesai</label>
                                                <input class="form-control" :type="opsiType()" v-model="form.deadline" :disabled="!$gate.isManager()"
                                                placeholder="menunggu" onfocus="(this.type='date')" :class="{ 'is-invalid': form.errors.has('deadline')}">
                                                <has-error :form="form" field="deadline"></has-error>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-md-6">
                                            <div class="form-group form-group-default" :class="{'highlight': $gate.isProduksi()}">
                                                <label>Tanggal Selesai</label>
                                                <input :type="opsiType1()" class="form-control" v-model="form.tanggal_selesai" :disabled="!$gate.isProduksi() && !$gate.isManager()"
                                                placeholder="menunggu" onfocus="(this.type='date')" :class="{ 'is-invalid': form.errors.has('tanggal_selesai')}">
                                                <has-error :form="form" field="tanggal_selesai"></has-error>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group form-group-default" :class="{'highlight': $gate.isProduksi()}">
                                                <label>Tanggal Kirim</label>
                                                <input :type="opsiType2()" class="form-control" v-model="form.tanggal_kirim" :disabled="!$gate.isProduksi() && !$gate.isManager()"
                                                placeholder="menunggu" onfocus="(this.type='date')" :class="{ 'is-invalid': form.errors.has('tanggal_kirim')}">
                                                <has-error :form="form" field="tanggal_kirim"></has-error>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </template>
                        <br>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                            <template>
                                <button v-if="btnload === true" class="btn btn-success" type="button" disabled>
                                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                    Loading...
                                </button>
                                <button v-show="editmode" v-if="btnload === false" type="submit" class="btn btn-success">Perbarui</button>
                                <button v-show="!editmode" v-if="btnload === false" type="submit" class="btn btn-success">Simpan</button>
                            </template>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal file -->
    <div class="modal fade" id="docModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <!-- style="width: auto" -->
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle"><span class="semi-bold">Dokumen</span> Proyek</h5>{{ form.nama_project }}
                    <button type="button" class="close mr-4" v-show="!formUpload" v-if="!$gate.isProduksi() && !$gate.isAdmin()"
                    @click="add()" data-toggle="tooltip" data-placement="left" title="tambah">
                        <span>&plus;</span>
                    </button>
                    <button type="button" class="close mr-4" v-show="formUpload" v-if="!$gate.isProduksi() && !$gate.isAdmin()"
                    @click="add()" data-toggle="tooltip" data-placement="left" title="cancel">
                        <span>&minus;</span>
                    </button>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                    data-toggle="tooltip" data-placement="bottom" title="close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent="upload()" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="b-table-busy-slot" v-if="loadingDoc === true">
                        <div class="text-center text-success my-2">
                            <span aria-hidden="true" class="align-middle spinner-border my-5"></span>
                            <strong>Loading...</strong>
                        </div>
                    </div>
                    <!-- formUpload -->
                    <template>
                        <div class="form-group-attached mb-2" v-show="formUpload">
                            <div class="form-group form-group-default">
                                <div class="dropbox">
                                <input v-if="input" type="file" name="file" id="file" ref="file" @change="updateFile"
                                        class="input-file">
                                    <p v-if="!file"> Drag your file(s) here to upload<br> or click to browse </p>
                                    <p v-if="file"> {{ file.name }} </p>
                                </div>
                            </div>
                        </div>
                        <div class="form-group-attached mb-2" v-show="formUpload">
                            <div class="form-group form-group-default required" :class="{ 'has-error': form.errors.has('satuan')}">
                                <label>Nama Dokumen</label>
                                <input type="text" class="form-control" name="doc" v-model="namadoc"
                                :class="{ 'is-invalid': form.errors.has('doc')}">
                                <has-error :form="form" field="doc"></has-error>
                            </div>
                        </div>
                    </template>
                    <v-table v-show="!formUpload" v-if="loadingDoc === false" class="wrap table table-hover tableFixHead text-nowrap" id="table"
                        :data="documents">
                        <thead slot="head" style="bg-white">
                            <tr>
                                <v-th sortKey="doc">Nama Document</v-th>
                                <v-th sortKey="disable">Aksi</v-th>
                            </tr>
                        </thead>
                        <tbody slot="body" slot-scope="{displayData}">
                            <tr role="row" class="b-table-busy-slot" v-if="documents.length === 0">
                                <td colspan="2" role="cell" class="">
                                    <div class="text-center text-success my-2">
                                        <strong>Belum ada dokumen proyek</strong>
                                    </div>
                                </td>
                            </tr>
                            <tr v-for="row in displayData" :key="row.id">
                                <td>{{row.doc}}</td>
                                <td hidden>{{row.created_at}}</td>
                                <td style="width: 100px">
                                    <div class="btn-group btn-group">
                                        <a class="btn btn-primary" data-toggle="tooltip" data-placement="top" :href="download(row.doc)"
                                        title="download" download><i class="fas fa-download"></i></a>
                                        <a @click="deleteDoc(row.id)" class="btn btn-danger" v-if="$gate.isSales() || $gate.isManager()"
                                        data-toggle="tooltip" data-placement="top" title="Hapus"><i class="fas fa-trash"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </v-table>

                    <div class="modal-footer" v-show="formUpload">
                        <button type="button" class="btn btn-secondary" @click="add">Batal</button>
                        <button v-if="btnload === true" class="btn btn-success" type="button" disabled>
                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                            Loading...
                        </button>
                        <button v-if="btnload === false" type="submit" class="btn btn-success">Unggah</button>
                        <!-- <button v-if="btnload === false" type="submit" class="btn btn-success" @click="upload">Unggah</button> -->
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Payment -->
    <div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <!-- style="width: auto" -->
                <div class="modal-header">
                    <h5 class="modal-title"><span class="semi-bold">Pembayaran</span> Proyek</h5>{{ form.nama_project }}
                    <button type="button" class="close mr-4" v-show="!inputPay"
                    @click="addPay()" data-toggle="tooltip" data-placement="left" title="tambah">
                        <span>&plus;</span>
                    </button>
                    <button type="button" class="close mr-4" v-show="inputPay"
                    @click="addPay()" data-toggle="tooltip" data-placement="left" title="cancel">
                        <span>&minus;</span>
                    </button>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                    data-toggle="tooltip" data-placement="bottom" title="close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form @submit.prevent="createPay()">
                <div class="modal-body">
                    <!-- inputPay -->
                    <template v-if="inputPay">
                        <div class="row align-items-center mt-2 mb-2">
                            <div class="col p-0">
                                <p class="">Tambah Pembayaran</p>
                            </div>
                            <div class="col p-0 text-right">
                                <button v-if="btnload" class="btn btn-primary" type="button" disabled>
                                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                    Loading...
                                </button>
                                <button v-if="!btnload" class="btn btn-primary" type="submit">Simpan</button>
                                <button class="btn btn-secondary" type="button" @click="addPay()">batal</button>

                            </div>
                        </div>
                        <div class="form-group-attached">
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <div class="form-group form-group-default required" :class="{ 'has-error': formPay.errors.has('pembayaran')}">
                                        <label>Jumlah Pembayaran</label>
                                        <input type="number" class="form-control" v-model="formPay.pembayaran"
                                        :class="{ 'is-invalid': formPay.errors.has('pembayaran')}">
                                        <has-error :form="formPay" field="pembayaran"></has-error>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-group-default required" :class="{ 'has-error': formPay.errors.has('pembayaran')}">
                                        <label>Tanggal Pembayaran</label>
                                        <input type="date" class="form-control" v-model="formPay.tanggal"
                                        :class="{ 'is-invalid': formPay.errors.has('tanggal')}">
                                        <has-error :form="formPay" field="tanggal"></has-error>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </template>
                    <div class="b-table-busy-slot" v-if="loadingPay">
                        <div class="text-center text-success my-2">
                            <span aria-hidden="true" class="align-middle spinner-border my-5"></span>
                            <strong>Loading...</strong>
                        </div>
                    </div>
                    <v-table v-if="!loadingPay" class="wrap table table-hover tableFixHead text-nowrap" id="table" :data="payments">
                        <thead slot="head" style="bg-white">
                            <tr>
                                <v-th sortKey="pembayaran">Jumlah Pembayaran</v-th>
                                <v-th sortKey="tanggal">Tanggal</v-th>
                                <v-th sortKey="disable">Aksi</v-th>
                            </tr>
                        </thead>
                        <tbody slot="body" slot-scope="{displayData}">
                            <tr role="row" class="b-table-busy-slot" v-if="payments.length === 0">
                                <td colspan="3" role="cell" class="">
                                    <div class="text-center text-success my-2">
                                        <strong>Belum ada data pembayaran</strong>
                                    </div>
                                </td>
                            </tr>
                            <tr v-for="row in displayData" :key="row.id">
                                <td>{{row.pembayaran}}</td>
                                <td>{{row.tanggal | datePayment}}</td>
                                <td hidden>{{row.created_at}}</td>
                                <td style="width: 100px">
                                    <div class="btn-group btn-group">
                                        <a  @click="formFill(row), deletePay(row)" class="btn btn-danger" data-toggle="tooltip" data-placement="top"
                                        title="Hapus"><i class="fas fa-trash"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </v-table>
                </div>
                </form>
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
import moment from 'moment';
    export default {
        data(){
            return{
                formUpload: false,
                inputPay: false,
                namadoc: '',
                input: true,
                documents: [],
                payments: [],
                file: '',
                btnload: false,
                loading: true,
                loadingDoc: true,
                loadingPay: true,
                customers : [],
                catprojects : [],
                projects : [],
                editmode: false,
                currentPage: 1,
                totalPages: 0,
                pagination: 10,
                totalItem: 0,
                filters: {
                    name: { value: '', keys: ['nama_project'] },
                    pay: { value: '', custom: this.payFilter },
                },
                formData: new FormData,
                formDoc: new Form ({
                }),
                formDate: new Form ({
                    tanggal: '',
                }),
                formPay: new Form ({
                    id: '',
                    project_id: null,
                    pembayaran: null,
                    tanggal: '',
                }),
                form: new Form ({
                    id:'',
                    nama_project : '',
                    customer_id : null,
                    cat_project_id : null,
                    qty : '',
                    satuan : '',
                    spec_cover : '',
                    spec : '',
                    size : '',
                    finishing : '',
                    tanggal_masuk : '',
                    deadline : '',
                    tanggal_selesai : '',
                    tanggal_kirim : '',
                    harga : '',
                    harga_modal : '',
                    pembayaran : 0,
                    sisa_pembayaran : '',
                    status : '',
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
            opsiType(){
                if (this.form.deadline === null) {
                    return 'text';
                }else{
                    return 'date';
                }
            },
            opsiType1(){
                if (this.form.tanggal_selesai === null) {
                    return 'text';
                }else{
                    return 'date';
                }
            },
            opsiType2(){
                if (this.form.tanggal_kirim === null) {
                    return 'text';
                }else{
                    return 'date';
                }
            },
            changeMonth(){
                this.loading = true;
                this.formDate.post("api/project/bymonth").then(( data ) => (this.projects = data.data));
            },
            payFilter(filterValue, row){
                if(this.filters.pay.value === '0'){
                        return row.sisa_pembayaran == this.filters.pay.value;
                }else if(this.filters.pay.value === '1'){
                        return row.sisa_pembayaran >= this.filters.pay.value;
                }else{
                    return row;
                }
            },
            formFill(row){
                this.formPay.fill(row);
            },
            download(doc){
                 return "projects/"+doc;
            },
            resetUpload(){
                this.namadoc = '';
                this.file = '';
                this.btnload = false;
                this.formUpload = false;
                this.input = false
                this.$nextTick(() => {
                    this.input = true
                })
                this.formData.delete('file');
            },
            add(){
                if(this.formUpload === false){
                    this.formUpload = true;
                }else{
                    this.formUpload = false;
                }
            },
            addPay(){
                if(this.inputPay === false){
                    this.inputPay = true;
                    this.formPay.reset();
                }else{
                    this.formPay.reset();
                    this.inputPay = false;
                }
            },
            updateFile(e){
                this.file = e.target.files[0];
            },
            upload(){
                this.btnload = true;
                this.formData.append('project_id', this.form.id);
                this.formData.append('file', this.file);
                this.formData.append('doc', this.namadoc);
                const config = { headers : { 'Content-Type': 'multipart/form-data'} };
                axios.post('api/document', this.formData, config)
                .then(() => {
                    this.loadDocument();
                    this.resetUpload();
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: 'Document berhasil ditambah',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                })
                .catch(() => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Silahkan isi semua form',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.btnload = false;
                })
            },
            toggleLoading() {
                this.loading = false;
            },
            updateData(){
                this.$Progress.start();
                this.btnload = true;
                this.form.put('api/project/'+this.form.id)
                .then(() => {
                    this.changeMonth();
                    $('#formData').modal('hide');
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: 'Proyek berhasil diupdate',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.$Progress.finish();
                })
                .catch(() => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Proyek gagal diupdate',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.btnload = false;
                    this.$Progress.fail();
                })
            },
            createData(){
                this.$Progress.start();
                this.form.sisa_pembayaran = this.form.harga;
                if (this.form.tanggal_masuk === '') {
                    this.form.tanggal_masuk = moment(new Date()).format('YYYY-MM-DD');
                }
                if (this.form.status === '') {
                    this.form.status = 'Konsep';
                }
                this.btnload = true;
                this.form.post('api/project')
                .then(()=>{
                    this.changeMonth();
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
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Proyek gagal ditambah',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.btnload = false;
                    this.$Progress.fail()
                })
            },
            createPay(){
                this.$Progress.start();
                this.formPay.project_id = this.form.id ;
                this.btnload = true;
                if(this.form.sisa_pembayaran >= this.formPay.pembayaran){
                    this.formPay.post('api/payment')
                    .then(()=>{
                        this.changeMonth();
                        this.loadPayment();
                        $('#formPay').modal('hide')
                        Swal.fire({
                            icon: 'success',
                            title: 'Created!',
                            text: 'Pembayaran berhasil ditambah',
                            showConfirmButton: false,
                            timer: 1500,
                        })
                        this.$Progress.finish();
                        this.btnload = false;
                        this.addPay();
                    })
                    .catch(()=>{
                        Swal.fire({
                            icon: 'error',
                            title: 'Gagal!',
                            text: 'Pembayaran gagal ditambah',
                            showConfirmButton: false,
                            timer: 1500,
                        })
                        this.btnload = false;
                        this.$Progress.fail()
                    })
                }else{
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal!',
                        text: 'Pembayaran melebihi sisa pembayaran',
                        showConfirmButton: false,
                        timer: 1500,
                    })
                    this.btnload = false;
                    this.$Progress.fail()
                }

            },
            reset(){
                this.filters.name.value = '';
                this.filters.pay.value = '';
            },
            docModal(projects){
                this.loadingDoc = true;
                this.resetUpload();
                this.form.reset();
                this.form.fill(projects);
                this.loadDocument();
                $('#docModal').modal('show');
            },
            payModal(projects){
                this.loadingPay = true;
                this.inputPay = false;
                this.btnload = false;
                this.formPay.reset();
                this.form.reset();
                this.form.fill(projects);
                this.loadPayment();
                $('#payModal').modal('show');
            },
            editModal(projects){
                this.form.errors.errors = {};
                this.btnload = false;
                this.editmode = true;
                this.form.reset();
                $('#formData').modal('show');
                this.form.fill(projects);
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
                axios.get("api/project").then(( data ) => (this.projects = data.data));
                this.$Progress.finish();
            },
            loadCustomer(){
                this.$Progress.start();
                axios.get("api/customer").then(( data ) => (this.customers = data.data));
                this.$Progress.finish();
            },
            loadCatProject(){
                this.$Progress.start();
                axios.get("api/catproject").then(( data ) => (this.catprojects = data.data));
                this.$Progress.finish();
            },
            loadDocument(){
                this.$Progress.start();
                this.formData.append('project_id', this.form.id);
                const config = { headers : { 'Content-Type': 'multipart/form-data'} };
                axios.post('api/docproject', this.formData, config).then(( data ) => (this.documents = data.data));
                this.$Progress.finish();
            },
            loadPayment(){
                this.$Progress.start();
                this.form.post('api/payproject').then(( data ) => (this.payments = data.data));
                this.$Progress.finish();
            },
            deleteData(id){
                Swal.fire({
                    title: 'Anda Yakin?',
                    text: "Proyek yang dihapus tidak dapat dikembalikan!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#e95555',
                    cancelButtonColor: '#2eaeb3',
                    confirmButtonText: 'Ya, Hapus saja!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    //send request to the server
                    if (result.value) {
                        this.form.delete('api/project/'+id).then(()=>{
                            this.changeMonth();
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: 'Proyek berhasil dihapus',
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
            deleteDoc(id){
                Swal.fire({
                    title: 'Anda Yakin?',
                    text: "Document yang dihapus tidak dapat dikembalikan!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#e95555',
                    cancelButtonColor: '#2eaeb3',
                    confirmButtonText: 'Ya, Hapus saja!'
                }).then((result) => {
                    //send request to the server
                    if (result.value) {
                        this.form.delete('api/document/'+id).then(()=>{
                            this.loadDocument();
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: 'Proyek berhasil dihapus',
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
            deletePay(row){
                Swal.fire({
                    title: 'Anda Yakin?',
                    text: "Pembayaran yang dihapus tidak dapat dikembalikan!",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#e95555',
                    cancelButtonColor: '#2eaeb3',
                    confirmButtonText: 'Ya, Hapus saja!'
                }).then((result) => {
                    if (result.value){
                        this.formPay.post('api/undoaddpay');
                        this.form.delete('api/payment/'+row.id).then(()=>{
                            this.loadPayment();
                            this.changeMonth();
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: 'Proyek berhasil dihapus',
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
            if (!this.$gate.isPramuniaga()) {
                this.loadData();
                this.loadCustomer();
                this.loadCatProject();
            }
            this.formDate.tanggal = moment(new Date()).format('YYYY-MM');
        },
        mounted() {
            // console.log('Component mounted.')
        },
        updated(){
            $(function() {
                    // $("body").getNiceScroll().resize();
                    // $("body").niceScroll();
                    $('.selectsearch').select2();
                    // $('#inputGroupFile02').on('change',function(){
                    //     //get the file name
                    //     var fileName = $(this).val();
                    //     //replace the "Choose a file" label
                    //     $(this).next('.custom-file-label').html(fileName);
                    // })
            });
            // $(document).ready(function() {
            //     $('.selectsearch').select2();
            // });
        },
        watch:{
            projects : 'toggleLoading',
            'documents' (to, from){
                this.loadingDoc = false;
            },
            'payments' (to, from){
                this.loadingPay = false;
            },
        },
    }
</script>
<style>
.dropbox {
    outline: 2px dashed grey; /* the dash box */
    outline-offset: -10px;
    /* background: lightcyan; */
    color: dimgray;
    padding: 10px 10px;
    height: 150px; /* minimum height */
    position: relative;
    cursor: pointer;
}

.input-file {
    opacity: 0; /* invisible but it's there! */
    width: 100%;
    height: 150px;
    position: absolute;
    cursor: pointer;
}

.dropbox:hover {
    background: #e6e6e6; /* when mouse over to the drop zone, change color */
}

.dropbox p {
    font-size: 1.2em;
    text-align: center;
    padding: 50px 0;
}
.form-control[disabled]{
    color: black;
}
.select2-container--default.select2-container--disabled .select2-selection--single {
    background-color: white;
    cursor: default;
}
.highlight{
    border: 1px solid darkslateblue;
    border-top-color: darkslateblue;
    border-top-style: solid;
    border-top-width: 1px;
    border-right-color: darkslateblue;
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: darkslateblue;
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: darkslateblue;
    border-left-style: solid;
    border-left-width: 1px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
}
</style>
