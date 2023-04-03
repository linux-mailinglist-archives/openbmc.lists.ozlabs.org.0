Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A86D43D2
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 13:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pqq2W6pjBz306l
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 21:50:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=S1UOo4dE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PrcOG+Ul;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=S1UOo4dE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PrcOG+Ul;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pqq1x46c5z3bjY
	for <openbmc@lists.ozlabs.org>; Mon,  3 Apr 2023 21:49:41 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A46C45C010E;
	Mon,  3 Apr 2023 07:49:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 03 Apr 2023 07:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680522579; x=1680608979; bh=mX
	DH+xRcEPhdxZeSTbeaz2sfh0G15PZyZ8xuPtYcMZA=; b=S1UOo4dEMCvri4cnV1
	qlAMiyCp6PczxhP3wHKZoKi7/JW7ak2dfSQgIiJXXjgdDNTF91EotVUBYm0SfmEJ
	d1HBdLXNfMOK0ZdO7ute5NOAB6v40LEAZbNc+Q+MnAv3UU9cgfUDupLfNy+L90aF
	8CihHqF3x/YewN193J/f+mIC8Ri4yLdEC25niv5l4WhIJM4C+kVqJUIl9kpLQaUN
	h7aXJyXqoC1Zceyw7E2PhgUef4kw7TAwj/2CG9hz80hiaBHJjMSpe3zHt/Z3lMo3
	DI5lWlL1qNpqVUKxWRcO0tSB6YqhEMIECs3Xp5GgT6eSxma2+eqCewpY9epWXiJO
	pOcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680522579; x=1680608979; bh=mXDH+xRcEPhdx
	ZeSTbeaz2sfh0G15PZyZ8xuPtYcMZA=; b=PrcOG+UlDz9isqaIzpxZUpqhyGAPg
	n4B3tCXLHeRx52Goy6IHtRD1ThsfjQZkVBUBfBNyqKs9slWg5Kkk168VbOo9HeAM
	331r3+dHH69bqYGhJdUpG+cMcrNaVQJQisr3PahMD5aWpFm84AetbEdajlAeu8jS
	Onl2QEzYxKSwcBNb+Ts09oUdudXZ9NqVHveZ1eys1eQUYloFnoLKSz/IwnZgyp7t
	kzansgCdButyLKOAtQtFzYmC/sdtzgiF3MKtOy3lZFw3YCKPnxVLGpQHD8bX3+jf
	OOWdpnw3/PsJRJSwFw4cQBTz8SMCfHex/g+O+nHzP+XmpgcNHd6niR8Lw==
X-ME-Sender: <xms:U70qZMDhTV-u2dJ6-6Iksd_cQ0vr_EotWHFWarZvasDrDzB7eb6L4g>
    <xme:U70qZOi68XHvc4579wIoFbZanM5Cj5_9cM4-JPgGeNWud4ooWd6hfNeYg1mATqkmy
    YhXopgX2KI3h3u4pIw>
X-ME-Received: <xmr:U70qZPlcGSfX84rGrQYfq30Xx8iqkQSHsGZYLnC9X42YRrfE3M48vMJiwjYxYYIhBrqhIB5I6BCIw1VjdJbJQuVSJZUk_0hEp8s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeijedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejgfdtleelvdeftdeggefffeeu
    feevgeejkeelgeeujeevveeufeeigfeivdejjeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:U70qZCy4w1f04s34VjCx2nu3LQEG6-IgBKgkvHJdhHB0uqRozVKJJw>
    <xmx:U70qZBS3oGLVhJXZo0pjgd79luvjdj_blm6_zV2mPseRO04yj8hd1Q>
    <xmx:U70qZNaHQALx71hEa43L6Stcfr192S9TZUrrVLpE5xgL41e1-3_PpA>
    <xmx:U70qZAIdUe1gH5iVSD63pEJ-pJ2zSyXUMGvT4x-meoALJR8XtPmFKA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Apr 2023 07:49:39 -0400 (EDT)
Date: Mon, 3 Apr 2023 06:49:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Aswath S <aswath.s@vvdntech.in>
Subject: Re: Host Interface || OpenBmc Project
Message-ID: <ZCq9Ud74knYgSTSS@heinlein.vulture-banana.ts.net>
References: <CAK0X4mMqj98OTk23bcsEqZ9BBCqVpjxpVRLp-PrBmNU2ZW1MYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ePxWZFhb6TCl2ofW"
Content-Disposition: inline
In-Reply-To: <CAK0X4mMqj98OTk23bcsEqZ9BBCqVpjxpVRLp-PrBmNU2ZW1MYw@mail.gmail.com>
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
Cc: jiaqing.zhao@linux.intel.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ePxWZFhb6TCl2ofW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 10:24:10AM +0530, Aswath S wrote:
> Hi ,
> I am new to this openbmc project and I have to enable redfish host interf=
ace
> support. I have gone through many websites like github, stackoverflow
> etc... Kindly guide or provide instructions to enable Redfish host
> interface support in openbmc project.

There is no existing implementation of RDE.  There is a design document
pending in Gerrit, I believe.

You might also want look at the previous discussion a few days ago on
the mailing list.  Someone else asked nearly an identical question to
you.

    https://lore.kernel.org/openbmc/CANT9vnoMd9KF-KcD24Rj5+wH_jWkK1Bi7kxUbr=
tz_BEByFhjqg@mail.gmail.com/

--=20
Patrick Williams

--ePxWZFhb6TCl2ofW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQqvVEACgkQqwNHzC0A
wRlZaw//c5D4PUmFTEfOEiym/kKpVUS9TpSEKYCtc1TLkl7Tmx/Is5jBWYTohDL2
F0ulcZ5RuJ4hzj4Vcs8BONIbCWjZS4P/kfDVJPEWnkx70lTv33fzqXNnGQp5aM8g
eLZ/tWLTfy8+3E7ugQYycSyJyh+VKmUV+uhx7BO6VZhMimGRhdgAcJnKX4ZU2n7R
k/iXstZpgG1LQYL/dVQRw3IBi327DtWDD4Sw4ib043hX79uDGOK7oPVLAmm9Yz0H
d2XXQxo0e/q05ng+K7KtPSB304YkYmGhezd+oq0kP5NS2Bb8gieMkXR/wgQ3h0+a
Lz2t4Fw9Zma0wiNZVK3msIXHoulEOMb/dKmZs4wj6yefZeIkWKNRc3vUMrAQZKPr
XH/zKBy+9hTh+r72BMgVtbT5t6B8hH22l8GMEZm4tI4PBmpDEEJkTtuDKI7Ehkmb
XDUaqV3L6i7X8ZIxuWtujFGTataXPpRh+56FFd0aAsbVbw3KeJMU9qxIfk7X2VLL
Jyzz1HASvCWKxq3PtlgdN+jabgWxpLwAMUdK1PjMmcyM2BdDOPGdEz5PNQC4cpA4
AFuwFZ7fJ4Lm0UFFxbgHOxGT92lbjY/a2/hYg+F9DD/b4QO1HSiv2v1q32djJloi
eWiqyc9zgsRAQ+rl/Pul+zR+7xzsaeTF2p7RjsMR2XAjn+tPMs4=
=uG3Y
-----END PGP SIGNATURE-----

--ePxWZFhb6TCl2ofW--
