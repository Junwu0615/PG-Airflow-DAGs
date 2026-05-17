import os, pytest
from airflow.models import DagBag


def test_dag_loading_and_integrity():
    """
    通用測試：檢查所有 DAG 是否能被 Airflow 正常載入，且沒有語法錯誤、循環依賴
    """
    # 1. 讓 DagBag 去讀取 dags 目錄
    dag_path = os.path.join(os.path.dirname(__file__), "..", "dags")

    # 載入該目錄下的所有 DAG
    dagbag = DagBag(dag_folder=dag_path, include_examples=False)

    # 2. 檢查是否有任何載入失敗的錯誤 (import_errors)
    # 任何 DAG 因為語法錯誤、缺少套件、Typo 導致 Airflow 載入失敗 => 直接報錯並印出細節
    assert len(dagbag.import_errors) == 0, f"DAG 載入失敗錯誤日記: {dagbag.import_errors}"