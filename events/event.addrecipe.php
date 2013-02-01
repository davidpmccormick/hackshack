<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventaddrecipe extends SectionEvent{

		public $ROOTELEMENT = 'addrecipe';

		public $eParamFILTERS = array(
			'admin-only',
				'xss-fail'
		);

		public static function about(){
			return array(
				'name' => 'addrecipe',
				'author' => array(
					'name' => 'David McCormick',
					'website' => 'http://hackshack.sumnoise.com',
					'email' => 'davidpmccormick@gmail.com'),
				'version' => 'Symphony 2.3',
				'release-date' => '2012-11-07T09:17:27+00:00',
				'trigger-condition' => 'action[addrecipe]'
			);
		}

		public static function getSource(){
			return '1';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;addrecipe result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/addrecipe></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;addrecipe result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/addrecipe></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;addrecipe result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/addrecipe></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Title
    &lt;input name="fields[title]" type="text" />
  &lt;/label>
  &lt;label>Course
    &lt;select name="fields[course]">
      &lt;option value="Baking">Baking&lt;/option>
      &lt;option value="Dessert">Dessert&lt;/option>
      &lt;option value="Main">Main&lt;/option>
      &lt;option value="Side">Side&lt;/option>
      &lt;option value="Starter">Starter&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Prep time (minutes)
    &lt;input name="fields[prep-time]" type="text" />
  &lt;/label>
  &lt;label>Cook time (minutes)
    &lt;input name="fields[cook-time]" type="text" />
  &lt;/label>
  &lt;label>Brief description
    &lt;input name="fields[brief-description]" type="text" />
  &lt;/label>
  &lt;label>Method
    &lt;textarea name="fields[method]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Serves (no. of people)
    &lt;input name="fields[serves]" type="text" />
  &lt;/label>
  &lt;label>Cost (£)
    &lt;input name="fields[cost]" type="text" />
  &lt;/label>
  &lt;label>Thumbnail image
    &lt;input name="fields[thumbnail-image]" type="file" />
  &lt;/label>
  &lt;select name="fields[main-images]">
    &lt;option value="...">...&lt;/option>
  &lt;/select>
  &lt;label>Difficulty
    &lt;select name="fields[difficulty]">
      &lt;option value="Easy">Easy&lt;/option>
      &lt;option value="Hard">Hard&lt;/option>
      &lt;option value="Moderate">Moderate&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;select name="fields[ingredients]">
    &lt;option value="...">...&lt;/option>
  &lt;/select>
  &lt;label>Tags
    &lt;input name="fields[tags]" type="text" />
  &lt;/label>
  &lt;label>Search
    &lt;input name="fields[search]" type="text" />
  &lt;/label>
  &lt;input name="action[addrecipe]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://hackshack.sumnoise.com/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['addrecipe'])) return $this->__trigger();
		}

	}
