[ -d .venv ] || { python -m venv .venv; .venv/bin/pip install -r requirements.txt; }
[ $1 ] || { echo "Port required"; exit 1; }
kill $(<pid) 2>/dev/null
.venv/bin/gunicorn -w 2 -b 0.0.0.0:$1 speedup.server:app &>log & echo $! >pid