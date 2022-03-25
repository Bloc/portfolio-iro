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
                      sh 'bundle exec jekyll build' 
		      sh 'echo "Hello from test"'
                      sh 'echo "Who I am $SHELL"'
            }
        }
    }
}
