Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD41079A9
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 21:53:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KTCv0K5FzDrMl
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 07:53:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.54; helo=sender4-of-o54.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="ncxgOqxz";
 dkim-atps=neutral
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KTBx6v8BzDrJY
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 07:52:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1574455935; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WR31iDLLEem/F1GBZ9eWqIeWkT1r3UWBn5pE1UUzxbRJW6o1PJNqna7H6mqqV7IOs1GC/GPGFzxYYcbzHlXeLXMzxTfgASirJvzqNKWtfF46lpQwwTzPGl009MQqKWtXx36e4nt8KE2Robd6izQxN+87Y55xlojni+P/XNkiULU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1574455935;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=TCgxaDrTJnXwt/o4k5w9WnrpBRvakjt9ec3EdxcTB0k=; 
 b=TNDeWq1M6+erClhZ2xC5pLH46xPuBk9661o0JiUeeQ10+8AsHVj1EAV3BBX2ZMSJI3IBNZdu41RGQn036bE7LaEAIgKU6W8x5MSumVWS6IzTyMek4YunbhyrdGuYuiAqg1NnFgXW1JtT16qlEO0Gmdace/z0IjydfhFQGKStDsM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574455935; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=TCgxaDrTJnXwt/o4k5w9WnrpBRvakjt9ec3EdxcTB0k=;
 b=ncxgOqxzi2d4PQucfo4wTvoEoV1zdAnOTf9Xv5xg/oJwklU1kngwyADb7SGVxlS9
 qq5ui+R3JHt5S7/1PjKKVVKVdmcEi54U8L2qNdXAaLxYodv47o3GN9ww/w2rw1qSwQ4
 4sh15dcWShsXagusTcBA1oyoBTrwBzdI+ePGYXqI=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1574455934716475.8809570503968;
 Fri, 22 Nov 2019 12:52:14 -0800 (PST)
Date: Fri, 22 Nov 2019 14:52:12 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: 2 patch dependency
Message-ID: <20191122205212.GD93344@patrickw3-mbp>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
 <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
 <20191119165440.GB93344@patrickw3-mbp>
 <6E519880-9A69-411B-8DD4-BF86AB7E543C@gmail.com>
 <29544933-52D7-4133-8AA2-B78F3A8441C5@fuzziesquirrel.com>
 <20191122173648.GC93344@patrickw3-mbp>
 <9EB92DE0-E10D-4ACD-9B21-75218F11F182@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline
In-Reply-To: <9EB92DE0-E10D-4ACD-9B21-75218F11F182@fuzziesquirrel.com>
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


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2019 at 01:41:14PM -0500, Brad Bishop wrote:
>=20
> > On Nov 22, 2019, at 12:36 PM, Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> >=20
> > Can you elaborate briefly on the issues you've had with it? =20
>=20
> Well for one, the issue that started this thread - coreqs.  they are hard=
er than they need to be with the current workflow.
>=20
> Also the two step CI verification that comes with it is not good - it hal=
ves our already limited resources.  Although now that I think about it I do=
n=E2=80=99t recall why we felt this was necessary=E2=80=A6

I understand the co-req issues.  We'll still have them between code
repositories (which was really the underlying issue in this case).  But,
eliminating the sub-trees certainly alleviates one introduction of them.

To be clear, I personally have no attachment to the sub-trees or mono-repo
=66rom an openbmc/openbmc perspective.  Just trying to offer alternative
ideas before there are changes.

By "already limited resources", I assume you mean compute resources for
CI.  It seems with the companies involved in this project, this should
not be an issue... is this something the TSC should discuss?

> Finally it is just awkward and lame to clone openbmc/openbmc, hack on it,=
 and then have mess around with adding additional remotes and doing subtree=
 cherry-picks, etc=E2=80=A6 to submit a patch.

No disagreement at all here.

> > It seems=20
> > like many metas with subtree, many metas with repo, or mono-repo all ha=
ve
> > advantages and disadvantages and are just different ways people have
> > attempted to skin the same animal. =20
>=20
> Could we not have all of them at the same time?
>=20

This is entirely a "without evidence" statement but my intuition would
be trying to do all of them gives you all the disadvantages and few of
the advantages...

Perhaps a higher-level discussion is what purpose do the meta sub-trees
serve and is it worth the project investment in them?

My recollection was that people asked for sub-trees (the old split back out
of openbmc/openbmc method) because they wanted to pick up some subset of
recipes to use in other projects.  Why should our project's day-to-day
activity be less efficient to satisfy that?  (+1 to mono-repo).

I recognize the subtree maintainers desire was a reason for moving to
that structure, which maybe this MAINTAINERS plugin addresses.

> > This would be one advantage of using repo. =20
>=20
> The word advantage implies repo would replace something else.  What do yo=
u want it to replace?

Good point.  A repo manifest could replace the current combined metas
that is openbmc/openbmc and keep today's subtree maintainer model as-is.
Again, I was just trying to present it as an alternative to going back
to the "old model" of openbmc/openbmc being the master.

>=20
> > You can have different
> > manifest files for the different Yocto branches.  That way we can keep
> > pointing to an LTS Yocto but with newer OpenBMC code (for people who
> > might desire that when putting OpenBMC into production).
>=20
> makes sense.
>=20
> >=20
> >=20
> >> As far as repo goes - in my mind that is something completely separate=
=2E  If anyone wants to maintain a repo manifest somewhere I don=E2=80=99t =
have a problem with that.  It doesn=E2=80=99t have to have anything to do w=
ith the patch submission workflow.
> >=20
> > I'm not really following how any of the options have a big impact on pa=
tch
> > submission workflow. =20
>=20
> agreed.  In fact=E2=80=A6is there anything you need from the community to=
 start maintaining a repo manifest today?  I don=E2=80=99t think there is, =
is there?  Maybe a git repo to put it in?
>=20

There are two scopes to a potential repo-manifest (in the context of
this project specifically):

   1) A manifest that combines the meta-subtrees into a single
      directory tree.

   2) A manifest that combines openbmc/openbmc plus the project's code
      repositories into a single directory tree.

If we are going back to a "openbmc/openbmc is the primary source" model
#1 is pointless.  Also having an alternative Yocto branch is difficult
without #1.

Yes, #2 can be done today (with a new repository).  I think it would
mostly be a developer-help initially but could be rolled into
simplifying CI.  (We could also do #1 and #2.)

I'm mostly focused on #1 in this email thread because has impacts to
this subtree elimination proposal.  It is probably worth another thread
if we want to discuss #2 in more detail.

> > Most developers just contribute to whatever
> > repository is considered the "master" of where they're making changes.
> > If that is a subtree or a monorepo, does it really have much bearing?
> > (I guess it has impact in the cases where we need to span what are
> > currently subtrees?)
> >=20
> > Having a repo manifest simplifies two things:
> >    1. Implementation of cross-repo CI (and the topic-based testing I
> >       mentioned) because there is a clear assembling of all the git
> >       repositories that might be impacted by a topic.
> >=20
> >    2. A mechanism for developers to "get all the code".  I've heard
> >       complaints of developers having to manually assemble a collection
> >       of git-clones for all the different sub-projects they tend to
> >       work on.  A maintained manifest of all the openbmc/* repositories
> >       would alleviate this.
>=20
> I think you are driving at a couple things:
>=20
> 1 - patch submitters should continue to submit patches to meta-*, poky, m=
eta-openembedded, etc.
> 2 - you start maintaining a repo manifest.
> 3 - everyone will abandon the current monorepo composed of subtrees.
>=20
> Do I have it right?
>=20
> What I=E2=80=99m asking for instead is:
>=20
> 1 - patch submitters submit patches to openbmc/openbmc (unless there is a=
n upstream community)
> 2 - patches (immediately) find their way into meta-* via automation
> 3 - you start maintaining a repo manifest
> 4 - I continue to maintain a monorepo composed of subtrees (the ones with=
 upstream communities) & directly submitted patches
>=20

I think we're on the same page with both of these last two "processes"
you wrote.  Hopefully my #1/#2 above clarifies my thinking.  Except "you
start" doesn't have to be *me*, but I could certainly pull together a
manifest file pretty quickly.  (As in, I don't need to 'maintain' it but
I can put in some effort to get the ball rolling.)

--=20
Patrick Williams

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl3YSnkACgkQqwNHzC0A
wRmdUhAAn1AmBdokFTMyS0nPnTcjVoi5701swEQIUhJBV505qEBMcQS4QmQbNV3d
LDhiTIlZVrp8lhytTMF2Ql5F+OBAPto6zHCvcfCf2naGveOvMq1PXdiJtJHFCFu8
pqWQsNArB30foL9AX9wROQqwaXij6DdOdjzLa6TYAEU2D3Nn5A6pE1UFBj7NpTMP
FEXe3arKhb9ahpiljgg+nPATI1fEHYAUJqyPmnVmE9yMxSVNnOcchUZAGwtYrB+Z
10gwikXAkuoNXM8Rc2QQ5o/W8v29o4w0iQnHXSOAe7QXE2RSdkSLGoM9VDBSvw4y
qmqjL65xPKhvpOur6Qxd1xVyTldyiTl161zNvBr527TWNjMYiy3MlVakZNUzTS5S
3UbkmzYb3qeTg8R+DxTo3dGUFnrRxhC9cncjQEiR69FDQ1j54PNbnpx30ldZkQa0
oiWnTSpgLt/KK+6TCedt1k0ATVHOA11BdlogQxx/ZkEO2eaAIel1bOYQLC8k3MPT
ZAKB8CjbFtJmAaHbr13PlKPSuru3A0HRLnO9c+rtTnxiPav2boQlp/hDRIh27YrF
s+oHjZUIeFMC0hk7C+loSkRZ3fwvf2BOyn+V1EcGg9j0YnflMMQbAyueFsCViUai
h7xeMe3Ba/ZGWmaRsU06nnF5rwBFyl29kXnqqklbq+/Xw8cCGBI=
=dX+5
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--

