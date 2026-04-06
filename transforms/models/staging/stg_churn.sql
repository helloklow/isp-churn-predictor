-- staging/stg_churn.sql
-- First transformation layer: clean and rename raw_churn table
-- Fixes typo in column name, casts data types, and flags nulls

SELECT
    id                                                  AS customer_id,
    is_tv_subscriber                                    AS has_tv,
    is_movie_package_subscriber                         AS has_movies,
    subscription_age                                    AS subscription_age,
    bill_avg                                            AS avg_bill,
    COALESCE(reamining_contract, 0)                     AS remaining_contract,
    CASE WHEN reamining_contract IS NULL THEN 1 ELSE 0 
        END                                             AS is_month_to_month,
    service_failure_count                               AS service_failures,
    download_avg                                        AS avg_download,
    upload_avg                                          AS avg_upload,
    download_over_limit                                 AS over_download_limit,
    churn                                               AS churned
FROM raw_churn