create table Greatests (
    key varchar(1),
    x varchar(1),
    y varchar(1),
    z varchar(1),
    primary key (key)
)

insert into Greatests (key, x, y, z) values('A','1','2','3');
insert into Greatests (key, x, y, z) values('B','5','5','2');
insert into Greatests (key, x, y, z) values('C','4','7','1');
insert into Greatests (key, x, y, z) values('D','3','3','8');


select
    key,
    case
        when x > y then x
        else y
    end as greatest
from
    Greatests;

select
    key,
    case
        when 
        case when x > y then x
        else y end < z then z else 
        case when x > y then x else y
    end as greatest
from
    Greatests;

select
    case
        when key = 'B' then 1
        when key = 'A' then 2
        when key = 'D' then 3
        when key = 'C' then 4
        else 0
    end as number,
    key,
    x,
    y,
    z
from
    Greatests
order by
    number;

select
    key
from
    Greatests
order by
    case
        when key = 'B' then 1
        when key = 'A' then 2
        when key = 'D' then 3
        when key = 'C' then 4
        else 0
    end;