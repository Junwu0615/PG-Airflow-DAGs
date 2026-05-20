# 使用官方 Airflow 輕量版作為基礎映像檔
FROM apache/airflow:2.10.3-python3.12

# 切換為 root 權限以建立目錄與修改權限
USER root

# 先強制清空基礎映像檔裡可能殘留的所有舊 DAGs
# 確保接下來的 COPY 是在一個絕對純淨、空白的畫布上進行
RUN mkdir -p /opt/airflow/dags && rm -rf /opt/airflow/dags/*

# 將本地乾淨的 dags 複製進去（本地有N個，映像檔裡就有N個）
COPY dags/ /opt/airflow/dags/

RUN echo "=== 檢查目前映像檔內的 DAG 檔案清單 ===" && \
    ls -la /opt/airflow/dags && \
    echo "==================================================" \

# 確保所有複製進去的 DAG 檔案擁有者都是 airflow 使用者，防止權限出包
RUN chown -R airflow:root /opt/airflow/dags

# 複製 requirements.txt 並將擁有者直接改成 airflow 用戶
COPY requirements.txt /opt/airflow/requirements.txt
RUN chown airflow:root /opt/airflow/requirements.txt

# 在執行 pip 之前，先切換回官方指定的 airflow 安全用戶
USER airflow

# 安裝自定義套件（此時是用 airflow 身分，不會觸發安全阻斷）
RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt