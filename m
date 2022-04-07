Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4614F738A
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 05:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYmy86R3Jz3bVH
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 13:26:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=eM1DGaAy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fkFgLSOS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=eM1DGaAy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=fkFgLSOS; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYmxf1BtQz2xY0
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2022 13:26:12 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1879B3201F80;
 Wed,  6 Apr 2022 23:26:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 06 Apr 2022 23:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=G6WhBRdBicra340mYYSCVh68lZ8VfonFbwOmq0
 Ko6As=; b=eM1DGaAy5ijUHd4BBVQzi/xZ4fNCDtuAoFjV+isoyCjbsCJMi+o37T
 fcZpiUgRm7nXLhY41GFaUJyCRhbz/GVBmdWoUnl92W5Hrf9Ibrc1/yrkSsxstPJS
 G2zRFwZK5pTjEQfucuOV/yISfRwMohhnNasuLMAnC0WSUObFvIdlKvQJISnSkfwO
 1y1msUKJcFlBroTYC+/xnGVfh76xlIkJ3UhoeLHDwMAbSOR3ullOos2MtPasDOTR
 R7P1bu/QasIwQFkn2noKuwZJGV8/VIzgXJwIXF3LA3VtL1dl/PaLq0AUvbR3ilcm
 V0lFROCpQJOR0H999fui2ap0yts68XSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G6WhBRdBicra340mY
 YSCVh68lZ8VfonFbwOmq0Ko6As=; b=fkFgLSOSubvW7qeCgJZG869JeV74s/mRZ
 7b8qqvzThjNHLJTinrOkFOZxtCvg5fgwgKPgK8LHMp7FB7etcXUF4ttdr2jfX0i6
 cQcqS735JM+BcJG615TnAmHkHBmHtU0DxC+SI/0ZHKZ33mtVE2/p6+5GVqIEzO7t
 XJx8osPaQ+mV5UPdztdXvv4j7t62m+9Izq+PfQtA0OS4Dr/tzwZ2fnAFoL5iuyoE
 z9c1CJkvD5XHx46gvnXqywASpv0PfWdolKHm7AC9iWiGLtcbWjUIey7KkJ/tUGnu
 4rJJjphY2bAqTwEkm/ly+KU+4g8B7zSvi0wJzF5Xr0u2LiS4pn1Wg==
X-ME-Sender: <xms:z1lOYtZCQ0ndeCI518-A5MmUxtb3KjZencu_a0dxhfxOIx-LutrxFA>
 <xme:z1lOYkbV7Rh_uFWCeiO0fqU5U_1BPCkr7HiR2NiX-pDo2Gq6IoHoyugTMTmT6e76M
 fVanj-0g4OxNexAUsI>
X-ME-Received: <xmr:z1lOYv8KyZJL78o93rkH7uBmGzn5Yxu8vB8jQvZ-oHEvEv3fv3FZGQbZZlPNtmk4iZUO_LugnF7ugFH-_XZuJHtJ4zBLeGxdAmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejjedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:z1lOYro0cqkiaePqmH-y4DrId5Q-5mM7HCEyxYQCMUBmm6r_iPhiLA>
 <xmx:z1lOYopTu-QrlWVXSO1qS10WpOBIp4GOhgXJthMPd78jP2NpVZuVpA>
 <xmx:z1lOYhQq7-AAL6ZtUpz8mF7xoAiFMt7-AiC3cfqvFfF1Q5myVu7C2g>
 <xmx:z1lOYjU-g_A7NQS2-kjsDSAx_HIH6_mAlK1NaKZlH7R7OsYgU9ZwOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 23:26:07 -0400 (EDT)
Date: Wed, 6 Apr 2022 22:26:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
Message-ID: <Yk5ZzRnMdVwkJvc0@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com>
 <Yk3N1EG21r+NRQa5@heinlein.stwcx.org.github.beta.tailscale.net>
 <CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H3wrZtOVdPlthY1w"
Content-Disposition: inline
In-Reply-To: <CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ed Tanous <edtanous@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--H3wrZtOVdPlthY1w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 01:36:26PM -0700, Benjamin Fair wrote:
> On Wed, 6 Apr 2022 at 10:29, Patrick Williams <patrick@stwcx.xyz> wrote:

> > I was going to point to Android and OpenStack as two large open source
> > projects, which also use Gerrit, and seem to have no trouble with the
> > micro-repo model.
>=20
> When I contributed to Android in the past, their process was even more
> frustrating and difficult to figure out than ours, requiring lots of
> purpose-built infrastructure and tools (treehugger bot, repo tool,
> etc.). I don't think their model is a good direction to move the
> project towards.

I'm not versed in their process enough to know if it is "good" or "bad".
All I'm saying is that they seem to be a pretty successful project while
not going to a monorepo, so maybe there is something we can learn from
them?

> > Why is managing patch files difficult?  Is it lack of documentation?
>=20
> Managing a few patch files for a single machine in a single meta-layer
> doesn't have much overhead, but the complexity scales superlinearly
> with more machines, distro features that may be on or off, other
> meta-layers trying to add patches, etc. The usual "solution" to this
> that I see is just avoiding rebasing to newer versions of OpenBMC,
> which makes upstreaming patches even more difficult in a vicious
> cycle.

I'm still missing why it is considered hard.  I say this as someone who
helps maintain this fork:

    https://github.com/facebook/openbmc/tree/helium/meta-facebook/meta-back=
ports

We have 29 machines across 4 different distro versions.  We try very
hard to avoid making per-machine patches and when we do we try to
enumerate them based on a system feature and not a machine type (ie.
multihost and not Yv2).

How does having code in a monorepo help unless you're making
per-machine branches?  If you aren't doing per-machine branches you then
have code changes that affect all other machines and they must all be
stuck on the same distro version?  If you're making per-machine branches,
then I don't see how the "complexity scales superlinearly" because it
literally scales linearly per machine.

> > Upstream Yocto deals with patch files all the time.  The Facebook BMC
> > tree has machines in production that are still on Rocko-based Yocto
> > distributions and we have plenty of patch files we support there.
>=20
> Supporting patches for older versions of upstream isn't as difficult,
> but the project would benefit more if we make it easier for downstream
> users to stay as close to upstream as possible. This would make them
> more likely to contribute these patches back upstream to us too.

I agree it is slightly more work to rebase your patches at the same time
you update your distro, but only slightly so.  If the code is in a
monorepo, your "patch" is going to fail the rebase and you need to fix
it up.  If the code is a patch-file it is going to fail the build and
you need to fix it up.  It is a relatively straight-forward script to take
all your `SRC_URI +=3D "foo.patch"` bbappend files, apply them into the
current checkout at `SRCREV`, rebase to the new `SRCREV`, and then
`git-format-patch` to regenerate "foo.patch".  The rebase conflicts are
exactly the same as a monorepo too.

(I agree this is work for someone to do if it is interesting to them and
I'm not trying to diminish that.  I just don't think we should rip up
our whole development process to satisfy this use-case which _could_ be
solved in a shell script).

> > I wouldn't be surprised if Yocto doesn't already have tools to simplify
> > "git-format-patch" -> "package.bbappend" workflow, but if they don't I
> > could probably write something.
>=20
> "devtool modify" -> "devtool finish" does this workflow, but I've seen
> it fail in subtle, difficult to debug ways many times before (although
> to be fair, it has gotten more reliable in the last year or so).

Right.  I honestly don't use devtool tons partially because I work on
multiple machines and purposefully have separate build directories for
each.  devtool keeps the state in the build directory, so I can't apply
a chain across N machines and build them all easily.  Patch files or
`nobranch=3D1` works better for my typical workflow and I like being able
to `git status` to see all my hacks for testing.

> > I personally don't use devtool all that much, but when I do I want it to
> > point at the central "workspace" of all the openbmc repos I already have
> > so I can get it to pick up code I already have in progress there.  Do we
> > need better documentation around those workflows?
>=20
> That's the usual way I use devtool too, but note that using it this
> way prevents "devtool finish" from working properly.

Interesting.  Is this something we should work upstream to fix?

> Also cloning all the OpenBMC repos in a centralized workspace and then
> pointing the OpenBMC recipes at them is the exact workflow that Ed is
> proposing, just in an automated fashion and without the toil of having
> to sync and generate patch files from these repos individually.

Fair, but again, why rip up our entire development process for what is 3
lines in a shell alias?

    https://github.com/williamspatrick/dotfiles/blob/master/env/30_linux/lf=
openbmc.zsh#L26

> > I could entirely be misunderstand what problem you're pointing out here.
> > Why would it matter "where in this history the patches were forked
> > from"?  Aren't they forked from whatever the SRCREV in the recipe says?
> > It is on the maintainer of the meta-layer to ensure they apply to that
> > revision.
>=20
> .bbappend files don't list their target SRCREV for the patch files
> (they can of course, but this is well known to be an anti-pattern
> which is extremely difficult to maintain)

Agreed, but the .bb file does.  You have the original .bb file
somewhere, right?  And then you rebase against openbmc and you get
new ones.  The SRCREV in ORIG_HEAD is what the patches were based on.

> > Having all the code in one repo doesn't give you any more visibility as
> > to where the code was "forked from".  It ends up being exactly the same
> > as a patch file except that the patch file has been "applied" already to
> > the code.  You still don't have visibility to the underlying upstream
> > commit number.  And, I would suspect it is going to be even worse
> > because you're going to end up with back and forth merge commits trying
> > to pick up the latest upstream code in these forks.  You're not going to
> > have a nice git-submodule number indicating openbmc/openbmc was from
> > here.
>=20
> "git merge-base" shows this information trivially
>=20
> In my experience, forks usually use "rebase" rather than "merge", so
> they wouldn't have lots of extraneous merge commits.

I've never seen a fork use `rebase`.  Can you point to one that does?

People don't usually do that with their fork because:

    - they have hundreds of commits which went through a review in their
      fork's review system

    - doing a rebase of a branch is effectively the same as a history
      re-write

    - after the rebase they've "fixed" any number of these commits due
      to conflicts and have no way to send them back through review.

Every fork I've ran across either squashes upstream content into a
single commit or does a merge commit of upstream with all their conflict
resolution done in the squash or merge commit itself.

> > In my opinion, this is a problem with how people maintaining these trees
> > are doing it and not a problem with how our code is organized.  In the
> > facebook/openbmc tree we use git-submodules internally to hold the
> > upstream trees.  For our github-side we have a script that updates them,
> > but there isn't a strong reason we couldn't do the same git-submodule
> > layout there (I think it is due to a deficiency in the way our
> > internal<=3D>external mirror tool works).
> >
> >     https://github.com/facebook/openbmc/blob/helium/yocto_repos.sh
> >
> > If people are not treating the openbmc/openbmc tree as an unchanged
> > blob, that is their fault and not ours.  Having all the source imported
> > in one repo doesn't really solve this either and in fact is likely to
> > make it worse because you now _can't_ treat openbmc/openbmc as an
> > unchanged blob because you're going to have to patch-in-tree any changes
> > to code you want to make.
>=20
> I don't quite follow the exact workflow you're using here, but it
> seems like a single "git rebase" command could handle this in a
> simpler way, and be more likely to automatically resolve merge
> conflicts.

As I mentioned above, we have 29 machines targeting 4 distro versions all
in a single branch.  When we make a fix to the common bits they go into
all 29 machines.  When we make a fix for one distro version it affects
all the machines targeting that version.  When we add a new distro version,
we test the existing machines on it and flip a switch to move them to the
new one individually.

    https://github.com/facebook/openbmc/blob/helium/openbmc-init-build-env#=
L16

> > In my experience the difficulties with upstreaming are not related to
> > logistics of sending patches to Gerrit.  They are related to the effort
> > involved with getting other people in the community bought into what yo=
u're
> > trying to do.  Having all the code in one place alleviates 1% of the
> > upstreaming effort while doing nothing for the remaining 99%.
>=20
> I strongly disagree about this apportionment of effort. For people
> like us that are familiar with open source processes and procedures,
> the logistics of sending patches seems minimal and we focus instead on
> the challenges of forming consensus. But for people who have never
> participated in an open source community before, just figuring out
> where to push code for review, how exactly to use Gerrit, etc. are
> significant blockers. Anything we can do to reduce this friction would
> make it more likely that new people will contribute.

I was certainly putting a distinction between MyFirstCommit and "I'm
trying to get feature X upstreamed" and my 99/1% was for the latter.

Don't we have a few MyFirstCommit tutorials already?  There are very few
people contributing that aren't covered by a CCLA, which means in
addition to the public tutorials we have they probably have an internal
one at their company and an on-boarding buddy that can mentor them
through MyFirstCommit. =20

Even with the documentation we have people still make PRs in Github and
try to send us code without any intention of signing a CLA.  With the
CLA requirement, I don't see how it is likely for us to ever get
"drive-by" commits.

Again, changing our whole process to solve MyFirstCommit is overkill.

Going back to the title of this email chain it was "... to make
upstreaming easier".  I completely agree that the micro-repo model makes
_development_ harder as you have multiple repos in play compared to the
mono-repo model.  In order to develop your code you had to work this
out.  Once we've set that as a baseline, upstreaming is simply "sending
my code to Gerrit and dealing with the code review fallout".  I don't
see how running `scp openbmc.gerrit:hooks/commit-msg $(git rev-parse \
--show-toplevel)/.git/hooks/` on one or more repos is so much more work.
As far as upstreaming goes this is nearly the only difference between the
two models (and communicating your co-reqs requirements to the
maintainers is probably the only other difference).  I still stand by my
roughly 99/1% worth of effort breakdown.

> > "bugs filed against a sub project tend to not get answered" and
> > "bugs are filed against the wrong project" are different problems;
> > you've shifted the discussion.
> >
> > The first is a problem against our maintainers.  Having all the issues
> > in one repository doesn't improve that situation, but it actually makes
> > it worse because you're going to shift that burden on a few individuals
> > who pay attention to openbmc/openbmc issues while doing nothing to fix
> > the certain-maintainers-don't-respond issue.
>=20
> As a maintainer or interested community member, it's much easier to
> look through the open issues on a single repo than when distributed
> across many other less-active repos.
>=20
> It's also not always clear exactly which repo is at fault for a bug,
> and limiting the discussion to people looking at a particular repo may
> miss out on the relevant knowledge of people looking at other repos
> instead.

Understood.  We could turn off issues on most/all code repos if that is
really a hangup.  I'd have no problem with that*.

(*) There are probably a few repos we might NOT want to turn off issues
    on because they're pretty noisy and leverage issues a lot, or
    because they are the "used outside OpenBMC" repos, but that is an
    easy discussion to have.

--=20
Patrick Williams

--H3wrZtOVdPlthY1w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJOWcsACgkQqwNHzC0A
wRlpuw/+Km7XYY5h+jnNbo9Xb1V6ynU91AdWaWGLQX5F4gbet/9ua7zq2uXq6uk9
dqDskYg7fqiLT5uQ6uBkvyorEceczDiv4AfmFUhJW0Vuzfc5N+nnnyyRf/JglhMF
pOpFZznNxYwGbTLSQEEwmvKkT9IJ192Y2nTN3PP1Wk69RNExmoLZa+MTJLZqaUZT
vXLjBBuAHxqDZ6SroPNH3rjofSaO04q7Z/yYWawFy7DosSqkjHJ8VqJ/xNxtMEEP
NXeT+APhB9fZJmF4e7Zt5IDP4/1smnUfpDE4xsaNpv6GQ22h/ZOmXLk6WF3MRZdF
sFKzAMR8jZ0fyCKt6uRi2p6fU5WkKevBVq8gp5wp79Mw1mc5bSA+yHpRsQjPwVGc
//CVbqN5I1Abv8Sxr46mtDLWW8kYIRvWvMkE4EVDaocikPWw2Tfrxd7dU3UrDr0r
KVcPYDkFS6jLTovPCT09sKpnCXLT1zEaD6vdIfAUQGg/zLwUoulHm94apYYWArVY
PrqPiJejH/vBgGv1buLbjeqIZvrAyBKFSiUUzSrWVNuMQojTlc6ZzjW2DqzlQtUc
DFjLSgdfTgj9WEo6HnHMXkZLIGrVL5NlOaz9U9h4dUcfwwqcbIh8rXDXig0S6tr8
qz//PuO0yMTmUtgmF2XK6GGvp1qAQ+Eskg+VkjBTEGh3RD0FPww=
=3SRZ
-----END PGP SIGNATURE-----

--H3wrZtOVdPlthY1w--
