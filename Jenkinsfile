pipeline{
    agent any
    environment{
        branch = "master"
        scmUrl = "https://github.com/ayudiahpd/sample-go-jenkins.git"
        docker = "sample-go-docker"
    }
    stages{
        stage("Git Clone"){
            steps{
                git branch: "${branch}", url:"${scmUrl}"
            }
        }
        stage("Go Docker"){
            steps{
                sh "docker build -t ${docker}"
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