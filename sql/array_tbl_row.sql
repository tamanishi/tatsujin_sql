create table ArrayTblRow (
    key varchar(10),
    i integer,
    value integer,
    primary key (key, i)
)

insert into ArrayTblRow (key, i, value) values('A', 1, null);
insert into ArrayTblRow (key, i, value) values('A', 2, null);
insert into ArrayTblRow (key, i, value) values('A', 3, null);
insert into ArrayTblRow (key, i, value) values('A', 4, null);
insert into ArrayTblRow (key, i, value) values('A', 5, null);
insert into ArrayTblRow (key, i, value) values('A', 6, null);
insert into ArrayTblRow (key, i, value) values('A', 7, null);
insert into ArrayTblRow (key, i, value) values('A', 8, null);
insert into ArrayTblRow (key, i, value) values('A', 9, null);
insert into ArrayTblRow (key, i, value) values('A', 10, null);
insert into ArrayTblRow (key, i, value) values('B', 1, 3);
insert into ArrayTblRow (key, i, value) values('B', 2, null);
insert into ArrayTblRow (key, i, value) values('B', 3, null);
insert into ArrayTblRow (key, i, value) values('B', 4, null);
insert into ArrayTblRow (key, i, value) values('B', 5, null);
insert into ArrayTblRow (key, i, value) values('B', 6, null);
insert into ArrayTblRow (key, i, value) values('B', 7, null);
insert into ArrayTblRow (key, i, value) values('B', 8, null);
insert into ArrayTblRow (key, i, value) values('B', 9, null);
insert into ArrayTblRow (key, i, value) values('B', 10, null);
insert into ArrayTblRow (key, i, value) values('C', 1, 1);
insert into ArrayTblRow (key, i, value) values('C', 2, 1);
insert into ArrayTblRow (key, i, value) values('C', 3, 1);
insert into ArrayTblRow (key, i, value) values('C', 4, 1);
insert into ArrayTblRow (key, i, value) values('C', 5, 1);
insert into ArrayTblRow (key, i, value) values('C', 6, 1);
insert into ArrayTblRow (key, i, value) values('C', 7, 1);
insert into ArrayTblRow (key, i, value) values('C', 8, 1);
insert into ArrayTblRow (key, i, value) values('C', 9, 1);
insert into ArrayTblRow (key, i, value) values('C', 10,1);
insert into ArrayTblRow (key, i, value) values('D', 1, null);
insert into ArrayTblRow (key, i, value) values('D', 2, 9);
insert into ArrayTblRow (key, i, value) values('D', 3, null);
insert into ArrayTblRow (key, i, value) values('D', 4, null);
insert into ArrayTblRow (key, i, value) values('D', 5, null);
insert into ArrayTblRow (key, i, value) values('D', 6, null);
insert into ArrayTblRow (key, i, value) values('D', 7, null);
insert into ArrayTblRow (key, i, value) values('D', 8, null);
insert into ArrayTblRow (key, i, value) values('D', 9, null);
insert into ArrayTblRow (key, i, value) values('D', 10, null);
insert into ArrayTblRow (key, i, value) values('E', 1, null);
insert into ArrayTblRow (key, i, value) values('E', 2, 3);
insert into ArrayTblRow (key, i, value) values('E', 3, 1);
insert into ArrayTblRow (key, i, value) values('E', 4, 9);
insert into ArrayTblRow (key, i, value) values('E', 5, null);
insert into ArrayTblRow (key, i, value) values('E', 6, null);
insert into ArrayTblRow (key, i, value) values('E', 7, 9);
insert into ArrayTblRow (key, i, value) values('E', 8, null);
insert into ArrayTblRow (key, i, value) values('E', 9, null);
insert into ArrayTblRow (key, i, value) values('E', 10, null);

select
    distinct key
from
    arraytblrow ATR1
where
    not exists (
        select
            *
        from
            arraytblrow ATR2
        where
            ATR1.key = ATR2.key
            and (
                ATR2.value <> 1
                or ATR2.value is null
            )
    );

select
    distinct key
from
    arraytblrow ATR1
where
    1 = all(
        select
            value
        from
            arraytblrow ATR2
        where
            ATR1.key = ATR2.key
    );

select
    key
from
    arraytblrow ATR1
group by
    key
having
    sum(
        case
            when value = 1 then 1
            else 0
        end
    ) = 10;