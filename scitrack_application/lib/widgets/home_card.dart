import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const HomeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: onTap,

      borderRadius:
          BorderRadius.circular(16),

      child: Container(

        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(

          color: color,

          borderRadius:
              BorderRadius.circular(16),

          boxShadow: const [

            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),

            const SizedBox(height: 15),

            Text(
              title,

              textAlign: TextAlign.center,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}