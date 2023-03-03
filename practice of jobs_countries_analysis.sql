use jobs_countries_analysis;

select jo.job_name as 'Job Name', ci.city_name as 'City', ci.cost_of_living as 'Avg Cost of Living', ca.avg_salary as 'Avg Salary', ca.experience_level as 'Experience Level'
from careers ca
left join jobs jo on ca.job_id = jo.id
left join city ci on ca.city_id = ci.id;
/*on this we can see basically the information in a more generalized way*/

select jo.job_name as 'Job Name', ci.city_name as 'City', avg(ca.avg_salary) as 'Avg Salary'
from careers ca
left join jobs jo on ca.job_id = jo.id
left join city ci on ca.city_id = ci.id
group by jo.job_name, ci.city_name
order by avg(ca.avg_salary) desc
limit 10;
/*here we can detect the top 10 highest salaries, the city where they are located and the job name, 
Oslo is without a doubt the city with the highest salary followed by Toronto, 
Delhi does not appear even once*/

select ci.city_name as 'City', ci.cost_of_living as 'Avg Cost of Living', avg(ca.avg_salary) as 'Avg Salary'
from careers ca
left join city ci on ca.city_id = ci.id
group by ci.city_name, ci.cost_of_living;
/*here we can see how is the average salary by country and also the average cost of living, 
again we can say Oslo is the best since the cost of it is almost equal to Toronto, but the salary 
is higher it seems also that Delhi is a city that maybe you could struggle to live in,
Shanghai looks like is the worst one by the negative total, one of the reasons for this could be
that since this city is the biggest one in all China is making it expensive to live 
because there are a lot of people looking for a place to live, and they could end by offering more than normal,
rising the demand, could be the same for Delhi, and it seems is already happening in Mexico City but not as bad 
for the moment*/

select jo.job_name as 'Job Name', avg(ca.avg_salary) as 'Avg Salary'
from careers ca
left join jobs jo on ca.job_id = jo.id
group by jo.job_name
order by avg(ca.avg_salary) desc;
/*here we can see the 3 jobs that are in the database and their average salary for all the cities,
it seems Business Analyst is the most paid one, this could be because this job usually has requirements 
of the other 2 and can join some of these other worlds mixing it with their core activities
followed by Finance Analyst and then Data Analyst*/

select jo.job_name as 'Job Name', sk.skill_name as 'Skill Name', count(sk.skill_name) as 'Most Common Skills'
from skills_req ski
join jobs jo on ski.job_id = jo.id
join skills sk on ski.skill_id = sk.id
group by jo.job_name, sk.skill_name
order by count(sk.skill_name) desc;
/*here basically we can see the skills that were more popular within the companies of this database,
Analytical, Problem-Solving, and TeamWork are the most popular ones of all, which makes sense since this
opportunity for Business Analyst has to check data interpret information, find possible problems, and try 
to come up with ideas or solutions of how to improve processes or activities, this by a team since with it is
more probable can lead to a great idea of how to do so*/

/*I couldn't find a lot of programs on the job opportunities that are needed for this position to add them in the database,
probably is more important to find a candidate and then train them in the programs or apps 
that he or she could need to make the best performance, but with some data i saw looks like
is important to know how to present the data and generate dashboards, because with this the 
decision-making becomes easier since is more graphical,
it seems also depends on the company if they prefer Tableau or Power Bi, 
most of the cases can be whichever of these 2 but sometimes a companies would rather have one than the other*/

select ci.city_name as 'City', avg(ca.avg_salary) - ci.cost_of_living as 'Net Value'
from careers ca
left join city ci on ca.city_id = ci.id
group by ci.city_name, ci.cost_of_living;
/*here we can appreciate the difference in the salary against the cost of living by country, is to show in a better way
how these cities behave, being shanghai even a negative profit after the month, probably would be better to search for remote 
opportunity, having the salary of the city but living in a cheaper one.*/
