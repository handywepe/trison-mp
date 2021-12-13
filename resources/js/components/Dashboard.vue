<template>

<div class="content" style="min-height: 660px;">

    <div class="container-fluid container-fixed-lg">
        <div class="container-fluid p-l-25 p-r-25 p-t-25 p-b-25 sm-padding-10">
        <!-- START ROW -->
        <div class="row">
            <div class="d-flex flex-column" :class="{'col-lg-3 col-sm-6': $gate.isManager() || $gate.isAdmin(), 'col-lg-4 col-sm-12' : !$gate.isManager() && !$gate.isAdmin()}">
                <!-- product -->
                <div class="card no-border widget-loader-bar m-b-10 full-width m-b-10 d-flex flex-1 full-height no-border sm-vh-75">
                    <div class="container-xs-height">
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="progress progress-small m-b-0">
                            <div class="progress-bar progress-bar-primary" style="width:100%"></div>
                        </div>
                        </div>
                    </div>
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="card-header  top-left top-right">
                            <div class="card-title ">
                                <router-link to="/product" style="opacity: 1;" >
                                <span class="font-montserrat fs-12 all-caps">
                                    Produk <i class="fa fa-chevron-right"></i>
                                </span>
                                </router-link>
                            </div>
                            <div class="card-controls">
                            <ul>
                                <li>
                                <a @click="loadProduct()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                    <i class="fas fa-sync-alt"></i>
                                </a>
                                </li>
                            </ul>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="card-body p-t-50">
                        <div class="row" v-if="loadingProduct">
                            <div class="col text-center text-success my-auto">
                                <span aria-hidden="true" class="align-middle spinner-border"></span>
                                <strong>Loading...</strong>
                            </div>
                        </div>
                        <div class="row" v-if="!loadingProduct">
                            <div class="col">
                            <h2> {{ products.jumlah }} </h2>
                            <hr>
                            <template v-if="showprod">
                            <p><b> Product hampir habis</b></p>
                            <p v-for="pr in products.productRemain" :key="pr.id" class="h6 text-primary">&bull;  {{ pr.namaProduct}} - {{ pr.qty}}</p>
                            </template>
                            <p v-if="!showprod"><b>stock product mencukupi</b></p>
                            </div>
                        </div>
                    </div>

                    </div>
                </div>
                <!-- Customer -->
                <div class="card no-border widget-loader-bar m-b-10 full-width m-b-10 d-flex flex-1 full-height no-border sm-vh-75">
                    <div class="container-xs-height full-height">
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="progress progress-small m-b-0">
                            <div class="progress-bar progress-bar-danger" style="width:100%"></div>
                        </div>
                        </div>
                    </div>
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="card-header  top-left top-right">
                            <div class="card-title ">
                                <router-link to="/customer" style="opacity: 1;" >
                                <span class="font-montserrat fs-12 all-caps">
                                    Pelanggan <i class="fa fa-chevron-right"></i>
                                </span>
                                </router-link>
                            </div>
                            <div class="card-controls">
                            <ul>
                                <li>
                                <a @click="loadCustomer()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                    <i class="fas fa-sync-alt"></i>
                                </a>
                                </li>
                            </ul>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="p-l-20 p-t-50 p-b-20 p-r-20">
                            <h3 class="no-margin">{{ customers }}</h3>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
                <!-- supplier -->
                <div class="card no-border widget-loader-bar m-b-10 full-width m-b-10 d-flex flex-1 full-height no-border sm-vh-75">
                    <div class="container-xs-height full-height">
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="progress progress-small m-b-0">
                            <div class="progress-bar progress-bar-info" style="width:100%"></div>
                        </div>
                        </div>
                    </div>
                    </div>
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="card-header  top-left top-right">
                            <div class="card-title ">
                                <router-link to="/supplier" style="opacity: 1;" >
                                <span class="font-montserrat fs-12 all-caps">
                                    Supplier <i class="fa fa-chevron-right"></i>
                                </span>
                                </router-link>
                            </div>
                            <div class="card-controls">
                            <ul>
                                <li>
                                <a @click="loadSupplier()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                    <i class="fas fa-sync-alt"></i>
                                </a>
                                </li>
                            </ul>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="p-l-20 p-t-50 p-b-20 p-r-20">
                            <h3 class="no-margin">{{ suppliers }}</h3>
                        </div>
                        </div>
                    </div>
                </div>
                <!-- user -->
                <!-- <div class="card no-border widget-loader-bar m-b-10">
                    <div class="container-xs-height full-height">
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="card-header  top-left top-right">
                            <div class="card-title ">
                                <span class="font-montserrat fs-12 all-caps">
                                    User <i class="fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="card-controls">
                            <ul>
                                <li>
                                <a @click="loadUser()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                    <i class="fas fa-sync-alt"></i>
                                </a>
                                </li>
                            </ul>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="row-xs-height">
                        <div class="col-xs-height col-top">
                        <div class="p-l-20 p-t-50 p-b-20 p-r-20">
                            <h3 class="no-margin">{{ users }}</h3>
                        </div>
                        </div>
                    </div>
                    <div class="row-xs-height">
                        <div class="col-xs-height col-bottom">
                        <div class="progress progress-small m-b-0">
                            <div class="progress-bar progress-bar-success" style="width:100%"></div>
                        </div>
                        </div>
                    </div>
                    </div>
                </div> -->
            </div>
            <!-- penjualan & pembelian -->
            <div class="col-lg-4 col-sm-6 d-flex flex-column" v-if="$gate.isManager() || $gate.isAdmin()">
                <!-- Penjualan -->
                <div class="card social-card share share-other full-width m-b-10 d-flex flex-1 full-height no-border sm-vh-75">
                    <div class="card-header d-flex justify-content-between">
                        <div>
                            <router-link to="/penjualan" style="opacity: 1;">
                                <h5 class="text-success pull-left fs-14 font-montserrat all-caps">Penjualan Produk  <i class="fa fa-chevron-right"></i></h5>
                            </router-link>
                            <br>
                            <p class='small hint-text no-margin'> {{ month | bulan}}</p>
                        </div>
                        <div>
                            <a @click="loadProductOut()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                <i class="fas fa-sync-alt"></i>
                            </a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <template v-if="loadingPenjualan">
                        <div class="text-center text-success my-auto">
                            <span aria-hidden="true" class="align-middle spinner-border"></span>
                            <strong>Loading...</strong>
                        </div>
                    </template>
                    <template v-if="!loadingPenjualan && penjualan.thisMonth !== 0">
                        <div class="card-description">
                            <h3 class="m-b-0">{{ penjualan.thisMonth | rp}}
                                <span class="" :class="{'text-success': penjualan.thisMonth >= penjualan.monthBefore, 'text-danger': penjualan.thisMonth < penjualan.monthBefore }">
                                    <i class="" :class="{'fa fa-sort-up small text-success': penjualan.thisMonth >= penjualan.monthBefore, 'fa fa-sort-down small text-danger': penjualan.thisMonth < penjualan.monthBefore }"></i>
                                    {{ penjualan.percent }}%
                                </span>
                            </h3>
                            <h5 class="text-primary no-margin">keuntungan : <strong>{{ penjualan.keuntungan | rp}}</strong></h5>
                        </div>
                        <div class="card-footer pt-0">
                            <div class="row">
                                <div class="col pt-0">
                                <hr>
                                    Penjualan produk terbanyak :
                                </div>
                            </div>
                            <div v-for="best in penjualan.bestSales" :key="best.index" class="row p-0">
                                <div class="col-1">
                                    <div class="text-success"><i class="far fa-dot-circle fa-xs"></i></div>
                                </div>
                                <div class="col">
                                    <div class="text-success fs-14">{{ best.namaProduct }} - {{best.sumQty}}</div>
                                </div>
                            </div>
                        </div>
                    </template>
                    <template v-if="!loadingPenjualan && penjualan.thisMonth === 0">
                        <div class="card-description" style="padding-bottom: 12px">
                            <div class="text-center align-items-center text-success my-auto border-dashed">
                                <br>
                                <span class="fas fa-ban fa-3x"></span>
                                <h6 class="text-muted"><b>Belum Ada Penjualan</b></h6>
                            </div>
                        </div>
                    </template>
                </div>
                <!-- Pembelian -->
                <div class="card social-card share share-other full-width m-b-10 d-flex">
                    <div class="card-header d-flex justify-content-between">
                        <div>
                            <router-link to="/barangmasuk" style="opacity: 1;">
                                <h5 class="text-primary pull-left fs-14 font-montserrat all-caps">Pembelian Produk  <i class="fa fa-chevron-right"></i></h5>
                            </router-link>
                            <br>
                            <p class='small hint-text no-margin'> {{ month | bulan}}</p>
                        </div>
                        <div>
                            <a @click="loadProductIn()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                <i class="fas fa-sync-alt"></i>
                            </a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <template v-if="loadingPembelian">
                        <div class="text-center text-primary my-2" style="height: fit-content">
                            <span aria-hidden="true" class="align-middle spinner-border"></span>
                            <strong>Loading...</strong>
                        </div>
                    </template>
                    <template v-if="!loadingPembelian && pembelian.thisMonth === 0">
                        <div class="card-description" style="padding-bottom: 12px">
                            <div class="text-center align-items-center text-primary my-auto border-dashed">
                                <br>
                                <span class="fas fa-ban fa-3x"></span>
                                <h6 class="text-muted"><b>Belum Ada Pembelian</b></h6>
                            </div>
                        </div>
                    </template>
                    <template v-if="!loadingPembelian && pembelian.thisMonth !== 0">
                        <div class="card-description" style="padding-bottom: 12px">
                        <h3 class="m-b-0">{{ pembelian.thisMonth | rp}}
                            <span class="" :class="{'text-success': pembelian.thisMonth >= pembelian.monthBefore, 'text-danger': pembelian.thisMonth < pembelian.monthBefore }">
                                <i class="" :class="{'fa fa-sort-up small text-success': pembelian.thisMonth > pembelian.monthBefore,
                                    'fa fa-sort-down small text-danger': pembelian.thisMonth < pembelian.monthBefore }"></i>
                                {{ pembelian.percent }}%
                            </span>
                        </h3>
                        </div>
                    </template>
                </div>
            </div>
            <!-- proyek terakhir -->
            <template v-if="!$gate.isPramuniaga()">
            <div class="m-b-10 d-flex" :class="{'col-lg-5': $gate.isManager() || $gate.isAdmin(), 'col-lg-8' : !$gate.isManager() && !$gate.isAdmin()}">
                <div class="card no-border no-margin widget-loader-circle todolist-widget pending-projects-widget">
                    <div class="card-header ">
                        <div class="card-title">
                            <router-link to="/project" style="opacity: 1;">
                            <!-- <h5 class="text-primary pull-left fs-14">Pembelian Produk  <i class="fa fa-chevron-right"></i></h5> -->
                            <span class="font-montserrat fs-14 all-caps">
                                Proyek terakhir <i class="fa fa-chevron-right"></i>
                            </span>
                            </router-link>
                        </div>
                        <div class="card-controls">
                            <ul>
                                <li>
                                    <!-- <a  class="card-refresh text-black"  data-toggle="refresh" title="refresh">
                                    <i class="card-icon card-icon-refresh"></i></a> -->
                                    <a @click="loadProject()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                    <i class="fas fa-sync-alt"></i>
                                </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body px-3">
                        <ul class="nav nav-tabs nav-tabs-simple m-b-20" role="tablist" data-init-reponsive-tabs="collapse">
                            <li v-if="$gate.isAdmin() || $gate.isManager()" class="nav-item"><a href="#konsep" class="px-2" :class="{'active': $gate.isAdmin() || $gate.isManager()}" data-toggle="tab" role="tab" aria-expanded="true">Konsep</a>
                            </li>
                            <li v-if="$gate.isAdmin() || $gate.isSales()" class="nav-item"><a href="#penawaran" class="px-2" :class="{'active': $gate.isSales()}" data-toggle="tab" role="tab" aria-expanded="false">Penawaran</a>
                            </li>
                            <li v-if="$gate.isManager()" class="nav-item"><a href="#disetujui" class="px-2" data-toggle="tab" role="tab" aria-expanded="false">Disetujui</a>
                            </li>
                            <li v-if="$gate.isSales() || $gate.isProduksi()" class="nav-item"><a href="#produksi" class="px-2" :class="{'active': $gate.isProduksi()}" data-toggle="tab" role="tab" aria-expanded="true">Produksi</a>
                            </li>
                            <li v-if="$gate.isSales() || $gate.isProduksi() || $gate.isManager()" class="nav-item"><a href="#selesai" class="px-2" data-toggle="tab" role="tab" aria-expanded="false">Selesai</a>
                            </li>
                            <li v-if="$gate.isAdmin() || $gate.isSales() || $gate.isProduksi() || $gate.isManager()" class="nav-item"><a href="#dikirim" class="px-2" data-toggle="tab" role="tab" aria-expanded="false">Dikirim</a>
                            </li>
                            <li v-if="$gate.isAdmin() || $gate.isManager()" class="nav-item"><a href="#piutang" class="px-2" data-toggle="tab" role="tab" aria-expanded="false">Piutang</a>
                            </li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- konsep -->
                            <div class="tab-pane" :class="{'active': $gate.isAdmin() || $gate.isManager()}" id="konsep">
                                <div class="" v-for="op in projects.konsep" :key="op.id">
                                    <div class="d-flex">
                                        <span class="icon-thumbnail bg-success-light pull-left text-master"><i class="fas fa-tasks"></i></span>
                                        <div class="flex-1 full-width overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat small no-margin overflow-ellipsis "> {{ op.namaCustomer }}
                                            </p>
                                            <h5 class="no-margin overflow-ellipsis ">{{ op.nama_project }}</h5>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <router-link to="/project" style="opacity: 1;">
                                    <a class="btn btn-block m-t-30">Lihat semua proyek</a>
                                </router-link>
                            </div>
                            <!-- penawaran -->
                            <div class="tab-pane" :class="{'active': $gate.isSales()}" id="penawaran">
                                <div class="" v-for="pd in projects.penawaran" :key="pd.id">
                                    <div class="d-flex">
                                        <span class="icon-thumbnail bg-master-light pull-left text-master"><i class="fas fa-hourglass-start"></i></span>
                                        <div class="flex-1 full-width overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat  small no-margin overflow-ellipsis "> {{ pd.namaCustomer }}
                                            </p>
                                            <h5 class="no-margin overflow-ellipsis ">{{ pd.nama_project }}</h5>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <router-link to="/project" style="opacity: 1;">
                                    <a class="btn btn-block m-t-30">Lihat semua proyek</a>
                                </router-link>
                            </div>
                            <!-- disetujui -->
                            <div class="tab-pane" id="disetujui">
                                <div class="" v-for="pd in projects.disetujui" :key="pd.id">
                                    <div class="d-flex">
                                        <span class="icon-thumbnail bg-master-light pull-left text-master"><i class="fas fa-hourglass-start"></i></span>
                                        <div class="flex-1 full-width overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat  small no-margin overflow-ellipsis "> {{ pd.namaCustomer }}
                                            </p>
                                            <h5 class="no-margin overflow-ellipsis ">{{ pd.nama_project }}</h5>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <router-link to="/project" style="opacity: 1;">
                                    <a class="btn btn-block m-t-30">Lihat semua proyek</a>
                                </router-link>
                            </div>
                            <!-- produksi -->
                            <div class="tab-pane" :class="{'active': $gate.isProduksi()}" id="produksi">
                                <div class="" v-for="op in projects.produksi" :key="op.id">
                                    <div class="d-flex">
                                        <span class="icon-thumbnail bg-success-light pull-left text-master"><i class="fas fa-tasks"></i></span>
                                        <div class="flex-1 full-width overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat small no-margin overflow-ellipsis "> {{ op.namaCustomer }}
                                            </p>
                                            <h5 class="no-margin overflow-ellipsis ">{{ op.nama_project }}</h5>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <router-link to="/project" style="opacity: 1;">
                                    <a class="btn btn-block m-t-30">Lihat semua proyek</a>
                                </router-link>
                            </div>
                            <!-- selesai -->
                            <div class="tab-pane" id="selesai">
                                <div class="" v-for="op in projects.selesai" :key="op.id">
                                    <div class="d-flex">
                                        <span class="icon-thumbnail bg-success-light pull-left text-master"><i class="fas fa-tasks"></i></span>
                                        <div class="flex-1 full-width overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat small no-margin overflow-ellipsis "> {{ op.namaCustomer }}
                                            </p>
                                            <h5 class="no-margin overflow-ellipsis ">{{ op.nama_project }}</h5>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <router-link to="/project" style="opacity: 1;">
                                    <a class="btn btn-block m-t-30">Lihat semua proyek</a>
                                </router-link>
                            </div>
                            <!-- dikirim -->
                            <div class="tab-pane" id="dikirim">
                                <div class="" v-for="op in projects.dikirim" :key="op.id">
                                    <div class="d-flex">
                                        <span class="icon-thumbnail bg-success-light pull-left text-master"><i class="fas fa-tasks"></i></span>
                                        <div class="flex-1 full-width overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat small no-margin overflow-ellipsis "> {{ op.namaCustomer }}
                                            </p>
                                            <h5 class="no-margin overflow-ellipsis ">{{ op.nama_project }}</h5>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <router-link to="/project" style="opacity: 1;">
                                    <a class="btn btn-block m-t-30">Lihat semua proyek</a>
                                </router-link>
                            </div>


                            <!-- piutang -->
                            <div class="tab-pane" id="piutang">
                                <div class="" v-for="pu in projects.piutang" :key="pu.id">
                                    <div class="d-flex">
                                        <span class="icon-thumbnail bg-warning-light pull-left text-master"><i class="fas fa-dollar-sign"></i></span>
                                        <div class="flex-1 full-width overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat small no-margin overflow-ellipsis "> {{ pu.namaCustomer }}
                                            </p>
                                            <h5 class="no-margin overflow-ellipsis ">{{ pu.nama_project }}</h5>
                                        </div>
                                        <div class="flex-1 overflow-ellipsis">
                                            <p class="hint-text all-caps font-montserrat small no-margin overflow-ellipsis text-right"> Sisa Pembayaran
                                            </p><span>
                                            <h5 class="no-margin overflow-ellipsis text-right">{{ pu.sisa_pembayaran | rp}}</h5>

                                            </span>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <router-link to="/project" style="opacity: 1;">
                                    <a class="btn btn-block m-t-30">Lihat semua proyek</a>
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- END WIDGET -->
            </div>
            </template>
        </div>
        <!-- END ROW -->
        <!-- START ROW -->
        <div class="row">
            <div class="col-12 md-m-b-10">
                <template v-if="$gate.isManager()">
                <div class=" card no-border full-width widget-loader-circle todolist-widget pending-projects-widget">
                    <div class="card-header ">
                        <div class="card-title">
                            <router-link to="/project" style="opacity: 1;">
                                <span class="font-montserrat fs-15 all-caps">
                                   <b>Laporan Proyek</b>
                                </span>
                            </router-link>
                            <p class='hint-text no-margin'> {{ month | bulan}}</p>
                        </div>
                        <div class="card-controls">
                            <ul>
                                <li>
                                    <a @click="loadProject()" class="portlet-refresh text-black"  data-toggle="refresh" title="refresh">
                                    <i class="fas fa-sync-alt"></i>
                                </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body ">
                        <div class="row ">
                            <div class="col d-flex mb-3">
                                <span class="icon-thumbnail bg-master-light pull-left text-master"><i class="fas fa-file-invoice-dollar"></i></span>
                                <div class="flex-1 full-width overflow-ellipsis">
                                    <p class="hint-text all-caps font-montserrat  small no-margin overflow-ellipsis "> Nilai Proyek </p>
                                    <h6 class="no-margin overflow-ellipsis text-muted" v-if="projects.nilai === 0">Belum ada proyek bulan ini</h6>
                                    <h5 class="no-margin overflow-ellipsis" v-if="projects.nilai !== 0">{{ projects.nilai | rp }}</h5>
                                </div>
                            </div>
                            <div class="vl"></div>
                            <div class="col d-flex mb-3">
                                <span class="icon-thumbnail bg-master-light pull-left text-master"><i class="fas fa-coins"></i></span>
                                <div class="flex-1 full-width overflow-ellipsis">
                                    <p class="hint-text all-caps font-montserrat  small no-margin overflow-ellipsis "> Keuntungan Proyek
                                    </p>
                                    <h6 class="no-margin overflow-ellipsis text-muted" v-if="projects.keuntungan === 0">Belum ada proyek bulan ini</h6>
                                    <h5 class="no-margin overflow-ellipsis" v-if="projects.keuntungan !== 0">{{ projects.keuntungan | rp }}</h5>
                                </div>
                            </div>
                            <div class="vl"></div>
                            <div class="col d-flex mb-3">
                                <span class="icon-thumbnail bg-master-light pull-left text-master"><i class="fas fa-money-bill-wave"></i></span>
                                <div class="flex-1 full-width overflow-ellipsis">
                                    <p class="hint-text all-caps font-montserrat  small no-margin overflow-ellipsis "> Piutang hingga bulan ini
                                    </p>
                                    <h6 class="no-margin overflow-ellipsis text-muted" v-if="projects.totalpiutang === 0">Tidak ada piutang</h6>
                                    <h5 class="no-margin overflow-ellipsis " v-if="projects.totalpiutang !== 0">{{ projects.totalpiutang | rp }}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </template>
            <!-- START WIDGET widget_pendingComments.tpl-->
            <!-- END WIDGET -->
            </div>
            <div class="col-lg-8 sm-m-t-10">
            <!-- START WIDGET widget_mapWidget-->
            <!-- END WIDGET -->
            </div>
        </div>
        <!-- END ROW -->
        </div>


    </div>




</div>
</template>

<script>
import Swal from 'sweetalert2';
    export default {
        data(){
            return{
                loadingProduct: true,
                loadingPenjualan: true,
                loadingPembelian: true,
                loadingProyek: true,
                loadingLaporan: true,
                showprod: false,
                suppliers: null,
                customers: null,
                products: {},
                projects: {},
                productQtys: null,
                penjualan: {},
                pembelian: {},
                users: null,
                month: new Date(),
                productOuts: [],
            }
        },
        methods:{
            toggleLoading() {
                this.loading = false;
            },
            loadSupplier(){
                axios.get("api/supplierdb").then(( data ) => (this.suppliers = data.data));
            },
            loadCustomer(){
                axios.get("api/customerdb").then(( data ) => (this.customers = data.data));
            },
            loadProduct(){
                axios.get("api/productdb").then(( data ) => (this.products = data.data));
            },
            loadUser(){
                axios.get("api/userdb").then(( data ) => (this.users = data.data));
            },
            loadProductOut(){
                axios.get("api/productoutdb").then(( data ) => (this.penjualan = data.data));
            },
            loadProductIn(){
                axios.get("api/productindb").then(( data ) => (this.pembelian = data.data));
            },
            loadProject(){
                axios.get("api/projectdb").then(( data ) => (this.projects = data.data));
            },
            toggleLoadProduct(){
                this.loadingProduct = false;
                if (this.products.productRemain.length !== 0){
                    this.showprod = true
                }else{
                    this.showprod = false
                }
            },
            toggleLoadPembelian(){
                this.loadingPembelian = false;
            },
            toggleLoadPenjualan(){
                this.loadingPenjualan = false;
            },
            toggleLoadProject(){
                this.loadingProject = false;
            },
            refresh(){
                this.loadSupplier();
                this.loadCustomer();
                this.loadProduct();
                if (this.$gate.isManager() || this.$gate.isAdmin()) {
                    this.loadProductOut();
                    this.loadProductIn();
                }
                this.loadProject();
            }
        },
        created(){
            window.scrollTo(0,0);
            $('.modal').modal('hide');
            $('.modal-backdrop').remove();
            this.$Progress.start();
            this.loadSupplier();
            this.loadCustomer();
            this.loadProduct();
            // this.loadUser();
            if (this.$gate.isManager() || this.$gate.isAdmin()) {
                this.loadProductOut();
                this.loadProductIn();
            }
            this.loadProject();
            this.$Progress.finish();
        },
        mounted() {
            // console.log('Component mounted.')
            this.interval = setInterval(() => this.refresh(), 120000);

        },
        updated(){
            $(function() {
                // $("body").getNiceScroll().resize();
                //     $("body").niceScroll();
            });

        },
        watch:{
            products : 'toggleLoadProduct',
            penjualan : 'toggleLoadPenjualan',
            pembelian : 'toggleLoadPembelian',
            projects : 'toggleLoadProject',
        },
    }
</script>
<style>
.vl {
  border-left: 2px solid #dee2e6;
  height: 40px;
}
.border-dashed {
    border: 2px dashed #dbdddf;
}
</style>
