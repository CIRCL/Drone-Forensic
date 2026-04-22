# Drone Forensic - MISP Automation

## Purpose

`drone_to_misp.ipynb` walks through the drone-forensic → MISP pipeline **one
artifact at a time**, for the benefit of analysts who want to see what the
extractors return and how each field ends up on a MISP object before running
the fully automated CLI.

For each artifact (FC dump, blackbox log, ELRS dump) the notebook shows:

1. what the extractor produces in memory (the intermediate dict);
2. which MISP object template is used and why;
3. how each extracted field is mapped to an object attribute;
4. how the objects are tied together through the reference graph;
5. a folium map of the recovered GPS waypoints.

All encoder functions are imported from `misp/drone_to_misp.py` — the
`drone-to-misp` CLI uses the exact same functions, so running the notebook and
running the CLI against the same input produce an equivalent MISP Event.

Two reference cases are included under `workshop/forensic-01/` and
`workshop/forensic-02/`, each containing one FC dump, one blackbox log, and
one ELRS dump. The notebook exposes a `CASE` variable at the top to switch
between them.

## Install

Clone the repository and set up a Python virtual environment:

```bash
git clone https://github.com/circl/drone-forensic.git
cd drone-forensic
python3 -m venv venv
source venv/bin/activate
```

Install requirements and the `drone-to-misp` package:

```bash
pip install -r requirements.txt
pip install -e .
```

`requirements.txt` pulls in `pymisp`, `yara-python`, `redis`, `folium`, and
`jupyter`. `pip install -e .` installs the shared encoder module and the
`drone-to-misp` console script (defined in `pyproject.toml`) so both the CLI
and the notebook resolve `import drone_to_misp`.

## Run the notebook

```bash
source venv/bin/activate
jupyter notebook workshop/drone_to_misp.ipynb
```

Pick a case by editing the `CASE` cell (`'forensic-01'` or `'forensic-02'`)
and run all cells. The final cell writes the resulting event to
`workshop/event-<CASE>.json`.

To re-execute the full notebook non-interactively (useful after a code change
in `misp/drone_to_misp.py`):

```bash
jupyter nbconvert --to notebook --execute --inplace workshop/drone_to_misp.ipynb
```

## Run the CLI against the workshop cases

The CLI produces the same event JSON without the explanatory cells:

```bash
drone-to-misp \
    --fc       workshop/forensic-01/fc_8514402844742fae8c407479a51a7a77.bin \
    --blackbox workshop/forensic-01/blackbox_2c7ab85a893283e98c931e9511add182.bin \
    --elrs     workshop/forensic-01/rx_f70e8cfcbb6bb83626c79f682c277ecf.bin \
    --output   workshop/forensic-01/misp_event.json
```

Any subset of the three artifact flags is accepted — missing types are
reported and skipped, not treated as errors. Pass `--push` with `MISP_URL`
and `MISP_KEY` environment variables to send the Event to a MISP instance
instead of (or in addition to) writing the local JSON file.
