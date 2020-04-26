class Teams::Show < BrowserAction
  route do
    html ShowPage, team: TeamQuery.find(team_id), members: MemberQuery.new.team_id(team_id)
  end
end
