<template>
<div>
    <!-- BEGIN SIDEBAR MENU HEADER-->
    <div class="sidebar-header">
        <img src="images/logo-tmp-white.png" alt="logo" class="brand" data-src="images/logo-tmp-white.png" data-src-retina="images/logo-tmp-white.png" height="30">
    </div>
    <!-- END SIDEBAR MENU HEADER-->
    <!-- START SIDEBAR MENU -->
    <div class="sidebar-menu">
        <!-- BEGIN SIDEBAR MENU ITEMS-->
        <ul class="menu-items">
            <li class="m-t-30">
                <router-link to="/home">
                    <span class="title">Dashboard</span>
                </router-link>
                <span class="bg-transparent icon-thumbnail"><i class="pg-home"></i></span>
            </li>
            <li class="" v-if="!$gate.isProduksi()">
                <router-link to="/penjualan">
                    Penjualan
                </router-link>
                <span class="bg-transparent icon-thumbnail"><i class="fas fa-dollar"></i></span>
            </li>
            <!-- {{-- @can('isManager') --}} -->
            <li class="" v-if="$gate.isManagerAndAdmin()">
                <router-link to="/pembelian">
                    Pembelian
                </router-link>
                <span class="bg-transparent icon-thumbnail"><i class="pg-inbox"></i></span>
            </li>
            <!-- {{-- @endcan --}} -->
            <li class="">
                <router-link to="/product">
                    Produk
                </router-link>
                <span class="bg-transparent icon-thumbnail"><i class="fas fa-dolly"></i></span>
            </li>
            <li class="" v-if="!$gate.isPramuniaga()">
                <router-link to="/project">
                    Proyek Percetakan
                </router-link>
                <span class="bg-transparent icon-thumbnail"><i class="fas fa-history"></i></span>
            </li>
            <li>
                <a><span class="title">Data Master</span>
                <span class=" arrow"></span></a>
                <span class="bg-transparent icon-thumbnail"><i class="pg-note"></i></span>
                <ul class="sub-menu">
                    <li class="" v-if="$gate.isAdmin() || $gate.isManager()">
                        <router-link to="/category">
                        Kategori Produk
                        </router-link>
                        <span class="bg-transparent icon-thumbnail">Kp</span>
                    </li>
                    <li class="" v-if="$gate.isSales() || $gate.isManager()">
                        <router-link to="/catproject">
                        Kategori Proyek
                        </router-link>
                        <span class="bg-transparent icon-thumbnail">Kp</span>
                    </li>
                    <li class="">
                        <router-link to="/supplier">
                        Supplier
                        </router-link>
                        <span class="bg-transparent icon-thumbnail">Sp</span>
                    </li>
                    <li class="">
                        <router-link to="/customer">
                        Pelanggan
                        </router-link>
                        <span class="bg-transparent icon-thumbnail">Pl</span>
                    </li>

                </ul>
            </li>
            <!-- @can('isPramuniaga')
            <li class="">
                <router-link to="/customer">
                    Pelanggan
                </router-link>
                <span class="bg-transparent icon-thumbnail">Pl</span>
            </li>
            @endcan -->
            <li class="" v-if="$gate.isManager()">
                <router-link to="/user" class="detailed">
                    <span class="title" style="line-height: 20px;">Manajemen</span>
                    <span class="details">Pengguna</span>
                </router-link>
                <span class="bg-transparent icon-thumbnail"><i class="fas fa-user"></i></span>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>
</div>

</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
