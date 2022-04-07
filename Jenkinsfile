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
            steps{
                sh "${root} test ./... -cover"
            }
        }
        stage("Go Build"){
            steps{
                sh "${root} build ./..."
            }
        }
        stage("Docker"){
            steps{
                sh "docker build -t my-jenkins ."
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