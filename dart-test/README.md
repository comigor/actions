# dart-test action

Test, analyze and lint a Dart/Flutter package.

## Variables

| Required? | Variable                 | Description                                                               |
|-----------|--------------------------|---------------------------------------------------------------------------|
| No        | **DTA_DISABLE_LINTER**   | Disable dry-run `dartfmt` linter check                                    |
| No        | **DTA_DISABLE_ANALYZER** | Disable `dartanalyzer`                                                    |
| No        | **DTA_DISABLE_TESTS**    | Disable `pub run test`                                                    |
| No        | **DTA_EXCLUDE_REGEX**    | Regex to be used to exclude folders when looking for `pubspec.yaml` files |

## Example workflow

```hcl
workflow "Test my package!" {
  on = "push"
  resolves = ["Test"]
}

action "Test" {
  uses = "comigor/actions/dart-test@master"
}
```
