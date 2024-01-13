[ ! -d .venv ] && python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt &>/dev/null
[ ! $1 ] && (echo "Port required"; exit 1)
kill $(cat pid) 2>/dev/null
gunicorn -w 2 -b 0.0.0.0:$1 speedup.server:app &>log & echo $! >pid