# NeonAI LLM Claude
Proxies API calls to Anthropic Claude.

## Request Format
API requests should include `history`, a list of tuples of strings, and the current
`query`

>Example Request:
>```json
>{
>  "history": [["user", "hello"], ["llm", "hi"]],
>  "query": "how are you?"
>}
>```

## Response Format
Responses will be returned as dictionaries. Responses should contain the following:
- `response` - String LLM response to the query

## Docker Configuration
When running this as a docker container, the `XDG_CONFIG_HOME` envvar is set to `/config`.
A configuration file at `/config/neon/diana.yaml` is required and should look like:
```yaml
MQ:
  port: <MQ Port>
  server: <MQ Hostname or IP>
  users:
    neon_llm_claude:
      password: <neon_claude user's password>
      user: neon_claude
LLM_CLAUDE:
  key: ""
  model: "claude-instant-1"
  role: "You are trying to give a short answer in less than 40 words."
  context_depth: 3
  max_tokens: 100
  num_parallel_processes: 2
```

For example, if your configuration resides in `~/.config`:
```shell
export CONFIG_PATH="/home/${USER}/.config"
docker run -v ${CONFIG_PATH}:/config neon_llm_claude
```
> Note: If connecting to a local MQ server, you may need to specify `--network host`