node ('master') {
  def JAVA_HOME = tool 'jdk8'
  def MVN_HOME = tool 'maven3'
  def scannerHome = tool 'runner29'
  def sonarProperties = [
    projectKey: "WW-ATG-MicroService-Report",
    projectName: "WW-ATG-MicroService-Report",
    projectVersion: '1.0',
    sources: './BannerService/src'    
]
  stage('Notify Stakeholders') {
    sh "echo Notifying stackholders is done && sleep 5"
  }
  stage('Preparation') {
    git url: 'http://sakthi:Sakthi123@10.145.64.176:80/git/atg/ATG-MicroServices'
  }
  stage('Verify Stage Preparation') {
    sh "echo Stage preparation is done && sleep 5"
  }
  stage('Unit Test and Code Quality') {
    timestamps {
      parallel (
        "Junit Test" : {
          sh "sleep 5 && cd ${workspace}/BannerService && echo Unit Test is done && sleep 5"
        },
        "Static Code Analysis" : {
		  sh "${scannerHome}/bin/sonar-scanner \
                                    -Dsonar.projectKey=${sonarProperties.projectKey} \
                                    -Dsonar.projectName=${sonarProperties.projectName} \
                                    -Dsonar.projectVersion=${sonarProperties.projectVersion} \
                                    -Dsonar.sources=${sonarProperties.sources}"
        }
      )
    }
  }
  stage('Intimate Code Quality status to developers') {
    sh "echo Stage preparation is done && sleep 5"
  }
  stage('Build Code') {
    sh "cd ${workspace}/BannerService && echo Build is successful && sleep 5"
  }
  stage('Docker Containerization') {
    sh "echo Containerization is done && sleep 5"
  }
  stage('Upload Artifacts') {
    sh "echo Deployment is done && sleep 5"
  }
  stage('Deploy docker container') {
    sh "echo Deployment is done && sleep 5"
  }
  stage('Update Release Notification') {
  }
}
