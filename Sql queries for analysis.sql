-- lets see first wheather our data is properly imported or not
select * from data_analysis.vgsales limit 500; 

-- lets count how many data is presented in our tables
select count(*) from data_analysis.vgsales;

-- lets see the names of different genre available in our data
select distinct(genre) from data_analysis.vgsales;

-- check how many sales values are zero in european_sales column
select count(eu_sales) from data_analysis.vgsales where eu_sales=0;

-- for northern sales column
select count(na_sales) as Noofzeroesvalue from data_analysis.vgsales where na_sales=0;

-- let's see the Top 5 genre that have maximum sales over the years
select genre,round(sum(global_sales),2) as Totalsales from data_analysis.vgsales
group by genre
order by totalsales desc
limit 5;

-- lets see how many game released in a particular year
select year,count(name) as No_of_games_released 
from data_analysis.vgsales 
group by year 
order by year asc;

-- top 5 platform that highest global sales over the years
select platform,round(sum(global_sales),2) as TotalSales
from data_analysis.vgsales
group by platform
order by totalsales desc
limit 5;

-- top 5 publisher that have highest sales 
select publisher,round(sum(global_sales),2) as TotalSales
from data_analysis.vgsales
group by publisher
order by totalsales desc
limit 5;

-- lets check top 5 game genre are published most to know the trend
select genre, count(*) as No_of_games_released from data_analysis.vgsales 
group by genre
order by No_of_games_released desc limit 5;

-- Top 5 Number of games released for given genre to know the trend
select genre , count(*) as Noofgamesreleased from data_analysis.vgsales
group by genre
order by noofgamesreleased desc
limit 5;

-- Which platform had maximum games released on it
select platform,genre,count(*) as Noofgamereleased
from data_analysis.vgsales
group by platform
order by noofgamereleased
limit 5;

-- Top 5 publishers whose sales are hihgest as per region
select publisher,round(sum(na_sales),2) as NA_Total_sales,
round(sum(eu_sales),2) as EU_Total_sales,
round(sum(JP_sales),2) as JAPAN_Total_sales,
round(sum(other_sales),2) as Other_Total_sales,
round(sum(global_sales),2) as Global_Total_sales
from data_analysis.vgsales group by publisher 
order by 2 desc,3 desc, 4 desc, 5 desc
limit 5;

-- Which gaming platform had the maximum sales on which genre
select platform,genre,round(max(na_sales),2) as NA_maxsales,
round(max(eu_sales),2) as EU_maxsales,
round(max(JP_sales),2) as JAPAN_Total_sales,
round(max(other_sales),2) as Other_maxsales,
round(max(global_sales),2) as Global_maxsales
from data_analysis.vgsales group by platform 
order by 2 desc,3 desc, 4 desc, 5 desc
limit 5;


