if [ ! -d .venv ]; then
	python -m venv .venv
	.venv/bin/pip install -r requirements.txt
fi
[ $1 ] || (echo "Port required"; exit 1)
kill $(cat pid) 2>/dev/null
.venv/bin/gunicorn -w 2 -b 0.0.0.0:$1 speedup.server:app &>log & echo $! >pid
