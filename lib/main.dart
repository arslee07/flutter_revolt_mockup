import 'package:flutter/material.dart';

final avatar = Uri.parse(
  'https://autumn.revolt.chat/avatars/RWqyG9CUYeng2Dr0_ZytfkUWPaIwXtVxCXfOHg-GlQ/IMG_20211127_112349_909.jpg',
);

final servers = [
  'https://autumn.revolt.chat/icons/gtc0gJE2S3RvuDhrl2-JeakvgbqEGr2acvBnRTTh6k?max_side=256',
  'https://autumn.revolt.chat/icons/kALFy9DdzAbUY-MeZBSe_IuCt8ZU5jdDq396NOHQGw?max_side=256',
  'https://autumn.revolt.chat/icons/2dY2jp6aNE6I1dY4z1g3oYwmU3240VWl4XUzQOoNrx?max_side=256'
];

const msg = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
    'sed do eiusmod tempor incididunt ut labore et dolore'
    'magna aliqua.';

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revolt',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: white,
          accentColor: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}

class SplitView extends StatefulWidget {
  const SplitView({
    Key? key,
    required this.content,
    this.right,
    this.left,
    this.breakpoint = 1080,
    this.rightWidth = 320,
    this.leftWidth = 320,
  }) : super(key: key);

  final Widget? right;
  final Widget? left;
  final Widget content;
  final double breakpoint;
  final double rightWidth;
  final double leftWidth;

  @override
  State<SplitView> createState() => SplitViewState();

  static SplitViewState? of(BuildContext context) {
    return context.findAncestorStateOfType<SplitViewState>();
  }
}

class SplitViewState extends State<SplitView> {
  bool showLeft = true;
  bool showRight = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool get isBreakpointed =>
      MediaQuery.of(context).size.width >= widget.breakpoint;

  void toggleLeft() {
    if (isBreakpointed) {
      setState(() {
        showLeft = !showLeft;
      });
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }

  void toggleRight() {
    if (isBreakpointed) {
      setState(() {
        showRight = !showRight;
      });
    } else {
      scaffoldKey.currentState?.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isBreakpointed) {
      return Row(
        children: [
          if (widget.left != null && showLeft) ...[
            SizedBox(
              width: widget.leftWidth,
              child: widget.left,
            ),
            const VerticalDivider(width: 0),
          ],
          Expanded(child: widget.content),
          if (widget.right != null && showRight) ...[
            const VerticalDivider(width: 0),
            SizedBox(
              width: widget.rightWidth,
              child: widget.right,
            ),
          ],
        ],
      );
    } else {
      return Scaffold(
        body: widget.content,
        key: scaffoldKey,
        drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.25,
        drawer: widget.left == null
            ? null
            : SizedBox(
                width: widget.leftWidth,
                child: Drawer(
                  child: widget.left,
                ),
              ),
        endDrawer: widget.right == null
            ? null
            : SizedBox(
                width: widget.rightWidth,
                child: Drawer(
                  child: widget.right,
                ),
              ),
      );
    }
  }
}

class ServerItem extends StatelessWidget {
  final Widget image;

  const ServerItem({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        radius: 24.0,
        child: ClipRRect(
          child: Ink(child: image),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: Colors.white10,
        foregroundColor: Theme.of(context).primaryColor,
        radius: 24.0,
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(avatar.toString()),
              borderRadius: BorderRadius.circular(100),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateServerButton extends StatelessWidget {
  const CreateServerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: Colors.white10,
        foregroundColor: Theme.of(context).primaryColor,
        radius: 24.0,
        child: ClipRRect(
          child: const Icon(Icons.add),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class DiscoverButton extends StatelessWidget {
  const DiscoverButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: Colors.white10,
        foregroundColor: Theme.of(context).primaryColor,
        radius: 24.0,
        child: ClipRRect(
          child: const Icon(Icons.explore),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: Colors.white10,
        foregroundColor: Theme.of(context).primaryColor,
        radius: 24.0,
        child: ClipRRect(
          child: const Icon(Icons.settings),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class ServerList extends StatelessWidget {
  const ServerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: SizedBox(
        width: 72,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              const ProfileButton(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(height: 0),
              ),
              Expanded(
                child: ListView.builder(
                  controller: ScrollController(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Builder(builder: (context) {
                        if (index == servers.length) {
                          return const CreateServerButton();
                        }
                        if (index == servers.length + 1) {
                          return const DiscoverButton();
                        }
                        return ServerItem(image: Image.network(servers[index]));
                      }),
                    );
                  },
                  itemCount: servers.length + 2,
                ),
              ),
              const SettingsButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class Left extends StatelessWidget {
  const Left({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          ServerList(),
          VerticalDivider(width: 0),
          ServerInfo(),
        ],
      ),
    );
  }
}

class TextChannelTile extends StatelessWidget {
  final String name;
  final bool unread;
  const TextChannelTile(this.name, {this.unread = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = unread ? null : Theme.of(context).unselectedWidgetColor;
    return ListTile(
      leading: Icon(Icons.tag, color: color),
      trailing: unread
          ? CircleAvatar(
              radius: 4,
              backgroundColor: Theme.of(context).colorScheme.onSurface,
            )
          : null,
      title: Text(name, style: TextStyle(color: color)),
      onTap: () {},
    );
  }
}

class VoiceChannelTile extends StatelessWidget {
  final String name;
  const VoiceChannelTile(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.volume_up),
      title: Text(name),
      onTap: () {},
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String name;
  final List<Widget> children;
  const CategoryTile(this.name, {this.children = const [], Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(name),
        children: children,
      ),
    );
  }
}

class ChannelsList extends StatelessWidget {
  const ChannelsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TextChannelTile('Rules'),
        TextChannelTile('Announcements', unread: true),
        CategoryTile(
          'Chatting',
          children: [
            TextChannelTile('General'),
            TextChannelTile('Flood', unread: true),
            TextChannelTile('Memes', unread: true),
            VoiceChannelTile('Le Voice'),
          ],
        ),
        CategoryTile(
          'Stuff',
          children: [
            TextChannelTile('Moderators'),
            TextChannelTile('Logs', unread: true),
          ],
        ),
      ],
    );
  }
}

class ServerInfo extends StatelessWidget {
  const ServerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ServerHeader(),
          Divider(height: 0),
          Expanded(child: ChannelsList()),
        ],
      ),
    );
  }
}

class ServerHeader extends StatelessWidget {
  const ServerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.5, horizontal: 18.0),
      child: Text(
        'The Cool Server',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class RoleSection extends StatelessWidget {
  final String name;
  final List<Widget> children;
  const RoleSection(this.name, {this.children = const [], Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Theme.of(context).unselectedWidgetColor),
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return children[index];
          },
          itemCount: children.length,
          shrinkWrap: true,
        ),
      ],
    );
  }
}

class MemberTile extends StatelessWidget {
  const MemberTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      onTap: () {},
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatar.toString()),
        child: const Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 6,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      title: const Text('arslee'),
      subtitle: const Text('Some cool status'),
    );
  }
}

class Right extends StatelessWidget {
  const Right({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                RoleSection(
                  'Founder - 1',
                  children: [MemberTile()],
                ),
                RoleSection(
                  'Moderator - 2',
                  children: [MemberTile(), MemberTile()],
                ),
                RoleSection(
                  'Online - 4',
                  children: [
                    MemberTile(),
                    MemberTile(),
                    MemberTile(),
                    MemberTile(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MainPanel extends StatelessWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('# General'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            SplitView.of(context)?.toggleLeft();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {
              SplitView.of(context)?.toggleRight();
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) {
                return const MessageItem();
              },
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      minVerticalPadding: 6,
      // isThreeLine: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatar.toString()),
      ),
      title: Row(
        children: const [
          Text('arslee'),
          SizedBox(width: 5),
          Text(
            'Today at 9:41',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      subtitle: const Text(msg),
    );
  }
}

class MessageInput extends StatelessWidget {
  const MessageInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter a message",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplitView(
        right: Right(),
        left: Left(),
        content: MainPanel(),
        rightWidth: 320 - 72,
      ),
    );
  }
}
