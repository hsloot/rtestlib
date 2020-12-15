lib_path_restore <- .libPaths()
local_lib <- tempfile()
dir.create(local_lib)
message("Loading testutils.rtestlib")
remotes::install_local("testutils.rtestlib", type = "source", quiet = TRUE,
                       lib = local_lib)
.libPaths(c(local_lib, .libPaths()))

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
