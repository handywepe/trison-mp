<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nama_project');
            $table->integer('customer_id')->unsigned()->nullable();
            $table->integer('cat_project_id')->unsigned()->nullable();
            $table->integer('qty');
            $table->string('satuan');
            $table->string('size')->nullable();
            $table->string('spec')->nullable();
            $table->string('spec_cover')->nullable();
            $table->string('finishing')->nullable();
            $table->string('file')->nullable();
            $table->date('tanggal_masuk')->nullable();
            $table->date('deadline')->nullable();
            $table->date('tanggal_selesai')->nullable();
            $table->date('tanggal_kirim')->nullable();
            $table->integer('harga')->nullable();
            $table->integer('harga_modal')->nullable();
            $table->integer('pembayaran')->nullable();
            $table->integer('sisa_pembayaran')->nullable();
            $table->string('status')->nullable();
            $table->timestamps();

            $table->foreign('customer_id')->references('id')->on('customers')->onDelete('set null');
            $table->foreign('cat_project_id')->references('id')->on('cat_projects')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('projects');
    }
}
