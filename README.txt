
This software package includes two tools, i.e. CurveAlign(1-3) and CT-FIRE(4-5) for collagen fiber quantification. CurveAlign is a curvelet transform (CT)-based quantitative tool for interpreting the regional interaction between collagen and tumors by assessment of up to ~thirty fiber features, including angle, alignment, and density. CT-FIRE analyzes individual fiber metrics such as length, width, angle, and curvature. The individual fibers extracted by CT-FIRE can be imported into the CurveAlign as one of the two fiber analyse modes. The approach of CT-FIRE is described in (4), which combines the advantages of the fast discrete curvelet transform(6) for denoising images, enhancement of the fiber edge features, and the fiber extraction (FIRE) algorithm (5) for extracting individual fibers.  For now, CurveAlign should be used for bulk assessment of collagen features including angles/density and CT-FIRE for individual fiber quantification.

CurveAlign and CT-FIRE are licensed under the 2-Clause BSD license as described LICENSE.txt, except for some third-party code whose licenses are described in LICENSE-third-party.txt. One third-party code, CurveLab 2.1.2 MATLAB package for curvelet transform, can only be downloaded from http://www.curvelet.org/software.html. To run CurveAlign or CT-FIRE, the CurveLab needs to be downloaded and added to the Matlab searching path.

Link to CurveAlign: http://loci.wisc.edu/software/curvealign
Link to CT-FIRE:    http://loci.wisc.edu/software/ctfire

References:

CurveAlign: 
1. Schneider, C.A., Pehlke, C.A., Tilbury, K., Sullivan, R., Eliceiri, K.W., and Keely, P.J. (2013). Quantitative Approaches for Studying the Role of Collagen in Breast Cancer Invasion and Progression. In Second Harmonic Generation Imaging, F.S. Pavone, and P.J. Campagnola, eds. (New York: CRC Press), p. 373.


2. Bredfeldt, J.S., Liu, Y., Conklin, M.W., Keely, P.J., Mackie, T.R., and Eliceiri, K.W. (2014). Automated quantification of aligned collagen for human breast carcinoma prognosis. J Pathol Inform 5.


3. Liu, Y., Keikhosravi, A., Mehta, G.S., Drifka, C.R., and Eliceiri, K.W. (accepted). Methods for quantifying fibrillar collagen alignment. In Fibrosis: Methods and Protocols, L. Rittié, ed. (New York: Springer), p.


CT-FIRE
4. Bredfeldt, J.S., Liu, Y., Pehlke, C.A., Conklin, M.W., Szulczewski, J.M., Inman, D.R., Keely, P.J., Nowak, R.D., Mackie, T.R., and Eliceiri, K.W. (2014). Computational segmentation of collagen fibers from second-harmonic generation images of breast cancer. Journal of Biomedical Optics 19, 016007–016007.

5. Stein, A. M., Vader, D. A., Jawerth, L. M., Weitz, D. A. & Sander, L. M. An algorithm for extracting the network geometry of three-dimensional collagen gels. J. Microsc. 232, 463–475 (2008).

Fast Discrete Curvelet Transform:
6. Candes, E., Demanet, L., Donoho, D. & Ying, L. Fast discrete curvelet transforms. Multiscale Model. Simul. 5, 861–899 (2006).
