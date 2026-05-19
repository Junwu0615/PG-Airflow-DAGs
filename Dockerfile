# 使用官方 Airflow 輕量版作為基礎映像檔
FROM apache/airflow:2.10.3-python3.12

# 切換為 root 權限以建立目錄與修改權限
USER root

RUN mkdir -p /opt/airflow/dags
COPY dags/ /opt/airflow/dags/

# 複製 requirements.txt 並將擁有者直接改成 airflow 用戶
COPY requirements.txt /opt/airflow/requirements.txt
RUN chown airflow:root /opt/airflow/requirements.txt

# 在執行 pip 之前，先切換回官方指定的 airflow 安全用戶
USER airflow

# 安裝自定義套件（此時是用 airflow 身分，不會觸發安全阻斷）
RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt