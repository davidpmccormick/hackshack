<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcealltags extends SectionDatasource{

		public $dsParamROOTELEMENT = 'alltags';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$course';
		public $dsParamSORT = 'title';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'18' => '{$course}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'tags'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'alltags',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/hackshackattack',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-11-01T20:51:48+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
