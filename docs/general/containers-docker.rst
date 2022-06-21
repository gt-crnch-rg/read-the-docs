

What is important to know about running Docker containers?
~~~~~~~~~~~~~~~~~
- `How to use volumes <https://docs.docker.com/storage/volumes/>`__ - these are folders that can be migrated between Docker instances (as opposed to bind-mounted folders).

Security issues with Docker
~~~~~~~~~~~~~~~~~
Docker versions before 19.03 require root permissions to run correctly, which has led to the rise of "rootless" container technologies like Podman. For new Docker installations (>= 19.03), you can enable `rootless mode operation <https://docs.docker.com/engine/security/rootless/>`__ to allow for running with needing root permissions. Note that the docker group implies that users in this group have root-level access with respect to running Docker containers.


Docker FAQ
~~~~~~~~~~~~~~~~~
- How do you avoid bindmounting into the container?
    - It seems like we should use the --mount flag and Docker volumes. See `this page <https://docs.docker.com/storage/bind-mounts/>`__ for more info. 
- How can you create a custom container with the needed packages for an application? For example, what if we need openssl or other libraries on the DGX?
    -You still want to use a container but it is best to add these dependencies within your container. You can do this in two ways: 1) Update the Dockerfile you are using to include the correct apt commands for your packages or 2) Commit changes to a running Docker container and "commit" the changes to update it. See a guide `here <https://www.techrepublic.com/article/how-to-commit-changes-to-a-docker-image/>`__.
- How can you inspect and update a Dockerfile for a specific container from DockerHub?
    -It seems you need to go and look at the tags for a specific container to see the contents of a DockerFile. Here is an example for an older release of `SST <https://hub.docker.com/layers/jwilso/sstalphacontainer/10.1.0_alpha/images/sha256-dea8f6f21573aa36cbc567a48add538a7c2c34d6987b5668a1c7aaf6ea2814d2?context=explore>`__.
- Can I become root inside a container to add packages/make updates to a container? 
    -
