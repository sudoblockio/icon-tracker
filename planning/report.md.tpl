# Tracker Monthly Report

Progress report for {{month}}/2022

### Issue Summary

[Brief summary of month's progress]
{% for r in repos %}
### {{ r.name }}

#### Closed Issues

| Number | Name | Status | Created | Notes |
| --- | --- | --- | --- | --- | {% for i in r.open_issues %}
| [{{ i.number }}]({{ i.url }}) | {{ i.title }} | {{ i.state }} | {{ i.created_at }} | | {% endfor %}
| | | | | |

#### Open Issues

| Number | Name | Status | Created | Notes |
| --- | --- | --- | --- | --- |{% for i in r.closed_issues %}
| [{{ i.number }}]({{ i.url }}) | {{ i.title }} | {{ i.state }} | {{ i.created_at }} | | {% endfor %}
| | | | | |{% endfor %}

## Downtime Incidents

| Date | Total Downtime | Cause | Resolution |
| --- | --- | --- | --- |
| | | |

> Report generated with [tackle](https://github.com/robcxyz/tackle-box)
