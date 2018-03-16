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
        sh 'docker run --rm -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group --user $(id -u):$(id -g) -v bloom_filter_${JOB_NAME}_${BUILD_NUMBER}:/usr/local/bundle --volumes-from=$(hostname) -w "${WORKSPACE}" -e HOME="${WORKSPACE}" library/ruby:2.5.0 bundle install'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run --rm -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group --user $(id -u):$(id -g) -v bloom_filter_${JOB_NAME}_${BUILD_NUMBER}:/usr/local/bundle --volumes-from=$(hostname) -w "${WORKSPACE}" -e HOME="${WORKSPACE}" library/ruby:2.5.0 bundle exec rake'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker volume rm bloom_filter_${JOB_NAME}_${BUILD_NUMBER}'
      }
    }
  }
}
