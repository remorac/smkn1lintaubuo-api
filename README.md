# API Documentation

## Yii2 REST Endpoints Pattern

For each resource controller, Yii2 REST provides these standard endpoints:

| Method | Endpoint                | Description                |
|--------|------------------------|----------------------------|
| GET    | /resource              | List all resources         |
| GET    | /resource/{id}         | View a single resource     |
| POST   | /resource              | Create a new resource      |
| PUT    | /resource/{id}         | Update an existing resource|
| PATCH  | /resource/{id}         | Partially update resource  |
| DELETE | /resource/{id}         | Delete a resource          |
| OPTIONS| /resource, /resource/{id} | Returns allowed methods |

---

## URL
`https://api.smkn1lintaubuo.sch.id`

---

## Controllers & Endpoints

### SiteController
**Resource:** `/site`
- `GET /site` — health check

---

### AdminController
**Resource:** `/admin`
- `GET /admin` — List all admins
- `GET /admin?filter[{Field_Name}]={keyword}` — List all admins with equal filter
- `GET /admin?filter[{Field_Name}][{operator}]={keyword}` — List all admins with like filter
- `GET /admin/{id}` — View admin by ID
- `POST /admin` — Create new admin
- `PUT /admin/{id}` — Update admin
- `PATCH /admin/{id}` — Partially update admin
- `DELETE /admin/{id}` — Delete admin
- `POST /admin/login` — Login as admin

---

### DetailPesananController
**Resource:** `/detail-pesanan`
- `GET /detail-pesanan` — List all detail pesanan
- `GET /detail-pesanan?expand=menu,pesanan` — List all detail pesanan with relations
- `GET /detail-pesanan/{id}` — View detail pesanan by ID
- `GET /detail-pesanan/{id}?expand=menu,pesanan` — View detail pesanan by ID with relations
- `POST /detail-pesanan` — Create new detail pesanan
- `PUT /detail-pesanan/{id}` — Update detail pesanan
- `PATCH /detail-pesanan/{id}` — Partially update detail pesanan
- `DELETE /detail-pesanan/{id}` — Delete detail pesanan

---

### DriverController
**Resource:** `/driver`
- `GET /driver` — List all drivers
- `GET /driver?expand=pesanans` — List all drivers with relations
- `GET /driver/{id}` — View driver by ID
- `GET /driver/{id}?expand=pesanans` — View driver by ID with relations
- `POST /driver` — Create new driver
- `PUT /driver/{id}` — Update driver
- `PATCH /driver/{id}` — Partially update driver
- `DELETE /driver/{id}` — Delete driver

---

### KonsumenController
**Resource:** `/konsumen`
- `GET /konsumen` — List all konsumen
- `GET /konsumen?expand=pesanans` — List all konsumen with relations
- `GET /konsumen/{id}` — View konsumen by ID
- `GET /konsumen/{id}?expand=pesanans` — View konsumen by ID with relations
- `POST /konsumen` — Create new konsumen
- `PUT /konsumen/{id}` — Update konsumen
- `PATCH /konsumen/{id}` — Partially update konsumen
- `DELETE /konsumen/{id}` — Delete konsumen
- `POST /konsumen/login` — Login as konsumen

---

### MenuController
**Resource:** `/menu`
- `GET /menu` — List all menu
- `GET /menu?expand=penjual,detailPesanans` — List all menu with relations
- `GET /menu/{id}` — View menu by ID
- `GET /menu/{id}?expand=penjual,detailPesanans` — View menu by ID with relations
- `POST /menu` — Create new menu
- `PUT /menu/{id}` — Update menu
- `PATCH /menu/{id}` — Partially update menu
- `DELETE /menu/{id}` — Delete menu

---

### PenjualController
**Resource:** `/penjual`
- `GET /penjual` — List all penjual
- `GET /penjual?expand=menus` — List all penjual with relations
- `GET /penjual/{id}` — View penjual by ID
- `GET /penjual/{id}?expand=menus` — View penjual by ID with relations
- `POST /penjual` — Create new penjual
- `PUT /penjual/{id}` — Update penjual
- `PATCH /penjual/{id}` — Partially update penjual
- `DELETE /penjual/{id}` — Delete penjual
- `POST /penjual/login` — Login as penjual

---

### PesananController
**Resource:** `/pesanan`
- `GET /pesanan` — List all pesanan
- `GET /pesanan?expand=detailPesanans,driver,konsumen` — List all pesanan with relations
- `GET /pesanan` — List all pesanan with relations
- `GET /pesanan/{id}` — View pesanan by ID
- `GET /pesanan/{id}?expand=detailPesanans,driver,konsumen` — View pesanan by ID with relations
- `POST /pesanan` — Create new pesanan
- `PUT /pesanan/{id}` — Update pesanan
- `PATCH /pesanan/{id}` — Partially update pesanan
- `DELETE /pesanan/{id}` — Delete pesanan

---

**Note:**  
- Replace `{id}` with the actual resource ID.
- All endpoints support the `OPTIONS` method for CORS and allowed methods discovery.
- Custom endpoints like `/login` are also available as listed.

For more details on request/response formats, refer to the Yii2 REST documentation or your model definitions.


---

# Examples

## SiteController

### `GET /index`
**Request:**  
```http
GET /index
```
**Response:**
```json
{
  "message": "site is running.",
  "data": {
    "name": "api",
    "version": "0.1"
  }
}
```

---

## AdminController

### `GET /admin`
**Request:**  
```http
GET /admin
GET /admin?filter[field_name]=keyword
GET /admin?filter[field_name][operator]=keyword
```
**Response:**
```json
[
  {
    "Id_Admin": "A001",
    "Nama": "Admin Satu",
    "Email": "admin1@example.com"
  },
  {
    "Id_Admin": "A002",
    "Nama": "Admin Dua",
    "Email": "admin2@example.com"
  }
]
```

---

### `GET /admin/{id}`
**Request:**  
```http
GET /admin/A001
```
**Response:**
```json
{
  "Id_Admin": "A001",
  "Nama": "Admin Satu",
  "Email": "admin1@example.com"
}
```

---

### `POST /admin`
**Request:**
```json
{
  "Id_Admin": "A003",
  "Nama": "Admin Tiga",
  "Email": "admin3@example.com",
  "Password": "password123"
}
```
**Response:**
```json
{
  "Id_Admin": "A003",
  "Nama": "Admin Tiga",
  "Email": "admin3@example.com"
}
```

---

### `PUT /admin/{id}`
**Request:**
```json
{
  "Nama": "Admin Tiga Updated"
}
```
**Response:**
```json
{
  "Id_Admin": "A003",
  "Nama": "Admin Tiga Updated",
  "Email": "admin3@example.com"
}
```

---

### `DELETE /admin/{id}`
**Request:**  
```http
DELETE /admin/A003
```
**Response:**
```json
{
  "success": true
}
```

---

### `POST /admin/login`
**Request:**
```json
{
  "Email": "admin1@example.com",
  "Password": "password123"
}
```
**Response:**
```json
{
  "Id_Admin": "A001",
  "Nama": "Admin Satu",
  "Email": "admin1@example.com"
}
```
**Error Response:**
```json
{
  "name": "Unauthorized",
  "message": "Invalid email or password",
  "code": 0,
  "status": 401,
  "type": "yii\\web\\UnauthorizedHttpException"
}
```

---

## KonsumenController

### `GET /konsumen`
**Request:**  
```http
GET /konsumen
GET /konsumen?expand=pesanans
GET /konsumen?filter[{Field_Name}]={keyword}
GET /konsumen?filter[{Field_Name}][{operator}]={keyword}
GET /konsumen?expand=pesanans&filter[{Field_Name}]={keyword}
```
**Response:**
```json
[
  {
    "Id_Konsumen": "K001",
    "Nama": "Budi",
    "Email": "budi@example.com"
  }
]
```

---

### `POST /konsumen/login`
**Request:**
```json
{
  "Email": "budi@example.com",
  "Password": "password123"
}
```
**Response:**
```json
{
  "Id_Konsumen": "K001",
  "Nama": "Budi",
  "Email": "budi@example.com"
}
```
**Error Response:**
```json
{
  "name": "Unauthorized",
  "message": "Invalid email or password",
  "code": 0,
  "status": 401,
  "type": "yii\\web\\UnauthorizedHttpException"
}
```

---

## PenjualController

### `POST /penjual/login`
**Request:**
```json
{
  "Email": "penjual1@example.com",
  "Password": "password123"
}
```
**Response:**
```json
{
  "Id_Penjual": "P001",
  "Nama": "Penjual Satu",
  "Email": "penjual1@example.com",
  "Nama_Toko": "Toko Satu",
  "Alamat_Toko": "Jl. Mawar No. 1"
}
```
**Error Response:**
```json
{
  "name": "Unauthorized",
  "message": "Invalid email or password",
  "code": 0,
  "status": 401,
  "type": "yii\\web\\UnauthorizedHttpException"
}
```

---

## MenuController

### `GET /menu`
**Request:**  
```http
GET /menu
```
**Response:**
```json
[
  {
    "Id_Menu": "M001",
    "Id_Penjual": "P001",
    "Nama_Menu": "Nasi Goreng",
    "Harga": 15000,
    "Deskripsi": "Nasi goreng spesial"
  }
]
```

### `POST /menu`
**Request:**
```json
{
  "Id_Menu": "M002",
  "Id_Penjual": "P001",
  "Nama_Menu": "Mie Goreng",
  "Harga": 12000,
  "Deskripsi": "Mie goreng enak"
}
```
**Response:**
```json
{
  "Id_Menu": "M002",
  "Id_Penjual": "P001",
  "Nama_Menu": "Mie Goreng",
  "Harga": 12000,
  "Deskripsi": "Mie goreng enak"
}
```

---

## PesananController

### `GET /pesanan`
**Request:**  
```http
GET /pesanan
```
**Response:**
```json
[
  {
    "Id_Pesanan": "PS001",
    "Id_Konsumen": "K001",
    "Id_Driver": "D001",
    "Id_Detail": "DT001",
    "Tanggal_Order": "2024-06-01",
    "Status": 1,
    "Total_Harga": 27000
  }
]
```

---

## DetailPesananController

### `GET /detail-pesanan`
**Request:**  
```http
GET /detail-pesanan
```
**Response:**
```json
[
  {
    "Id_Detail": "DT001",
    "Id_Pesanan": "PS001",
    "Id_Menu": "M001",
    "Jumlah": 2,
    "Harga_sub": 30000
  }
]
```

---

## DriverController

### `GET /driver`
**Request:**  
```http
GET /driver
```
**Response:**
```json
[
  {
    "Id_Driver": "D001",
    "Nama": "Pak Agus",
    "No_Telp": "08123456789"
  }
]
```

---

**Note:**  
- Replace `{id}` with the actual resource ID.
- Replace `{field_name}` with actual field name.
- Replace `{operator}` with `like` or other comparison operators except `=`.
- Replace `{keyword}` with actual keyword.
- All POST/PUT/PATCH requests use `Content-Type: application/json`.
- Error responses are shown as examples for login endpoints.
