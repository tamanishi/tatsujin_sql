create table PopTbl2 (
    pref_name varchar(30), 
    sex varchar(1),
    population integer
);

insert into PopTbl2 (pref_name, sex, population) values('徳島','1',60);
insert into PopTbl2 (pref_name, sex, population) values('徳島','2',40);
insert into PopTbl2 (pref_name, sex, population) values('香川','1',100);
insert into PopTbl2 (pref_name, sex, population) values('香川','2',100);
insert into PopTbl2 (pref_name, sex, population) values('愛媛','1',100);
insert into PopTbl2 (pref_name, sex, population) values('愛媛','2',50);
insert into PopTbl2 (pref_name, sex, population) values('高知','1',100);
insert into PopTbl2 (pref_name, sex, population) values('高知','2',100);
insert into PopTbl2 (pref_name, sex, population) values('福岡','1',100);
insert into PopTbl2 (pref_name, sex, population) values('福岡','2',200);
insert into PopTbl2 (pref_name, sex, population) values('佐賀','1',20);
insert into PopTbl2 (pref_name, sex, population) values('佐賀','2',80);
insert into PopTbl2 (pref_name, sex, population) values('長崎','1',125);
insert into PopTbl2 (pref_name, sex, population) values('長崎','2',125);
insert into PopTbl2 (pref_name, sex, population) values('東京','1',250);
insert into PopTbl2 (pref_name, sex, population) values('東京','2',150);

select
    case
        when sex = '1' then '男'
        else '女'
    end as 性別,
    sum(population) as 全国,
    sum(
        case
            when pref_name = '徳島' then population
            else 0
        end
    ) as 徳島,
    sum(
        case
            when pref_name = '香川' then population
            else 0
        end
    ) as 香川,
    sum(
        case
            when pref_name = '愛媛' then population
            else 0
        end
    ) as 愛媛,
    sum(
        case
            when pref_name = '高知' then population
            else 0
        end
    ) as 高知,
    sum(
        case
            when pref_name in ('徳島', '香川', '愛媛', '高知') then population
            else 0
        end
    ) as 四国（再掲）
from
    PopTbl2
group by
    性別;