Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814C7A1A4F
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 11:21:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=YSCiY4bU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kukq2sHb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn7x175Hcz3c3g
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 19:21:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=YSCiY4bU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kukq2sHb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn7wQ0LHPz3c1C
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 19:21:09 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 001423200972;
	Fri, 15 Sep 2023 05:21:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 15 Sep 2023 05:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1694769667; x=1694856067; bh=ZU
	oWlwM4zsJg1PO6iomBUdVg98CgzpOcYeuKa5bwBhs=; b=YSCiY4bUY6ZbCMkwH/
	kDo/DyW+tyMZdoVMtz0YXEnTxDlud8L9YUZWo7Qnp+IRV3btHIEpG75avZ39o44i
	gUQejxXyc8P0+wptLOlqA1AH3gTZ3T5odImD6ioMyfD2pDOktFQMHkjLW/onwZ+7
	ycVntqNmQv9fP6+NP1toS33RFcjDR4eY+sHp+dcoz/Wt8Z7JQC6wAg9EtIk8YxdJ
	c1r0cJBMCRJNqMSmAGQ4eCrdSUVirzrxbzmCUqAxes6dsus/LVhJ/6vmWREptXSW
	4nf4b9FEGfzutKqa+iXz9zZt+453eRY8bY+ttB/KMnMA1ktSU4S21WDJh/HOwtgQ
	yLIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694769667; x=1694856067; bh=ZUoWlwM4zsJg1
	PO6iomBUdVg98CgzpOcYeuKa5bwBhs=; b=kukq2sHbbysN2zWAfXxR9Z9olgkfg
	cHJW7kmXy3LxUF3I3tMNCoRyUz/S8uCDw5t+mSt/2nR4u0OH8VvE6X7vbt3YdI1F
	oXxlS9yHgxI/CJ/iMjmHpaKyBDARQ5hsfG61aTg7CK2yjRqORUa13uSH0vTFmUl3
	bKtz+wTzMoZCuurEW11pSDoYCVIHOXuk/yoSXCiOr0A/I012ANCsW7Jnpe3r2EV+
	2QB5Of8A0eB0rg692JnPUI8mlefjpvPnAQKPUOfwTUEuRFPe6z1rfcDbTK24elEY
	ekM3B1HpUavUZKqmHTh8f3Pwsre5Uce2OR6gjOofndXG5hzmsNrJHKBgw==
X-ME-Sender: <xms:AyIEZbtuzOprhOnYiZsV3vti0NZvd6v38aQdhxfOBRYy4asSi2TwzQ>
    <xme:AyIEZcdD4Sp37MArLvLYq4W1GLkYNxeOVIhk1_ZVe-_gPg9oNt2SpcUd2cd6g7qep
    KTCwqW-pwXWAfxmlZY>
X-ME-Received: <xmr:AyIEZez9oqkqjF-bqh1yiWcPyO1OWz7T2yBbpJFTUrZG1P_EaaCg2abOSeRXgmxj5IAgcbLqPBLzXGuCJ8MeYRnk8knX1fdnj50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejvddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefgkefgvdevgeeukedvgeegtddv
    jeevgedtffdvfeeiudfhteelvdfgvdduudffjeenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:AyIEZaOR-6z_X7KvvO7IzlL6_RsKP3o45nrPpjmBJZDMibWEulcEgg>
    <xmx:AyIEZb84fYQh5CgVPRAuJSEVjagA5Us2PVwg1-TFWSjj9FjkegB6eg>
    <xmx:AyIEZaVfR1072Sp6Z6KvGTxnuNL_vls7wP76LjaLnMztXnawigRyeQ>
    <xmx:AyIEZYFsIYl8iO2R0XNTf5_KQAlTO053Aoj7_9u_-ayndlTpYydWEQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Sep 2023 05:21:06 -0400 (EDT)
Date: Fri, 15 Sep 2023 04:21:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Towards less magic strings.
Message-ID: <ZQQiAqjj--miyo_v@heinlein.vulture-banana.ts.net>
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
 <aaecc12856e6ba3ef92e6927bb1ad7360281098d.camel@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e8Q1Lgr7DdcgSukd"
Content-Disposition: inline
In-Reply-To: <aaecc12856e6ba3ef92e6927bb1ad7360281098d.camel@fuzziesquirrel.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--e8Q1Lgr7DdcgSukd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 10:26:37AM -0400, Brad Bishop wrote:
> On Thu, 2023-09-14 at 01:36 -0500, Patrick Williams wrote:
> > When I look at these, the vast majority of them falls into 1 of 4
> > different reasons:
> > =A0=A0=A0 - A well-known service name.
> > =A0=A0=A0 - A well-known path (or path prefix).
> > =A0=A0=A0 - An interface name.

As a concrete example of what I'd like to see improved is this verbiage
embedded in the YAML description:

    https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xy=
z/openbmc_project/Sensor/Value.interface.yaml#L3

> In my mind these are not magic strings.  These are parts of an API.  We
> don't get annoyed by having to hardcode c++ function names when we call
> them - why do we get annoyed by having to hardcode DBus names?

They may be parts of the API, but we document the API in PDI, agreed?

The big difference between C++ function names is that the compiler tells
us when we messed those up (and your editor can do completion on them if
you've set it up).  With these strings, we're relying on humans and
runtime-detection to ensure we've got it correct.  Often we get it
wrong.  It has also been challenging to refactor dbus interfaces, again,
because we don't get compile-time assurance of correctness.

--=20
Patrick Williams

--e8Q1Lgr7DdcgSukd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUEIgIACgkQqwNHzC0A
wRlyGQ//Zu9mJnc6ngjIY0FcihVMbfznsiUW/AjSfJurGk4NxZ7USkqRpkXK5PVB
fIFc7VdrNzfLEzieFK8CbkMzeJlUfO+rWxxps2EhsNc0fgXYU0r8GRNWzyFN6Z1T
NqiTNU+XfXLH9LDySMWk/Ta0cx4fr/0bzisbDd06sdYZTYZNr5K3r1tQjY40ByjK
9Gk5DbUGiXP2KNMcsIyNxfnEJVGBQfUtn+MK3HB8gwZRtv++JUyDDlybrsPSczaN
osObn1Rpkn0+OtWZZbBOfv6UJNYd0ttlw80zxz9bGfDCm/Po0kd01MSL4Q9aaW3T
cCwKaHZJXbqsP2BrxC0n53VnrOg0BKpMmvZva810Djvo4OjNBmdah8xZm1s/TCVB
YKUfWAFM9JjTt0/U1OLMMIfbmt+C1eQRT0XG0U6QqoO/okYuUOFea/LSlh2pojOK
77V95Cl7DHNC752x81hhPUt0/MdIpXDgGRxbXe88uZph8bHj93ZX8CZ9qp2EsWfR
YnWNqcaEUgFcbmNj3/fJk+ZuFmM4TX+x56C9LIzx+ukhbYizWjNjBBwZUFvFv4eo
hE8e7QSUizgqMOOxSXhbvH5PVIvOc2paa+kV6Dsdcr9sjniHZ+uHxEQaptrl90QX
UezTkyfYJMVsvyKmCjeGio5/Wk98J0jUXZ1VXJJqEcvnNNm/x/M=
=IobB
-----END PGP SIGNATURE-----

--e8Q1Lgr7DdcgSukd--
