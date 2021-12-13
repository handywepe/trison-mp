/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

// scrollbar
require('jquery.scrollbar');
//floatThead
require('floatthead');
require('select2');
// require('../../public/assets/plugins/select2/js/select2.full.min.js');

// jQuery(document).ready(function(){
//     jQuery('.scrollbar-inner').scrollbar();
// });
import bsCustomFileInput from "./bs-custom-file-input";
$(document).ready(function () {
    bsCustomFileInput.init();
});

window.Vue = require('vue');

import jQuery from 'jquery';
window.$ = window.jQuery = jQuery;

// import 'tooltip.js';
import 'popper.js';

//bootstrap vue
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)

import { LayoutPlugin } from 'bootstrap-vue'
Vue.use(LayoutPlugin)

import { ModalPlugin } from 'bootstrap-vue'
Vue.use(ModalPlugin)

import { FormFilePlugin } from 'bootstrap-vue'
Vue.use(FormFilePlugin)

import { BFormFile } from 'bootstrap-vue'
Vue.component('b-form-file', BFormFile)

import { CardPlugin } from 'bootstrap-vue'
Vue.use(CardPlugin)

import { VBScrollspyPlugin } from 'bootstrap-vue'
Vue.use(VBScrollspyPlugin)

import { DropdownPlugin, TablePlugin } from 'bootstrap-vue'
Vue.use(DropdownPlugin)
Vue.use(TablePlugin)


import moment from "moment";
import 'moment/locale/id';
import {Form, HasError, AlertError} from 'vform';

import SmartTable from 'vuejs-smart-table'
Vue.use(SmartTable);

//jsnice scroll
import niceScroll from 'jquery.nicescroll';
Vue.use(niceScroll);

//select
import Treeselect from '@riophae/vue-treeselect'
Vue.component('treeselect', Treeselect);

// var $th = $('.tableFixHead').find('thead th')
//     $('.tableFixHead').on('scroll', function() {
//     $th.css('transform', 'translateY('+ this.scrollTop +'px)');
//     });

// Gate Auth
import Gate from "./Gate";
Vue.prototype.$gate = new Gate(window.user);

var numeral = require("numeral");

//filter text and date

Vue.filter("rp", function (value) {
    let fil = numeral(value).format("0,0");
    return 'Rp. '+fil;
});

Vue.filter('invalid', function(text){
    return substr(text, 3,-3)
});

Vue.filter('payment', function(text){
    if(text === 0){
        return 'Lunas';
    }else{
        let fil = numeral(text).format("0,0");
        return 'Rp. '+fil;
    }
});

Vue.filter('uptext', function(text){
    return text.charAt(0).toUpperCase() + text.slice(1)
});
Vue.filter('initials', function(init){
    return ((init.shift() || '') + (init.pop() || '')).toUpperCase();
});
Vue.filter('myDate', function(created){
    return moment(created).format('dddd, Do MMMM YYYY, HH:mm');
});
Vue.filter('bulan', function(created){
    return moment(created).format('MMMM YYYY');
});
Vue.filter('dayDate', function(created){
    return moment(created).format('dddd, Do MMMM YYYY');
});
Vue.filter('tanggal', function(created){
    return moment(created).format('dddd, Do MMMM YYYY');
});
Vue.filter('datePayment', function(date){
    return moment(date).format('DD/MM/YYYY');
});
Vue.filter('jam', function(created){
    return moment(created).format('HH:mm');
});
Vue.filter('sejak', function(tmt){
    return moment(tmt).fromNow(true);
});
// Vue.filter('sejak', function(tmt){
//     var start = moment(tmt);
//     var end = moment().startOf('day');
//     var m = Math.round(moment.duration(end - start).asMonths());
//     // var d = Math.round(moment.duration(end - m).asDays());
//     return m ;
// });

window.Fire = new Vue();

//sweetalert2 setting
import Swal from 'sweetalert2'
window.Swal = Swal;

const toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    onOpen: (toast) => {
        toast.addEventListener('mouseenter', swal.stopTimer)
        toast.addEventListener('mouseleave', swal.resumeTimer)
    }
})
window.toast = toast;
window.action = new Vue();

//vform validation
window.Form = Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

//progressbar
import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
    color: '#3490dc',
    failedColor: 'red',
    thickness: '3px',
  })

//VueRouter
import VueRouter from 'vue-router';
Vue.use(VueRouter);

//routing Vue
let routes = [
    { path: '/cek', component: require('./components/ExampleComponent.vue').default },
    { path: '/user', component: require('./components/User.vue').default, meta: {title: 'Table | Trison'} },
    { path: '/category', component: require('./components/Category.vue').default, meta: {title: 'Table | Trison'} },
    { path: '/product', component: require('./components/Product.vue').default, meta: {title: 'Product | Trison'} },
    { path: '/supplier', component: require('./components/Supplier.vue').default, meta: {title: 'Supplier | Trison'} },
    { path: '/customer', component: require('./components/Customer.vue').default, meta: {title: 'Customer | Trison'} },
    { path: '/penjualan', component: require('./components/ProductOut.vue').default, meta: {title: 'Penjualan | Trison'} },
    { path: '/pembelian', component: require('./components/ProductIn.vue').default, meta: {title: 'Pembelian | Trison'} },
    { path: '/project', component: require('./components/Project.vue').default, meta: {title: 'Project Percetakan | Trison'} },
    { path: '/passport', component: require('./components/LaraPassport.vue').default, meta: {title: 'Passport | Trison'} },
    { path: '/catproject', component: require('./components/CatProject.vue').default, meta: {title: 'Kategori Project | Trison'} },
    { path: '/home', component: require('./components/Dashboard.vue').default, meta: {title: 'Home | Trison'} },
    { path: '/setting', component: require('./components/Setting.vue').default, meta: {title: 'Setting | Trison'} },
    { path: '*', component: require('./components/NotFound.vue').default },
    // { path: '*', redirect: '/404' },
]

const router = new VueRouter({
    mode: 'history',
    routes // short for `routes: routes`
  })

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('sidebar', require('./components/Sidebar.vue').default);
Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('not-found', require('./components/NotFound.vue').default);
Vue.component('not-found-page', require('./components/NotFoundPage.vue').default);
Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue').default
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue').default
);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    data:{
        meta : { title : 'test'},
    },
    methods:{

    },
    created(){

    },
    updated(){
        // $(function() {
        //     $("body").getNiceScroll().resize();
        //     $("body").niceScroll();
        // });
    },
    watch: {
        '$route' (to, from) {
          document.title = to.meta.title ;
        }
      },
});
