# Generated by Neurodocker and Reproenv.

FROM debian:bullseye-slim
ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    ND_ENTRYPOINT="/neurodocker/startup.sh"


RUN export ND_ENTRYPOINT="/neurodocker/startup.sh" \
    && dpkg --add-architecture amd64 \
    && apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           binutils:amd64 \
           apt-utils \
           bzip2:amd64 \
           ca-certificates:amd64 \
           curl:amd64 \
           locales \
           unzip:amd64 \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG="en_US.UTF-8" \
    && chmod 777 /opt && chmod a+s /opt \
    && mkdir -p /neurodocker \
    && if [ ! -f "$ND_ENTRYPOINT" ]; then \
         echo '#!/usr/bin/env bash' >> "$ND_ENTRYPOINT" \
    &&   echo 'set -e' >> "$ND_ENTRYPOINT" \
    &&   echo 'export USER="${USER:=`whoami`}"' >> "$ND_ENTRYPOINT" \
    &&   echo 'if [ -n "$1" ]; then "$@"; else /usr/bin/env bash; fi' >> "$ND_ENTRYPOINT"; \
    fi \
    && chmod -R 777 /neurodocker && chmod a+s /neurodocker
ENV OS="Linux" \
    PATH="/opt/freesurfer-7.4.1/bin:/opt/freesurfer-7.4.1/fsfast/bin:/opt/freesurfer-7.4.1/tktools:/opt/freesurfer-7.4.1/mni/bin:$PATH" \
    FREESURFER_HOME="/opt/freesurfer-7.4.1" \
    FREESURFER="/opt/freesurfer-7.4.1" \
    SUBJECTS_DIR="/opt/freesurfer-7.4.1/subjects" \
    LOCAL_DIR="/opt/freesurfer-7.4.1/local" \
    FSFAST_HOME="/opt/freesurfer-7.4.1/fsfast" \
    FMRI_ANALYSIS_DIR="/opt/freesurfer-7.4.1/fsfast" \
    FUNCTIONALS_DIR="/opt/freesurfer-7.4.1/sessions" \
    FS_OVERRIDE="0" \
    FIX_VERTEX_AREA="" \
    FSF_OUTPUT_FORMAT="nii.gz" \
    MINC_BIN_DIR="/opt/freesurfer-7.4.1/mni/bin" \
    MINC_LIB_DIR="/opt/freesurfer-7.4.1/mni/lib" \
    MNI_DIR="/opt/freesurfer-7.4.1/mni" \
    MNI_DATAPATH="/opt/freesurfer-7.4.1/mni/data" \
    MNI_PERL5LIB="/opt/freesurfer-7.4.1/mni/share/perl5" \
    PERL5LIB="/opt/freesurfer-7.4.1/mni/share/perl5"
RUN apt-get update -qq \
    && apt-get install -y -q --no-install-recommends \
           bc:amd64 \
           ca-certificates:amd64 \
           libgomp1:amd64 \
           libxmu6:amd64 \
           libxt6:amd64 \
           perl \
           tcsh:amd64 \
    && rm -rf /var/lib/apt/lists/* \
    && echo "Downloading FreeSurfer ..." \
    && mkdir -p /opt/freesurfer-7.4.1 \
    && curl -fL https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.4.1/freesurfer-linux-centos7_x86_64-7.4.1.tar.gz \
    | tar -xz -C /opt/freesurfer-7.4.1 --owner root --group root --no-same-owner --transform='s,freesurfer/,,' \
         --exclude='average/mult-comp-cor' \
         --exclude='lib/cuda' \
         --exclude='lib/qt' \
         --exclude='subjects/V1_average' \
         --exclude='subjects/bert' \
         --exclude='subjects/cvs_avg35' \
         --exclude='subjects/cvs_avg35_inMNI152' \
         --exclude='subjects/fsaverage3' \
         --exclude='subjects/fsaverage4' \
         --exclude='subjects/fsaverage5' \
         --exclude='subjects/fsaverage6' \
         --exclude='subjects/fsaverage_sym' \
         --exclude='trctrain'
ENTRYPOINT ["/neurodocker/startup.sh"]

# Save specification to JSON.
RUN printf '{ \
  "pkg_manager": "apt", \
  "existing_users": [ \
    "root" \
  ], \
  "instructions": [ \
    { \
      "name": "from_", \
      "kwds": { \
        "base_image": "debian:bullseye-slim" \
      } \
    }, \
    { \
      "name": "env", \
      "kwds": { \
        "LANG": "en_US.UTF-8", \
        "LC_ALL": "en_US.UTF-8", \
        "ND_ENTRYPOINT": "/neurodocker/startup.sh" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "export ND_ENTRYPOINT=\\"/neurodocker/startup.sh\\"\\napt-get update -qq\\napt-get install -y -q --no-install-recommends \\\\\\n    apt-utils \\\\\\n    bzip2 \\\\\\n    ca-certificates \\\\\\n    curl \\\\\\n    locales \\\\\\n    unzip\\nrm -rf /var/lib/apt/lists/*\\nsed -i -e '"'"'s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/'"'"' /etc/locale.gen\\ndpkg-reconfigure --frontend=noninteractive locales\\nupdate-locale LANG=\\"en_US.UTF-8\\"\\nchmod 777 /opt && chmod a+s /opt\\nmkdir -p /neurodocker\\nif [ ! -f \\"$ND_ENTRYPOINT\\" ]; then\\n  echo '"'"'#!/usr/bin/env bash'"'"' >> \\"$ND_ENTRYPOINT\\"\\n  echo '"'"'set -e'"'"' >> \\"$ND_ENTRYPOINT\\"\\n  echo '"'"'export USER=\\"${USER:=`whoami`}\\"'"'"' >> \\"$ND_ENTRYPOINT\\"\\n  echo '"'"'if [ -n \\"$1\\" ]; then \\"$@\\"; else /usr/bin/env bash; fi'"'"' >> \\"$ND_ENTRYPOINT\\";\\nfi\\nchmod -R 777 /neurodocker && chmod a+s /neurodocker" \
      } \
    }, \
    { \
      "name": "env", \
      "kwds": { \
        "OS": "Linux", \
        "PATH": "/opt/freesurfer-7.4.1/bin:/opt/freesurfer-7.4.1/fsfast/bin:/opt/freesurfer-7.4.1/tktools:/opt/freesurfer-7.4.1/mni/bin:$PATH", \
        "FREESURFER_HOME": "/opt/freesurfer-7.4.1", \
        "FREESURFER": "/opt/freesurfer-7.4.1", \
        "SUBJECTS_DIR": "/opt/freesurfer-7.4.1/subjects", \
        "LOCAL_DIR": "/opt/freesurfer-7.4.1/local", \
        "FSFAST_HOME": "/opt/freesurfer-7.4.1/fsfast", \
        "FMRI_ANALYSIS_DIR": "/opt/freesurfer-7.4.1/fsfast", \
        "FUNCTIONALS_DIR": "/opt/freesurfer-7.4.1/sessions", \
        "FS_OVERRIDE": "0", \
        "FIX_VERTEX_AREA": "", \
        "FSF_OUTPUT_FORMAT": "nii.gz", \
        "MINC_BIN_DIR": "/opt/freesurfer-7.4.1/mni/bin", \
        "MINC_LIB_DIR": "/opt/freesurfer-7.4.1/mni/lib", \
        "MNI_DIR": "/opt/freesurfer-7.4.1/mni", \
        "MNI_DATAPATH": "/opt/freesurfer-7.4.1/mni/data", \
        "MNI_PERL5LIB": "/opt/freesurfer-7.4.1/mni/share/perl5", \
        "PERL5LIB": "/opt/freesurfer-7.4.1/mni/share/perl5" \
      } \
    }, \
    { \
      "name": "run", \
      "kwds": { \
        "command": "apt-get update -qq\\napt-get install -y -q --no-install-recommends \\\\\\n    bc \\\\\\n    ca-certificates \\\\\\n    curl \\\\\\n    libgomp1 \\\\\\n    libxmu6 \\\\\\n    libxt6 \\\\\\n    perl \\\\\\n    tcsh\\nrm -rf /var/lib/apt/lists/*\\necho \\"Downloading FreeSurfer ...\\"\\nmkdir -p /opt/freesurfer-7.4.1\\ncurl -fL https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.4.1/freesurfer-linux-centos7_x86_64-7.4.1.tar.gz \\\\\\n| tar -xz -C /opt/freesurfer-7.4.1 --owner root --group root --no-same-owner --transform='"'"'s,freesurfer/,,'"'"' \\\\\\n  --exclude='"'"'average/mult-comp-cor'"'"' \\\\\\n  --exclude='"'"'lib/cuda'"'"' \\\\\\n  --exclude='"'"'lib/qt'"'"' \\\\\\n  --exclude='"'"'subjects/V1_average'"'"' \\\\\\n  --exclude='"'"'subjects/bert'"'"' \\\\\\n  --exclude='"'"'subjects/cvs_avg35'"'"' \\\\\\n  --exclude='"'"'subjects/cvs_avg35_inMNI152'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage3'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage4'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage5'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage6'"'"' \\\\\\n  --exclude='"'"'subjects/fsaverage_sym'"'"' \\\\\\n  --exclude='"'"'trctrain'"'"'" \
      } \
    }, \
    { \
      "name": "entrypoint", \
      "kwds": { \
        "args": [ \
          "/neurodocker/startup.sh" \
        ] \
      } \
    } \
  ] \
}' > /.reproenv.json
# End saving to specification to JSON.
