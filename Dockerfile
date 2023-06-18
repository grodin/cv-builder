FROM ghcr.io/grodin/tinytex-base:latest

USER root

RUN apt-get update && \
	apt-get install -y \
	mercurial && \
	apt-get clean

USER latex-user

RUN "${HOME}"/bin/tlmgr install xifthen \
     fontawesome5 \
     titlesec \
     ifmtarg \
     colortbl \
     enumitem \
     xtab \
     wrapfig \
     changepage \
     microtype \
     pgf \
     fancyhdr \
     tabto-ltx

ENV PATH="${PATH}:/home/latex-user/bin"

WORKDIR /data

ENTRYPOINT ["latexmk","-pvc"]
