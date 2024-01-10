[ -e pid ] && kill $(cat pid) && rm pid
[ ! -d .venv ] && python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
gunicorn -w 2 speedup.server:app &>log & echo $! >pid