pipeline {
    agent any

    stages {
        stage('Testing') {
            steps {
	sh '''
	  cd .
	   '''
            }
        }
    stage('Building') {
            steps {
	sh '''
	  source ~/.bashrc
	  pwd
	  bundle install
	  bundle exec jekyll build
	   '''
            }

        }
    }
}
