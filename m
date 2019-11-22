Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2457B107782
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 19:42:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KQJR2p74zDrK3
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 05:41:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KQHj5sJdzDrJP
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 05:41:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id D9024114C39;
 Fri, 22 Nov 2019 13:41:14 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: 2 patch dependency
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20191122173648.GC93344@patrickw3-mbp>
Date: Fri, 22 Nov 2019 13:41:14 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9EB92DE0-E10D-4ACD-9B21-75218F11F182@fuzziesquirrel.com>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
 <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
 <20191119165440.GB93344@patrickw3-mbp>
 <6E519880-9A69-411B-8DD4-BF86AB7E543C@gmail.com>
 <29544933-52D7-4133-8AA2-B78F3A8441C5@fuzziesquirrel.com>
 <20191122173648.GC93344@patrickw3-mbp>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Nov 22, 2019, at 12:36 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Thanks Brad.
>=20
> On Fri, Nov 22, 2019 at 10:44:16AM -0500, Brad Bishop wrote:
>=20
>> A brief history lesson for any that aren=E2=80=99t aware - the =
original workflow was patches were submitted to openbmc/openbmc for =
subtrees where we are as far upstream as you can get.  We moved from =
that to the workflow we have today because of a desire of mine and =
others for de-centralized ownership of metadata.
>>=20
>> To enable that I proposed the same process that the Yocto project =
uses to aggregate the various sub-projects into the poky distribution.  =
This is how we wound up with the workflow we have today.  In hindsight =
this was a mistake.
>=20
> Can you elaborate briefly on the issues you've had with it? =20

Well for one, the issue that started this thread - coreqs.  they are =
harder than they need to be with the current workflow.

Also the two step CI verification that comes with it is not good - it =
halves our already limited resources.  Although now that I think about =
it I don=E2=80=99t recall why we felt this was necessary=E2=80=A6

Finally it is just awkward and lame to clone openbmc/openbmc, hack on =
it, and then have mess around with adding additional remotes and doing =
subtree cherry-picks, etc=E2=80=A6 to submit a patch.

> It seems=20
> like many metas with subtree, many metas with repo, or mono-repo all =
have
> advantages and disadvantages and are just different ways people have
> attempted to skin the same animal. =20

Could we not have all of them at the same time?

>=20
>> The proposed change would simply be that we revert back to the old =
workflow, which was much simpler, and use the Gerrit plugin to implement =
the de-centralized ownership requirement.  There have been and will be a =
couple enhancements since we last used that workflow though:
>>=20
>> 1 - I track poky/meta-openembedded head. Last time we tracked the =
latest released version.  This has worked fine; I am not aware of a =
single instance of upstream breaking us or causing any instability.
>=20
> Is there any interest in supporting multiple Yocto releases at a time?

I don=E2=80=99t have a need for this.

> This would be one advantage of using repo. =20

The word advantage implies repo would replace something else.  What do =
you want it to replace?

> You can have different
> manifest files for the different Yocto branches.  That way we can keep
> pointing to an LTS Yocto but with newer OpenBMC code (for people who
> might desire that when putting OpenBMC into production).

makes sense.

>=20
>=20
>> As far as repo goes - in my mind that is something completely =
separate.  If anyone wants to maintain a repo manifest somewhere I =
don=E2=80=99t have a problem with that.  It doesn=E2=80=99t have to have =
anything to do with the patch submission workflow.
>=20
> I'm not really following how any of the options have a big impact on =
patch
> submission workflow. =20

agreed.  In fact=E2=80=A6is there anything you need from the community =
to start maintaining a repo manifest today?  I don=E2=80=99t think there =
is, is there?  Maybe a git repo to put it in?

> Most developers just contribute to whatever
> repository is considered the "master" of where they're making changes.
> If that is a subtree or a monorepo, does it really have much bearing?
> (I guess it has impact in the cases where we need to span what are
> currently subtrees?)
>=20
> Having a repo manifest simplifies two things:
>    1. Implementation of cross-repo CI (and the topic-based testing I
>       mentioned) because there is a clear assembling of all the git
>       repositories that might be impacted by a topic.
>=20
>    2. A mechanism for developers to "get all the code".  I've heard
>       complaints of developers having to manually assemble a =
collection
>       of git-clones for all the different sub-projects they tend to
>       work on.  A maintained manifest of all the openbmc/* =
repositories
>       would alleviate this.

I think you are driving at a couple things:

1 - patch submitters should continue to submit patches to meta-*, poky, =
meta-openembedded, etc.
2 - you start maintaining a repo manifest.
3 - everyone will abandon the current monorepo composed of subtrees.

Do I have it right?

What I=E2=80=99m asking for instead is:

1 - patch submitters submit patches to openbmc/openbmc (unless there is =
an upstream community)
2 - patches (immediately) find their way into meta-* via automation
3 - you start maintaining a repo manifest
4 - I continue to maintain a monorepo composed of subtrees (the ones =
with upstream communities) & directly submitted patches

thx - brad=
