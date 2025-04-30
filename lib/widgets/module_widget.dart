import 'package:flutter/material.dart';

class ModuleWidget extends StatelessWidget {
  final Widget destination;
  final String title;
  final String imageUrl;
  final String? subtitle;
  final Widget? trailing;

  const ModuleWidget(
    this.destination,
    this.title,
    this.imageUrl, {
    this.subtitle,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            AspectRatio(
              aspectRatio: 1.2,
                      child: Image.asset(
                imageUrl,
                        fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Row(
                  children: [
                    Expanded(
                  child: Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontStyle: FontStyle.italic,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                  ),
                ),
                    if (trailing != null) ...[
                      SizedBox(width: 8),
                      trailing!,
                    ]
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
