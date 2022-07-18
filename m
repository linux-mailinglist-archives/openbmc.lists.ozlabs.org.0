Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0C5786C2
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 17:51:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmmg00GWYz3bjX
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 01:51:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=uLvcHdsR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fuj/zNv5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=uLvcHdsR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fuj/zNv5;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmmfT1bSVz307g
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 01:51:27 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 681E85C0101;
	Mon, 18 Jul 2022 11:51:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 18 Jul 2022 11:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658159484; x=1658245884; bh=1vvzfEzXH4
	zmsoUFF0WDZRmHay9U6+uZcTvmyahKN7Y=; b=uLvcHdsRZQ9R6valGKCOlkeMO5
	PYN9ZLkN8ugH156KUP+BAPxKwL1K88gx6r4fpM0NxuvbAs/76625lMjKJ5+oY56Y
	CqyGBRHCPPLAiCzboG63d/yZ2JQ0EFXJaF6AhLbk++WnPul2XGIcL6OIsCd7c6FV
	APoMp9kfZYFfacPWmkxXIt/GTIooQitPTgDqSbmbJq5f7/ERvGRQtnVe66dUH9l/
	o+/j2du4XJZSJ8FDEF2hh9E0toyIN+9IyKWtd/RQfcsSvaaPcT5pffwaJ1WvfxAY
	mkTSCD0yI10tWcIs8H+coz5JlUDgnxRuuw0KA1JAuvuF2vljFVkZzVkBPU6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658159484; x=1658245884; bh=1vvzfEzXH4zmsoUFF0WDZRmHay9U
	6+uZcTvmyahKN7Y=; b=fuj/zNv5tqYnYqYWEvTIUcP0sh/N6r48pNLQzVYeE9pq
	zAcCge03v9iPt6kHssIu4cqYi4DS3bMPqv+uaNgYPx5tP0SnadDbQVO/JHC9SzES
	sX/hyaLrgbXBWODasIc+pvh7mm8oBwuGnxSKWmRZlj/xlRg4Yp1GD/Sap/AMXSsC
	7WvxsJ8UoW2T0XsrGP+Sb/8kVsiZgXwV7s+DZ85+OyP/5BvQVFUzBy8hw7dcauv0
	l50D1KJOLVhbJjM4f3h59+R7FUXOxqmzr3iKczJk5Sefl7ca2t//8nKnqxQFE7Sj
	RGM+m0gvoSfNqZiyR11ipWc9kIovm4B6q4kc4gWtwA==
X-ME-Sender: <xms:fIHVYktcTTiqFpDkPlqThHzB67pkASzlLIzDQfJ_8xq0aObxyfn1JQ>
    <xme:fIHVYhfK9eCEHl9-_vwqVQvbqCUYp-3ZQwnb2R7f94VEIrjRsIWny-2B3MS33M94n
    eDE7tqUBH4WV7ux2ZE>
X-ME-Received: <xmr:fIHVYvwNzNKyzE-lqAly_vjSFoqu1QrQgAfGIDcNPQOiDOZAq-4YDqaXTp0XH3hsnVeQ3i_OUqS0lGNdOFg5xnRGoHU9doLy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudelhedujedvudetgefhvdet
    uefgheetfffhfeevlefhgfejjeevueellefgueenucffohhmrghinhepughishgtohhrug
    drghhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:fIHVYnPIpca-Apybmse_LAnNneS-CFHnBCUQNeeFhnNEV7MqnsBSww>
    <xmx:fIHVYk9v9UZPHEiatKZdcmZB9W81cvGiqjcW_W2fw3tw1DEyZWCMyw>
    <xmx:fIHVYvX6O1iTeGvLZ-AoRurjn20ACE-JNxBWvED0Llcya8YHtcHknQ>
    <xmx:fIHVYpFutprazDM0mUp0nRZcX5knS_boYAvHE2vQ_V0mMzdfynTfZw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 11:51:23 -0400 (EDT)
Date: Mon, 18 Jul 2022 10:51:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Jones, MichaelX" <michaelx.jones@intel.com>
Subject: Re: Request for Discord account.
Message-ID: <YtWBenhExaW9UL/c@heinlein.stwcx.org.github.beta.tailscale.net>
References: <SJ1PR11MB61808DA9ECADAC2AB15FBF3C83B49@SJ1PR11MB6180.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xml/lNJTZ0j4WXzf"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB61808DA9ECADAC2AB15FBF3C83B49@SJ1PR11MB6180.namprd11.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xml/lNJTZ0j4WXzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2022 at 05:04:46PM +0000, Jones, MichaelX wrote:
> Hi Folks,
>   For my work here at Intel I wish to have access to the OpenBMC communit=
y to learn.
> Thanks in advance
> Mike Jones.

Anyone should be able to join via the invite link we have published in a
few locations:

    Discord: https://discord.gg/69Km47zH98

--=20
Patrick Williams

--xml/lNJTZ0j4WXzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLVgXgACgkQqwNHzC0A
wRlKuhAAogctV29SqSySJ2QjsftL/8taR/HXYIktZHJYbdbOAMM7p+xiQB/JyDA5
SEIBcoILS4tek9eeY95o4IH12tRNM9G2YixnOYbwVGETh3/dpyynCkJc14cfEg7p
gvtzfPXxakXHXkWyDxtOY/Z+wTR+gsRBugQzfvT2O7KuJ5oUK6PlninORTb5A4RZ
gfe9UZ/cPuBz+uLq/KwFH84LReXGkM7NEztlVyBZ2tzQOzp9HTj/hEDbbWBX2fY1
ODy4p9xm68d3zF+CmlzY6ecSAXj9FtTA4NxtkqG2qSDJR/Z/Q7FBPfYlIiH4WPHL
hRGYQm03+QQWtQ6NgbKIH0KZbcAnr8Df1IaTfwkDXX2fO74tuYKH3MtddX7XQfyS
1ShYWIn6FhqEiNLSwCZUZZ8cm1IQYQGlMmAu9j0UAIjKJyvnX6fjhrdKoXQn6kg6
4cMrS/sDQr9bbNhJXy06R5TWaS4hiEhlmCcbeSROGBVJAVlnGdOG1/pmleHQOIG5
Rz3s62fv3cR34Cp+bDIEGWEZQwkcACxw1T5fBTkkaaGOK2q+f1wFPd9WiRc/XmHp
EGmX/m1nkTkCCMLA+6RQlzMlukY1BouWp+9mIb6iGya9+EfW1Yq7SHZfXYKhk6xS
Ke0O726GAJTd/7qnkka6oxzvLxp7PhAhJqFa0HlUXyUuiHxyPcg=
=12Ce
-----END PGP SIGNATURE-----

--xml/lNJTZ0j4WXzf--
