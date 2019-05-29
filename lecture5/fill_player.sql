insert into player (id, nickname, email, password)  SELECT suffix, 'vasya' || '_' || suffix, 'vasya_' || suffix || '@tut.by', suffix FROM (SELECT  generate_series(1,10000000) as suffix) gen;

