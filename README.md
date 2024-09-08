# Monitoramento de Temperatura da CPU com Bot no Telegram

Este projeto monitora a temperatura da CPU em sistemas Linux e envia alertas automáticos via Telegram utilizando chatbot. O monitoramento é feito a cada duas horas, e alertas são enviados quando a temperatura ultrapassa o limite de segurança de 100°C, evitando riscos de superaquecimento.

## Metodologia

- **Ferramentas Utilizadas**:
  - **Telegram CLI**: Para envio de mensagens automáticas no grupo "CPU Temperature - Linux".
  - **lm-sensors**: Para a medição da temperatura da CPU.

## Compilação e Execução

| Etapa               | Comando                        | Descrição                                             |
|---------------------|--------------------------------|-------------------------------------------------------|
| Tornar o script executável | `chmod +x monitor_cpu.sh`      | Dá permissão de execução ao arquivo `monitor_cpu.sh`. |
| Executar o script   | `./monitor_cpu.sh`             | Inicia o monitoramento da temperatura da CPU.         |

