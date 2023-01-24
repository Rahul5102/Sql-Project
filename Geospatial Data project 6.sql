create database Geospatial ;
use Geospatial ;
create table bc_roads(gid int,road_name varchar(100),the_geometric linestring);
alter table bc_roads rename column gid to unique_id ;
insert into bc_roads values (100,'mtm NH',(100 10,200 20));