@echo off
chcp 65001 >nul
setlocal

echo ============================================
echo       智能盯盘系统 - 一键启动
echo ============================================
echo.

set VENV_PATH=%~dp0TradEnv
set PYTHON_EXE="%VENV_PATH%\python.exe"
set SERVER_EXE=d:\AI\MICC\tdx-api\web\server.exe

echo [步骤 1/3] 启动TDX服务器...
if exist "%SERVER_EXE%" (
    start "TDX Server" "%SERVER_EXE%"
    echo [OK] TDX服务器已启动
) else (
    echo [警告] 未找到 TDX 服务器: %SERVER_EXE%
)
echo 等待 3 秒...
ping -n 4 127.0.0.1 >nul
echo.

echo [步骤 2/2] 启动智能盯盘系统...
%PYTHON_EXE% -m streamlit run "%~dp0app.py" "--logger.level=error"

echo.

endlocal