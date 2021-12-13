<template>
<div class="content" style="min-height: 660px">
    <div v-if="$gate.isSuperAdmin()">
        <div class="jumbotron" data-pages="parallax">
            <div class="container-fluid container-fixed-lg sm-p-l-0 sm-p-r-0">
                <div class="inner">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a >Pages</a></li>
                        <li class="breadcrumb-item active">Laravel Passport</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- START CONTAINER FLUID -->
        <div class="container-fluid container-fixed-lg">
            <div class="row justify-content-center">
                <div class="col">
                    <div>
                        <h1 class="ml-1">Laravel Passport</h1>
                    </div>
                    <passport-clients></passport-clients>
                    <passport-authorized-clients></passport-authorized-clients>
                    <passport-personal-access-tokens></passport-personal-access-tokens>
                </div>
            </div>
        </div>
    </div>
    <div v-if="!$gate.isSuperAdmin()" class="mt-4">
        <not-found-page></not-found-page>
    </div>
</div>
</template>

<script>
    export default {
        mounted() {
            // console.log('Component mounted.')
        }
    }
</script>
