Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EC370258
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 22:45:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX4B42z6Dz2yx6
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 06:45:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ZRV9YHgi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Dk9XVLhN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ZRV9YHgi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Dk9XVLhN; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX49m2wt7z2xZN
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 06:44:43 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CD3601BE4;
 Fri, 30 Apr 2021 16:44:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 30 Apr 2021 16:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=YvI5MgdsoGQb5r5dk7SSzVkLNxP
 yAVSra3Tq3PJTYyg=; b=ZRV9YHgiaYx1/TkDymoSTVd46B9IdNvi2+RZx1XAjGV
 /yZAHCi1+E/h0PWtM0vzKbfgv3lPgLo12Zfj39xlJRBsaBur25wBdyDsYh0gMR7/
 yiKYBfKr2h1Hqvc0w6yJKQubk96nL+z0xVuBhHd62xI5+Fb6HxHFLUnbKB1etCYx
 WRrdlPUzIG7FjTLuSuF7De86lHiupJpha7jhYjFiJMypZadmpEfTlJmiB+GqLYCO
 weoOLZ1zWNp09BZWCBitl80kTdenvLN7M7crX4PCJaWTLWe+2nak9OpFpwnr56RQ
 /NKWDWTJnHyqi5Cprqx/6awBeiMmAnMhierfiR6BZKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YvI5Mg
 dsoGQb5r5dk7SSzVkLNxPyAVSra3Tq3PJTYyg=; b=Dk9XVLhNDcIMFhnuN3g1yI
 wIcnsfRKq7bnbrKnLcC7zi9q9ji/5r+Zimqah0NJxe1jc5hleYhpCSKV6AaADJoI
 1DdzGpxvPTa9ser3dlEfjqW3DqOtCOoQ4L1uwFWnpQDA3HEkCaj2YAZHeKGgPolb
 eflf+afLVOVpt+WNsjDeNHvi6v0j5Ozjf4hpMJWgpUpjWM76owIsmw0rR5xKfPI7
 D6fav99C11K38SthDEweNCfPk0LfjVSyGyXMbbZSq3d1TFnID4r5F+XkTDQKtxBu
 rGLCMPyrUWWlBfnbeDPiMX63gMF88KU/vXJ5QOepabA0JOAtF/XZdSu9fM47/pJA
 ==
X-ME-Sender: <xms:M2yMYG_HQ7oIudMqHSV3HgJ0DakFegVehCByuigwND7AkRXzbw8xYQ>
 <xme:M2yMYGvAU5iUEBuW0XfZMOL4extfrmetld1ILSn3W0zq9QRwojP1aOuvOwRBqCja_
 QWqao1IEFaRxE5gAA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejheevvdekveehlefgheevvedu
 ffejveekgeduhfefhfeitefhjeelgfetuedtleenucffohhmrghinheplhhkmhhlrdhorh
 hgnecukfhppedutdejrddutdejrddukeegrdegieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:M2yMYMBnjT4oO6X5xeIbLMato2akTeubYvpfvfMEjj2xhNCuW2cepw>
 <xmx:M2yMYOcYTxcZgkWRvBkYkiDlui8XHjNrzZ8f5xy6XJDqRvYmombROA>
 <xmx:M2yMYLPoRIALdwCoHcwXr9wqC6ZongsBzUqr5WSHTu6jldFGgV9tQg>
 <xmx:NGyMYKZ1iVtao8g2Fcd-Ixc8ndH8msnxMU36uL9SkTtwPRj19XG-Rw>
Received: from localhost (mobile-107-107-184-46.mycingular.net
 [107.107.184.46]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 16:44:35 -0400 (EDT)
Date: Fri, 30 Apr 2021 15:44:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jason Ling <jasonling@google.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
Message-ID: <YIxsMQdhrkg7PYlE@heinlein>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein>
 <CAHBbfcWK3nRA3j96EQW38FYJ3gBtn2rkEZLrgGrrwTCaU=Reng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bM27c0E53wVKnOZL"
Content-Disposition: inline
In-Reply-To: <CAHBbfcWK3nRA3j96EQW38FYJ3gBtn2rkEZLrgGrrwTCaU=Reng@mail.gmail.com>
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


--bM27c0E53wVKnOZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 08:45:14AM -0700, Jason Ling wrote:
> On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:
> Whew...took a lot longer to find the thread but here is the explicit
> rejection of firmware and configuration upgrade from within the kernel
>=20
> https://lkml.org/lkml/2020/8/7/565

I feel like we're not really engaging well with Guenter on some of these
hwmon/pmbus use cases.  He rejected it but there was not any response
=66rom the author on why this is useful, or any engagement on how we
handle this.

He said:

    This should be done ... in a controlled environment (eg manufacturing).
    It can easily brick the hardware, and should not be done in the driver.

We do upgrades of firmware outside of manufacturing all the time.  We
need to engage in a real discussion with him.  If we are comfortable
doing this, why can't we do it?  If he is worried about other
environments, like a general Linux desktop that happened to hook up a
PMBus to a power supply, then lets make it a compile option.

There is other firmware update support in the kernel so the "possibility
of bricking" is not a convincing argument to me.

> other things like don't put in ioctls
>=20
> https://lkml.org/lkml/2020/6/24/830

Not putting in ioctls isn't unreasonable if there is another way to
accomplish this.  In general, adding ioctls seems to be a rare activity
and there is a preference for sysfs or debugfs interfaces.

> I suspect that things like adjusting voltages would similarly be rejected
> but honestly we haven't gone down that path yet.

About two years ago I was able to modify the voltage on a VR using the
PMBus subsystem and a one-line change to set a sysfs to R/W instead of
R/O.  I didn't contribute it upstream because of [reasons given by a
former employer], but it doesn't seem non-doable.  Again, I think we'd
need to engage if we're rejected on first pass.

--=20
Patrick Williams

--bM27c0E53wVKnOZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMbC8ACgkQqwNHzC0A
wRlz/w/9EvJ2pYNu2FcooPiMx0lqgtOWKWasRlpQ+MbJBu/YGci0mi/OMjup8QeK
52HH2rZbRGYSXlOQZnnMkGI0FuwzoTOfuV0I7FHSJC2A9y54gJsbd5d9Xs0YdHhm
zsfPIr5AjApEszrAdW31yrfHFz5yg78n8eOBwZfOdtK+0Y12cU1C/d7TyvQIDptY
tjknhJ/T7aicEtK7lQHSQVMeSNs9ZG/lLbD50/KHS9I7veT9GTmWd2iblGucphhk
aJGp14f/RxuDZ9V0I86OhW1jiuQERyx45ZVsnCCDOjpnOlrl/lhH+mglS7gUozH3
S7dIRIoE4/M9vlbcNY7QU9AUqKxz7qxKRgxvyI4Y8AbfyZcv8P/hWXwuoF7eHOYp
oYXvq/FTl3pHeXZg7dVlkW73vAgDf72WoaSHnNVhqyJHnqVRPhUzpNSmftkJT/VI
aK02gVdXDOgg+izpyeBpXQ5KyrCvj8cVaLP+rOPhp1mnq+3b852ZIaOZUI/h8BLt
p90gCivGHuz/cRQ98q3Jvx/5XioMIgkrEv7q9AwU2lEv/M4Gqo8TVxC/zctLbrs/
iHLsnktvMo3XOfbbRPRU8sZvEldhgMe4H6JegDtDZ2rxmH+Df6npdtxuNrVcpvvH
PtEzw/0Gqm1zaErgydbDBuHcZuQFOFXXytobfPGWqucyGagjbsY=
=JiuG
-----END PGP SIGNATURE-----

--bM27c0E53wVKnOZL--
