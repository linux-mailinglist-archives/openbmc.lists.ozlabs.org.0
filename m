Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35E107683
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 18:37:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KNtJ4XcfzDrGs
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 04:37:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.54; helo=sender4-of-o54.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="NxUYz3AD";
 dkim-atps=neutral
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KNsX0jrvzDrDf
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 04:37:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1574444213; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RadFcNSDpewZyfcl9rszgUoEcVtOMcr3fwq/JpkgV7ZeSbSaq/gCWtVug7hiupucW3ECgbp3Jy2ekf4yJaVaLypFMzVNaOkfCqbe0IfV17/9Ld6Tz2R0b4a2KOvY+yIQ80gfUs4NqI5rPo7pLQ4/CNxNmJsgDq/iYSTmMLlGYhc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1574444213;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=GxwJhuG6t0ZODMYGgrXHGmHxENp+6HP+3OcCMW1hboA=; 
 b=fvcfYgsO3692DnQGG/UMc5EDBP5yVhW2dYjXl6wp2pbws4USFg1FvSVLGGfVR/nbsHKZMX0mDX//WJxT6KtuUBO9q0TbQZNl5tmSH6WokDcJ4OJFLkj9VuNiiQ75D9mZ0XRXvwvjwgZ3qSXkxIsFBxi+Ku8yW4FDEVlOdkZJJVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574444213; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=GxwJhuG6t0ZODMYGgrXHGmHxENp+6HP+3OcCMW1hboA=;
 b=NxUYz3ADk8Efx8wpdoI19J7w2L0G/sL0FuOvCEZMe/KUVcQ2/0o27Hmeevy+55ka
 rBQaHkBTOUtCjuTnYkte4cB4At/JNscm4K3uQhs4VuUtntSRdKI+0zgURHDN26mtqZN
 BPexAyKh89leo6EVVB2Vf0/IXsuuMiH0RYgTcSfI=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1574444210884622.2306362843102;
 Fri, 22 Nov 2019 09:36:50 -0800 (PST)
Date: Fri, 22 Nov 2019 11:36:48 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: 2 patch dependency
Message-ID: <20191122173648.GC93344@patrickw3-mbp>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
 <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
 <20191119165440.GB93344@patrickw3-mbp>
 <6E519880-9A69-411B-8DD4-BF86AB7E543C@gmail.com>
 <29544933-52D7-4133-8AA2-B78F3A8441C5@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
In-Reply-To: <29544933-52D7-4133-8AA2-B78F3A8441C5@fuzziesquirrel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks Brad.

On Fri, Nov 22, 2019 at 10:44:16AM -0500, Brad Bishop wrote:

> A brief history lesson for any that aren=E2=80=99t aware - the original w=
orkflow was patches were submitted to openbmc/openbmc for subtrees where we=
 are as far upstream as you can get.  We moved from that to the workflow we=
 have today because of a desire of mine and others for de-centralized owner=
ship of metadata.
>=20
> To enable that I proposed the same process that the Yocto project uses to=
 aggregate the various sub-projects into the poky distribution.  This is ho=
w we wound up with the workflow we have today.  In hindsight this was a mis=
take.

Can you elaborate briefly on the issues you've had with it?  It seems
like many metas with subtree, many metas with repo, or mono-repo all have
advantages and disadvantages and are just different ways people have
attempted to skin the same animal.  (There is also submodule, but
*yuck*...).

> The proposed change would simply be that we revert back to the old workfl=
ow, which was much simpler, and use the Gerrit plugin to implement the de-c=
entralized ownership requirement.  There have been and will be a couple enh=
ancements since we last used that workflow though:
>=20
> 1 - I track poky/meta-openembedded head. Last time we tracked the latest =
released version.  This has worked fine; I am not aware of a single instanc=
e of upstream breaking us or causing any instability.

Is there any interest in supporting multiple Yocto releases at a time?
This would be one advantage of using repo.  You can have different
manifest files for the different Yocto branches.  That way we can keep
pointing to an LTS Yocto but with newer OpenBMC code (for people who
might desire that when putting OpenBMC into production).

>=20
> 2 - I would automate the subtree pushes. Last time this was done manually=
 (and thus the subtrees were often stale).

:+1:

> As far as repo goes - in my mind that is something completely separate.  =
If anyone wants to maintain a repo manifest somewhere I don=E2=80=99t have =
a problem with that.  It doesn=E2=80=99t have to have anything to do with t=
he patch submission workflow.

I'm not really following how any of the options have a big impact on patch
submission workflow.  Most developers just contribute to whatever
repository is considered the "master" of where they're making changes.
If that is a subtree or a monorepo, does it really have much bearing?
(I guess it has impact in the cases where we need to span what are
currently subtrees?)

Having a repo manifest simplifies two things:
    1. Implementation of cross-repo CI (and the topic-based testing I
       mentioned) because there is a clear assembling of all the git
       repositories that might be impacted by a topic.

    2. A mechanism for developers to "get all the code".  I've heard
       complaints of developers having to manually assemble a collection
       of git-clones for all the different sub-projects they tend to
       work on.  A maintained manifest of all the openbmc/* repositories
       would alleviate this.

--=20
Patrick Williams

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl3YHK0ACgkQqwNHzC0A
wRla8Q/+IgylG60OAGaS4v3gpWhf0wWs2vImh7UK0PnE3OD2DUjEFXTGHyqDc2lG
hOmk4KWZ+7uPE2PsgfhTUby/+5hsjojD9TG78uWoogn4zqTQfnqqLvIwtVjZbWxB
uvg2QGkx9pSmIYe8GZKhWtOOuHvbWpdW883cEbvkZCjMg6D3+5nBrCn1qjhy5uSt
rAFthJleT2en9eadxapf/yvJ7pJI1+g+jYJtl5ZNJMdtVEaQTZhkjkag672JHGCx
jHyOc33Lfqf+ZA/F3lnWhBzjD3qKAYxnOExF7Qbk8VdzZPjyoFgBfn8rKDNeMlr0
f0ceSme5KLV0Ay3wNqxlzAcO4QayQbVJLnra8uU0kA/fVqcrD6brdVECSO0qrew8
Q064EMWWGCrJlvGbaShDQryZRwAZQHyCCUFEDbiTAI7q9JHhn/HWNz6cBEcEBwQP
V9DjaeOgiMWC0FdYgg/iZVqHV0YxSjm0pnNkPzKja0s9btzX/EvBIDFf5Bo70PxS
1gzfCyemvhNRFkX8S2/8RegW6ihd7EDO50/zVb9wRloppAMGzpyjowGjRXh/a2Tm
93HYU2WQZc+vHT6d78TDNJbgs1gZH7htYMZlU2PMmapg+Dul0NdiDme9UGCeZhp4
PF40+vsNcC88U0GOPnP1pCI6AfzYTZCsNKH74jId0TpfCP/kSjU=
=ziXg
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--

