class SearchEngine {
  String kind;
  Url url;
  Queries queries;
  Context context;
  SearchInformation searchInformation;
  List<Item> items;

  SearchEngine({
    required this.kind,
    required this.url,
    required this.queries,
    required this.context,
    required this.searchInformation,
    required this.items,
  });
}

class Context {
  String title;

  Context({
    required this.title,
  });
}

class Item {
  Kind kind;
  String title;
  String htmlTitle;
  String link;
  String displayLink;
  String snippet;
  String htmlSnippet;
  String cacheId;
  String formattedUrl;
  String htmlFormattedUrl;
  Pagemap pagemap;

  Item({
    required this.kind,
    required this.title,
    required this.htmlTitle,
    required this.link,
    required this.displayLink,
    required this.snippet,
    required this.htmlSnippet,
    required this.cacheId,
    required this.formattedUrl,
    required this.htmlFormattedUrl,
    required this.pagemap,
  });
}

enum Kind { CUSTOMSEARCH_RESULT }

class Pagemap {
  List<Metatag> metatags;
  List<CseImage>? cseImage;
  List<CseThumbnail>? cseThumbnail;
  List<Sitenavigationelement>? sitenavigationelement;
  List<Organization>? organization;

  Pagemap({
    required this.metatags,
    this.cseImage,
    this.cseThumbnail,
    this.sitenavigationelement,
    this.organization,
  });
}

class CseImage {
  String src;

  CseImage({
    required this.src,
  });
}

class CseThumbnail {
  String src;
  String width;
  String height;

  CseThumbnail({
    required this.src,
    required this.width,
    required this.height,
  });
}

class Metatag {
  String? ogImage;
  String? ogImageWidth;
  String viewport;
  String? ogImageHeight;
  String? ogImageType;
  String? ogDescription;
  String? msapplicationTilecolor;
  String? msapplicationConfig;
  String? ogType;
  String? twitterCard;
  String? twitterTitle;
  String? themeColor;
  String? twitterUrl;
  String? ogTitle;
  String? title;
  String? colorScheme;
  String? twitterImage;
  String? twitterDescription;
  String? ogUrl;
  String? twitterAriaText;
  String? ogAriaText;
  String? referrer;
  String? fbAppId;
  String? twitterSite;
  String? formatDetection;
  String? twitterImageAlt;
  String? release;
  String? version;
  String? ogImageSecureUrl;
  String? cdcContentSource;
  String? cdcContentId;
  String? cdcMaintainedBy;
  String? cdcFirstPublished;
  String? cdcLastUpdated;
  DateTime? dcDate;
  String? cdcWcmsBuild;
  String? cdcTemplateVersion;
  String? cdcVersion;
  DateTime? cdcLastPublished;
  String? appleMobileWebAppCapable;
  String? mobileWebAppCapable;
  String? cdcLastReviewed;
  String? cdcBuild;
  String? ogSiteName;
  String? twitterDomain;
  String? twitterImageHeight;
  String? msapplicationTileimage;
  String? twitterImageSrc;
  String? twitterImageWidth;

  Metatag({
    this.ogImage,
    this.ogImageWidth,
    required this.viewport,
    this.ogImageHeight,
    this.ogImageType,
    this.ogDescription,
    this.msapplicationTilecolor,
    this.msapplicationConfig,
    this.ogType,
    this.twitterCard,
    this.twitterTitle,
    this.themeColor,
    this.twitterUrl,
    this.ogTitle,
    this.title,
    this.colorScheme,
    this.twitterImage,
    this.twitterDescription,
    this.ogUrl,
    this.twitterAriaText,
    this.ogAriaText,
    this.referrer,
    this.fbAppId,
    this.twitterSite,
    this.formatDetection,
    this.twitterImageAlt,
    this.release,
    this.version,
    this.ogImageSecureUrl,
    this.cdcContentSource,
    this.cdcContentId,
    this.cdcMaintainedBy,
    this.cdcFirstPublished,
    this.cdcLastUpdated,
    this.dcDate,
    this.cdcWcmsBuild,
    this.cdcTemplateVersion,
    this.cdcVersion,
    this.cdcLastPublished,
    this.appleMobileWebAppCapable,
    this.mobileWebAppCapable,
    this.cdcLastReviewed,
    this.cdcBuild,
    this.ogSiteName,
    this.twitterDomain,
    this.twitterImageHeight,
    this.msapplicationTileimage,
    this.twitterImageSrc,
    this.twitterImageWidth,
  });
}

class Organization {
  String telephone;
  String url;

  Organization({
    required this.telephone,
    required this.url,
  });
}

class Sitenavigationelement {
  String name;

  Sitenavigationelement({
    required this.name,
  });
}

class Queries {
  List<NextPage> request;
  List<NextPage> nextPage;

  Queries({
    required this.request,
    required this.nextPage,
  });
}

class NextPage {
  String title;
  String totalResults;
  String searchTerms;
  int count;
  int startIndex;
  String inputEncoding;
  String outputEncoding;
  String safe;
  String cx;

  NextPage({
    required this.title,
    required this.totalResults,
    required this.searchTerms,
    required this.count,
    required this.startIndex,
    required this.inputEncoding,
    required this.outputEncoding,
    required this.safe,
    required this.cx,
  });
}

class SearchInformation {
  double searchTime;
  String formattedSearchTime;
  String totalResults;
  String formattedTotalResults;

  SearchInformation({
    required this.searchTime,
    required this.formattedSearchTime,
    required this.totalResults,
    required this.formattedTotalResults,
  });
}

class Url {
  String type;
  String template;

  Url({
    required this.type,
    required this.template,
  });
}
