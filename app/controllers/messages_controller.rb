class MessagesController < ApplicationController

  before_action :set_message, only: [:edit, :update, :destroy]
  
  def top
  end

  def index
    @messages = Message.all
  end

  def new
    if params[:back]
      @message = Message.new(message_params)
    else
      @message = Message.new
    end
  end

  def confirm
    @message = Message.new(message_params)
    render :new if @message.invalid?
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      # 一覧画面へ遷移して"つぶやきを投稿しました！"とメッセージを表示します。
      redirect_to messages_path, notice: "つぶやきを投稿しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message= Message.find(params[:id])
    if @message.update(message_params)
      redirect_to messages_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice:"つぶやきを削除しました！"
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

  # idをキーとして値を取得するメソッド
  def set_message
    @message= Message.find(params[:id])    
  end
end
