
FROM envoyproxy/envoy-build-ubuntu:9400637f4aa0232465407447bfda0d3da13549fb

RUN cd /opt && \
    git clone https://github.com/envoyproxy/envoy.git
    
RUN cd /opt/envoy && \
    sudo bazel build //source/exe:envoy-static --jobs 2 --define exported_symbols=enabled
    
