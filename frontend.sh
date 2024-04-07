log_file=/tmp/expense.log
color="\e[35m"
echo -e "${color} installing nginx \e[0m"
dnf install nginx -y &>>$log_file
if [ $? -eq]; then
  echo -e "\e[32m Success \e[0m"
else
  echo -e "\e[31m FAIL \e[0m"
fi
echo -e "${color} copying expence config file \e[0m"
cd /etc/nginx/default.d/expense.conf &>>$log_file
echo -e "${color} removing older files \e[0m"
rm -rf /usr/share/nginx/html/* &>>$log_file
echo -e "${color} downloading frontend zip file \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>$log_file
echo -e "${color}changing directory \e[0m"
cd /usr/share/nginx/html &>>$log_file
echo -e "${color} unziping the file \e[0m"
unzip /tmp/frontend.zip &>>$log_file
echo -e "${color} starting nginx server \e[0m"
systemctl enable nginx &>>$log_file
systemctl start nginx &>>$log_file
