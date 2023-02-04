create schema kc_gestion authorization mbfesfvm;

--Create vehicle table


create table kc_gestion.vehicle(

		vehicle_id varchar(50) not null, --PK
		license_plate varchar(128) not null,
		vehicle_model varchar(50) not null, --FK 
		vehicle_color_id varchar(50) NOT NULL, --FK 
		company_insurance_id varchar(50) NOT NULL, --FK 
		policy_id varchar(50) NOT NULL,
		vehicle_purchase_date date not null,
		vehicle_kilometer integer not null,
		vehicle_leave_date date null,
		constraint vehicle_PK primary key(vehicle_id)
		);
		
--Create insurance company table
	
create table kc_gestion.insurance_company(

		company_id varchar(50) not null, --PK
		company_name varchar(128) NOT NULL,
		company_details varchar(256) NULL,
		constraint insurance_company_PK primary key(company_id)
		);
	

--Create Color table
	
create table kc_gestion.color(

		color_id varchar(50) not null, --PK
		color_name varchar(128) NOT NULL,
		color_description varchar(128) null,
		constraint color_PK primary key(color_id)
		);
	

--Create Business group table
	
create table kc_gestion.business_group(

		business_group_id varchar(50) NOT NULL, --PK
		business_group_name varchar(255) NOT NULL,
		constraint business_group_PK primary key(business_group_id)
		);
	
--Create Brand table
	
create table kc_gestion.brand(

		brand_id varchar(50) NOT NULL, --PK
		business_group_id varchar(50) NOT NULL, --FK
		brand_name varchar(255) NOT null,
		constraint brand_PK primary key(brand_id)
		);
		
--Create Model table
	
create table kc_gestion.model(

		model_id varchar(50) NOT NULL, --PK 
		brand_id varchar(50) NOT NULL, --FK
		model_name varchar(255) NOT null,
		constraint model_PK primary key(model_id)
		);
	
--Create Revision table
	
create table kc_gestion.revision(

		revision_id varchar(50) NOT NULL, --PK 
		revision_date date NOT NULL, 
		amount real NOT NULL,
		currency_type varchar(20) NOT null, --FK
		km_status_revision integer NOT null,
		vehicle_id varchar(50) NOT null, --FK
		constraint revision_PK primary key(revision_id)
		);
	
--Create Currency table
	
create table kc_gestion.currency(

		currency_id varchar(20) NOT NULL, --PK 
		currency_name varchar(100) NOT NULL, 
		constraint currency_PK primary key(currency_id)
		);
		

--Add FK vehicles table
	
alter table kc_gestion.vehicle
add constraint vehicle_model_FK
foreign key (vehicle_model) references kc_gestion.model(model_id);

	
alter table kc_gestion.vehicle
add constraint vehicle_color_FK
foreign key (vehicle_color_id) references kc_gestion.color(color_id);


alter table kc_gestion.vehicle
add constraint vehicle_insurance_FK
foreign key (company_insurance_id) references kc_gestion.insurance_company(company_id);


--add FK Model Table

alter table kc_gestion.model
add constraint model_brand_FK
foreign key (brand_id) references kc_gestion.brand(brand_id);


--add FK Brand Table

alter table kc_gestion.brand
add constraint brand_business_group_FK
foreign key (business_group_id) references kc_gestion.business_group(business_group_id);
	
--add FK Revision Table

alter table kc_gestion.revision
add constraint revision_currency_FK
foreign key (currency_type) references kc_gestion.currency(currency_id);

alter table kc_gestion.revision
add constraint revision_vehicle_FK
foreign key (vehicle_id) references kc_gestion.vehicle(vehicle_id);




--Insert into  color table 

insert into kc_gestion.color 
(color_id, color_name, color_description)
values('100','Azul marino', ''),
('101','Rojo', ''),
('102','Celeste', ''),
('103','Blanco', 'mate'),
('104','Negro', ''),
('105','Amarillo', ''),
('106','Gris', 'claro, tono melange');


--Insert into  currency table 

insert into kc_gestion.currency
(currency_id, currency_name)
values('12304','EUR'),
('12305','USD'),
('12306','PNL'),
('12307','POUND'),
('12308','PESO ARGENTINO'),
('12309','SOLES'),
('12310','PESO MEXICANO');


--Insert into aseguradora table 

insert into kc_gestion.insurance_company
(company_id, company_name)
values('156','Mapfre'),
('157','Allianz'),
('158','Mutua Madrileña'),
('159','AXA'),
('160','Línea Directa'),
('161','Catalana Occidente'),
('162','Generali');

--Insert into gruop table 

insert into kc_gestion.business_group
(business_group_id, business_group_name)
values('3001','Grupo Renault-Nissan-Mitsubishi'),
('3002','Grupo Subaru'),
('3003','Grupo Suzuki'),
('3004','Grupo Ford'),
('3005','Grupo Volkswagen'),
('3006','Grupo Honda');

--Insert into brand table 

insert into kc_gestion.brand
(brand_id, brand_name, business_group_id)
values('1001','Ford', '3004'),
('1002','Subaru', '3002'),
('1003','Volkswagen', '3005'),
('1004','Renault', '3001'),
('1005','Audi', '3005'),
('1006','Suzuki', '3003');

--Insert into model table 

insert into kc_gestion.model
(model_id, brand_id, model_name)
values('1010','1001', 'Focus'),
('1020','1004', 'Clio'),
('1030','1005', 'A4'),
('1040','1002', 'Impreza'),
('1050','1003', 'Golf'),
('1060','1004', 'Megane');	


--Insert into model table 

insert into kc_gestion.vehicle
(vehicle_id, license_plate, vehicle_model, vehicle_color_id, company_insurance_id, policy_id, vehicle_purchase_date,
vehicle_kilometer)
values('33','4535KCH', '1010', '100','159', '51227397', '10/11/2012','154678'),
('34','3453HLK', '1060', '104','156', '99908668', '01/24/2018','51495'),
('35','3463JJW', '1040', '105','161', '33435022', '03/09/2019','59896'),
('36','8906JJW', '1030', '104','162', '60409736', '07/03/2017','106972'),
('37','7654KCH', '1010', '103','159', '86607285', '5/30/2015','77236'),
('38','1234JJW', '1020', '101','156', '34742975', '03/20/2020','27474'),
('41','8565DVW', '1030', '102','158', '91794872', '06/02/2022','22134'),
('42','6789KCH', '1050', '104','156', '66240669', '01/25/2023','2048'),
('43','6745HLK', '1060', '105','158', '81812417', '01/08/2013','160760');	

insert into kc_gestion.vehicle
(vehicle_id, license_plate, vehicle_model, vehicle_color_id, company_insurance_id, policy_id, vehicle_purchase_date,
vehicle_kilometer, vehicle_leave_date)
values ('39','5644KCH', '1010', '101','160', '40942253', '07/31/2016','256571', '01/01/2023'),
('40','5676JJW', '1040', '105','157', '11861518', '07/17/2009','179660', '01/01/2023');

--Insert into revision table 

insert into kc_gestion.revision
(revision_id, revision_date, amount, currency_type, km_status_revision, vehicle_id)
values('2020','12/18/2018', '1200', '12304','80000', '33'),
('2021','01/24/2020', '100', '12305','10000', '34'),
('2022','03/09/2021', '1400', '12306','30000', '35'),
('2023','07/03/2019', '3000', '12307','70000', '36'),
('2024','5/30/2018', '12500', '12308','25000', '37'),
('2025','03/20/2022', '9000', '12309','15500', '38'),
('2026','07/31/2019', '7000', '12310','30001', '39'),
('2027','12/18/2022', '1700', '12304','125510', '33'),
('2028','01/08/2022', '40000', '12308','135200', '43'),
('2029','01/24/2023', '800', '12305','50000', '34'),
('2030','5/30/2021', '70000', '12308','55000', '37');	