<?php
  $metadataBaseUrl = 'http://169.254.169.254/latest/meta-data/';
  $metadataKey = $_REQUEST['key'];
  $metadataValue = "";

  header('Content-Type: text/plain');

  if( $metadataKey != null ) {

    $curl_handle=curl_init();
    curl_setopt($curl_handle,CURLOPT_CONNECTTIMEOUT,2);
    curl_setopt($curl_handle,CURLOPT_RETURNTRANSFER,1);

    curl_setopt($curl_handle,CURLOPT_URL,$metadataBaseUrl . $metadataKey);
    $metadataValue = curl_exec($curl_handle);

  }

  print $metadataValue;
?>
