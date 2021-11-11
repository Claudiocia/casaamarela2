<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/**
 * Class CreateEixosTable.
 */
class CreateEixosTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('eixos', function(Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('descr')->nullable();
            $table->text('forca')->nullable();
            $table->text('fraqu')->nullable();
            $table->text('oport')->nullable();
            $table->text('ameac')->nullable();
            $table->enum('publica', ['s', 'n'])->default('n');
            $table->unsignedBigInteger('dimension_id');
            $table->foreign('dimension_id')->references('id')->on('dimensions');
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->dateTime('altera')->nullable();
            $table->softDeletes();
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
		Schema::drop('eixos');
	}
}
