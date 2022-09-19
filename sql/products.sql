create table Products (
    name varchar(30),
    price integer,
    primary key (name)
);

insert into
    Products (name, price)
values
    ('りんご', 100);

insert into
    Products (name, price)
values
    ('みかん', 50);

insert into
    Products (name, price)
values
    ('バナナ', 80);

select
    p1.name as name_1,
    p2.name as name_2
from
    Products p1
    cross join Products p2
where
    (p1.name, p2.name) not in (
        select
            p1.name as name_1,
            p2.name as name_2
        from
            Products p1
            inner join Products p2 on p1.name > p2.name
    );

select
    p1.name as name_1,
    p2.name as name_2
from
    Products p1
    inner join Products p2 on p1.name >= p2.name;