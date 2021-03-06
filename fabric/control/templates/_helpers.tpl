{{/*
Define the namespaces Control will monitor
*/}}
{{- define "control.namespaces" -}}
{{- if $.Values.global.control.additional_namespaces }}
{{- printf "%s,%s"  $.Release.Namespace $.Values.global.control.additional_namespaces -}}
{{- else }}
{{- printf "%s" $.Release.Namespace }}
{{- end }}
{{- end -}}

{{/*
Handles replicas for releases.
Takes in global.release.X and .Values.<service>.replicas
Presidence is globals > service level > default to 1
*/}}
{{- define "replicas" -}}
  {{- $top := index . "top" -}}
  {{- $svc_rep := index . "service_values" -}}
  {{- if and $top.Values.global.release.production $top.Values.global.release.default_replicas -}}
  {{ print $top.Values.global.release.default_replicas }}
  {{- else if  $svc_rep -}}
  {{ print $svc_rep }}
  {{ else -}}
  {{ print 1 }}
  {{- end }}
{{- end }}