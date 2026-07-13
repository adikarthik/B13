pipeline { 
 agent any 
 stages { 
 stage('Checkout') { 
 steps { 
 git branch: 'master', 
 url: 'https://github.com/Deepa-Devops-2026/Jenkins-Workspace.git' 
 } 
 } 
 stage('Build WAR') { 
 steps { 
 sh 'mvn clean package' 
 } 
 } 
 stage('Deploy to Tomcat') { 
 steps { 
 sh ''' 
 if [ -d "/home/deepa/Desktop/Deepa/tomcat/apache-tomcat-9.0.117/webapps/Jenkins-Practice" ]; then 
 echo "Old deployment found." 
 echo "Deployment failed because previous build was not cleaned." 
 exit 1 
 fi 
 cp target/Jenkins-Practice.war /home/deepa/Desktop/Deepa/tomcat/apache-tomcat-9.0.117/webapps/ 
 echo "Deployment completed." 
 ''' 
 } 
 } 
 } 
 post { 
 success { 
 echo "Pipeline completed successfully." 
 } 
 failure { 
 echo "Pipeline failed." 
 } 
 } 
}
