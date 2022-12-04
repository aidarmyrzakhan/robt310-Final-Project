# robt310-Final-Project

## Install

Dependencies:

- [PyTorch](https://pytorch.org/get-started/locally/) >= 1.0
- [NumPy](https://www.numpy.org/)
- [Pandas](https://pandas.pydata.org/)
- [OpenCV](https://opencv.org/)

## Run
- If your data is in aedat4 format:
```bash
python codes/aedat4_txt.py
```
- Run reconstruction:

```bash
python codes/run_reconstruction.py \
  -c pretrained/E2VID_lightweight.pth.tar \
  -i data/dynamic_6dof.zip \
  --auto_hdr \
  --display \
  --show_events
```
For inference with GPU you can use the [kaggle notebook](https://www.kaggle.com/code/aidarmyrzakhan/robotics)


- Run Denoising & Debluring notebook with reconstructed images
```bash
ipython -c "%run your_script.ipynb"
```

-Run Matlab file Filter.m for spatial filtering


## Parameters

Below is a description of the most important parameters:

#### Main parameters

- ``--window_size`` / ``-N`` (default: None) Number of events per window. This is the parameter that has the most influence of the image reconstruction quality. If set to None, this number will be automatically computed based on the sensor size, as N = width * height * num_events_per_pixel (see description of that parameter below). Ignored if `--fixed_duration` is set.
- ``--fixed_duration`` (default: False) If True, will use windows of events with a fixed duration (i.e. a fixed output frame rate).
- ``--window_duration`` / ``-T`` (default: 33 ms) Duration of each event window, in milliseconds. The value of this parameter has strong influence on the image reconstruction quality. Its value may need to be adapted to the dynamics of the scene. Ignored if `--fixed_duration` is not set.
- ``--Imin`` (default: 0.0), `--Imax` (default: 1.0): linear tone mapping is performed by normalizing the output image as follows: `I = (I - Imin) / (Imax - Imin)`. If `--auto_hdr` is set to True, `--Imin` and `--Imax` will be automatically computed as the min (resp. max) intensity values.
- ``--auto_hdr`` (default: False) Automatically compute `--Imin` and `--Imax`. Disabled when `--color` is set.
- ``--color`` (default: False): if True, will perform color reconstruction.

#### Output parameters

- ``--output_folder``: path of the output folder. If not set, the image reconstructions will not be saved to disk.
- ``--dataset_name``: name of the output folder directory (default: 'reconstruction').

#### Display parameters

- ``--display`` (default: False): display the video reconstruction in real-time in an OpenCV window.
- ``--show_events`` (default: False): show the input events side-by-side with the reconstruction. If ``--output_folder`` is set, the previews will also be saved to disk in ``/path/to/output/folder/events``.


