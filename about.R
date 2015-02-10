function(){
    tabPanel("About",
HTML("
    <p>shinyPhytools is a small interactive treeviewer to plot phylogenetic trees using the R
    packages phytools.</p>
    <p></p>

        <p>It is possible to run it from within R:</p>
        <p><code>shiny::runGitHub('shinyPhytools', 'KlausVigo')</code></p>
        <p>can launched also via the <a
    href='http://klash.shinyapps.io/shinyPhytools/'>RStudio server</a>.</p>
        <p>The source code shinyPhytools is on <a
    href='https://github.com/KlausVigo/shinyPhytools'>GitHub</a>. shinyPhytools
    is in early development so we are more than happy to recieve suggestions or bug reports. </p>

<p>Klaus & Liam</p>

        <p> </p>
        <p><strong>References</strong> </p>
        <p><a href='http://www.rstudio.com/shiny'>shiny</a></p>
        <p><a href='http://cran.r-project.org/web/packages/phytools/'>phytools</a></p>
        <p><a href='http://blog.phytools.org/'>phytools blog</a></p>
        <p></p>
        <p><strong>License</strong> </p>
        <p>shinyTreeViewer is licensed under the GPLv3. </p>
    ")
)}


