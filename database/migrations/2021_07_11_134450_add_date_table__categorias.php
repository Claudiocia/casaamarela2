<?php

use App\Models\Categoria;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDateTableCategorias extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $categorias[] = array(
            array('nome' => 'Educação Superior'),
            array('nome' => 'Educação do Campo'),
            array('nome' => 'Formação de Professores'),
            array('nome' => 'Cursos EAD'),
            array('nome' => 'Pós-Graduação'),
            array('nome' => 'Valorização dos Técnicos'),
            array('nome' => 'Qualificação de mão-de-obra'),
            array('nome' => 'Graduação'),
        );
        foreach ($categorias as $categoria){
            DB::table('categorias')->insert($categoria);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        $categories = Categoria::all();
        foreach ($categories as $category){
            DB::table('categorias')->delete($category);
        }
    }
}
