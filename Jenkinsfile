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
		      sh '#!/bin/bash'
		      sh 'source "$HOME/.rvm/scripts/rvm"'
                      sh 'set -e'
                      sh 'which rvm'
                      sh 'rvm use --default 3.0.0'
                      sh 'which ruby'
                      sh 'which gem'
                      sh 'gem install jekyll bundler' 
                      sh 'bundle exec jekyll build' 
            }
        }
    }
}
