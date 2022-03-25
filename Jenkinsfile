pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
		sh 'bundle exec jekyll build'
            }
        }
    }
}
