
FROM envoyproxy/envoy-build-ubuntu:9400637f4aa0232465407447bfda0d3da13549fb
RUN cd /opt && \
    git clone https://github.com/envoyproxy/envoy.git && \
    cd /opt/envoy && \
    bazel --bazelrc=/dev/null build --jobs 10 -c opt //source/exe:envoy-static.stripped --define exported_symbols=enabled
