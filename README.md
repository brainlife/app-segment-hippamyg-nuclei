[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-brainlife.app.222-blue.svg)](https://doi.org/10.25663/brainlife.app.222)

# Segment hippocampal and amygdala nuclei
This app will segment the hippocampus and amygdala into its multiple components using the developer version of Freesurfer’s segmentHA_T1.sh function (https://surfer.nmr.mgh.harvard.edu/fswiki/HippocampalSubfieldsAndNucleiOfAmygdala). This app takes a Freesurfer segmentation in as an input and generates .mgz files with the appropriate hippocampal and amygdala nuclei inside the Freesurfer directory as an output. 

### Authors 

- Brad Caron (bacaron@iu.edu) 

### Contributors 

- Soichi Hayashi (hayashis@iu.edu) 

### Funding 

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations 

Please cite the following articles when publishing papers that used data, code or other resources created by the brainlife.io community. 

1. Hippocampus: A computational atlas of the hippocampal formation using ex vivo, ultra-high resolution MRI: Application to adaptive segmentation of in vivo MRI. Iglesias, J.E., Augustinack, J.C., Nguyen, K., Player, C.M., Player, A., Wright, M., Roy, N., Frosch, M.P., Mc Kee, A.C., Wald, L.L., Fischl, B., and Van Leemput, K. Neuroimage, 115, July 2015, 117-137.

2. Amygdala: High-resolution magnetic resonance imaging reveals nuclei of the human amygdala: manual segmentation to automatic atlas. Saygin ZM & Kliemann D (joint 1st authors), Iglesias JE, van der Kouwe AJW, Boyd E, Reuter M, Stevens A, Van Leemput K, Mc Kee A, Frosch MP, Fischl B, Augustinack JC. Neuroimage, 155, July 2017, 370-382.

3. Longitudinal method: Bayesian longitudinal segmentation of hippocampal substructures in brain MRI using subject-specific atlases. Iglesias JE, Van Leemput K, Augustinack J, Insausti R, Fischl B, Reuter M. Neuroimage, 141, November 2016, 542-555. 

## Running the App 

### On Brainlife.io 

You can submit this App online at [https://doi.org/10.25663/brainlife.app.222](https://doi.org/10.25663/brainlife.app.222) via the 'Execute' tab. 

### Running Locally (on your machine) 

1. git clone this repo 

2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files. 

```json 
{
   "freesurfer":    "testdata/freesurfer/output"
} 
``` 

### Sample Datasets 

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli). 

```
npm install -g brainlife 
bl login 
mkdir input 
bl dataset download 
``` 

3. Launch the App by executing 'main' 

```bash 
./main 
``` 

## Output 

The main output of this App is is the Freesurfer directory containing the ThalamicNuclei*.mgz files. These can be fed into the 'Generate ROIs in dMRI Space' apps under the 'thalamic' options. 

#### Product.json 

The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing. 

### Dependencies 

This App requires the following libraries when run locally. 

- Freesurfer: https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall
- FSL: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation
- jsonlab: https://github.com/fangq/jsonlab
- singularity: https://singularity.lbl.gov/quickstart
