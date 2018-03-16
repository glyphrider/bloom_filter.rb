pipeline {
  agent { label 'docker-enabled' }

  stages {
    stage('Submodule') {
      steps {
        sh 'git submodule update --init --recursive'
      }
    }
    stage('Bundle') {
      steps {
        sh 'docker run --rm -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group --user $(id -u):$(id -g) -v bloom_filter_bundle:/usr/local/bundle --volumes-from=$(hostname) -w "${WORKSPACE}" -e HOME="${WORKSPACE}" library/ruby:2.3.6 bundle install'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run --rm -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group --user $(id -u):$(id -g) -v bloom_filter_bundle:/usr/local/bundle --volumes-from=$(hostname) -w "${WORKSPACE}" -e HOME="${WORKSPACE}" library/ruby:2.3.6 bundle exec rake'
      }
    }
  }
}
