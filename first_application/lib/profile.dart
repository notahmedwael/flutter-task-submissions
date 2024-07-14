import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> titles =
      List<String>.generate(5, (index) => "Image ${index + 1}");

  final List<String> images = [
    'https://i.natgeofe.com/n/87a36612-27e8-4e6b-b188-82c37a8dd95a/NationalGeographic_2772395.jpg',
    'https://www.thoughtco.com/thmb/JLrfh7xjQM3bBGCQUaZhgNuEcok=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-595710436-e9fb5588826f403193ff399bcc8c0d3d.jpg',
    'https://2seewhales.com/wp-content/uploads/2018/11/14736213630_c7e844e244_b-1024x618.jpg',
    'https://www.usatoday.com/gcdn/presto/2020/12/07/PBKS/09b79fc6-dd18-477c-81df-46daaeac346b-Standalone_Transient_Orcas_02.JPG?crop=1858,1858,x0,y0',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCmmAD7eO4GuAgXuKeAux_Z795BEm6lrcipA&s'
  ];

 
  final List<String> subtitles =
      List<String>.generate(5, (index) => "Orca Whale ${index + 1}");

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            _buildProfileInfo(),
            _buildItemsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blueAccent,
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://nextlevelsailing.com/wp-content/uploads/sites/2044/2019/10/46962987_l.jpg'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Orca Whale',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'coolorcawhale@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
              'Hello there, I am a cool orca whale that loves swimming in the ocean.',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 2, 4, 1),
              )),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Photos',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromARGB(255, 91, 202, 249),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Container(
                    width: 100,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: NetworkImage(images[index]),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  title: Text(titles[index],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 2, 4, 1),
                        fontSize: 18,
                      )),
                  subtitle: Text(subtitles[index],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 2, 4, 1),
                        fontSize: 12,
                      )),
                  trailing: const Icon(
                    Icons.anchor_sharp,
                    color: Color.fromARGB(255, 2, 4, 1),
                  ),
                  onTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
