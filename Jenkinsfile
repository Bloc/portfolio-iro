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
    stage('Deploy') {
            steps {
	sh '''
	  scp -r -i ~/.ssh/id_rsa _site/* xortiz@localhost:apps/xavier-j-ortiz.github.io/_site
	   '''
            }
        }
    }
}
