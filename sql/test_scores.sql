create table TestScores (
    student_id varchar(3),
    subject varchar(100),
    score integer,
    primary key(student_id, subject)
)

insert into TestScores (student_id, subject, score)values ('100', '算数', 100);
insert into TestScores (student_id, subject, score)values ('100', '国語', 80);
insert into TestScores (student_id, subject, score)values ('100', '理科', 80);
insert into TestScores (student_id, subject, score)values ('200', '算数', 80);
insert into TestScores (student_id, subject, score)values ('200', '国語', 95);
insert into TestScores (student_id, subject, score)values ('300', '算数', 40);
insert into TestScores (student_id, subject, score)values ('300', '国語', 90);
insert into TestScores (student_id, subject, score)values ('300', '社会', 55);
insert into TestScores (student_id, subject, score)values ('400', '算数', 80);

select
    distinct student_id
from
    TestScores T1
where
    not exists (
        select
            *
        from
            TestScores T2
        where
            T1.student_id = T2.student_id
            and T2.score < 50
    );

select
    distinct student_id
from
    TestScores T1
where
    not exists (
        select
            *
        from
            TestScores T2
        where
            T1.student_id = T2.student_id
            and (
                (
                    T2.subject = '算数'
                    and T2.score < 80
                )
                or (
                    T2.subject = '国語'
                    and T2.score < 50
                )
            )
    );

select
    distinct student_id
from
    TestScores T1
where
    subject in ('算数', '国語')
    and not exists (
        select
            *
        from
            TestScores T2
        where
            T1.student_id = T2.student_id
            and 1 = case
                when (
                    T2.subject = '算数'
                    and T2.score < 80
                ) then 1
                when (
                    T2.subject = '国語'
                    and T2.score < 50
                ) then 1
                else 0
            end
    );

select
    student_id,
    count(*)
from
    TestScores T1
where
    subject in ('算数', '国語')
    and not exists (
        select
            *
        from
            TestScores T2
        where
            T1.student_id = T2.student_id
            and 1 = case
                when (
                    T2.subject = '算数'
                    and T2.score < 80
                ) then 1
                when (
                    T2.subject = '国語'
                    and T2.score < 50
                ) then 1
                else 0
            end
    )
group by
    student_id
having
    count(*) = 2;