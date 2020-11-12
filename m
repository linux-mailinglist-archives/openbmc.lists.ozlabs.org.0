Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFE92B07F6
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 15:58:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX4Vk09qszDqpL
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 01:58:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=P+GeFBpa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=VaHcMDXm; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX4TR5htMzDqJH
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 01:57:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1869A5C025D
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 09:57:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 09:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=HvXDB7gUTuXnFzwpTBPf05oTPkw8vmIAQUdBq6ufrXQ=; b=P+GeFBpa
 mNw4+MYKveVATS5+1PV1n5cTLML8HhwnSc2AqEPaMp9uaPGCTRFOm6z9s8YGPjqk
 wvT8PR5VbmghJjjfdzMVTxBRB7woW1XO8QpxIzP/kOKK0wd7kHrHzLY8cZ8yM4R6
 vHd9bD3wvwz7Yx3ompwrEhfZfsVsrsWeCdrCD6AZJIFb9El2+uxqOtxpAhMW8bz/
 QpUxus7O/mxb1RucYES8pn6+vW8T8YHgFL/33+EjcamnujfS8OkcubApN702i/O9
 59H1llDDc7Xphv6MFOxvx8rcSYDJg482ZI6kbz3i6MY/L7km6T8/4g0zOSpOIT73
 zFMRt3xvCKvdpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=HvXDB7gUTuXnFzwpTBPf05oTPkw8v
 mIAQUdBq6ufrXQ=; b=VaHcMDXmxqMIuMuEhQ0M7z/PkRM4r4J+pG3MGKHlxFjO9
 5wzFoihCQFnEMX45dLQE64q+l703rMF8XFjORvEVumAl8ihjSfCe4tkmyaXkT28V
 jmokpjwtJP7/kLp505+u2m/+fUimlQ/RiIosycXXqWn/98naCuLESEZ5y4LRO32X
 uzL4dKCW7Ky/eq8rvHo+EVmh9z0wV/0wlddUPJeUibXtJVhZ31y7DxFsGggGBKCj
 7N58YQxUsfCT6fdhkmJ8M6pLjqCBs7QG14jaP3ELfAXZ0pDHikVCVxQdWBnTPfFY
 4uzFdjh7xxsbLdsPbK4q06ZYsUQygr7G93A+bTlyg==
X-ME-Sender: <xms:ZU2tXzZ9F1W0S9lM79a3ISj5swDFgIJ_DXNsggw5jwIrviym4P4rWQ>
 <xme:ZU2tXybwPN-lQXtepxouJ7f_csWdh53m4OQQ2rLbxw4jh-BWV1_BlUcfjAXKpQxvf
 MWPHD6NUCegz2nmS-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfduleeikeelgfeifeegtdegffffieek
 iedvhefgffettdekfedtveeuhfevveffnecuffhomhgrihhnpeguihhstghorhgurdhggh
 dpkhgvrhhnvghlrdhorhhgpdgurhhophhlrhdrtghomhdpughishgtohhrugdrtghomhen
 ucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ZU2tX1-8HBt85mL-wc4nqBfZK4TMpRWZb6pwuzU5qD5J5zmbZnFu1Q>
 <xmx:ZU2tX5r68Krrq1gmCTshwMKhdqXx-JMTuPHBZreaiHTMMUzyK9qtjg>
 <xmx:ZU2tX-rT_BfuzAz-hIipMuBFM0FjhYGFVGRyzFT9qHSjm_y1QLsg8w>
 <xmx:Zk2tX70Y6r2kkqhontu-z_2aqYFZEawaUj3O6cxXqCmn-U__WcaRcA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4707530676F0
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 09:57:41 -0500 (EST)
Date: Thu, 12 Nov 2020 08:57:40 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: [Announce] OpenBMC Discord Community
Message-ID: <20201112145740.GB4495@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

TL;DR: I have created an OpenBMC Discord community as a modern alternative =
to
IRC.  Please join at https://discord.gg/69Km47zH98 .  I've included some FA=
Qs
below.

---

Recently Kurt sent out a survey about messaging (IRC) and the results
suggested that using IRC is an impediment to a large segment of our
community[1].  75% of responders suggested "IRC is too confusing" and 65%
responded they were unwilling to use IRC even if someone help them set it u=
p.
I was also told privately that there are some people who, due to corporate =
or
country network restrictions, are unable to access IRC.  It seems that
exclusively using IRC is putting a constraint on the collaboration of the
community and so I am willing to try something different.

I did a simple investigation of the options available to us and usages of
other similar communities and came to the conclusion that Discord would
likely be a good fit for our needs.  A few of us have been experimenting wi=
th
it and there do not seem to be any pervasive issues, so I am hereby announc=
ing
it to the community at-large.

Discord is widely used in the video gaming community and by some other open
source communities.  It has a modern Slack-like interface, but has much bet=
ter
Free-tier limits compared to similar alternatives.  Discord also has built-=
in
voice / video / screen sharing, which could be very beneficial for impromptu
hands-on problem solving and hosting "Office Hours".  Like many alternative=
s,
there is a browser, stand-alone, and mobile app options and sign-up is a
simple email-verification process.

I'm pretty excited about the possibilities for our community and look forwa=
rd
to seeing many of you join!

---

# Q&As

## What are the rules?

We've never explicitly stated the rules for IRC, but IRC was set up before =
we
had a Code of Conduct.  I have created a #rules channel in Discord and post=
ed
a link to our CoC; they should all be assumed to apply on Discord.

Discord does support private messages, but they are set up in a different w=
ay
=66rom some alternatives.  With Discord, PMs take place outside of our comm=
unity
but within Discord itself and we have no direct way to directly monitor or
police.  You can choose to block all private messages, allow all private
messages, or accept PMs from a subset of people.  This is similar to what we
have today with IRC, so I expect there to be no issues, but if anyone feels
they are on the receiving end of unwanted behavior please report by followi=
ng
the procedures outlined in the CoC.


## Can I use my existing Discord account?

Yes, but... since Discord is widely used in a less-professional setting
(Gaming), I feel it is important to point something out.

With Discord you have a Username for your account and a Nickname within the
community.  Your Nickname is displayed in chats, but it is easy to see your
Username within your profile.  If you do not everyone to know your alter-ego
as F0rtN1ghtKing007, you may want to create a separate account or change yo=
ur
Username.  (If your existing Username might be construed as a CoC violation,
please change it or create a separate account before joining.)


## Won't this split the community into two messaging systems?  What happens
with IRC?

Hopefully not, but maybe.  Just like software, sometimes someone comes along
and refactors the solution to make it better.  Sometimes the new solution
loses a few features along the way.  Sometimes the new solution doesn't pan
out and it isn't fully adopted.  I don't see this as any different; if it is
better, people will adopt it, and if not so be it.

The survey results and sentiment I have heard from some TSC members indicate
to me that IRC might be an impediment to bettering the community.  So, this=
 is
an option for us to try.

For the time being, I personally will be on both IRC and Discord.  We can
revisit in the future to decide if one should be deprecated.


## Why didn't you choose Slack?

Some companies have chosen Slack as their internal messaging solution as ha=
ve
some open source communities.  It is, overall, a good offering in many
settings.

For open source communities, the Free-tier of Slack has some limitations th=
at
I feel make it difficult to build a community around.  The biggest is a lim=
it
of 10,000 messages in the history.  After 10k messages, Slack starts deleti=
ng
older messages.  In one community I participate in less-active channels end=
 up
losing their messages in only a few days, which means that meaningful
conversations can only take place in the most active channels among the most
active users.  That community has recently moved off Slack and onto Discord
for this reason.

The paid-tiers of Slack are pretty expensive for our community.  We typical=
ly
have ~75 active participants on IRC.  Assuming we grow this engagement and =
we
count transient users, we'd probably be looking at $10,000 per year for the
lowest tier of Slack.  Not only do we not have a budget as a community but
that does not, to me, seem like a very effective use of any funds we might
have.

Discord is as good or better than Slack, as best I can tell, in every way
except one: threaded messages.  Hopefully, Discord will add that as a featu=
re
in the future.  I feel the elimination of Free-tier limits and voice/video
features of Discord will make it a better choice for us.

A reasonably objective article as a comparison between the two suggests that
Discord is better for large open source communities[2].

## Why didn't you choose <X>?

Whatever option we pick some people will be pleased and some will not.
Looking at the TSC member companies, I think each company has chosen a
different product as their internal messaging solution.  Some of them have
their own competitive offering to Slack.  I did not do an exhaustive
feature-by-feature comparison of all competitive offerings.

In terms of Open Source communities, and similar communities utilizing a fr=
ee
or low-priced option, Discord and Slack seem to have the most usage.  Many
other large open source have Discord communities as well (some official and
some unofficial).  Rust, Vue, Angular, Fedora, OpenSUSE, and Electron are a
few I recognized on a list by Discord[3].  The Python Discord community has
over 100,000 members.

There are some fully open source alternatives to Discord.  The two most
popular are Riot.IM and Mattermost.  Mattermost would require us to host the
service, similar to what we do for Gerrit.  We have an existing Riot.IM bri=
dge
to IRC but we have had reliability issues with it.

If something better comes along and/or Discord presents problems for us, I
suspect the community will be nimble enough to move along to the next great
thing.


## Does this mean _you_ control the Discord community?

I originally created the existing IRC set up and have given some of the oth=
er
long-time members administration on it.  The permissions I set up on Discord
are identical and two other people currently have administrator-level
permissions there as well.  If the TSC decides on a particular governance of
our communities, such as IRC or Discord, I'll happily transfer ownership as
requested.  Discord ownership can be transferred to another account very
easily.

As stated earlier, no one with admin-level access has the ability to read
private messages either on IRC or Discord.

---

1. https://lore.kernel.org/openbmc/bb565e15-f5a7-b0b2-d987-41b1a5e9acbb@gma=
il.com/
2. https://droplr.com/how-to/productivity-tools/slack-vs-discord/
3. https://discord.com/open-source

--=20
Patrick Williams

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+tTWEACgkQqwNHzC0A
wRnXJw/8DJ/5VqmmuEfwEOKcAVHgenCOr9qGBZne4+H3FsDYH82Vymdlt9gJRYSV
CygnF8fA8bd3YGDTUoL5Vj/+EWB6kXCnnfqKb4pXuigTtijQpi3M+nGkrz4NDxTG
v6YgbHvdsI1GaifC2IPThyKFprJHUldVY11V/TrxYOAu3MI4dzQfZsb3pg6NqB+z
KKWn3Am04VOapUZeOcRUzwr6v6kn3lYWFFijYDt5kEp9uIWwOQDhlw/w3enGLWvn
8hQ8Ym1FwcQH2/wD8QQfvVWgrWqV4kI5hjsSLis6/Tm8QI61SCDzkM8MsGcY6g1j
5Mb/5KqzhdpGgwTLPtt5+buojm76Zpdx6nMVuSQ3wSaBCMG/f1KQu8GLM/jBg2V7
zVJfwFsLNY8rednuthCbw3QVowW6lmpuaoHUV8jZYWgDtTZA8RuT6IJJmGaNn4f4
0+jnQeO8NJoljWdbtJnj+J37PrvTwUmT5Z9vK3aKnN9AhwK4PaO5PNLdTHxvYqqc
79kyRwaEm+p8BTbBkBpUBBy3yGpfMzM6EU5Nc4/hDxWWWF0Bw2mUUgbSkBb+Czmk
888GhXruKbSJXavrsbgr+HGeTwvHGU+hWgOoddudyA3NCwIYYrbi5QzL24XirU4I
zT0KG/Yu0BmUN602GTsPs3S76qIqu/O61yyDVeorhz6tNUbgEKo=
=7jxU
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
