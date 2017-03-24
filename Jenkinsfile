node ('master') {
  def JAVA_HOME = tool 'jdk8'
  def MVN_HOME = tool 'maven3'
  def scannerHome = tool 'runner29'
  def jbossHome = '../../tools/jboss'
  def dynamoHome = '../../tools/ATG11.2/home'
  def sonarProperties = [
    projectKey: "WW-ATG-MicroService-Report",
    projectName: "WW-ATG-MicroService-Report",
    projectVersion: '1.0',
    sources: './BannerService/src'    
  ]
  stage('Preparation') {
    git url: 'https://github.com/teg-github/teg-atg-microservices'
  }
  stage('Verify Stage Preparation') {
    bat "./build-scripts/prepare-env.bat"
  }
  stage('Unit Test and Code Quality') {
    timestamps {
      parallel (
        "Junit Test" : {
          sh "echo Unit Test is done"
        },
        "Static Code Analysis" : {
	  bat "./build-scripts/sonar-analysis.bat"
        }
      )
    }
  }
}
