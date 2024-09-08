#!/bin/bash

# Informações Telegram
TOKEN="7195776728:AAHamEwzwFP49Ly0boGKCXMQ4Sure5TfklQ"  # Token do BOT
CHAT_IDS=("-4504149047")  # Lista de IDs do grupo 
URL="https://api.telegram.org/bot$TOKEN/sendMessage"  # URL da API do Telegram para enviar mensagens
LIMITE=40  # Limite de temperatura para que o alerta seja enviado

# Enviar mensagem para o Telegram
send_message() {
    local chat_id=$1  # ID do chat 
    local message=$2  # Texto
    curl -s -X POST $URL -d chat_id=$chat_id -d text="$message"  # Envia mensagem
}

# Obter a temperatura do CPU
get_cpu_temp() {
    
    sensors | grep 'Core 0' | awk '{print $3}' | sed 's/+//;s/°C//' 
}

while true; do 
   
    temp=$(get_cpu_temp)  # Chama a função da temperatura 
    
    message=$(printf "\nA temperatura atual é: %s°C" "$temp")  # Informa a temperatura atual
    
    for chat_id in "${CHAT_IDS[@]}"; do  # Itera sobre cada ID do grupo
        send_message "$chat_id" "$message"  # Envia a mensagem com a temperatura atual 

        # Verificar se a temperatura é maior que o limite e enviar alerta
        temp_usage=${temp%.*}  # Remove a parte decimal do valor
        
        if [ "$temp_usage" -gt "$LIMITE" ]; then  # Temperatura excede o limite?
            alert_message="Alerta! A temperatura do CPU está em $temp°C, que excede $LIMITE°C!" 
            send_message "$chat_id" "$alert_message"  # Envia a mensagem de alerta para o grupo
        fi
    done

    # Mostrar no terminal o que enviou no telegram
    echo -e "Mensagem enviada para o Telegram:\n$message"
    echo -e "$alert_message"

    # sleep 7200  # Pausa o script por 2 horas (7200 segundos) antes de repetir o loop
    sleep 7200

done
