echo -e "\e[36m installing nginx \e[0m"
dnf install nginx -y
echo -e "\e[35m copying expence config file \e[0m"
cd /etc/nginx/default.d/expense.conf
echo -e "\e[34m removing older files \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[33m downloading frontend zip file \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[33m changing directory \e[0m"
cd /usr/share/nginx/html
echo -e "\e[33m unziping the file \e[0m"
unzip /tmp/frontend.zip
echo -e "\e[33m starting nginx server \e[0m"
systemctl enable nginx
systemctl start nginx
