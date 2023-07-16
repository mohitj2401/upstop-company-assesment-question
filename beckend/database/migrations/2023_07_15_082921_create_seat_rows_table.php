<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSeatRowsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seat_rows', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('coach_id')->unsigned()->index()->nullable();
            $table->foreign('coach_id')->references('id')->on('coaches')->onDelete('cascade');
            $table->enum('row_number', ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']);
            $table->boolean('seat_1_available')->default(1);
            $table->boolean('seat_2_available')->default(1);
            $table->boolean('seat_3_available')->default(1);
            $table->boolean('seat_4_available')->default(1);
            $table->boolean('seat_5_available')->default(1);
            $table->boolean('seat_6_available')->default(1);
            $table->boolean('seat_7_available')->default(1);
            $table->integer('total_available');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seat_rows');
    }
}
