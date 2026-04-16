WITH base AS (
    SELECT * FROM {{ ref('stg_breweries') }}
),

by_state AS (
    SELECT
        state,
        country,
        COUNT(*) AS brewery_count,
        ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
    FROM base
    WHERE state IS NOT NULL
    GROUP BY state, country
)

SELECT * FROM by_state
ORDER BY brewery_count DESC