lib_path_restore <- .libPaths()
local_lib <- tempdir()
message("Loading testutils.rtestlib")
.libPaths(c(local_lib, .libPaths()))
remotes::install_local("testutils.rtestlib", type = "source", quiet = TRUE)


withr::defer({
  .libPaths(lib_path_restore)
  try({
    detach("testutils.rtestlib", unload = TRUE)
  }, silent = TRUE)
  package_dir <- file.path(local_lib, "testutils.rtestlib")
  if (dir.exists(package_dir)) unlink(package_dir)
},
teardown_env()
)
