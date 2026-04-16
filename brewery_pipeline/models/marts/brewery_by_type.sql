WITH base AS (
    SELECT * FROM {{ ref('stg_breweries') }}
),

by_type AS (
    SELECT
        brewery_type,
        COUNT(*) AS brewery_count,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS type_rank
    FROM base
    WHERE brewery_type IS NOT NULL
    GROUP BY brewery_type
)

SELECT * FROM by_type
ORDER BY type_rank