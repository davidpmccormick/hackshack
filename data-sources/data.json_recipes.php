<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcejson_recipes extends SectionDatasource{

		public $dsParamROOTELEMENT = 'json-recipes';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'course',
				'prep-time',
				'cook-time',
				'method: formatted',
				'serves',
				'thumbnail-image',
				'main-images: image',
				'ingredients: quantity',
				'ingredients: ingredient'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'json_recipes',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/hackshack',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-12-30T12:56:07+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
