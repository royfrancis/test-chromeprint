# test-chromeprint

Build

```bash
# to build locally on m2 mac
docker build --platform=linux/amd64 -t ghcr.io/royfrancis/test-chromeprint:v1 .
docker push ghcr.io/royfrancis/test-chromeprint:v1
```

Run

```bash
# render rmd to html
docker run --rm --platform=linux/amd64 -u $(id -u ${USER}):$(id -g ${USER}) -v ${PWD}:/rmd ghcr.io/royfrancis/test-chromeprint:v1 Rscript -e "rmarkdown::render('index.Rmd')"

# convert html to pdf
docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v ${PWD}:/rmd ghcr.io/royfrancis/test-chromeprint:v1 Rscript -e "pagedown::chrome_print('index.html',extra_args=c('--no-sandbox','--disable-dev-shm-usage','--disable-gpu'));"
```
