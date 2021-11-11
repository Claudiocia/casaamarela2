<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\CreatesNewUsers;
use Laravel\Jetstream\Jetstream;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array  $input
     * @return \App\Models\User
     */
    public function create(array $input)
    {
        Validator::make($input, [
            'tipo' => ['required'],
            'celular'=> ['required', 'numeric', 'unique:users'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => $this->passwordRules(),
            'genero' => ['required'],
            'raca' => ['required'],
            'municipio_id' => ['required'],
            'campus_id' => ['required'],
            'departamento_id' => ['required'],
            'curso_id' => $input['tipo'] == 'a' ? ['required'] : [],
            'mod_curso' => $input['tipo'] == 'a' ? ['required'] : [],
            'tipo_curso' => $input['tipo'] == 'a' ? ['required'] : [],
            'autoriz' => ['required'],
        ],
        [
            'tipo.required' => 'Favor selecionar a qual segmento você pertence',
            'genero.required' => 'Favor selecionar a Identidade de Gênero',
            'raca.required' => 'Favor selecionar a Identidade Racial',
            'municipio_id.required' => 'Favor selecionar o seu município',
            'campus_id.required' => 'Favor selecionar o Campus ou Pólo que você atua',
            'matricula.unique' => 'Já existe um cadastro com esta matrícula',
            'departamento_id.required' => 'Favor informar o Departamento',
            'curso_id.required' => 'O nome do curso é obrigatório para o segmento Discente',
            'mod_curso.required' => 'Informe a modalidade do curso',
            'tipo_curso.required' => 'Informe o tipo do seu curso na UNEB',
            'autoriz.required' => 'Você precisa autoriza ou não o envio de email',

        ])->validate();
        $input['password'] = Hash::make($input['password']);
        //dd($input);
        return User::create($input);
    }
}
