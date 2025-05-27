<?php

namespace api\models;

class Penjual extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'Penjual';
    }

    public static function primaryKey()
    {
        return ['Id_Penjual'];
    }

    public function rules()
    {
        return [
            [['Id_Penjual'], 'required'],
            [['Id_Penjual', 'Nama', 'Email', 'Password', 'Nama_Toko', 'Alamat_Toko'], 'string', 'max' => 50],
            [['Id_Penjual'], 'unique'],
            [['Email'], 'email'],
            [['Email'], 'unique'],
            [['Password'], 'string', 'min' => 8],
        ];
    }

    public function getMenus()
    {
        return $this->hasMany(\api\models\Menu::class, ['Id_Penjual' => 'Id_Penjual']);
    }

    public function extraFields()
    {
        return ['menus'];
    }
}
