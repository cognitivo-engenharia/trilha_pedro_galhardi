@echo off
set instance_id=i-094e3387cbb0ae2de
set region=us-east-1
set profile=automacaoec2

echo Escolha uma opcao:
echo 1 - Ligar a instancia EC2
echo 2 - Desligar a instancia EC2
set /p choice=Digite sua escolha (1 ou 2): 

if %choice%==1 (
    aws ec2 start-instances --instance-ids %instance_id% --region %region% --profile %profile%
    echo A instancia %instance_id% foi iniciada.

) else if %choice%==2 (
    aws ec2 stop-instances --instance-ids %instance_id% --region %region% --profile %profile%
    echo A instancia %instance_id% foi parada.

) 

pause
