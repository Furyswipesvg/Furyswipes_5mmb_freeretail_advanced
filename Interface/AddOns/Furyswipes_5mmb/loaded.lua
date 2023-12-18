
	-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
local ModName, Sequences = ...
local GSE = GSE
---- PRINT MISSING GSE
	if GSE == nil then
	print("Addon requires GSE3. You can get it from Curseforge @https://www.curseforge.com/wow/addons/gse-gnome-sequencer-enhanced-advanced-macros")
	return;
	end
local L = GSE.L
local Statics = GSE.Static
local GSEPlugin = LibStub("AceAddon-3.0"):NewAddon(ModName, "AceEvent-3.0")
-----------------------------------------------------------------------------

if GSE.isEmpty(Sequences) then
  local Sequences = {}
end

-----------------------------------------------------------------------------

---- Put the macros here [[MACRO HERE]]
---- We are storing more detail to give more control.
---- To find the ClassID - /gse showspec will tell you what the ClassID and SpecID is for your character

Sequences["aoe_fs_FURY"] = {
  ["Macro"] = [[d0JdcaGEQk6Luf8wQQ61uvAMuf5Xe1SfvZxuUPsPFjK(MsvhwQDsL9I2Ts2pq)uq6Vkf)gK7kadLQOgSkYWb4GqptL0XK44uLQfkjlvqSyb1Yvvpua9ukltHNROjcktvKjletN0fjIRQs1LjCDj1gvbBvf1MjsBNQeFKQK(kvfMgvv(ovPCAvzyc1OvjgNa1jvQCwbY1uHopO6ZQuUnG2gvHMfMORqRHeBKo3C4Eibr3GjABB5p0Kj6kmr7C)FD4CXKjAvmrxHwuT)3eQyjach8K)lOl9hya(hr0rcGUbTOtT)ARAl7lvQ0qz9bTMmrxHj6k0Ik3tf8uXJbht3GgygywfygygTeCacAOS(GwuPBWeDfArL7PcE6QF(ncMUbnWmWSkWmWmAj4ae0qz9bTOsL2Uv46xUEU)VoCUyYevQuP5dr7lw)7jtuP5PEQ3bePvreAJ4X1szCSCmEFzqBRqByT2mrl15ILoPvDtckT2d9ZNsWBEE4D0bRACbO09WqerererererererererererAyTEb6t7q9h(0BpaIjnVAsol(Zh0IURLJX022R6oF3sfFViw6dAXkAWes76CLUcnxduq7W9qcAdgQeAgaH8oy0TFqlfAG0vIJhXX0KSKc9LfbcbeqRD4x(tHZkQuPsc]],
  ["SpecID"] = 72,
  ["ClassID"] = 1
}
Sequences["multi_fs_FURY"] = {
  ["Macro"] = [[d0JrcaGEHu9svf9wvfETiYmfk9yOmBfmFqDtrv)cQ6BcfhwLDsQ9I2TsTFP6Ncj(RQQ(nKURqvdviyWIIHRqhK4za5ys54crTqjzPIOwSO0Yb5HIqpLQLPKNROjcrtvWKLGPt5IIKRksDzsUUeTraSvazZqLTle5Jcj9vHqtdq9DHuoTQmmj1OvvACIkNucDwrW1uv58q4Za02eQCBGA2yG6gDWLd27pU5FasNCcuVyGE(ddcDYa1ngOd0b9USdQjd0RyG6gD82bbOYuBfye9mFSr)EqGJ)JcQRq8uVOJFAhKDMDyjrJgDbZEO7jdu3yG6gD8y306zAXLRM6f9oChUQd3HPhqmQOly2dDtJ6fdu3OJh7MwpdiGbELJ6f9oChUQd3HPhqmQOly2dDtJAqmqDJoESBA9mlq5Y1OErVd3HR6WDy6beJk6cM9q30OrV4oB5BWa6GEx2b1KbA0Orp2BAPhlCMQa9v9cuRT(1(vhhiGPhr1LKucDtgOrpVYoKNDmqpCdQTnPxbykbx5N3l6PeaJWkYIgz16lyCXGuerererererererererererOlL2xui6aucHygT3OAspQEkGuqZh6MAqTF10ZF7YBO42uqrsTTh6Mv01hyfDasNCc)ZNo2qr6P24qHWujIcE8Sl7B4ziyfDFuHvej1XSOhIsIu3QRx110rQWDLdg1nA0Orc]],
  ["SpecID"] = 72,
  ["ClassID"] = 1
}
Sequences["setup_fs_FURY"] = {
  ["Macro"] = [[d0tbcaGEkqVevjVLk61kQMjQs9yrmBuz(uj3ub9lkX3OGoSKDkQ9s2Ts2pv5NOQYFvj9BvCxQudLIYGPugUICqO1rH6yk1XPawialLIQftjTCv1dPqEQWYa1ZLYebXuLQjRknDKlcsxLkCzuUov1gvPSvvrBgqBhvHpIQOVIQsttLQVJQItd0ZOunAvIHjsNur5SuexJI05vGpRkCouv1TvO1wDL3kAmYF6kW21Bom3eLHvxXWk5FAQR8wDfpRpyzLJ1uxba1vERWcv)hmITyJd8S5CDUu)r3oFz1RBLHvyPr1NkIQK5IePatiWZQPUYB1vERWsJotfrvYCpBohpVgxCKBLHvyjPAKNnNRZ4514IJC7zBNMQSDfEU8CbWZLNlf9btmfycbEwIePy2YQpih9S(GLvowtDrIePGVSAo6)RM6IuW7QroMElI9Qaof2(EdB6((D735VIHmQGuuPUIEXXwutbGhqrG(8Qaniu8HzWgaZqaaFzeOHqqerererererererererererfOpD58vCZ)pOXhWjwtbpdOpz)g4zPS9TPPkgwl)IB2IyFEWwe4zjakY1itXnhMBY1aA3HzkGWaw(CKYBfXelzgeLnewrNFgP8onfonvb0fWZpHz0zCQOYkihinqaejsKe]],
  ["SpecID"] = 72,
  ["ClassID"] = 1
}
Sequences["turbo_fs_FURY"] = {
  ["Macro"] = [[dSZWbaGEKqVer0BbO2gIWmbiZgs3uk8lPOBJs9yu1ofzVKDlQ9Js(js0FLk(nOgiIKHIOyWOWWrQoOQdR4ys64ikTqL0sLQAXkXYr4HijpLQLPupxIjcutLIjJuA6cxev6QOONbKRdYgrk2QuPndOTJOYhrc(kIQ(SuL7sP0WOKtdXOPu9nuXjLsolsQRjL68ukEnIutdaxgQvvgLQYdiIf4oalDOHzFQvAlJ8gdpbCrgLQYiV7qGmlO4ImkKF(aboxKrPQmkvL3KFkblgaMhM9Ye2YIX2QnNTsB5nHkywmQGucK8MqfmlgvaKBSHow(5de4ScfYBLxGqqJUdbYSGIlYOqHc5aAkbt60obMw5BRnOAD3UcaaKaeh5KhpK(qetrgfYBGJb8eJmYndkohf5R94EGqKCqOi33JmBY(e41TD2a5a())))))))))))))))x(Hc7WeYn2XO5YKXKADWO9GYYPGZTlMOGaNvcuTTL8gtgAqBLdmb5W5aboRv5GXahi0qPQCUzGWe8yQGztFIzbbfjSrRYD6y(wGvIZwUHsQuQAzTTSKNg2y50WSp1Dmm7VsPcfkKa]],
  ["SpecID"] = 72,
  ["ClassID"] = 1
}
Sequences["single_fs_FURY"] = {
  ["Macro"] = [[deefdaWlbmmf1XuYYa8mv00Ou11OkSnGuFdizCuQSovOCqQSqj8qkLMiiCrjAJavFeOyKGOtcsReu9sfOMjq4MuvStk(PkKgQkuDuvWsPQ6PqtvsxLQOTQa(kq0zbk9wQsDxQkTx0FPkzWcYHv1IvOhtjtwGUmHnRG(Sk1OfuNwkVguMnPCBsYULQFtQgUICCviwojEUsnDrxxLSDfiFNsHZtsTEkfnFH2prZfR0SiUB9BnHxd3EbUN(blnaSs0N3srFZknlwjoWR0(rnXMvIfSsZIyG8vUfPOluPwgY7UE4xrLVEhu8b9LgaIb25RKFMVfmMeHZknlIbS(Dkd5Tk9Gh71sFLHQ)vpzYKOZkB69nR0SyLMfrzugHlJYinaedy97ugc40o7w0CsugLXczugjwvpji6SYMENjnaSsZIOmkJWLrzKgaIbS(DkdDAV9a2rZjrzuglKrzKyv9KGOZkB6DM0CYknlIYOmcxgLrAaigW63Pm0c0NaZlAojkJYyHmkJeRQNeeDwztVZKjrO9XRMwoWR0(rnXMvI2QRA8twqSQ06We5Ife9363aCKyvP1Hjsawq0iSGXrIqk(GCKyHql5ir)T(9IJmzYKiifpm3LYVzLjrq870ZPGFkcseyg4CTa8y5XmONTNOpI8H4ZNvIqk0M0ADyeb)sr92gTjXMy91e9CtS4U0n8AWFZMLU7JdCeNbIcGWQgckiDoNZ5CoN7W9n6kdx2oGZUWqpanCju)icfU)segiF4WVHv6CUYdhCeDxzyDfIGFPOEBJ2Kytemy5acLDtVtZ5YJzI(89RxdApfkds0ZMENfeHuOnrKieIH)LwsZIO5vjicUN(bRxiudyarjrCsybfcAafaX6rTLM18mW8mXY(qDflHT6QM(8hBATunlyYKjja]],
  ["SpecID"] = 72,
  ["ClassID"] = 1
}
Sequences["single_fs_OUTLAW"] = {
  ["Macro"] = [[dSZNcaGAPk1lPsQTPOmtQuZwQCAPCtur)sj9nvLxlvj7eL9c7ws7xP8tuj)fvyCcXHrAOsumyLy4K0bfDufuhdX5uOwOczzKyXcPLlupevQNs8yQ65cMivIPQYKvqMoLlkrUkQIltQRJQAJsvyROkTzfvBxIsFuQQ(QI4Zsv03LOYWuQgRcy0uj5zQQoPI00KQY1OIZlHFRkRvIQUTc0GGdmcKqR2ZonhZdCWfpN7Ccyk4GWj1h)c4aJGdcV04gnANoGdgK0BTxnGdmcoWiqw90GTTq(CuGCfQAiP3AVkmWuWbgbYQNgSTfNX)rGCfQAiP3AVkmW(XbgbYQNgSTfY4zriJHCfQAiP3AVkmW6dhyeiREAW2wiFokqUcvnK0BTxfgyo4aJaz1td22YpXPVXZGCfQAiP3AVkmWMHdmcKvpnyBlKphfixHQgs6T2RcdSpCGrGS6PbBBH85Oa5ku1qsV1EvyGfbhyeiREAW2wiFokqUcvnK0BTxfgmitRr536mEPXnA0oDahmyWGmrt7vYpMgWbdIBAW4rDiQPhcIYUYpHO4qC(jo7q4uBuxOgfhKJ2PRwaYOHho9tI()v(iUEGEhXDxjs8vMbMhgLzMzMzPmZmZm5oZmZmZmHK8nx9IH0d(XfHY1u1bi9lL4vhhAVky)eNDiCsR8PDtRMoUS6Q1EvmccJoOgcx8CUZjCitz97Ueex0ZP87mWiqevTFQlGPmBhYXf3Gr23v23HuQo)f71C)guLA0OTUMvGrWGbda]],
  ["SpecID"] = 260,
  ["ClassID"] = 4
}
Sequences["setup_fs_OUTLAW"] = {
  ["Macro"] = [[d0ZVbaGAOKEjG4TOeBJi1mrv9ycnBv63k6Msk)ck1TrLUlk0ovXEP2Ts2puLFkj(RizCssdekyOOidgf1WvOdICuuWXe1XHcTqvXZuLwSs1Yvvpub9uHLrWZLyIkWubnzuQPt6IaCvuLld56e1PbARsQ2mQy7asFeq1xjIpdfzAqvnmrmwOIrtKSoOOoPi13auUMs58qLoSuRfkXRrjTZg6t2rbPYJP4usvHhKpjXhbdDuRf)ZIH(Kn0r9(d27xuXqRoirfCUkg6t2qFYoWwSlkEmZYAYDYMr8y(nVTvfFFeCGDrNJTQTiRSWDYgZ9vz0be3rKdsubNlRwDKETldE169hS3VOIHwTA1HeuZkj)7IHwDWVlkVr2TIy7qir4nNf2YBVc4V5Ogs7bT2g6a2x0sloEyGbsuY(lWWsvGGdwRY)ci)HmHdNYdrereraiIiIiAirerere5GKvPMFhqPq3FJrm80OlMKxoaEaOo6xaNlFEZBjoQ1l5(MEPOpqrlfCU8JJtZf5OcpiFssQaaKhtogG40Yx1NSJyejMEGpcsN4awzOp5KeHKehawCMFr0Wj3Xw7DWlOIRFSA1Qna]],
  ["SpecID"] = 260,
  ["ClassID"] = 4
}
Sequences["multi_fs_OUTLAW"] = {
  ["Macro"] = [[dOtNcaGAPu1lPsY2uiZKk1SLIBQq9lLQBJk5Xu1oPyVWULQ9Ru(jQO)Ik8Bv5WinuPumyL0Wrvhu0rvqogkNtrSqfPVHqlwalxcpevQNsSme9CHMivIPQYKvqnDsxur5Qkrpdbxxv1gLsYwvvAZQk2ovs9rPe(QIQPPa9DPenmjASkGrlLsNwsNujmob6AuX5f0LP0ALsQxlLkdgoyyq46VrRC8jYbNlp35CyiXbzm1x8I4GHHdYxArLgOXgXbfs616RhXbddhmmi7EAu3wzeDiHCH8wiPxRVouyiXbddYUNg1TvNjecc5c5TqsVwFDOWqahmmi7EAu3wztgfKnbYfYBHKET(6qHzqCWWGS7PrDBLr0HeYfYBHKET(6qHXbhmmi7EAu3wjWCgCYiixiVfs616RdfMr4GHbz3tJ62kJOdjKlK3cj9A91HcdrCWWGS7PrDBLr0HeYfYBHKET(6qHjioyyq290OUTYi6qc5c5TqsVwFDOqHSOh4V2OFPfvAGgBehuOqHm3sBx(xqJ4GcXnnQl5hMQ2HHqwssGXiDyoeillHm2QuxOkfhKJ2y7AeY0Hgk9ZdqGyRd6QbAFq3nZyfxBg4tCAMzMzMZYmZmZK7mZmZmZes(RT9vaPv)fHXww5TriTqM91weRVomeyoLqgt7)0MfD1w4ABxRVoMcXq5YcHZLN7CohJx6(waXf7h6FJcddIWB9lCbgYrLqoo5ggwzjzzjKz9pVcVL7hx8uLgO2u1qmfkuOaa]],
  ["SpecID"] = 260,
  ["ClassID"] = 4
}
Sequences["aoe_fs_OUTLAW"] = {
  ["Macro"] = [[dOtMcaGAPc9sjI2MiAMsvnBf5MQs9lL42sLCAPStc7f2TK2VQ4NkWWus)wPETejdvIIbROgoQ6GchvQIJH05uqluH6WiwmvYYfPhIs6PKwgkEUOMiQWuvzYsLA6uUivQRIs5YeDDuPnkvWwrfTzvjBxIWhLi1xvittQOVlrPhtvJvQsJwIkJteojkvptv5AuX5LWFrjwRev9nvvdkoiOqjBjlVYSmGTRFmccgCqFt8P7moiO4GYjjTrCnjZ4Gbn8wBxZ4GGIdck0fpjBpZ0FhgOxbVeA4T2UcdcgCqqHU4jz7z2z4xcOxbVeA4T2UcdIpCqqHU4jz7zMomzc6qOxbVeA4T2UcdIoXbbf6INKTNz6Vdd0RGxcn8wBxHbHdoiOqx8KS9m)rD6CysOxbVeA4T2UcdIK4GGcDXtY2Zm93Hb6vWlHgERTRWG4hheuOlEs2EMP)omqVcEj0WBTDfgejWbbf6INKTNz6Vdd0RGxcn8wBxHbdk7vxCBtgNK0gX1KmJdgmyqhjjLk4MsY4GbTpjBSX3nXKDdLzL5JszCOoFmRjH(wAeoigbh0JmjRwg64E6j8JC99x(eLS3oMO)KBA6vMEFLhhrereH7iIiIiynIiIiIiGgCTYTtH2bUPf5Y24LzOLwDZPmn32vi(OoRqFtQCjtSxnzAjKvRTRymubPlj0bSD9JrSedCdLd5lc3jdckuLx6zNdiysUc9gWke01vM1vOURV2PEjR7U4jgXvBQzfymmyWaa]],
  ["SpecID"] = 260,
  ["ClassID"] = 4
}
Sequences["turbo_fs_OUTLAW"] = {
  ["Macro"] = [[b4vmErLxofJxtrxDYj2BFz2CF9uvuXuqx5LtY4fvEnvtHnMCVnNxu5LtX4fvEnLvHjxAHjgBLnNxu5fDEnvqJrxAV52CErLxofJxu5LtX41uVmwyZrNFGT1yV1MyHrxx(bMmWuZnY4LtY41uVmwyZrNFGjdm5qJxtrvEWvMxtf0y0L2BU5fDErNxtLKBIvxASrNvHjxAHjgBLnNxu5fDErNx051uxvwyRfuDYf2CErLx051umf2C0vfCKfgDLrMxtjdmYmtmXitnXuZm1qdmEnvtLrxyefgDH5fvEnfvHXwzUr3CEnLqrfvqJDLyZCJw4SewQHdtSvumYrfuyz2CcfuqbfuqbfuqffuqbfuqbfuqdfuqbfuqbfuqbfKxtfuD0H2BY51uuHwzSjxyXbKqHvgBNvNBEn1rtvKvLj3CP9MBE50mXudmEnvtH5wDHXwsUrxzYzxzUrxAV5Mxc51uofwBL51upvfvmf0vFrvvsj0tEnfrLzwy1XgDE5umEn1uWv2yjrKxojJnW41uu90qE5umWaJmWaJxtvKBM9MCJv2qV1gCHrxyILgBPrxEEjKx05fDErNxEb]],
  ["SpecID"] = 260,
  ["ClassID"] = 4
}
Sequences["single_fs_SHADOW"] = {
  ["Macro"] = [[dOt3baWwLsVgkAMqPMnG5tjDtfLFPi(guOhdPDkP9s2nv2pq)uj8xLOFRkdeI0HfgSkA4uKdQsURI0Xu44qelecNxj1IvvwUOEiuLNIAzG8CjMOQQPsvtMsmDKlQcUkeLll11fPtdQTQuSzkQTdr1hHs(Qk00Gk(SsLrcvABIy0kQMLsYjPGXPu11GQ6EqbpJcnmk1TvPwd5vDiUa72b0lnxwY4E9V4OQqYlEwGMFf5vDiV4nrgo(a6I8IriVQdXtOiVRP213Rbp36EZJ890Tw6WYuvHepPqrMcIcumfjs8fkb)Cf5vDiVQdXtqJcvAKK2o0g8CBUlnHb039xqtbphyeAf4zY(KvGNj7twbEMSprviXGwbTIa0kOvX(1MAXxOe8ZjsKydUVuyaAtKHJpGUiVirIeJDuiKzYsqTfXq2qghdiJq22qgteFSdmVsZrrErIN1u8huiVyFa0oQiw8vkn)Lf7N3528l3aXnsrenWUuNyS4dB6Cb(5u14aFBXZcxAayWrDg5TJGFoHqCnUBXmUx)loUKnuXc7dIp4m)YOnEVBtbfFWaW0AHqmBQrn8R6ah8XrSFbEQoSTHSTf)3MJuas1HirIKa]],
  ["SpecID"] = 258,
  ["ClassID"] = 5
}
Sequences["turbo_fs_ELEMENTAL"] = {
  ["Macro"] = [[dWtZbaGEuIElqLTHQmtk0Jb1SbCyvUjq(Li13qfnoPk7uu7LSBj2Vi5NOK(Ru0VvvdefQxJI0GLcdxHoiYrrfoMIohkWcPulffvlMswoipuk5PcltvEUKMOcAQqMScmDQUOiUkkLNPuDDk60kzRsfBwQQTJs4JOG(kkvFgfX0qvnmLYyrHmAGQgpqPtkv6Safxtk15rLUmu3ffLBtbRPqkpv4Mqw)M9RntmMakjJiJk)esbOdg6xfs5Pqk6CqRZcaxfsUcc2x)sviLNcP8urA4R6PA843JVYpfPHVQNQb4G)gSoNzPASVZJbCQaXDeRGG91Vix5NqkqChXkiyF9lYLROBXYCb4DoO1zbGRcjxUCfSJpMsMqxvi5kmEvNTXbNJhO4T92NZx7zB(78FkaH9B45NqkqhaU4vf2GHdILR10cS8anGrSZbqpUP5SNvLxlIiIiYMiIiIiIiYMiIiIuqMo4)qkOcGHrtGkMX2hgGjMffmms6GHQRFr59z7nfGUI5b0T4yiwGl(6xKTI8zaRiXysteBm3MvfdX9ptax5PIyed3DOYpEpfiwBP8CB7TTPiP0)dbJB9nmE(zTawoxzlxUCja]],
  ["SpecID"] = 262,
  ["ClassID"] = 7
}
Sequences["single_fs_ELEMENTAL"] = {
  ["Macro"] = [[dCJ2caWwkcVwQIzsvA2cA(uYnvQ6xsXTLs2PQ2lSBH2Ve)ukv9xkQ(TknqPumyPYWPuhKchdLZPcTqe6XIAXQOwUapuPWtjwgv8CjnrQIMkstwfz6KUicUQuQCzuDDe1HvSvQcBMI02LsPpkvLVsr0NPOCxPknne50kz0kfnoQ0jvknmrCnQQZlsBtPYZubFtQQgmqXZGuxrZc5MBA1CcEjSNWtn8I3bui7NCWTckEgOq8ycwZ5qEfuiebfpdsJobMXvEK3kT0zI4DZjOvVM4eFo1lEhinvDc0r1j3duOqmY66gRGINbkEgKM8u1shZ19G7r8oqkwflIfRIfeAQnhIrwx3iu8oGINbPjpvT05MqYbVdKIvXIyXQybHMAZHyK11ncf)bqXZG0KNQw68z(j(4DGuSkwelwfli0uBoeJSUUrO4jbkEgKM8u1shZ1LDCheAQnhIrwx3iu8(GINbPjpvT0XCDzh3bHMAZHyK11ncf)oqXZG0KNQw6Cti5aHMAZHyK11ncfF)GINbPjpvT05Z8t8HqtT5qmY66gHI3fu8min5PQLoMRl74oi0uBoeJSUUrOqHSnEM8ku9ycwZ5qEfuOqHcX7u12zFAu(jiojohymhFMpPe)(Hys(0Jb5GPckui75645OdOqOtipQviqmiRBEdGyedBztoSYBdXHhAg5iK(ecEWdQRBe)bMFcK9tK8eUnQ8G2YJ66gbri)0IdHGxcMlB)(8sacHOP3GmFJBl7rNZRWLMcIqeBEERN4zKirccT9BGNLK4KKaXtUPd5qfpdkuOaa]],
  ["SpecID"] = 262,
  ["ClassID"] = 7
}
Sequences["multi_fs_ELEMENTAL"] = {
  ["Macro"] = [[dqtSbaWwKKxJOAMkPzRO5tOUPs8lrQBlP2jv2lSBQA)sXpfj9xrLFRQgiIudgjmCLQdkLogLwOszXivlxHhks8usldHNlvtucMkrtMqMoQlsrxfr5YQCDkSvrvBwcTDeHpIi6Ris(msQhlIdlCxKOrJumoKsNKGoTQCncCErPNjkMMenmjzyHeol0AJj)YvSNZC1CX0jBxHJasOlrY43HeolKqZhJxqFEDiHUbjCwOP5yq9XN)QZ2qbv(pnXOMsQeDHikHJaA6ohdoyosihmyOTj8777qcNfs4SqtNeDUHclT0wwMbocOnIBeV1iUrmuz29dABc)(EWGHk0t34n58X4f0NxhsWGbdLuxqERXi6qcg6A0zY2ff8jckrfrgRLqGvqjbHaOlhhfcoGeQmMNN7qH2AW08hqB9Z6DJz)i9wCtQn8qjPAM)g933dxgRGkOlH3iMc98niX5533JnOUO(GAUAMBHSvPqOfUIHXKHZcv3VeHfGZwwwcvMAkWzRQiQQGA6l(hjxk)69Gd6V5JZInWGbda]],
  ["SpecID"] = 262,
  ["ClassID"] = 7
}
Sequences["aoe_fs_ELEMENTAL"] = {
  ["Macro"] = [[dutRbaWweYRvv1mrIzRI5tGBIu(LOQBRi7uK9c7MQ2VK6Niu)vu63Q0avvXGrunCPQdsuhJklurTyKQLRWdrepL0YiYZLYeLOMkftgjnDuxKqxvvHlR01PKhtP2QOYMLqBxvrFuvjFvvP(mI0HfUlc8mcA0ikNwvoPezCiORjbNxumnPYWKKVPQsdhmi5Gg3nBXwwrkI0etgzkijbduAH942GbjhmqZfJxq)SnyGoddsoO55yq6YRFNYutor(lzXyIaIOUbvcqscA(ghdoyoS)dgmuzB(D9nyqYbdsoO5TJgxtUJqc76eIKe0Ab1cMRfulaQjt)cv2MFxpyWql5PB9oCUy8c6NTbdyWGH(9g)LTgrdgWqPen(JEQbVuHkvjj05Kk4k0jj8xO0wokhCadutCwp3Gcv2Ij7oGk7pt9wN2(ZCShsT8q)sfZTJ276rsORqfuAH3koL88o(C9876Xm0umTqfPiMvMyrOL3IH1HrYbv7x7sLrY111b1qmji5QQKQQGk6lEh2lj3P(Gd6VZJZGzWGbdaa]],
  ["SpecID"] = 262,
  ["ClassID"] = 7
}
Sequences["setup_fs_ELEMENTAL"] = {
  ["Macro"] = [[dWZ3baGEOqVvQY2aYmjOhtIzROdR0nbQFri3gG7ci7uH9sTBPSFc1pHcgMu53IAGGknuqPgmbgojDquhfk5ycDoqHfQkDzilwvSCs1dvbpvYYa55cMOkPPkYKvPMoYfjLRcv5zeX1jQtRQ2Qk0Mvr2oOQ(iOOVcf9zOuRdQyCqvnwqvgnOKXdO6KQeNfq5AePZRI61qL(gOI)kv1o6KhrxbejR2)uOVMqnWAJel0diNCbEv0ZbN8i6KRJR(FFMOGtMCXk0p3co5r0jpIUePSbsSGETmG8nqIfeHbuSdKhqUefOSQYgOFdBXc6biFJZojG8qIlrbkRUeTk4kwqpa5BC2jbKR0zvKlwH(5MjtUU0EK)t64Q)3Njk4KjtMCHjAXLL13GtMCjCdeEQ3lHUDb1bjjgHKgLknkbKlWiAVU06KR0ornk46fyyXy8)Jpahe4B4Hjwt8plco4)eaDGzMzMFzMzMzMzMFzMzMzxSmbRSUlUnbOkpdi4(UOj2YnxWS0oI0d)CZdjrPDUaVn5DEPriD4JA0p38RRXca5stOw)slHhSDDfDALNKhrxLks5YvpGab5kHHdEe76G66CP1oL1vqhYauxAF(ZpD2VMmzYga]],
  ["SpecID"] = 262,
  ["ClassID"] = 7
}
Sequences["setup_fs_FIRE"] = {
  ["Macro"] = [[dKJ0baGEuWBvk2guXmHsMni3uPYVuQ62Qs7uL2l1ULQ9Jk(juP)Qe(TepgudffAWOQgUioiPdR4yszDqPwikzPkjlgLA5QQhQK6PclJGNt0ervMQOMmqMoYfvfxfQQld56I0grL2QKYMvkTDGsFeOYxHc(muOVdummj50Qy0avnEOkNeGNrORbOZJIgNs0DLu9AOODZzFBoKiknzXw5cUaw94RGZo2nW)I0zFBo7O28pdBiK0ztouy6u6sN9T5SVnh7LujziAGXKd)nVfqypquDFfCSxsLe4rsNog5WFZBbe2dev3xrh7HhjXH)ME5TaQoh(cIafBIoYmtqouy6u6Mm5aqND6bIQn)ZWgcjD2KjtoWAKe(jGgcbYHqLGyRjaSbeOq1shyanyQP)r6Sjh7q0WBOXzh5bc1jPdwl5P)ap4o60WHXL4XflXpdmGlZvRvvv9rvvvvvvvvvLLQQQo0uc8LVdUPFMsWCsqshGlEQH(YtP7RydyLJDtpDGa0j0hSOoDkDZYbp02jfI8T54PVT8HrRlVjdnSpqhIPz5isqWa45loIoY4U23wvLqvLJ78ICWfWQNfXtgFgnzYKna]],
  ["SpecID"] = 63,
  ["ClassID"] = 8
}
Sequences["aoe_fs_FIRE"] = {
  ["Macro"] = [[dCdSbaGEbYRfOMji1Sf0nfr)cu62GIDkL9I2TK2pe8trQ)kcJtKmuqObdrnCjCqIhRQogjNtHQfcLwQOYIHILROhkQ6Puwgu9CHMiKmvsnzqvtNQlQGRccUmW1LOncP2QOyZkKTdI8rqsFfe10av(oiXHvAyQYOvOmEi0jvrNwQUMO05vHNjGTbr(TknvuZMI2EbjgftG(m3aB4utl5(N3i1SPOMwMD2xmHGi10PjFVFRrQztrnBkAW(3OJaYkCCA6Jcan579BLoB4uZMIgS)n6iGSco4gNM(Oaqt(E)wPtN2zftzp0ZSZ(IjeePMoD60GmydwkNBKA60GEJoekGFDa80WF4buk8SQSV3lfTKaFrT(snn9gcQEKg2uOKPH4Vc6kKGykerdDGzqbL(ixErergerererererWkIicnP0h7oPHUCEeHsVaePbvBidyg73kBbuzF0sU1Yn8S6GjKavVFRelT2cdGg6ZCdjK0d0qbgTLHoBkAwb4FIInKcqtNopBQ3d)9OnuhDNFq(lmfRVy6HD)GyPtNoja]],
  ["SpecID"] = 63,
  ["ClassID"] = 8
}
Sequences["single_fs_FIRE"] = {
  ["Macro"] = [[dKJ3baGEsP2Ms1mLQmBQ0nLk9lPQUnjPhRs7uK9I2Te7xs1pjf9xf43aDyvnusedwsz4sYbP8mahdY5irAHKklvkzXurlxfpub9uILPipNQMiPQPc1KjLmDHlQqxLeQld66kPnsf2QuQnlvSDsGpss1xjb9zsiFNKW0ij60IA0KOmEsHtQeJtkCnPOZROgMs51KO6BKuMiIzcrXNlkYfoOJFGJLwJmnrmLU)9a6jMjeXuA)N870f6jMbf7gzWINyMqeZeIs)77J61qiG9Dk45kif7gzWcdMMiMjeL(33h1RHaaOGNRGuSBKblmycGyMqu6FFFuVgasPna2PGNRGuSBKblmyqzP4Cn7gT)t(D6c9eZGbdkke(k3wpVNygu69(qXvA9bulktBtai0utKkBQgGAu6cJx)hpXuWVlSeEk6AO3oIg3cmJ2vsdnC0d4OT2Ao3AOzMzJMzMzMzMzMz6mZmJITgkd8qXX6z2RICf0trDzSn84ZGfMaqn3O09lRV7sjGhfalrgSqDusVQqkowAnoqwsQ3BKIEyNF1nycrrQG3f9mTdqbR5qMqBBtBBuglDapx4qqvR(4DMDZXm1XGbdsa]],
  ["SpecID"] = 63,
  ["ClassID"] = 8
}
Sequences["turbo_fs_FIRE"] = {
  ["Macro"] = [[dCtTbaGEOOxtu1mHuMTQ6MsOFjb3gsANkSx0UPQ9lj(PKYFLO(TQmqqIHQuYGLKgor5GKogHhtfluQSuO0IbXYv0dLIEkLLrLEUqteQAQcMSuQPl6IsvxLOYLbUoeBus1wvk2SuY2bP6JGu(kKOpRuQdRYZa14GunAiHXdfoPs1PvY1GkNxImmISnPW0ajnfmWHGwImH8k3kwU(o2EoCzGwXZz(ImWHGbABU56G8brgystDY1ZhzGdbdCiOvW5IzLQUW4GfWC4sRaseuPQaMdyAfqIGzLQcOslusgGM6KRNNjtA7EiiRFU5MRdYhezGjtM0qj4KxrMxKbM0q7IPCYAFjOnnxjxyHWfNaNKqQbTIG8WF5XaTW9b(msRdD860WWXdwIgBHog1rdEIjM1kHTPQQQ9QQQQQQQQQQDQQQstrsu8M06)p)3hxTbqP7a)Tr80GM1VbmJRNNdybojAfppY939jycDGpxpp7Onoub0QVJTVCqoSD1OHh06q(jhcAMmGZoEoAatluRjhcjjxjjA9(wVPdO5dvzxEqw)vwIDmzYKea]],
  ["SpecID"] = 63,
  ["ClassID"] = 8
}
Sequences["multi_fs_FIRE"] = {
  ["Macro"] = [[dCd3baGEssBtrntPQMTGUjPYVKuDBPs7uK9I2Tu2VuXpjPmmH8BadLeQblPmCH6Gu9yv6yqohjvlKuAPkIftQA5Q4HkONsSmL45IAIcyQGMmPOPt5IkvxLu4YqDDjzJc0wvO2SuLTtc8rsqFLeY0ir57KiDyv9mGgnjIXtsCsLYPL4AkKZRKgNc8Asu9xfPjIqMqu6wfALP9YtdUnzNPfcPO7VhGmHmHiKY4)uE9H4mH0O4xRa0YeYeIqMquQF)S1PgcboptbUgJP4xRa0OX0cHmHOu)(zRtneiif4AmMIFTcqJgtGeYeIs97NTo1arQpaCMcCngtXVwbOrJgLTM(QsOn(pLxFiotinA0OOi8RCV68zcPrP)NnnI18nSMuwIwarOLriLns9Ozk6W2h4TNqkWpe3SmfTdc4hrLBdxqZkEGkb7dEuvv1wNm0D39D3D3D3D3D3DTU7UtXRmLaCOeS6SMvAjgNPOqzFm(KlanMarJIOO7BvF4wZWhfGBwbOrTusFxmLGBt2NQtJ(WnkbW9(QqJjefjgF3cW0mifOAdzcffTefrzV1d4CXdb6g)2RVewSvQLgnAKa]],
  ["SpecID"] = 63,
  ["ClassID"] = 8
}
Sequences["multi_fs_DESTRUCTION"] = {
  ["Macro"] = [[d0tfcaGAku9we1RvI6WQmtiLLrLMnuDnq1nPK(fiCBkL7rHyNqSxPDtv7hv)eenmL0Vf1SqIVrr1Gj1WrOdkCukHJPuhNcLfcjlvvYIrWYvvpeuEQIhdLNJYerstLKjtrz6exerUQs4zuexNk2ifWwPuTzqQTdPYhPG8vkrtdsvFNc0iPGASuinAKYDrQoPQ4ZkroTiNhKCzGTrr6VQsD3vvKDhBo4s6n0S3ujnQxlGPEGePiUv1X6H9ZSQkYUQo2VF6iGdyvvPtGjPSNvvr2vvKDhiWoMWagZb4XaCnx)bmGyeSSncNaXgoeY9xciCnxVn3Lcxt(XJL8G)ja6CnfUMmmAxMX1OY4cDUMcxt(XJL8G)ja6CnfUMmmAxMX1OY4cDUMcxtggTlZ4AuzCHox3rbfrqNatszFLkDE8eCs4I97Noc4awvvQuPdAhtwq0StaM1XD11K92f(g(2u31owcULdN)XQQshRa5OEYvvh1Hd8cRdkMfHXHJwIec6TBuAtYd)fMLGyXsreregoIiIiIiIiIiIiSi6eocT8VJbC(qXmyIiG1Xqdj7GplL9fXKn81owpVZH)4fWhDaVKY(IQdva0NdUuKDhsEOZFmaSSnINCes4jbQIQZqeG9qTiUMAEhfKWkYED1DDTdYzd0HkPr9cY3wxGM6PsLkT]],
  ["SpecID"] = 267,
  ["ClassID"] = 9
}
Sequences["aoe_fs_DESTRUCTION"] = {
  ["Macro"] = [[d0tecaGAsP6TiQxRG6XqzMubhwPzJuxdIUjq8laCBa5EqLANqAVs7wO9tYpPIggi(nvnlK03iv1Gr1WrWbPCusvoMkooujleKwkqzXqvlxLEiO8urlJk9CuMismvbtwbz6exeuDva6zKkUUcTrsH2QcSzOITtkXhjLYxjvAAKc(oPOgjPKglPiJgHUlICsi8zQqNwrNhqDzvTnGQ)cKUNgk6P56FqXHbkf4zamaHfq4eTOUn0eKf76znu0tdnhS35IN(znuPPHjtFK1qrpnu0ttaWwMWECn(rSxXv87ZEb3yEGWVcahKai71XxuCf)OVlvfNmIi2m(3vEskovfNmmIRNP4q90cjfNQItgreBg)7kpjfNQItggX1ZuCOEAHKItvXjdJ46zkoupTqsXBgaMW30WKPpwPster8JtAzWENlE6N1qLkvA6WYeajm0k)qnDH4QZ54I8G8aUl4n193HTX7YAOstqEzPSY2qZWs)rH1ektpt7iDychvdd0eXCgrcgMUVbOJMzMzA1mZmZmZmZmZmZ0ZAAJcr)TPghVaZ08KWZAQTe(G)YM(yr15Gestq244sJik)vlFuM(yH2KYJZoslf90eEeh)f7H5bIWkl(j9uaUqBMeEmeukQl463m4ewrpqG4cbst0fOVjf4zamNGAoHxPsLwa]],
  ["SpecID"] = 267,
  ["ClassID"] = 9
}
Sequences["single_fs_DESTRUCTION"] = {
  ["Macro"] = [[d0ZfcaGAkIEluABGqpgHzcQCyvMnuDnk1nHO(fi1THq3JcXobSxPDty)e9tq0WuKFl0SqQ(gfLbJQHJihKQJsr1XuQJtHYcHulfcwmsSCGEiK8urltjEoktePmvbtMsy6KUiuCvqYZabxxrTrkiBLsAZqKTtH0hPi9vkrtJc47uegjfQglfuJgrDxK0jvsFgu1Pv48GsxwvVMc0Fbf3Ddfy3KneWJ)WGedgAyYacqHkScjqbwAOjYhbyK1qb2n006book4pRHQnDcDefSgkWUHcSBcnXXu2BS5xq8sUKd(SxncrerkNc92gA9aH)vjxY3MTqxYXUkigIh80NQKtxYXII8fzso6iUsvYPl5yxfedXdE6tvYPl5yrr(ImjhDexPk50LCSOiFrMKJoIRuL8Mbyj9nDcDefvR2CvqzEGRwpWXrb)znuTA1Mw(Nb9zWJ1q1MWDmfkswC6BrZLPfiS3l2B7T9KDtKF9OD61qZWH)cL1enZC3K2WnWayaRgMCoe2iqy57qbV7U7UXD3D3D3D3D3D3DZ9M(Ssoc20qZGWYmXG0ZAAAIX6dYgrrbGW2EQjYNy(Wxf6dA0xOJOOOBcCi(nPHjdiajm5kGPWHPjThPBgxlWUzs6jwPvGfiAwZaKOkWEAAzAQjgbsrqIhversNEug4df2IUA1QTa]],
  ["SpecID"] = 267,
  ["ClassID"] = 9
}
Sequences["turbo_fs_DESTRUCTION"] = {
  ["Macro"] = [[dOtWbaGAeO3cvyBiGzIGMnuUPKYVqOUnsCyf7uI9sTBLSFrYpjWFLu9BvmqOkwgOgSi1WrQoiQJIOCmrDxOkTqvLLIuwSuA5Q0dLepL0Jb55s1evftfYKretx4IQQUkr5zsX1fX0qiBLqTzcz7qL6JqL8vePpJO60k1iHQYyHQQrlj9nc6KiPHrKRPkDEIkJJOQld8AOI2zJCjBnsUTN6I61F(venzvqufuCb2iR1gO7PBKlzJSkEU7Pfd0nYHvgk2Nv3ixYg5s2kXqtpsLghqhkTtG3uPBAekb7cSvIHMEKkDwIiHcBSIKJoWkdf7ZYHdRuxTjBSq8C3tlgOBKdhoSskyWjNCNUroSs40dz0jzcajwHLGBYz438Bw(gyR1aX8mXyKv0Gbwr36xNmMGVeU)lejg)v196LgePawg5mZmZ4JzMzMzMzMzMzMjJTYjr1Z1kQk4ceDUaSHcE(gag5jlR4s)fdU99z5st(vYATzLmyuxb4IBWk2NL)SwgkaRp)kIMG6iz0(ey9biAsWcxYwv6aiQpUataHwrcQ4swscwsY6)s05cbQCOqFIPDJTd58NdhoSb]],
  ["SpecID"] = 267,
  ["ClassID"] = 9
}
Sequences["single_fs_AFFLICTION"] = {
  ["Macro"] = [[dGdlcaWwQk9AQsMjfz2anFHCtvOFrv1TPGDc1Er7Mk7hKFQI6VQi)wKbsvWGvPA4uYbvKdl5ykCCQcTqawkvrwSawUOEOa9uIhdQNRutuvYuHmzb10jDrvHRQc6YsDDk1gPO2QQuBwq2oGYhvb(kGQPrvXYuv3LQuJJQOgTkLtRKtkuBtL01ufDEk0Wuupdq(SkXCqeXdk7L7cyFk0(0KzZMIdIIpJj(teLJfCoTjI4bruEx5vfaS3erbarepO4xR8LwBxBWi0DFDPBv2G3(gURWEt8NI)TwzTuTG9IkvktW6k52er8GiIhu8dxBf6oCkNTT0vYr8NcueueaOiOikiJwnLjyDLCuj(teXdIiEqXpCTvO7x98vI)uGIGIaafbfrbz0QPmbRRKJkfKrRMIPuYIINARUuIFsr02YSTdwxjhfP9OD70vbsLkLyxa7fO(UYRkayVjIkvQumvB9qRWL2HP8N)ang)RJzG()pfG3Lxt25AtevkhBTEvArefub2oDtHYKTElLPGU15ouk3GLbpaOAWl2okhipE359k5igOXZzkhlNDbg70odS2PRKJaO8Qdv2GkXdkpCHsz4oyYGvPvGf4snsaueRgo(fXdFE6df05GepMN)ZZuWLHMYKzZMIdIIpJpjX4dm9GkvQKa]],
  ["SpecID"] = 265,
  ["ClassID"] = 9
}
Sequences["setup_fs_DESTRUCTION"] = {
  ["Macro"] = [[d0t6baGAuQ6TkvTnfHhJIzIQ4WsnBa3vr5Mkf)sj5BkIghQQ2Pc7vSBjTFc6NksdtL63uzGOuAOOuzWeYWPkhKYrrv6yQQtRklKalvj1IjulhIhQu5PKwgKEUeteitfQjduth5IQWvjkxg01PQwhQKTsK2mr12rj5JOe9vuPMgQWSqPyKOeglkPgTIQNPeDsI4ZkLUMk68OIEnQk3wL8xLW5hCg)Ofi57TqEzbOdfVw2oSKPJmqdo6MMbXvcoJFWrL2iVwmaSeCOOgd9C1sWz8doJF0vmDHekAF1D5aZMQZdsZekAc(5pd0ORkKZJPl0RUvOO9xoWC1a0SmwgDvHCEnrndFcfT)YbMRgGMffZPhmQXqpxnuOOsQI9FaK0g51IbGLGdfkuuE6cjZdCtqWrrVrx()ON)t0tuoIYnS5Z8r6sWHIUbsnOM6GJIBayLkrfu41y)jpVJbhsz9C9vpxZWn0KT1mZmJfMzMzMzMzMzMzgVwuZNM7qIINdrGYDiqG(ITcAiWw)AuwQhsHiLNRMXY)5D0nD1VbKujicRGv65Qrq0rFbJc6qXRNUqpWYyx0JQChcdCN7YRPw8d4rCgbrvpiJeqzGoXKrXt3LX)(g9(okiO82hGY4hkuOea]],
  ["SpecID"] = 267,
  ["ClassID"] = 9
}
Sequences["SINGLE_FS_RETRIBUTION"] = {
  ["Macro"] = [[dud1baWAsfZubMnOMpv6MIs)sO62cQDcSx0Uv0(vPFQG(lv43emqsHgmPQgUs5GkPdl5CKIAHcSubzXurlxfpKuLNcTmc9CrMOuQPQQjlfnDkxuixvkCzsUUsSrsP2QOYMfvTDsL(OuYxjfmnsrogv9yqgnPeptHojrDAP6AkvNxOSnsjnorXWiY0ZNaprug0AqKdTrhHI(qYbnE5Hace5tmBbDes8jWZNyU60lNWQeFIb8jWtmEYQJvMvq6qJgXviRlmt8jWZNapXR71n46EDjqKyCOkzx9h3h18oXp2MI4kK1fM0iqKpbEIx3RBW196sGiX4qvYU6VpQvjjIFSnfXviRlmPrJO805sh2YvNE5ewL4tJgnIdQK1yRzzQMefLeh9I(mEjFgXme1GQ0zD5uj(0iMvzv7Yk(e)cwnTerIRlMweoeJ0vDsH7Wkngaxnv57jJylmkN6K6ctcg97seZwZLcwEAQJUQP1fMmGiOcRiIYGwdICOn6iu0hsoOXlpeqmAMx4aP0ti8wzLZoC3IXaI4McsUnbEnT7j(d1JaVKKOKeX2Q81cSrGNgnAKa]],
  ["SpecID"] = 70,
  ["ClassID"] = 2
}
Sequences["SINGLE_FS_BREWMASTER"] = {
  ["Macro"] = [[duZJbaWAvQAMufZwf3uH(LkP(Ma2Pi7LSBrTFQs)uLO)cQ(nunqvQmyQudhOoOqDyPoUkfluswkiTyqz5q6HaXtrwMcEUetKQQPIYKfOPt5Iq5QQKCzLUUq2iGARcQntvz7Qe(ie9vQKPjihdvpMkgMQgTkLMfaDsj1Pv01asNhaJdepdc3gqwCXuIlIQti9GbhycEfumxJXeddQsdIjASDqXlIPexmrHB0zd7SfXKjk2XM45IykXftjUORD6Iv2BI2SZ61n))aqEa96M)FaiHa0RB()bG8IyaaEff7yt8SmzIQZWIMhlCJoByNTiMmzYe5Pl2vGd22gu0WpGGpWHWFeHEeICT99XrODrmzIgxR93wlMiwF2SvejkoYUfhveY1o57QoDW13SyIqsyHx0YepRecoOVOXoh1N6STOxSzBINvLOud0kIQti9GbhycEfumxJXeddQiSSpCuNfeCGa3wdBEMgaQsebEDQ9RepeOVi2LGOe))H)f5F91rhtjUmzYKa]],
  ["SpecID"] = 268,
  ["ClassID"] = 10
}
Sequences["SINGLE_FS_DISCIPLINE"] = {
  ["Macro"] = [[dCZZbaWAePMjiMnfUPuYVquUTuPDsP9s2TG9JWpre(lvYVv0arenuKObdQHRkoOQ0JvvhtuhhrYcLkoSKflvTCGEis1tHwgf9CHMiGMkvnzaMoQlQqxfK4ziHRRGnIKARIuBwkSDqsFukAwuPmnrY3rsUgvCpqkJgr1xPs1jvY4qkNwPoVuQHjIlRY5aPALLx2SqCzBcz0f1OlGlK(Isil7OSMYlSv9bNr5LnlVW0f4U6nUO8If((59meLx2S8YMfs2VIC8i1Wf(hbmbm4fpgA)z3(IjGjGJKxaMurat1eeab8tTdUra7qZXncyhAoc9TFoHVFEpdIL1uEzZcj7xrMa2HMJqF7Nt47N3ZGyXcxH(HTbNUa3vVXfLxSyXcD)ks)oawr5flesfzO8aO4dGqZetkYMzA5KuPmHUWwhxalUKxOVmUahfk8DGjFckCX)kW93rYogfGRXoYcBIJPpW4EgKLIStIWwvyOmwb(aH6f49mOocTv3tiUSnHm6IA0fWfsFrjKLDuiWRrnyWYMfIp3Fbu2CkhtHEsqx2CsIzsIWXqJj4)Op7(uC1Vn2CB1rSyXsa]],
  ["SpecID"] = 256,
  ["ClassID"] = 5
}
Sequences["SINGLE_FS_FROST"] = {
  ["Macro"] = [[dCZccaGEb02urZuKmBjCtfQFjIUTaStsTx0ULQ9lK(Pq1FfHFd0qjj1GfIHlkhKQhROJr4CkPwOGAPkrlwOSCapuj5Pqltu9CPmrrQPcAYcutNYfjHRss4YeDDLYgvHTQq2SGy7Ke9rLWxjjzAcsFNKkhwvptLgnjfJxGCss0PL01iPQZRGXPunmj61KuAkiKAbruPErkfjoWehlJJqQZjK44Fca2iKAbHeh9a1pwHSrinI(0QG9gHuliKAbXKZVzrJieNeHdzsI(0QGDAuNti1cIjNFZIg5kwVFpjchYKe9Pvb70O(si1cIjNFZIg5kwVFpjchYKe9Pvb70OoucPwqm58Bw0ixX697jr4qMKOpTkyNgnIk7X2Qf2OhO(XkKncPrJgXuFZurwWVjdMyEz(vKl2fL538lrvjF16BaFJqAehlTp9BpHeHFHSBnIH3t7ayqZUSkov9EqhPUabgy8HLRC3DxH7U7U7U7U7Ey3D3j6BMAabiESbm0uxnt2iUavmsc0QGDQVc1xsC833(cLDtcOsz3QGDgMO(dqsevQxKsrIdmXXY4iKOIEiGat5kWaYE7JvlQ2adteZKtLPP(muIW4ROwuwMxwsmTmKFRWOwqJgns]],
  ["SpecID"] = 64,
  ["ClassID"] = 8
}

-----------------------------------------------------------------------------

---- Because we know the names earlier we can dynamically figure out the names.
local macroNames = {}
-- For each k ("MACRO NAME") and v (the macro string and classid) do this loop
for k,v in pairs(Sequences) do
---- Add the name to the list of macroNames
    table.insert(macroNames, k)
end

-----------------------------------------------------------------------------

local function loadSequences(event, arg)
  if arg == ModName then
---- Force overwrite of macros ignoring the players merge preference
    for k,v in pairs(Sequences) do
        local localsuccess, uncompressedVersion = GSE.DecodeMessage(v.Macro)
        GSE.ReplaceMacro(v.ClassID, k, uncompressedVersion[2])
    end


---- Tell GSE to reload the new stuff
    GSE.PerformReloadSequences()


---- Print Success Message
    GSE.Print("Hello, " .. UnitName("player") .. " " .. UnitLevel("player") .. "  - Furyswipes_5mmb Macro Set has been loaded.", ModName)
  end
end


if GSE.RegisterAddon(ModName, GetAddOnMetadata(ModName, "Version"), macroNames) then
  loadSequences("Load", ModName)
end

GSEPlugin:RegisterMessage(Statics.ReloadMessage,  loadSequences)

