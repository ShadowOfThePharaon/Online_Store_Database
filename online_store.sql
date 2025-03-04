-- SQL Manager Lite for PostgreSQL 6.6.1.58897
-- ---------------------------------------
-- Host      : localhost
-- Database  : online_store
-- Version   : PostgreSQL 17.3 on x86_64-windows, compiled by msvc-19.42.34436, 64-bit



SET check_function_bodies = false;
--
-- Structure for table users (OID = 16503) : 
--
SET search_path = public, pg_catalog;
CREATE TABLE public.users (
    id serial NOT NULL,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
)
WITH (oids = false);
ALTER TABLE ONLY public.users ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.users ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY public.users ALTER COLUMN email SET STATISTICS 0;
ALTER TABLE ONLY public.users ALTER COLUMN password_hash SET STATISTICS 0;
ALTER TABLE ONLY public.users ALTER COLUMN created_at SET STATISTICS 0;
--
-- Structure for table categories (OID = 16537) : 
--
CREATE TABLE public.categories (
    id serial NOT NULL,
    name varchar(100) NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.categories ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.categories ALTER COLUMN name SET STATISTICS 0;
--
-- Structure for table products (OID = 16546) : 
--
CREATE TABLE public.products (
    id serial NOT NULL,
    name varchar(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    stock_quantity integer DEFAULT 0 NOT NULL,
    category_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
)
WITH (oids = false);
ALTER TABLE ONLY public.products ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.products ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY public.products ALTER COLUMN description SET STATISTICS 0;
ALTER TABLE ONLY public.products ALTER COLUMN price SET STATISTICS 0;
ALTER TABLE ONLY public.products ALTER COLUMN stock_quantity SET STATISTICS 0;
ALTER TABLE ONLY public.products ALTER COLUMN category_id SET STATISTICS 0;
ALTER TABLE ONLY public.products ALTER COLUMN created_at SET STATISTICS 0;
--
-- Structure for table orders (OID = 16562) : 
--
CREATE TABLE public.orders (
    id serial NOT NULL,
    user_id integer,
    total_price numeric(10,2) NOT NULL,
    status varchar(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'shipped'::character varying, 'completed'::character varying, 'cancelled'::character varying])::text[])))
)
WITH (oids = false);
ALTER TABLE ONLY public.orders ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.orders ALTER COLUMN user_id SET STATISTICS 0;
ALTER TABLE ONLY public.orders ALTER COLUMN total_price SET STATISTICS 0;
ALTER TABLE ONLY public.orders ALTER COLUMN status SET STATISTICS 0;
ALTER TABLE ONLY public.orders ALTER COLUMN created_at SET STATISTICS 0;
--
-- Structure for table order_items (OID = 16576) : 
--
CREATE TABLE public.order_items (
    id serial NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0))
)
WITH (oids = false);
ALTER TABLE ONLY public.order_items ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.order_items ALTER COLUMN order_id SET STATISTICS 0;
ALTER TABLE ONLY public.order_items ALTER COLUMN product_id SET STATISTICS 0;
ALTER TABLE ONLY public.order_items ALTER COLUMN quantity SET STATISTICS 0;
ALTER TABLE ONLY public.order_items ALTER COLUMN price SET STATISTICS 0;
--
-- Structure for table payments (OID = 16594) : 
--
CREATE TABLE public.payments (
    id serial NOT NULL,
    order_id integer,
    payment_method varchar(50),
    status varchar(50),
    amount numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT payments_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['credit_card'::character varying, 'paypal'::character varying, 'bank_transfer'::character varying])::text[]))),
    CONSTRAINT payments_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'successful'::character varying, 'failed'::character varying])::text[])))
)
WITH (oids = false);
ALTER TABLE ONLY public.payments ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.payments ALTER COLUMN order_id SET STATISTICS 0;
ALTER TABLE ONLY public.payments ALTER COLUMN payment_method SET STATISTICS 0;
ALTER TABLE ONLY public.payments ALTER COLUMN status SET STATISTICS 0;
ALTER TABLE ONLY public.payments ALTER COLUMN amount SET STATISTICS 0;
ALTER TABLE ONLY public.payments ALTER COLUMN created_at SET STATISTICS 0;
--
-- Data for table public.users (OID = 16503) (LIMIT 0,20)
--
INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (1, 'Иван Петров', 'ivan.petrov@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (2, 'Мария Смирнова', 'maria.smirnova@example.com', 'e99a18c428cb38d5f260853678922e03', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (3, 'Алексей Сидоров', 'alexey.sidorov@example.com', '098f6bcd4621d373cade4e832627b4f6', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (4, 'Елена Козлова', 'elena.kozlova@example.com', 'b59c67bf196a4758191e42f76670ceba', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (5, 'Дмитрий Васильев', 'dmitry.vasilev@example.com', 'e807f1fcf82d132f9bb018ca6738a19f', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (6, 'Анна Михайлова', 'anna.mikhailova@example.com', '3f0a42fc6c067d828a351a3f6d5f3b43', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (7, 'Сергей Новиков', 'sergey.novikov@example.com', '1d56a37fb6b08aa709fe90e12ca59e12', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (8, 'Ольга Павлова', 'olga.pavlova@example.com', '0d107d09f5bbe40cade3de5c71e9e9b7', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (9, 'Владимир Соколов', 'vladimir.sokolov@example.com', '7c6a180b36896a0a8c02787eeafb0e4c', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (10, 'Татьяна Федорова', 'tatyana.fedorova@example.com', '6c8349cc7260ae62e3b1396831a8398f', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (11, 'Павел Морозов', 'pavel.morozov@example.com', '8f14e45fceea167a5a36dedd4bea2543', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (12, 'Екатерина Орлова', 'ekaterina.orlova@example.com', '3c6e0b8a9c15224a8228b9a98ca1531d', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (13, 'Николай Крылов', 'nikolay.krylov@example.com', '98f13708210194c475687be6106a3b84', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (14, 'Светлана Белова', 'svetlana.belova@example.com', '14bfa6bb14875e45bba028a21ed38046', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (15, 'Артем Григорьев', 'artem.grigoriev@example.com', '4b227777d4dd1fc61c6f884f48641d02', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (16, 'Юлия Захарова', 'yulia.zakharova@example.com', '8e296a067a37563370ded05f5a3bf3ec', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (17, 'Григорий Иванов', 'grigoriy.ivanov@example.com', '45c48cce2e2d7fbdea1afc51c7c6ad26', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (18, 'Александра Егорова', 'alexandra.egorova@example.com', '6364d3f0f495b6ab9dcf8d3b5c6e0b01', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (19, 'Константин Лебедев', 'konstantin.lebedev@example.com', 'f7177163c833dff4b38fc8d2872f1ec6', '2025-02-27 19:40:52.918915');

INSERT INTO public.users (id, name, email, password_hash, created_at) OVERRIDING SYSTEM VALUE
VALUES (20, 'Виктория Богданова', 'viktoria.bogdanova@example.com', '17ef84d625c354d14c56e312f766f3c5', '2025-02-27 19:40:52.918915');

--
-- Data for table public.categories (OID = 16537) (LIMIT 0,15)
--
INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (1, 'Смартфоны');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (2, 'Ноутбуки');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (3, 'Наушники');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (4, 'Телевизоры');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (5, 'Игровые консоли');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (6, 'Фотоаппараты');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (7, 'Планшеты');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (8, 'Смарт-часы');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (9, 'Клавиатуры');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (10, 'Мыши');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (11, 'Принтеры');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (12, 'Мониторы');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (13, 'Видеокарты');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (14, 'Процессоры');

INSERT INTO public.categories (id, name) OVERRIDING SYSTEM VALUE
VALUES (15, 'Оперативная память');

--
-- Data for table public.products (OID = 16546) (LIMIT 0,32)
--
INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (1, 'iPhone 15', 'Смартфон Apple', 120000.00, 10, 1, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (2, 'Samsung Galaxy S23', 'Флагман Samsung', 110000.00, 8, 1, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (3, 'MacBook Pro 16', 'Ноутбук Apple', 250000.00, 5, 2, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (4, 'Dell XPS 15', 'Ноутбук Dell', 180000.00, 6, 2, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (5, 'AirPods Pro', 'Наушники Apple', 25000.00, 15, 3, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (6, 'Sony WH-1000XM5', 'Беспроводные наушники', 30000.00, 20, 3, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (7, 'LG OLED CX', 'Телевизор LG', 150000.00, 4, 4, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (8, 'PlayStation 5', 'Игровая консоль Sony', 70000.00, 10, 5, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (9, 'Xbox Series X', 'Игровая консоль Microsoft', 65000.00, 12, 5, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (10, 'Canon EOS R6', 'Фотоаппарат Canon', 160000.00, 4, 6, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (11, 'iPad Pro 12.9', 'Планшет Apple', 140000.00, 7, 7, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (12, 'Apple Watch Ultra', 'Смарт-часы Apple', 80000.00, 4, 8, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (13, 'Razer BlackWidow', 'Игровая клавиатура', 12000.00, 15, 9, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (14, 'Logitech MX Master 3', 'Беспроводная мышь', 10000.00, 18, 10, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (15, 'HP LaserJet Pro', 'Лазерный принтер', 25000.00, 10, 11, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (16, 'LG UltraFine 5K', 'Монитор LG 5K', 130000.00, 5, 12, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (17, 'NVIDIA RTX 4090', 'Игровая видеокарта', 250000.00, 3, 13, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (18, 'AMD Ryzen 9 7950X', 'Процессор AMD', 90000.00, 8, 14, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (19, 'Corsair Vengeance 32GB', 'ОЗУ DDR5 32GB', 18000.00, 10, 15, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (20, 'Samsung Odyssey G9', 'Игровой монитор 49"', 180000.00, 5, 12, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (21, 'ASUS ROG Phone 6', 'Игровой смартфон', 110000.00, 6, 1, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (22, 'GoPro Hero 11', 'Экшн-камера GoPro', 55000.00, 10, 6, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (23, 'Microsoft Surface Pro 9', 'Планшет Microsoft', 130000.00, 6, 7, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (24, 'Fitbit Versa 4', 'Смарт-часы Fitbit', 25000.00, 15, 8, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (25, 'Corsair K95 RGB', 'Игровая клавиатура', 15000.00, 12, 9, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (26, 'Razer DeathAdder', 'Игровая мышь', 7500.00, 15, 10, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (27, 'Brother HL-L2350DW', 'Лазерный принтер', 20000.00, 8, 11, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (28, 'Sony Bravia XR', 'Телевизор Sony', 160000.00, 10, 4, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (29, 'HyperX Cloud II', 'Игровая гарнитура', 12000.00, 18, 3, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (30, 'Bose QuietComfort 45', 'Беспроводные наушники', 32000.00, 8, 3, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (31, 'DJI Mini 3 Pro', 'Квадрокоптер DJI', 120000.00, 5, 6, '2025-02-27 19:47:36.578732');

INSERT INTO public.products (id, name, description, price, stock_quantity, category_id, created_at) OVERRIDING SYSTEM VALUE
VALUES (32, 'Alienware AW3423DW', 'Игровой монитор 34"', 140000.00, 7, 12, '2025-02-27 19:47:36.578732');

--
-- Data for table public.orders (OID = 16562) (LIMIT 0,20)
--
INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (5, 5, 180000.00, 'completed', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (6, 6, 70000.00, 'pending', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (7, 7, 55000.00, 'paid', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (8, 8, 75000.00, 'shipped', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (9, 9, 20000.00, 'completed', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (10, 10, 130000.00, 'pending', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (11, 11, 180000.00, 'paid', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (12, 12, 90000.00, 'completed', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (13, 13, 32000.00, 'cancelled', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (14, 14, 25000.00, 'shipped', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (15, 15, 7500.00, 'pending', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (16, 16, 140000.00, 'paid', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (17, 17, 12000.00, 'shipped', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (18, 18, 20000.00, 'cancelled', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (19, 19, 160000.00, 'completed', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (20, 20, 10000.00, 'pending', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (1, 1, 120000.00, 'pending', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (2, 2, 25000.00, 'paid', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (3, 3, 90000.00, 'shipped', '2025-02-27 20:48:28.196327');

INSERT INTO public.orders (id, user_id, total_price, status, created_at) OVERRIDING SYSTEM VALUE
VALUES (4, 4, 65000.00, 'cancelled', '2025-02-27 20:48:28.196327');

--
-- Data for table public.order_items (OID = 16576) (LIMIT 0,20)
--
INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (61, 1, 1, 1, 120000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (62, 2, 3, 1, 25000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (63, 3, 5, 2, 60000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (64, 4, 8, 1, 65000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (65, 5, 12, 1, 180000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (66, 6, 15, 2, 70000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (67, 7, 18, 1, 55000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (68, 8, 21, 3, 75000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (69, 9, 24, 1, 20000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (70, 10, 27, 2, 130000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (71, 11, 30, 1, 180000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (72, 12, 7, 1, 90000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (73, 13, 6, 1, 32000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (74, 14, 9, 1, 25000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (75, 15, 20, 1, 7500.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (76, 16, 10, 1, 140000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (77, 17, 11, 2, 12000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (78, 18, 12, 1, 20000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (79, 19, 13, 1, 160000.00);

INSERT INTO public.order_items (id, order_id, product_id, quantity, price) OVERRIDING SYSTEM VALUE
VALUES (80, 20, 14, 1, 10000.00);

--
-- Data for table public.payments (OID = 16594) (LIMIT 0,10)
--
INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (1, 1, 'credit_card', 'pending', 120000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (2, 2, 'paypal', 'successful', 25000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (3, 3, 'bank_transfer', 'failed', 60000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (4, 4, 'credit_card', 'pending', 65000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (5, 5, 'paypal', 'successful', 180000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (6, 6, 'bank_transfer', 'failed', 70000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (7, 7, 'credit_card', 'pending', 55000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (8, 8, 'paypal', 'successful', 75000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (9, 9, 'bank_transfer', 'failed', 20000.00, '2025-02-27 20:54:25.746489');

INSERT INTO public.payments (id, order_id, payment_method, status, amount, created_at) OVERRIDING SYSTEM VALUE
VALUES (10, 10, 'credit_card', 'pending', 130000.00, '2025-02-27 20:54:25.746489');

--
-- Definition for index users_pkey (OID = 16510) : 
--
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey
    PRIMARY KEY (id);
--
-- Definition for index users_email_key (OID = 16512) : 
--
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key
    UNIQUE (email);
--
-- Definition for index categories_pkey (OID = 16541) : 
--
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey
    PRIMARY KEY (id);
--
-- Definition for index categories_name_key (OID = 16543) : 
--
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key
    UNIQUE (name);
--
-- Definition for index products_pkey (OID = 16554) : 
--
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey
    PRIMARY KEY (id);
--
-- Definition for index products_category_id_fkey (OID = 16556) : 
--
ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey
    FOREIGN KEY (category_id) REFERENCES categories(id);
--
-- Definition for index orders_pkey (OID = 16568) : 
--
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey
    PRIMARY KEY (id);
--
-- Definition for index orders_user_id_fkey (OID = 16570) : 
--
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index order_items_pkey (OID = 16581) : 
--
ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey
    PRIMARY KEY (id);
--
-- Definition for index order_items_order_id_fkey (OID = 16583) : 
--
ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;
--
-- Definition for index order_items_product_id_fkey (OID = 16588) : 
--
ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey
    FOREIGN KEY (product_id) REFERENCES products(id);
--
-- Definition for index payments_pkey (OID = 16601) : 
--
ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey
    PRIMARY KEY (id);
--
-- Definition for index payments_order_id_fkey (OID = 16603) : 
--
ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;
--
-- Data for sequence public.users_id_seq (OID = 16502)
--
SELECT pg_catalog.setval('public.users_id_seq', 20, true);
--
-- Data for sequence public.categories_id_seq (OID = 16536)
--
SELECT pg_catalog.setval('public.categories_id_seq', 15, true);
--
-- Data for sequence public.products_id_seq (OID = 16545)
--
SELECT pg_catalog.setval('public.products_id_seq', 32, true);
--
-- Data for sequence public.orders_id_seq (OID = 16561)
--
SELECT pg_catalog.setval('public.orders_id_seq', 70, true);
--
-- Data for sequence public.order_items_id_seq (OID = 16575)
--
SELECT pg_catalog.setval('public.order_items_id_seq', 80, true);
--
-- Data for sequence public.payments_id_seq (OID = 16593)
--
SELECT pg_catalog.setval('public.payments_id_seq', 10, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
