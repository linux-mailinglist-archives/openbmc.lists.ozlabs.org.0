Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA314F66F5
	for <lists+openbmc@lfdr.de>; Wed,  6 Apr 2022 19:29:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYWj328Kkz2ymf
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 03:29:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=nUfZ/8SM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kEuxPGoo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=nUfZ/8SM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kEuxPGoo; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYWhX5VC5z2yPR
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2022 03:28:59 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 208A73202113;
 Wed,  6 Apr 2022 13:28:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 06 Apr 2022 13:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=AGP9WaqFcZJ1x3DEoORjuXV7CRO4zACAzxykfj
 Xze34=; b=nUfZ/8SMxcUf361mskgwONe8DnxHm8m4NBeZjD03HQGCYZUfvqm3eD
 N37hw49WQaIJ3ey/lVdm9+xTVTHGTaHwHQ8u+VFdDJJZI7fNi6qv8/LSs1F7cHjk
 LQ6XZ8NTpeDhzdSQZz0rnK9fomnBfCnfBLqdOku5poa62ZmkvrJtk6ebboBPD1VX
 +5PzsVOXBbL0F9GcWx+VRRFmXFWZRtsOnkJARE6usli7VB4ij9F6mFrYMVZfTO1y
 Fet72jOirwVr7cF9WZKVw5RqKEgpTZ11j893rUvwo5PFZVVxIUCxj69Rxs+tlWOP
 ouPGZvmg6CPL0TXRolzfeEqQggTTfsjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AGP9WaqFcZJ1x3DEo
 ORjuXV7CRO4zACAzxykfjXze34=; b=kEuxPGooNf4nxBzIaOaz+f9YWWkAQ0rf1
 vPg5XI+84nmP2UhVmdPhmakx40+ZC6da6elVC4+sEROY/RYKVF9CcXzWCdj4oqnd
 jgybSBKO/6iOvtQrLouDka09xeNSkInbkv+FcQtzdcraTicGZQBXC0cUNkK6oTvd
 P9RBYma9qPDBPHSJhtYv3uuhoixz+jJeyHRy6sa2zCPSmasDC0SH1Dq2SCiUPYPl
 BLlYZTtO7Ens2k64wSeI0jRZtml55YclRi7DuDSkqh5Ppq5sag3THJgBzlYoF0xd
 pqEPjgIXp9N8eoXrcl+vd3JNAlODChkMplCNzw/qN0qS10NXZiB9A==
X-ME-Sender: <xms:1s1NYquh6X9N6_JJq_IeXZ_yEeuve5QNuHsVTPsZpjDti5EMEejq0g>
 <xme:1s1NYveTU_njaYEdFk93qbE8FQKz6wgMqbfHXCj4fpQqgB_6cimPfcfDrx4krB6-1
 10TMAk-qZDEiYIYpRE>
X-ME-Received: <xmr:1s1NYlxCmtBQl3uerau-4leoz5doS9XfoCR6YCVTmi6SJCJmh0U-_CaveWfy95QQdF5_hvDSihIBve5-ATAHBzBWglm6CanNuj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddugedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeugeelheefueelgfefvdduheel
 heehgeeuvefhiedvheettdeivdevfefhieekjeenucffohhmrghinhepohhpvghnfihrth
 drohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:1s1NYlNVAKPmDJ-jWP8OIPgha4kPoz7uVcfZs7fn9fRNrWn2-fbp3g>
 <xmx:1s1NYq-qlJLuYllIb9A00jqNLXCE-Ixx7xaV3B0A9FtMFU0VsTFBOw>
 <xmx:1s1NYtWC4JbiZIx0Be7fgTKeddNSDuM89GhwnClCm4vNaKOuHeKKOg>
 <xmx:1s1NYsK-QlSvcchDqS6L_hGnDXP0svEt2Q6fl2NqWDn7XDSTx3ROQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 13:28:53 -0400 (EDT)
Date: Wed, 6 Apr 2022 12:28:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
Message-ID: <Yk3N1EG21r+NRQa5@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wjgM+jvwEkziTqaI"
Content-Disposition: inline
In-Reply-To: <CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wjgM+jvwEkziTqaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'll likely respond to the original post with more thoughts later as
well...

On Wed, Apr 06, 2022 at 08:54:28AM -0700, Ed Tanous wrote:
> On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
=20
> >
> > With the amount of custom userspace we've always kinda sat in-between.
> > I'd like to see libraries and applications that have use cases outside
> > of OpenBMC be accessible to people with those external use cases,
> > without being burdened by understanding the rest of the OpenBMC context.
> > I have a concern that by integrating things in the way you're proposing
> > it will lead to more inertia there (e.g. for implementations of
> > standards MCTP or PLDM (libmctp and libpldm)).
>=20
>=20
> I had assumed that libmctp and libpldm fell into the "intended to be
> used outside the project" category and would retain their own
> repositories, given that they publish interfaces that are not OpenBMC
> specific, but lots of things within the project are openbmc-specific,
> including the daemons that attach both of those libraries to dbus.
> The only real difference here is that it makes the difference
> explicit.

It wasn't long ago that the TOF discussed some of these libraries w.r.t.
"intended to be used outside the project" and we really had trouble
determining clear language on what classified as this and what did not.
Actually, neither of these libraries were mentioned, but it was a recipe
contribution by someone pointing at a non-openbmc github repository.  We
couldn't really come up with a clear definition but we settled on
"intended to be used outside the project" recipes that also weren't in
the openbmc org needed to be submitted upstream to Yocto.

Are we going to be able to come up with a clear definition for this,
which is actually for code that is _within_ our org?  libpldm, for
instance, isn't even in a separate repository but covered as part of the
bigger PLDM with some special build flags for "library only".

> >
> > On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
> > > The OpenBMC development process as it stands is difficult for people
> > > new to the project to understand, which severely limits our ability to
> > > onboard new maintainers, developers, and groups which would otherwise
> > > contribute major features to upstream, but don't have the technical
> > > expertise to do so.  This initiative, much like others before it[1] is
> > > attempting to reduce the toil and OpenBMC-specific processes of
> > > passing changes amongst the community, and move things to being more
> > > like other projects that have largely solved this problem already.
> >
> > Can you be more specific about which projects here? Do you have links
> > to examples?
>=20
> Linux is the primary example I think of, which hosts libraries within
> it (libbpf, ect) that are meant to be used elsewhere.  u-root, u-bmc
> are other examples of firmware that put all of their application
> specific code in a single repository.  As a counter example, openwrt
> sticks with multiple repositories, but seems to have significantly
> fewer repositories in total than we do, despite being a much older
> project.
>=20
> As a side note, one thing I find interesting is that they host staging
> branches for contributors/maintainers on their main project page.
> That's a different model than I've seen elsewhere.  Unrelated to this
> dicussion, but interesting nonetheless.
> https://git.openwrt.org/

I was going to point to Android and OpenStack as two large open source
projects, which also use Gerrit, and seem to have no trouble with the
micro-repo model.

> > > To that end, I'd like to propose a change to the way we structure our
> > > repositories within the project: specifically, putting (almost) all of
> > > the Linux Foundation OpenBMC owned code into a single repo that we can
> > > version as a single entity, rather than spreading out amongst many
> > > repos.  In practice, this would have some significant advantages:
> > >
> > > - The tree would be easily shareable amongst the various people
> > > working on OpenBMC, without having to rely on a single-source Gerrit
> > > instance.  Git is designed to be distributed, but if our recipe files
> > > point at other repositories, it largely defeats a lot of this
> > > capability.  Today, if you want to share a tree that has a change in
> > > it, you have to fork the main tree, then fork every single subproject
> > > you've made modifications to, then update the main tree to point to
> > > your forks.
> >
> > This isn't true, as you can add patches in the OpenBMC tree.
>=20
> As most people that have stacked patches can attest to, managing patch
> files in a meta layer over time is very difficult (unless you meant
> something else).  Yes, I should not have said "have to", but a number
> of the forks that I've seen have ended up resorting to that. Example:
> (https://github.com/opencomputeproject/HWMgmt-MegaRAC-OpenEdition/tree/ma=
ster/openbmc_modules)

Why is managing patch files difficult?  Is it lack of documentation?

Upstream Yocto deals with patch files all the time.  The Facebook BMC
tree has machines in production that are still on Rocko-based Yocto
distributions and we have plenty of patch files we support there.

I wouldn't be surprised if Yocto doesn't already have tools to simplify
"git-format-patch" -> "package.bbappend" workflow, but if they don't I
could probably write something.

For what it is worth, I'm currently doing a change for sdbusplus that
requires fixes across tens of repositories (as I wrote about recently).
I pretty quickly hacked up this shell function in order to automatically
update my OpenBMC tree with commits from another repo that I've pushed
to Gerrit already.

https://github.com/williamspatrick/dotfiles/commit/df180ac2b74f2b7fcb6ae913=
02f0211bc49cb2e9

I don't see using 'git-format-patch' to create the patchfile instead as
too much additional effort.

> > CI prevents these from being submitted, as it should, but there's nothi=
ng to
> > stop anyone using the `devtool modify ...` / `devtool finish ...` and
> > committing the result as a workflow to exchange state (I do this)?
> >
> > Is the issue instead with devtool? Is it bad? Is the learning curve too=
 steep?
> > It is at least the Yocto workflow.
>=20
> devtool provides just one form of friction;  There are also a number
> of cases where devtool modify and devtool finish fail in non obvious
> ways (usually due to some not-quite-optimal yocto handling in a meta
> layer, or patches being distributed across meta layers).  The biggest
> key is that it's yet another tool that seasoned firmware developers
> have to learn to jump into our codebase.  Each tool adds some friction
> compared to if it just didn't exist.  It also adds the "which recipe
> do I need to devtool to modify the webui?" type trouble that people
> have talked about many times.

Do we have pointers to when devtool fails?  The only time I've seen it
are for recipes that aren't in the rootfs image: kernel and u-boot and
they've all been due to bugs in the image.bbclass on our part.  There
was actually a fix to one of the u-boot recipes very recently.

I personally don't use devtool all that much, but when I do I want it to
point at the central "workspace" of all the openbmc repos I already have
so I can get it to pick up code I already have in progress there.  Do we
need better documentation around those workflows?

(At one point there was a statement made that we didn't want tooling
written to assist with one workflow or another.  This was somewhat made
in reference to the `setup` script, but I think it had extensions that
made it that any workflow-related tools people have are hosted in their
own personal spaces and not talked about.  Maybe we need to change this
mentality.)

> > > This gets very onerous over time, especially for simple
> > > commits.  Having maintained several different companies forks
> > > personally, and spoken to many others having problems with the same,
> > > adding major features are difficult to test and rebase because of
> > > this.  Moving the code to a single tree makes a lot of the toil of
> > > tagging and modifying local trees a lot more manageable, as a series
> > > of well-documented git commands (generally git rebase[2]).  It also
> > > increases the likelihood that someone pulls down the fork to test it
> > > if it's highly likely that they can apply it to their own tree in a
> > > single command.
> >
> > Again, this is moot if the patches are applied in-tree.
>=20
> Meta layer patch files in my experience tend to not layer well, and
> require a good amount of maintenance.  They also have problems where
> they're not versioned against a git base, so there's no guarantees of
> where in the history the patches were forked from, and whether they
> apply to your tree, or if they fail, what patches likely caused them
> to fail.  Admittedly, tracking them in git isn't perfect either, but
> at least it publishes "this is the source base these were based on" to
> give some indication.  In practice, the public forks I've seen just
> embed the custom meta layer within an openbmc tree to solve this
> problem.
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods
> https://github.com/HewlettPackard/openbmc

I could entirely be misunderstand what problem you're pointing out here.
Why would it matter "where in this history the patches were forked
=66rom"?  Aren't they forked from whatever the SRCREV in the recipe says?
It is on the maintainer of the meta-layer to ensure they apply to that
revision.

Having all the code in one repo doesn't give you any more visibility as
to where the code was "forked from".  It ends up being exactly the same
as a patch file except that the patch file has been "applied" already to
the code.  You still don't have visibility to the underlying upstream
commit number.  And, I would suspect it is going to be even worse
because you're going to end up with back and forth merge commits trying
to pick up the latest upstream code in these forks.  You're not going to
have a nice git-submodule number indicating openbmc/openbmc was from
here.

In my opinion, this is a problem with how people maintaining these trees
are doing it and not a problem with how our code is organized.  In the
facebook/openbmc tree we use git-submodules internally to hold the
upstream trees.  For our github-side we have a script that updates them,
but there isn't a strong reason we couldn't do the same git-submodule
layout there (I think it is due to a deficiency in the way our
internal<=3D>external mirror tool works).

    https://github.com/facebook/openbmc/blob/helium/yocto_repos.sh

If people are not treating the openbmc/openbmc tree as an unchanged
blob, that is their fault and not ours.  Having all the source imported
in one repo doesn't really solve this either and in fact is likely to
make it worse because you now _can't_ treat openbmc/openbmc as an
unchanged blob because you're going to have to patch-in-tree any changes
to code you want to make.

> I also think that having
> one or a smaller number of reviews would concentrate a lot of the
> discussion when we make treewide changes.  (OWNERS files, ect)  When
> they get distributed among many reviews, in my experience it tends to
> dilute the discussion a bit.

I would argue this is actually a bad thing.  We're going to more likely
end up with large cross-repository commits that are harder to review,
require more people to review them (a larger set of OWNERS), and are
harder to revert.

If there is larger discussion to be had that should probably happen on
the mailing list anyhow.

> > > - It would give an opportunity for individuals and companies to "own"
> > > well-supported public forks (ie Redhat) of the codebase, which would
> > > increase participation in the project overall.  This already happens
> > > quite a bit, but in practice, the forks that do it squash history,
> > > making it nearly impossible to get their changes upstreamed from an
> > > outside entity.
> >
> > Not sure this is something we want to encourage, even if it happens in
> > practice.
>=20
> I think when done properly, it would be a huge help to the project.
> My main point is that this isn't something we can stop (companies and
> individuals have and will continue to do it anyway), so would we
> rather make their changes easier to ingest back to upstream?

In my experience the difficulties with upstreaming are not related to
logistics of sending patches to Gerrit.  They are related to the effort
involved with getting other people in the community bought into what you're
trying to do.  Having all the code in one place alleviates 1% of the
upstreaming effort while doing nothing for the remaining 99%.

> > > - It would centralize the bug databases.  Today, bugs filed against
> > > sub projects tend to not get answered.
> >
> > Do you have some numbers handy?
>=20
> I do not.  I can say that anecdotally the "you filed this bug against
> the wrong project" happens quite often in the repositories I maintain,
> and the lack of reasonable cross project "transfer the bug" semantics
> makes this difficult (yes, admins can transfer bugs cross project, but
> I'm pretty sure we don't want to call on core maintainers every time
> we want to move things around.)  It would be quite helpful to the
> project to have less than N bug trackers (might not necessarily be
> one) to increase the odds that someone searches for and finds their
> bug before filing a duplicate.

"bugs filed against a sub project tend to not get answered" and
"bugs are filed against the wrong project" are different problems;
you've shifted the discussion.

The first is a problem against our maintainers.  Having all the issues
in one repository doesn't improve that situation, but it actually makes
it worse because you're going to shift that burden on a few individuals
who pay attention to openbmc/openbmc issues while doing nothing to fix
the certain-maintainers-don't-respond issue.

> > > Having all the bugs in
> > > openbmc/openbmc would help in the future to avoid duplicating bugs
> > > across projects.
> >
> > Has this actually been a problem?
>=20
> Duplication?  It happens from time to time.  Not being able to search
> for a bug across the project happens a lot, and in our current model,
> requires the user to know which component they are filing the bug
> against.

Why can't people search bugs or code at an org-level?  I do it all the time.

--=20
Patrick Williams

--wjgM+jvwEkziTqaI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJNzdMACgkQqwNHzC0A
wRmijBAAhxaZWqAM/N7I0lOxY43lMz44Y2IfqiWrUsf0VHshkC+nhIiDh+dDWFtc
dl/c6OYlHClSiUh08FBV0r1/ptvDOZKY8hdoUdNdKGifUvP3g6LYVJp2TGnFQBF6
+y21PdjYZf6fP05N8+MZXSbO56qfPpWD5+l5to3FRT/k7yL8ya41Hwz4A5v8maeW
ZT634CErwbPT27IHzba9N1AUTcqYbwtSUGLclVJ504DJMISJOuZdTSco+JMcR8Rq
G64DTcFTWEcb1klkOGzWzlYFTBU68ldaLdoTwV8+dO7hwNvUprPfE00DOvDp9wu2
PcHlOWPMOT64awwULa6Ik0ES5UwMHtBr694A3GArp2mtUv2Oc3KgzlhsEGnraXfw
qPftx8KJk4yg6W0C1bommxraLcB0gOF4ax1MkpzXOxjTyjXmpWV5Ir7mSn5YwSuR
1m4k+8snKbympRyeDX8Shi1w2U/D4e8bJ3K2EdGdOOPsZ3LddC87s8pU3ZrOMGvQ
Z2Z5DdB7yVWOdtIHvr5XbEvZAFEURY/qQk+H6QwJZYJPhYPrgx1IVthxn0k40n4d
jn3ni4QlSHdiMVOI247PytoFsABsz6i+qrfRo9GuOjyZuu8CMG9bMyxpSOcO35P6
doguNFS5aW9Tf/fmPa/Ugf6m8DNRZdqscVc3+KbWkYeIt91eEWk=
=gKer
-----END PGP SIGNATURE-----

--wjgM+jvwEkziTqaI--
