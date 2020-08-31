FROM pandoc/ubuntu-latex:latest

# Install additional packages needed by Eisvogel
RUN apt-get update -qq && \
    apt-get install -y texlive-latex-extra curl && \
    tlmgr install adjustbox \
                  babel-german \
                  background \
                  bidi \
                  collectbox \
                  csquotes \
                  everypage \
                  filehook \
                  footmisc \
                  footnotebackref \
                  framed \
                  fvextra \
                  letltxmacro \
                  ly1 \
                  mdframed \
                  mweights \
                  needspace \
                  pagecolor \
                  sourcecodepro \
                  sourcesanspro \
                  titling \
                  ucharcat \
                  ulem \
                  unicode-math \
                  upquote \
                  xecjk \
                  xurl \
                  zref

ENTRYPOINT ["/usr/local/bin/pandoc", "--template", "eisvogel"]

# Install Eisvogel
ARG EISVOGEL_VERSION=latest
RUN curl -sL "https://github.com/Wandmalfarbe/pandoc-latex-template/releases/${EISVOGEL_VERSION}/download/Eisvogel.tar.gz" | tar -xzf - eisvogel.tex && \
    mkdir -p ~/.pandoc/templates && \
    mv eisvogel.tex ~/.pandoc/templates/eisvogel.latex

