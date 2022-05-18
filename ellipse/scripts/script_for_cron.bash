#!/bin/bash

text_use=$(squeue)
curl -s -X POST https://api.telegram.org/bot5188652668:AAG2TOUXEmCbCjcMF9KdQzsTxzjPXOsYXps/sendMessage -d disable_notification=True -d parse_mode=HTML -d chat_id=583118411 -d text="$text_use"
