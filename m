Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423F5305BF
	for <lists+openbmc@lfdr.de>; Sun, 22 May 2022 22:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5s5G1kqWz3bpT
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 06:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y9+Jk+4d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y9+Jk+4d; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5s4r4zCWz300Q
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 06:09:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E60F360C00;
 Sun, 22 May 2022 20:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606B4C385AA;
 Sun, 22 May 2022 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653250182;
 bh=5mvMD8PeuzewniacwEHPb6i08ZXSrJgyrbjHN+zLXvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9+Jk+4dRba0T68o3Xji13zINRlcHq3We92wtyMOzDynsqze7islOUS3w7w41+ocg
 feDqnn7mM79WHjfXL1IZeQpc1RoWUtZ0s8cwvch4/iqFI9zKtNXUYrqSh2s8jZL9qi
 am3kj3a1b5tbWL5ySclsK7CczRk9unC3YuHtdB8vCX4G7fm3MBwqQv/2xUT2m1/TKK
 E0Em5IrVeShA1fEjlP0GynIf0WXNeWFg13k1K/nWTMjQwiHT1Rs9RhIzwpBRG/TQ0i
 CV1o7q5wPBhp8gwBOvKhYY0dkH5d8hLb4bHclHwqb0XWVTw+KwRqgtgwNLUZXOjN0W
 krLroMeCX6i1g==
Date: Sun, 22 May 2022 22:09:35 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v5 08/10] i2c: npcm: Remove own slave addresses 2:10
Message-ID: <YoqYf0KdNEabT7Mu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
 rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
 jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
 olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
 Avi Fishman <Avi.Fishman@nuvoton.com>, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-9-warp5tw@gmail.com>
 <Yoh/nEYPu++LZSvb@shikoro>
 <CAHb3i=uKwe1RdvzQA=oO6zNmEvyA_awx09+C2w8kbRq_NGi54w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ADMt7ReWlnMJvaGx"
Content-Disposition: inline
In-Reply-To: <CAHb3i=uKwe1RdvzQA=oO6zNmEvyA_awx09+C2w8kbRq_NGi54w@mail.gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, rafal@milecki.pl,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 arnd@arndb.de, sven@svenpeter.dev, Rob Herring <robh+dt@kernel.org>,
 Avi Fishman <Avi.Fishman@nuvoton.com>, Tyrone Ting <warp5tw@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, jarkko.nikula@linux.intel.com,
 olof@lixom.net, Linux I2C <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ADMt7ReWlnMJvaGx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tali,

> So when we encounter a deadlock with this spinlock we decided to get rid of this
> unused feature and get both a stable fix for the issue + performance benefits.
> We work closely with all our customers so we know that this HW
> feature is useless to them.

Okay, fair enough. Thanks for the detailed explanation!

> > Why do we keep this array if we drop the support?
> >
> This array represents the HW so we left it as-is. But I agree it can
> be shortened to one\two.

Would be nice, I think.

> OK, we will move the last two to a separate patch. BTW, this change
> appears in the title as well.

Yes, but I still think it should be a seperate change.

> But now I'm not sure: if you already apply for-next patches [1:7], and
> we change patch [8:10]
> do we need to re-submit [1:7]?

Nope, they are already in linux-next. They seemed like good fixes even
without the support for the new SoC, so I applied them right away. I
hope this was okay.

> Thanks, Wolfram, for your review!
> Much appreciated

You are welcome :)

Happy hacking,

   Wolfram


--ADMt7ReWlnMJvaGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKKmHsACgkQFA3kzBSg
KbYIFQ//T8e9vEjUkF1e/qapo9hAzPMaLW6dsVuIFb2K9pfQQMmA8ZZsG8Lp2uwP
MdHX2nnZrtHiC9oMo8CshGv5yK2pGsZOqGBdEqyZ2/VobZYqXRzk4iaTYZMXsP0z
NedO8w4D86f09sl9iJXUdAba21fEjsJusZsOSkctsLCOXhCWPO3uPTKAQB6pB14Z
9PKs4E6UVDA9VDLo9FllxLjVOecx/A95l+0qpyjiQxtWKWeFi6gC6zI++LJ9aboi
5qoyXIQleMJvOMjm0uxWRT4LeVog9uVp7+LOTo2C24QIn0LCM//NVcytIOonx7Zb
80fATJ4mrpBBICLdd4Hy3lZV8BnpxhPeh7Iq913fkff6B3H7Y/CleHGPIvzEKgaC
YICyGbtAKHh9rdOQimoqjRnks1E8EesgzmGxSMz+ySNgP984vXURsaJSF4Roz2II
9hJC+FOEeAgPyGbL/zEVhbitI723CqOg3TKyfv5tV4WZVFyRQkFNLS8If+fDziD8
B//2/6LuFiZREGASOKSqpXC8hDVutEZWvHOjjjpivsVZ425QdC09N4BQ+SRgzlMQ
yrzDygQrqSkJILWh+K+MMx/ArQO8FF0O2LVI8b8ANLMAhxfCaDGNesK4R3DR4eLo
+FZ09CL6DcX7nu9XMAu6qammXWDwcPK9dBaRA9oTPPq7+JM7YWw=
=dZim
-----END PGP SIGNATURE-----

--ADMt7ReWlnMJvaGx--
