import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jaspr/dom.dart';

import 'package:jaspr/server.dart';

import '../../../core/models/team_member.dart';
import '../../../core/utils/app_constants.dart';
import '../../projects/views/projects_view.dart';
import '../components/team_member_card.dart';

class TeamMembersView extends AsyncStatelessComponent {
  @override
  Future<Component> build(BuildContext context) async {
    try {
      final List<TeamMember> members = await getTeamMembers();
      return section(
        classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
        [
          div(
            classes: "max-w-3xl mb-14 sm:mb-16",
            [
              div(
                classes:
                    "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                [
                  span(
                    [
                      .text("04"),
                    ],
                  ),
                  span(classes: "w-8 h-[1px] bg-secondary/40", []),
                  span(
                    [
                      .text("Engineers & Designers"),
                    ],
                  ),
                ],
              ),
              h2(
                classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                [
                  .text(" Small by design. Driven by craft. "),
                ],
              ),
              p(
                classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
                [
                  .text(
                    " We keep the team lean so every project gets direct attention from experienced practitioners. No junior delegates, no outsourced accounts. ",
                  ),
                ],
              ),
            ],
          ),
          if (members.isEmpty)
            EmptyCard(
              title: "No Member Available",
              description: "There are no member to display right now.",
            ),
          div(
            classes: "grid grid-cols-1 md:grid-cols-3 gap-8",
            members
                .map(
                  (member) => TeamMemberCard(
                    name: member.name,
                    roleTag: member.roleTitle,
                    roleSubtitle: 'FOUNDER & Mobile Developer & Back-end Developer',
                    bio: member.bio,
                    imageSrc: member.photo?.url ?? "invalid image",
                    imageAlt:
                        'Editorial portrait of a male technical lead engineer in a minimalist dark studio setting, moody cinematic soft lighting with subtle cool cyan rim light, wearing a dark crewneck, thoughtful and focused expression.',
                    badgeColorClass: 'text-secondary',
                    socialLinks: member.links.map((l) => (label: l.label, url: l.url)).toList(),
                  ),
                )
                .toList(),
          ),
        ],
      );
    } catch (e) {
      return ErrorCard(error: e.toString());
    }
  }

  Future<List<TeamMember>> getTeamMembers() async {
    http.Response res = await http.get(Uri.parse("${AppConstants.teamMember}?per_page=100"));
    if (res.statusCode == 200) {
      final List<dynamic> membersRaw = jsonDecode(res.body)["data"];
      return membersRaw.map<TeamMember>((member) => TeamMember.fromJson(member)).toList();
    } else {
      final body = jsonDecode(res.body);
      throw body["message"] ?? res.body;
    }
  }
}
