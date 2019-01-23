# dart-test action

Test, analyze and lint a Dart package.

## Variables

| Required? | Variable                 | Description                            |
|-----------|--------------------------|----------------------------------------|
| No        | **DTA_DISABLE_LINTER**   | Disable dry-run `dartfmt` linter check |
| No        | **DTA_DISABLE_ANALYZER** | Disable `dartanalyzer`                 |
| No        | **DTA_DISABLE_TESTS**    | Disable `pub run test`                 |

## Example workflow

```hcl
workflow "Test my package!" {
  on = "push"
  resolves = ["Test"]
}

action "Test" {
  uses = "Igor1201/actions/dart-test@master"
}
```
