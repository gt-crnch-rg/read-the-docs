###########
Using Containers with PACE
###########

Part of the Rogues Gallery focus is on supporting novel architectures with a path to scaling up computation to larger resources, like `Georgia Tech's Phoenix cluster <https://docs.pace.gatech.edu/phoenix_cluster/gettingstarted_phnx/>`__. This is one of the reasons we support Apptainer (aka, Singularity), and we look to provide a path to running larger jobs, especially for scalable applications or simulation tools like ML workflows or architectural simulators like SST.

Once you've tested that your container works correctly on CRNCH, you can request to have it deployed on PACE using the following process:

1) Scan your image with Syft and Grype to provide an analysis of any vulnerabilities that need to be fixed.
2) Push your image to PACE's Quay instance (may require permission or help from a CRNCH admin).
3) Run your image on PACE Phoenix using their instance of Apptainer. 

Step 1 - Scanning your Image
----------------------------
To scan singularity images, PACE uses two open-source tools from Anchore:  

- `Syft <https://github.com/anchore/syft>`__ generates a Software Bill of Materials (SBOM) from a .sif file.
- `Grype <https://github.com/anchore/grype>`__ generates a vulnerability report from an SBOM.

Though Grype can directly scan a .sif file, it’s useful to have a separate SBOM. Hence, we describe a two-step Syft and Grype workflow with the `CycloneDX SBOM format <https://owasp.org/www-project-cyclonedx/>`__.

To run Syft and Grype, you can log into `hawksbill`, which has both of these tools installed.

1) Run Syft

.. code:: shell

  syft singularity:sstpackage-13.0.0-centos8.sif -o cyclonedx-json=sstpackage-13.0.0-centos8.sbom.cdx.json
  ✔ Parsed image                                                                                                                      sha256:7ae0752769d49f59036ff4d98ada680fbc5ffeb32a9f023d95c19951bbfacff2
  ⠸ Cataloging packages             [2 packages]
   
2) Run Grype

.. code:: shell

