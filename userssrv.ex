# userssrv.ex
# this is a comment to the end of the line
defmodule Userssrv do
	@moduledoc """
	Functions to manage users for the system.
	"""
	@vsn 0.1
	
	@doc """
	Basic set for registering users to the system.
	First call signUp to register a new user.
	Once registered she or he can signIn to start a new session.
	When finished it must call signOut; otherwise the session will expire after the set tmo.
	"""
	
	import Users

	def setup do
		IO.puts("crea la tabella :users.")
		users_table = :ets.new(:users, [:named_table, :set, {:keypos, 2}])
	end

	
	def signUp(name, email) do
		newUser = %Users{name: name, email: email}
		IO.inspect(newUser)
		IO.puts("#{newUser.pswd} was assigned to the created user.")
		:ets.insert(:users, {newUser.name, newUser.email, newUser.pswd})
	end

	def signIn(email, password) do
		{user,theemail, pswd}  = hd(:ets.lookup(:users, email))
		IO.puts("#{user} is getting in as #{theemail} with #{pswd}")
		
	end
	

end 