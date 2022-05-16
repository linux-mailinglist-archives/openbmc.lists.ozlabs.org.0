Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62013528E7D
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 21:48:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L28v70mQnz3bym
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 05:48:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEevVY1U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OEevVY1U; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L28th2TXNz3bxH
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 05:48:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 405DC60A51;
 Mon, 16 May 2022 19:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E80C34100;
 Mon, 16 May 2022 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652730488;
 bh=8saUzmqA0TOvmnjsDMAn3OVfh2E1uA+myZYrsq0y0hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OEevVY1UECT25EBcbHYE8J4mfBKuo+DyKQ8QD0QiEhQtGbpIuzKP5GI6z4lI1eXsB
 81nbnWHIs/OOEJvNw6Hl6ZJ5HYOz0op63d9rpo3Ah1d2pEYVg1zdSAAkqwnRhlK2sd
 46p32qHgAKWCrxAlIYtwD8AiB8kwIftyEySQECuMqC+bWkOOQ+K1M+M/nHkkGU4E9Q
 UmK3i1TjPqmS9KKjWDUiaY9c1i4o2b7DW2j9IeYqZtkSDjS5CGsUADi21K8ORTXCda
 wC/qIKs8aF8WM1iVXxLFHZSXOx7twJsthoezj9YOGgMF1H+6RME/ljFbe7cCiezfIt
 rEMovxZjmG34Q==
Date: Mon, 16 May 2022 21:48:05 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
Message-ID: <YoKqdfLSeJ69WFhi@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Bta3H5MZ7K5kULNQ"
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-3-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, benjaminfair@google.com, krzysztof.kozlowski@canonical.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com,
 tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Bta3H5MZ7K5kULNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 05:16:47PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Change the way of getting NPCM system manager reigster (GCR)
> and still maintain the old mechanism as a fallback if getting
> nuvoton,sys-mgr fails while working with the legacy devicetree
> file.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Tyrone, your SoB is missing for all patches from Tali.


--Bta3H5MZ7K5kULNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKCqnUACgkQFA3kzBSg
KbZ34Q/+OETkCQXb502yS3rtiWo8z1tWp3hrOEDevtsQso3n1oiwKkySOcuqiLsb
f/u+j1YLisJPS6Zdcg7bfi5bGruOmGG4O03ZqAwLfoRXzgwkMchSEB9Ti3HbdIe/
mqlOfmDYXMek199DevOBKY5AouPHsVbuVj8ihNTlARtxx1WHT43w2nWj9w4GAfWg
p2hJG467QwoHNZ5aoNH9JkFW5JxjIkn8ZVOQfBZ8juWTY9s7X/J/Mqq3PDUjAssE
csolAlW117VU2Bde3yWzy9joNo2Cz1acSHXDK2dTFbCccvK/Pm+UsRxrOnNaUSAM
wdX8RvPB8pku8scSI42QR8c3Y3Di6thLgvLJ08zOzVOHrsd7MThvn0cqJuo93VqL
qEoSmGMbKVVUewpD9P9xGat8IfRbaEDeJn7dMXUNhckb5UXVB78eg/SUdMPuhTkr
Nojnyz8XNgFbIWyrtyvJ9Amr1F4pLEJURpfWJkH9xys1BPCdQt8efMEVJPmVyFip
K6SfQt6ZaXlSkAy//W6Y5PDwgNLJWbsoAQ5feStuhpJpLKwsrWfE0DUHn+V41EAv
0V7AAekM8XRVe3lsC+oAw6VJYoTPD6cwMgp8DW/Lb3BPGltoi5W7KD5HZ5aV3E8K
g4P97TcCmS5+YF9a2+PuTsaOBF61n6F7lOwoiJcYW9U0p3ceOws=
=hHWq
-----END PGP SIGNATURE-----

--Bta3H5MZ7K5kULNQ--
