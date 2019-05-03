FROM fedora
RUN dnf -y update && dnf -y clean all
RUN dnf -y install buildah && dnf -y clean all
ENV BUILDAH_ISOLATION chroot
WORKDIR /root
COPY /entrypoint.sh /
CMD ["/entrypoint.sh"]