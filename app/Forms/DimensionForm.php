<?php

namespace App\Forms;

use Kris\LaravelFormBuilder\Form;

class DimensionForm extends Form
{
    public function buildForm()
    {
        $this
            ->add('name', 'text', [
                'label' => 'Nome',
                'attr' => ['value' => $this->model->name , 'disabled' => 'disabeld']
            ])
            ->add('sigla', 'text', [
                'label' => 'Sigla da Dimensão',
                'attr' => ['value' => $this->model->sigla, 'disabled' => 'disabled']
            ])
            ->add('introd', 'textarea', [
                'lable' => 'Introdução',
                'attr' => ['values' => $this->model->introd, 'class' => 'ckeditor form-control'],
                'rules' => 'required',
            ]);
    }
}
