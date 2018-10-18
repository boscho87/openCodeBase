<?php


$url = 'https://gitlab.com/api/v4/projects/{project_id}/labels';
$url = str_replace('{project_id}', 8697203, $url);
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL, $url);
curl_setopt($ch,CURLOPT_RETURNTRANSFER, true); 
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['PRIVATE-TOKEN: token']);



$labels = json_decode(file_get_contents(__DIR__.'/labels.json',true));

foreach ($labels as $label) {
	var_dump($url);
	$fields = ['name' => $label[0],'color' => $label[1]];
$fields_string = http_build_query($fields);
curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
curl_setopt($ch,CURLOPT_POST, count($fields));
$result = curl_exec($ch);
var_dump($result);

}

