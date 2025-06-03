return {
  (_G.llm == "copilot") and {
    "github/copilot.vim",
  } or nil,
  (_G.llm == "amazon-q") and {
    nil
  } or nil,
}
