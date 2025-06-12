import 'package:flutter/material.dart';
import 'package:zdm/presentation/widgets/common/download_progress_card.dart';
import 'package:zdm/core/enums/download_status.dart';

/// Example usage of DownloadProgressCard widget
class DownloadProgressCardExample extends StatelessWidget {
  const DownloadProgressCardExample({super.key});

  // Raw data for download examples
  static final List<Map<String, dynamic>> _downloadExamples = [
    {
      'fileName': 'Flutter-SDK-3.8.1-stable.zip',
      'fileUrl': 'https://storage.googleapis.com/flutter_infra_release/...',
      'status': DownloadStatus.downloading,
      'downloadedBytes': 280068608, // 267 MB
      'totalBytes': 935329792, // 892 MB
      'downloadSpeed': 5.2,
      'estimatedTimeLeft': const Duration(minutes: 2, seconds: 15),
      'description': 'Downloading state',
    },
    {
      'fileName': 'large-file.zip',
      'fileUrl': 'https://example.com/files/large-file.zip',
      'status': DownloadStatus.paused,
      'downloadedBytes': 524288000, // 500 MB
      'totalBytes': 1073741824, // 1 GB
      'downloadSpeed': 0.0,
      'estimatedTimeLeft': const Duration(minutes: 8, seconds: 30),
      'description': 'Paused state',
    },
    {
      'fileName': 'document.pdf',
      'fileUrl': 'https://example.com/files/document.pdf',
      'status': DownloadStatus.completed,
      'downloadedBytes': 2097152, // 2 MB
      'totalBytes': 2097152, // 2 MB
      'downloadSpeed': 0.0,
      'estimatedTimeLeft': Duration.zero,
      'description': 'Completed state',
    },
    {
      'fileName': 'failed-download.zip',
      'fileUrl': 'https://example.com/files/failed-download.zip',
      'status': DownloadStatus.failed,
      'downloadedBytes': 104857600, // 100 MB
      'totalBytes': 314572800, // 300 MB
      'downloadSpeed': 0.0,
      'estimatedTimeLeft': Duration.zero,
      'description': 'Failed state',
    },
    {
      'fileName': 'config.json',
      'fileUrl': 'https://api.example.com/config.json',
      'status': DownloadStatus.downloading,
      'downloadedBytes': 8192, // 8 KB
      'totalBytes': 12288, // 12 KB
      'downloadSpeed': 150.5,
      'estimatedTimeLeft': const Duration(milliseconds: 500),
      'description': 'Very small file - almost instant download',
    },
    {
      'fileName': 'Ubuntu-22.04.3-desktop-amd64.iso',
      'fileUrl':
          'https://releases.ubuntu.com/22.04/ubuntu-22.04.3-desktop-amd64.iso',
      'status': DownloadStatus.downloading,
      'downloadedBytes': 1073741824, // 1 GB
      'totalBytes': 4831838208, // 4.5 GB
      'downloadSpeed': 0.8, // Very slow connection
      'estimatedTimeLeft': const Duration(hours: 1, minutes: 12, seconds: 45),
      'description': 'Very large file with slow speed',
    },
    {
      'fileName': 'movie-trailer-4k.mp4',
      'fileUrl': 'https://cdn.example.com/trailers/movie-trailer-4k.mp4',
      'status': DownloadStatus.downloading,
      'downloadedBytes': 0,
      'totalBytes': 524288000, // 500 MB
      'downloadSpeed': 12.3,
      'estimatedTimeLeft': const Duration(minutes: 11, seconds: 52),
      'description': 'Just started download (0% progress)',
    },
    {
      'fileName': 'software-installer.exe',
      'fileUrl': 'https://download.example.com/software-installer.exe',
      'status': DownloadStatus.downloading,
      'downloadedBytes': 155189657, // 148 MB
      'totalBytes': 157286400, // 150 MB
      'downloadSpeed': 25.7,
      'estimatedTimeLeft': const Duration(seconds: 12),
      'description': 'Almost complete (99% progress)',
    },
    {
      'fileName': 'high-speed-test.zip',
      'fileUrl': 'https://speedtest.example.com/files/high-speed-test.zip',
      'status': DownloadStatus.downloading,
      'downloadedBytes': 671088640, // 640 MB
      'totalBytes': 1073741824, // 1 GB
      'downloadSpeed': 89.4, // Very fast connection
      'estimatedTimeLeft': const Duration(seconds: 4),
      'description': 'Very fast download speed',
    },
    {
      'fileName':
          'very-long-filename-with-lots-of-descriptive-text-and-version-numbers-v2.1.3-final-release-candidate.tar.gz',
      'fileUrl':
          'https://releases.example.com/very-long-filename-with-lots-of-descriptive-text-and-version-numbers-v2.1.3-final-release-candidate.tar.gz',
      'status': DownloadStatus.paused,
      'downloadedBytes': 209715200, // 200 MB
      'totalBytes': 419430400, // 400 MB
      'downloadSpeed': 0.0,
      'estimatedTimeLeft': const Duration(minutes: 4, seconds: 18),
      'description': 'File with very long name',
    },
    {
      'fileName': 'network-timeout.zip',
      'fileUrl': 'https://unreliable.example.com/network-timeout.zip',
      'status': DownloadStatus.failed,
      'downloadedBytes': 1048576, // 1 MB
      'totalBytes': 104857600, // 100 MB
      'downloadSpeed': 0.0,
      'estimatedTimeLeft': Duration.zero,
      'description': 'Failed download with minimal progress',
    },
    {
      'fileName': 'complete-game-download.zip',
      'fileUrl': 'https://gamecdn.example.com/complete-game-download.zip',
      'status': DownloadStatus.completed,
      'downloadedBytes': 21474836480, // 20 GB
      'totalBytes': 21474836480, // 20 GB
      'downloadSpeed': 0.0,
      'estimatedTimeLeft': Duration.zero,
      'description': 'Completed very large file',
    },
    {
      'fileName': '🎵 Music Album - Ärtist Nämé (2023) [FLAC] 🎧.mp3',
      'fileUrl': 'https://music.example.com/albums/special-chars.mp3',
      'status': DownloadStatus.downloading,
      'downloadedBytes': 157286400, // 150 MB
      'totalBytes': 314572800, // 300 MB
      'downloadSpeed': 7.2,
      'estimatedTimeLeft': const Duration(minutes: 3, seconds: 28),
      'description': 'File with special characters and emojis',
    },
    {
      'fileName': 'tiny.txt',
      'fileUrl': 'https://files.example.com/tiny.txt',
      'status': DownloadStatus.completed,
      'downloadedBytes': 42, // 42 bytes
      'totalBytes': 42, // 42 bytes
      'downloadSpeed': 0.0,
      'estimatedTimeLeft': Duration.zero,
      'description': 'Micro file (few bytes)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _downloadExamples.length,
      itemBuilder: (context, index) {
        final example = _downloadExamples[index];
        return DownloadProgressCard(
          fileName: example['fileName'],
          fileUrl: example['fileUrl'],
          status: example['status'],
          downloadedBytes: example['downloadedBytes'],
          totalBytes: example['totalBytes'],
          downloadSpeed: example['downloadSpeed'],
          estimatedTimeLeft: example['estimatedTimeLeft'],
          onPause: () {
            print(
              '${example['description']}: ${example['status'] == DownloadStatus.paused ? 'resumed' : 'paused'}',
            );
          },
          onCancel: () {
            print(
              '${example['description']}: ${_getCancelActionText(example['status'])}',
            );
          },
        );
      },
    );
  }

  static String _getCancelActionText(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.downloading:
      case DownloadStatus.paused:
        return 'cancelled';
      case DownloadStatus.completed:
        return 'removed';
      case DownloadStatus.failed:
        return 'retry or remove';
    }
  }
}
