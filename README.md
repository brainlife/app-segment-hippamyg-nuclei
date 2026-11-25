<h1 align="center">Segment hippocampal and amygdala nuclei</h1>

<p align="center">
  Hippocampal subfield and amygdala nuclei segmentations added to a FreeSurfer subject directory with FreeSurfer's <code>segmentHA_T1.sh</code>.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.738"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.738-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> **This branch, `v1.0`, is the brainlife.io App Segment hippocampal and amygdala nuclei** ([doi:10.25663/brainlife.app.738](https://doi.org/10.25663/brainlife.app.738)).

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Segments hippocampal subfields and amygdala nuclei with FreeSurfer 7.3.2 segmentHA_T1.sh on a FreeSurfer subject directory and returns the updated directory.**

Copies the FreeSurfer subject directory and runs segmentHA_T1.sh (segmentHA_T2.sh when a T2.mgz is found), adding the lh/rh hippoAmygLabels volumes to mri/. Use it before converting those labels into a parcellation. Requires a completed recon-all.

| | |
|---|---|
| **Inputs** | `neuro/freesurfer` |
| **Outputs** | `neuro/freesurfer` |
| **Container** | `brainlife/freesurfer:7.3.2` |
| **Resources** | 2 CPUs · 20 GB memory · 0.75 h walltime |
| **Requires** | `FREESURFER_LICENSE` |
| **Run it** | [doi.org/10.25663/brainlife.app.738](https://doi.org/10.25663/brainlife.app.738) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `freesurfer` | `neuro/freesurfer` | yes | The path to the freesurfer datatype. Completed FreeSurfer recon-all subject directory. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/freesurfer` | Output freesurfer datatype including hippocampal and amygdala nuclei segmentation |

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.738](https://doi.org/10.25663/brainlife.app.738), choose a `neuro/freesurfer` dataset (a completed `recon-all` subject directory) from your project and press **Execute**. The result is a new `neuro/freesurfer` dataset, archived to your project, that contains the original FreeSurfer output plus the hippocampal and amygdala nuclei segmentations. Use it, for example, before converting those labels into a parcellation.

The App copies the FreeSurfer subject directory and runs FreeSurfer's [hippocampal subfields and amygdala nuclei](https://surfer.nmr.mgh.harvard.edu/fswiki/HippocampalSubfieldsAndNucleiOfAmygdala) module (`segmentHA_T1.sh`) on it.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/), [`jq`](https://jqlang.github.io/jq/) and a [FreeSurfer license](https://surfer.nmr.mgh.harvard.edu/registration.html). FreeSurfer 7.3.2 runs inside the `brainlife/freesurfer:7.3.2` container.

1. Clone this repository and check out the branch brainlife.io runs: `git checkout v1.0`.
2. Create `config.json` with the path to your FreeSurfer subject directory:

   ```json
   {
       "freesurfer": "/input/freesurfer/output"
   }
   ```

3. Export your license and run the App:

   ```bash
   export FREESURFER_LICENSE="$(cat ~/freesurfer/license.txt)"
   ./main
   ```

### Sample data

Download sample datasets from brainlife.io with the [brainlife CLI](https://github.com/brainlife/cli):

```bash
npm install -g brainlife
bl login
mkdir input
bl dataset download <dataset-id>
```

## Outputs

`output/` is a FreeSurfer dataset whose `output/` subject directory is a copy of the input with the new segmentations added:

```text
output/
└── output/
    ├── mri/       original volumes plus lh/rh hippoAmygLabels*.mgz (hippocampal subfields and amygdala nuclei)
    ├── label/
    ├── scripts/
    ├── stats/
    └── surf/
```

## Troubleshooting

- **The module fails to start or complains about a license**: `FREESURFER_LICENSE` must contain a valid FreeSurfer license; `main` writes it to `license.txt` and mounts it into the container.
- **Errors about missing `recon-all` files**: the input must be a completed `recon-all` subject directory.

## Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Iglesias JE, Augustinack JC, Nguyen K, Player CM, Player A, Wright M, Roy N, Frosch MP, McKee AC, Wald LL, Fischl B, Van Leemput K. A computational atlas of the hippocampal formation using ex vivo, ultra-high resolution MRI: application to adaptive segmentation of in vivo MRI. *NeuroImage* 115:117–137 (2015).
- Saygin ZM, Kliemann D, Iglesias JE, van der Kouwe AJW, Boyd E, Reuter M, Stevens A, Van Leemput K, McKee A, Frosch MP, Fischl B, Augustinack JC. High-resolution magnetic resonance imaging reveals nuclei of the human amygdala: manual segmentation to automatic atlas. *NeuroImage* 155:370–382 (2017).
- Iglesias JE, Van Leemput K, Augustinack J, Insausti R, Fischl B, Reuter M. Bayesian longitudinal segmentation of hippocampal substructures in brain MRI using subject-specific atlases. *NeuroImage* 141:542–555 (2016).
- Segment hippocampal and amygdala nuclei. brainlife.io App. [doi:10.25663/brainlife.app.738](https://doi.org/10.25663/brainlife.app.738)
- Fischl. FreeSurfer. *NeuroImage* 62:774-781 (2012). [doi:10.1016/j.neuroimage.2012.01.021](https://doi.org/10.1016/j.neuroimage.2012.01.021)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Brad Caron

**Contributors:** Soichi Hayashi, Franco Pestilli

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

[MIT](LICENSE). FreeSurfer itself is distributed under its own [license](https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferSoftwareLicense).
