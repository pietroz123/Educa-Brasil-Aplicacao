/// <reference path='../lib/jquery/jquery-3.3.1.min.js' />


$(document).ready(function() {

    // Fazer com que o mapa ocupe a altura restante
    $('#nav-mapa').height($(window).height() - $('#header-principal').height());

    // Ao abrir a página, carregar as regiões
    $.ajax({
        url: 'RecuperarRegiao',
        method: 'POST',
        data: {
            recuperarRegioes: "sim"
        },
        datatype: 'html',
        success: function(retorno) {
            
            $('#select-regiao').html(retorno);
            
        },
        error: function(retorno) {
            console.log('Error');
            console.log(retorno);
        }
    });

    // Carregar também o mapa do Brasil
    criarGraficoPrincipal();


    $.ajax({
        url: 'RecuperarEstatisticas',
        method: 'POST',
        data: {
            recuperarEstatisticas: "sim"
        },
        datatype: 'json',
        success: function(retorno) {
            
            var json = JSON.parse(retorno);

            // Cria os gráficos
            criarGraficoSituacao(json.Atividade, json.Paralisada, json.Extinta);
            criarGraficoDependencias(json.Federal, json.Estadual, json.Municipal, json.Privada);
            criarGraficoLocalizacao(json.Urbana, json.Rural);
            criarGraficoOfertas(json.B, json.C, json.PE, json.EFI, json.EFII, json.EMN, json.EMI);

        },
        error: function(retorno) {
            console.log('Error');
            console.log(retorno);
        }
    });


    // =======================================================
    // Recuperar os Estados à partir de uma Região
    // =======================================================

    $('#select-regiao').change(function() {
        
        var dados_regiao = $(this).select2('data');
        var regiao = dados_regiao[0].id;
        var nome_regiao = dados_regiao[0].text;

        $.ajax({
            url: 'RecuperarEstados',
            method: 'POST',
            data: {
                regiao: regiao
            },
            datatype: 'html',
            success: function(retorno) {
                $('#select-estado').html(retorno);
            },
            error: function(retorno) {
                console.log('Error');
                console.log(retorno);
            }
        });
        
        // Atualizar o nome na view
        $('#nav-estatisticas ol').html('<li class="breadcrumb-item active nome-regiao">'+nome_regiao+'</li>');
        
        // Zera o nome do Municipio e o seu select
        $('.nome-municipio').html('');
        $('#select-municipio').html('<option></option>');

    });

    // =======================================================
    // Recuperar os Municipios à partir de um Estado
    // =======================================================

    $('#select-estado').change(function() {
        
        var dados_estado = $(this).select2('data');
        var estado = dados_estado[0].id;
        var nome_estado = dados_estado[0].text;

        $.ajax({
            url: 'RecuperarMunicipios',
            method: 'POST',
            data: {
                estado: estado
            },
            datatype: 'html',
            success: function(retorno) {
                $('#select-municipio').html(retorno);
            },
            error: function(retorno) {
                console.log('Error');
                console.log(retorno);
            }
            
        });
        
        // Atualizar o nome na view
        var nome_regiao = $('.nome-regiao').text();
        $('#nav-estatisticas ol').html('<li class="breadcrumb-item active nome-regiao">'+nome_regiao+'</li><li class="breadcrumb-item active nome-estado">'+nome_estado+'</li>');

    });
    
    $('#select-municipio').change(function () {
        
        // Recupera os dados do Municipio selecionado
        var dados_municipio = $(this).select2('data');
        var municipio = dados_municipio[0].id;
        var nome_municipio = dados_municipio[0].text;
      
        // Atualizar o nome na view
        var nome_regiao = $('.nome-regiao').text();
        var nome_estado = $('.nome-estado').text();
        $('#nav-estatisticas ol').html('<li class="breadcrumb-item active nome-regiao">'+nome_regiao+'</li><li class="breadcrumb-item active nome-estado">'+nome_estado+'</li><li class="breadcrumb-item active nome-municipio">'+nome_municipio+'</li>');

    });


    // Criação dos selects
    $("#select-regiao").select2({
        placeholder: "Região"
    });
    $("#select-estado").select2({
        placeholder: "Estado"
    });
    $("#select-municipio").select2({
        placeholder: "Município"
    });

});