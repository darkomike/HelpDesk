import 'index.dart';

class NewUserButton extends StatelessWidget {
  const NewUserButton({
    Key? key,
    required this.onCancel,
    required this.onTap,
    required this.role,
    required this.userID,
    required this.username,
  }) : super(key: key);

  final void Function()? onCancel;
  final String userID;
  final String username;
  final String role;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              getSpaceW(width: 10),
              Expanded(
                flex: 2,
                child: CustomText(
                  label: userID,
                ),
              ),
              getSpaceW(width: 10),
              Expanded(
                  flex: 2,
                  child: CustomText(
                    label: username,
                  )),
              getSpaceW(width: 10),
              Expanded(
                  flex: 2,
                  child: CustomText(
                    label: role,
                  )),
              getSpaceW(width: 10),
              Expanded(
                child: IconButton(
                    onPressed: onCancel,
                    icon: const Icon(
                      Icons.more_horiz,
                      color: blackColor,
                    )),
              )
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            height: 5,
            thickness: 1.1,
            color: blackColor.withOpacity(0.4),
          )
        ],
      ),
    );
  }
}
