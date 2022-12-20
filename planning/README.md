# Planning 

The documents linked here outline major endeavors to the tracker, both the backend and front. If a major feature is requested, it should be included in this document which will then be broken up into individual tasks laid out in GH issues. 

- [Frontend](./frontend.md)
- [Backend](./backend.md)
- [Infrastructure](./infra.md)
- [Miscellaneous](./miscellaneous.md)

### Report Generation 

Each month a report is generated summarizing open/closed issues created for the month. It is done by running a tool called [tackle](https://github.com/robcxyz/tackle-box) that queries the github API for issues and renders a document. This document is then modified to produce the report. 

To run the tool, first install tackle (`pip install tackle`), `cd planning` (this directory), and run `tackle` without any arguments. Contact Rob if you want to adopt this tooling for your reporting as minor modifications will need to be made that Rob is best suited to help out with.
