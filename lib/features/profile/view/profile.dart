import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/widgets/custom_appbar.dart';

class ProfileScreen extends StatefulWidget {
  static const id = '/profile_screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg-image.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: customAppBar(
          context: context,
          title: 'Profile',
          widget: const Icon(
            CupertinoIcons.create,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: CustomColors.genericWhite,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Stephanie Affram',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: CustomColors.genericWhite,
                ),
                child: ListView(
                  children:  const [
                   ProfileInfoListtile(
                     title: 'Email',
                     subtitle: 'XG3kS@example.com', 
                     leading: Icon(CupertinoIcons.mail,),
                   ),
                    Divider(),
                    ProfileInfoListtile(
                     title: 'Phone Number',
                     subtitle: '024 123 4567', 
                     leading: Icon(CupertinoIcons.phone,),
                   ),
                    Divider(),
                     ProfileInfoListtile(
                     title: 'Department',
                     subtitle: 'Business Development(BDU)', 
                     leading: Icon(CupertinoIcons.building_2_fill,),
                   ),
                    Divider(),
                     ProfileInfoListtile(
                     title: 'Line Manager',
                     subtitle: 'Joseph Agyeman-Badu', 
                     leading: Icon(CupertinoIcons.person,),
                   ),
                    Divider(),
                  ],
                )
              ),
            
            )
          ],
        ),
      ),
    );
  }
}

class ProfileInfoListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  const ProfileInfoListtile({
    super.key, required this.title, required this.subtitle, required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return  ListTile(
       leading: leading,
       title: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(title, ),
           Text(subtitle),
         ],
       ),
     );
  }
}
