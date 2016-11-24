class ChangePasswrdDigestToPasswordDigest < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :passowrd_digest, :password_digest
  end
end
