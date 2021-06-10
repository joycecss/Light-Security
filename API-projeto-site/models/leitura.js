'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Leitura = sequelize.define('tb_dados_coletados',{	
		idDados: {
			field: 'idDados',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		fk_regiao: {
			field: 'fk_regiao',
			type: DataTypes.INTEGER,
			foreignKey: true
		},
		fk_sensor: {
			field: 'fk_sensor',
			type: DataTypes.INTEGER,
			foreignKey: true
		},
		luminosidade: {
			field: 'luminosidade',
			type: DataTypes.INTEGER,
			allowNull: false
		},
		data_hora: {
			field: 'data_hora',
			type: DataTypes.DATE, // NÃO existe DATETIME. O tipo DATE aqui já tem data e hora
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select
			allowNull: true
		}
	}, 
	{
		tableName: 'tb_dados_coletados', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Leitura;
};
