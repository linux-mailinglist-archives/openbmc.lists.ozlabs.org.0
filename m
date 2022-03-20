Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E064E1AEE
	for <lists+openbmc@lfdr.de>; Sun, 20 Mar 2022 10:42:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLt8J2YNNz30Q9
	for <lists+openbmc@lfdr.de>; Sun, 20 Mar 2022 20:42:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SJCZbu5F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SJCZbu5F; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLt7t1CqMz2yyn
 for <openbmc@lists.ozlabs.org>; Sun, 20 Mar 2022 20:42:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6F3FB80E3B;
 Sun, 20 Mar 2022 09:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA43C340E9;
 Sun, 20 Mar 2022 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647769331;
 bh=m+CrXHcs1IMz031io+qrVwSLHQcIkDc2WgYRBJMoU5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJCZbu5FTyVw0taTsBz0vOAiE+XN0VdhH5f9jqSD6hhSETTg2crd9GcDC3tMqcq9O
 crMsDdveov+dpqa5KsNJLxCkdzYtdp7u/knUnkWSQB5/SH5br4ZXr6A8qXBPIzV+tO
 KWUXxmCuYOH1l1sRamcEmt9hNAeKvyKJxwDVxNN6NsUuJA0L8eBaJbsn7La85DMoyO
 0Db5sSXyhbZImY+adn7DqnDhUscYF7vfYJpaJHXaM5juFox+JK+HtfpxPNJnv0x6HD
 Z4VxOnPUYP3u3qSTQjlmiMBVwAk8ELMWyGsHzaTSSLDQx4PDHN9T2t17D9qLCdUYr4
 2HSZAlJoKtZGw==
Date: Sun, 20 Mar 2022 10:42:05 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
Message-ID: <Yjb27Qbl8VRFZTkm@ninjato>
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
 <YjTrgia/VX6rBT1r@shikoro>
 <CACD3sJarf9jBny8ru0YihehT4C6k1pqw9Ln+5a+Rs6_F_o6=AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zy3zYHWxJ9cmIO3t"
Content-Disposition: inline
In-Reply-To: <CACD3sJarf9jBny8ru0YihehT4C6k1pqw9Ln+5a+Rs6_F_o6=AQ@mail.gmail.com>
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


--zy3zYHWxJ9cmIO3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tyrone,

> There are still some discussions for the patch V4 and it might take
> some time though.

Take your time, I am not in a hurry. Just wanted to outline the best
process so it will be easier to apply the new version.

> Yes, the dts patch could be submitted via arm-soc.

Great.

> I really appreciate your comments.

Thank you and happy hacking,

   Wolfram


--zy3zYHWxJ9cmIO3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI29u0ACgkQFA3kzBSg
KbYWaQ/+OmWLzRVx0uITX7+yRTH8JlxcvGXr/kxT3kHYYKURJbJQLUDXrLgAasbq
Yaf+7x9LECjsNF2zpr6ndF/pxvClrDmVdH7MMjjXrpMVgcFFQiJFufMkDDURtT+w
ed7maEfDwwk1gjnrgZfmIKONhnrw0PwOxu+W+5N+gT7cX/i6/cmm4k9OMV18VJLs
hMhz/DXuYFwqj/NKrDbQSqeRp9hPmNWXMWHWBaJARZOL6rB7/uLwM2JvJOJl/1gS
X5upnQGJIBQs9LQ8TKFZqBHLb6HUBi4YE/EKGfVsAmJh48TdaIe4ava7X1ec41wc
MBKW64Q5Hqmh85pSZLwTqkbhS/4xFIDUClPuV3ED8RzOdVWD9EMc3ubXrxYppEU1
dTsp76kgMJjVoa17zizzMx2dvvceuonI0QPZvltb/qoWWeGrPt6HS5Lr+GzMtQ+e
6tuIcmCxQnbIPVNvsXAO+ISzw4g07AEJTHD7azy3PMVRoo6YBajHiwWbRC9Q6+Iw
H1BYlsOIvrVrYyydfN1gnxycbnwGDVu3ZVy+CCwIAeU4QLzHW+HobLHQg+U76wOr
sz/KN/t+7XzP3bHUiLI9DjBP/PLxs5A2fJqNMZi8MiOH6WGAFPOJ+cP4GRN5F4Hk
1xyPmSk+WQHr33vieTjYoG3hIAuMvJQPvbyyVAsl8rT0o/3/Ic4=
=7k8X
-----END PGP SIGNATURE-----

--zy3zYHWxJ9cmIO3t--
