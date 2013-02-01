<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcerecipes extends SectionDatasource{

		public $dsParamROOTELEMENT = 'recipes';
		public $dsParamORDER = '{$url-order:asc}';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '{$url-p}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$course';
		public $dsParamSORT = '{$url-sort:title}';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'18' => '{$course}',
				'12' => '{$difficulty}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'course',
				'prep-time',
				'cook-time',
				'brief-description: formatted',
				'cost',
				'thumbnail-image',
				'difficulty'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'recipes',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://hackshack.sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-11-08T13:59:20+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
