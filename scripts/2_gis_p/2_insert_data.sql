-- transformer
insert into transformer (transformer_id, geom) values ('AA123456', 'POINT(100 100)');
insert into transformer (transformer_id, geom) values ('BB024689', 'POINT(125 125)');
insert into transformer (transformer_id, geom) values ('CC456780', 'POINT(450 450)');

-- primary_conductor
insert into primary_conductor (geom) values ('LINESTRING(0 0, 100 100, 200 200)');
insert into primary_conductor (geom) values ('LINESTRING(50 50, 125 125, 150 150)');

-- parcel
insert into parcel (geom) values ('POLYGON((0 0, 300 0, 300 300, 0 300, 0 0))');

-- verification
select count(*) as xfmr_count, '3' as expected_val from transformer;
select count(*) as pricond_count, '2' as expected_val from primary_conductor;
select count(*) as parcel_count, '1' as expected_val from parcel;
