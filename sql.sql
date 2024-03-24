UPDATE data
SET daily_vaccinations = COALESCE(
    (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY daily_vaccinations)
     FROM data AS d2
     WHERE d2.country = data.country
     AND d2.daily_vaccinations IS NOT NULL),
    0
)
WHERE daily_vaccinations IS NULL;
