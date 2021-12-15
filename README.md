# PreHPVcc
Predicting the subtypes of human papillomavirus-positive (HPV+) cervical cancers based on the expression profiles of 50 genes

### 1.Description
The package is used to predict the subtypes (HPV+G1 and HPV+G2) of HPV+ cervical cancers based on the expression levels of a 50-gene panel.

### 2.Details
This algorithm aims to predict the subtypes of HPV+ cervical cancers because HPV+ cervical cancers are highly heterogeneous in molecular and clinical features. Based on the expression profiles of 50 genes having the largest expression variations across the HPV+ cervical cancers in the TCGA-CESC dataset, we developed the tool to predict HPV+ cervical cancers belonging to HPV+G1 or HPV+G2. Compared to HPV+C2, HPV+C1 has significantly higher immune infiltration level and stromal content, lower tumor purity, lower stemness scores and intratumor heterogeneity (ITH) scores, higher level of genomic instability, lower DNA methylation level, as well as better disease-free survival prognosis. The multivariate survival analysis suggests that the disease-free survival difference between both subtypes is independent of confounding variables, incluidng immune signature, stemness, and ITH. The algorithm uses the k-NN (k=5) classifier to perform the binary classification.

Prediction results ("1" indicates HPV+G1, and "0" HPV+G2).

               The 50 gene features used in the PreHPVcc algorithm

| Gene symbol | Entrez gene ID | Gene Name |
| :------: | :------: | :------: |
| *MUC5B* | 727897 | Mucin 5B |
| *C20orf114* | 92747 | BPI Fold Containing Family B Member 1 |
| *PIGR* | 5284 | Polymeric Immunoglobulin Receptor |
| *MUC13* | 56667 | Mucin 13 |
| *SLC34A2* | 10568 | Solute Carrier Family 34 Member 2 |
| *TFF3* | 7033 | Trefoil Factor 3 |
| *AQP5* | 362 | Aquaporin 5 |
| *LTF* | 4057 | Lactotransferrin |
| *PROM1* | 8842 | Prominin 1 |
| *GABRP* | 2568 | Gamma-Aminobutyric Acid Type A Receptor Subunit Pi  |
| *AGR3* | 155465 | Anterior Gradient 3 |
| *PAX7* | 5081 | Paired Box 7 |
| *TSPAN8* | 7103 | Transmembrane 4 Superfamily Member 3 |
| *KRT14* | 3861 | Keratin 14 |
| *SPRR3* | 6707 | Small Proline Rich Protein 3 |
| *TMPRSS11D* | 9407 | Transmembrane Serine Protease 11D |
| *ADH7* | 131 | Alcohol Dehydrogenase 7 (Class IV) |
| *NTS* | 4922 | Neurotensin |
| *KRT13* | 3860 | Keratin 13 |
| *CALML3* | 810 | Calmodulin Like 3 |
| *S100A7* | 2944 | S100 Calcium Binding Protein A7 |
| *GSTM1* | 362 | Glutathione S-Transferase Mu 1 |
| *SPRR1B* | 6699 | Small Proline Rich Protein 1B |
| *SBSN* | 374897 | Suprabasin |
| *SPRR1A* | 6698 | Small Proline Rich Protein 1A  |
| *RHCG* | 51458 | Rh Family C Glycoprotein |
| *DSG3* | 1830 | Desmoglein 3 |
| *SPRR2A* | 6700 | Small Proline Rich Protein 2A |
| *KRT4* | 3851 | Keratin 4 |
| *CASP14* | 23581 | Caspase 14 |
| *FABP4* | 2167 | Fatty Acid Binding Protein 4 |
| *SPRR2E* | 6704 | Small Proline Rich Protein 2E |
| *SPRR2D* | 6703 | Small Proline Rich Protein 2D |
| *KRT1* | 3848 | Keratin 1 |
| *SERPINB13* | 5275 | Serpin Family B Member 13 |
| *TMPRSS11A* | 339967 | Transmembrane Serine Protease 11A |
| *IVL* | 3713 | Involucrin |
| *CRNN* | 49860 | Cornulin  |
| *CLCA2* | 9635 | Chloride Channel Accessory 2 |
| *OLFM4* | 10562 | Olfactomedin 4 |
| *DSC3* | 1825 | Desmocollin 3 |
| *CALML5* | 51806 | Calmodulin Like 5 |
| *C10orf99* | 387695 | Chromosome 10 Open Reading Frame 99 |
| *LASS3* | 204219 | Ceramide Synthase 3 |
| *WDR72* | 256764 | WD Repeat Domain 72 |
| *TMPRSS11E2* | 28983 | Transmembrane Serine Protease 11E  |
| *S100A7A* | 338324 | S100 Calcium Binding Protein A7A |
| *MAGEA4* | 4103 | MAGE Family Member A4 |
| *KRTDAP* | 388533 | Keratinocyte Differentiation Associated Protein |
| *IRX4* | 50805 | Involucrin |
| *CRNN* | 49860 | Cornulin  |
| *CLCA2* | 9635 | Iroquois Homeobox 4 |

### 3.Installation
```r
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
    
devtools::install_github("WangX-Lab/PreHPVcc")


#> Downloading GitHub repo WangX-Lab/PreHPVcc@HEAD
#> √  checking for file 'C:\Users\228\AppData\Local\Temp\RtmpeOeTWG\remotes3d5c43db44b1\WangX-Lab-PreHPVcc-ab9b6d0/DESCRIPTION' ...
#> -  preparing 'PreHPVcc':
#> √  checking DESCRIPTION meta-information ... 
#> -  checking for LF line-endings in source and make files and shell scripts
#> -  checking for empty or unneeded directories
#>      NB: this package now depends on R (>= 3.5.0)
#>      WARNING: Added dependency on R >= 3.5.0 because serialized objects in
#>      serialize/load version 3 cannot be read in older versions of R.
#>      File(s) containing such objects:
#>        'PreHPVcc/data/feature.rda' 'PreHPVcc/data/training_data.rda'
#> -  building 'PreHPVcc_1.0.tar.gz'
   
#> * installing *source* package 'PreHPVcc' ...
#> ** using staged installation
#> ** R
#> ** data
#> *** moving datasets to lazyload DB
#> ** inst
#> ** byte-compile and prepare package for lazy loading
#> ** help
#> *** installing help indices
#>   converting help for package 'PreHPVcc'
#>     finding HTML links ... done
#>     PreHPVcc-package                        html  
#>     data_pre                                html  
#>     feature                                 html  
#>     hpv_pre                                 html  
#>     training_data                           html  
#> ** building package indices
#> ** testing if installed package can be loaded from temporary location
#> ** testing if installed package can be loaded from final location
#> ** testing if installed package keeps a record of temporary installation path
#> * DONE (PreHPVcc)
#> Making 'packages.html' ... done
```

### 4.Examples
```r
# Data preprocessing (select matched genes and 0-1 scale gene expression values) --------------
library(PreHPVcc)

path = system.file("extdata", "example.txt", package = "PreHPVcc", mustWork = TRUE)

input_data = data_pre(path, type = "ID")

head(input_data)


#>             MUC5B C20orf114       PIGR     MUC13   SLC34A2      TFF3      AQP5       LTF     PROM1      GABRP
#> Sample1 0.7976136 0.0000000 0.68890171 0.6611029 0.0000000 0.1159856 0.6252422 0.2573053 0.8479518 1.00000000
#> Sample2 0.0000000 0.0000000 0.05696887 0.1213494 0.9765417 0.0000000 0.0000000 0.0000000 0.1102147 0.00000000
#> Sample3 0.6278743 0.8053060 0.00000000 0.0000000 0.5622578 0.1790279 0.4899960 0.2532726 0.6709390 0.37508282
#> Sample4 0.2474173 0.4030241 0.37454525 0.1077052 1.0000000 0.2317891 0.9528372 0.2361069 1.0000000 0.08083745
#> Sample5 1.0000000 1.0000000 1.00000000 0.7450529 0.9351119 0.8869628 0.8419892 1.0000000 0.8028218 0.61009604
#> Sample6 0.7559468 0.1416227 0.82327312 0.6841558 0.7830382 0.5292344 0.8227530 0.7390388 0.0000000 0.51156689
#>              AGR3      PAX7    TSPAN8     KRT14     SPRR3 TMPRSS11D      ADH7       NTS      KRT13    CALML3
#> Sample1 0.4641263 0.0000000 0.0000000 0.9159478 0.0000000 0.0000000 0.0000000 0.7601462 1.00000000 0.0000000
#> Sample2 0.0000000 0.0000000 0.4386285 0.1310022 0.1670911 0.0000000 0.0000000 0.0000000 0.20071122 0.0000000
#> Sample3 0.1120854 1.0000000 0.3632042 0.7475096 0.1558634 0.0000000 0.0000000 0.2187459 0.31286046 0.0000000
#> Sample4 0.3595524 0.0000000 0.1357572 0.1470686 0.0000000 0.0000000 0.0000000 0.0000000 0.01881706 0.0000000
#> Sample5 0.6790862 0.5504989 0.7317659 1.0000000 0.3566102 0.6742766 0.7596488 0.0000000 0.00000000 1.0000000
#> Sample6 0.6365365 0.0000000 0.4258082 0.9633516 1.0000000 1.0000000 0.0000000 0.2955695 0.40330078 0.1124779
#>             S100A7     GSTM1   SPRR1B      SBSN    SPRR1A      RHCG       DSG3    SPRR2A      KRT4    CASP14     FABP4
#> Sample1 0.00000000 0.2045095 0.000000 0.0000000 0.0000000 0.0000000 0.05871564 0.0000000 0.8426962 0.0000000 0.3102112
#> Sample2 0.08955263 0.0000000 0.000000 0.3742866 0.0000000 0.4632665 0.31346734 0.1505836 0.1509149 0.0000000 0.0000000
#> Sample3 0.13590794 0.8825866 0.000000 1.0000000 0.1871699 1.0000000 0.22497455 0.3319858 1.0000000 0.0000000 0.0000000
#> Sample4 0.00000000 0.5602614 0.000000 0.3010856 0.0000000 0.0000000 0.00000000 0.0000000 0.0000000 0.7026583 0.0000000
#> Sample5 1.00000000 0.9513645 0.459988 0.5696775 0.3952490 0.5543101 0.80487100 0.4721886 0.0000000 1.0000000 1.0000000
#> Sample6 0.85107603 0.1513079 1.000000 0.3242484 1.0000000 0.7465117 1.00000000 1.0000000 0.4081501 0.0000000 0.8035591
#>            SPRR2E     SPRR2D      KRT1 SERPINB13 TMPRSS11A       IVL      CRNN     CLCA2      OLFM4       DSC3
#> Sample1 0.0000000 0.00000000 1.0000000 0.0000000         1 0.0000000 0.0000000 0.3483144 0.00000000 1.00000000
#> Sample2 0.0000000 0.09215427 0.0000000 0.0000000         1 0.0000000 0.0000000 0.0000000 0.59903127 0.00000000
#> Sample3 0.2657081 0.00000000 0.0000000 0.0000000         1 0.4518224 0.6849674 0.3070584 0.15732750 0.63783260
#> Sample4 0.0000000 0.00000000 0.6585127 0.0000000         1 0.0000000 1.0000000 0.4482817 0.06902121 0.08403824
#> Sample5 0.4496558 0.62192337 0.5796172 0.3584537         1 0.6171179 0.5736609 0.4030634 0.77987039 0.32553240
#> Sample6 1.0000000 1.00000000 0.7284104 1.0000000         1 1.0000000 0.0000000 1.0000000 0.04597139 0.74984995
#>            CALML5  C10orf99 LASS3     WDR72   S100A7A    MAGEA4    KRTDAP IRX4
#> Sample1 0.2532509 0.7455557     0 0.0000000 0.0000000 0.0000000 0.2824582    1
#> Sample2 0.0000000 0.0000000     0 0.1950642 0.0000000 0.0000000 0.3420399    1
#> Sample3 0.5470562 0.3542247     0 0.2335836 0.0000000 0.0000000 1.0000000    1
#> Sample4 0.0000000 0.0000000     0 0.8338869 0.0000000 0.0000000 0.0000000    1
#> Sample5 0.3011539 1.0000000     0 0.7566930 1.0000000 0.3209549 0.3268558    1
#> Sample6 0.0000000 0.6041031     0 0.7356343 0.6943694 0.0000000 0.0000000    1
```

```r
# Prediction of HPV+ tumors.Prediction results ("1" indicates HPV+G1, and "0" HPV+G2) ---------------------------------------------------------------------------

output_data = hpv_pre(input_data)

head(output_data)

#>  Sample       HPV_status
#> 1 Sample1          0
#> 2 Sample2          1
#> 3 Sample3          0
#> 4 Sample4          0
#> 5 Sample5          1
#> 6 Sample6          1
```

### Contact

E-mail any questions to Shengwei Li <lishengwei98@163.com>, Xiaosheng Wang <xiaosheng.wang@cpu.edu.cn>



