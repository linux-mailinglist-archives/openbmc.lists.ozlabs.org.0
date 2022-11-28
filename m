Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF963E33C
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 23:16:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMtnz3wkqz3bXG
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 09:16:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=qoNmRgqC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=conor.dooley@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=qoNmRgqC;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Mon, 28 Nov 2022 22:07:06 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLN2y6KBpz3c1n
	for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2022 22:07:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669633627; x=1701169627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/ZYnjHxTbbC8RHpwopjgL6MHoNVmg9d8WyhOCxTzcYU=;
  b=qoNmRgqCChv7VrJWb+XI4OiS1zUarvyNbSUyFkVQmewV75pR0UdPk0mZ
   1B6CtR2JFbkFI3kKOTqtvAW784nJ5x75rl3ATXkQNPvaCjaPwURZEjQsF
   gmAK8LSAqEO+9Rd61OpeD0aKh1TNYniYMzsPkmtgU8ke68daK89mo00tc
   2SIPrROYdDj8KkyLXw0smTuR2vAKUtPNj3sFPRVI+jOEbcuTD2gq2sPra
   9W2l1dCLHBDOfm4uSfykkGfaCNjZYYtIocmXDcDQESf5cC3CgVv6TldD7
   oo0KznRt4Kb/Q/3MtFql8hrhheRyCWXd8dlrk5jhFQBPrOYVUy0A4QGFF
   g==;
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="190793210"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Nov 2022 04:05:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 28 Nov 2022 04:05:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 28 Nov 2022 04:05:50 -0700
Date: Mon, 28 Nov 2022 11:05:31 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash
 Interface Unit (FIU)
Message-ID: <Y4SV+5/3Y0dw5QeU@wendy>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
 <20221124191400.287918-2-j.neuschaefer@gmx.net>
 <166950112932.8087.6546134123286782729.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166950112932.8087.6546134123286782729.robh@kernel.org>
X-Mailman-Approved-At: Thu, 01 Dec 2022 09:15:38 +1100
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Nov 26, 2022 at 04:25:36PM -0600, Rob Herring wrote:
> 
> On Thu, 24 Nov 2022 20:13:58 +0100, Jonathan Neuschäfer wrote:
> > The Flash Interface Unit (FIU) is the SPI flash controller in the
> > Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
> > (memory-mapped) access to 16 MiB per chip. Larger flash chips can be
> > accessed by software-defined SPI transfers.
> > 
> > The FIU in newer NPCM7xx SoCs is not compatible with the WPCM450 FIU.
> > 
> > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> > ---
> > 
> > v2:
> > - A few cleanups suggested by Krzysztof Kozlowski
> > - Simplify binding by making second reg item mandatory
> > 
> > v1:
> > - https://lore.kernel.org/lkml/20221105185911.1547847-4-j.neuschaefer@gmx.net/
> > ---
> >  .../bindings/spi/nuvoton,wpcm450-fiu.yaml     | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.example.dts:18:18: fatal error: dt-bindings/clock/nuvoton,wpcm450-clk.h: No such file or directory
>    18 |         #include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2

FWIW this seems to now be in linux-next as dd71cd4dd6c9 ("spi: Add Nuvoton
WPCM450 Flash Interface Unit (FIU) bindings") & is breaking
dt_binding_check.

Thanks,
Conor.

