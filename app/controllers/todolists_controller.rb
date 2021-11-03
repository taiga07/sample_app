class TodolistsController < ApplicationController
  def new
    @list=List.new
  end
  
  def show
    @list=List.find(params[:id])
  end

  def create
    list=List.new(list_params)
    # １. データを新規登録するためのインスタンス作成
    list.save
    # ２. データをデータベースに保存するためのsaveメソッド実行
    redirect_to todolist_path(list.id)
     # ３. トップ画面へリダイレクト
  end

  def index
    @lists=List.all
  end


  private

  def list_params
    params.require(:list).permit(:title, :body)
  end

end