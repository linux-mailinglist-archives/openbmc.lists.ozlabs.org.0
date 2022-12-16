Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9479164EFD4
	for <lists+openbmc@lfdr.de>; Fri, 16 Dec 2022 17:55:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYZw22mwrz3bZQ
	for <lists+openbmc@lfdr.de>; Sat, 17 Dec 2022 03:54:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=RZLUFIt5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KVNBDWmy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=RZLUFIt5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KVNBDWmy;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYZvP5sjhz2xjr
	for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2022 03:54:25 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6AC4A5C00B0;
	Fri, 16 Dec 2022 11:54:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 16 Dec 2022 11:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1671209663; x=1671296063; bh=41pN6i+FrB
	qBVoZkGXr1YAukXjH6KGf7AqmOm3GXDPw=; b=RZLUFIt5Uo8Djwj5MKFFGjlHrM
	+RbYIN6w5ScQubP1xyPNlLi/Idk4XH/88ZxyACW8sNMMxr+Ke8p2Dz9J+KJAMqAL
	WB2X0cN3shz3Htb/5mn4NrAAKiLRHREeMYFWMmY+8dJHLbPfbSn0PaxBtKOcbZxE
	+xwLJzy4Z57eVK0msGOyXKCrxZ1KXXCxIGw3sXr1WJfq9ZPtDikJWO6nR9FGVps0
	k5pqSoSUArK0h2Gh+tPdaZsr9puw+JNpXuk85/wYe/zDQ5qPkka8N6HePMwGrgJb
	VhaL6EyW9mCH7T+5iPsSUHRhLCpcF2N/RMxOeW5HjcvoCswDslUMsHSRBGFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671209663; x=1671296063; bh=41pN6i+FrBqBVoZkGXr1YAukXjH6
	KGf7AqmOm3GXDPw=; b=KVNBDWmyGCbgUgRDog+gD9pbhQNg7SO8/u6npJavNIA7
	v7tBeX7URbKLi3J7/tk/WcNGPFaolcwlstMzMqEg6pIuO+TCRbZVk8I8Z51GxiYp
	sc+fMrsRjz1D2hAvnOTsMFcEJoq7aaa4QITf7bWwjQzosucYKhGs1GaZ/rnz1gGT
	b1mPzO1eXECSCUL4qXJ8nzmpK1OuREARA1YNcXWfTRcloqmFsYiA8+Vpa3s0J8Mn
	eCi0sa4AeELGjwQCIB/4wTUxHXl5wb7Xqv+pAZh5E3yz2FSbjyR6XwXxw2uqCCAP
	q4TVPzcyFJN0QUOyNmEg3OvqdM8Nptla8IKDnl6MCQ==
X-ME-Sender: <xms:vaKcY40hqkspcIzyZlhIPiJsnKYso-X3uc6HT527GxqiZb5GH5HXTQ>
    <xme:vaKcYzETh42RAsDQxpqmZnse09ZSfINapj0B7Y5C3Mfukhy8b9tbMDcLi1uxkR4Y2
    bzJjl8qRk5Dh9OewTM>
X-ME-Received: <xmr:vaKcYw6KTcSFIH3vHE4t2quAuVCjlxvJYuZitGoQL-Ms4EIYsroFGMZV2LiIPbeLeKL0XetOzLlPGJNMWKTQRyCll8W0LFvjCN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
    udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vaKcYx3I1-yAA-MppN5rmZ6uFBG6GGeiLXx6jLZnMlnrqqbjoOwCnA>
    <xmx:vaKcY7EGqpJlVQTnLyBiLBjqa8-T0KMiItAk_Zv59p66zVyICxcsoQ>
    <xmx:vaKcY697el7xgig-ECTUc7beAjGa5nrJaWc_5NwkGnVlGFQNs7dKCA>
    <xmx:v6KcYwTZciVX-WovfURJGxdf_2qmD1nRY5p1GGdnggwrj7WTZq-Upg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Dec 2022 11:54:21 -0500 (EST)
Date: Fri, 16 Dec 2022 10:54:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: Phosphor-ipmi-ipmb
Message-ID: <Y5yivH2dvcQATSV7@heinlein.taila677.ts.net>
References: <000901d90ad1$35f93f30$a1ebbd90$@inventron.com.tr>
 <Y5jKp7C3tZKncA3P@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MRyroYWYqpYisgTb"
Content-Disposition: inline
In-Reply-To: <Y5jKp7C3tZKncA3P@mauery.jf.intel.com>
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
Cc: zehra.ozdemir@inventron.com.tr, openbmc@lists.ozlabs.org, "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MRyroYWYqpYisgTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 10:55:35AM -0800, Vernon Mauery wrote:
> On 08-Dec-2022 09:49 AM, zehra.ozdemir@inventron.com.tr wrote:
> >Hello,
> >
> >
> >
> >We are trying to create communication between BMC and the Host. We defin=
ed
> >an ipmb device from an i2c in dts and can barely see that /dev/ipmb-x is
> >created and ipmb.service is running. But we do not understand how is data
> >transfer provided Host to BMC yet.  Is remote address in ipmb-channels.j=
son
> >used for that reason? Also, do we need to add any driver to the host for
> >this?
>=20
> I am not aware of anyone using ipmb for a system interface. So far in=20
> OpenBMC, I have only heard of block transfer (BT) or keyboard controller=
=20
> style (KCS) system interfaces. I am guessing that by ipmb you are=20
> referring to SMBus System Interface or SSIF in the IPMI specification.=20
> Is that what you are referring to?

The Yosemite-v2 and Yosemite-v3.5 platforms in meta-facebook use IPMB to
provide the system interface.  There is an IPMB communications path over
i2c to a uC (the "BIC").  That could potentially be used as a reference.

--=20
Patrick Williams

--MRyroYWYqpYisgTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmOcorwACgkQqwNHzC0A
wRmyKw/9GKr/ATqUMglx58GgoM912gKTdk8/wHb6PaV5/JV1+jNpnelT4kDHWp06
V08qOWd1Yq/L1bpafJgrke1HDPMiZXqQoFMljdi5OUNLneu/mTxnaTaTV9VJBDh7
XJfWARviq8frSBqx+I/46t4yTnSk1sfL3mzzy92Ts6VKE33MzExwDDGITrxTYyky
lplye+XDIvISk3zMONH6SjC7EY39kT3tNmZyeSIRrtqzYP/53OdZlxzov5Afv4An
uNYkNJzEdEHpLzbTDV04m3OZnyeE7jNw1CgyJWIfEam7Q5FczvhkJSuhC4sEGanE
VMyVpLMyyqN8cED8ERHGmqvgesacHhYpQYk6Db83tFWnZUvXlq8FzgYLtLWnJjXI
7Aa9CxjAAD0xJd08hNIqBXbfboY8Dajnp7//80cUcLlTTmVaDAYcMiDUTP+uYban
MOgtGOxiDJDf0/I4vQ5038gosXF1F+XfTC/dSjD3VU0tnWiNBny3xgOEE7ahk06T
541OiCqpR/uupg+jBB2ae8DcVSzMz/bfI7obGxa2nMDcFAJcaf+r6pj/ATD5YI5e
LxUlP2jOFbiW42h8DG8c+Oo9VchRU4d8tDOIiZWDom0ppmhPv3MVJN3WwyHnWc9K
jMP/3LSGQ36be07r+Nky0sh3VJpaLPgS2YWjv5fVt8vtvlsg338=
=nXMP
-----END PGP SIGNATURE-----

--MRyroYWYqpYisgTb--
