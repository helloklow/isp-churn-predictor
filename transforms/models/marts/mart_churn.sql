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
    churned

FROM base