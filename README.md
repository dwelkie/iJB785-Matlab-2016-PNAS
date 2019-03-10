


The COBRA Toolbox <br> COnstraint-Based Reconstruction and Analysis Toolbox
=======================================================================

<table>
  <tr>
    <td><div align="center"><a href="https://opencobra.github.io/cobratoolbox/latest"><img src="https://img.shields.io/badge/COBRA-docs-blue.svg?maxAge=0"></a></div></td>
    <td><div align="center"><a href="https://groups.google.com/forum/#!forum/cobra-toolbox"><img src="https://img.shields.io/badge/COBRA-forum-blue.svg?maxAge=0"></a></div></td>
    <td><div align="center"><a href="https://github.com/opencobra/cobratoolbox/tree/master/tutorials"><img src="https://img.shields.io/badge/COBRA-tutorials-blue.svg?maxAge=0"></div></td>
    <td><div align="center"><a href="https://codecov.io/gh/opencobra/cobratoolbox/branch/master"><img src="https://codecov.io/gh/opencobra/cobratoolbox/branch/master/graph/badge.svg?maxAge=0"></a></div></td>
    <td><div align="center"><img src="https://prince.lcsb.uni.lu/jenkins/userContent/codegrade.svg?maxAge=0" alt="Ratio of the number of inefficient code lines and the total number of lines of code (in percent). A: 0-3%, B: 3-6%, C: 6-9%, D: 9-12%, E: 12-15%, F: > 15%."></div></td>
  </tr>
  <tr>
    <th style="text-align:center">MATLAB R2016b</th>
    <th style="text-align:center">MATLAB R2015b</th>
    <th style="text-align:center">MATLAB R2014b</th>
    <th style="text-align:center" colspan="2">Code</th>
  </tr>
  <tr>
    <td><div align="center"><a href="https://prince.lcsb.uni.lu/jenkins/job/COBRAToolbox-branches-auto/MATLAB_VER=R2016b/"><img src="https://prince.lcsb.uni.lu/jenkins/buildStatus/icon?job=COBRAToolbox-branches-auto/MATLAB_VER=R2016b"></a></div></td>
    <td><div align="center"><a href="https://prince.lcsb.uni.lu/jenkins/job/COBRAToolbox-branches-auto/MATLAB_VER=R2015b/"><img src="https://prince.lcsb.uni.lu/jenkins/buildStatus/icon?job=COBRAToolbox-branches-auto/MATLAB_VER=R2015b"></a></div></td>
    <td><div align="center"><a href="https://prince.lcsb.uni.lu/jenkins/job/COBRAToolbox-branches-auto/MATLAB_VER=R2014b/"><img src="https://prince.lcsb.uni.lu/jenkins/buildStatus/icon?job=COBRAToolbox-branches-auto/MATLAB_VER=R2014b"></a></div></td>
    <td><div align="center"><img src="https://img.shields.io/badge/Windows-passing-brightgreen.svg?maxAge=0"></div></td>
    <td><div align="center"><img src="https://img.shields.io/badge/macOS-passing-brightgreen.svg?maxAge=0"></div></td>
  </tr>
</table>

System Requirements and Solver Installation
-------------------------------------------

## One way to run the scripts and perform the analysis of the 2016 PNAS paper Broddrick-Rubin-Welkie on the model iJB785:

1. Download this repository to your local drive.
2. Make sure you have Anaconda on your computer
3. Make sure you have Matlab on your machine
4. Change directory to this repos folder on your machine and create a environment:
   1. conda env create -f environment.yml
5. Once it established the correct environment, launch jupyter and load the notebook "Original-Simulation-Broddrick-2016-PNAS.ipynb"
   1. If you have an error, you may need to check your matlab kernel is functioning properly.



Tutorials
---------

All tutorials are included in the folder [tutorials](https://github.com/opencobra/cobratoolbox/tree/master/tutorials). More tutorials are currently being prepared.

Support and Documentation
--------------

- The documentation is available [here](http://opencobra.github.io/cobratoolbox). This version is in development, but the legacy version of the documentation is  [here](http://opencobra.github.io/cobratoolbox/deprecated/docs/index.html).

- Answers to Frequently Asked Questions (**FAQ**) are [here](https://github.com/opencobra/cobratoolbox/blob/master/.github/guides/FAQ.md).

- If you need support, please feel free to post your question in our <a href="https://groups.google.com/forum/#!forum/cobra-toolbox"><img src="https://img.shields.io/badge/COBRA-forum-blue.svg"></a>.

How to cite `The COBRA Toolbox`
---------------

When citing `The COBRA Toolbox`, it is important to cite the original paper where an algorithm was first reported, as well as its implementation in `The COBRA Toolbox`. This is important, because the objective of `The COBRA Toolbox` is to amalgamate and integrate the functionality of a wide range of COBRA algorithms and this will be undermined if contributors of new algorithms do not get their fair share of citations. The following is one example how to approach this within the methods section of a paper (**not** the supplemental material please):

*To generate a context-specific model the FASTCORE algorithm [1], implemented in The COBRA Toolbox [2], was employed.*

>[1] = Vlassis N, Pacheco MP, Sauter T (2014) Fast Reconstruction of Compact Context-Specific Metabolic Network Models. PLoS Comput Biol 10(1): e1003424.
>

>[2] = Schellenberger J, Que R, Fleming RMT, Thiele I, Orth JD, Feist AM, Zielinski DC, Bordbar A, Lewis NE, Rahmanian S, Kang J, Hyduke DR, Palsson BØ. 2011 Quantitative prediction of cellular metabolism with constraint-based models: The COBRA Toolbox v2.0. Nature Protocols 6:1290-1307.
>



Disclaimer
----------

*The software provided by the openCOBRA Project is distributed under the GNU GPLv3 or later.  However, this software is designed for scientific research and as such may contain algorithms that are associated with patents in the U.S. and abroad.  If the user so chooses to use the software provided by the openCOBRA project for commercial endeavors then it is solely the user’s responsibility to license any patents that may exist and respond in full to any legal actions taken by the patent holder.*

