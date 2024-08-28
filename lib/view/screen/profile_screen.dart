import '../../res/barrel_file.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TutorialProvider(context: context),
      child: Consumer<TutorialProvider>(
        builder: (context, tutorialProvider, child) {
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: 'Home',
              actions: [
                IconButton(
                  key: tutorialProvider.searchKey,
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  key: tutorialProvider.menuKey,
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
            ),
            body: Center(
              child: Padding(
                padding: kStandardPadding(),
                child: Column(
                  children: [
                    ElevatedButton(
                      key: tutorialProvider.locationKey,
                      onPressed: () {},
                      child: Text('Set Location'),
                    ),
                    Consumer<ThemeProvider>(
                      builder: (context, state, _) {
                        return ProfileTiles(
                        
                          icon: state.isDark
                              ? AppIcon().lightIcon.icon
                              : AppIcon().darkIcon.icon,
                          title: state.isDark
                              ? getTranslated('darkTheme', context)
                              : getTranslated('lightTheme', context),
                          trailing: Switch(
                            value: state.isDark,
                            onChanged: (value) {
                              state.onToggleThemeEvent(value);
                            },
                          ),
                        );
                      },
                    ),
                    ProfileTiles(
                      icon: Icons.flag,
                      onTap: () {
                        showLanguageSelectionModal(context);
                      },
                      title: getTranslated('language', context),
                    ),
                    Utils.largeHeightBox(context),
                    Row(
                      children: [
                        PrimaryButton(
                          onTap: () {
                            
                          },
                          text: getTranslated('button', context),
                        ),
                        Utils.largeWidthBox(context),
                        PrimaryButton(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                getTranslated('button', context),
                                style: kkWhiteTextStyle(),
                              ),
                              Utils.largeWidthBox(context),
                              Text(
                                'Button ',
                                style: kkWhiteTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Utils.largeHeightBox(context),
                    Container(
                      padding: sPadding,
                      child: dropdownWidget(
                        items: color,
                        onChanged: (val) {},
                      ),
                    ),
                    Expanded(
                      child: ResponsiveGridView(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ThemeContainer(
                            child: Center(
                              child: Text(
                                'Item $index',
                                style: kkWhiteTextStyle(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> color = ['red', 'black', 'white', 'blackColor', 'whiteColor'];

class ProfileTiles extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final void Function()? onTap;
  final Widget? trailing;

  const ProfileTiles({
    super.key,
    this.trailing,
    this.title,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon!),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        dense: true,
        trailing: trailing,
        title: Text(
          title!,
          style: kkBoldTextStyle(),
        ),
      ),
    );
  }
}

void showLanguageSelectionModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Consumer<LanguageProvider>(
        builder: (context, value, child) {
          return ThemeContainer(
            height: 200,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Change Language',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text('🇺🇸  English'),
                  onTap: () {
                    value.onChangelanguage(
                      locale: const Locale('en'),
                    );
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('🇳🇵 Nepali'),
                  onTap: () {
                    value.onChangelanguage(
                      locale: const Locale('ne'),
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
