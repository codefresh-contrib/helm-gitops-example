{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | replace "/" "-" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "namespacename" -}}
{{- $namespacename := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s" ($namespacename) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "prnamespacename" -}}
{{- $namespacename := default .Chart.Name .Values.nameOverride -}}
{{- $prnamespacename := printf "%s-%s" "pr" $namespacename -}}
{{- printf "%s" $prnamespacename | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "releasename" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}