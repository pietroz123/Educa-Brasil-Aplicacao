<%-- 
    Document   : estatisticas
    Created on : 13/05/2019, 10:03:56
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
        <div id="busca">

            <div class="container">
                <ul class="list-inline navbar-busca">
                    <li class="list-inline-item">Brasil</li>
                    <li class="list-inline-item">Região</li>
                    <li class="list-inline-item">Estado</li>
                    <li class="list-inline-item">Município</li>
                </ul>
            </div>

        </div>

    </header>

    <!-- Main -->
    <main id="main-principal">

        <div class="container mt-4">
            
            <h2 class="verde-escuro-text">Brasil</h2>

            <div class="container">
                <div class="row">
                    <div class="col-sm-6 mapa-wrapper">
                        <div id="mapa"></div>
                    </div>
                    <div class="col-sm-6 barras-wrapper">
                        
                    </div>
                </div>
            </div>

        </div>

        <div class="container" id="estatisticas-gerais">
            <div class="row">
                <div class="col-sm-6">
                    <h5 class="verde-escuro-text">Situação de Funcionamento</h5>
                    <div class="grafico-est" id="grafico-situacao"></div>
                </div>
                <div class="col-sm-6">
                    <h5 class="verde-escuro-text">Dependência Administrativa</h5>
                    <div class="grafico-est" id="grafico-dep-adm"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <h5 class="verde-escuro-text">Localização</h5>
                    <div class="grafico-est" id="grafico-localizacao"></div>
                </div>
                <div class="col-sm-6">
                    <h5 class="verde-escuro-text">Oferta de Matrícula</h5>
                    <div class="grafico-est" id="grafico-oferta"></div>
                </div>
            </div>
        </div>

    </main>

    <!-- Footer -->
    <footer id="footer-principal" class="p-3">
        <div class="footer-copy text-center">&copy; 2019 Copyright: Bianca Gomes Rodrigues, Pietro Zuntini Bonfim</div>
    </footer>


    <!-- Javascript -->
    <script src="lib/jquery/jquery-3.3.1.min.js"></script>
    <script src="lib/mdbootstrap/js/bootstrap.js"></script>
    <script src="lib/mdbootstrap/js/mdb.js"></script>
    <!-- <script src="lib/popper/popper.min.js"></script> -->

    <!-- Amcharts v4.0 -->
    <script src="lib/amchats4/core.js"></script>
    <script src="lib/amchats4/charts.js"></script>
    <script src="lib/amchats4/animated.js"></script>
    <script src="js/estatisticas_graficos.js"></script>

</body>

</html>