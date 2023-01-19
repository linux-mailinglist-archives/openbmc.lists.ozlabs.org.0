Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A2674651
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 23:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nyd091FgTz3fGf
	for <lists+openbmc@lfdr.de>; Fri, 20 Jan 2023 09:41:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=weFDpV23;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kQa4+VHi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=weFDpV23;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kQa4+VHi;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyczT5fWvz3fDT
	for <openbmc@lists.ozlabs.org>; Fri, 20 Jan 2023 09:40:51 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 1CD1B5C0116;
	Thu, 19 Jan 2023 17:40:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 19 Jan 2023 17:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674168047; x=1674254447; bh=uhGJdZ5sO0
	p3ZpfAOFbPGkUtLjyFEMvD1wfn5olJHBw=; b=weFDpV23lXvSLAjMCvVL0nE1BD
	s/4i6JxZCd0ViN3EWxAsnLNyXVU095I+atsAcY5JNZrrHDNgL/bVhgg7fZt8Yhvd
	UN2Krd2zBTRcJuOs/1hjPXSFqzmJQibGnHrd1r7nyhltr+caFhGCCD1gsc4IHjyp
	RNJ04SqXaeroy3NUA+Y+AQ2743JPdrM/NU/buimyKndeH6A47rEBk94i+yohMpMe
	8OxrYav+CJPIhVVNq44CkBKZRTI79nzpk/GbE4bi1TCigEmuNJFnowAE1FnCYryV
	fm7fUBC2W12LKUCYJOzxR9ij1k6EErivr7cpBHBOOtuM4N0alThsWAlSqJtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674168047; x=1674254447; bh=uhGJdZ5sO0p3ZpfAOFbPGkUtLjyF
	EMvD1wfn5olJHBw=; b=kQa4+VHinxN5ADfm1klUmCLzPVCb0+96uX1EB66Y4/CJ
	uCHGC2lySDpqOjRkoqaVd6uS+NZn6jB1OUEle50z17784xVEPeO/aKe4P/jLC6BV
	V/AuBqZIEcCPav1xrT9dqKLRir2rvJ8z1FFd9RyQczJxuwR3p9uoJ/SUbEpVeHal
	VHMqF2/hWM3PFW3VZQ7EAmXS0s1b36XLN3W/AmQjO/R48vL+7IV0s03rVOJd8rOm
	wanmJ/bntInfwPpvajJdCsAfThQn4QjhTsgDXdzmWc4idAEq6cpb55ZHt1nMk3dl
	SpDk8Z0SwnColkGRoO9QxX2t2KvjouvdZoqOwYFmZg==
X-ME-Sender: <xms:7sbJY0RqsWzDZzKBCNBpl2dpzWGWAkVvuCbs2XYbvC_JpRtdMR2MQQ>
    <xme:7sbJYxxzqeMIfIxJ6dTWWKdVrePTg7-h790-GTxkV4wsiKCj1hu4dnuMcJfj8VZyF
    cf5vsOvExkTbZHeRSA>
X-ME-Received: <xmr:7sbJYx2DwYk2bdgq4wxqYaIL6N20vhJH5kw55SLibm8hJunH5b6QubX5Oq7TYD-WTYudrd-PD8-5r7VpW-mPtZX-x7g2VucuTpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:7sbJY4BN0MyNqS3REGmPLts4q9ln60hwCVdqHFhd0dfhLCY-CCQFuA>
    <xmx:7sbJY9jDlQhE0Kv3EVGj9Yg7zlqNqS1e0RGknAmbcFebVNtEvXOp7A>
    <xmx:7sbJY0oPv5FN0-PtBDBe9xnLjDX6BQkmU6UxeE-UFXQpqqCn85RXbQ>
    <xmx:78bJY9IG3xArws7A3HJUV1i14FEWgy3umyG75ePAkojNSE67OEqXsA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 17:40:45 -0500 (EST)
Date: Thu, 19 Jan 2023 16:40:43 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Gleb Semenov <g.semenov@yadro.com>
Subject: Re: Add UDP transport for rsyslog
Message-ID: <Y8nG62pR3PMkhI5f@heinlein.taila677.ts.net>
References: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
 <Y8fk224rJX2lqKhp@heinlein.taila677.ts.net>
 <c3a699b2-c259-fd5b-36fd-6538b295e4ce@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N3HgB8MBb5V/RwhT"
Content-Disposition: inline
In-Reply-To: <c3a699b2-c259-fd5b-36fd-6538b295e4ce@yadro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--N3HgB8MBb5V/RwhT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 01:15:52PM +0300, Gleb Semenov wrote:
>=20
> On 18.01.2023 15:23, Patrick Williams wrote:
> > On Wed, Jan 18, 2023 at 02:36:15PM +0300, Gleb Semenov wrote:
> >
> >>   1. Modification of the
> >>      xyz/openbmc_project/Network/Client.interface.yaml interface to add
> >>      the protocol attribute.
> > You may want either a separate interface or a separate path to identify
> > TCP vs UDP (Network.Transport?).  There are enough users of Network.Cli=
ent that
> > you probably don't also want to modify all of them to have "TCP".  Mayb=
e we
> > could set TCP as the default on a new property, but I think most protoc=
ols only
> > have only a single implied protocol, so you're now forcing error paths
> > onto all of them if "Transport !=3D TCP".
> >
> > Make sure this is done as an enumeration.
>=20
> Seems You are right, The semantics of the "protocol" field may be differ=
=20
> for different services. For SNMP, for example, the "protocol"=20
> specification means a pair (transport, SNMP version), rather than just=20
> TCP or UDP. So distinct interface and path will be better.

Just a minor remark.  You wrote "interface and path" but I meant
interface OR path.  As in, one of these two options:

    1. Add an interface such as Network.Protocol which resides at the
       same path location as your 'rsyslog' Network.Client interface
       instance.

    2. Add and document two paths, such as /.../rsyslog-tcp and
       /.../rsyslog-udp which both implement Network.Client for the
       corresponding protocol.

--=20
Patrick Williams

--N3HgB8MBb5V/RwhT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPJxuoACgkQqwNHzC0A
wRnFdg//UAh5w8TZDK2UkrQSJRDxqvuoGQvmBI1p3nrKHB7jLwOvS6JUuJNkMGm8
V1S1bZ/skzwkVm67hVgj7sdTxrsSn+KjlaIK/aSVWedOd5AiBXrsnkidEQhjJf5U
92Jwwq7+M1ccfvOW6bO2HX+4nU5nak1UvZtXFqRm970UBZJcZLKA/OmRm888TMzp
066z5gfYR3bGGJP4K+sR+ryO/RdLB+U+cusnC721hHE3E2XHaogucBEE+E8c2UM+
TtIM+qev06+MQWkRYPDgzAPdrUTGqj5cpH8+pfULtZfTSIUPmUpg8gzyn/zQx+T6
t28a8SzIcmwe7dIGRs1rGu0kuvSGGAmbvQHZf+lXlgFLAIm9bxe38mk1uFS81Fl3
CwV1QCxuoR2OXWAoAjk/bBo0J/TfhK6VovK5341cCPnZHaz3HgjVQC8wGDPwAThg
rqyiDySo7SEQNhOeklhguWcJZhjGo72h/c+2faAg/WVGf2I4QfN5LjP3VnncYRdG
+K3ahw06bSzj79mfeKmBbxqqxFLOGeEFAMZLGvYIl8wADIXZraCQGq8kJEsyXJj1
jLvEJy7Q2J+5kTM7vaTgHsj+K/Dgl7l0yKmwMKEJP3vvRlBPzj6VN/nOG5y6G8k/
YIbfdyKnaznIzmX/N+rYXp/c9mHs2900FrKvDjIoPSCG16CtAmE=
=EHJi
-----END PGP SIGNATURE-----

--N3HgB8MBb5V/RwhT--
