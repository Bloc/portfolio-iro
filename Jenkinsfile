pipeline {
    agent { docker { image 'ruby:2.7-bullseye' } }
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
            }
        }
    }
}
