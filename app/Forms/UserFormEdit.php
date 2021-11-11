<?php

namespace App\Forms;

use App\Models\Campus;
use App\Models\Curso;
use App\Models\Departamento;
use App\Models\Municipio;
use Kris\LaravelFormBuilder\Form;

class UserFormEdit extends Form
{
    public function buildForm()
    {
        $this
            ->add('id', 'hidden', [
                'attr' => ['value' => $this->model->id]
            ])
            ->add('name', 'text', [
                'label' => 'Nome',
                'value' => $this->model->name,
                'attr' => ['disabled' => 'disabled']
            ])
            ->add('role', 'choice', [
                'label' => 'Função no sistema',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => ['2' => 'Staff', '3' => 'Redator do Programa', '4' => 'Usuário Cadastrado'],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'multiple' => false,
                'expanded' => true,
                'selected' => $this->model->role == 1 ? 2 : $this->model->role,
            ]);
    }
}
