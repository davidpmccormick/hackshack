<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcerecipe extends SectionDatasource{

		public $dsParamROOTELEMENT = 'recipe';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$title';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'1' => '{$title}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'course',
				'prep-time',
				'cook-time',
				'method: formatted',
				'serves',
				'cost',
				'main-images: image',
				'difficulty',
				'ingredients: quantity',
				'ingredients: ingredient',
				'tags',
				'goes-with: title'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'recipe',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://hackshack.sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-11-14T14:04:28+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
