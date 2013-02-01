<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcenavigation extends NavigationDatasource{

		public $dsParamROOTELEMENT = 'navigation';
		public $dsParamORDER = 'desc';
		public $dsParamREDIRECTONEMPTY = 'no';
		

		

		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'navigation',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://localhost:8888/fbtest',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3RC3',
				'release-date' => '2012-05-20T15:40:04+00:00'
			);
		}

		public function getSource(){
			return 'navigation';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
