pipeline{
    agent any
    environment{
        root = "/usr/local/go/bin/go"
        branch = "master"
        scmUrl = "https://github.com/ayudiahpd/sample-go-jenkins.git"
    }
    stages{
        stage("Go Version"){
            steps{
                sh "${root} version"
            }
        }
        stage("Git Clone"){
            steps{
                git branch: "${branch}", url:"${scmUrl}"
            }
        }
        stage("Go Test"){
            agent { docker { image 'golang:alpine' } }
            steps{
                sh "${root} test ./... -cover"
            }
        }
        stage("Go Build"){
            agent { docker { image 'golang:alpine' } }
            steps{
                sh "${root} build ./..."
            }
        }
        
        stage('Docker') {         
            environment {
                // Extract the username and password of our credentials into "DOCKER_CREDENTIALS_USR" and "DOCKER_CREDENTIALS_PSW".
                // (NOTE 1: DOCKER_CREDENTIALS will be set to "your_username:your_password".)
                // The new variables will always be YOUR_VARIABLE_NAME + _USR and _PSW.
                // (NOTE 2: You can't print credentials in the pipeline for security reasons.)
                DOCKER_CREDENTIALS = credentials('sample-go-jenkins')
            }

            steps {                           
                // Use a scripted pipeline.
                script {
                    node {
                        def app

                        stage('Clone repository') {
                            checkout scm
                        }

                        stage('Build image') {                            
                            app = docker.build("docker-sample-go-jenkins")
                        }          
                    }                 
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
// node{
//     def root = "/usr/local/go/bin/go"

//     stage 'Checkout'
//     git url:'https://github.com/ayudiahpd/sample-go-jenkins.git'

//     stage 'preTest'
//     sh "${root} version"

//     stage 'Test'
//     sh "${root} test ./... -cover"

//     stage 'Build'
//     sh "${root} build ./..."
// }