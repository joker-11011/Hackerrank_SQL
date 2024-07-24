WITH country_avg AS (
    SELECT c.country_name, COUNT(i.id) AS total_invoices, AVG(i.total_price) AS avg_amount
    FROM country c
    JOIN city ci ON c.id = ci.country_id
    JOIN customer cu ON ci.id = cu.city_id
    JOIN invoice i ON cu.id = i.customer_id
    GROUP BY c.country_name
),
overall_avg AS (
    SELECT AVG(total_price) AS avg_amount
    FROM invoice
)
SELECT country_name, total_invoices, ROUND(avg_amount, 6) AS avg_amount
FROM country_avg
WHERE avg_amount > (SELECT avg_amount FROM overall_avg)
ORDER BY country_name;
