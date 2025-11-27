create database Inventorydb;
use Inventorydb;
create table product(
product_id int primary key auto_increment,
name varchar(50) not null ,
quantity int default 0 ,
price decimal(10,2) not null
);
DELIMITER //
create procedure AddProduct(
    in p_name varchar(50),
    in p_qty int,
    in p_price decimal(10,2)
)
begin 
    insert into  product (name, quantity, price)
    values (p_name, p_qty, p_price);
end//
DELIMITER ;

DELIMITER //
create procedure UpdateStock(
    in p_id int,
    in p_qty_change int
)
begin
    update product
    set quantity = quantity + p_qty_change
    where product_id = p_id;
end //
DELIMITER ;
DELIMITER //
create procedure GetProduct(
    in p_id int
)
begin
    select * from product where product_id = p_id;
end //
DELIMITER ;

call  AddProduct('Laptop', 10, 55000.00);
call AddProduct('Mouse', 50, 500.00);
call AddProduct('Keyboard', 20, 1200.00);
select * from product;
-- Add 5 laptops (product_id = 1)
call UpdateStock(1, 5);

-- Reduce 2 mice (product_id = 2)
call UpdateStock(2, -2);
call GetProduct(1);   -- Laptop details
call GetProduct(2);   -- Mouse 
select * from product;
