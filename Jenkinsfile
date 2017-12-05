node {
    def userCredentials = 'home_aws'
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "${userCredentials}",
                    usernameVariable: 'AWS_ACCESS_KEY', passwordVariable: 'AWS_SECRET_KEY']]) {
        // some block
        env.PATH = "/root/.local/bin/aws:${env.PATH}"
        println "path: ${env.PATH}"
        env.AWS_ACCESS_KEY_ID = "$AWS_ACCESS_KEY"
        env.AWS_SECRET_ACCESS_KEY = "$AWS_SECRET_KEY"

        println "current workspace: $workspace"
        def branch = null
        stage ('git checkout') {
            dir(workspace) {
                repoURL = scm.getUserRemoteConfigs()[0].getUrl()
                branch = scm.branches[0].name.replace("*/","").trim()
                println "branch: ${branch}"
                git url: repoURL, branch: branch
            }
        }
        stage ('plan simpsons') {
            parallel(
                canada: { 
                    dir ("$workspace/simpsons-ca") {
                        sh '~/bin/terraform init'
                        sh '~/bin/terraform plan'
                        sh 'aws --version'
                        // sh '~/bin/terraform apply -auto-approve'
                        // sh 'git add terraform.tfstate'
                        // sh 'git commit -am "terraform state file"'
                        // sh "git push origin $branch"
                    }
                },
                us: {
                    dir ("$workspace/simpsons-us") {
                        sh '~/bin/terraform init'
                        sh '~/bin/terraform plan'
                        // sh '~/bin/terraform apply -auto-approve'
                        // sh 'git add terraform.tfstate'
                        // sh 'git commit -am "terraform state file"'
                        // sh "git push origin $branch"
                    }
                }
            )
        }
    }
}