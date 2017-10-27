alias ProjectManagerExample.Repo
alias ProjectManagerExample.Management.Document

Repo.insert! %Document{
  name: "First Document",
  content: "We have a list of a bunch of stuff",
  view_count: 1,
  published: true,
  project_id: 1
}

Repo.insert! %Document{
  name: "Second Document",
  content: "This isn't very important",
  view_count: 1,
  published: false,
  project_id: 1
}

Repo.insert! %Document{
  name: "Third Document",
  content: "This is some great content",
  view_count: 1,
  published: false,
  project_id: 2
}

Repo.insert! %Document{
  name: "Fourth Document",
  content: "Content conntent content",
  view_count: 1,
  published: true,
  project_id: 3
}

Repo.insert! %Document{
  name: "Fifth Document",
  content: "Get with it",
  view_count: 1,
  published: false,
  project_id: 3
}
