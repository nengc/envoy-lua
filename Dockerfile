
FROM envoyproxy/envoy-build-ubuntu:9400637f4aa0232465407447bfda0d3da13549fb

RUN cd /opt && \
    git clone https://github.com/envoyproxy/envoy.git
    
RUN cd /opt/envoy && \
    bazel build -c opt //source/exe:envoy-static --jobs 4 --define exported_symbols=enabled
