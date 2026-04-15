WITH base AS (
    SELECT * FROM {{ ref('stg_churn') }}
)

SELECT
    customer_id,
    has_tv,
    has_movies,
    subscription_age,
    avg_bill,
    remaining_contract,
    service_failures,
    avg_download,
    avg_upload,
    over_download_limit,
    is_month_to_month,
    churned,

    -- Engineered features
    has_tv + has_movies                                    AS addon_count,
    ROUND(avg_download / NULLIF(avg_upload, 0), 2)        AS download_upload_ratio,
    CASE WHEN avg_bill = 0 THEN 1 ELSE 0 END              AS is_zero_bill

FROM base