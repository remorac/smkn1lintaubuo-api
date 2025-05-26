<?php
$params = array_merge(
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'api',
    'name' => 'api',
    'basePath' => dirname(__DIR__),
    'timeZone' => 'Asia/Jakarta',
    'controllerNamespace' => 'api\controllers',
    'language' => 'id_ID',
    'aliases' => [
        '@api' => dirname(__DIR__),
    ],
    'components' => [
        'user' => [
            'identityClass' => '',
            'enableSession' => false,
            'loginUrl' => null,
        ],
        'request' => [
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
                'multipart/form-data' => 'yii\web\MultipartFormDataParser',
            ],
            'enableCsrfCookie' => false,
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'admin',
                    'pluralize' => false,
                    'extraPatterns' => [
                        'OPTIONS,POST login' => 'login',
                    ],
                ],
            ],
        ]
    ],
    'params' => $params,
];

