job('ejemplo2-job-dsl') {
  description('job dsl de ejemplo')
  scm {
    git('https://github.com/macloujulian/jenkins.job.parametrizado.git') { node -> 
      node / gitConfigName('jorge')
      node / gitConfigEmail('pop@gmail.com')
    }
    parameters{
      stringParam('nombre', defaultValue= 'Jorge', description='Parametro de candena')
	  choiceParam('planeta', ['Mercurio','Venus','Tierra'])
      booleanParam('agente', false)
    } 
    triggers{
      cron('H/7 * * * *')
    }
    steps{
      shell("bash jobscript.sh")
    }
    
  }
}
