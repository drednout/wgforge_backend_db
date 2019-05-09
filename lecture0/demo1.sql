select * from software_version;
select * from software_version where name='postgresql';
select * from software_version where name='python';

select count(*) from software_version where name='python';
select name, count(*) from software_version group by name;
-- useful stack overflow article about versions comparison: https://dba.stackexchange.com/questions/74283/how-to-order-by-typical-software-release-versions-like-x-y-z
-- get latest version of postgresql
select * from software_version where name='postgresql' order by (string_to_array(version, '.')::int[])[1] DESC,  (string_to_array(version, '.')::int[])[2] DESC LIMIT 1 ;
