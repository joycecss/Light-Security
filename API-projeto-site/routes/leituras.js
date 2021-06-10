var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
var Leitura = require('../models').Leitura;
var env = process.env.NODE_ENV || 'development';

/* Recuperar as últimas N leituras */
router.get('/ultimas/:idRegiao', function(req, res, next) {
	
	// quantas são as últimas leituras que quer? 7 está bom?
	const limite_linhas = 7;

	var idRegiao = req.params.idRegiao;

	console.log(`Recuperando as ultimas ${limite_linhas} leituras`);
	
	let instrucaoSql = "";

	if (env == 'dev') {
		// abaixo, escreva o select de dados para o Workbench
		instrucaoSql = `select 
		luminosidade, 
		data_hora, 
		DATE_FORMAT(data_hora,'%H:%i:%s') as momento_grafico
		from tb_dados_coletados
		where fk_regiao = ${idRegiao}
		order by idDados desc limit ${limite_linhas}`;
	} else if (env == 'production') {
		// abaixo, escreva o select de dados para o SQL Server
		instrucaoSql = `select top ${limite_linhas} 
		luminosidade, 
		data_hora, 
		FORMAT(data_hora,'%H:%i:%s') as momento_grafico
		from tb_dados_coletados
		where fk_regiao = ${idRegiao}
		order by fk_regiao desc`;
	} else {
		console.log("\n\n\n\nVERIFIQUE O VALOR DE LINHA 1 EM APP.JS!\n\n\n\n")
	}
	
	sequelize.query(instrucaoSql, {
		model: Leitura,
		mapToModel: true 
	})
	.then(resultado => {
		console.log(`Encontrados: ${resultado.length}`);
		res.json(resultado);
	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
	});
});


router.get('/tempo-real/:idRegiao', function(req, res, next) {
	console.log('Recuperando regioes');
	
	//var idcaminhao = req.body.idcaminhao; // depois de .body, use o nome (name) do campo em seu formulário de login
	var idRegiao = req.params.idRegiao;
	
	let instrucaoSql = "";
	
	if (env == 'dev') {
		// abaixo, escreva o select de dados para o Workbench
		instrucaoSql = `select luminosidade, DATE_FORMAT(data_hora,'%H:%i:%s') as momento_grafico, fk_regiao from tb_dados_coletados where fk_regiao = ${idRegiao} order by idDados desc limit 1`;
	} else if (env == 'production') {
		// abaixo, escreva o select de dados para o SQL Server
		instrucaoSql = `select top 1 luminosidade, FORMAT(data_hora,'HH:mm:ss') as momento_grafico, fk_regiao from tb_dados_coletados where fk_regiao = ${idRegiao} order by fk_regiao desc`;
	} else {
		console.log("\n\n\n\nVERIFIQUE O VALOR DE LINHA 1 EM APP.JS!\n\n\n\n")
	}
	
	console.log(instrucaoSql);
	
	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
	.then(resultado => {
		res.json(resultado[0]);
	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
	});
});

// estatísticas (max, min, média, mediana, quartis etc)
router.get('/estatisticas', function (req, res, next) {
	
	console.log(`Recuperando as estatísticas atuais`);

	const instrucaoSql = `select 
							max(luminosidade) as luminosidade_maxima, 
							min(luminosidade) as luminosidade_minima, 
							avg(luminosidade) as luminosidade_media
						from tb_dados_coletados`;
					

	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado[0]);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
  
});


module.exports = router;
