<?php

namespace App\Forms;

use App\Models\Campus;
use App\Models\Curso;
use App\Models\Departamento;
use App\Models\Municipio;
use Kris\LaravelFormBuilder\Form;

class UserForm extends Form
{
    public function buildForm()
    {
        $this
            ->add('tipo', 'choice', [
                'label' => 'Segmento*',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => ['a' => 'Discente', 't' => 'Técnico', 'p' => 'Docente'],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'multiple' => false,
                'expanded' => true,
                'attr' => ['required' => 'required'],
            ])
            ->add('name', 'text', [
                'label' => 'Nome*',
                'attr' => [
                    'class' => 'text_linha',
                    'oninput' => 'handleInput(event)',
                    'required' => 'required',
                ],
            ])
            ->add('email', 'email', [
                'label' => 'E-mail*',
                'attr' => [
                    'class' => 'text_linha',
                    'required' => 'required',
                ],
            ])
            ->add('nome_social', 'text', [
                'label' => 'Nome Social',
                'attr' => [
                    'class' => 'text_linha',
                    'oninput' => 'handleInput(event)',
                ],
            ])
            ->add('genero', 'choice', [
                'label' => 'Identidade de Genero*',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => ['m' => 'Masculino', 'f' => 'Feminino',
                    'nb' => 'Não Binário', 'htg' => 'Homem transgênero',
                    'mtg' => 'Mulher Transgênero', 'hts' => 'Homem Transexual',
                    'mts' => 'Mulher Transexual', 'cis' => 'Cisgênero',
                    'nsr' => 'Não sei responder', 'pnr' => 'Prefiro não responder',
                    'out' => 'Outros',],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                    ],
                'multiple' => false,
                'expanded' => true,
            ])
            ->add('celular', 'text', [
                'label' => 'Celular*',
                'attr' => [
                    'class' => 'text_linha',
                    'required' => 'required',
                    'id' => 'celular',
                ],
            ])
            ->add('matricula', 'text', [
                'label' => 'Matrícula',
                'attr' => [
                    'class' => 'text_linha',
                ],
            ])
            ->add('raca', 'choice', [
                'label' => 'Identidade Racial*',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => ['afd' => 'Afro-Descendente', 'ind' => 'Indigena',
                    'amare' => 'Amarelo', 'ngr' => 'Negro',
                    'brc' => 'Branco', 'prt' => 'Preto',
                    'prd' => 'Pardo', 'nsr' => 'Não sei responder',
                    'pnr' => 'Prefiro não responder', 'out' => 'Outros',],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'multiple' => false,
                'expanded' => true,
            ])
            ->add('municipio_id', 'choice', [
                'label' => 'Municipio de Vinculação Institucional*',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => Municipio::orderBy('nome', 'ASC')->pluck('nome', 'id')->toArray(),
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'attr' => ['class' => 'text_linha'],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
            ])
            ->add('campus_id', 'choice', [
                'label' => 'Campus / Pólo / Centros *',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => Campus::orderBy('nome', 'ASC')->pluck('nome', 'id')->toArray(),
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'attr' => ['class' => 'text_linha'],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
            ])
            ->add('departamento_id', 'choice', [
                'label' => 'Departamento*',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => Departamento::orderBy('nome', 'ASC')->pluck('sigla', 'id')->toArray(),
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'attr' => ['class' => 'text_linha'],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
            ])
            ->add('curso_id', 'choice', [
                'label' => 'Curso',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => Curso::orderBy('nome', 'ASC')->pluck('nome', 'id')->toArray(),
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'attr' => ['class' => 'text_linha'],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
            ])
            ->add('mod_curso', 'choice', [
                'label' => 'Curso Modalidade',
                'label_attr' => ['class' => 'control-label'],
                'choices' => ['pres' => 'Presencial', 'ead' => 'EAD'],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'attr' => ['class' => 'text_linha'],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
            ])
            ->add('tipo_curso', 'choice', [
                'label' => 'Curso Tipo',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => ['bach' => 'Bacharelado', 'tec' => 'Tecnólogo',
                    'lic' => 'Licenciatura', 'pos' => 'Pós-Graduação',],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'attr' => ['class' => 'text_linha'],
                'empty_value' => 'Selecione...',
                'multiple' => false,
                'expanded' => false,
            ])
            ->add('autoriz', 'choice', [
                'label' => 'Autorizo o envio de emails*',
                'label_attr' => ['class' => 'control-label required'],
                'choices' => ['s' => 'Sim', 'n' => 'Não',],
                'choice_options' => [
                    'wrapper' => ['class' => 'choice-wrapper-my'],
                    'label_attr' => ['class' => 'label-class'],
                ],
                'multiple' => false,
                'expanded' => true,
            ])
            ->add('password', 'password', [
                'label' => 'Senha*',
                'attr' => [
                    'class' => 'text_linha',
                    'required' => 'required',
                ],
            ])
            ->add('password_confirmation', 'password', [
                'label' => 'Confirme a senha*',
                'attr' => [
                    'class' => 'text_linha',
                    'required' => 'required',
                ],
            ]);
    }
}
