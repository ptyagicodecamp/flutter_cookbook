enum NavLinks { Home, Github, Videos, Jobs }

String displayString(NavLinks link) {
  switch(link) {
    case NavLinks.Home:
      return "Home";
      break;

    case NavLinks.Github:
      return "Github";
      break;
    case NavLinks.Videos:
      return "Videos";
      break;

    case NavLinks.Jobs:
      return "Jobs";
      break;

    default:
      return "";

  }
}

String linkUrl(NavLinks link) {
  switch(link) {
    case NavLinks.Home:
      return "https://flutter-to-fly.web.app/";
      break;

    case NavLinks.Github:
      return "https://github.com/ptyagicodecamp";
      break;
    case NavLinks.Videos:
      return "https://www.youtube.com/channel/UCO3_dbHasEnA2dr_U0EhMAA?view_as=subscriber";
      break;

    case NavLinks.Jobs:
      return "https://flutterjobs.info/jobs/all";
      break;

    default:
      return "";

  }
}