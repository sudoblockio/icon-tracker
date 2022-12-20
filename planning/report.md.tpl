# Tracker Monthly Report

This is a progress update for {{month}}/2022 on infrastructure provided by sudoblock including development of the tracker, indexer, and operation of RPC endpoints being used to support the ICON ecosystem.

### Summary

[Brief summary of month's progress]
{% for r in repos %}
### [{{ r.name }}]({{ r.url }})

#### Closed Issues

| Number | Name | Status | Created | Notes |
| --- | --- | --- | --- | --- |{% for i in r.closed_issues %}
| [{{ i.number }}]({{ i.html_url }}) | {{ i.title }} | {{ i.state }} | {{ i.created_at }} | | {% endfor %}
| | | | | |

#### Open Issues

| Number | Name | Status | Created | Notes |
| --- | --- | --- | --- | --- | {% for i in r.open_issues %}
| [{{ i.number }}]({{ i.html_url }}) | {{ i.title }} | {{ i.state }} | {{ i.created_at }} | | {% endfor %}
| | | | | |
{% endfor %}

## Downtime Incidents

| Date | Total Downtime | Cause | Resolution |
| --- | --- | --- | --- |
| | | |

> Report generated with [tackle](https://github.com/robcxyz/tackle-box)
