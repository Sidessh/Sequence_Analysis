
BiocManager::install("seqinr")
library(shiny)
library(Biostrings)
library(seqinr)



# UI
ui <- fluidPage(
  titlePanel("Bioinformatics Sequence Analysis"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload FASTA File")
    ),
    mainPanel(
      h4("Sequence Information:"),
      verbatimTextOutput("sequenceInfo"),  # Display sequence information
      h4("Nucleotide Count:"),
      verbatimTextOutput("count"),
      plotOutput("nucleotidePlot"),
      br()

    )
  )
)

# Server
server <- function(input, output) {
  # Read uploaded FASTA file
  data <- reactive({
    req(input$file)
    inFile <- input$file
    if (is.null(inFile)) return(NULL)
    fasta <- readDNAStringSet(inFile$datapath)
    return(fasta)
  })
  
  # Perform nucleotide count
  output$count <- renderPrint({
    data_seq <- data()
    if (!is.null(data_seq)) {
      nucleotide_count <- table(unlist(strsplit(as.character(data_seq), "")))
      return(nucleotide_count)
    }
  })
  
  # Plot nucleotide frequency
  output$nucleotidePlot <- renderPlot({
    data_seq <- data()
    if (!is.null(data_seq)) {
      nucleotide_count <- table(unlist(strsplit(as.character(data_seq), "")))
      barplot(nucleotide_count, main = "Nucleotide Frequency", 
              xlab = "Nucleotide", ylab = "Count", col = "blue")
    }
  })
  
  # Display sequence information
  output$sequenceInfo <- renderPrint({
    data_seq <- data()
    if (!is.null(data_seq)) {
      # Returning the sequence in raw text format
      return(as.character(data_seq[[1]]))
    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)

