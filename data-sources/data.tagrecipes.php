<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcetagrecipes extends SectionDatasource{

		public $dsParamROOTELEMENT = 'tagrecipes';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$course';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'18' => '{$course}',
				'12' => '{$difficulty}',
				'25' => '{$tag}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'course',
				'prep-time',
				'cook-time',
				'brief-description: formatted',
				'serves',
				'cost',
				'thumbnail-image',
				'tags'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'tagrecipes',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/hackshackattack',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-11-02T08:32:27+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
