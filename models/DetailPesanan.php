<?php

namespace api\models;

class DetailPesanan extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'DetailPesanan';
    }

    public static function primaryKey()
    {
        return ['Id_Detail'];
    }

    public function rules()
    {
        return [
            [['Id_Detail'], 'required'],
            [['Id_Detail', 'Id_Pesanan', 'Id_Menu'], 'string', 'max' => 50],
            [['Jumlah', 'Harga_sub'], 'integer'],
            [['Id_Detail'], 'unique'],
        ];
    }

    public function getMenu()
    {
        return $this->hasOne(\api\models\Menu::class, ['Id_Menu' => 'Id_Menu']);
    }

    public function getPesanan()
    {
        return $this->hasOne(\api\models\Pesanan::class, ['Id_Detail' => 'Id_Detail']);
    }

    public function extraFields()
    {
        return ['menu', 'pesanan'];
    }
}
