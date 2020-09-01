Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39515259815
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgsml14Q8zDqN2
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:22:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=hVpGKI9r; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=dpGDvRzV; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgskB2vJ9zDqTq
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:20:32 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 841555C01FC;
 Tue,  1 Sep 2020 12:20:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 01 Sep 2020 12:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=X4XuznxP6iFz+nLtJmcjSAdaTg4
 fi2iBLSexJF6mGlE=; b=hVpGKI9rjGkFYp4jO/zgXQ/iz4Qvoqn8zy54ud8TPD5
 h0Jj7cHAsDkRKCRrxc+XoBaQUQRjKmPD3rHbi5D3mD2dog3OQTnb8Y6herJoH064
 gbsRC9j/i4jeFUINjeWuGWQzCiQZy3PHti62eXtgz5f2z52Cg45AIltlM7gq2uuj
 X2goHfqErX59nHcWnhPDClHUCbWIKmf8YlwSuwly4wc2oHfsvXhfT6PYF8P5lV/H
 4xOJTbeU94OcYJZgod57rJlhxplyQesZ9kZmXE71rppgR0PnVOUjQFtpsODtfStG
 WDevvOblU8uYE3E49XkHyW3QMI0bEGy6oazCqgHA6Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=X4Xuzn
 xP6iFz+nLtJmcjSAdaTg4fi2iBLSexJF6mGlE=; b=dpGDvRzVYe2gTs3B4k0WW9
 UZkjFrunWku6PGCKxWophYh9510BqVyTL63OpL7A4wWuXArNfBhPLznfhEayizAk
 3P1sW0G2hT8K61bNXsvKHNh1S9Jwh4a6SeQKcIFD80S3T9cd9lFcXdeibIdgNcaD
 Tcux1Ob0Li0C5OTzBVN4q3Ostq32o5io0H3dqu8XyN/GQIXJAumVB+YcT1zO2Nvx
 ATuSZnUjcB617YGbp+2hZ7aZi9h561tpv78GJkVeHuOpqnlZa9A+uqBZeWfmQsoI
 WeARw5Cz5r9j3ZWCMhjXXOvOthn9gWGoIdOhRBNNyD5HYju+y7lZwso4ipfhQbBw
 ==
X-ME-Sender: <xms:y3ROX47jB7O5zjw4s77mZf2xBqX0oqjpUdlMNOsP-9rd24E9CbSxPA>
 <xme:y3ROX56Tq4NPCctLOsgyZChtu1UEzEH1bfrOcIFRG9e43cZVOL5rM0L1_dr3FHslG
 GLoXvIenwJxTxjcW5s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepuddtjedrledvrdehjedrfe
 ehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:y3ROX3cmtkdHN1JEvjltw4VbsQvYH-bAIpnIPa27eF5PIJJh9d2VRw>
 <xmx:y3ROX9K2tBskR5q0KRgpgz9ADON7OCPRuAO2IsvkXKvV1RqMtpJ9JA>
 <xmx:y3ROX8JHDgqXj3AgFpqfIYd-JbiDCFi5jyKIS2TOILL2Mz9i_xBY0A>
 <xmx:zHROX2z73gAki5EX4XCBWm2YhddzmK1Y0tKDvGSo3wP6135on1kCJA>
Received: from localhost (mobile-107-92-57-35.mycingular.net [107.92.57.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id C82E230600A9;
 Tue,  1 Sep 2020 12:20:26 -0400 (EDT)
Date: Tue, 1 Sep 2020 11:20:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: When building OpenBMC . . . ?
Message-ID: <20200901162025.GS3532@heinlein>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8DtChEGCcMdSgkU2"
Content-Disposition: inline
In-Reply-To: <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--8DtChEGCcMdSgkU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 09:09:33AM -0700, Ed Tanous wrote:
> On Tue, Sep 1, 2020 at 5:26 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > On Sun, Aug 30, 2020 at 10:02:41PM +0000, Bruce Mitchell wrote:
> >
> > #2 should go into either meta-facebook (or the underlying code
> > repository where the fix is needed).  These will be common for any
>=20
> +1
>=20
> Could we also make the statement that as a project, we will enable
> every platform feature we are able to for every platform by default,
> and if a company wants to specifically disable some features for their
> use because they haven't vetted them, they should do that in a
> specific distro?  Said another way, the "default" for every machine
> should be every feature enabled, as that's what helps users and
> developers the most.

I think this is where we get some conflict between, for lack of better
words, commercial and hyperscale philosphies.  We may make a decision
that we don't want net-ipmi in our datacenter, for security reasons, so
we have it disabled in our meta-facebook layer.  Yes, we could disable
it dynamically like a customer of a commercial vendor might do, but it
is simpler to not even have the code in the image.

Today we've combined machine definition and image definition into a
single meta-layer across the board.  This is probably reasonable for
a single vendor who designs their own machine in-house, but is less
reasonable for cases like Facebook where we do our work within OCP and
others can order the servers we've designed from various ODMs.

--=20
Patrick Williams

--8DtChEGCcMdSgkU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9OdMcACgkQqwNHzC0A
wRnYrA/9F3S5RZaFcrcRtx2IdiQudeIR2yxSFA9IYoz4nmq/IZsEo+qzPQMZeHMZ
g5KNo61J5QQuV/M/q7aMnj+fc78SxM0ZM/ql61hnIjgM+fvSLCeOsE2Lqr21rL8x
et6g8RzypKZDkRWRrd7b2N4bJMWy136O7ypcNknzJk8plKL1Oesm2nADcGvrryNZ
FKa/n+efkJLQ2ic16SlmK5VFafYKmyL87jMI0ZrhdWDxw0/GdcsG2eIfbRoudMYn
sKhgZ9mp9TNLlgR2d8X6j4gI5Ccp0CqyRScfwaFDRzpzZgnZIZAYgGz4NFaFQUoL
jGpHpo2tgGRDiST24YxBNzj7/aocCrrHw5qqVi+Ize40fOui86Z/wmv+HsSkwEou
wHSoiBtYVvsjfjjHEqYCZI2Oh+oHXRiBCthSGxiew9AUbhG8VmG5fKip/lEa8On8
usVZUrk3fi6d+wxOxoWpKx3YdWCzXA6C5ah3bnJaarc/NHz0YYtXK8X5oSyYNpD5
vAfJHsv57HGzSfeLYmk7h6b9tks1LZmw+7HRubp3emRJKXKsey04JEwjReRR83fR
x89LU0Ufeic1bVlwXmCUvkOGmGWvJ/VluhFEnRHPBJiCfmi+X2muHU+gGNeoMspF
8Y4wuWqKmQGT1smCvn9r7lyuEt4tEx2/SL31U4LyQrksPICWFNE=
=7lFn
-----END PGP SIGNATURE-----

--8DtChEGCcMdSgkU2--
