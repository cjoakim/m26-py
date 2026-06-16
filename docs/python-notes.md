# Python Notes

## Python Version

- Use python 3 from python.org
  - Python 2 is only used in legacy systems
- Avoid packaged "python distributions" like Anaconda

## Dependencies and Virtual Environments

- Libraries/Packages are hosted at [PyPI](https://pypi.org/)
- Define your project dependencies in the **pyproject.toml** file in the project
- Use **venv.sh** or **venv.ps1** to create the python **virtual environment**, or venv
  - See https://docs.python.org/3/library/venv.html
  - A project-specific version of python and the associated libraries the project uses
- The virtual environment must be **activated** in terminal/powershell when you enter the project directory
  - linux/mac: source .venv/bin/activate
  - windows: .\.venv\Scripts\activate
  - Pro-Tip: use a bash alias or PowerShell function to activate a venv
- The **uv** program is the fast and modern alternative to **pip** for installing libraries into a venv
  - See https://docs.astral.sh/uv/
  - See related program "ruff" for code formatting
    - https://docs.astral.sh/ruff/ 
- Strive to use the Python Standard Libraries where possible rather than PyPi libs
  - See https://docs.python.org/3/library/index.html
  - Some incompatible sets of libraries can result in "dependency hell"


#### uv pip list

```
$ uv pip list
Package         Version Editable project location
--------------- ------- ----------------------------
astroid         4.0.4
coverage        7.14.1
dill            0.4.1
iniconfig       2.3.0
isort           8.0.1
m26             1.0.0   /Users/cjoakim/github/m26-py
mccabe          0.7.0
packaging       26.2
platformdirs    4.10.0
pluggy          1.6.0
pygments        2.20.0
pylint          4.0.6
pytest          9.1.0
pytest-cov      7.1.0
pytest-randomly 4.1.0
tomlkit         0.15.0
```

#### uv tree

Display the dependency graph of the libraries in the venv.

```
$ uv tree
Resolved 17 packages in 19ms
m26 v1.0.0
├── pylint v4.0.5
│   ├── astroid v4.0.4
│   ├── dill v0.4.1
│   ├── isort v8.0.1
│   ├── mccabe v0.7.0
│   ├── platformdirs v4.10.0
│   └── tomlkit v0.15.0
├── pytest v9.0.3
│   ├── iniconfig v2.3.0
│   ├── packaging v26.2
│   ├── pluggy v1.6.0
│   └── pygments v2.20.0
├── pytest-cov v7.1.0
│   ├── coverage v7.14.1
│   ├── pluggy v1.6.0
│   └── pytest v9.0.3 (*)
└── pytest-randomly v4.1.0
    └── pytest v9.0.3 (*)
(*) Package tree already displayed
```

---

## synchronous vs asynchronous

Prefer to create asynchronous code, as many modern python libraries
are async and must be called in an asynchronous manner.

Use the **asyncio** [standard library](https://docs.python.org/3/library/index.html)

#### example: async-poem.py 

```
import asyncio
import random
import sys

# Simple example of asynchronous programming in Python.


async def write_me_a_poem(subject: str) -> str:
    # simulate async behavior with the asyncio.sleep(seconds) method
    await asyncio.sleep(0.01)

    color = random.choice(["blue", "green", "gray"])
    lines = list()
    lines.append("Roses are red")
    lines.append("Violets are blue")
    lines.append(f"I feel {color}")
    lines.append("When I'm not with you")
    lines.append("")
    lines.append(f"Oh, I forgot to include {subject} in this poem!")
    return "\n".join(lines)


async def main():
    poem = await write_me_a_poem(sys.argv[1])
    print(poem)


if __name__ == "__main__":
    # __main__ is the entry-point to the program when python is executed at the command-line
    # Use the asyncio.run() method to run the main() function asynchronously
    asyncio.run(main())
```

Run this program from the command-line:

```
python async-poem.py cats
- or -
uv run async-poem.py cats
```

---

## Program entry point

The **if __name__ == "__main__":** is the optional entry-point
for a python module when it is invoked from the command line.
See the above example.

---

## Unit Testing

- **pytest** is a widely-used testing framework
  - See https://pypi.org/project/pytest/
  - See tests.ps1 and tests.sh in this repo
  - See the tests/ directory in this repo
- Use **code coverage** in your test suite
  - Example command: pytest -v --cov=m26/ --cov-report html tests/
  - Then open file htmlcov/index.html with your web browser

---

## Python Libraries on PyPI

A curated list of my favorite libraries.

- General
  - https://pypi.org/project/dotenv/ - Load environment variables from a git-ignored .env file
  - https://pypi.org/project/docopt/ - Use a multiline header comment for CLI usage help content
  - https://pypi.org/project/Jinja2/ - Text template engine
  - https://pypi.org/project/BeautifulSoup/ - HTML parsing
  - https://pypi.org/project/lxml/ - XML parsing, including SAX API
  - https://pypi.org/project/pandas/ - Data and Dataframes
  - https://pypi.org/project/polars/ - Faster-than-Pandas Dataframes
  - https://pypi.org/project/matplotlib/ - Charts, plots
  - https://pypi.org/project/jupyter/ - Jupyter Notebooks
  - https://pypi.org/project/networkx/ - Networks and graphs
  - https://pypi.org/project/reportlab/ - PDF generation
- Testing
  - https://pypi.org/project/pytest/ - Unit-testing framework
  - https://pypi.org/project/pytest-cov/ - Code coverage
  - https://pypi.org/project/pytest-asyncio/ - Pytest support for asyncio
  - https://pypi.org/project/Faker/ - Synthetic data generator
- Database
  - https://pypi.org/project/cosmos/ - Azure Cosmos DB
  - https://pypi.org/project/pymongo/ - MongoDB 
  - https://pypi.org/project/psycopg2/ - Driver for PostgreSQL
  - https://docs.python.org/3/library/sqlite3.html - Standard Library for sqlite3
  - https://pypi.org/project/SQLAlchemy/ - ORM if you're not using Django
  - https://pypi.org/project/alembic/ - Database migration tool for SQLAlchemy
  - https://pypi.org/project/duckdb/ - Not really a DB.  In-memory.  Fetch remote CSVs.
- Web
  - https://pypi.org/project/Django/ - Web application framework, best for RDBMS based apps
  - https://pypi.org/project/fastapi/ - Fast async web service framework
  - https://pypi.org/project/fastmcp/ - Build MCP servers and clients
  - https://pypi.org/project/httpx/ - HTTP client with CLI
  - https://pypi.org/project/requests/ - HTTP client
  - https://pypi.org/project/streamlit/ - Trendy UI library for data apps
  - https://pypi.org/project/Flask/ - Simple web framework
    - Generally avoid Flask as it is synchronous.  Use either fastapi or django instead
  - https://pypi.org/project/Quart/ - An async version of Flask
    - I prefer fastapi or django instead
- AI
  - https://pypi.org/project/openai/ - OpenAI SDK
  - https://pypi.org/project/agent-framework/ - Microsoft Agent Framework
  - azure-ai-documentintelligence - Azure Document Intelligence
  - https://pypi.org/project/tiktoken/ - Token counter/tokenizer
  - https://pypi.org/project/tenacity/ - Automatic retries, on 429s, with exponential-backoff
- Other Azure PaaS Services
  - https://pypi.org/project/azure-storage-blob/ - Azure Storage
  - https://pypi.org/project/azure-search-documents/ - Azure Search
