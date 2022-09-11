create table StudentClub (
    std_id varchar(3),
    club_id varchar(1),
    club_name varchar(100),
    main_club_flg varchar(1),
    primary key (std_id, club_id)
)

insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('100','1','野球','Y');
insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('100','2','吹奏楽','N');
insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('200','2','吹奏楽','N');
insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('200','3','バドミントン','Y');
insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('200','4','サッカー','N');
insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('300','4','サッカー','N');
insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('400','5','水泳','N');
insert into StudentClub (std_id, club_id, club_name, main_club_flg) values('500','6','囲碁','N');

SELECT
    std_id,
    CASE
        WHEN COUNT(*) = 1 --1 つのクラブに専念する学生の場合
        THEN MAX(club_id) -- MAX()は明示的にユニークにするためか
        ELSE MAX( -- MAX()は明示的にユニークにするためか
            CASE
                WHEN main_club_flg = 'Y' THEN club_id
                ELSE NULL
            END
        )
    END AS main_club
FROM
    StudentClub
GROUP BY
    std_id;
