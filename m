Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C223F5E8521
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 23:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZ5RP45Wtz307g
	for <lists+openbmc@lfdr.de>; Sat, 24 Sep 2022 07:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=CcRhMcpd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IcIWfiY+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=CcRhMcpd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IcIWfiY+;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZ5Qt2wSYz3cKm
	for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2022 07:49:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D50E5C015A;
	Fri, 23 Sep 2022 17:49:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 23 Sep 2022 17:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663969780; x=1664056180; bh=LYDcxi2D2+
	oakLQzYTQf0oAV6eU2hQgUIUK60Pez8Zw=; b=CcRhMcpdF3JcnHZTjDitzHy5uu
	MQJ6fymXRbVsNdvixXY5RgzMPlpZ4UC/7JLv0FQE6eCQZJTvQkFXVMgJovDld1M2
	/1VvvC9d87cfbGD1NVxYlu6QtobyX2I2vtVLdgu4ZO5L1tcHsly8ZPMZMWfFSc4S
	XmtfeB9rEumbcf1zXK6vJ6TvnyJgqI0Nt4Pt3hk2lCvAew9MIQC0NAdwPrt/GRUS
	sVs/Rs1xYUIxnllCQhXIuKMrQNQ7SbVhdfFwCzkPXl6iAduBpFng9VArXtXJrjnJ
	94seqo7DiH58jWj7uhBCzb2IS0SEO9nyaIvi0D2vYOZfe1vtaNjNsMk/BUpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663969780; x=1664056180; bh=LYDcxi2D2+oakLQzYTQf0oAV6eU2
	hQgUIUK60Pez8Zw=; b=IcIWfiY+Ki6+WsQ00QVXHCkR0GldbDHz9LhP0Drt59tS
	vf9oQ8bzXvAcp/i/qzUKmV0Y3NzkLmkZWap7ibAz+bR84tm9BCxfJ4iHN23nKsOI
	9kNK2ezZlEpofXSRLh2agk5/2Yof8y3eIROrKm46lGw8FD7gdesKFfs4Us/CqrDf
	HdDFpCSz+/auMhvWr0WIRWS70NKt0lATsU9cJtOdgjS0exyaUC85PtHCHthXWndy
	ISviARpr38FyCOpnwm5aOxjXQ/9zPpfqbwIcMv0j4uqCEf//WR/pDGYviSJ39n9j
	N4rtW9KRj5f3hXbGsB7HarzDpQ/meNYFfNRlQfiwYw==
X-ME-Sender: <xms:8ykuY4D8yKkH0ilUzuQqUzlGgx_LFfB26er0G1jtvtj8tllM0qMzog>
    <xme:8ykuY6ieZOv_zdKuTctC-bT_p77yRdJk9oMvCMiLOTSfe6dr78d88TGMxaYySdnRk
    iKyhXbUTi_d9au5tz8>
X-ME-Received: <xmr:8ykuY7nVoori1NOnLqIwE3-Githmp9m_KplWDff1SVfadFtjvV77hBYCZ3cj3rDI49-_NyATi6rjPG5ZWnM5hDF6s2Ut8aEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefjedgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:8ykuY-yhyAyjpMMzZjTyavCmdDyG-gxFwWKcv6h70OtowhNp_WGZIg>
    <xmx:8ykuY9S9utxsjTczXHaKn1FHmmGqyrKcSx-KfJFc4n1drv3k_r8Zhg>
    <xmx:8ykuY5bnZRqVUyStcyNrnBX1BpHnQUtCZM9x7yd9ptQ7yXuxefPttw>
    <xmx:9CkuY4Gehuj_0HgGtz71-WoQ0xvLoJkU4UPxnxa5iMy51yUpBO5vPw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Sep 2022 17:49:39 -0400 (EDT)
Date: Fri, 23 Sep 2022 16:49:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: Rescan busses for FRU device removal/unplug
Message-ID: <Yy4p8vbQfOq/jxWe@heinlein>
References: <CAA7TbcsX-+EWCVjNMoB3n4qRWp1_1fOLWkM_8qK1UTXqQ-GgSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xcIM5fsg7QiXSfZ6"
Content-Disposition: inline
In-Reply-To: <CAA7TbcsX-+EWCVjNMoB3n4qRWp1_1fOLWkM_8qK1UTXqQ-GgSw@mail.gmail.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>, velumani.hcl@gmail.com, garnermic@gmail.com, velumanit@hcl.com, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xcIM5fsg7QiXSfZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 02:19:38PM +0530, Kumar Thangavel wrote:
> Hi All,
>=20
> Whenever Rescan function is called, it is removing all fru devices and
> their interfaces from dbus and scans all busses and adding all other
> devices and dbus interfaces.
>=20
> If ReScan function is called, incase of removing/unplugging only one FRU
> device from the system, then it will remove all fru devices from the syst=
em
> and their interfaces instead of removing one device. So, all the FRU's and
> associated sensors and their dbus interfaces were also removed. Then scans
> all buses and adds newly scanned devices and dbus interfaces.
>=20
> Ex : If a system has 5 FRU devices, then one FRU device is
> removed/unplugged, it will remove all devices and scan all buses and
> recreate the 4 FRU devices.
>=20
> I think Some additional removal of other FRU devices and adding/recreating
> other FRU devices is happening here. So, to avoid this issue, We can keep
> both old and new scanning lists and compare the devices in the list and
> remove only the unplugged FRU devices and their dbus interfaces and keep
> other FRU devices as it is. This is also applicable for adding(plug) new
> FRU to the system.
>=20
> Please share your thoughts on this.

Isn't there a 'ReScanBus' call also?  Does this do what you need?

--=20
Patrick Williams

--xcIM5fsg7QiXSfZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMuKfIACgkQqwNHzC0A
wRlY7Q//eiPxm2/EiEt5IRddhABkPM135+DJ7KRwejxDSA821rVF9yY/tCUDb6C1
GtMQuX5gbh9k+mEfXTQY9WAnJPpu5L3zNnapwk/me3SkC/WBW3xYAtsR5gLe8Nn4
PjG80oK48uv2jzbuSTyuu3oymiBb0U/jDw00EVXghgHSjBILZ55P+iPZPsxTrd19
Q5+iMSxKiYFq7OADC78OYLIZnOM8Abv8H0LPPM4P3oNRq1TQ33uByUqwSB2wMEWS
v7O0+EOalcisJeYKyge8WkiLNPPJ288PwtLyfCxiP38JlU1ZryAivo796Bt7CALb
SKuSPCCRowggL4eqrQDO8QGhl9Xw+CIsfsNnrgSJ8UpGrgfOhakBZQI8pUKuvq33
shr5d2uIAUFX2wCqdPvme8vkEdpzMNfWrER3b6ivwWzE/HSrTnbOqZ+4Kzjsf2Lh
8HnizzNgWOHrh9AfO6f6ulpkwfa5cFplw6rJ2xX67EkZ0WG9VQsV+HD9uAvPD6i7
iUZU4E063OvhDv1s8QPWioAU4SmBmpB0u7iJL4jzM5tfiZQu9iwGBGRtWlTSj6mg
zOrSveS9h/DSvOQauuZaNkwobnSLdHlw2vFBsoap71ynIxC7BgaOyywC1yRylX7n
mlVE5shTdDaZRJRMztKSiE3/N0qsZdfKFy/kGs4IGjr7WVYOJ1Q=
=A7P8
-----END PGP SIGNATURE-----

--xcIM5fsg7QiXSfZ6--
