<a href='https://github.com/Junwu0615/Platform Genesis'><img alt='GitHub Views' src='https://views.whatilearened.today/views/github/Junwu0615/Platform Genesis.svg'>

## *⭐ PG-Airflow-DAGs ⭐*

<br>

### *A.　Roadmap*

<details>
<summary><b><i>　Project Tree </i></b></summary>
<ul>

```bash
tree -I 'venv|.git|__pycache__|docs|logs|assets|kafka_data'
tree -d -I 'venv|.git|__pycache__|docs|logs|assets|kafka_data'

.
├── README.md
└── dags
    ├── OP_SQL.py
    ├── WF_AUTO_PARTITION.py
    ├── WF_A_DATASET.py
    ├── WF_B_DATASET.py
    ├── WF_CREATE_TABLE.py
    ├── WF_C_DATASET.py
    ├── __init__.py
    ├── configs
    │   ├── __init__.py
    │   ├── constants.py
    │   └── dag_config.py
    ├── sql
    │   ├── __init__.py
    │   ├── auto_partition
    │   │   ├── fact_production.sql
    │   │   ├── machine_status_logs.sql
    │   │   └── production_records.sql
    │   ├── dim_date.sql
    │   ├── dim_machine.sql
    │   ├── dim_product.sql
    │   ├── fact_machine_status.sql
    │   ├── fact_production.sql
    │   └── models
    │       ├── olap
    │       │   ├── dim_date.sql
    │       │   ├── dim_machine.sql
    │       │   ├── dim_product.sql
    │       │   ├── fact_machine_status.sql
    │       │   └── fact_production.sql
    │       └── oltp
    │           ├── machine.sql
    │           ├── machine_events.sql
    │           ├── machine_status_logs.sql
    │           ├── product.sql
    │           ├── production_orders.sql
    │           └── production_records.sql
    └── utils
        ├── __init__.py
        └── dag_tool.py
```

</ul>
</details>

<br><br><br>