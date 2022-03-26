pipeline {
    agent any

    stages {
        stage('Testing') {
            steps {
	sh '''
	  source ~/.bashrc
	  cd .
	   '''
            }
        }
    stage('Building') {
            steps {
	sh '''
	  pwd
	  bundle install
	  bundle exec jekyll build
	   '''
            }

        }
    }
}
