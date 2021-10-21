Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90775435A0A
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 06:34:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZZPj6f7Gz2xXP
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 15:34:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=prt/y4f/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lWMhLW1V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=prt/y4f/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lWMhLW1V; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZZPH5nZQz2y8P
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 15:33:55 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D2AB5C0103
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 00:33:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Oct 2021 00:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=9wHEutrZBBYq5Hzn2DWqmEqtoMxWOq1iQ51rz3EMCJE=; b=prt/y4f/
 Hf64vcHn+54Zwa7F7HzwQuqZn4DYsmoRsuxju50XzrxYwTxKY3cf5PzNAMYBxzP0
 snE80Wj53FIgDujbmeECSiKHbJQhbP7iDDLPS3CQ2jnZFQ8y4AccsUIGF5LAk/67
 kTuoXdhx9riokedlmmOiQ/dKFX4cQk/U4kSm1eueGAgcpjY/xY359ML3sTEuK7Cm
 NGo5bospPFOb/iQHB5SO4McNFctqX81hxPXxAOt3FS48nEBVxg8UW+Q3WhnBvZQf
 d5+9DpABcHQ7qJENJL9PcRH1qKkllgnKzHASwN2bYlPXHSXvar3Un9eYZ8CXwqAy
 JVlPhH/dx8BzQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=9wHEutrZBBYq5Hzn2DWqmEqtoMxWO
 q1iQ51rz3EMCJE=; b=lWMhLW1V8FT1y9+TmHM8Gx5SGQz8Yjw8C4ASl7r2ONtV5
 lkbFZI/DE5LnBpX/S2HkJjg+RkDz7G2W5/yjX3k9qNeydipu8ePi/STodN1Gj910
 JCYuE4kr1fgs4nrkqlfVZQyoTeUw6Uixei1OxG9/oh+BpTBDj4RzaQEm3eUMBW+l
 Hh0wmM/83DebZ79CvPETvHjt0HN5idfLyAE6ufv6ylK+BOr3upnxnuIEksN+47Wn
 UciGwZSVDdR0PggoFYC00M7iTgQ9ADRzxbEEFSFhCwEd5a8FigD7mL2WpCfpp0pk
 5SJRajtalKvTPuede7DkFh1bQwWIMSTZ/+iGP1y1A==
X-ME-Sender: <xms:sO1wYczU1HJEBlR0cDQKkDGhUJpcsfDKIgl3v1_UYia89nX-UO0iag>
 <xme:sO1wYQT_03d-0TVnBM1ztuy5Agnqu4eU_TRkjzflw6uOcp0zlofvmmpbwBhRW2UxZ
 yBehTBKY5bdYWMgjpM>
X-ME-Received: <xmr:sO1wYeWEcQMaIbc2PonqwLYmIENkpvwql3YgYylFs9d_5m3E6T95UrAfIZIyMTP7rL8XDelAkfUJqtwh9tSo6Pz29UjZ1GnOxv3Xd8VJvdwvng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtroertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffeikeejtdejveetueefvdevteekgfev
 gfejlefgfeeitdeigeefvdekheefkefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 dpghhithhhuhgsrdgtohhmpdgtohhnthhrrggtthdrmhgupdhoiihlrggsshdrohhrghen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
 hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:sO1wYai_utJrtGCtPC3oujX3iiOCNp_QIXdoW4mU6AXEa4rYkCxjkQ>
 <xmx:sO1wYeBO2BwpEkYVJxDo-pGLDRxRoeXavXq0Etxo3r1aGRyVoKMPWQ>
 <xmx:sO1wYbJxXRZ24sx4fTQEdTEdmjrvAZtMBopu5WoQLfmUpi2vbQXxug>
 <xmx:se1wYV-OD-WlIFgu2BsJq07CZWyGFfPjXpZJ_mN9tWK0f0GB5mQBgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 00:33:52 -0400 (EDT)
Date: Wed, 20 Oct 2021 23:33:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: OTP-5: "OpenBMC TOF Proposal" Process
Message-ID: <YXDtrwHhUcxwtlij@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U/2MJeM3iQL4ls3P"
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


--U/2MJeM3iQL4ls3P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

As I mentioned in https://lore.kernel.org/openbmc/YXDrQAf73igsbu7+@heinlein=
/,
the TOF needs a process for making proposals.  We have a bit of a cycle tho=
ugh
in that we need a proposal for the process but we don't have a process for
proposals.  So, this email is a proposal for the process for making proposa=
ls
with which I am attempting to follow the proposed proposal process.

Before I get into the proposal itself, the proposal proposes how the commun=
ity
should interact with proposals.  I propose that we all follow said
proposal(s):

    Any member of the OpenBMC community may give feedback by:

    1. Expressing a vote to the top post of the Github issue.
    2. Providing grammatical suggestions to the Gerrit commit.
    3. Responding on the mailing list with opinions on non-grammatical OTP =
content.
    4. (Least desirable) Providing off-line feedback to a TOF member(s).

    Community members should refrain from:

    1. Voting on any comment in the Github issues beyond the top post.
    2. Cluttering the mailing list discussion with grammatical suggestions.

Now for the full contents of the proposal:

---------------------------------------------------------------------------=
----

---
OTP: 5
Title: "OpenBMC TOF Proposal" process
Author: Patrick Williams <patrick@stwcx.xyz>
Create: 2021-10-20
Type: Process
Requires: N/A
Replaces: N/A
Superseded-By: N/A
---

# OTP-5: "OpenBMC TOF Proposal" Process

## Background

When the [TOF Contract][1] was written it outlined using Github Issues to t=
rack
"requests for process or technical changes, or solicitations for the opinio=
n of
the TOF" but did not give any guidelines on how this is to be accomplished.=
  In
the process of discussing the [first proposal][2], the overall feeling of t=
he
TOF was that the process needed to be better defined in order to codify the
expected process and to ensure community feedback was appropriately solicit=
ed.
This is that process.

## Definitions

* OTP: An "OpenBMC TOF Proposal".  Any request to the TOF should be framed =
as
  an OTP as documented by this process.

* Author: The individual(s) who write the initial draft of the OTP.

* Champion: A member of the TOF, confirmed by the current TOF chair, who wi=
ll
  work with the Author while this process is being followed to ensure that
  appropriate updates to the OTP are being made.  If the Author is a member=
 of
  the TOF it is expected that they will also act as Champion to their own O=
TP.

## Process

An OTP works through three (3) states on the way to adoption: Draft, Discus=
sion,
Final.  During the Draft state, the responsibility lies on the Author to en=
sure
the OTP is able to move further in the process.  As the OTP enters Discussi=
on
state it is the responsibility of the current TOF chair to find a member of=
 the
TOF to act as Champion to move the document along further in the process.  =
The
Author and Champion will work together to make changes to the proposal as m=
ight
be necessary as it moves to Final state (unless it is rejected earlier in t=
he
process).

### Draft State

Draft state is when the Author creates the initial proposal.  Any member of=
 the
OpenBMC community may create OTPs by doing the following:

1. Creating an issue in the [repository][3] with a title and no contents.
    a. The issue number assigned by Github will become the OTP number for t=
his
       proposal.

2. Use the OTP template for the proposal type to write a draft proposal and=
 send
   a copy to the [OpenBMC mailing list][4] with the title "OTP-N: Title" an=
d the
   contents being the filled-in OTP template.

3. Add a comment to the issue with the link to the mailing list archive ent=
ry on
   [lore.kernel.org][5].

4. Create a Gerrit commit to the docs repository with the OTP template
   contents named `tof/proposals/otp-N.md` (along with any corresponding ch=
anges
   elsewhere in the docs repository that might be necessary to enact the OT=
P).

Once all of these are accomplished, the OTP enters Discussion state.

### Discussion State

Any member of the OpenBMC community may give feedback by:

1. Expressing a vote to the top post of the Github issue.
2. Providing grammatical suggestions to the Gerrit commit.
3. Responding on the mailing list with opinions on non-grammatical OTP cont=
ent.
4. (Least desirable) Providing off-line feedback to a TOF member(s).

Community members should refrain from:

1. Voting on any comment in the Github issues beyond the top post.
2. Cluttering the mailing list discussion with grammatical suggestions.

An OTP will remain in Discussion state for the timeline expressed in the [T=
OF
contract][1] with respect to issue voting.  TOF members will vote by reacti=
ng
to the OTP Github issue's comment containing the mailing list archive.

An OTP will exit Discussion state when one of the following occurs:
1. The OTP is rejected due to the voting rules contained in the TOF contrac=
t.
2. The OTP is accepted due to the voting rules contained in the TOF contrac=
t.
3. The OTP is discussed at a regular TOF meeting and is either rejected,
   partially accepted, or fully accepted.

If the OTP is fully or partially accepted, the chair will confirm a Champio=
n to
move the issue through Final state.

### Final State

The purpose of the Final state is to get the OTP wording finalized into
languages that matches the intent and spirit of what the TOF accepted.  If =
the
OTP was automatically accepted without discussion, this might be as simple =
as
fixing minor grammatical issue.  If the OTP was partially accepted by the T=
OF
this may require rewriting large portions of the OTP to match the intention=
 of
the TOF.  The Champion is suppose to represent the TOF's viewpoint to ensure
that the Author and Champion can formulate the final wording for the OTP.

When the Champion believes the Gerrit commit adequately represents what the=
 TOF
had approved, they should comment as such on the commit and inform the TOF
members via Discord.  TOF members will then have 48 hours to review the fin=
al
wording and either approve or reject the commit in Gerrit as having met the
intention of the previous TOF vote.  An approval (or rejection) does not me=
an
that the TOF member agrees (or disagrees) with the proposal, but that the T=
OF
member believes the final wording matches the previous TOF agreement(s).  T=
hus,
a TOF member should reject a "Final OTP" if it does not align with the inte=
ntion
of the previous TOF votes on the OTP, even if they personally agree with the
proposed "Final" wording.

An OTP is complete when 48 hours have elapsed and no TOF member has express=
ed
disagreement with the "Final OTP" wording having met the intentions of the =
TOF,
at which time it is merged into the repository.

---

[1]: https://github.com/openbmc/docs/blob/master/tof/contract.md
[2]: https://github.com/openbmc/technical-oversight-forum/issues/4
[3]: https://github.com/openbmc/technical-oversight-forum/issues
[4]: https://lists.ozlabs.org/listinfo/openbmc
[5]: https://lore.kernel.org/openbmc/

--=20
Patrick Williams

--U/2MJeM3iQL4ls3P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFw7awACgkQqwNHzC0A
wRnPGQ//Yekrbk/7MKNE/8+EUPXKRaAG0ukh5jfO8iBPnSsh3FO7fHjVpcoKn4/X
9kEY5JlVp+12za1VlTYUVtCtI7/PUYCvY5AxkKk8awalEdfpt8zDBqV9A4ZlUaqN
Qy3A1bDjjZc0n+ooSp6rNZ3WzjKe8qNyNdCPuPDUISKGBOAdJ5USbghfGDMeC97D
c2tF5XLr2+QC8RKaDhL3YvqiAmHAt46ExKQNzRFXc2XzGSaNmcledJdGo2VhJK9N
yHzOxVMvFhH+u6SUsxM/EryK0Oo56RmrpLWN2bKUCoY1jpTVWKXYLa3nJuLAdUCD
j+6lW7C4QKfGW2qltyDSvX+KjkOvZTpnqc92XitlejvJreUSiKC/lpZMKhhb6W3U
MyLtda78MOozenNeO7wgpf7acm7LdQOlo5WGtL0+MgZ4YudbnAtqfmZJVPdyW2sc
6LKkN1toQRvUoveZhKR/vdEG9lUknpXSLz3dKXeeZgg6zLlCQOBx5iATR3aWj+xm
cl8Q0zFb/1iViBpvIlcTGOgaPa0y/VkeMK6RvRdYIS2FyIJVVEENag1jh1rFyPJe
81g3jzrkFt2ulXuPn2+YOPRNBOW6iokHwg0ruKcmpeuGisnTdv0tYhBFOWcNWQNo
2VuhZHNsTz08VAtgVbesO8v2uqpBb9fWKIqMxt53FUibgjUc6XQ=
=QpRh
-----END PGP SIGNATURE-----

--U/2MJeM3iQL4ls3P--
