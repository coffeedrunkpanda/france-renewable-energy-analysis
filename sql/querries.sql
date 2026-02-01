-- Group 1: The "Big Picture" (High-Level Trends)

-- 1. Total Energy Mix (Wind vs. Solar)
-- Total energy produced by Wind vs. Solar over the entire history of the dataset.

SELECT Source, Sum(Production) as Total_Production
FROM renewable
GROUP BY Source

-- 2. Yearly Production Growth (Excluding incomplete years) (Global)
-- Total production per year 2020-2024 (since 2025 does not contain december).
SELECT Year, Sum(Production)as Total_Production
FROM renewable
WHERE Year !=2025
GROUP BY Year

-- 3. Yearly Production Growth by Source
-- Total production per year by Source (Wind vs. Solar). Including 2025.
SELECT Year,Source,  Sum(Production) as Total_Production
FROM renewable
GROUP BY Year, Source


-- 4. Monthly Seasonality Check
-- Calculate the average production for each month (Jan, Feb, Mar...) across all years.
SELECT Month, Month_Name,  avg(Production) as Average_Production
FROM renewable
GROUP BY Month

-- 5. Top 3 Most productive months on average (global)
SELECT Month, Month_Name,  avg(Production) as Average_Production
FROM renewable
GROUP BY Month
ORDER BY Average_Production DESC
LIMIT 3 

-- 6. Bottom 3 Least productive months on average (global)
SELECT Month, Month_Name,  avg(Production) as Average_Production
FROM renewable
GROUP BY Month
ORDER BY Average_Production ASC
LIMIT 3 

-- 7. Highest production month within each season
-- Find the highest production months within each season (e.g. the best Winter month).

WITH MonthlyTotals AS (
    -- Step 1: Calculate total production per month for each season
    SELECT 
        Season,
        Month_Name,
        SUM(Production) AS Total_Production
    FROM 
        renewable
    GROUP BY 
        Season, Month_Name
),
RankedMonths AS (
    -- Step 2: Rank the months within each season by highest production
    SELECT 
        Season,
        Month_Name,
        Total_Production,
        RANK() OVER (PARTITION BY Season ORDER BY Total_Production DESC) as Rank_In_Season
    FROM 
        MonthlyTotals
)
-- Step 3: Select only the top-ranked month for each season
SELECT 
    Season, 
    Month_Name, 
    Total_Production
FROM 
    RankedMonths
WHERE 
    Rank_In_Season = 1;

-- 8. Lowest production month within each season
-- Find the lowest production months within each season (e.g. the worst Winter month).
WITH MonthlyTotals AS (
    -- Step 1: Calculate total production per month for each season
    SELECT 
        Season,
        Month_Name,
        SUM(Production) AS Total_Production
    FROM 
        renewable
    GROUP BY 
        Season, Month_Name
),
RankedMonths AS (
    -- Step 2: Rank the months within each season by highest production
    SELECT 
        Season,
        Month_Name,
        Total_Production,
        RANK() OVER (PARTITION BY Season ORDER BY Total_Production DESC) as Rank_In_Season
    FROM 
        MonthlyTotals
)
-- Step 3: Select only the top-ranked month for each season
SELECT 
    Season, 
    Month_Name, 
    Total_Production
FROM 
    RankedMonths
WHERE 
    Rank_In_Season = 3;

-- 9. Top 5 Months with Highest Production from 2020 to 2025
SELECT Year, Month_Name, SUM(Production) as Total_Production
FROM renewable
GROUP BY Month_Name, Year
ORDER BY Total_Production DESC
LIMIT 5

-- 10. Top 5 Months with Highest Solar Production from 2020 to 2025

WITH SolarEnergy AS (
SELECT *
FROM renewable
WHERE Source = "Solar"
)
SELECT Source, Year, Month_Name, SUM (Production) AS Total_Production
FROM SolarEnergy
GROUP BY Year, Month_Name
ORDER BY Total_Production DESC
LIMIT 5