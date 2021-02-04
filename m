Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0CD30F6EB
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 16:57:01 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWjpx3QV7zDwsB
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 02:56:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=TZqswgGh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ibaDSGXV; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWjnl2t2XzDwnZ
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2021 02:55:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9F3FB10C7;
 Thu,  4 Feb 2021 10:55:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 04 Feb 2021 10:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Enl93kPSOIGgZW1gB1uXERO3wCp
 hwuNpvVpldzaXiww=; b=TZqswgGhdWMb23bBFRIFcsZaZwa1gEe3zApUbjjdf1h
 A4SdbZRNBI721d53Y7CPOUxtZK8VL5hGWeetSsZKzp3mpcmyJFwr5yI9AeqeN3+1
 zKPDgMnjzka4gZOKvanorw2tysdjz4OQ2XHRpkoFAxa735duXlPZ2qRTkH/qauiv
 JrQssiGDhvuB/OJONiDt3MBec9QFT48LwkdapeaGHqcOHd4EHQigBL70KqsoQOBb
 7BOkOUu5bB99v/YWR2ktDuD2FuXJ+lotep4gvcWKVFvQqsgHgv8FV3T4xnoN0xhc
 ZoJ0QMFqb8k0KcOEuauNAFUaIzjVh/398WuHVmtv70A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Enl93k
 PSOIGgZW1gB1uXERO3wCphwuNpvVpldzaXiww=; b=ibaDSGXVhBi3Pq7M7veEJg
 VnYWxVdUbhZ7KE/n9fJLwUBunSqnNHjnUr6MHukIR2Cl8sKqC+BDNIXVQr2aJrAW
 7mYfD+LzmKGAWolcpXazkVykVLe2u+bsS0ZNqJw3b41Qk9+8dNurkHTY/JM/HQcP
 5otET1PviuYmIXy2SjmAOrkttrkRo/QNmPKNiDcJyIdPtrWjL13jhMFcokf9M6xG
 1r60MCwUdnJR06JSWVYMSJKmcAIIUYJd7atWUfx7cc/vmnZpHmeIFnH7DxYR7AgJ
 lqVMXtc6dTQYf+4N6lvMcP3MuRXJ7R7rLji/9geJeBATsMxexkFGGvWrpfTj19KA
 ==
X-ME-Sender: <xms:ARkcYNQcHD8EJOJj0USb4xBhF52uh528eCVjJq8q1XqNv7nedziT7A>
 <xme:ARkcYGzaRNRoJh5_wp4sad0NmUEdfz7ryTS2hUCkZuB8CF7PHafwlyh6kmwibWprD
 HYsEz-gk8AIH-TW_oU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeggdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepudeiiedrudejiedruddvuddrke
 dunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:AhkcYC1gfjhQhBt-RytDt_VhPHYi9rRrG6-tJjd6GQwwg5qHfDi6zQ>
 <xmx:AhkcYFDNloyZc68N5Q9zyrdnsqoO9zxCQgDkYx32Q7N6o9evn-PUHg>
 <xmx:AhkcYGgPrzrsdaIsKNP7vUvsZ2y8lM1W3y8aLRk-HN2rCELH-ipxIQ>
 <xmx:AxkcYKYy3ECidGcHFoR-AdwBVnyfqfWJ1fm1GYgM4pRAR4CuqPfmNg>
Received: from localhost (mobile-166-176-121-81.mycingular.net
 [166.176.121.81])
 by mail.messagingengine.com (Postfix) with ESMTPA id C21D21080059;
 Thu,  4 Feb 2021 10:55:45 -0500 (EST)
Date: Thu, 4 Feb 2021 09:55:44 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Re: Sensor Value PropertiesChanged Events
Message-ID: <YBwZAG7r8i3j8zKz@heinlein>
References: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
 <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
 <01c540f2-9d7e-b54c-42c0-ed0bf666a090@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="17C9T/U52h9SHA7q"
Content-Disposition: inline
In-Reply-To: <01c540f2-9d7e-b54c-42c0-ed0bf666a090@linux.intel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--17C9T/U52h9SHA7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2021 at 11:02:53AM +0100, Ambrozewicz, Adrian wrote:
> W dniu 2/2/2021 o 01:42, Bills, Jason M pisze:
>
> My trust in systemd D-Bus implementation is that signals are implemented=
=20
> in optimal way and broker doesn't broadcast it to services without=20
> proper 'match' defined. It should be checked though
> Moving to polling might in fact increase D-Bus utilization by=20
> introducing message-response communication between producer and=20
> consumer. In certain cases of sensors which tend to update slowly,=20
> introducing a getter with faster interval would increase the traffic, if=
=20
> the interval would be faster than the sensor update rate.

You raise a very good point here.  When I review code that contains a
signal match almost every time I see code with very little in the match
and doing a bunch of filtering in C++ code and I have to point this out.
It is like doing a `SELECT *` in SQL.

I wouldn't be surprised if there are lots of cases where we're effectively
broadcasting signals and then dropping them on the receive side rather than
allowing dbus-broker to filter out who gets them.  We might be able to
code something up in sdbusplus to warn when the filtering is likely
insufficient but that'd probably become a runtime check that gets lost
in a journal message.

--=20
Patrick Williams

--17C9T/U52h9SHA7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAcGP4ACgkQqwNHzC0A
wRlYMw/+Jvs5LKHFF2rVXmJE63j3xMn1IaHkba8mcRpakPF94nmOGqWX8m3fOsgl
PO3aXwMiL7uQavoamk1B6nci47I6Ox9vgRIU0/uEFtZur+qrheKp8zUE1M0ibkJI
GlgvsNTgJ07ogJHsYWBLRZ21CKsI4rVNvkA+LlX6AX9WhEfYC1XqhS/dPr3/hSqW
9Lo7eHkRiMBrWVvOFKJxA0S1PxF7GlJZyhNBclVKeJK7TSLfvyUAaw01FZ8Z3oyS
6CI1XoBL9Xct6TuDwy1WSgpgRurQxHYtU5Sn6LfFBo2j3e8H36lnTZGxpkKGVIKD
8qwbqs943AWTkCmGepa78fk6QEvMXqPk/AudQX2ucP1a2RmApF8n5zN07R7HI+/T
b1VzQu6zMlyFwMne+CBuLl1nHIHbV90SCBaxsLGXyyaNXWt2H/1GFjv65IautsD0
Eaq0cAtX70jmP0cNFK/4kE9TTdqPJBwVklMp+Cr7lNi0tHFL3bZAADKZrBAxZm+i
HW4D0cXCgkI7tx1ZzpwwgZkAhTer6vnvJOdKIGAJgnTWVrjwFxJh4NVywgAZU0oi
sWusoBSpHUq8HxV5HPATcrOlQpUtm54pJbkt8SmIj5K/NYUOE/7Kot5/n2WDPEP+
eC1bPvKgpNSAwu8OhZYW5NjP7xdLq/m1OBqNu86Jjl28bQXIDvU=
=AqHi
-----END PGP SIGNATURE-----

--17C9T/U52h9SHA7q--
