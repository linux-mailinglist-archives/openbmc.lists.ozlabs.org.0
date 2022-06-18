Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A3551221
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 10:06:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMfL3s4Hz3by6
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 18:06:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=ubm9+IAh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com; envelope-from=nm@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=ubm9+IAh;
	dkim-atps=neutral
X-Greylist: delayed 9801 seconds by postgrey-1.36 at boromir; Sat, 18 Jun 2022 15:46:40 AEST
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ4fS5xxcz3bm2;
	Sat, 18 Jun 2022 15:46:39 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25I32Nt4004650;
	Fri, 17 Jun 2022 22:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655521343;
	bh=v9iLe16OQzDjus8PgEyzt81ju785zygpn75Qb7cPKDk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ubm9+IAhGGTk3kdTt5x7vdcv21zn8SduavN1QPsDFtatpMEQLnnpq14kmxzjhSdoM
	 EhSYzwprF+3qoaWgxqEa7tkCA7AfNzT0CIUyyPN2V1vMiSYZKDtU+T7Pvq2yIkEfs4
	 7jCtmDUFYShPMx+ispwTz24Ou/91SMS8cN3blxkI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25I32NTI008896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jun 2022 22:02:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Jun 2022 22:02:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Jun 2022 22:02:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25I32MBg024730;
	Fri, 17 Jun 2022 22:02:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <krzysztof.kozlowski@linaro.org>, <olof@lixom.net>, <soc@kernel.org>,
        Arnd
 Bergmann <arnd@arndb.de>, <arm@kernel.org>
Subject: Re: (subset) [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date: Fri, 17 Jun 2022 22:02:21 -0500
Message-ID: <165552126299.28422.3856100388848453087.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:05:43 +1000
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
Cc: Nishanth Menon <nm@ti.com>, andrew@lunn.ch, alexandre.belloni@bootlin.com, heiko@sntech.de, linux-aspeed@lists.ozlabs.org, tony@atomide.com, linus.walleij@linaro.org, bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk, leoyang.li@nxp.com, festevam@gmail.com, vigneshr@ti.com, khuong@os.amperecomputing.com, peda@axentia.se, openbmc@lists.ozlabs.org, michal.simek@xilinx.com, xuwei5@hisilicon.com, jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, agross@kernel.org, joel@jms.id.au, linux-input@vger.kernel.org, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, kernel@pengutronix.de, gregory.clement@bootlin.com, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, j.neuschaefer@gmx.net, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-imx@nxp.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.in
 fradead.org, kristo@kernel.org, andrew@aj.id.au, dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org, bcousson@baylibre.com, shawnguo@kernel.org, claudiu.beznea@microchip.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof Kozlowski,

On Wed, 15 Jun 2022 17:52:24 -0700, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[29/40] arm64: dts: ti: align gpio-key node names with dtschema
        commit: 85423386c9763fb20159892631eccc481a2d9b71

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

