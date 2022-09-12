Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F75B63BF
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 00:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRLwm11mXz3bly
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 08:33:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=fqatqgOu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M3+yPT0y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=fqatqgOu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M3+yPT0y;
	dkim-atps=neutral
X-Greylist: delayed 74 seconds by postgrey-1.36 at boromir; Tue, 13 Sep 2022 08:33:19 AEST
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRLwH3qj9z2xn5;
	Tue, 13 Sep 2022 08:33:19 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 9AAC75C0086;
	Mon, 12 Sep 2022 18:33:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 12 Sep 2022 18:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663021997; x=1663108397; bh=BlGpyGNetH
	0dfu+MS0Zcjr8kjhe2OqZ2zMEm7PaX9oc=; b=fqatqgOuwf9G2nKhRG+hWQjz9d
	tc8rMU//RxhIcAuW45zXjsJO3S9vZRbK/Xl4fgfh8sW3gAuG8ttc/O/iVsFXOuNt
	LZWVT0MD2fX/LzvygJl+4K8x35j8MHq61lrtPsBcSPvhA6Zxg0nzERUCojoStaym
	iGXuCdsUfpEzzsdGn1CCTGGceVQv0bPwJP6EaauqLk0q07Y3gBJN0AtaAzegX7pi
	l2Ubwg9VvakVRGNTStWcV+8HjCNX5hURjx74zLKJR93a2A2MIcgOLjXwVz+Htiil
	2RZ+sbyDigpbjWRaAZHTRd7UEWkJ+eylz3ZKl7ToEl4I8Yqo3fScktj6seuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663021997; x=1663108397; bh=BlGpyGNetH0dfu+MS0Zcjr8kjhe2
	OqZ2zMEm7PaX9oc=; b=M3+yPT0yGtaeO8xyZAHQf6ksS7DJ+YTaqJMtskXz/Jw3
	WXB4wwlbIcM0wHTZgLQUsSbPoqjem8zsxMNJ5eIDcmbzyRzqoIow0pcGuzFxzIyn
	ah9pRQcO5LdYIIaJVis2hQd9a6ez7kJ3ERLads1kMcpzaoyU/IYVNM7FQpNftpYD
	t2qEIhhgJJcbFU740JBS9ERI3vG64jricrQAAnoDiCwFG1xLzB0F0RqJGMcPqWCW
	Zmdc/0KTks/m45iHdNt4tQ1qaK9Kg728lVCc2ZyaaGs7agJ5VKLINvvBUU7tZvMR
	j6mPCkTG4ZazzDt5up4s9E0Q8jhPj6MOLjK9kNCacA==
X-ME-Sender: <xms:rbMfY1A_m_I59xBEX9iQ7Msrd0RJ0MDTFJw-gWebhyRmqjbIi10VTA>
    <xme:rbMfYzjxscxxknWDC2FSbn1nIlCKIwHXOsMo-qLxJokicB3B_dnbrkxJNXELwiX3P
    TcklqKBVofTEhi7IzI>
X-ME-Received: <xmr:rbMfYwldfO1GyylafwOey24_yWDzmu2yJRsnQNiD7K08kWq8iTSsES6MWQzG8duIxJrSM7tDD5gy5meua9CGjmExNxq3rfET>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedufedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:rbMfY_weubAiLYS5-0pn8RA1C_pBJUY9UlLyRu9uAug1yC53H-9Qpg>
    <xmx:rbMfY6RdPOXfJ-1Mich6_IuyiIeggzZ4O7KeP6Km3pj0S98R2pbUaw>
    <xmx:rbMfYybT6-K1a8mJAuMG4zARYT5nHFkLYH5BaQHc9sHL3iYfqCGRZQ>
    <xmx:rbMfY3Q52pzHX0mH3AJQcWSvP5_gpKEmSVEC250coAB9Gxhf0pHDlw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Sep 2022 18:33:17 -0400 (EDT)
Date: Mon, 12 Sep 2022 17:33:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemitev2: Enable i2c13 controller
Message-ID: <Yx+zrEViePskgaWq@heinlein.stwcx.org.github.beta.tailscale.net>
References: <20220907123810.GA27621@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yDAZokfzATjmbX/8"
Content-Disposition: inline
In-Reply-To: <20220907123810.GA27621@hcl-ThinkPad-T495>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yDAZokfzATjmbX/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 06:08:10PM +0530, Karthikeyan Pasupathi wrote:
> Added IPMB-13 channel for Debug Card communication.

Wouldn't this be better to be the title?  'enable OCP debug card'  Might
need some reference to what an "OCP debug card" is in the commit
message.

>=20
> ---
> --- v2-Updated the title
> ---
>=20
> ---
> --- v1 - Initial draft.
> ---
>=20
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/=
arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> index 8864e9c312a8..84236df522dc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> @@ -215,6 +215,17 @@
>  	};
>  };
> =20
> +&i2c13 {
> +	status =3D "okay";
> +	// Debug Card
> +	multi-master;
> +	ipmb13@10 {
> +		compatible =3D "ipmb-dev";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
>  &pwm_tacho {
>  	status =3D "okay";
>  	//FSC
> --=20
> 2.17.1
>=20

--=20
Patrick Williams

--yDAZokfzATjmbX/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMfs6wACgkQqwNHzC0A
wRmHKBAAlNXFcJtu9yCVKhFfr7GFurgvb0K/iScj3nGp1R13ZouYN4V5ud9h9jtI
8KNzlfq1Rt7FnSWSejfGlty0dOQQViEnmz463uBRmNM4KTfMl+9P5MAGg+FJzNq9
PUxnEIkKtOtC+rRq2PHXmbntqtkquE7q+cxkC8qVsgpUqDrAuDMA1W2cuc2kjZqz
4Ork/zI3eSf/xP9jtvCXvIsqgKwPiXdtk5TMoftWYUAPatS3SCUN83ycKTLIfVEZ
fFCcDlSpqPH5TeZYeOswMIPRQS+imyCUWaQOlEdbYEQlwFmzlgG6LV8/pFjkheoQ
HgxsRKSL6xfVpCRPG5lnds5PKUdvLCpHi5YLnBb6Y5qg+5vt7BvLGqgjeZVc9AFZ
u+t3FPIgmQ+v2CL/2P9/hff50cFFvYIyR2Vn+drH/ML1WOFNd380NQy3RtcPj+Fw
eQZuln4EE3ShoQHme8zHVkmAtjXx9jLEt44ZpBnlkvT9PwVwX+rNm+Cj8MprFU+b
RHMahDMNcf/HE4oT4M84YSW79N1ZWsBOctPC2Z1f23WTWf0Eywv4arqRZN45S0Vj
G/KVJJZGzevDLdYUDuSi/b2UzKZa9u0xwDwtkV7iKqXkiKc+qcOyoY62S2avaf5p
4UKD9C3Daw+CTDmfe89RdTYfLplB8Fk/czldTiyi5sRQychzpf4=
=kf/G
-----END PGP SIGNATURE-----

--yDAZokfzATjmbX/8--
