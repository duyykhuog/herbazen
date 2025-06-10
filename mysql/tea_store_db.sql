create table if not exists admins
(
    admin_id int auto_increment
        primary key,
    username varchar(50)  not null,
    password varchar(255) not null,
    constraint username
        unique (username)
);

create table if not exists guest_orders
(
    order_id      int auto_increment
        primary key,
    name          varchar(100) charset utf8mb3 not null,
    phone         varchar(20)                  not null,
    address       tinytext                     not null,
    note          tinytext                     null,
    total         decimal(10, 2)               not null,
    create_date   datetime(6)                  not null,
    status        int                          null,
    date_received datetime(6)                  null,
    date_cancel   datetime(6)                  null,
    reason_cancel tinytext                     null
);

create table if not exists products
(
    product_id  int auto_increment
        primary key,
    name        varchar(100)                 not null,
    description tinytext                     null,
    price       decimal(10, 2)               not null,
    image_url   varchar(255)                 null,
    ingredient  varchar(255) charset utf8mb3 null,
    uses        varchar(255) charset utf8mb3 null,
    user_manual longtext                     null
);

create table if not exists guest_order_items
(
    order_item_id int auto_increment
        primary key,
    order_id      int            not null,
    product_id    int            not null,
    quantity      int            not null,
    price         decimal(10, 2) not null,
    constraint guest_order_items_ibfk_1
        foreign key (order_id) references guest_orders (order_id)
            on delete cascade,
    constraint guest_order_items_ibfk_2
        foreign key (product_id) references products (product_id)
);

create index order_id
    on guest_order_items (order_id);

create index product_id
    on guest_order_items (product_id);
