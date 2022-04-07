node{
    def root = tool type:'go', name:'Go 1.15'

    withEnv(["GOROOT=${root}", "PATH+GO=${root}/bin"]){
        stage 'Checkout'
        git url:'https://github.com/ayudiahpd/sample-go-jenkins.git'

        stage 'preTest'
        sh 'go version'

        stage 'Test'
        sh 'go test -cover'

        stage 'Build'
        sh 'go build .'
        
        stage 'Deploy'
    }

}