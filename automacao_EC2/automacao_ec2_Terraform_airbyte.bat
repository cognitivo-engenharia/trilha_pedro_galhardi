@echo off
set instance_id=i-043b904cd3f04edb5
set region=us-east-1
set profile=automacaoec2
set airbyte_dir=C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\ec2
set static_ip=98.83.95.12

echo Escolha uma opcao:
echo 1 - Ligar a instancia EC2 e iniciar o Airbyte
echo 2 - Desligar a instancia EC2
set /p choice=Digite sua escolha (1 ou 2): 

if %choice%==1 (
    aws ec2 start-instances --instance-ids %instance_id% --region %region% --profile %profile%
    echo A instancia Airbyte foi iniciada.

    echo Aguardando a instancia iniciar...
    :wait_loop
    set status=unknown
    for /f "tokens=*" %%i in ('aws ec2 describe-instances --instance-ids %instance_id% --region %region% --profile %profile% --query "Reservations[0].Instances[0].State.Name" --output text') do set status=%%i
    
    if "%status%"=="running" (
        echo A instancia está agora em execucao...
        
        echo O IP publico da instancia e: %static_ip%
        
        echo Iniciando o Docker...
        ssh -i C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\ec2\airbyte.pem ec2-user@%static_ip% "sudo systemctl start docker"
        
        echo Verificando se o Docker esta em execucao...
        ssh -i C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\ec2\airbyte.pem ec2-user@%static_ip% "sudo systemctl status docker"

        echo Docker iniciado. Iniciando o Airbyte...
        ssh -i C:\Users\pedro\OneDrive\Documentos\Terraform\vpc-terraform\ec2\airbyte.pem ec2-user@%static_ip% "cd airbyte/ && ./run-ab-platform.sh -b"
    ) else (
        timeout /t 20 > nul
        goto wait_loop
    )
) else if %choice%==2 (
    aws ec2 stop-instances --instance-ids %instance_id% --region %region% --profile %profile%
    echo A instancia %instance_id% foi parada.
) 

pause
