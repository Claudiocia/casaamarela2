<?php

namespace App\Forms;

use App\Models\Categoria;
use App\Models\User;
use Kris\LaravelFormBuilder\Form;

class PostForm extends Form
{
    public function buildForm()
    {
        if($this->model){
            $tagis = [];
            foreach ($this->model->tags as $tag){
                array_push($tagis, $tag->nome);
            }
            $tagos = implode(', ', $tagis);
        }
        $this
            ->add('categoria_id', 'choice', [
                'label' => 'Categoria*',
                'label_attr' => ['class' => 'control-label required label-artigo'],
                'choices' => Categoria::orderBy('nome', 'ASC')->pluck('nome', 'id')->toArray(),
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
                'attr' => ['required' => 'required'],
            ])
            ->add('user_id', 'choice', [
                'label' => 'Autor do artigo',
                'label_attr' => ['class' => 'controle-label required label-artigo'],
                'choices' => User::orderBy('name', 'ASC')->pluck('name', 'id')->toArray(),
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
                'attr' => ['required' => 'required'],

            ])
            ->add('titulo', 'text', [
                'label' => 'Título*',
                'label_attr' => ['class' => 'control-label required label-artigo'],
                'rules' => ['required', 'string', 'max:255'],
            ])
            ->add('data', 'hidden',[
                'value' => now(),
            ])
            ->add('resumo', 'text', [
                'label' => 'Resumo do texto*',
                'label_attr' => ['class' => 'control-label required label-artigo'],
                'rules' => [ 'required', 'max:255'],
            ])
            ->add('texto', 'textarea', [
                'label' => 'Texto do Artigo*',
                'label_attr' => ['class' => 'control-label required label-artigo'],
                'attr' => ['class' => 'ckeditor form-control'],
            ])
            ->add('publica', 'choice', [
                'label' => 'Publica?*',
                'label_attr' => ['class' => 'control-label required label-artigo'],
                'choices' => ['s' => 'Publica', 'n' => 'Aguarda'],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'multiple' => false,
                'expanded' => true,
                'selected' => $this->model ? $this->model->publica : 'n',
                'attr' => ['required' => 'required'],
            ])
            ->add('tags', 'text', [
                'label' => 'Tags (informe palavras ou termos de referência para o texto, separadas por vírgulas)',
                'label_attr' => ['class' => 'label-artigo'],
                'value' => !$this->model ? '' : $tagos,
            ]);
    }
}
