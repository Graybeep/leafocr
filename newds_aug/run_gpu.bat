@echo off
REM Launch LeafOCR on the GPU (inside WSL Ubuntu). Then open http://localhost:7860
wsl -d Ubuntu --cd "%~dp0." -- bash run_gpu_wsl.sh
pause
