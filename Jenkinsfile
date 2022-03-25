pipeline {
    agent any

    stages {
        stage('Testing') {
            steps {
                sh 'pwd' 
            }
        }
    stage('Building') {
            steps {
		      sh 'echo "Hello from test"'
                      sh 'echo "Who I am $SHELL"'
		      sh 'export /var/lib/jenkins/gems/bin'
                      sh 'which bundle && which jekyll && bundle exec jekyll build' 
            }
        }
    }
}
