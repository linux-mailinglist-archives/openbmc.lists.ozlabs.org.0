Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E414DE286
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 21:29:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKwbV0hphz30RS
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 07:29:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qcrEi+Yd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qcrEi+Yd; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKwb35jZNz30BF
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 07:29:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B67E9B8255A;
 Fri, 18 Mar 2022 20:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94384C340E8;
 Fri, 18 Mar 2022 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647635337;
 bh=Mg/DyLpcoxRXJnmL4DUhCt5Wg1OShxiLk/qxnj2wARA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qcrEi+YdaZwD1LkkwvJbiFVB+9lOkfbIrNDN6upq13gtU6y3N3FKhPMgLamto7jYG
 xevwKfDWxbCUhQuAa3QAwWnOjaG8yVvWyuA+GAHiyEUVAAR1KeloVnhmy1OBfrxsba
 7DstZKquDsuEW4eAaW7S34jtvSd/phliNh6M4TzULd4RZN7ErmCqGMP7a2UsmNlwaU
 QOH7DnffubMCsRRYwofHsKDWg6yAxisponWINosXlaAgg8Pldz8i+Abjj7nxTZHsdj
 W7l5owFFElt0kmu5gnulb+Lss6IGMmF+Q1rsKwuei9aiOop3RK/2FjGu81ShwfedCE
 aSvgZxi4MmCwA==
Date: Fri, 18 Mar 2022 21:28:50 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
Message-ID: <YjTrgia/VX6rBT1r@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com, yangyicong@hisilicon.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, sven@svenpeter.dev,
 bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
 olof@lixom.net, andriy.shevchenko@linux.intel.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5z/A5pCunj4GhFoV"
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-2-warp5tw@gmail.com>
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
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5z/A5pCunj4GhFoV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 04:31:31PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add nuvoton,sys-mgr property for controlling NPCM gcr register.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

There are some comments about this series, so I am expecting a v4
somewhen. However, I already want to state that I usually don't take DTS
patches. So, I guess the path forward is that Rob needs to ack the patch
which is now patch 2. Once he does this and I apply it, you can take this
DTS patch via arm-soc. Sounds good?


--5z/A5pCunj4GhFoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0634ACgkQFA3kzBSg
Kbbklg//Sv2r47FQFg3Yk8MUTB0RS4+pUNIlJHLR548TGl2isIIXUFQ5AY4FrLUB
Vlb41WvFoHVDizEZDtXz1ciqXJrPr6957AX6VpLPw0TiAjEDjWYBxSrmhNgdCzcx
eWSPlSz8D+aGN3X9CKc75S3UCXLAGlTufnlc2Er9raOEUvBsXf4vXv3US4jkoE1S
UC1igte3GDhoK+SnsQh4dAenTUseAcxkJAYZRDZ0Ll/il2Q4P1ZZqndqGIstUA1R
jyVZk8lmB7P8mGhHTdpJlMq33wPHsOx+R5TO+UO9HPGbqso8rNAsDp/50wjrVJQT
saSFrwyrE66gZQVYuikWKW6Ais7XClwj047rlAZ2aFxbCvCiBlu/dLWNr//9++Md
cOcmTP6VCyZveEdEZoY1oHQRRawlIQMoVpiYtELn7Q3Vv//2zcImdkrFoC+5bcf6
/5YwgRSirN6Ih7KaWO1zlGlIf7BV8GmeiDfa1AllahJO1qgqsSZSpeWmWKZ/APnw
trP6iFDftFsBFFKooYtdnwdUTU6eX2KBOwn3OddOoNHmYfN/tiUc3t51OF5Vg8Dp
+8ZXkmHmVkGpxq0lEKRRtsBlQAeZxLapSrwvrNY8pf0Nn3aveX7HpN4x7nkEShZZ
h5yEAUVfSOcAZVj48/7exExVlMPK5CoCpUQfpuHRR+S0WHQdYEQ=
=yg2W
-----END PGP SIGNATURE-----

--5z/A5pCunj4GhFoV--
