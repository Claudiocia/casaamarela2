<?php

namespace App\Forms;

use App\Models\Dimension;
use Illuminate\Support\Facades\Auth;
use Kris\LaravelFormBuilder\Form;

class EixosForm extends Form
{
    public function buildForm()
    {
        $this

            ->add('user_id', 'hidden', [
                'value' => Auth::user()->id,
            ])
            ->add('altera', 'hidden', [
                'value' => now(),
            ])
            ->add('dimension_id', 'choice', [
                'label' => 'Dimensão',
                'choices' => Dimension::orderBy('name', 'ASC')->pluck('name', 'id')->toArray(),
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'rules' => 'required',
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,

            ])
            ->add('name', 'text', [
                'label' => 'Nome do Eixo',
                'rules' => ['required', 'max:255'],
                'label_attr' => ['class' => 'label-class'],
            ])
            ->add('descr', 'textarea', [
                'label' => 'Descrição',
                'attr' => ['class' => 'ckeditor form-control'],
            ])
            ->add('forca', 'textarea', [
                'label' => 'Forças / Potencialidades',
                'attr' => ['class' => 'ckeditor form-control'],
            ])
            ->add('fraqu', 'textarea', [
                'label' => 'Fraquezas / Fragilidades',
                'attr' => ['class' => 'ckeditor form-control'],
            ])
            ->add('oport', 'textarea', [
                'label' => 'Oportunidades',
                'attr' => ['class' => 'ckeditor form-control'],
            ])
            ->add('ameac', 'textarea', [
                'label' => 'Ameaças',
                'attr' => ['class' => 'ckeditor form-control'],
            ])
            ->add('publica', 'choice', [
                'label' => 'Publica o eixo no programa?',
                'label_attr' => ['class' => 'control-label'],
                'choices' => ['s' => 'Sim', 'n' => 'Não'],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'selected' => $this->model ? [$this->model->publica] : ['n'],
                'multiple' => false,
                'expanded' => true,
            ]);
    }
}
