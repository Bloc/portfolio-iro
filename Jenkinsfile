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
		sshagent(credentials: ['18c89dce-f6d2-490d-854c-27c06a9d92b5']) {
		  sh '''
	  	  scp -r -i ~/.ssh/id_rsa _site/* xortiz@localhost:apps/xavier-j-ortiz.github.io/_site
		  sudo systemctl reload nginx
	   	  '''
            }
	    }
        }
    }
}
