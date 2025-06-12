enum FileType { compressed, audio, video, programs, documents }

/// Helper class to determine file type from file extension
class FileTypeHelper {
  static const Map<String, FileType> _extensionMap = {
    // Compressed files
    'zip': FileType.compressed,
    'rar': FileType.compressed,
    '7z': FileType.compressed,
    'tar': FileType.compressed,
    'gz': FileType.compressed,
    'bz2': FileType.compressed,
    'xz': FileType.compressed,
    'arj': FileType.compressed,
    'cab': FileType.compressed,
    'lzh': FileType.compressed,
    'ace': FileType.compressed,

    // Audio files
    'mp3': FileType.audio,
    'wav': FileType.audio,
    'flac': FileType.audio,
    'aac': FileType.audio,
    'ogg': FileType.audio,
    'wma': FileType.audio,
    'm4a': FileType.audio,
    'opus': FileType.audio,
    'aiff': FileType.audio,
    'au': FileType.audio,

    // Video files
    'mp4': FileType.video,
    'avi': FileType.video,
    'mkv': FileType.video,
    'mov': FileType.video,
    'wmv': FileType.video,
    'flv': FileType.video,
    'webm': FileType.video,
    'm4v': FileType.video,
    '3gp': FileType.video,
    'mpg': FileType.video,
    'mpeg': FileType.video,
    'ts': FileType.video,
    'mts': FileType.video,

    // Programs
    'exe': FileType.programs,
    'msi': FileType.programs,
    'dmg': FileType.programs,
    'pkg': FileType.programs,
    'deb': FileType.programs,
    'rpm': FileType.programs,
    'app': FileType.programs,
    'apk': FileType.programs,
    'ipa': FileType.programs,
    'jar': FileType.programs,
    'run': FileType.programs,
    'bin': FileType.programs,

    // Documents
    'pdf': FileType.documents,
    'doc': FileType.documents,
    'docx': FileType.documents,
    'xls': FileType.documents,
    'xlsx': FileType.documents,
    'ppt': FileType.documents,
    'pptx': FileType.documents,
    'odt': FileType.documents,
    'ods': FileType.documents,
    'odp': FileType.documents,
    'rtf': FileType.documents,
    'txt': FileType.documents,
    'csv': FileType.documents,
    'json': FileType.documents,
    'xml': FileType.documents,
    'html': FileType.documents,
    'css': FileType.documents,
    'js': FileType.documents,
    'md': FileType.documents,
    'epub': FileType.documents,
    'mobi': FileType.documents,
  };

  /// Determines the file type from a file extension
  static FileType getFileType(String extension) {
    final String lowerExtension = extension.toLowerCase();
    return _extensionMap[lowerExtension] ?? FileType.documents;
  }

  /// Gets a display name for the file type
  static String getDisplayName(FileType fileType) {
    switch (fileType) {
      case FileType.compressed:
        return 'Compressed';
      case FileType.audio:
        return 'Audio';
      case FileType.video:
        return 'Video';
      case FileType.programs:
        return 'Program';
      case FileType.documents:
        return 'Document';
    }
  }

  /// Gets an appropriate icon for the file type
  static String getIconName(FileType fileType) {
    switch (fileType) {
      case FileType.compressed:
        return 'archive';
      case FileType.audio:
        return 'audiotrack';
      case FileType.video:
        return 'videocam';
      case FileType.programs:
        return 'memory';
      case FileType.documents:
        return 'description';
    }
  }
}
