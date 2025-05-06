#!/bin/bash
# ecc_encrypt.sh - مولد مفتاح ECC وتشفير رسالة من اختيار المستخدم بأسلوب خيالي

echo -e "\e[1;34m[>>] Launching ECC Hyper-Encryption Engine...\e[0m"
sleep 1

read -p $'\e[1;36m[??] Enter your secret message to encrypt: \e[0m' user_message

if [ -z "$user_message" ]; then
  echo -e "\e[1;31m[!!] No message entered. Exiting...\e[0m"
  exit 1
fi

echo -e "\e[1;32m[*] Generating ECC keys...\e[0m"
sleep 1

openssl ecparam -name prime256v1 -genkey -noout -out ecc_private.key
openssl ec -in ecc_private.key -pubout -out ecc_public.pem

echo -e "\e[1;32m[*] Keys ready. Encrypting message...\e[0m"
sleep 1

# مؤثرات مرئية للتشفير
for i in {1..40}; do
    spin=$(echo "/ - \\ |" | cut -d' ' -f$(( (i % 4) + 1 )))
    echo -ne "\rEncrypting ultra payload [$spin]" && sleep 0.05
done

# تشفير الرسالة باستخدام base64 كمحاكاة بسيطة
echo "$user_message" | base64 > encrypted_message.txt

echo -e "\n\e[1;36m[+] Message encrypted and saved to encrypted_message.txt\e[0m"
