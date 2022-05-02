Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B04517A09
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 00:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsdD85ftzz3bdk
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 08:33:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=iWnOnKke;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ZteagKx+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=iWnOnKke; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZteagKx+; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsdCf4rtdz2xRm
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 08:33:17 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8873F5C0136;
 Mon,  2 May 2022 18:33:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 02 May 2022 18:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1651530793; x=1651617193; bh=/ezx0K0lwV
 ymoKDzXaCSmB+8JaMut9Myv9Op8grj2Og=; b=iWnOnKkefW/kxz4orN29YqZxbn
 wKH21N5cWTd0PGuZ6sQdLWjD3M3IeXyg3LqJgJbTdVVsfonaA+2Fjn1HWbc8Ws1Y
 z0ZGNtTNN+5YbuocV7dlZsltN4WyPfcF25m/a4/EPSnKxsQiGl16kcSTnDiKEXvx
 rVX3xonF5we6mwQhukBI9k6lyUk5LtBkPNS+OZMW2SaNwPac9dWWXg7jANzt3dA1
 hgOzPDjMtpleDVlwS6qwnL+dDQJUANuWTIrKHK8D3ilI1IKEJvip0hyv+s7a2K4y
 zu3RDvfzqv33VdhPf+YtMS13dYIO0JY46ccfWCnAKrD/f2C0EBzrTrAYgJHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651530793; x=
 1651617193; bh=/ezx0K0lwVymoKDzXaCSmB+8JaMut9Myv9Op8grj2Og=; b=Z
 teagKx+CSrX/r53h+urkxPnmA/lGqnOrPE1wEF9qQPvTafL/+cSACBIIbnSOkNeG
 1G2f2gskDqtx4A0YkkT+uvPwQ6okBGZSCYl/qqcV5youp7eELdEGpJuFDSd36nzh
 XUbLvYrf+o0+Txcj0I7ZY24qFosH/x64hpOOZGEfyZWpyx1IRal/Z1T0lgW5yyTg
 HihOQTzkx9DJUPXFrkwSTSzlfYtAWArGwcgBAFSgUwFN+DTjY8VYvXobhXmWUBDx
 SHgcDopJH6HWZ1Ai9OBCfQMhXxGo7UL1L77AkAGUtGa8BEVZOezWeCaIqKEbgpnf
 BCf1LfkYt/nr/INREcrTw==
X-ME-Sender: <xms:KVxwYqsAZ-4iQ8ipvD_ziA1nlvEzwIYpqyMHiAxHG15F84KEaty4hg>
 <xme:KVxwYvcGDzz0VFdf7F1FHvmYzirlD0CFy9mY5dxcrQayZg0exWDmCfL0zLkhJLKSO
 -algjYMMxtCL9L5Fa0>
X-ME-Received: <xmr:KVxwYlw5vKd13E0NJrLKuf_eNHgcnRrzkFXplVfrXsXsxECJCv5zw3jgXQBzQuk5R2EXx5T7Mq9MgBoJaDx5ZZDTYIEhyszbFUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjedukeeifedufeeggfeffeehvddv
 tddthefhkedvhfeghfeuueeghefhveehffelnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:KVxwYlOAYHRGY0tqvQ_qVn03l0RKayBTPEHjyNEglQB87L0A4qMMhA>
 <xmx:KVxwYq_5KMOp7uzNmtjN-8BLtxXvuNfSMUQBqLZEYt54UGW92hHDkw>
 <xmx:KVxwYtUlAFkuhKyi3DzaP-pFRzLlE-IhXrdcBdPW-uFfpMsIHmoKUA>
 <xmx:KVxwYgkjeiRRLki0XBZzDJPVqdX_aBBJNiLeAbP5EnvRT3k5nIAgGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 May 2022 18:33:12 -0400 (EDT)
Date: Mon, 2 May 2022 17:33:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nirav Shah <nirav.j2.shah@linux.intel.com>
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
Message-ID: <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3LtYpAlHoIlE0EfY"
Content-Disposition: inline
In-Reply-To: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, nirav.j2.shah@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3LtYpAlHoIlE0EfY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 02:55:39PM -0700, Nirav Shah wrote:
> Hello,
>=20
> I am new to OpenBMC (and BMC ), so apologies if I am posting this in the=
=20
> wrong place. I have been looking at this=20
> <https://github.com/openbmc/openbmc/issues/3383> issue.Here is my=20
> summary of the problem statement, please do comment and let me know if I=
=20
> got this right.
>=20
>  1. The biggest challenge is the use of system bus and non root access
>     to the system bus.
>  2. As previously suggested an ACL based approach can work. (whether it
>     is using a D-Bus ACL configuration file or SELinux)
>  3. However, it does require an exact configuration to cover all
>     security scenarios (for MAC) and IMO =E2=80=9Cmay=E2=80=9D make debug=
ging efforts
>     harder.

I don't really think the issue is session bus vs system bus.  There
isn't really a significant difference between the two.  Just moving
everything to a session bus doesn't solve any security concerns.

> Coming from a desktop background (which additionally uses D-BUS=20
> session/user bus for user isolation), I was investigating if having a=20
> session bus would help. For OpenBMC, the idea would be to allow non root=
=20
> application to communicate with each other and with root** applications=
=20
> on a single session bus to begin with. This can be further augmented=20
> using ACL based approaches if needed. I have a small POC, which tests=20
> this on OpenBMC with D-Bus broker

What does moving everything to a session bus improve from a security
perspective?  I can't think of much.

I think the primary concern is that external-facing applications, like
IPMI and Redfish:

    1. Are the biggest attack vector for being compromised.
    2. Once compromised could do anything they wanted on the system,
       including on the DBus.

Moving everything from the system to session doesn't really improve
either of these aspects.

=46rom an ACL perspective there is similarly a large surface area of dbus
interfaces that these (especially Redfish) need in order to do their
primary job.  The ACLs likely need to be written at an method/property
level within the DBus interfaces and this is, frankly, a lot of work.  I
suspect the 'best' answer is to put decorators into the
phosphor-dbus-interface YAML to be able to generate the appropriate
ACL configs.


> I am happy to start with a design document on git hub and also make some=
=20
> code changes, but I had a few questions.

Code contributions go through Gerrit.

>  1. Your views on, if this a workable idea?

If you try to move all openbmc applications to the session bus, most of
them will work just fine.  A few of them will need secondary access to
the system bus because they operate on upstream components
(org.freedesktop interfaces) that only live on the system bus.  Anything
that initiates systemd service operations would certainly be affected.

>  2. I am hoping I can isolate all the changes to sdbusplus, sdbus,
>     phosphor-dbus and object mapper. What else might need to change?

sdbusplus already has functions to request the system-bus or the
session-bus (just like sdbus itself does).  Some applications are
currently written explicitly requesting the system-bus and some are
written requesting the 'default' bus, which is system for root and
session for non-root.  I was mentioning elsewhere recently that this
inconsistency is a poor situation for unit-testing as it is.

>  3. If I can make all these changes, I was thinking of starting with
>     BMCWeb as non root but since BMCWeb interfaces with a lot of daemons
>     that would be a big step. Any better ideas?

If the only goal is to run bmcweb as non-root, this could probably be
achieved without any change at a DBus level.  Use the systemd magic to
run the bmcweb service as a non-root user and add an ACL so that user can
access everything on system DBus.  This at least limits the bmcweb
process from accessing kernel APIs and limit the surface area to just
the available DBus interfaces.  We can then figure out how to further
limit the DBus APIs after that.

--=20
Patrick Williams

--3LtYpAlHoIlE0EfY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJwXCUACgkQqwNHzC0A
wRlqvQ//RXrZnyZTseSq7qUqgF5H4Gv/ejpsEAUpM9vxl34OoeZQuj3A8LoSvje9
SQcFte6EANx9JG1O4Lw6ncUiQcnurEH2w6v0C5ZxsDIDvQIJT1Y0XcnKBZvhkmbB
XksCwCM6JlptNKBwYn111BuHumfr0U5M+dfDYsCS7oJeMyXUxtokwelQFzS3x7hE
OKw4VA2Q+MC2j9HIH2q9TjzcsAZJ52Udoipivx3ulOkVlaaJr+MRZLNCq+PtJh2p
fjYENSz09/ng5Kq9KjBG7UO6Hcn7gOk0k+QSHgf7aN06e+BtLY7UF6ELfBBsXCxc
vlGeqd0nYcndonAdRG46Bf8n2VaTSyTSoWobaGkaM6EJ4l1jHbkxn1JLhcrU7UkR
rUyIcm6GlqNUTKlSBZIruYAvOElQaFbqclorRe5Jwn3s24Xm8wcx4ExnYyC0mOWD
IOYuAtZzPPmq1dccHe/lf88WaqNpYP1M6K75v+/4+Dn3QSXVV02EEY70/1ivC0hO
Mfl3807d2WXiL/+kM2Oa3/AY6mING6y18ZuKkcH6RcjNANFxesAhEcUKbXzqN/tc
edFagwSYJskOcm8G5UvCYvaLzPYTeiFPsJ6toRs4C704D6adwpSGpkk3G/xqkz06
JJVI5G9PrGxCdka6GkNXrRsNxnUgY32duJjZZcbmVozCxLzFI/A=
=5OlM
-----END PGP SIGNATURE-----

--3LtYpAlHoIlE0EfY--
