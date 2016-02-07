library(markdown)
shinyUI(navbarPage("Money that you need to spend for your trip",
                   tabPanel("start",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("details (you need a trip with distance greater than 100 miles):"),
                                numericInput('dis', 'Dis:', 100, min = 100, max = 1000),
                                numericInput('cost', 'cost:', 3.8, min = 2, max = 4, step=0.01),
                                numericInput('gas', 'gas:', 50, min=, max=1000),
                                checkboxGroupInput('cyl', ' cyl:', c("4"=4, "6"=6, "8"=8), selected = c(4,6,8)),
                                sliderInput('disp', 'Disp', min=80, max=440, value=c(80,440), step=10),
                                sliderInput('hp', 'hp', min=60, max=300, value=c(60,300), step=10)
                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   ),
                   tabPanel("read",
                            mainPanel(
                              includeMarkdown("read.md")
                            )
                   )
)) 