import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Slava',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Stephens',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            const Divider(
              indent: 50.0,
              endIndent: 50.0,
            ),
            ProfileOption(
              selectedIndex: 1,
              onSelectingChange: (v) {},
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 5.0, crossAxisSpacing: 5.0, childAspectRatio: 9 / 13),
                itemCount: 50,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  const ProfileOption({
    super.key,
    required this.selectedIndex,
    required this.onSelectingChange,
  });

  final int selectedIndex;
  final Function(int) onSelectingChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onSelectingChange(0),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == 0 ? Theme.of(context).primaryColor : null,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                    child: Text(
                  'Want',
                  style: TextStyle(color: selectedIndex == 0 ? Colors.white : null),
                )),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: GestureDetector(
              onTap: () => onSelectingChange(1),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == 1 ? Theme.of(context).primaryColor : null,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                    child: Text(
                  'Watched',
                  style: TextStyle(color: selectedIndex == 1 ? Colors.white : null),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
