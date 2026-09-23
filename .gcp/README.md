# Google Compute Engine setup — asic-bitcoin heavy P&R runs

Use this only once Codespaces' 15GB storage / 120-core-hour free tier
becomes a real constraint (large SHA-256 core P&R runs, long unattended
synthesis jobs). For day-to-day RTL/synthesis work, Codespaces
(`.devcontainer/`) is simpler and free.

## One-time setup

1. In `startup-script.sh`, replace `REPLACE_WITH_REPO_URL` with your repo's
   actual GitHub URL once it exists.

2. From the Google Cloud Console (works fine in Safari — no app needed),
   open Cloud Shell (top-right terminal icon) and run:

```bash
gcloud compute instances create obscura-asic \
  --zone=us-central1-a \
  --machine-type=e2-standard-4 \
  --boot-disk-size=100GB \
  --image-family=ubuntu-2404-lts-amd64 \
  --image-project=ubuntu-os-cloud \
  --metadata-from-file=startup-script=startup-script.sh
```

   (Upload `startup-script.sh` to Cloud Shell first via its own upload
   button, or paste its contents into a file there.)

3. Connect from the iPad: Cloud Console → Compute Engine → VM instances →
   click "SSH" next to `obscura-asic`. This opens a full browser-based
   terminal — no separate app needed, works in Safari.

## Cost control

- **Stop the VM when not in use** — disk storage still bills while stopped,
  but compute (the expensive part) does not:
  `gcloud compute instances stop obscura-asic --zone=us-central1-a`
- Restart it later with `gcloud compute instances start ...` — the
  startup-script re-runs, so the environment is always consistent.
- Delete it entirely once a project phase is done if you don't need to keep
  paying for the disk.
