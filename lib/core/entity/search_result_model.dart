class SearchResultModel {
  Albums? album;
  Artists? artist;
  Tracks? track;
  Playlists? playlist;
  Shows? show;
  Episodes? episode;

  SearchResultModel({
    this.album,
    this.artist,
    this.track,
    this.playlist,
    this.show,
    this.episode,
  });

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    album = json['albums'] != null ? new Albums.fromJson(json['albums']) : null;
    artist =
        json['artists'] != null ? new Artists.fromJson(json['artists']) : null;
    track = json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
    playlist = json['playlists'] != null
        ? new Playlists.fromJson(json['playlists'])
        : null;
    show = json['shows'] != null ? new Shows.fromJson(json['shows']) : null;
    episode = json['episodes'] != null
        ? new Episodes.fromJson(json['episodes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.album != null) {
      data['albums'] = this.album!.toJson();
    }
    if (this.artist != null) {
      data['artists'] = this.artist!.toJson();
    }
    if (this.track != null) {
      data['tracks'] = this.track!.toJson();
    }
    if (this.playlist != null) {
      data['playlists'] = this.playlist!.toJson();
    }
    if (this.show != null) {
      data['shows'] = this.show!.toJson();
    }
    if (this.episode != null) {
      data['episodes'] = this.episode!.toJson();
    }

    return data;
  }
}

///////
///
///
/// ALBUM
class Album {
  Albums? albums;

  Album({this.albums});

  Album.fromJson(Map<String, dynamic> json) {
    albums =
        json['albums'] != null ? new Albums.fromJson(json['albums']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albums != null) {
      data['albums'] = this.albums!.toJson();
    }
    return data;
  }
}

class Albums {
  String? href;
  List<AlbumItem>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Albums(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Albums.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <AlbumItem>[];
      json['items'].forEach((v) {
        items!.add(new AlbumItem.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class AlbumItem {
  String? albumType;
  List<AlbumArtists>? artists;
  AlbumExternalUrls? externalUrls;
  String? href;
  String? id;
  List<AlbumImages>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  AlbumItem(
      {this.albumType,
      this.artists,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.releaseDate,
      this.releaseDatePrecision,
      this.totalTracks,
      this.type,
      this.uri});

  AlbumItem.fromJson(Map<String, dynamic> json) {
    albumType = json['album_type'];
    if (json['artists'] != null) {
      artists = <AlbumArtists>[];
      json['artists'].forEach((v) {
        artists!.add(new AlbumArtists.fromJson(v));
      });
    }
    externalUrls = json['external_urls'] != null
        ? new AlbumExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <AlbumImages>[];
      json['images'].forEach((v) {
        images!.add(new AlbumImages.fromJson(v));
      });
    }
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    totalTracks = json['total_tracks'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_type'] = this.albumType;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    data['total_tracks'] = this.totalTracks;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class AlbumArtists {
  AlbumExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  AlbumArtists(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  AlbumArtists.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? new AlbumExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class AlbumExternalUrls {
  String? spotify;

  AlbumExternalUrls({this.spotify});

  AlbumExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class AlbumImages {
  int? height;
  String? url;
  int? width;

  AlbumImages({this.height, this.url, this.width});

  AlbumImages.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

///
///
///
///////

////////////////////////////////

///////
///
///
/// Artists

class Artist {
  Artists? artists;

  Artist({this.artists});

  Artist.fromJson(Map<String, dynamic> json) {
    artists =
        json['artists'] != null ? new Artists.fromJson(json['artists']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists!.toJson();
    }
    return data;
  }
}

class Artists {
  String? href;
  List<ArtistItem>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Artists(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Artists.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <ArtistItem>[];
      json['items'].forEach((v) {
        items!.add(new ArtistItem.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class ArtistItem {
  ArtistExternalUrls? externalUrls;
  ArtistFollowers? followers;

  String? href;
  String? id;
  List<ArtistImages>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  ArtistItem(
      {this.externalUrls,
      this.followers,
      this.href,
      this.id,
      this.images,
      this.name,
      this.popularity,
      this.type,
      this.uri});

  ArtistItem.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? new ArtistExternalUrls.fromJson(json['external_urls'])
        : null;
    followers = json['followers'] != null
        ? new ArtistFollowers.fromJson(json['followers'])
        : null;

    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <ArtistImages>[];
      json['images'].forEach((v) {
        images!.add(new ArtistImages.fromJson(v));
      });
    }
    name = json['name'];
    popularity = json['popularity'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    if (this.followers != null) {
      data['followers'] = this.followers!.toJson();
    }

    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class ArtistExternalUrls {
  String? spotify;

  ArtistExternalUrls({this.spotify});

  ArtistExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class ArtistFollowers {
  Null? href;
  int? total;

  ArtistFollowers({this.href, this.total});

  ArtistFollowers.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['total'] = this.total;
    return data;
  }
}

class ArtistImages {
  int? height;
  String? url;
  int? width;

  ArtistImages({this.height, this.url, this.width});

  ArtistImages.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

///
///
///
///////

////////////////////////////////

///////
///
///
/// TRACK

class Track {
  Tracks? tracks;

  Track({this.tracks});

  Track.fromJson(Map<String, dynamic> json) {
    tracks =
        json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.toJson();
    }
    return data;
  }
}

class Tracks {
  String? href;
  List<TrackItem>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Tracks(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Tracks.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <TrackItem>[];
      json['items'].forEach((v) {
        items!.add(new TrackItem.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class TrackItem {
  TrackAlbum? album;
  List<TrackArtists>? artists;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  TrackExternalIds? externalIds;
  TrackExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  bool? isPlayable;
  String? name;
  int? popularity;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;

  TrackItem(
      {this.album,
      this.artists,
      this.discNumber,
      this.durationMs,
      this.explicit,
      this.externalIds,
      this.externalUrls,
      this.href,
      this.id,
      this.isLocal,
      this.isPlayable,
      this.name,
      this.popularity,
      this.previewUrl,
      this.trackNumber,
      this.type,
      this.uri});

  TrackItem.fromJson(Map<String, dynamic> json) {
    album =
        json['album'] != null ? new TrackAlbum.fromJson(json['album']) : null;
    if (json['artists'] != null) {
      artists = <TrackArtists>[];
      json['artists'].forEach((v) {
        artists!.add(new TrackArtists.fromJson(v));
      });
    }
    discNumber = json['disc_number'];
    durationMs = json['duration_ms'];
    explicit = json['explicit'];
    externalIds = json['external_ids'] != null
        ? new TrackExternalIds.fromJson(json['external_ids'])
        : null;
    externalUrls = json['external_urls'] != null
        ? new TrackExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    isLocal = json['is_local'];
    isPlayable = json['is_playable'];
    name = json['name'];
    popularity = json['popularity'];
    previewUrl = json['preview_url'];
    trackNumber = json['track_number'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['disc_number'] = this.discNumber;
    data['duration_ms'] = this.durationMs;
    data['explicit'] = this.explicit;
    if (this.externalIds != null) {
      data['external_ids'] = this.externalIds!.toJson();
    }
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['is_local'] = this.isLocal;
    data['is_playable'] = this.isPlayable;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['preview_url'] = this.previewUrl;
    data['track_number'] = this.trackNumber;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class TrackAlbum {
  String? albumType;
  List<Artists>? artists;
  TrackExternalUrls? externalUrls;
  String? href;
  String? id;
  List<TrackImages>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  TrackAlbum(
      {this.albumType,
      this.artists,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.releaseDate,
      this.releaseDatePrecision,
      this.totalTracks,
      this.type,
      this.uri});

  TrackAlbum.fromJson(Map<String, dynamic> json) {
    albumType = json['album_type'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    externalUrls = json['external_urls'] != null
        ? new TrackExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <TrackImages>[];
      json['images'].forEach((v) {
        images!.add(new TrackImages.fromJson(v));
      });
    }
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    totalTracks = json['total_tracks'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_type'] = this.albumType;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    data['total_tracks'] = this.totalTracks;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class TrackArtists {
  TrackExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  TrackArtists(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  TrackArtists.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? new TrackExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class TrackExternalUrls {
  String? spotify;

  TrackExternalUrls({this.spotify});

  TrackExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class TrackImages {
  int? height;
  String? url;
  int? width;

  TrackImages({this.height, this.url, this.width});

  TrackImages.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class TrackExternalIds {
  String? isrc;

  TrackExternalIds({this.isrc});

  TrackExternalIds.fromJson(Map<String, dynamic> json) {
    isrc = json['isrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isrc'] = this.isrc;
    return data;
  }
}

///
///
///
///////

////////////////////////////////

///////
///
///
/// PLAYLIST

class PlayList {
  Playlists? playlists;

  PlayList({this.playlists});

  PlayList.fromJson(Map<String, dynamic> json) {
    playlists = json['playlists'] != null
        ? new Playlists.fromJson(json['playlists'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playlists != null) {
      data['playlists'] = this.playlists!.toJson();
    }
    return data;
  }
}

class Playlists {
  String? href;
  List<PlayListItems>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Playlists(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Playlists.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <PlayListItems>[];
      json['items'].forEach((v) {
        items!.add(new PlayListItems.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class PlayListItems {
  bool? collaborative;
  String? description;
  PlayListExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  Owner? owner;
  Null? primaryColor;
  Null? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  PlayListItems(
      {this.collaborative,
      this.description,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.owner,
      this.primaryColor,
      this.public,
      this.snapshotId,
      this.tracks,
      this.type,
      this.uri});

  PlayListItems.fromJson(Map<String, dynamic> json) {
    collaborative = json['collaborative'];
    description = json['description'];
    externalUrls = json['external_urls'] != null
        ? new PlayListExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    name = json['name'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    primaryColor = json['primary_color'];
    public = json['public'];
    snapshotId = json['snapshot_id'];
    tracks =
        json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collaborative'] = this.collaborative;
    data['description'] = this.description;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['primary_color'] = this.primaryColor;
    data['public'] = this.public;
    data['snapshot_id'] = this.snapshotId;
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.toJson();
    }
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class PlayListExternalUrls {
  String? spotify;

  PlayListExternalUrls({this.spotify});

  PlayListExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class Images {
  num? height;
  String? url;
  num? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class Owner {
  String? displayName;
  PlayListExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  Owner(
      {this.displayName,
      this.externalUrls,
      this.href,
      this.id,
      this.type,
      this.uri});

  Owner.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    externalUrls = json['external_urls'] != null
        ? new PlayListExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class PlayListTracks {
  String? href;
  int? total;

  PlayListTracks({this.href, this.total});

  PlayListTracks.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['total'] = this.total;
    return data;
  }
}

///
///
///
///////

////////////////////////////////

///////
///
///
/// SHOW

class Show {
  Shows? shows;

  Show({this.shows});

  Show.fromJson(Map<String, dynamic> json) {
    shows = json['shows'] != null ? new Shows.fromJson(json['shows']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shows != null) {
      data['shows'] = this.shows!.toJson();
    }
    return data;
  }
}

class Shows {
  String? href;
  List<ShowItems>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Shows(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Shows.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <ShowItems>[];
      json['items'].forEach((v) {
        items!.add(new ShowItems.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class ShowItems {
  List<String>? availableMarkets;
  String? description;
  bool? explicit;
  ShowExternalUrls? externalUrls;
  String? href;
  String? htmlDescription;
  String? id;
  List<Images>? images;
  bool? isExternallyHosted;
  List<String>? languages;
  String? mediaType;
  String? name;
  String? publisher;
  int? totalEpisodes;
  String? type;
  String? uri;

  ShowItems(
      {this.availableMarkets,
      this.description,
      this.explicit,
      this.externalUrls,
      this.href,
      this.htmlDescription,
      this.id,
      this.images,
      this.isExternallyHosted,
      this.languages,
      this.mediaType,
      this.name,
      this.publisher,
      this.totalEpisodes,
      this.type,
      this.uri});

  ShowItems.fromJson(Map<String, dynamic> json) {
    availableMarkets = json['available_markets'].cast<String>();

    description = json['description'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? new ShowExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    htmlDescription = json['html_description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    isExternallyHosted = json['is_externally_hosted'];
    languages = json['languages'].cast<String>();
    mediaType = json['media_type'];
    name = json['name'];
    publisher = json['publisher'];
    totalEpisodes = json['total_episodes'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available_markets'] = this.availableMarkets;

    data['description'] = this.description;
    data['explicit'] = this.explicit;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['html_description'] = this.htmlDescription;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['is_externally_hosted'] = this.isExternallyHosted;
    data['languages'] = this.languages;
    data['media_type'] = this.mediaType;
    data['name'] = this.name;
    data['publisher'] = this.publisher;
    data['total_episodes'] = this.totalEpisodes;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class ShowExternalUrls {
  String? spotify;

  ShowExternalUrls({this.spotify});

  ShowExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class ShowImages {
  int? height;
  String? url;
  int? width;

  ShowImages({this.height, this.url, this.width});

  ShowImages.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

///
///
///
///////

////////////////////////////////

///////
///
///
/// EPİSODE

class Episode {
  Episodes? episodes;

  Episode({this.episodes});

  Episode.fromJson(Map<String, dynamic> json) {
    episodes = json['episodes'] != null
        ? new Episodes.fromJson(json['episodes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.toJson();
    }
    return data;
  }
}

class Episodes {
  String? href;
  List<EpisodeItems>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Episodes(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Episodes.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <EpisodeItems>[];
      json['items'].forEach((v) {
        items!.add(new EpisodeItems.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class EpisodeItems {
  String? audioPreviewUrl;
  String? description;
  int? durationMs;
  bool? explicit;
  EpisodeExternalUrls? externalUrls;
  String? href;
  String? htmlDescription;
  String? id;
  List<EpisodeImages>? images;
  bool? isExternallyHosted;
  bool? isPlayable;
  String? language;
  List<String>? languages;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  EpisodeResumePoint? resumePoint;
  String? type;
  String? uri;

  EpisodeItems(
      {this.audioPreviewUrl,
      this.description,
      this.durationMs,
      this.explicit,
      this.externalUrls,
      this.href,
      this.htmlDescription,
      this.id,
      this.images,
      this.isExternallyHosted,
      this.isPlayable,
      this.language,
      this.languages,
      this.name,
      this.releaseDate,
      this.releaseDatePrecision,
      this.resumePoint,
      this.type,
      this.uri});

  EpisodeItems.fromJson(Map<String, dynamic> json) {
    audioPreviewUrl = json['audio_preview_url'];
    description = json['description'];
    durationMs = json['duration_ms'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? new EpisodeExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    htmlDescription = json['html_description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <EpisodeImages>[];
      json['images'].forEach((v) {
        images!.add(new EpisodeImages.fromJson(v));
      });
    }
    isExternallyHosted = json['is_externally_hosted'];
    isPlayable = json['is_playable'];
    language = json['language'];
    languages = json['languages'].cast<String>();
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    resumePoint = json['resume_point'] != null
        ? new EpisodeResumePoint.fromJson(json['resume_point'])
        : null;
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audio_preview_url'] = this.audioPreviewUrl;
    data['description'] = this.description;
    data['duration_ms'] = this.durationMs;
    data['explicit'] = this.explicit;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['html_description'] = this.htmlDescription;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['is_externally_hosted'] = this.isExternallyHosted;
    data['is_playable'] = this.isPlayable;
    data['language'] = this.language;
    data['languages'] = this.languages;
    data['name'] = this.name;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    if (this.resumePoint != null) {
      data['resume_point'] = this.resumePoint!.toJson();
    }
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class EpisodeExternalUrls {
  String? spotify;

  EpisodeExternalUrls({this.spotify});

  EpisodeExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class EpisodeImages {
  int? height;
  String? url;
  int? width;

  EpisodeImages({this.height, this.url, this.width});

  EpisodeImages.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class EpisodeResumePoint {
  bool? fullyPlayed;
  int? resumePositionMs;

  EpisodeResumePoint({this.fullyPlayed, this.resumePositionMs});

  EpisodeResumePoint.fromJson(Map<String, dynamic> json) {
    fullyPlayed = json['fully_played'];
    resumePositionMs = json['resume_position_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fully_played'] = this.fullyPlayed;
    data['resume_position_ms'] = this.resumePositionMs;
    return data;
  }
}

///
///
///
///////

////////////////////////////////

