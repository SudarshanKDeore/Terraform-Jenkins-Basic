pipeline {
    agent any
    
    parameters {
        string(name: 'AWS_REGION', defaultValue: 'us-east-1', description: 'AWS Region')
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/SudarshanKDeore/Terraform-Jenkins-Basic.git']]

                )
            }
        }
    
    
         stage('Run Script Securely') {
            steps {
                script {
                    sh 'chmod +x list-ec2.sh'

                    withCredentials([usernamePassword(
                        credentialsId: 'aws-creds',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )]) {

                        sh """
                            export AWS_DEFAULT_REGION=${params.AWS_REGION}
                            ./list-ec2.sh
                        """
                    }
                }
            }
        }
    }
}
