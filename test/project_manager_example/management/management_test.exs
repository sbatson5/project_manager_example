defmodule ProjectManagerExample.ManagementTest do
  use ProjectManagerExample.DataCase

  alias ProjectManagerExample.Management

  describe "projects" do
    alias ProjectManagerExample.Management.Project

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Management.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Management.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Management.create_project(@valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Management.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.description == "some updated description"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_project(project, @invalid_attrs)
      assert project == Management.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Management.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Management.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Management.change_project(project)
    end
  end

  describe "documents" do
    alias ProjectManagerExample.Management.Document

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def document_fixture(attrs \\ %{}) do
      {:ok, document} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_document()

      document
    end

    test "list_documents/0 returns all documents" do
      document = document_fixture()
      assert Management.list_documents() == [document]
    end

    test "get_document!/1 returns the document with given id" do
      document = document_fixture()
      assert Management.get_document!(document.id) == document
    end

    test "create_document/1 with valid data creates a document" do
      assert {:ok, %Document{} = document} = Management.create_document(@valid_attrs)
    end

    test "create_document/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_document(@invalid_attrs)
    end

    test "update_document/2 with valid data updates the document" do
      document = document_fixture()
      assert {:ok, document} = Management.update_document(document, @update_attrs)
      assert %Document{} = document
    end

    test "update_document/2 with invalid data returns error changeset" do
      document = document_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_document(document, @invalid_attrs)
      assert document == Management.get_document!(document.id)
    end

    test "delete_document/1 deletes the document" do
      document = document_fixture()
      assert {:ok, %Document{}} = Management.delete_document(document)
      assert_raise Ecto.NoResultsError, fn -> Management.get_document!(document.id) end
    end

    test "change_document/1 returns a document changeset" do
      document = document_fixture()
      assert %Ecto.Changeset{} = Management.change_document(document)
    end
  end

  describe "users" do
    alias ProjectManagerExample.Management.User

    @valid_attrs %{screen_name: "some screen_name"}
    @update_attrs %{screen_name: "some updated screen_name"}
    @invalid_attrs %{screen_name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Management.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Management.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Management.create_user(@valid_attrs)
      assert user.screen_name == "some screen_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Management.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.screen_name == "some updated screen_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_user(user, @invalid_attrs)
      assert user == Management.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Management.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Management.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Management.change_user(user)
    end
  end
end
