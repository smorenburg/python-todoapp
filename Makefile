V := . .venv/bin/activate
LOCAL_PORT := 8080

clean:
		rm -rf .venv

venv: clean
		virtualenv -p python3 .venv; \
		$(V); \
		pip install -r ./src/requirements.txt

run:
		$(V); \
		gunicorn -b localhost:$(LOCAL_PORT) --chdir $(PWD)/src main:app --reload