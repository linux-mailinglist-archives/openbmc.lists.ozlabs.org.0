Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42405131480
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:11:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rzVy584KzDqGB
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 02:11:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="aClcOCzK";
 dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rzV64S8PzDqFZ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 02:10:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1578323448; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MU/Hb23HS9WFurqAbeSJ855qG8JwNI80P7wtqc5VUr7DCkZafaQTCX18ox6YvF6myj0AWEglFqOuGFXm9EovLV86B1HJD34NNO8l95mVmegMXx76vvPR2T49+tw8CMQFTExlemFB9dsGivGM51CeuUSVF4yNAIeIrU7nsC48Cb4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1578323448;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=pEvQOevMKg7As36Wh6pGJGSZULQnNVqAZ7vRIrJcfZM=; 
 b=b37w+eJ+7u+hdSLCr1WvUSm2wJw/VfApN101bYOMW6bHXC16+YF3ecRXJpmMo9QxhkFaM19/d5+zFPfWNyxeKOzaKDOQyCUV5Nv4jawKLWVs+gVxFXzC6yqfFECBhahKbnqyCrqKQpBn27UZI7OK59y12zoOpHc/pmJ4KGjB3U4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1578323448; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=pEvQOevMKg7As36Wh6pGJGSZULQnNVqAZ7vRIrJcfZM=;
 b=aClcOCzKZbRuqxZK7kv/u1uF3gFl5YwAXuDvBXEzOjlOQPA1/+ycgAflwOPyq2Vj
 kitVysFM0tOrtMIhoqJceOCDM/C2ZKSaVQ9jtvY+WwEP3w6mT5VrNAuDSP4Ku1wqk8S
 +y7yshItBMdV/yjdQA/IMEIyOu0AY2QHCRErrJ0Q=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 15783234440781023.0118572275629;
 Mon, 6 Jan 2020 07:10:44 -0800 (PST)
Date: Mon, 6 Jan 2020 09:10:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: bitbake of individual repositories
Message-ID: <20200106151041.GA1233@patrickw3-mbp.dhcp.thefacebook.com>
References: <CALLMt=oyMtrZ4iU5BukqrNF4-7wXWPaSOxg20Hr3Y4Lo182Ejw@mail.gmail.com>
 <20191218180242.GA61593@patrickw3-mbp.dhcp.thefacebook.com>
 <35EA2D06-705F-4709-92C2-2980A6E9D524@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <35EA2D06-705F-4709-92C2-2980A6E9D524@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2020 at 03:57:05PM -0600, Andrew Geissler wrote:
> > On Dec 18, 2019, at 12:02 PM, Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> > On Tue, Dec 17, 2019 at 04:02:12PM -0600, Andrew Geissler wrote:
> >> Other ideas out there?
> >=20
> > I've mentioned repo before as it can assist with this.  Bitbake has a
> > feature where you can set "SRCREV=3D${AUTOREV}" and it will automatical=
ly
> > pick up what is in the git repo.  What I've done on another project is
> > this:
>=20
> Does this mean all recipes will need to change to do this? I think we=E2=
=80=99ve
> discussed this in the past and stated we like to have more control over
> when code is picked up in the meta-* layers.

It is a pretty simple bbclass that you include in each recipe.  That's
all.

I want to be clear, that you still have the exact same control on what
code is picked up as you have today.  In general the SRCREV is set by
the recipe and is an explicit commit number (or tag), just like today.
Only in the case that a special environment variable is set does SRCREV
become AUTOREV and in that case you use 'repo' to populate exactly the
code you want.  There is never a case where you do not have control on
what code is populated or where you cannot reproduce a build.  All that
is happening is you are delegating responsibility of the SRCREV to repo.

> >   1. Use `repo` to pull down all the source repositories in a consistent
> >      tree (and ensure it is in the Docker build image, such as in
> >      /workdir).
>=20
> I=E2=80=99m not familiar with repo. Will this require any changes to our =
upstream
> repositories or is this just a tool we can use from within our CI scripts?

I have another email chain with Brad where I think repo might be a
reasonable alternative to "merging all the metas together" problem, but
otherwise, they are not related.  You could use repo just for CI.  In
fact, I proposed that as a first step in that email chain (you were CC'd
I believe).

> >   2. Run a small script to fetch the GERRIT_REFSPEC and/or GERRIT_TOPIC
> >      on top of the checked out `repo` location.
> >=20
> >   3. Add a small .bbclass that replaces "SRCREV=3D${AUTOREV}" when an
> >      environment variable is set and update the recipes to inherit
> >      this class.
> >=20
> >   4. Set the environment variable prior to running `bitbake` and add a
> >      source mirror to point at the /workdir location instead of Gerrit
> >      directly (eg. 1 line in local.conf).
>=20
> Your option seems even more complicated then the one=E2=80=99s I had abov=
e :)
> It does come with the added feature of the TOPIC support but our general
> statement has been to just avoid requisites.

I'd probably argue that it is just as complicated as trying to use
devtool to formulate a code package of sorts. ;)

> As with anything though, if you=E2=80=99re willing to put the work in to =
help make
> this happen, and assuming it requires minimal changes to existing
> repository layouts and recipes, I=E2=80=99d be interested.

I've written it once before but that wasn't open source.  Probably
wouldn't be too hard to recreate something similar.  I should have some
cycles to put towards on OpenBMC CI work the next two months.  I've been
wanting to prototype a `repo` example anyhow per that other email chain.

--=20
Patrick Williams

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4TTe8ACgkQqwNHzC0A
wRkjTg/+NwZVOi9ysy7+MpKMPmD7kOHhgCnGTilOX+K2+jMMxsI6QWGSXc0By7Ui
VRgMBuMFW5J3wYMTipGfB+Kn8VjZLW6s00kqPGutMmxLaPPG+d8ymms2R9qEv8tZ
US7K8EkmUAkjbLCO9OaWQ29NZbPJmL4qR9Gs05REl85rhtquoP4z6Fpl+Atzdz7R
CUv6d4bPVShJNPBOy4o3ws16AkNAN7QG6L1lQBSp/7yikmekpyB0LSzEx9R3lxo+
T2QOHbLp1akrQprE2kRvgyAsAJ/6il1PWV/vax8Ds42iiTDG6ajpNme9OkPjdyjN
mVMfbxW/3c3i9FM0qS22FemmZchfSGTDHTDTINkNdum+k81EiAraLB2bQgpWqkUE
LqYHs8DsyTI9RAjB++0A8NEJbA78VoAMAQ0wcy1TaGqfx8Ih+PXapY4QIMuBO4/k
yqde92eo/hXYoIjqXgtXeCcuuaDCB+fq3Q++jvnRA+oZnHpbwAlkvgSsULA5slSW
CpEW7Sa2pmukENjokzi0zoYhXEzaCAwvHBv1LCg1DYP8gL1bW0r9lDwTx5IXU6dQ
NXws/IwjY1eplgtYeuYAHARhNfJT0tTjrwnr1ExqQU8adzzR7T4FWCKc80bSeaKm
KJ3842GzcNGx205psquOvaGdkV6F+u6yihCCUgmu00Q/LqphoEE=
=Xy+5
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

