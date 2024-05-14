local ls = require("luasnip")
-- local utils = reuire("utils.utils")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
-- qwik component snippets (tsx)
local strg = vim.api.nvim_buf_get_name(0)
local favSn = s("deftype", fmt([[
<{}>
]], {
	i(1)
}))
local tsx = 'typescriptreact'
ls.add_snippets(tsx, {
	s("qsignal", fmta([[
const <var>Sig = useSignal<type>(<initial>)
]], {
		var = i(1),
		type = i(2),
		initial = i(3)
	}))
})

ls.add_snippets(tsx, {
	s("qtrack", fmta([[
		useTask$(({{ track }})=>>{{
			track(()=>><signal>)
			<finish>
		}})
		]],
		{ signal = i(1), finish = i(0) }))
})

ls.add_snippets(tsx, {
	s("q-onEvent", fmta([[
		on<event>={(event)=>><finish>}
		]],
		{ event = i(1), finish = i(0) }))
})
ls.add_snippets(tsx, {

	s("q-component", fmta([[
export const <name> = component$<<<type>>>((props) =>> {
  <finish>
  return (<<div>>Hello Qwik!<</div>>)
});
		]],
		{ name = i(1), type = i(2), finish = i(0) }))
})

ls.add_snippets(tsx, {
	s("q-useTask", fmta([[
<here>
]], {
		here =
		    c(1, {
			    t("Ugh boring, a text node"),
			    i(nil, "At least I can edit something now..."),
			    t("Ugh boring, a text node 2"),
		    })
		,
	}))
})
-- get file type
-- :lua print(vim.inspect(require("luasnip").get_snippet_filetypes()))
print("running ", require("utils").get_file_name())
return strg
