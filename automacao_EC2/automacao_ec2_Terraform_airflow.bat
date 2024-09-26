@echo off
set instance_id=i-09084b5b84bb53f43
set region=us-east-1
set profile=automacaoec2
set airbyte_dir=C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\airflow
set static_ip=98.84.217.189

echo Escolha uma opcao:
echo 1 - Ligar a instancia EC2 e iniciar o Airflow
echo 2 - Desligar a instancia EC2
set /p choice=Digite sua escolha (1 ou 2): 

if %choice%==1 (
    aws ec2 start-instances --instance-ids %instance_id% --region %region% --profile %profile%
    echo A instancia Airflow foi iniciada.

    echo Aguardando a instancia iniciar...
    :wait_loop
    set status=unknown
    for /f "tokens=*" %%i in ('aws ec2 describe-instances --instance-ids %instance_id% --region %region% --profile %profile% --query "Reservations[0].Instances[0].State.Name" --output text') do set status=%%i
    
    if "%status%"=="running" (
        echo A instancia está agora em execucao...
        
        echo O IP publico da instancia e: %static_ip%
        
        echo Iniciando o Airflow...
        
        echo Inicializando o banco de dados do Airflow...
        ssh -i C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\airflow\airflow.pem ec2-user@%static_ip% "cd airflow/ && airflow db init"
        
        echo Iniciando o servidor web do Airflow...
        ssh -i C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\airflow\airflow.pem ec2-user@%static_ip% "cd airflow/ && airflow webserver -D" 
        
        echo Iniciando o scheduler do Airflow...
        ssh -i C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\airflow\airflow.pem ec2-user@%static_ip% "cd airflow/ && airflow scheduler -D"
    ) else (
        timeout /t 20 > nul
        goto wait_loop
    )
) else if %choice%==2 (
    aws ec2 stop-instances --instance-ids %instance_id% --region %region% --profile %profile%
    echo A instancia %instance_id% foi parada.
) 

pause
