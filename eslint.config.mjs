import js from "@eslint/js";
import globals from "globals";
import markdown from "@eslint/markdown";
import json from "eslint-plugin-jsonc";
import yaml from "eslint-plugin-yml";
import prettier from "eslint-config-prettier";
import jsonschema from "eslint-plugin-json-schema-validator";
import { defineConfig } from "eslint/config";

export default defineConfig([
  {
    ignores: [".agents", ".obsidian"],
  },
  {
    files: ["**/*.{js,mjs,cjs}"],
    plugins: { js },
    extends: ["js/recommended"],
    languageOptions: { globals: globals.node },
  },
  {
    files: ["**/*.{json,jsonc,json5}", ".*rc"],
    plugins: { json, jsonschema },
    language: "json/json",
    extends: ["json/base", "jsonschema/recommended"],
  },
  {
    files: ["**/*.{yml,yaml}"],
    plugins: { yaml, jsonschema },
    language: "yaml/yaml",
    extends: ["yaml/recommended", "jsonschema/recommended"],
  },
  {
    files: ["**/*.md"],
    plugins: { markdown },
    language: "markdown/gfm",
    extends: ["markdown/recommended"],
  },
  prettier,
]);
