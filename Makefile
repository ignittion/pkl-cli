build:
	docker build -t jesscarlos/pkl-cli:latest -t jesscarlos/pkl-cli:0.25.2 .

publish: build
	docker push -a jesscarlos/pkl-cli
