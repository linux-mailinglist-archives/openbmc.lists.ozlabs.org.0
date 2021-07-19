Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C90F3CEB0F
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 20:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT9cC152Mz3bNs
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 04:39:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=jFNc5dIr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=s0/e2omf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=jFNc5dIr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=s0/e2omf; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT9br6Y8vz2yyK
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 04:39:04 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E5575C013C;
 Mon, 19 Jul 2021 14:38:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 19 Jul 2021 14:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wxEIq7k95MQg9s7jk1q3ar+b0PY
 aFm5f85kvKhxWhzM=; b=jFNc5dIrKEljS9qHG+6UQkllAYeRYgainl8kepNSNcq
 Fph7/ADMT6p82eMfrJQShHQr1QvCmqsjNgXErClqhqBvPmsMn8Fjzp2Nd0gxi2hs
 1te/EUt7l07qjzDFP1DBbxrG6Ms+30rg9luW4l1fGPkX3b1SHFgfD4xuJ5lKiA8m
 6AacZsEBMxOx1JIi+DqGxg4iJPnDSKJF3pz6C73LGNVOLCLquDp+X0NC/ImJhiPX
 K11CWlm9EBrLx1VjnvNcQO6QXfpajuhQ7/x73X41ASnFQ3WAS2DMyJ03S60z4JA5
 e+ahg8x9RHimO5dI8yBiYQt291o99YMqA0XO8jOIo5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wxEIq7
 k95MQg9s7jk1q3ar+b0PYaFm5f85kvKhxWhzM=; b=s0/e2omfQRJVXZhKbyyDFi
 r/ulLahhbxs6tw/T92fHfOV929EytcRr7VLRijJjt63q0IwMOYOvpSfQxZApmclV
 iNeops8eC8NTD0Qq9vcrnBMW3Th5VYhBtGp8ifuiJkkD+XHs8vFZZ52QK6Ok417B
 Sl8WPMDgf/uEmUoWI4c+8fSUbEiypZlkQe4JssNR7axAQ+AhB7Tfli43xuhv0YqU
 8AACHO0PToz87OUuFuCN0MyEhuvtIYaJVHprg5Zg1aBbPRcLoUnnSpSIXpC4j9f4
 5RcsjC0IaZKD2CAz3oUVntsQSPAO22aC32y56fyvva5kBBlN5SIpHVydTWTfJwww
 ==
X-ME-Sender: <xms:w8b1YG3-po_ArKWzz87-cZBDabXQBjWQqSjbJ2uv_c0f5OXH4MygGw>
 <xme:w8b1YJFeIo2J-oLGan5BkC5w6Rgb0yNN4fIeF-OFtgt0rDjDlj7mSCg-xO3nOXk9j
 3nwr4WIb1EU9CZim5k>
X-ME-Received: <xmr:w8b1YO7hpNvRj9tC6ob9u9r-2RIRjjpViNZU2KlasiRcjaNl8XDb52sGytyGrqVka_1Ka8yTHO8n0HTVseA-N_nJkO9IFNNyrvSmKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:w8b1YH1ye5ggsKAt-ioAV9IqQ6piGOqa8EnnwG44ytLgQ7TOE3-u9Q>
 <xmx:w8b1YJHR6wIjfx0kKoQh--fGCc_w5z0ngtPveVaCHV_E2v-ZZ9Z6Qw>
 <xmx:w8b1YA8dQ43GLrOoXIrxTlQ25y7YnAjDRgbGchBxLDQ1KRB7octQ_g>
 <xmx:w8b1YMMOR1ozQjJnMEGYVWcieagL0YqO8qIJJaN_QmKrY2XgMbSbpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 14:38:58 -0400 (EDT)
Date: Mon, 19 Jul 2021 13:38:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: VINOTHKUMAR RK <vkrk.user@gmail.com>
Subject: Re: AST2600: Linux driver support for SPI controller
Message-ID: <YPXGwaOaCiE0I04a@heinlein>
References: <CAHf5cscRkiCHw9HmJncTuA9E1dZDmEYTvkhkH4dF-nZcpEDnaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Trdb8rK7TTrHQszi"
Content-Disposition: inline
In-Reply-To: <CAHf5cscRkiCHw9HmJncTuA9E1dZDmEYTvkhkH4dF-nZcpEDnaA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Trdb8rK7TTrHQszi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 06:32:34PM +0530, VINOTHKUMAR RK wrote:
> This is regarding SPI controller driver support in OpenBMC.
> Here is the scenario: Three devices connected *over same SPI controller* =
as
> mentioned below:
>=20
> Firmware SPI Memory Controller (BSPI): (0x1E620000):
>     - Flash 0 (CS0)
>     - Flash 1 (CS1)
>     - MCU/CPLD (CS2)

I would strongly recommend splitting your hardware design so that the MCU/C=
PLD
is on another SPI bus.  The aspeed-smc driver doesn't currently support usi=
ng it
for other devices and I think it would be fairly difficult to do so.  There=
 are
patches available for using the other two SPI engines if they are not alrea=
dy
upstream though and those patches use the more generic SPI subsystem.

The AST2xxx hardware is fairly limited in SPI traffic though, so you will n=
eed
to analyze your MCU/CPLD protocol and determine if the hardware can even de=
al
with your protocol.  There is a single byte FIFO and the hardware only allo=
ws a
read *or* write byte per 8 clock cycle.  Thus, even though SPI is a
bi-directional bus, the hardware available in the AST2xxx doesn't allow it.

> Do we've any other driver support or a solution to handle all the three
> devices? Any help/suggestions would be appreciated.

We have had a few devices where this was not sufficient for the protocol th=
at
those devices exposed and we had to revert to using the spi-gpio driver.  T=
his
is another reason why it is much easier if you split that hardware off from=
 your
BMC's flash device.

--=20
Patrick Williams

--Trdb8rK7TTrHQszi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmD1xr8ACgkQqwNHzC0A
wRnvDQ//cX+Pk0oKggbaNJWzn1BD7PwYcyFXEy9U7xRaTwkU0jhzH7SWNlxpyVAP
u4sV7RX3leN2Hh8qKcLSDzGZhVWAnNXdkOF5n6iBO2wFjCB7MLEo3+TAvav/RQjv
dSoi7VMhhoteHFwBo5hIKmB9kY4itG5A0WSOSUXfAipEelRtP2+CaZW7FVWlKkiO
/2gLsFJUNl2YjMr5CWDuzNCHSTYk7KfJJ/svli7pbZ4p2Qt7DPeTqbqeaiwwXw+c
4LtqUihL1vS1zRC3eqIoiEr4ZPsPoK3ReUb1kjt4pSbrzM/FJ4rY5w7zP0LIApKF
0ZVt4O4NRg18CXuYpiv6koPNikP8+jzwUC+dV95fEnwHyJsxCJWmjnyjRxAYI2OR
pUIbJnAdUOEzyOhirpn+1ooDheCuNOXJC6j5T3pHlpa2KqQQWqyK218akhcEIOhO
lLkvSpPX5kJxfVR4zce6ZsxVo0yHpuxWYy7W7ltlwOGSVI4c1zWEFUHL6HsTVOoJ
5L2ze1HRD+vgRReUAcqN4aDytT6xJ0BY7N0c5sl5dckPzi3RhtpZi0kY5A+lsDpg
S9eTt2K+VhIP8nH8sCuC8XQRDV2LMlgdfIsscgHfEHShntOrMK+UfStdyciRx65l
J46LWSibIyEtUzgexPlRxM0EnEMUvaytCbfAGcKKp7tt4muHegU=
=oYoc
-----END PGP SIGNATURE-----

--Trdb8rK7TTrHQszi--
