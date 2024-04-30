import
  std/terminal,     # import standard terminal lib
  std/strutils,
  getDistroId,      # import to get distro id through /etc/os-release
  ../assets/logos,  # uncomment if you use your own logo
  ../nitches/[getUser, getHostname,
                  getDistro, getKernel,
                  getUptime, getShell,
                  getPkgs, getRam, getLogo]  # import nitches to get info about user system

# the main function for drawing fetch
proc drawInfo*(asciiArt: bool) =
  let  # distro id (arch, manjaro, debian)
    distroId = getDistroId()

  let  # logo and it color
    coloredLogo = (fgBlue, archlogo)  # color + logo tuple
    # (fgRed, nitchlogo)

  const  # icons before cotegores
    userIcon   = " "  # recomended: " " or "|>"
    hnameIcon  = " "  # recomended: " " or "|>"
    distroIcon = "󰻀 "  # recomended: "󰻀 " or "|>"
    kernelIcon = "󰌢 "  # recomended: "󰌢 " or "|>"
    uptimeIcon = " "  # recomended: " " or "|>"
    shellIcon  = " "  # recomended: " " or "|>"
    pkgsIcon   = "󰏖 "  # recomended: "󰏖 " or "|>"
    ramIcon    = "󰍛 "  # recomended: "󰍛 " or "|>"
    colorsIcon = "󰏘 "  # recomended: "󰏘 " or "->"
    # please insert any char after the icon
    # to avoid the bug with cropping the edge of the icon

    dotIcon = "■"  # recomended: "" or "■"
    # icon for demonstrate colors

  const  # categories
    userCat   = " user   │ "  # recomended: " user   │ "
    hnameCat  = " hname  │ "  # recomended: " hname  │ "
    distroCat = " distro │ "  # recomended: " distro │ "
    kernelCat = " kernel │ "  # recomended: " kernel │ "-
    uptimeCat = " uptime │ "  # recomended: " uptime │ "
    shellCat  = " shell  │ "  # recomended: " shell  │ "
    pkgsCat   = " pkgs   │ "  # recomended: " pkgs   │ "
    ramCat    = " memory │ "  # recomended: " memory │ "
    colorsCat = " colors │ "  # recomended: " colors │ "

  let  # all info about system
    userInfo     = getUser()          # get user through $USER env variable
    hostnameInfo = getHostname()      # get Hostname hostname through /etc/hostname
    distroInfo   = getDistro()        # get distro through /etc/os-release
    kernelInfo   = getKernel()        # get kernel through /proc/version
    uptimeInfo   = getUptime()        # get Uptime through /proc/uptime file
    shellInfo    = getShell()         # get shell through $SHELL env variable
    pkgsInfo     = getPkgs(distroId)  # get amount of packages in distro
    ramInfo      = getRam()           # get ram through /proc/meminfo

  const  # aliases for colors
    color1 = fgBlue
    color2 = fgWhite
    color3 = fgGreen
    color4 = fgYellow
    color5 = fgWhite
    color6 = fgGreen
    color7 = fgYellow
    color8 = fgBlue
    color0 = fgDefault

  # ascii art
  if not asciiArt:
    discard
  else:
    stdout.styledWrite(styleBright, coloredLogo[0], coloredLogo[1], color0)

  # colored out
    stdout.styledWrite("\n", styleBright, "  ╭───────────╮\n")
    stdout.styledWrite("  │ ", color1, userIcon, color0, userCat, color1, userInfo, color0, "\n",)
    if not isEmptyOrWhitespace(hostnameInfo):
      stdout.styledWrite("  │ ", color2, hnameIcon, color0, hnameCat, color2, hostnameInfo, color0, "\n")
    stdout.styledWrite("  │ ", color3, distroIcon, color0, distroCat, color3, distroInfo, color0, "\n")
    stdout.styledWrite("  │ ", color4, kernelIcon, color0, kernelCat, color4, kernelInfo, "\n")
    stdout.styledWrite("  │ ", color5, shellIcon, color0, shellCat, color5, shellInfo, color0, "\n")
    stdout.styledWrite("  │ ", color6, pkgsIcon, color0, pkgsCat, color6, pkgsInfo, color0, "\n")
    stdout.styledWrite("  ╰───────────╯\n\n")
