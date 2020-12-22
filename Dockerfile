
FROM envoyproxy/envoy-build-ubuntu:9400637f4aa0232465407447bfda0d3da13549fb

RUN cd /opt && \
    git clone https://github.com/envoyproxy/envoy.git
RUN cd /opt/envoy &&  \
    #bazel build --jobs=2 //source/exe:envoy-static --define exported_symbols=enabled
    bazel build //source/exe:envoy-static --define exported_symbols=enabled --config=remote-clang \
    --remote_cache=grpcs://remotebuildexecution.googleapis.com \
    --remote_executor=grpcs://remotebuildexecution.googleapis.com \
    --remote_instance_name=projects/envoy-ci/instances/default_instance

