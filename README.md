[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.222-blue.svg)](https://doi.org/10.25663/bl.app.222)

# app-segment-thalamic-nuclei
This app will segment the thalamus into its multiple components using the developer version of Freesurfer's segmentThalamicNuclei.sh function (http://freesurfer.net/fswiki/ThalamicNuclei). This app takes a Freesurfer segmentation in as an input and generates .mgz files with the appropriate thalamic segmentation inside the Freesurfer directory as an output.

### Authors
- Brad Caron (bacaron@iu.edu)

### Contributors
- Soichi Hayashi (hayashi@iu.edu)
- Franco Pestilli (franpest@indiana.edu)

### Funding
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.222](https://doi.org/10.25663/bl.app.222) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
  "freesurfer": "/testdata/freesurfer/output/"
}

```

### Sample Datasets

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input
bl dataset download 5967bffa9b45c212bbec8958 && mv 5967bffa9b45c212bbec8958 input/freesurfer

```


3. Launch the App by executing `main`

```bash
./main
```

## Output

The main output of this app is a freesurfer datatype with appropriate .mgz files for the thalamic segmentation.

#### Product.json
The secondary output of this app is `product.json`. This file allows web interfaces, DB and API calls on the results of the processing. 

### Dependencies

This App requires the following libraries when run locally.

  - Freesurfer: https://hub.docker.com/r/brainlife/freesurfer/tags/dev
  
### References
A probabilistic atlas of the human thalamic nuclei combining ex vivo MRI and histology. Iglesias, J.E., Insausti, R., Lerma-Usabiaga, G., Bocchetta, M., Van Leemput, K., Greve, D., van der Kouwe, A., Caballero-Gaudes, C., Paz-Alonso, P. Neuroimage (accepted).
