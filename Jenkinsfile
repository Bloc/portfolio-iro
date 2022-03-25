pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
		sh 'ls -lath ~ && /home/xortiz/gems/bin/bundle exec jekyll build'
            }
        }
    }
}
