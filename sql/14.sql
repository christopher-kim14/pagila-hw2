/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */
SELECT
    extract(year FROM rental.rental_date) AS "Year",
    extract(month FROM rental.rental_date) AS "Month",
    sum(payment.amount) AS "Total Revenue"
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY ROLLUP (extract(year FROM rental.rental_date), extract(month FROM rental.rental_date))
ORDER BY "Year", "Month";
