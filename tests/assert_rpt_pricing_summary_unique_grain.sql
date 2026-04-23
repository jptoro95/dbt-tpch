-- Asserts that (return_status_code, order_line_status_code) is unique in rpt_pricing_summary.
-- Returns rows only when duplicates exist (test fails if any rows returned).
select
    return_status_code,
    order_line_status_code,
    count(*) as record_count
from {{ ref('rpt_pricing_summary') }}
group by 1, 2
having count(*) > 1
