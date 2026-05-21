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

<br>

### *B.　Dev Tools*
```bash
cd ../PG-Infrastructure/infra/docker-compose
make copy-dag
```

<br>

### *C.　Push Code*
- #### *c.1.　Manual => Not Recommended*
    ```bash
    # <語法格式版本>
    black --version
    # <語法格式檢查>
    black src/
    
    # 期望輸出
    # All done! ✨ 🍰 ✨
    # ?? files left unchanged.
    ```

- #### *c.2.　Auto => Recommended*
    ```bash
    # 全域設定 ( 一次性 )
        # 1. 透過 Ubuntu 系統套件管理員安裝 pipx
        sudo apt update && sudo apt install -y pipx
        
        # 2. pipx 自動配置環境變數路徑
        pipx ensurepath
        
        # 3. 用 pipx 安裝 pre-commit
        pipx install pre-commit
    
    # ⭐ 當前專案的 .pre-commit-config.yaml & pre-commit 工具正式綁定
    pre-commit install
    
    # ⭐ 強制檢查
    pre-commit run --all-files
    ```

<br>

### *D.　CI / CD*
```
* 傳統模式 (\docker-compose\.gitlab-ci.yml)
  模式 : 基於"流程"
  特點 : 
    須打包映像檔
    依賴制定腳本流程
    可兼顧卡控 play
    相對唯一事實
    安全性較低

* GitOps 模式 (\k8s\.gitlab-ci.yml)
  模式 : 基於"狀態"
  特點 : 
    不須打包映像檔
    不須定義 build & Deploy
    可兼顧卡控 play
    絕對唯一事實
    安全性極高
    完全不依賴維運團隊(開發維運實質上不分家)
```

<br><br><br>