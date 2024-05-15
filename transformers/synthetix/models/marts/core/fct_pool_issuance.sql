WITH burns AS (
    SELECT
        block_timestamp AS ts,
        transaction_hash,
        pool_id,
        collateral_type,
        account_id,
        -1 * {{ convert_wei('amount') }} AS amount
    FROM
        {{ ref('core_usd_burned') }}
    ORDER BY
        block_timestamp DESC
),
mints AS (
    SELECT
        block_timestamp AS ts,
        transaction_hash,
        pool_id,
        collateral_type,
        account_id,
        {{ convert_wei('amount') }} AS amount
    FROM
        {{ ref('core_usd_minted') }}
    ORDER BY
        block_timestamp DESC
)
SELECT
    *
FROM
    burns
UNION ALL
SELECT
    *
FROM
    mints
ORDER BY
    ts DESC
