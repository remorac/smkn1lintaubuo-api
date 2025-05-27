<?php
$params = array_merge(
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

foreach (scandir(__DIR__ . '/../controllers') as $file) {
    if (preg_match('/^([A-Za-z0-9]+)Controller\.php$/', $file, $matches)) {
        $controller = strtolower($matches[1]);
        $rules[] = [
            'class' => 'yii\rest\UrlRule',
            'controller' => $controller,
            'pluralize' => false,
            'tokens' => ['{id}' => '<id:\\w+>'],
            'extraPatterns' =>  ['OPTIONS,POST login' => 'login'],
        ];
    }
}

$rules = array_merge($rules, [
    [
        'class' => 'yii\rest\UrlRule',
        'controller' => 'detail-pesanan',
        'pluralize' => false,
    ],
]);

return [
    'id' => 'api',
    'name' => 'api',
    'basePath' => dirname(__DIR__),
    'timeZone' => 'Asia/Jakarta',
    'controllerNamespace' => 'api\controllers',
    'defaultRoute' => 'site/index',
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
            'rules' => $rules ?? [],
        ]
    ],
    'params' => $params,
];

