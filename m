Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E186038F3
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 06:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsddY0wwzz3bxp
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 15:52:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=nfSDKmPE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ky9UtrzE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=nfSDKmPE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ky9UtrzE;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Msdct2Zcqz2xGq
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 15:52:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8CF8C5C0072;
	Wed, 19 Oct 2022 00:52:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 19 Oct 2022 00:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666155126; x=1666241526; bh=RxV8ug5HVZ
	PwH6ahdtP9yfRkwfy4i4E75LXsrrwRgHE=; b=nfSDKmPEN3TyQ1anpIeK7OnN2O
	qE+lee2hodlAMKfJOTjwx7hdeuDQnFK17WHE86QEVfdYXDn/7twU9CCLFjpTpVQ4
	eHKZmb6fHQZuNkMlwMpy+6geVl5VKBlr6BIDm6zeXuyERhyu4URi7lQwvojUo52Q
	oGzXZUqngtPXinq3lPGAQZ0a8V3nZsIacq1U6jAG3QuCqb1TTSnOUad+gQJlrTPL
	wVTqVFGlhhZDSKzbdDgkrBq0NnwadCMyJDSZx86tzqPJNZBEZUdT+ZrRaeMFy6ag
	o2qFkqIl7hE5fIguCd0Te3XZSQopYPydYt1j91Jo6q40pfL9uYl14/jGAZzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666155126; x=1666241526; bh=RxV8ug5HVZPwH6ahdtP9yfRkwfy4
	i4E75LXsrrwRgHE=; b=ky9UtrzEWfVPxtYwGRe6MbTUUoPgPyk0zLMFgjMCP3YO
	FvGZRLiHVYF7fOLMN0dhX2r36XO7FWZLBLl+XfExa5wDoEjJ2pZ7MVcRzwBQcSmk
	7WACgGnJa+JLEcfL8uVmxOAPBZ2skmCWL7JkHvPVd2HJrRhV9UsmJPvcLkNR/Ad8
	9tzSydxKOkwIQCG6pFOPyd3WV0PnglAAQI24ooCCTFtEfAvLp/2Xu1YE+CellDzr
	P1J4jYmOvJVrF0F0a2D5VkcM4pUekw2+haKPcnuOhZYcswtjTVNHw7X8Cnu1sRee
	p66EvbDAyEsxU3ec6IWksgjWDlMZwPr+H1mAfDPp2A==
X-ME-Sender: <xms:dYJPY84biIJIuff8DIO4QJBJutvqDPGBEVj3ch9IXb_b0EbxgtIccQ>
    <xme:dYJPY94GzWpMgI74HmV4wg1ltmxWgLNOBieLiyTtdhVqtWCbxKOu344II8Ym861KC
    FPDKNSX5TsyKTXjsyU>
X-ME-Received: <xmr:dYJPY7e4f338bta6tTln40SoTz6gT-WQaimrWRGzTOfEnIooon98HcTqZMS-ujMoSV8FCKXb0AMdQCec2TUIneKiacvgCYkl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelfedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeehfeejheeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:dYJPYxJ87W4f4JllvuIP_gnzwnols7hOgLQ-gb_ri2uw5efGc4t9aA>
    <xmx:dYJPYwLEcdHuZLrm3hx4N1ohVz8X7XPzDhC6kh3LLcdc5h4URiYbzA>
    <xmx:dYJPYyzdSFJhajNpcwwZxZmhMjN5C0hc30u81Z6yneetn5sdD7raYg>
    <xmx:doJPY6yV8ATXjkBZubOlRNzmCmYfEKvHV5_FLrVPIL3hzw-Ly2WUZQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 00:52:05 -0400 (EDT)
Date: Tue, 18 Oct 2022 23:52:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Blocking call in phosphor-networkd
Message-ID: <Y0+Cc2sp3mHZ0Z85@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JUPCCzQdK5UyDbT3"
Content-Disposition: inline
In-Reply-To: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
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


--JUPCCzQdK5UyDbT3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 11:40:17AM +0800, Lei Yu wrote:

> How about changing the code to read the `/etc/hostname` file directly?
> It is much faster than making DBus call to `systemd-hostnamed`.

Absolutely not.

The value of `/etc/hostname` is considered to be the "static hostname",
which is configured by default in the 'base-files' package to be the
value of ${MACHINE}:

poky/meta/recipes-core/base-files/base-files_3.0.14.bb:hostname =3D "${MACH=
INE}"
poky/meta/recipes-core/base-files/base-files_3.0.14.bb:         echo ${host=
name} > ${D}${sysconfdir}/hostname

The value from the dbus call is the "transient hostname" which is
typically assigned by the DHCP server and is much much more likely to be
something that resolves properly on your network.  Since all the
machines of the same type will have the same static hostname (due to it
being derived from MACHINE) you are almost certain that this name is
useless for any purpose.

--=20
Patrick Williams

--JUPCCzQdK5UyDbT3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNPgnAACgkQqwNHzC0A
wRnbbQ/8DrpNSpNwY9ysIPSC51D6nF3kmXh0yejE2SQIrcvKp+u+IwFCVv0VYC0S
/r6HTExoj23Ir7j19vvWLdp1glJ7zAeHD0GUaF4FtDUIRL26ngCmlPIiCpuZECqo
tGtUdG1TlQz0ku9ktcPeFTO48LSoHK+YVNhdbyQjTOxcHO+JI95wc90K0D9fBl5X
FWX5MdAQlrNvkCo+247r6CeZddPWk03d61eFzTy2kgBZLy/5Q1N50ydjbVWrWkf/
rV61J+cejkkyWC/dqprgtQCGYE+MgiRIWV3AxBwpztVes6+MM6GpWLRexOac3eht
iS/OvAE/9bYUU9+DrIZoeWHG6WmmnyjTL30GFBIXkkdM2iLLuQbJdq37WLKMgtTK
4N1BQKEIkoeSPMqwgEtUk6L99yE1jbk9sL0w7myC6NFFVkgoYODLbxQ4V9b+F+aI
gFTnhYXRODqSYj1vzeyBWXneY2rlQrEaHN5q4fzXIeQhdVic6+CwjgLONLOx+zV5
LPSLMzi5fGwc7Z7Gpmgx/m0/F1793S4eKwM0qqw8MVHW32aE1jJg3a+cHYNMSIIQ
2t0ihoDWS4tWwoTLo8FIN5dPHPhYkhH2rWY9ugyvLA+2ZDUt50rbgv3hMbVD7cSg
VaDHA9EZXh9lc9DYd4GE7vnK20aPZRN4F3833e52vb8dMwH8IGE=
=Xw2I
-----END PGP SIGNATURE-----

--JUPCCzQdK5UyDbT3--
