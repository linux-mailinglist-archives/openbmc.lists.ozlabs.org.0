Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA35A7851A
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 01:08:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS3Z86tbfz3c8H
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 10:08:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743548877;
	cv=none; b=hZfrhwgZGANwgNGXb/eLlsZ0s40qTtnMu6RgWbzg9/kozNGNiZVQmqyU8YQB2vz4aT5QValATDQemrdqJooRHVezRzsrq029Ie2j/5Z9wv7wcf8yxLe+ag4BAIO4QWIY1zH2Zb+UzC3denc8HrizRuvFqvqcVrZj1bOUwRDtpFDWwn3hkfB2wByhLd9wqBgh8oMUZWYiVCznL0ZyP5ZCC1BtfeeeKeD/I3K4NXnUfNqydBKLTwed/iTiog3V1d3icMfj7peKF/U7g1Pe0r4ir7jbfzmQbUKh4lEcbvbxLb3rpYgiowhxr16aVrSd6Whg6NcqU82ReT1aUovODy+O/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743548877; c=relaxed/relaxed;
	bh=WDobqmB+Ti5QN6qHs01xVzfLwmA1xHzbWlAHIgBrrtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZ40JKPHOtHnqe+D/QuvJz2PV1chEG+vhkG0zYeWpziRcvA8G8p/UiCAh/2ngw9pTIguBKQBCSX3QH+Z8Jey51rEr1T9BBjl29dznPCeyglmhSL/t633H+8H7vhwGQd5o7MfiLcR31WAPxRoIk6YcMXUameGhOIb7d1tGTvgsU7kEdHA0bKPyaBxD/4d8ZS0MtiaCRaJYVqtj8Aj3wnLZHMwyq0Ly3Css9gt5dzDcUqtNUeoi9Wfg/orVdGOToTfwsRMT9M/Dm5lHKn3+zCrZsZiIK1ob3k+GE2p/vmkUkGTwIOWdhD+cyTkpfR+1b71jXQJqRkWGezoTxtmvbzVpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=2gEYcknn; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SwIr38IB; dkim-atps=neutral; spf=pass (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=2gEYcknn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SwIr38IB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS3Z41Cl7z2ySX
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 10:07:56 +1100 (AEDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 23AB011400AF;
	Tue,  1 Apr 2025 19:07:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 01 Apr 2025 19:07:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1743548873; x=1743635273; bh=WDobqmB+Ti
	5QN6qHs01xVzfLwmA1xHzbWlAHIgBrrtA=; b=2gEYcknngQ185MDxnsooYvHgqq
	Qx4VgolDNbannnWohy880HIhTfQvmDGiB7yvoOwtsWcwLcHFdO1lPMe/QMMOJYTD
	VFJgkGdPlNCMF2dtqomWds5ZQocmI1pyjUkOzjWeAfyw2FBsKFJoOCmWLQyzYvxu
	XJ1TgMXWPLQ9n/jkG9R9y92SA1caQBQe5aFpjjMQyelEvkrCodLa9K9/qv/uwEl7
	V2+qeMGL7r/mH8fJ3N4hl/7/+o+OqkPA/Xk7jvlE05sr0K4ejztJw6TDwOytKvjX
	YNI6mlNfelFazHQZUbhYRT9FJIFUhaXmyjfaGx19bwzD3FQe+hQGnr40FVlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743548873; x=1743635273; bh=WDobqmB+Ti5QN6qHs01xVzfLwmA1xHzbWlA
	HIgBrrtA=; b=SwIr38IBh5Wzz865yZJZ8wYehCI1pNKKckAnwN9GOXSWMFlPMqI
	3edi/D4zwNxEp50Zds9yD1Lq6yZUUg3xIXa+Qi1gnGLGrT8658kCIJCXikRcw6Uf
	xks4AD2MqGMLumEXe6w86Th46MgmT5N356o5IgIL/H2DW9dnUrh5t79YXCGeonHd
	4BJTx9tC0pJXryVGSuzQZZHK5IvrFBx3dGLjhKXLXzGTpplkkLDNzRBXCnDBbLYW
	+zvkYKLu/MZ9P6AbgI0lgB5kq6YOw4sr0tItNcDqph8DswL9qM2VFgqHgWMzN6/V
	m1TWAVyOoq9bz4LOHlNwcIAskYNY+LGMhVw==
X-ME-Sender: <xms:yHHsZ4g2TnK5UTP87GZMSiPfk1iGgtv9MelPYxGGVZ9b75kbK81YPw>
    <xme:yHHsZxCEoW17YkOzLhsAPrP3wIeooFFuqzWrTItIerg74HUy5J1T0j9vR50kJnuwJ
    jop_6-vY9OA5YxsvPI>
X-ME-Received: <xmr:yHHsZwHzi2B_VOeeepECxZlnxTEhv1zXVfe9IKkLxJmcegpSgXsNLe8oBtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeegtdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvvefu
    kfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirg
    hmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeh
    feejheeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghk
    sehsthiftgigrdighiiipdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehmrghnrghgvghrsehlfhhprhhojhgvtghtshdrohhrghdprhgtphht
    thhopegrlhgvgiifuhesihhnghhrrghshihsrdgtohhmpdhrtghpthhtoheprghnughrvg
    ifghesuhhsrdhisghmrdgtohhmpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdr
    ohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:yHHsZ5TJuP_Dhm-wfEkKPw2QDbMe-KMmD2y3YTNDI6DvUyfBVx2Z0Q>
    <xmx:yHHsZ1yQfE-WHkBUk730Jge5N4bBppBqcsAI2E3frCYtaHfFFwFTJw>
    <xmx:yHHsZ367ch_GykBicgDQF2oCzVNZRRZI8BzwIhvvFTyFohv8sPuWaQ>
    <xmx:yHHsZyyaEgd4JeoNQagXPErTz_Hxd--KAu9kRyQRg48DSvSfPVCsGQ>
    <xmx:yXHsZ3vCdGhXesoW4v4ZZqgiW_4RaLjCjFWyAsdyecYPpes4BaCh9Om5>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Apr 2025 19:07:52 -0400 (EDT)
Date: Tue, 1 Apr 2025 19:07:51 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Dolan <manager@lfprojects.org>
Subject: Re: CCLA for Meta Clemente project
Message-ID: <Z-xxx29EpvS1fJ9w@heinlein>
References: <SEZPR04MB80456EE06D62AF894C92D7ECADAD2@SEZPR04MB8045.apcprd04.prod.outlook.com>
 <CALVHhec+VRqf7zHvfr3AP-qCbfs_4QyH_aQXHd05f9DGg9Z6Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9zKHa84gPiU0sPls"
Content-Disposition: inline
In-Reply-To: <CALVHhec+VRqf7zHvfr3AP-qCbfs_4QyH_aQXHd05f9DGg9Z6Tw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Andrew Geissler <andrewg@us.ibm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Alex =?utf-8?B?V3Uo5ZCz5pS/6YyzKQ==?= <alexwu@ingrasys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9zKHa84gPiU0sPls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 10:38:09AM -0400, Mike Dolan wrote:
> Hi Alex, we don't have a Meta Clemente project but this CCLA is for
> OpenBMC. Did you intend to submit this for OpenBMC?

This was worded perhaps strangely.

Ingrasys is doing work on behalf of Meta for a new server codenamed
Clemente.  This work will be contributed to the OpenBMC project.


> > Alex Wu
> >
> > Senior Director
> > Ingrasys Technology Inc.

--=20
Patrick Williams

--9zKHa84gPiU0sPls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmfscccACgkQqwNHzC0A
wRl+6w//Ti+hYCdcvy1Rb0Bj7ypOhDq2z+9o/92ldUdsrbrkDflx7EIB/duLCj9f
vOMypvQY3YtpijW/MJBeAtax6/gAp5+lf35N//SsmtJ2dDCsfF0gTIUTEVkpo07L
99qaBxVROX9nSv17SjLC4tEX1Ku4eZoQbZa/TC3nMZ6whlVA6VRpfXx4OJXM1Lg0
Fd8oUOh/Tt8zrHf+26twadYtH5DP58tOr0vJOZP1LGEwhCbT3r18kWFzSVyQQkr5
6BYXVPOrN0r1ggK7n/rhiUK8No0Fp8864rDQZEjmcGqPkfDdXyTRDtjsOV0Xwty6
LV3GLtJJdfLxi0Fddw74LsGeGFkb46d3gWygBWMpAhsL6NkM8rMClabT20RGBbTR
SVyKpoPOjCZUS/LSXKj9F0y9TBtrzZ00LkmRqx9CYsIGupFYyahsRPCezOEZC3Zj
4yoLjyKaDb6x2xC6/aOdRfuv1LWsFq0+1gWQIGtOrNa5IhGUHPoco0ztnGPJ+bsN
eM+Kh7aWwUsotQ8m2DBB9+LNLKAKKLhes7yVuI+UgWBdmWP7npv7qZCXlQMf6TOF
V1WgsxW/va7Xnrb+i17vo0L9Af8VeMhSz4Ztw0XLirXXaP2pG+dHYh6mrDqpX7St
Ms++59lUdldFq8GwAd0U+NW9uSIQFzXLo2/TExoH3bIMDgMHnrM=
=2mEm
-----END PGP SIGNATURE-----

--9zKHa84gPiU0sPls--
