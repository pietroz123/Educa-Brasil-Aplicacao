<%-- 
    Document   : escolas
    Created on : 13/05/2019, 10:03:21
    Author     : pietr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Educa Brasil - Página Principal</title>

    <!-- Ícone Principal -->
    <link rel="shortcut icon" href="img/icones/Books.png" type="image/x-icon">

    <!-- CSS -->
    <link rel="stylesheet" href="lib/mdbootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="lib/mdbootstrap/css/mdb.css">
    <link rel="stylesheet" href="css/educa_brasil.css">
    <link rel="stylesheet" href="css/design-responsivo.css">
    <link rel="stylesheet" href="css/fontes.css">
    <link rel="stylesheet" href="lib/select2/css/select2.min.css">
    <link rel="stylesheet" href="lib/mdbootstrap/css/datatables.css">

    <!-- Icones -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

</head>

<body>

    <!-- Barra de Navegação -->
    <nav class="navbar navbar-expand-md navbar-light fixed-top center" id="barra-navegacao">

        <div class="container">

            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">
                    <div class="d-flex flex-row align-items-center">
                        <img src="img/icones/Books.png" alt="Icone do Site" class="icone-header mr-1">
                        <strong>Educa Brasil</strong>
                    </div>
                </a>
            </div>

            <button class="navbar-toggler">
                <span class="navbar-toggler-icon" data-toggle="collapse" data-target="#navbarMenu"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarMenu">

                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp#sobre">Sobre</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="escolas.jsp">Escolas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="estatisticas.jsp">Estátísticas</a>
                    </li>

                </ul>

            </div>

        </div>

    </nav>

    <!-- Header -->
    <header id="header-principal">

        <!-- Barra de Navegação de Busca -->
        <section id="busca">

            <div class="container">
                <ul class="list-inline navbar-busca">
                    <li class="list-inline-item">Buscar</li>
                    <li class="list-inline-item">
                        <select name="select-estado" id="select-estado">
                            <option></option>
                            <option value="SP">São Paulo</option>
                            <option value="GO">Goiás</option>
                            <option value="RJ">Rio de Janeiro</option>
                        </select>
                    </li>
                    <li class="list-inline-item">
                        <select name="select-municipio" id="select-municipio">
                            <option></option>
                            <option value="Sorocaba">Sorocaba</option>
                        </select>
                    </li>
                    <li class="list-inline-item">
                        <select name="select-escola" id="select-escola">
                            <option></option>
                            <option value="7193282">Colégio Uirapuru</option>
                            <option value="1830923">Colégio Objetivo</option>
                        </select>
                    </li>
                </ul>
            </div>

        </section>

        <section id="secao-filtros">

            <div class="container">

                <ul class="filtros d-flex flex-row">

                    <li class="filtro">
                        <form action="" class="form-filtro">
                            <button type="button" class="btn-filtro">
                                <span class="filtro-nome">Situação de Funcionamento</span>
                                <li-icon>
                                    <i class="fas fa-caret-down fa-lg"></i>
                                </li-icon>
                            </button>
                            <div class="filtros-dropdown closed">
                                <fieldset>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="em-atividade">
                                        <label class="custom-control-label" for="em-atividade">Em Atividade</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="paralisada">
                                        <label class="custom-control-label" for="paralisada">Paralisada</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="extinta">
                                        <label class="custom-control-label" for="extinta">Extinta</label>
                                    </div>
                                    <div class="filtros-botoes">
                                        <button class="filtros-btn-cancelar">Cancelar</button>
                                        <button class="filtros-btn-aplicar">Aplicar</button>
                                    </div>
                                </fieldset>
                            </div>
                        </form>
                    </li>

                    <li class="filtro">
                        <form action="" class="form-filtro">
                            <button type="button" class="btn-filtro">
                                <span class="filtro-nome">Dependência Administrativa</span>
                                <li-icon>
                                    <i class="fas fa-caret-down fa-lg"></i>
                                </li-icon>
                            </button>
                            <div class="filtros-dropdown closed">
                                <fieldset>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="federal">
                                        <label class="custom-control-label" for="federal">Federal</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="estadual">
                                        <label class="custom-control-label" for="estadual">Estadual</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="municipal">
                                        <label class="custom-control-label" for="municipal">Municipal</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="particular">
                                        <label class="custom-control-label" for="particular">Particular</label>
                                    </div>
                                    <div class="filtros-botoes">
                                        <button class="filtros-btn-cancelar">Cancelar</button>
                                        <button class="filtros-btn-aplicar">Aplicar</button>
                                    </div>
                                </fieldset>
                            </div>
                        </form>
                    </li>

                    <li class="filtro">
                        <form action="" class="form-filtro">
                            <button type="button" class="btn-filtro">
                                <span class="filtro-nome">Ofertas de Matrícula</span>
                                <li-icon>
                                    <i class="fas fa-caret-down fa-lg"></i>
                                </li-icon>
                            </button>
                            <div class="filtros-dropdown closed">
                                <fieldset>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="creche">
                                        <label class="custom-control-label" for="creche">Creche</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="pre-escola">
                                        <label class="custom-control-label" for="pre-escola">Pré Escola</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="ef-1">
                                        <label class="custom-control-label" for="ef-1">Ensino Fundamental - 1º ao 4º</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="ef-2">
                                        <label class="custom-control-label" for="ef-2">Ensino Fundamental - 5º ao 8º</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="ensino-medio">
                                        <label class="custom-control-label" for="ensino-medio">Ensino Médio Normal</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="ensino-medio-int">
                                        <label class="custom-control-label" for="ensino-medio-int">Ensino Médio
                                            Integrado</label>
                                    </div>
                                    <div class="filtros-botoes">
                                        <button class="filtros-btn-cancelar">Cancelar</button>
                                        <button class="filtros-btn-aplicar">Aplicar</button>
                                    </div>
                                </fieldset>
                            </div>
                        </form>
                    </li>

                </ul>

            </div>

        </section>

    </header>

    <!-- Main -->
    <main id="main-principal">

        <div class="container mt-5" id="resultado-busca">

            <h2 class="verde-escuro-text">Resultado da Busca:</h2>
            <h3 class="verde-claro-text">São Paulo</h3>
            <h4 class="verde-claro-text mt-4">Sorocaba</h4>

            <!-- Escolas -->
            <section id="resultado-escolas" class="mt-4">

                <!-- Tabela de Escolas -->
                <table class="table table-hover" id="tabela-escolas">
                    
                    <thead class="thead-light">
                        <tr>
                            <th class="t-codigo">Código</th>
                            <th class="t-nome">Nome</th>
                            <th class="t-situacao">Situação</th>
                            <th class="t-dep-adm">Dep.Adm.</th>
                            <th class="t-ofertas">Ofertas</th>
                        </tr>
                    </thead>

                    <tbody id="escolas-datatable">
                        <tr class="escola" codigo-escola="21114978" data-toggle="modal" data-target="#modal-escola">
                            <td class="t-codigo">21114978</td>
                            <td class="t-nome">UNIDADE INTEGRADA DE EDUCACAO ESCOLAR INDIGENA MONTE SIAO</td>
                            <td class="t-situacao">Em Atividade</td>
                            <td class="t-dep-adm">Estadual</td>
                            <td class="t-ofertas">
                                <span class="badge badge-pill badge-light">C</span>
                                <span class="badge badge-pill badge-light">PE</span>
                                <span class="badge badge-pill badge-light">EFI</span>
                                <span class="badge badge-pill badge-light">EFII</span>
                                <span class="badge badge-pill badge-light">EM</span>
                                <span class="badge badge-pill badge-light">EMI</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="t-codigo">21114986</td>
                            <td class="t-nome">UNIDADE INTEGRADA DE EDUCACAO ESCOLAR INDIGENA MOISES KANELA</td>
                            <td class="t-situacao">Em Atividade</td>
                            <td class="t-dep-adm">Pública</td>
                            <td class="t-ofertas">
                                <span class="badge badge-pill badge-light">EFI</span>
                                <span class="badge badge-pill badge-light">EFII</span>
                                <span class="badge badge-pill badge-light">EM</span>
                                <span class="badge badge-pill badge-light">EMI</span>
                            </td>
                        </tr>
                    </tbody>

                </table>
                <!-- Fim da Tabela de Escolas -->
                
            </section>
            <!-- Fim Escolas -->

            <!-- Modal Informações Escolas -->
            <div class="modal fade" id="modal-escola" tabindex="-1" role="dialog" aria-labelledby="modal-escola" aria-hidden="true">

                <!-- Change class .modal-sm to change the size of the modal -->
                <div class="modal-dialog modal-xl" role="document">

                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="d-flex flex-column">
                                <h5 class="verde-escuro-text" id="modal-escola-label">21114978 - UNIDADE INTEGRADA DE EDUCACAO ESCOLAR INDIGENA MONTE SIAO</h5>
                                <h6>Nordeste - Maranhão - Leste Maranhanse - Chapada do Alto Itapecuru - Jenipapo dos Vieiras - Jenipapo dos Vieiras</h6>
                            </div>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                
                                <div class="row">
                                    <div class="col-sm-7">

                                        <div class="info-card">
                                            <h6 class="info-card-title">informações de localização</h6>
                                            <ul class="info">
                                               <li class="row">
                                                   <div class="col"><b>Região</b>:</div>
                                                   <div class="col">Nordeste</div>
                                               </li>
                                               <li class="row">
                                                    <div class="col"><b>Estado</b>:</div>
                                                    <div class="col">Maranhão - MA</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Mesorregião</b>:</div>
                                                    <div class="col">Leste Maranhense</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Microrregião</b>:</div>
                                                    <div class="col">Chapadas do Alto do Itaperucu</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Município</b>:</div>
                                                    <div class="col">Jenipapo das Vieiras</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Distrito</b>:</div>
                                                    <div class="col">Jenipapo das Vieiras</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Localização</b>:</div>
                                                    <div class="col">Rural</div>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="info-card">
                                            <h6 class="info-card-title">ofertas de matrícula</h6>
                                            <ul class="info">
                                                <li class="row">
                                                    <div class="col"><b>Creche</b>:</div>
                                                    <div class="col">Não</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Pré-Escola</b>:</div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Ensino Fundamental - 1º ao 4º</b>:</div>
                                                    <div class="col">Sim</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Ensino Fundamental - 5º ao 8º</b>:</div>
                                                    <div class="col">Não</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Ensino Médio Normal</b>:</div>
                                                    <div class="col">Não</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Ensino Média Integrado</b>:</div>
                                                    <div class="col">Não</div>
                                                </li>
                                            </ul>
                                        </div>
                                        
                                        <div class="info-card">
                                            <h6 class="info-card-title">dependências da escola</h6>
                                            <ul class="info">
                                                <li class="row">
                                                    <div class="col"><b>Sala de Diretoria:</b></div>
                                                    <div class="col">Não</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Sala de Professores:</b></div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Laboratório de Informática:</b></div>
                                                    <div class="col">Sim</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Laboratório de Ciências:</b></div>
                                                    <div class="col">Não</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Quadra de Esportes:</b></div>
                                                    <div class="col">Não</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Biblioteca:</b></div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Sala de Leitura:</b></div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Parque Infantil:</b></div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Bercário:</b></div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Secretaria:</b></div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Auditório:</b></div>
                                                    <div class="col">Não</div>
                                                </li> 
                                                <li class="row">
                                                    <div class="col"><b>Área Verde:</b></div>
                                                    <div class="col">Não</div>
                                                </li>
                                            </ul>

                                        </div>

                                    </div>
                                    <!-- Fim col -->

                                    <div class="col-sm-5">

                                        <div class="info-card">
                                            <h6 class="info-card-title">informações gerais</h6>
                                            <ul class="info">
                                                <li class="row">
                                                    <div class="col"><b>Situação de Funcionamento:</b></div>
                                                    <div class="col">Em Atividade</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Início do Ano Letivo:</b></div>
                                                    <div class="col">05/02/2018</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Término do Ano Letivo:</b></div>
                                                    <div class="col">21/12/2018</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Dep. Administrativa:</b></div>
                                                    <div class="col">Estadual</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Qtd. de Salas:</b></div>
                                                    <div class="col">3</div>
                                                </li>                                                      
                                                <li class="row">
                                                    <div class="col"><b>Qtd. de Funcionários:</b></div>
                                                    <div class="col">7</div>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="info-card">
                                            <h6 class="info-card-title">saneamento básico</h6>
                                            <ul class="info">
                                               <li class="row">
                                                   <div class="col"><b>Água Filtrada:</b></div>
                                                   <div class="col">Não</div>
                                               </li>
                                               <li class="row">
                                                    <div class="col"><b>Esgoto:</b></div>
                                                    <div class="col">Não</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Coleta de Lixo:</b></div>
                                                    <div class="col">Não</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Reciclagem:</b></div>
                                                    <div class="col">Não</div>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="info-card">
                                            <h6 class="info-card-title">alimentação</h6>
                                            <ul class="info">
                                               <li class="row">
                                                   <div class="col"><b>Alimentação:</b></div>
                                                   <div class="col">Não</div>
                                               </li>
                                               <li class="row">
                                                    <div class="col"><b>Cozinha:</b></div>
                                                    <div class="col">Não</div>
                                                </li>
                                                <li class="row">
                                                    <div class="col"><b>Refeitório:</b></div>
                                                    <div class="col">Não</div>
                                                </li>                                                      
                                            </ul>
                                        </div>

                                        <div class="info-card">
                                            <h6 class="info-card-title">moradia</h6>
                                            <ul class="info">
                                               <li class="row">
                                                   <div class="col"><b>Alojamento para Alunos:</b></div>
                                                   <div class="col">Não</div>
                                               </li>
                                               <li class="row">
                                                    <div class="col"><b>Alojamento para Professores:</b></div>
                                                    <div class="col">Não</div>
                                                </li>                                                    
                                            </ul>
                                        </div>

                                        <div class="info-card">
                                            <h6 class="info-card-title">acesso à internet</h6>
                                            <ul class="info">
                                               <li class="row">
                                                   <div class="col"><b>Internet:</b></div>
                                                   <div class="col">Não</div>
                                               </li>
                                            </ul>
                                        </div>

                                    </div>
                                    <!-- Fim col -->

                                </div>
                                <!-- Fim row -->
                            </div>
                            <!-- Fim container -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-dismiss="modal">fechar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Informações Escolas -->

        </div>
        <!-- Fim do Container -->

        <!-- Seção de Filtros -->
        <section id="filtros-wrapper" class="d-none">

            <h2 class="verde-escuro-text">Filtros:</h2>

            <!-- Filtros -->
            <article id="filtros">

                <div class="filtros-funcionamento">
                    <p class="font-weight-bold">Situação de Funcionamento</p>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="em-atividade">
                        <label class="custom-control-label" for="em-atividade">Em Atividade</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="paralisada">
                        <label class="custom-control-label" for="paralisada">Paralisada</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="extinta">
                        <label class="custom-control-label" for="extinta">Extinta</label>
                    </div>

                </div>

                <div class="filtros-dependencia-adm">
                    <p class="font-weight-bold">Dependência Administrativa</p>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="federal">
                        <label class="custom-control-label" for="federal">Federal</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="estadual">
                        <label class="custom-control-label" for="estadual">Estadual</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="municipal">
                        <label class="custom-control-label" for="municipal">Municipal</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="particular">
                        <label class="custom-control-label" for="particular">Particular</label>
                    </div>
                </div>

                <div class="filtros-ofertas">
                    <p class="font-weight-bold">Ofertas de Matrícula</p>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="creche">
                        <label class="custom-control-label" for="creche">Creche</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="pre-escola">
                        <label class="custom-control-label" for="pre-escola">Pré Escola</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="ef-1">
                        <label class="custom-control-label" for="ef-1">Ensino Fundamental - 1º ao 4º</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="ef-2">
                        <label class="custom-control-label" for="ef-2">Ensino Fundamental - 5º ao 8º</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="ensino-medio">
                        <label class="custom-control-label" for="ensino-medio">Ensino Médio Normal</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="ensino-medio-int">
                        <label class="custom-control-label" for="ensino-medio-int">Ensino Médio
                            Integrado</label>
                    </div>
                </div>

                <div class="filtros-dependencias d-flex flex-row flex-wrap">
                    <p class="font-weight-bold">Dependências da Escola</p>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="agua-filtrada">
                        <label class="custom-control-label" for="agua-filtrada">Água Filtrada</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="esgoto">
                        <label class="custom-control-label" for="esgoto">Esgoto</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="coleta-lixo">
                        <label class="custom-control-label" for="coleta-lixo">Coleta de Lixo</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="reciclagem">
                        <label class="custom-control-label" for="reciclagem">Reciclagem</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="lab-info">
                        <label class="custom-control-label" for="lab-info">Laboratório de
                            Informática</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="lab-ciencias">
                        <label class="custom-control-label" for="lab-ciencias">Laboratório de
                            Ciências</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="quadra">
                        <label class="custom-control-label" for="quadra">Quadra de Esportes</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="cozinha">
                        <label class="custom-control-label" for="cozinha">Cozinha</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="biblioteca">
                        <label class="custom-control-label" for="biblioteca">Biblioteca</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="sala-leitura">
                        <label class="custom-control-label" for="sala-leitura">Sala de Leitura</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="parque-infantil">
                        <label class="custom-control-label" for="parque-infantil">Parque Infantil</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="bercario">
                        <label class="custom-control-label" for="bercario">Bercário</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="auditorio">
                        <label class="custom-control-label" for="auditorio">Auditório</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="refeitorio">
                        <label class="custom-control-label" for="refeitorio">Refeitório</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="aloj-alunos">
                        <label class="custom-control-label" for="aloj-alunos">Alojamento para Alunos</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="aloj-prof">
                        <label class="custom-control-label" for="aloj-prof">Alojamento para
                            Professores</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="area-verde">
                        <label class="custom-control-label" for="area-verde">Área Verde</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="internet">
                        <label class="custom-control-label" for="internet">Internet</label>
                    </div>
                </div>

                <!-- Botão para aplicar os filtros -->
                <button class="text-uppercase w-100 p-1 mt-4 bg-verde-claro white-text"
                    id="aplicar-filtros">aplicar filtros</button>

            </article>
            <!-- Fim dos filtros -->
        </section>
        <!-- Fim da seção de filtros -->

    </main>

    <!-- Footer -->
    <footer id="footer-principal" class="p-3">
        <div class="footer-copy text-center">&copy; 2019 Copyright: Bianca Gomes Rodrigues, Pietro Zuntini Bonfim</div>
    </footer>


    <!-- Javascript -->
    <script src="lib/jquery/jquery-3.3.1.min.js"></script>
    <script src="lib/mdbootstrap/js/bootstrap.js"></script>
    <script src="lib/mdbootstrap/js/mdb.js"></script>
    <script src="lib/mdbootstrap/js/datatables.js"></script>
    <script src="lib/select2/js/select2.min.js"></script>

    <script src="js/escolas.js"></script>

</body>

</html>