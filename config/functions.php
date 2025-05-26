<?php

/**
 * Debug function
 * d($var);
 */
function d($var)
{
    echo '<pre>';
    yii\helpers\VarDumper::dump($var, 10, true);
    echo '</pre>';
}

/**
 * Debug function with die() after
 * dd($var);
 */
function dd($var)
{
    d($var);
    die();
} 

/**
 * stringify ActiveRecord errors
 * stringifyModelErrors($errors);
 */
function stringifyModelErrors($errors) {
    $array = [];
    foreach ($errors as $error) {
        foreach ($error as $errorItem) {
            $array[] = $errorItem;
        }
    }
    return implode(' ', $array);
}

function parsePhone($phone)
{
    if ($phone) {
        $phone = str_replace(' ', '', $phone);
        $phone = str_replace('-', '', $phone);
        if (substr($phone,0,1) == '+')  $phone = $phone;
        if (substr($phone,0,2) == '62') $phone = '+'.$phone;
        if (substr($phone,0,1) >= '1')  $phone = '+62'.$phone;
        if (substr($phone,0,1) == '0')  $phone = '+62'.ltrim($phone, '0');
    }
    return $phone;
}

function notify($phone, $email, $subject, $message, $fileUrl, $to_whatsapp = true, $to_email = false)
{
    $return = true;

    if ($to_whatsapp && $phone) {
        $messageWhatsapp = $message;
        $messageWhatsapp = str_ireplace('*', '', $messageWhatsapp);
        $messageWhatsapp = str_ireplace('_', '', $messageWhatsapp);
        $messageWhatsapp = str_ireplace('<br>', '%0a', $messageWhatsapp);
        $messageWhatsapp = str_ireplace('<b>', '*', $messageWhatsapp);
        $messageWhatsapp = str_ireplace('</b>', '*', $messageWhatsapp);
        $messageWhatsapp = str_ireplace('<i>', '_', $messageWhatsapp);
        $messageWhatsapp = str_ireplace('</i>', '_', $messageWhatsapp);
        $messageWhatsapp = rawurlencode(strip_tags($messageWhatsapp));
            
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL            => 'https://starsender.online/api/v2/sendFiles?message=&tujuan='.rawurlencode($phone.'@s.whatsapp.net'),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING       => '',
            CURLOPT_MAXREDIRS      => 10,
            CURLOPT_TIMEOUT        => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION   => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST  => 'POST',
            CURLOPT_HTTPHEADER     => ['apikey: '.Yii::$app->params['starsender_apikey']],
            CURLOPT_POSTFIELDS     => ['file'=> $fileUrl],
        ]);
        $response = curl_exec($curl);
        curl_close($curl);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL            => 'https://starsender.online/api/v2/sendText?message='.$messageWhatsapp.'&tujuan='.rawurlencode($phone.'@s.whatsapp.net'),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING       => '',
            CURLOPT_MAXREDIRS      => 10,
            CURLOPT_TIMEOUT        => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION   => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST  => 'POST',
            CURLOPT_HTTPHEADER     => ['apikey: '.Yii::$app->params['starsender_apikey']],
        ]);
        $response.= curl_exec($curl);
        curl_close($curl);

        Yii::info($response);
        $return = $response;
    }

    if ($to_email && $email) {
        /* try {
            $params = [
                'from_name'  => 'APPSKEP',
                'from_email' => 'info@appskep.id',
                'recipient'  => $email,
                'subject'    => $subject,
                'content'    => $message,
                'api_token'  => Yii::$app->params['mailketing_apiToken'],
            ];
            
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL,"https://api.mailketing.co.id/api/v1/send");
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 1000);
            $response = curl_exec ($ch);
            curl_close ($ch);
            Yii::info($response);
        } catch(\Exception $e){
            Yii::error($e->getMessage());
        } */
    }
    return $return;
}
