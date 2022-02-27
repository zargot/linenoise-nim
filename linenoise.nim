# FROM linenoise.h -- VERSION 1.0
#
# Wrapped linenoise library for Nim.
#

{.compile: "clinenoise.c".}

type
  Completions* = object
    len*: csize_t
    cvec*: cstringArray

  CompletionCallback* = proc (a2: cstring; a3: ptr Completions) {.cdecl.}
  HintsCallback* = proc (a2: cstring; color, bold: ptr cint): cstring
  FreeHintsCallback* = proc (a2: pointer)

proc setCompletionCallback*(a2: ptr CompletionCallback) {.cdecl,
    importc: "linenoiseSetCompletionCallback".}
proc setHintsCallback*(a2: ptr HintsCallback) {.cdecl,
    importc: "linenoiseSetHintsCallback".}
proc setFreeHintsCallback*(a2: ptr FreeHintsCallback) {.cdecl,
    importc: "linenoiseSetFreeHintsCallback".}
proc addCompletion*(a2: ptr Completions; a3: cstring) {.cdecl,
    importc: "linenoiseAddCompletion".}

proc linenoisePrompt*(prompt: cstring): cstring {.cdecl, importc: "linenoise".}
proc free*(a2: pointer) {.cdecl, importc: "linenoiseFree".}
proc historyAdd*(line: cstring): cint {.cdecl, importc: "linenoiseHistoryAdd".}
proc historySetMaxLen*(len: cint): cint {.cdecl,
    importc: "linenoiseHistorySetMaxLen".}
proc historySave*(filename: cstring): cint {.cdecl,
    importc: "linenoiseHistorySave".}
proc historyLoad*(filename: cstring): cint {.cdecl,
    importc: "linenoiseHistoryLoad".}
proc clearScreen*() {.cdecl, importc: "linenoiseClearScreen".}
proc setMultiLine*(ml: cint) {.cdecl, importc: "linenoiseSetMultiLine".}
proc printKeyCodes*() {.cdecl, importc: "linenoisePrintKeyCodes".}
proc maskModeEnable*() {.cdecl, importc: "linenoiseMaskModeEnable".}
proc maskModeDisable*() {.cdecl, importc: "linenoiseMaskModeDisable".}
