drop database if exists jobs_countries_analysis;
create database jobs_countries_analysis;
use jobs_countries_analysis;

create table city (
id smallint not null auto_increment,
city_name varchar(50),
country_name varchar(50),
cost_of_living numeric(6,0), /*aproximately cost in USD dollars per month for 1 person*/
num_of_habitants numeric, /*by city*/
unemployment_rate decimal(3,2), 
primary key (id),
unique key (country_name)
);

create table jobs (
id smallint not null auto_increment,
job_name varchar(50),
primary key (id),
unique key (job_name)
);

create table careers (
id smallint not null auto_increment,
job_id smallint not null,
city_id smallint not null,
avg_salary numeric(7,2), /*Monthly*/
experience_level varchar(2),
primary key (id),
foreign key (job_id) references jobs (id),
foreign key (city_id) references city (id)
);

create table companies (
id smallint	not null auto_increment,
company_name varchar(20),
origin_country varchar(20),
primary key (id),
unique key (company_name)
);

create table skills (
id smallint not null auto_increment,
skill_name varchar(50),
primary key (id),
unique key (skill_name)
);

create table skills_req (
job_id smallint not null,
skill_id smallint not null,
company_id smallint not null,
foreign key (job_id) references jobs (id),
foreign key (company_id) references companies (id),
foreign key (skill_id) references skills (id)
);

insert into city (city_name, country_name, cost_of_living, num_of_habitants, unemployment_rate)
values ('Mexico City', 'Mexico', 1563, 22085000, '4.38'),
	   ('Toronto', 'Canada', 3123, 6313000, '7.51'),
       ('Oslo', 'Noruega', 3116, 1071000, '4.99'),
       ('Delhi', 'India', 1134, 32066000, '5.98'),
       ('Shanghai', 'China', 4506, 28517000, '4.82');

update city
set cost_of_living = '2813'
where id = 5;

update city
set cost_of_living = '753'
where id = 4;

insert into jobs (job_name)
values ('Business Analyst'), ('Data Analyst'), ('Finance Analyst');

insert into careers (job_id, city_id, avg_salary, experience_level)
values (1, 1, 1630.42, 'N2'), (1, 1, 3015.34, 'N3'), (1, 2, 4288.00, 'N2'),  (1, 2, 5467.20, 'N3'),
       (1, 3, 4918.43, 'N2'), (1, 3, 7016.74, 'N3'), (1, 4, 758.66, 'N2'), (1, 4, 1011.54, 'N3'),
       (1, 5, 1700.22, 'N2'), (1, 5, 3494.78, 'N3'), (2, 1, 1168.69, null), (2, 2, 4164.86, null), 
       (2, 3, 4889.38, null), (2, 4, 614.44, null), (2, 5, 2006.67, null), (3, 1, 1557.70, 'N2'), 
       (3, 1, 1985.67, 'N3'), (3, 2, 4207.20, 'N2'),  (3, 2, 6265.44, 'N3'), (3, 3, 5513.58, 'N2'), 
       (3, 4, 638.54, 'N2'), (3, 4, 745.85, 'N3'), (3, 5, 1992.95, 'N2');

insert into companies (company_name, origin_country)
values ('McKinsey & Company', 'United States'), ('Deloitte', 'United Kingdom'), ('Kearney', 'United States'), 
       ('Cisco Systems', 'United States'), ('Ericsson', 'Sweeden'), ('Oracle', 'United States');

insert into skills (skill_name)
values ('Analytical'), ('Communication'), ('Problem-Solving'), ('TeamWork'), 
       ('Comfort with ambiguous environments'), ('planning'),
       ('Story Making'), ('Customer Service'), ('English'), ('Logical Thinking'), 
       ('interpersonal'), ('Decision-Making Skills'), ('"Can Do" Attitude'), ('Time-Management'), 
       ('Drive to improve Process'), ('Interest of Modern IT Architecture and Deployment'),
       ('Develop Use Cases'), ('Attention to Details'), ('Project and Relationship management Skills'),
       ('independent');

insert into skills_req (job_id, skill_id, company_id)
values (1,20,1), (1,3,1), (1,4,1), (1,5,1), (1,2,1), (1,9,1), (1,1,1),
       (1,3,2), (1,15,2), (1,2,2), (1,20,2), (1,16,2), (1,1,2),
       (1,3,3), (1,1,3), (1,4,3), 
       (1,1,4), (1,3,4), (1,12,4), (1,8,4), (1,4,4), (1,2,4), (1,13,4), (1,14,4), (1,15,4),
       (1,17,5), (1,1,5), (1,15,5), (1,16,5), (1,8,5),
       (1,19,6), (1,4,6), (1,18,6), (1,1,6), (1,16,6), (1,14,6);