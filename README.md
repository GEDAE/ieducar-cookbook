# i-Educar Cookbook

Esse Cookbook prevê duas funcionalidades:

* Instalar as dependências do projeto i-Educar criando a estrutura de diretório do software.
* Configura a instância do i-Educar, criando o acesso para uma secretaria e customizando o software.

## Requisitos

### Plataformas

- Ubuntu 14.04

### Chef

- Chef 12.0 ou maior

### Cookbooks

- `default` - Instala as dependências e prepara a máquina para rodar o software como base de dados local.
- `instantiate_school` - Configura a instância do i-Educar, usando o Data Bag do Chef Manager.

## Forma de uso

### ieducar::default


Apenas inclua `ieducar` no `run_list` do seu node:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ieducar]"
  ]
}
```

### ieducar::instantiate_school

* Inclua `ieducar` no `run_list` do seu node:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ieducar::instantiate_school]"
  ]
}
```

* Adicione no Data Bag os dados da nova cidade adicionada ao software.

## Licença e Autores

Autores: Rodrigo Sanches Devigo e Leandro Oliveira Magalhães
