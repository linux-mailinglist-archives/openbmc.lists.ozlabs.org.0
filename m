Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD03556E51
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 00:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSyQv2s1wz3brX
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 08:16:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=hsqB1ySI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KGLb4bZA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=hsqB1ySI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KGLb4bZA;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSyQP17cYz2yL6
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 08:16:11 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B43425C00BD;
	Wed, 22 Jun 2022 18:16:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 22 Jun 2022 18:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1655936167; x=1656022567; bh=m9+NeFDWNF
	0v3ziDY4Pp6zkiF/j7+NOEJNsc6xmdU4A=; b=hsqB1ySI3JqxKjVqCEIWtmOlXi
	g9QVZiOMKk4GkrGyRzWGRuYd9qoEaJfZwsTrZGMmatXB/LexsEFOaSOiBP8dLgHp
	p62PAV2FKVeat5vrJCPngcMVrUvdJnGfm56kTVUgDZk8bfzh+sFg+4DwAQ21L806
	s32aLGjCFph+FyIjh08JYOZfEGZ4H+EDf7W78W8eR5hhDdWM39Wi3lBiAkmhhDh6
	QknSWaGYeDDLia8ROame41u86GHoJ91tz0t6dkO2QF/l+XCV+/KwrpZN1HqNP029
	f4+g0WznUDfbtPfQdIUKTAq2PWpUTiMneE1nW4B9IPH3EqooPZ2Nrm20Nxdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1655936167; x=1656022567; bh=m9+NeFDWNF0v3ziDY4Pp6zkiF/j7
	+NOEJNsc6xmdU4A=; b=KGLb4bZAC9dfTKlWsb297loyQ1LFrJQ9+7NqCz8Hl7AL
	X6A2IU8khLxAaouRMetnHiikNmIV35Y3czRTR05UPHnUD8DTNDupzewXdIq61ItU
	FeLvMCCOGUAHhABIsRZ+Y7N4MuPBWetmz1np8kqbppyNjRGfrAp595VHm7zBtmKN
	EKr7zIdytQS0hKz40NHq1GL1bd7UDZmR+az7Pp/Hjfz64Kc4+TObzzqiXGv2MJ6K
	q57OSnzCMIO2qCGK+I4y5d97Z8cX3cgNHWz/6T2j7VQW8hcDXuQQ7vXEq65VTAa4
	MEIo4bcMF263dr0sXyxXwEEUnO9QLvlvInDyKjRB8g==
X-ME-Sender: <xms:p5SzYi-_jlymwKf3cy1MOXHCJGPc2lbU19bRZYGSp5OGzhymesprqw>
    <xme:p5SzYiu91fH05EmubefPtI1VNsnjYsLLKQomlykCCHj66P1FHcwWhajvBAM83AraH
    -rbVH8Ea5rc5aWelt8>
X-ME-Received: <xmr:p5SzYoCF-qSxK5TfcWiq_vLhTklr-0Bv6qi6JBNdrYFoVrKt2ZqWUXgZqtb5E1n295_Lv0BO-pX6KhxNjdQq7a6Aoe8HxoQ-lnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefiedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefgvdegffeiheduudegheegiedv
    vdehveevheeftddvvdefheeludekjedtkeeuvdenucffohhmrghinheprhgvughfihhshh
    hfohhruhhmrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:p5SzYqdDf6lx6McGN_C5Wv__paz3EhJ4IclisNDbCqC0E4mpX09-tg>
    <xmx:p5SzYnOcL-6ahRLm6Pvsqe_DIHvL4WV48zERVj0t2jKm3ULCEeZitw>
    <xmx:p5SzYkmLv6V1R_C6awcAqPxuDZeyqsgjwyhCNZhmEnSlpo62KiP9Pg>
    <xmx:p5SzYpXSAtGXpOYSZd3RDvirV3qcQQNskC53Xe_e3MdScr7mInhQQA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 18:16:06 -0400 (EDT)
Date: Wed, 22 Jun 2022 17:16:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday June 22 - results -
 BMC-attached TPM
Message-ID: <YrOUpSSbSjvMkN+m@heinlein.stwcx.org.github.beta.tailscale.net>
References: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
 <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com>
 <YrN6lkOgNMNCoJdM@heinlein.stwcx.org.github.beta.tailscale.net>
 <cd907039-8b9e-51b3-a672-c079f3e49233@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tsDPHOqclI5ZnSNS"
Content-Disposition: inline
In-Reply-To: <cd907039-8b9e-51b3-a672-c079f3e49233@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--tsDPHOqclI5ZnSNS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 04:23:41PM -0500, Joseph Reynolds wrote:
> On 6/22/22 3:24 PM, Patrick Williams wrote:
> > On Wed, Jun 22, 2022 at 01:20:48PM -0500, Joseph Reynolds wrote:
> >> On 6/22/22 10:19 AM, Joseph Reynolds wrote:
> >> 3 Measured boot
> >>      Enable network agents (like keylime server, possibly the host
> >>      system) to get measurements from TPM.=A0 Note the measurements are
> >>      digitally signed by the TPM to ensure their integrity.
> > Is there any work going on to define some kind of measurement schema in
> > Redfish?  Last I knew this was absent.
>=20
> Thanks for the reminder.=A0 I started a thread for this:=20
> https://redfishforum.com/thread/685/support-bmc-attached-tpm

Sounds good.

You mentioned there the "TrustedModules" type.  It doesn't seem like
this exposes measurements currently?  Am I misunderstanding?  That seems
pretty important for our use case.

--=20
Patrick Williams

--tsDPHOqclI5ZnSNS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKzlKMACgkQqwNHzC0A
wRmvzA/5AcKQWxH945PSPTPdKgKpZC6E+IhCTsiD4O8O3TJCxVDgZuqTzzQM46tA
IGi/Oi2JfGoX2glcI56z+PUqb/iC9q2zWWO7lsTkgi+zUqwxHZdSnPJbnZhWdJta
VJyRebAaBTgWI70PTA4io0UHPeW0+Yp5b/QmCXYBbdiDF5e4Rlsjf7GbB0ZQs0Ua
mLtH9cANEYBpxJ/gdAVSvcfLTjmVdpGNitux1AwlQBIocVJXU8UkiRbgNky+TlUK
0JlfRfG/UK18I3QNmBd4oDCSN1FZpW1AzrFKizfAi95Buv6HpE/3AoaYxLrPwZKa
JZZ63YDPS4mf+jyIK1Nw1XpX1FY4GY5nFYIMUWSkYvRZwUXYoPK/zTjdN4xDuVWg
/qBBKODMGjrortcFhgqMSM+VMjfj7mXIHrVCsP90NnhZa8HAO5N0qsPwTuvdqDIT
400VhXHyrS87/opJRosPeTofcfwwfnJkCbMNDYqXhMkUsRzx96Euid6REhDxDtO7
O5obGeiw7TrNjqdXBMRq0Ch096RbKa5mwQH9x7PfycORfR7YNXm/euWUekVMRW3T
oNiKeQ0aOO7GbMJMS3mSmD4trgG6KsvMItyaZ8vLI0DPtKzRC0opfjVD8BD9WtMX
KCMDGtp+94m1meDkXUAUSM3irHsi2EY4/82WJT/Ob0xzcFVw86c=
=cHAG
-----END PGP SIGNATURE-----

--tsDPHOqclI5ZnSNS--
