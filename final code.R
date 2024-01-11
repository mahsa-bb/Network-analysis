# Install and load required packages
install.packages("igraph")
install.packages("BiocManager")

BiocManager::install("RCy3", force = TRUE)

library(igraph)
library(RCy3)

# Function to create a random network
create_random_network <- function() {
set.seed(123)  # Set seed for reproducibility
g <- erdos.renyi.game(200, p = 0.05, directed = FALSE)
return(g)
   }

# Function to visualize a network in Cytoscape
visualize_network <- function(g) {
cy <- CytoscapeConnection(port=1234, host="localhost", openBrowser=TRUE)
createNetworkFromIgraph(g, "Random Network", collection="My Collection", overwrite=TRUE)
layoutNetwork(cy, "force-directed")
   }


# Function to compute and plot degree distribution
compute_degree_distribution <- function(g) {
degrees <- degree(g)
hist(degrees, main="Degree Distribution", xlab="Degree", ylab="Frequency")
   }

# Create and visualize a random network
random_network <- create_random_network()

#this code did not work "visualize_network(random_network)" so replaced
#Run the Cytoscape befor execute the command
createNetworkFromIgraph(igraph = g, networkName = "RandomNetwork", collection = "My Collection")
compute_degree_distribution(random_network)

