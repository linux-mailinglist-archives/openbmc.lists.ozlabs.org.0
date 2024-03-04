Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3897870BF4
	for <lists+openbmc@lfdr.de>; Mon,  4 Mar 2024 21:57:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q7ur/Atm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpWGr4vJjz3d3Q
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 07:57:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q7ur/Atm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpWGB0rBFz2yk5;
	Tue,  5 Mar 2024 07:56:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AAF160C41;
	Mon,  4 Mar 2024 20:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3ACC433C7;
	Mon,  4 Mar 2024 20:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709585807;
	bh=PGm7I2xBC8apFwuKMKOhBF/0kgBpWxKJP5GaEquNHBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7ur/Atm+F0BRx2XjbW/RLO681jkixxNDlhtmnW7AaqfZK5wOt2MFIoSLzPfIvTrZ
	 Zi+nwZHsw3Bcbh+Es7vhBqmOGVB4apczXij+ftNj6iUdqhxQ4MHDeKR5HuQdWZ8KSj
	 KxBU3C08oPCt1+UeaFrru0GO2FL3YnxlGHRBY3Oe18D8eS9ANJ1b0LMJ0Z2as/AyS5
	 NF514VkFKLg9TMBJ2WS63FZ83dOisQ029009jUSYccwpubO86aWLatNTLgqxsmlRdP
	 jAqVWw/BQx/Gr2CRvhmXq9PEUey6KArf0gc9eRC3gDG7KsVrXvwUQdgn66nzNP5HX7
	 EVrWQeLBkZNHA==
Date: Mon, 4 Mar 2024 21:56:43 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Message-ID: <ZeY1i9_liCIjqNYL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tommy Huang <tommy_huang@aspeedtech.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	"brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
 <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
 <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
 <v4nawwb4rwjiy2g7xv2sfyhc545mhk4izb3g22f7jupcevjuzb@nxmqgf2zjyqs>
 <TYZPR06MB61912715EE2869DDB7C3763DE1552@TYZPR06MB6191.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="avejMe9/B1mBt2nB"
Content-Disposition: inline
In-Reply-To: <TYZPR06MB61912715EE2869DDB7C3763DE1552@TYZPR06MB6191.apcprd06.prod.outlook.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Andi Shyti <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--avejMe9/B1mBt2nB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> 	Sure~
> 	Below is my re-word commit and fixes tag.

Please resend the patch with the reworded commit and the fixes tag
added.


--avejMe9/B1mBt2nB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXmNYsACgkQFA3kzBSg
Kbbq4Q//W482FjqPLlxS98dtd5kekeRzwCXdh6wotwierJKOu6De5uec93delN3u
JurwdgVTBV6vASmQSt5Ljl+JsKvRGL44fBLWeItzhTKgnEcUfF5rETgNTXbtiN0U
uMhIcys10oiWK+68nzbycbiIdxU3hdP14TsDn2JI6h4QSqA8H6zJa6u2Cwff19AP
eglXzL0/XxyyUL4wxjSk7Mq7KPql02xZq+S1zw50kaMTiNA28iXOh7zv7MXXMbe9
TK/f5iXsijAhjt3MhkBIvQM9O+0Q3NcDS5P0ByVte3QDv34mHkdS7srfmkrN4d9M
7mHlg0Nqbbst9sRHJXzfqyXrkEciOtIVPw1/03/wYDY4A6r0RxTQwFhXdkT1OgYo
q+ejx44+jXLdAQ/t5qmlG28FNSybIyzSIqE5J85jWnMXdqcv2ulBC7oJJPk/hy/L
IxDwUhgUvVySHyP2gx6M4GBrcGAIQcNedmoGQr5ymo4Kw7zJHru1fnG2cuBMEasv
YeSWQOd6TKoPgmTtA/66i09gem/vzJbyK08JWElhqQZjowmiRwLoztZtTdQ9t4PJ
J1KJkt8EwBPdD43kmPpm5khvU53z6zc0pHZ5T/x36++E5neY/S1O4R/HVKl2VTkM
g8NqxMuMSpawebBzjtH7Klgu8TYAN/csxSuvUjLtTvAqzYVvbCw=
=U+OC
-----END PGP SIGNATURE-----

--avejMe9/B1mBt2nB--
