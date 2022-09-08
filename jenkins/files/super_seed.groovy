// http://job-dsl.herokuapp.com/
job('SuperSeed Job') {
  scm {
    git {
        remote {
            url('https://github.com/jabhishek87/jenkins-seed-jobs')
            credentials('jabhishek-github-pat')
        }
    }
  }
  steps {
    dsl {
      external('jobs/*.groovy')
      // default behavior
      // removeAction('IGNORE')
      removeAction('DELETE')
    }
  }
}