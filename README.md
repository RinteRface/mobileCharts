<!-- badges: start -->
<!-- badges: end -->

# mobileCharts

The goal of mobileCharts is to bring mobile friendly charts to [shinyMobile](https://rinterface.github.io/shinyMobile/) via [f2](https://f2.antv.vision/en).

## Installation

``` r
install.packages("remotes")
remotes::install_github("rinterface/mobileCharts")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mobileCharts)

mobile(iris, aes(Sepal.Length, Sepal.Width, color = Species)) %>% 
  mobile_point()
```

### shinyMobile

_refresh if you resize the screen_

```r
library(shiny)
library(shinyMobile)
library(mobileCharts)

ui <- f7Page(
  title = "mobileCharts",
  f7SingleLayout(
    navbar = f7Navbar(
      title = "mobileCharts",
      hairline = TRUE,
      shadow = TRUE
    ),
    f7Shadow(
      intensity = 16,
      f7Card(
        title = "Chart",
        mcOutput("mc", width = 400)
      )
    )
  )
)

server <- function(input, output){
  output$mc <- render_mobile({
    mobile(iris, aes(Sepal.Length, Sepal.Width, color = Species)) %>% 
      mobile_point()
  })
}

shinyApp(ui, server)
```
