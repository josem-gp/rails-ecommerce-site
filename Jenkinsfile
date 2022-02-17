pipeline {
    agent none

    environment {
		DOCKERHUB_CREDENTIALS=credentials('docker_hub_cred')
	}

    stage ('Start docker node via Ansible') {
        agent { label 'ansible_slave' } 
    }

    stages {
        stage ('Build and test the project') {
            agent { label 'linux_slave' } 
            stages {
                stage('Build') {
                    steps {
                        sh 'echo "$USER"'
                        sh 'docker build -t jgarciaportillo/rails_ecommerce_app:$BUILD_NUMBER .'
                    }
                }
                stage('Test') {
                    steps {
                        sh 'docker-compose run -e "RAILS_ENV=test" web rake db:create db:migrate'
                        sh 'docker-compose run -e "RAILS_ENV=test" web yarn install --ignore-engines'
                        sh 'docker-compose run -e "RAILS_ENV=test" web bundle exec rspec'
                    }
                }
                stage('Push') {
                    steps {
                        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                        sh 'docker push jgarciaportillo/rails_ecommerce_app:$BUILD_NUMBER'
                    }
                }
            }
            post {
                always {
                    sh 'docker logout'
                    sh 'docker rmi jgarciaportillo/rails_ecommerce_app:$BUILD_NUMBER'
                    junit(
                        allowEmptyResults: true,
                        testResults: '**/test-reports/*.xml'
                    )
                    cleanWs()     
                }
            }
        }
    }

    stage ('Stop docker node via Ansible') {
        agent { label 'ansible_slave' } 
    } 
}