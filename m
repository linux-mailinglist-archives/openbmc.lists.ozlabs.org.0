Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645137027A
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 22:54:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX4PK6fZcz302m
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 06:54:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=YPoiQgkw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EmFYPamG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=YPoiQgkw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EmFYPamG; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX4P46Tj1z2yZ2
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 06:54:32 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BB1751B36;
 Fri, 30 Apr 2021 16:54:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 30 Apr 2021 16:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=P9c/gXbwObHMd0MMPY8Odfm6vUk
 7O58gefS/ijfb434=; b=YPoiQgkw0ONrb8Fyak56oAwMwbGa4kAk0iGK7Pcge5T
 0oHnTFQerLVZbk8GLxJeCGSXwoQyWlM/9YBu40fAReBNJS+Ro9ezUw5miicylqy0
 xGVVACL0EqhvTgH4Etg2UvypPUfDuFnRptLi8SPTflilFX8iPopnFXZhslMhULnF
 jSk8KI6oYZIl4mGlS6DCIpMDJ6SpEcLdokaMeRtVErcX/03AFn+cTT06EfO+tCYp
 52BCk4NJoHGP8gz9VMoaRVKZhcesVXY8+YtnyCFpbs9hgZrZRDrfU6CCOw8xVPv8
 MJVLz6HME8WlrqB1cCG5W756qNp+wjdvtKh8+RCRPRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P9c/gX
 bwObHMd0MMPY8Odfm6vUk7O58gefS/ijfb434=; b=EmFYPamGaK0/rvp3ml/nXI
 9tQeDaR8J91peXflu4iVL8gy2NEsLfUw0Z9XI6PGPj6OmzX2Qm/G9VeqUclrnNln
 r7gS7WcqZBoTrGIj+vzEVwH4QsVWC+bEBCxka4SoM6/8sk07+XnIvVz/q38AJLvN
 p7JrSRQoccgLwM9hWwUYejPeVotLYJoAfpGSNQroGsBrAGuUubkU03PnN+LNysH5
 MMOyoyLhuibfd60NyLEonsMU0SW20D/No2e6iS7nE6GEIcl/fKw7Crg3u4+Smhbu
 Yp2rfcxkyWB2OTTGHRdMxxB8EctqLqM46fCMwMlJwAV6X0OCusx5/DomvN1mYyQw
 ==
X-ME-Sender: <xms:hG6MYPh7JldmTByPqu_oQ3Av6YHgGT1yvahFHzLRJxaaYeC91aUZLQ>
 <xme:hG6MYMC0WU8VxDko53Eqns2fWMtCe0RnDSrPm86QfrWA88KBsnrcH-0ks3LUVU6tk
 AckMKpa4o0ccZrfS78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdej
 ueejieektdetheelvdfhleehkeegvdeiveekhfenucfkphepuddtjedruddtjedrudekge
 drhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:hG6MYPHN9nnZBwymjbyHW0ahY7YpT19FlBFkt5gWwDtPyBvA-2iZHw>
 <xmx:hG6MYMShK8j3oFUgkFL-x7cglpI3EUBoAchwQIwBh8grCA_fdc1LZQ>
 <xmx:hG6MYMy83cJtTACksy-kCppiuGAhoK60q1KM7q0GEZJHioJp3h6e3A>
 <xmx:hW6MYCZY251Il9lukfYnxL3rl6vMJzQOwzw-oq_gOysiaSmIGVzeUQ>
Received: from localhost (mobile-107-107-184-52.mycingular.net
 [107.107.184.52]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 16:54:28 -0400 (EDT)
Date: Fri, 30 Apr 2021 15:54:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
Message-ID: <YIxugif2LaXLaL4D@heinlein>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein>
 <2CAF9521-76FA-4160-9711-4267341B018A@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rZL/vnSOY2eh4HlA"
Content-Disposition: inline
In-Reply-To: <2CAF9521-76FA-4160-9711-4267341B018A@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--rZL/vnSOY2eh4HlA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 09:43:21AM -0600, Mike Jones wrote:
=20
> I had a similar discussion with Guenter, who suggested that any i2c code =
in user space is problematic, but I think it also said there was enough loc=
king in the drivers that SMBus transactions from /dev/i2c or i2c-tools woul=
d not interact with hwmon.

I'm pretty sure there is locking such that the kernel won't let you talk to=
 a
device that is already bound to a driver.  Once you unbind the kernel side
you're free to do what you want.

What I don't recall is how much of the i2c-mux support gets propagated
out to userspace.  Hopefully you don't have to mess with moving muxes
and talking past those devices.  (I've seen some nasty shell scripts
using i2c-tools doing things like this in the past.)

> However, in general, ADI PMBus devices have a PAGE command, especially th=
e LTC388X and LTC297X families.
>=20
> This means that many actions require locking the bus to create compound t=
ransactions or the use of PAGE_PLUS.
>=20
> The In System Programming code we support on linux via /dev/i2c has this =
issue. If another process touched hwmon during programming, and touches a P=
AGE, the programming may fail, or worse it sends the wrong settings.

I'm not sure how this is even possible.  How did an hwmon driver touch
the device and userspace access it?  I'm fairly sure.

> If the work within the PMBus community to have a standard programming fil=
e format, if it were to be applied in user space, OBMC would have to disabl=
e hwmon and all telemetry while the programming is in process.
>=20
> If the file (or data blob) was applied in a kernel driver, it could lock =
the i2c during the process so that all hwmon activity and telemetry are hel=
d off.

Right.  I would expect the locking at a pmbus level so that the
pmbus-hwmon parts would block on a mutex until the firmware update is
complete (if firmware update were done in the pmbus driver).

> This problem is not unique to our desire for a file format. That is drive=
n by the vendors complexity and business models.
>=20
> But, in the context of the ADM1266, it is a multipage device. The DS does=
 not say it can do PAGE_PLUS. Therefore, unless I am missing something, the=
 above problems apply unless using a PAGEless bulk programming mechanism. I=
 don=E2=80=99t know this part well enough to know how that works, or if it =
is published.
>=20
> The other two families LTC388X and LTC297X do have a PAGEless bulk progra=
mming. We don=E2=80=99t like do it with telemetry hammering it, mainly beca=
use it feels risky.
>=20
> Finally, one could argue that most OMBC systems are using the 1266 and no=
t the other parts. But I can say I have sent patches for other parts to OBM=
C users, so they are in use.

There is already some firmware blob support in the kernel, just not for
pmbus.  Has anyone investigated what (if anything) we'd need to do to be
able to leverage this?

--=20
Patrick Williams

--rZL/vnSOY2eh4HlA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMboIACgkQqwNHzC0A
wRmMeA/9G4VIGWcx2vNxXOHDvNoeFCwhdbX118jk76ysjFuMqnCUDut9XVPRA+cZ
+sdG9NN8WuUo99iB0IpH4N5xqiG4BcT5D0Z9EnOFxl/xNDiKM9SDNNI9iG0UFZ5c
IkGJeMCMG8g03/d056byyGKNx2mdYcDIOWF5pkQ9UGuBxQ0TitftfcvcCUOFN0kE
Es247ZkPCaVZFtAJKKuTx58IiQs6cSUDjKATyCwY/ZbE729FZ/prxZ+r5eDxX4My
htejvzFg82QD8wRpKg+qDdAxda81DzeV37u3Md8hs7hmbIahBLmrzeR965sc/mKR
0B8jE/GDBx0pwoLhZ/xBdoxEI+VGQ/86ZJaGYAdrgnzc0E6u/neZGzVOlBLbe6VV
Ef+Hh2IgOF3l4+VJyaDsX8hHMcxDUhbO30O1BQavFSLNiN8eaHnoZHY3kvJhAcZU
svU/Jdk6wHANx+5G8TBB7QTlk5WBzJG7V/NoSEK3PVAHOkLtg04P5pRBX0TYEP6O
14nfNdH+isva3l+Cf4twrzfwiNwEWf+U6J6CPXYeH0vH7yXP1zW6PLaVkdOXxX+L
hdd/imYVtH2nO4lo32AjVxgTxIvvYqk9nHI8EsKVR/ScidS27nGGvb4hd+Re7jNR
sp/sI5uC2q3nFnLjpJklZ7oM8NNpKPr8oByf+cPAWwyGTx9Hy9M=
=an8H
-----END PGP SIGNATURE-----

--rZL/vnSOY2eh4HlA--
