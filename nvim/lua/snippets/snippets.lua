local ls = require("luasnip")
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.setup({
  keep_roots = true,
  link_roots = true,
  link_children = true,

  -- Update more often, :h events for more info.
  update_events = "TextChanged,TextChangedI",
  -- Snippets aren't automatically removed if their text is deleted.
  -- delete_check_events determines on which events (:h events) a check for
  -- deleted snippets is performed.
  -- This can be especially useful when history is enabled.
  delete_check_events = "TextChanged",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 300,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = true,
  -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
  -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
  store_selection_keys = "<Tab>",
  -- luasnip uses this function to get the currently active filetype. This
  -- is the (rather uninteresting) default, but it's possible to use
  -- eg. treesitter for getting the current filetype by setting ft_func to
  -- require("luasnip.extras.filetype_functions").from_cursor (requires
  -- nvim-treesitter/nvim-treesitter). This allows correctly resolving
  -- the current filetype in eg. a markdown-code block or vim.cmd().
  ft_func = function()
    return vim.split(vim.bo.filetype, ".", true)
  end,
})
ls.add_snippets("cpp", {
  snip("cpboiler", {
    text({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "/* TYPES */",
      "#define MOD 1000000007",
      "#define N 1000005",
      "typedef long long int lli;",
      "typedef long long ll;",
      "typedef unsigned long long ull;",
      "#define int ll",
      "#define vi vector<int>",
      "#define vvi vector<vector<int>>",
      "#define mii map<int, int>",
      "#define pii pair<int, int>",
      "#define vii vector<pii>",
      "#define f first",
      "#define s second",
      "#define pb push_back",
      "#define gcd(a,b) __gcd(a,b)",
      "#define lcm(a,b) (a*(b/gcd(a,b)))",
      '#define endl "\\n"',
      '#define yes cout<<"YES"<<endl',
      '#define no cout<<"NO"<<endl',
      "#define input(vi) for(auto &i: vi) {cin>>i;}",
      '#define print(vi) for(auto &i: vi) {cout<<i<<" ";} cout<<endl;',
      "#define all(v) v.begin(),v.end()",
      "#define rall(v) v.rbegin(),v.rend()",
      "#define rep(i,a,b) for(int i=a;i<b;i++)",
      "#define repr(i,a,b) for(int i=a;i>=b;i--)",
      "using i64 = int64_t;",
      "using u64 = uint64_t;",
      "using i128 = __int128_t;",
      "using u128 = __uint128_t;",
      "",
      "/* Extended Euclidean Algorithm */",
      "ll exgcd(ll a, ll b, ll& x, ll& y) {",
      "  if (a == 0) {",
      "    x = 0, y = 1;",
      "    return b;",
      "  }",
      "  ll x1, y1;",
      "  ll ans = exgcd(b % a, a, x1, y1);",
      "  x = y1 - (b / a) * x1;",
      "  y = x1;",
      "  return ans;",
      "}",
      "",
      "/* Modulo Exponentiation */",
      "ll pw(ll x, ll n, ll m) {",
      "  ll res = 1;",
      "  while (n > 0) {",
      "    if (n % 2 == 1)",
      "      res = (res * x) % m;",
      "    x = (x * x) % m;",
      "    n = n / 2;",
      "  }",
      "  return res;",
      "}",
      "",
      "/* Modular Arithmetic Functions */",
      "ll MODm(ll a, ll b, ll m) { return ((a % m) * (b % m)) % m; }",
      "ll MODs(ll a, ll b, ll m) { return (a % m - b % m + m) % m; }",
      "ll MODa(ll a, ll b, ll m) { return (a % m + b % m) % m; }",
      "ll MODinverse(ll A, ll M) { return pw(A, M - 2, M) % M; }",
      "",
      "/* Mex of an Array */",
      "ll mex(vector<ll>& ans, ll n) {",
      "  ll c = 0, i;",
      "  sort(ans.begin(), ans.end());",
      "  for (i = 0; i < n; i++) {",
      "    if (ans[i] > c)",
      "      return c;",
      "    else if (ans[i] == c)",
      "      c++;",
      "  }",
      "  return c;",
      "}",
      "",
      "/* Sieve of Eratosthenes */",
      "vector<ll> sieve(ll n) {",
      "  vector<ll> primes;",
      "  vector<bool> isPrime(n + 1, true);",
      "  isPrime[0] = isPrime[1] = false;",
      "  for (ll i = 2; i * i <= n; i++) {",
      "    if (isPrime[i]) {",
      "      for (ll j = i * i; j <= n; j += i)",
      "        isPrime[j] = false;",
      "    }",
      "  }",
      "  for (ll i = 2; i <= n; i++)",
      "    if (isPrime[i])",
      "      primes.push_back(i);",
      "  return primes;",
      "}",
      "",
      "/* Precomputations */",
      "ll fact[N], invfact[N];",
      "void pre1() {",
      "  fact[0] = 1;",
      "  for (ll i = 1; i < N; i++) {",
      "    fact[i] = (fact[i - 1] * i);",
      "    fact[i] %= MOD;",
      "  }",
      "  invfact[N - 1] = MODinverse(fact[N - 1], MOD);",
      "  for (ll i = N - 2; i >= 0; i--) {",
      "    invfact[i] = invfact[i + 1] * (i + 1) % MOD;",
      "  }",
      "}",
      "",
      "/* Fermat's Little Theorem for nCr */",
      "ll ncr(ll n, ll r) {",
      "  if (n < r) return 0;",
      "  ll v = (fact[n] * invfact[n - r]) % MOD;",
      "  v = (v * invfact[r]) % MOD;",
      "  return v;",
      "}",
      "",
      "/* Solve here */",
      "void solve() {",
      "  ",
    }),
    insert(0),
    text({
      "",
      "}",
      "",
      "/* Main() function */",
      "signed main() {",
      "  ios::sync_with_stdio(false);",
      "  cin.tie(nullptr);",
      "  cout.tie(nullptr);",
      "  ",
      "  int T;",
      "  cin >> T;",
      "  while (T--) {",
      "    solve();",
      "  }",
      "}",
      "/* Main() Ends Here */",
    }),
  }),
})
