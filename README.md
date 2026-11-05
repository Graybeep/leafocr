# LeafOCR

LeafOCR reads Malayalam text from photos of palm-leaf manuscripts. Upload an
image and the app finds the text, splits it into lines, and gives you a
transcript you can copy or export. It runs on your own computer through a
browser interface.

- **Recognition:** a DeepLabv3+ model separates the text from the leaf, then a
  CRNN model reads each line.
- **Live scanning:** watch progress as it runs, with Stop, Resume, and Reset
  controls.
- **Export:** download the transcript as Text, Word, or PDF.

## Before you start

Install these first:

- [Python 3.11](https://www.python.org/downloads/release/python-3119/) (other
  versions may not work with the pinned packages)
- [Git](https://git-scm.com/downloads)
- [Git LFS](https://git-lfs.com), which downloads the model files

The first download is about 650 MB, so allow some time and disk space.

## Clone the project

Run these commands in a terminal:

```sh
git lfs install
git clone https://github.com/Graybeep/leafocr.git
cd leafocr/newds_aug
```

## Set up and run

You only need to run the first two commands once.

**Windows**

```sh
py -3.11 -m venv .venv
.venv\Scripts\python -m pip install -r requirements.txt
.venv\Scripts\python app.py
```

**macOS / Linux**

```sh
python3.11 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python app.py
```

When the terminal shows a local URL, open <http://127.0.0.1:7860> in your
browser. To stop the app, press `Ctrl+C` in the terminal.

To start it again later, open a terminal in `newds_aug` and run only the last
command. On Windows, you can double-click `run_palm_leaf_ocr.bat` instead.

## Try it

1. Upload an image. Sample images are in `newds_aug`, such as
   `MaI286_006_patch000.png`.
2. Click **Recognize manuscript**.
3. Copy the transcript, or choose a file type and click **Export**.

## Troubleshooting

| Problem | Fix |
| --- | --- |
| The models fail to load | Git LFS probably didn't download them. In the project folder, run `git lfs install`, then `git lfs pull`. |
| `py` or `python3.11` isn't found | Install Python 3.11. On Windows, reopen the terminal afterwards. |
| Port 7860 is already in use | Set the `GRADIO_SERVER_PORT` environment variable to another port, or close the other app. |
| Recognition is slow | The app is probably running on the CPU. See the GPU section below. |

## Optional: run on an NVIDIA GPU (Windows)

TensorFlow runs only on the CPU in native Windows, so GPU mode uses WSL2. You
need Ubuntu on WSL2, NVIDIA drivers, and [uv](https://docs.astral.sh/uv/)
installed inside Ubuntu.

1. In Ubuntu, go to `newds_aug` and run `bash wsl_setup.sh` once.
2. In Windows, double-click `run_gpu.bat`.
3. Open <http://localhost:7860>.

## Credits

Built on [SFR-API](https://github.com/SineeshRemya/SFR-API), original commit
`f353e38`.

The fonts in `newds_aug/fonts` are Noto Sans and Noto Sans Malayalam, under the
SIL Open Font License (`fonts/OFL.txt`). Noto Sans is reduced to its Latin
characters.
