import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zdm/core/constants/app_colors.dart';
import 'package:zdm/core/enums/download_status.dart';
import 'package:zdm/core/enums/file_type.dart';

class DownloadProgressCard extends StatelessWidget {
  final String fileName;
  final String fileUrl;
  final DownloadStatus status;
  final int downloadedBytes;
  final int totalBytes;
  final double downloadSpeed; // in MB/s
  final Duration estimatedTimeLeft;
  final VoidCallback? onPause;
  final VoidCallback? onCancel;

  const DownloadProgressCard({
    super.key,
    required this.fileName,
    required this.fileUrl,
    required this.status,
    required this.downloadedBytes,
    required this.totalBytes,
    required this.downloadSpeed,
    required this.estimatedTimeLeft,
    this.onPause,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = totalBytes > 0 ? downloadedBytes / totalBytes : 0.0;
    final double progressPercentage = progress * 100;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getStatusColor(), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildStatusIcon(),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  fileName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              _buildFileIcon(),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(_getStatusColor()),
                minHeight: 24,
                borderRadius: BorderRadius.circular(4),
              ),
              Container(
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    // Left: File size info
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${_formatBytes(downloadedBytes)} / ${_formatBytes(totalBytes)}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          fontFamily: GoogleFonts.robotoMono().fontFamily,
                        ),
                      ),
                    ),
                    // Middle: Download speed
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${downloadSpeed.toStringAsFixed(1)}MB/s',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Right: Estimated time
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (status == DownloadStatus.downloading)
                            Text(
                              _formatDuration(estimatedTimeLeft),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFileIcon() {
    final String fileExtension = _getFileExtension(fileName);
    final FileType fileType = FileTypeHelper.getFileType(fileExtension);
    final IconData icon = _getFileTypeIcon(fileType);

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildStatusIcon() {
    IconData iconData;
    switch (status) {
      case DownloadStatus.downloading:
        iconData = Icons.play_arrow;
        break;
      case DownloadStatus.paused:
        iconData = Icons.pause;
        break;
      case DownloadStatus.completed:
        iconData = Icons.check_circle;
        break;
      case DownloadStatus.failed:
        iconData = Icons.error;
        break;
    }

    return Icon(iconData, color: _getStatusColor(), size: 24);
  }

  Color _getStatusColor() {
    switch (status) {
      case DownloadStatus.downloading:
        return AppColors.downloading;
      case DownloadStatus.paused:
        return AppColors.paused;
      case DownloadStatus.completed:
        return AppColors.completed;
      case DownloadStatus.failed:
        return AppColors.failed;
    }
  }

  String _formatBytes(int bytes) {
    if (bytes >= 1073741824) {
      return '${(bytes / 1073741824).toStringAsFixed(1)}GB';
    } else if (bytes >= 1048576) {
      return '${(bytes / 1048576).toStringAsFixed(0)}MB';
    } else if (bytes >= 1024) {
      return '${(bytes / 1024).toStringAsFixed(0)}KB';
    } else {
      return '$bytes B';
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')} left';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')} left';
    }
  }

  String _getFileExtension(String fileName) {
    final int lastDotIndex = fileName.lastIndexOf('.');
    if (lastDotIndex != -1 && lastDotIndex < fileName.length - 1) {
      return fileName.substring(lastDotIndex + 1);
    }
    return 'FILE'; // Default fallback for files without extension
  }

  IconData _getFileTypeIcon(FileType fileType) {
    switch (fileType) {
      case FileType.compressed:
        return Icons.archive;
      case FileType.audio:
        return Icons.audiotrack;
      case FileType.video:
        return Icons.videocam;
      case FileType.programs:
        return Icons.memory;
      case FileType.documents:
        return Icons.description;
    }
  }
}
