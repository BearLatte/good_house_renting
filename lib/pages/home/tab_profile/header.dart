import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});
  final _loginRegistrationStyle = const TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600);

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      decoration: const BoxDecoration(color: Colors.green),
      height: 95.0,
      child: Row(
        children: [
          Container(
            width: 65.0,
            height: 65.0,
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Padding(padding: EdgeInsets.only(top: 10.0)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('login');
                  },
                  child: Text('登录', style: _loginRegistrationStyle),
                ),
                Text('/', style: _loginRegistrationStyle),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('registration');
                  },
                  child: Text('注册', style: _loginRegistrationStyle),
                )
              ]),
              const Text(
                '登录后可以体验更多',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    String username = '已登录用户名';
    String userImage =
        'https://tva1.sinaimg.cn/large/008i3skNgy1gsuhtensa6j30lk0li76f.jpg';
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      decoration: const BoxDecoration(color: Colors.green),
      height: 95.0,
      child: Row(
        children: [
          Container(
            width: 65.0,
            height: 65.0,
            margin: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Padding(padding: EdgeInsets.only(top: 10.0)),
                Text(username, style: _loginRegistrationStyle)
              ]),
              const Text('查看编辑个人资料', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = true;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
