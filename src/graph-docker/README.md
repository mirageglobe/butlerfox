to run

```bash
# to build
docker build -t butlerfox-graph .

# to run
docker run -it -v $(pwd):/app butlerfox-graph <dotgraph file>
docker run -it -v $(pwd):/app butlerfox-graph dotgraph.dot
```
