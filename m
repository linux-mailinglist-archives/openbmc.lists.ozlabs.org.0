Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A064C99AA
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 01:04:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Z9R4HCcz3btl
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 11:04:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FNr+IE5S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FNr+IE5S; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7SR427CYz30Mj
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 06:45:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 466AD6164F;
 Tue,  1 Mar 2022 19:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0303C340EE;
 Tue,  1 Mar 2022 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646163949;
 bh=TFMpz0Cc6VsyzxJzd5ZFpb3OuNzOkVyn05Sx0dNcIGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FNr+IE5SdDf1bVYHRNpW2iGCJwTS6U3t1T/Cv+jDQdJzR+IPaauMFsRRf3dhMADh9
 DC/Uj5WTJsPUMXmTvZC3EDLttaXsfz3ScmITAV068+6AC2DmnKaVPzg/TquS4u0m9R
 nzK6CpUe/uPUPsiwytzl1Da+4vEmDtxJFRh/e5LiBHASSxfOd4lmFlL/CKcMQWs6sf
 sarU/6MgR5i62e63aj38JxPVdwhVGCWDs1P5zDvLaz1IBUPBSD5i1V9jXJoANV0Syx
 XifgWSYRrEsN058FteO2k7Oz8V6hhbuhFXbPjgXNFLe5BjJCabxIBOWVoJVh/as34b
 1DZZyF/cXEdQg==
Date: Tue, 1 Mar 2022 20:45:46 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
Message-ID: <Yh536s/7bm6Xt6o3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tyrone Ting <warp5tw@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, semen.protsenko@linaro.org,
 yangyicong@hisilicon.com, jie.deng@intel.com, sven@svenpeter.dev,
 bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
 lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
 <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
 <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
 <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZzqmmcLTueXK0WfW"
Content-Disposition: inline
In-Reply-To: <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
X-Mailman-Approved-At: Wed, 02 Mar 2022 11:03:24 +1100
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
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ZzqmmcLTueXK0WfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'll keep old code as fallback, if getting nuvoton,sys-mgr fails as
> you point out.

Yeah, fallback is much needed. And if you implement it, then you can
also split the series into two. One for the DTS changes and one for the
I2C changes. That would make upstreaming a lot easier.


--ZzqmmcLTueXK0WfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIed+oACgkQFA3kzBSg
KbYcjRAAstcatZMriO8WYTkR7iql0Ykgsnc04dKlPRr6iwYtoyRTgOApX1Jp31Jr
CbI0tKJgBjEwGrrXzkkVP02QIM9ojCZPXIrdV/ZmQ9dgAB3c0xfZ2uEeHAC+iv2p
bx63ccy6tbX6UfFu2FeuS5qmYctOTNu4G0OghUErbqA3JlqSQHXaNIQEkFoL1iiw
anPSYCvvBFJk0DELigsYqEMMuXVtfA+RrmfkMwmTjM1FDh9Q4EsiwEJTdu9Dajjt
EYsNX0CTIZt/54jiBsgw1Y+9YYPOzk8vCsEn4dWYLYkb5aivX/jiuUupVwOI9Dsm
FPQJB8CMf9kyD4awOGCzmjtUDDIlftz7+egbVr/P7ra1vkWiUWLuVtwLjIOmQ02N
sekEy/RBJpmbPCY+1sMqWVkiz2Jzh0ZVNraPw84W9A/vImdz5eUO9zUiKYAmc5dk
UqH4DNFXSUz1HXiQV0MFvMErR3BvnHo0aW2Yex0g41iEVVbt3NegzgVmCnQbvxWO
8aqTaho3IMK6R9qprp+2m/F81hFYJmaLYG6axoMB6dRfYN0VJf7VY1fqOs4jxZVV
poVwHHWgBvFFi27Oh3H/RZ+IaYwY52BOW+4953toW5pRMpXLj289svrTCIzToyGh
f9P2fQeuCBeyiaplAlyxPbk2TdSjl8q2pcGcXzJdISRO8u4/In4=
=ueuY
-----END PGP SIGNATURE-----

--ZzqmmcLTueXK0WfW--
