Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B63704F9F40
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 23:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZs5P5PTTz3bVH
	for <lists+openbmc@lfdr.de>; Sat,  9 Apr 2022 07:36:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=lByp/FMZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eswgH//v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=lByp/FMZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=eswgH//v; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZs4w0PCmz2xgX
 for <openbmc@lists.ozlabs.org>; Sat,  9 Apr 2022 07:36:14 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 85ECD5C00C6;
 Fri,  8 Apr 2022 17:36:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Apr 2022 17:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Uz6cud4OslTGzKhSQV9jy4qbM1JS8MB073lVmA
 8G+08=; b=lByp/FMZ0d2gm+BJeJoJo2rAhnvpo5hWjhgr090MjxpzEQYGIMZxSz
 cVql+SM56fNntCnkCoD7aH5uvYv87/TXoEsD9xoP3XHRwkerFr/faGWLohmYQPmh
 ulzDYYuXt9WuGzNsJhFwa6wDcOqFWj8U7G2WvBN8JFN2t/OvotEEMLi9P9wOBgPL
 K69RuaS8o77ijneLgnsIEplM87cVwCIelbR9lo/WtLuvNfxzDV25l6CuyiaNMe8J
 9zNOjbNxnGGYYciok9boyKqgNuniZvuVLwLLg6CduKn28y6lyDrAHrztxbpFNuxm
 btcypbNyCjapk0rJPPiuX4WSQ66cdgaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Uz6cud4OslTGzKhSQ
 V9jy4qbM1JS8MB073lVmA8G+08=; b=eswgH//vhXfLeWFnc9RYD6m87eQzTRbu5
 EyR+7zTqjAD/TpKRLdepf1WfsEYJn5MBCJIZx8w4zAerOyVJ7hpKdN8z6b4jg2zs
 51bO5XNlVYeCSsUs8UcrSdEzM6Y5SNuZp6ebVD7WykUF+ulJbWRLdVwXnk9g74hl
 M81EZ72vzREHMZAPSx+n94nrL+OIouOqDivLAqJ6CieYpnRbIYyKdaaegqomZlAh
 DQ2kiKXysNBQyOSo5b4ljqfmgSVWL/Mo6JY3kv/LLSB8kVZJTZVZLoXrHY18P5gK
 aqKoN1idxuMnj8EkMss+iHBtE+QlSwsWNxgH20Apwe16kd8TcCcrw==
X-ME-Sender: <xms:yqpQYlb8WuhpRdPAxJGvXB4o7s_th9_rcblEKgHU_Nhi9Wp_vU2r0g>
 <xme:yqpQYsbQsCj6u0QNGr4D3NbOAHF_BSSGDbcGM5RCakmTVWBIEehm_h3dR5uiCELgK
 n04nJsG9T-zSlayLfU>
X-ME-Received: <xmr:yqpQYn8gw1DZdyP0uTYmKeNw_ZIznTIhpgXwLg2BQw16OJ7SCQANBVZoLL4kmWG1a0uHKZIAeH6PmX2ttsuEaGwx4tvUVhIaV4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddujedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeijeefuedvhfdvteeuteeuueev
 vdevfeefheffjedvieehtdevgeefueegjeeuffenucffohhmrghinhepghhoohhglhgvsh
 houhhrtggvrdgtohhmpdhophgvnhhsthgrtghkrdhorhhgpdhgihhthhhusgdrtghomhdp
 khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:yqpQYjpcPg4CG1CG9XDj3oin_z_9I-VEkbTZaLyC8FJzqnuU_U-_-A>
 <xmx:yqpQYgolJaVZDuG4sxHQOJ-CFCP4OZs8SbIMOGaS2qzKwgxXPmKD5Q>
 <xmx:yqpQYpRdNgKGdZPWWawsG1Sdtr2pMHrbrswgYjfsENqv15hNgErCNA>
 <xmx:yqpQYn0JCKnf4Tq004OGYagZOMexov4JAE2qgdsjaA9FXS1E5Grh_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 17:36:09 -0400 (EDT)
Date: Fri, 8 Apr 2022 16:36:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
Message-ID: <YlCqyKtU4NCSYpAa@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com>
 <Yk3N1EG21r+NRQa5@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PzqwwCIMhB5yqICc"
Content-Disposition: inline
In-Reply-To: <CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com>
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


--PzqwwCIMhB5yqICc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 08:39:54AM -0700, Ed Tanous wrote:
> On Wed, Apr 6, 2022 at 10:28 AM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> > I was going to point to Android and OpenStack as two large open source
> > projects, which also use Gerrit, and seem to have no trouble with the
> > micro-repo model.
>=20
> Android had to invent their own tool (repo
> https://gerrit.googlesource.com/git-repo/) to handle this for that
> level of scale.  As a possible pivot on my proposal, if the suggestion
> is to use repo at the openbmc/openbmc level to check out all the
> repositories, and enforce some structure on related-reviews, I'm open
> to the possibility.

I don't necessarily think that repo is appropriate for a Yocto-based
distro.  Effectively what is in the bitbake recipes is nearly the same
as the repo metadata.  There is no point to duplicate those.

> One important thing that I think we lose if we go to
> repo is the idea of "I'm doing something new, but I'm not far enough
> along to request a repository, where should I push the code?".  This
> question has blocked the upstreaming of many (intentionally unnamed to
> protect the innocent) projects, some of which eventually did make it
> into upstream, but late, and in a less open way than would've been
> possible if there was an easily accessible, dev-pushable answer.

We should probably tackle this separately either way.  I think many
people are doing this as barely-advertised repositories in their own GH.

> I don't have a lot of knowledge of the openstack dev process.  Is it
> similar to Androids?

Based on this, I'm not sure it is much different than ours:
    https://docs.openstack.org/devstack/latest/development.html

They have "Devstack" as a test bundle of all the stuff together, which
is analogous to our bitbake image, and then they manually copy artifacts
in and replace them.

> > Why is managing patch files difficult?  Is it lack of documentation?
>=20
> A few reasons:
> 1. When patches conflict, resolving the rebase conflicts is a manual,
> difficult process.
> 2. Many devs aren't familiar with the available tools (given the
> overflow of documentation) and can sometimes resort to rewriting patch
> files by hand because they're nor familiar with the relevant tooling.

I'm still not convinced.  Maybe we need a tutorial on how to do this.

If you have a set of patches, you need to `git am` them into the target
repo, then rebase, then `git format-patch` to recreate them.  The
`am/format-patch` pieces are obviously different vs the mono-repo you're
proposing, but everything else is identical.  Resolving the merge
conflicts is _exactly_ the same process.

> 3. Patches sometimes apply to one system, sometimes apply to all
> systems, and generally cause a complex tree of dependencies.  If Yocto
> has a patch file, then openbmc has the same patch file, then a private
> meta layer has the same patch file, there's no mechanism for "patch
> already applied to upstream" like git rebase has.  If certain systems
> have pinned a given version of a subproject because of a regression,
> there's no easy way to apply different versions of patch files pre and
> post regression.
> 4. Patches could be applied at vendor-level, platform-level, SOC
> level, or distro-level, and explaining all of these concepts to new
> engineers is difficult.  In practice, most will opt for checking it
> into the lowest friction place.

This sounds like complication on your part, but I don't understand how a
monorepo solves this complexity.  If you have two different machines
with two different sets of patches either:

1. You need to create separate branches for these two machines under the
   monorepo model.

2. You need to ensure all your patches apply to all machines built in the
   monorepo.

#1 is handled just as fine with a patch model as well.
#2 is policy you should follow in the patch model too.

Regarding "no mechanism for 'patch already applied'", there is when you
do the `git am` import + `git rebase` just the same.

> No, I don't believe it's lack of documentation.  Yocto documents
> workflows very well, there's just way too much of it to expect anyone
> to read it in that level of depth.

It seems to me like it is a deficiency in tooling to make "I am a fork
maintainer" more livable using the fork model you've chosen.  Maybe this
is something we as a community can improve, but I'm slightly worried
that we'll just end up with "well this isn't _my_ fork model"
discussions unless we start with a best-practices on doing forks.

> > Upstream Yocto deals with patch files all the time.  The Facebook BMC
> > tree has machines in production that are still on Rocko-based Yocto
> > distributions and we have plenty of patch files we support there.
>=20
> As a design pattern, I don't think we can recommend everyone stay on a
> 5 year yocto + kernel release.  I get that it works for FB, and that's
> their prerogative (seriously, no judgement at all, I understand), but
> there are features in the newer kernels (SOC support, kernel support)
> that the project would like to rely on, not to mention security
> improvements.

Some of these older machines have been in production for a long time and
it isn't investing in them to the point of bringing them up to date.  We
backport security fixes as necessary and otherwise leave them alone.

> Also to some degree this is proving my point, if an OpenBMC
> application wanted to rely on a feature that's only present in the 5.1
> kernel, but there are systems on 4.7 in the tree, we'd need to
> backport patches of the feature;  That gets more onerous.

I think this is why we use separate distribution versions.  We don't
want to go through our full system test cycles every two weeks when the
community refreshes Yocto.  So, we pin a machine back on a distro
version (previously Yocto, but openbmc/openbmc releases starting with
Dunfell).

> > I wouldn't be surprised if Yocto doesn't already have tools to simplify
> > "git-format-patch" -> "package.bbappend" workflow, but if they don't I
> > could probably write something.
>=20
> I think it's supposed to be bitbake finish, but from our experience it
> doesn't handle scale very well.

`s/bitbake/devtool/`, I think you meant, but I understand.

Can you define "scale" in this context?  I don't see how a tool that
targets a single repository / recipe is intended to "scale" or how it
would fall apart "at scale".

> If we write another tool, then we're back to "tool that you need to
> know exists to use".  git is a tool that exists, and has these
> features already;  We should avoid writing openbmc-specific tools
> where we can.

I agree in the sense that I'd rather document a workflow using tools
other people already use than write our own.  No debate there.

> > Do we have pointers to when devtool fails?  The only time I've seen it
> > are for recipes that aren't in the rootfs image: kernel and u-boot and
> > they've all been due to bugs in the image.bbclass on our part.  There
> > was actually a fix to one of the u-boot recipes very recently.
>=20
> We don't have patch files upstream (by and large), so we don't tend to
> hit these failure modes in public settings.  I can try to come up with
> some contrived examples if you want, but they generally involve some
> form of patch conflict, which devtool can't resolve so it crashes out.

Thanks.  I think this is related to "scale" above.

I am really not understanding why you have "patch conflicts" though at a
devtool level.  Something seems wrong with how you're working to me if
you are.

In our internal tree I have some nasty openssh patches, related to some
custom logging we do, that I keep having to rebase.  I never work with
devtool for this.  This is the only bad patch experience I've personally
had and the monorepo wouldn't have made my life any easier because the
code changes themselves are pretty invasive in openssh (and I just do
the am/rebase/format-patch workflow I mentioned above).

> > I personally don't use devtool all that much, but when I do I want it to
> > point at the central "workspace" of all the openbmc repos I already have
> > so I can get it to pick up code I already have in progress there.  Do we
> > need better documentation around those workflows?
>=20
> When you do this, how do you manage if you're working on more than one
> cross repo feature at a time?  Maybe there's some workflow that I'm
> not aware of?

I think I've mentioned in the thread elsewhere, but I always defer the
"combine it all together in Yocto" pretty late in the development
process and I'd tend to use the same branch name across all the repos
for the feature.  You'd need to make sure all the recipes modified with
devtool are on the same branch.

That doesn't help if you're trying to make changes in a single repo for
one feature while you're waiting for bitbake to compile another feature
in the same repo.  If I get to that point, I'd probably `devtool finish`
to get the patches applied and then build.

> > (At one point there was a statement made that we didn't want tooling
> > written to assist with one workflow or another.  This was somewhat made
> > in reference to the `setup` script, but I think it had extensions that
> > made it that any workflow-related tools people have are hosted in their
> > own personal spaces and not talked about.  Maybe we need to change this
> > mentality.)
>=20
> Might be reasonable, although I would point out that workflow scripts
> still require the user to know they exist.  If we're talking about
> workflow scripts around "devtool all openbmc recipes" and "roll up
> openbmc changes into review and send", that gets us closer in the "how
> do I open reviews" regard, but I'm not sure that's the right approach.

Glancing at the OpenStack website they seem to have decent tutorials for
common workflows.  We could do the same and document the scripts.

> > I could entirely be misunderstand what problem you're pointing out here.
> > Why would it matter "where in this history the patches were forked
> > from"?
>=20
> Because the patches were applied and tested against a particular
> version of the tree.  If you change the tree they're based on, you
> generally invalidate your testing, which hopefully pops up in a merge
> conflict, but doesn't always.

I don't really know how a monorepo solves this problem though.  If you
rebase you maybe have visibility into merge conflicts (which, as I've
said earlier, are the same as if you did rebase in the code repo), but
you would "invalidate your testing" just as much as not having a
monorepo.

> >  Aren't they forked from whatever the SRCREV in the recipe says?
> > It is on the maintainer of the meta-layer to ensure they apply to that
> > revision.
> >
>=20
> I'm not quite following, SRCREV would be in the upstream openbmc bb
> file.  If meta layers bbappend now needed to pin every version of
> every package they patch, we're back to a lot of toil to maintain.
> Technically to get a consistent set, you'd have to put in the meta
> layer patch every SRCREV of every openbmc package, considering that
> changes get made often that have cross project consequences.

We must have a very different working model of how forks work?  I don't
understand why the bbappend needs the SRCREV...

> > Having all the code in one repo doesn't give you any more visibility as
> > to where the code was "forked from".  It ends up being exactly the same
> > as a patch file except that the patch file has been "applied" already to
> > the code.
>=20
> I'm not quite following your statement here, so I'm not sure I
> understand it.  If I had a meta layer
>=20
> meta-ed/
> meta-ed/meta-phosphor/bmcweb_%.bbappend
> meta-ed/meta-phosphor/bmcweb/0001-GreatestEver.patch
>=20
> How would I know what version openbmc that patch applies and was tested a=
gainst?

You never _just_ have a meta-layer.  Meta-layers don't build into
anything on their own.  You have _your_ meta-layer plus some snapshot of
openbmc/openbmc that you're working against, right?  You can do this
with submodules (like Meta does) or you can do it with a subtree merge
of some sort (which it sounds like you do, and it appears many other forks
do).

If you had working code at point A (meta-layer + openbmc X), that means
all your patches apply against "openbmc X" and you can easily derive
what SRCREV's all your bbappends were targeting.  Yes, upgrading to
"openbmc Y" is a littler harder than just a rebase (and dealing with the
merge conflicts) because it requires N-rebases for however many repos
you decided to patch, but it is a very scriptable difference between the
monorepo approach.

And I get that this is more work and a potential negative for the micro-repo
model, but again, this whole "forks are difficult" is:

- Not the same as "upstreaming is difficult".
- Not necessarily the problem of the community.

I do think the micro-repo has massive benefits for how Meta does our
downstream maintenance because with your monorepo model we're going to end =
up
with (machine)*(distro-version) subtrees with all the code and somehow have=
 to
figure out if patches got applied properly across all these subtrees (or
else create a per-machine branch in our repository and similarly hope we
applied fixes everywhere).

This previous paragraph is related to my lack of understanding how
you're going to deal with different machines having different patches in
the monorepo model.  You _can_ deal with that in a patch model but, as
you said, it is complexity you have to work through.

> >  You still don't have visibility to the underlying upstream
> > commit number.  And, I would suspect it is going to be even worse
> > because you're going to end up with back and forth merge commits trying
> > to pick up the latest upstream code in these forks.  You're not going to
> > have a nice git-submodule number indicating openbmc/openbmc was from
> > here.
>=20
> In what I'm proposing, you would have the whole repository, with those
> changes patched on top and it would be a "git merge-base" command to
> determine where it was forked from mainline, same as you would for the
> kernel.

Got it.

> > In my opinion, this is a problem with how people maintaining these trees
> > are doing it and not a problem with how our code is organized.
>=20
> Can you point to any public facing LF-openbmc tree that has done it
> "right"?  If nobody on the project can figure out the "right" way
> (myself included), including a lot of reasonably smart people, that
> somewhat proves my point, that there's complexities in the way these
> things are managed.

I'm not going to go as far as saying that ours is "right" but I haven't
really had much trouble maintaining patches for Bletchley.  We do require
that all the code has at least been sent to Gerrit and we only import
the patch file with the corresponding Gerrit Change-Id in it.

    https://github.com/facebook/openbmc/tree/helium/meta-facebook/meta-blet=
chley

IBM has a lot more experience maintaining their release-fork.  It would pro=
bably
be good to hear from them on what they observe as the pain points and
what works well.

> >  In the
> > facebook/openbmc tree we use git-submodules internally to hold the
> > upstream trees.  For our github-side we have a script that updates them,
> > but there isn't a strong reason we couldn't do the same git-submodule
> > layout there (I think it is due to a deficiency in the way our
> > internal<=3D>external mirror tool works).
>=20
> I'm not in love with the idea of submodules, but I've never worked in
> a repository where they've solved the purpose, or been easy to use
> (I've heard they cause similar problems to what we're facing) but can
> you elaborate on what you're talking about?

We explicitly use pristine submodules here of the openbmc/openbmc tree.
It isn't much different from the openbmc/openbmc handles the Yocto
subtrees, except that we use submodules to maintain the pointers rather
than squash-importing the commits.

They're just a pointer to "the latest tested version of Dunfell" that
we're building our code against.  If we want to upgrade openbmc/openbmc
we move the submodule pointer to a later commit.

> Do you think they could handle the volume of patches openbmc fields?

We don't patch (modify) the submodules.  Any changes are done in the
meta-facebook layer.

> Nothing about what I'm proposing would prevent breaking them up still
> and using good judgement, but for things like "turn on c++20" it would
> be really nice if we could have one commit, determine where the
> problems are, and organize the solutions, instead of breaking it up
> across many repositories.

I don't really understand why this is positive, but it isn't necessarily
related to monorepos.  We already push them up as a topic, but requiring
them to "all be done at once" would slow the process down and reduce the
parallelization of effort.

> > If there is larger discussion to be had that should probably happen on
> > the mailing list anyhow.
>=20
> Our mailing list can't merge code, so it makes technical discussions
> that need to reference a particular change like that more difficult if
> you need to discuss a diff;  This is a big difference between our
> community and say, the kernel.

I was meaning talking about direction or snags we've ran into, not code.

This is an example thread from the mailing list:
    https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/

As we are working through pervasive changes it is good to keep everyone
appraised of the issues you're running into so they can also be fixed by
people in other areas of the tree.

> > In my experience the difficulties with upstreaming are not related to
> > logistics of sending patches to Gerrit.  They are related to the effort
> > involved with getting other people in the community bought into what yo=
u're
> > trying to do.  Having all the code in one place alleviates 1% of the
> > upstreaming effort while doing nothing for the remaining 99%.
>=20
> We've clearly had different experiences (which is fine).  I've had
> multiple developers describe the review process itself as complicated,
> unstructured, and hard.  This was mentioned explicitly separate from
> community buy-in, and as someone that goes through the process almost
> daily, I agree with them that it's more complex than it should be.

I'm not really sure what is being alluded to here.  I do agree it can be
difficult in some areas to get code in, even if it is small and reasonable.
I'm having trouble aligning that mentally in an axis with "monorepo will
solve this".

> For the major initiatives that I've had a hand in bringing online in
> the project, having a clear concise way to talk about the engineering
> (ie the code) was a much better way at getting consensus than any of
> our docs processes.  In most cases, it involved pushing to a public,
> unrelated openbmc fork, waiting for momentum to build, then merging
> the result when people in the community wanted the capabilities it
> provided.  Not having a way to do that within the project adds
> friction.

Can you point to examples of this?  I don't think I've ever pushed code
to my own fork of openbmc for any development and I don't recall any
being advertised on here in a very long time (except for this monorepo
proposal, haha).

> I retract my previous statement, as you're right, I don't have
> numbers, propose the following as a replacement: "A single github bug
> tracker against the main repo would be a better community driving tool
> than distributing it across many sub repositories."
> I will also admit that there are probably options where we could do
> that anyway, outside of this proposal.

I mentioned elsewhere I don't have any major issues with disabling the
sub-repo issues database for most of our repos.  We do have to figure
out how to manage who has access to dispose of issues and I think we
need to solve that whatever we do with the code.

> > Why can't people search bugs or code at an org-level?  I do it all the =
time.
>=20
> If there's a way to get a single listing of bugs for all repos in the
> org..... I'm not aware of it, and a quick google search doesn't pop up
> anything.  Maybe my google-foo is off?

https://github.com/issues?q=3Dis%3Aopen+is%3Aissue+org%3Aopenbmc+archived%3=
Afalse+

--=20
Patrick Williams

--PzqwwCIMhB5yqICc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJQqsYACgkQqwNHzC0A
wRmlng//WbuFAgpqWbsEAc2Dn7PkQdXzvdUkL1yvz6cvNhcr5//wU6uxuUctApq+
WrELSopuvK7PiJ6FD3fRhr03KdXafc1bzCLuouejVNV8yhc/rRbFhStuq59P8pRK
QBSBzlFe6dsrgwbnogGNeb1cmzKYgV8n0PzBo1c3BBJKdF1X62te7vu+sbKOo0Xz
UZKiOEhtpUxB0pFIb7v2Irpjj1Isxch2RuMAoEtYnNSpAuUHvXw9PX3YeTbEhSLi
lu/5JJT9kNcn+zJ4iBRnS2OFQ5n0rSCOgUGh8h+AgO4ut5IQnOcMrs8f5JFcAy9P
dTPqu+NiwSXDwm4G0FS/gSkFmyXkZ7UafmtzWck2aSY4sWYZCD61oy5sfpaxbkYU
ojl2QAwGLZ6EhPpxysp7bfpc+15T8hYZJG60XaBQF0DXF0ge7qLmU1JCPvo6dnDL
iQC9nhL5WNlOO2/UPAyQ2hz5ydQOy02IegmUjLezdZHktVbqqdMwwWX+FhzcEfMN
ogBg79Aaj9GXQf3dgIUxrd5KGZkdcgX1fh7w8rXivFgDHIYthf/nrjVnj5Zn8uvc
vVYTVJUm12ros1DR48LuU+Jq3jcSF8lSnfmBg8ypAWVc35OKudMe2h+LW54TPOtQ
xlCzK1tXc5xgtNdlQ3O4GyPG8MlJA0toYmHULyAvLEjKXVl6kjo=
=SUeQ
-----END PGP SIGNATURE-----

--PzqwwCIMhB5yqICc--
