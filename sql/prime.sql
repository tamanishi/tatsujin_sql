create table Digits (
    digit integer
)

create table Numbers (
    num integer
)

insert into Digits values(0);
insert into Digits values(1);
insert into Digits values(2);
insert into Digits values(3);
insert into Digits values(4);
insert into Digits values(5);
insert into Digits values(6);
insert into Digits values(7);
insert into Digits values(8);
insert into Digits values(9);

insert into Numbers (SELECT D1.digit + (D2.digit*10) + 1 AS seq FROM Digits D1 CROSS JOIN Digits D2 ORDER BY seq)

select
    num
from
    Numbers Dividend
where
    num > 1
    and not exists (
        select
            *
        from
            Numbers Divisor
        where
            Divisor.num <= Dividend.num / 2
            and Divisor.num <> 1
            and mod(Dividend.num, Divisor.num) = 0
    );