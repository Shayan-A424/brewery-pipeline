WITH source AS (
    SELECT * FROM {{ source('raw', 'RAW_BREWERIES') }}
),

deduped AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY loaded_at DESC) AS rn
    FROM source
),

cleaned AS (
    SELECT
        id,
        name,
        brewery_type,
        city,
        state_province AS state,
        country,
        TRY_CAST(longitude AS FLOAT) AS longitude,
        TRY_CAST(latitude AS FLOAT) AS latitude,
        website_url,
        loaded_at
    FROM deduped
    WHERE rn = 1
      AND id IS NOT NULL
      AND name IS NOT NULL
)

SELECT * FROM cleaned