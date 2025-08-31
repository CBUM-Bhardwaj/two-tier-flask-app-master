pipeline{
    
    agent { label "dev"};
    
    stages{
        stage("Code Clone"){
            steps{
               script{
                   clone("https://github.com/CBUM-Bhardwaj/two-tier-flask-app.git", "master")
               }
            }
        }
        // stage("Trivy File System Scan"){
        //     steps{
        //         script{
        //             trivy_fs()
        //         }
        //     }
        // }
        stage("Build Docker File"){
            steps{
                sh "docker build -t two-tier-flask-app ."
            }
        }
        // stage("Test"){
        //     steps{
        //         echo "Developer / Tester tests likh ke dega..."
        //     }
            
        // }
        stage("Push to Docker Hub"){
            steps{
                script{
                    docker_push("dockerHubCreds","two-tier-flask-app")
                }  
            }
        }
        stage("Deploy"){
            steps{
                sh "docker compose up -d --build flask-app"
            }
        }
    }
    post {
        always {
            echo "Cleaning up unused Docker resources..."
            sh "docker system prune -a -f"
        }
    }
}

