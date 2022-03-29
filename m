Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250CB4EAA76
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 11:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSPKw6mfvz30Kt
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 20:25:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=E0C2ytxP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E0C2ytxP; dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSPJr1W72z2xCy;
 Tue, 29 Mar 2022 20:24:10 +1100 (AEDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0E5CDD01FD;
 Tue, 29 Mar 2022 09:19:51 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17680240012;
 Tue, 29 Mar 2022 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648545573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OYEQcpxV5ZoCImFdldnCROqjeYEuOqk5lTqs4xQNOw=;
 b=E0C2ytxPlV1W+Oe2MExHPN7L1HAoV5OikaBi/U7DewsMCqNtbPDqkZmi2EkEtqy1h9eSgE
 iiefcHj+RmgZ+f+Nhg1dBvgQLIyFkVMlqvsI0mQLoe4LXrWKzoi2/xC4DJe0nxuepZkThU
 FRyNwSRBCCVeRjb5oEYt0caD6HgzFm/e5R4zbhwmHQOWSB6a/GJnngaEUVODgCoYqdO+7g
 DcfNnSRhpGEP/dmCe7VL2vFiRtpk1xrIevN5WpjBBTppF28IllsoBjw5Ux75BSFoUNa40U
 iEy83TwJxTr5nOyIxsdHupHOzrfEzXzdR3N0Ts3ALvlLshPNCnGr1VoMVatfnA==
Date: Tue, 29 Mar 2022 11:19:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkLPIgwClJAUc1Uf@piout.net>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On 28/03/2022 15:21:08+0200, Jonathan Neuschäfer wrote:
> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
> 
> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.
> 

Maybe we should wait for the market consolidation to end so we can put
all the files in a single subfolder?

this would save us from all the bikeshedding ;)

> >  create mode 100644 arch/arm/boot/dts/kirkwood/Makefile
> 
> The Kirkwood family should probably be sorted into Marvell.
> 
> >  create mode 100644 arch/arm/boot/dts/layerscape/Makefile
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-moxa-uc-8410a.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-qds.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-tsn.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a-twr.dts (100%)
> >  rename arch/arm/boot/dts/{ => layerscape}/ls1021a.dtsi (100%)
> 
> The Layerscape family is part of Freescale/NXP.
> 
> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> 
> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.
> 
> >  rename arch/arm/boot/dts/{ => nxp}/lpc18xx.dtsi (100%)
> 
> Here we have the NXP LPCxxxx family, which is AFAIK unrelated to the
> i.MX family (and thus the bulk of the Freescale legacy).
> 
> >  create mode 100644 arch/arm/boot/dts/vybrid/Makefile
> 
> Vybrid is another chip family of NXP, with a good deal of Freescale
> legacy in it as evidenced by the "fsl," prefix in the devicetrees.
> 
> 
> 
> Thanks,
> Jonathan



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
