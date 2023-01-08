create table Meetings (
    meeting varchar(100),
    person varchar(100)
)

insert into Meetings (meeting, person) values('第1回', '伊藤');
insert into Meetings (meeting, person) values('第1回', '水島');
insert into Meetings (meeting, person) values('第1回', '坂東');
insert into Meetings (meeting, person) values('第2回', '伊藤');
insert into Meetings (meeting, person) values('第2回', '宮田');
insert into Meetings (meeting, person) values('第3回', '坂東');
insert into Meetings (meeting, person) values('第3回', '水島');
insert into Meetings (meeting, person) values('第3回', '宮田');

select
    distinct M1.meeting,
    M2.person
from
    meetings M1
    cross join meetings M2;

select
    distinct M1.meeting,
    M2.person
from
    meetings M1
    cross join meetings M2
where
    not exists (
        select
            *
        from
            meetings M3
        where
            M1.meeting = M3.meeting
            and M2.person = M3.person
    );