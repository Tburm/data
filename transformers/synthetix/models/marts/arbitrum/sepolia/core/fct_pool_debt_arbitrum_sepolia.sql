SELECT
    ts,
    block_number,
    pool_id,
    collateral_type,
    debt
FROM
    {{ ref('core_vault_debt_arbitrum_sepolia') }}
ORDER BY
    ts
