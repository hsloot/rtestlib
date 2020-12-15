lib_path_restore <- .libPaths()
local_lib <- tempfile("RLIB_")
if (!dir.exists(local_lib)) dir.create(local_lib)
.libPaths(c(local_lib, .libPaths()))
message("Loading testutils.rtestlib")
remotes::install_local("testutils.rtestlib", type = "source", repos = NULL,
                       quiet = TRUE, dependencies = FALSE, build = FALSE,
                       upgrade = FALSE)

withr::defer({
  .libPaths(lib_path_restore)
  try({
    detach("testutils.rtestlib", unload = TRUE)
  }, silent = TRUE)
  if (dir.exists(file.path(local_lib, "testutils.rtestlib")))
    unlink(file.path(local_lib, "testutils.rtestlib"))
},
teardown_env()
)
