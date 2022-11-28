Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AED63E343
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 23:17:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMtq21yZMz3bZ4
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 09:17:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=znGwsZof;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=conor.dooley@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=znGwsZof;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Tue, 29 Nov 2022 01:11:07 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLS7H65skz2xl6
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 01:11:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669644668; x=1701180668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Hi8mtuMtBxkZtTKEz9kvonjsKm5H9vDF/St1rZpRREA=;
  b=znGwsZofs2RgtkoPdsQIlcPnbWReaWFKoDfgz8eQVkSA+vOTPa322hFT
   YJRh/08sMGqWP7a+gnrDEZw6+HUGDiQMoiiatFFUtVph0XjvB9o6+Kit7
   JwLKeZN98h7MONFUyjukZG34dzNk27BAOs0nkudUscg4WjX3Das5S/8rS
   fj50TY6WUMI+6zcoB8cii12TLAKnpkDMzT029pDf+IntgeGttrCTram1B
   bV3oLtb97hjFXnxWzXGOxFqJTA+rWkPuXILTnKAuIChuKPMlklt23ZnMm
   AtAhVswLD8oCE433xyxbeW/SSkL0oS0HN0xNE9G5sgzgl2uDW9uaikZCK
   g==;
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="185487674"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Nov 2022 07:09:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 28 Nov 2022 07:09:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 28 Nov 2022 07:09:56 -0700
Date: Mon, 28 Nov 2022 14:09:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash
 Interface Unit (FIU)
Message-ID: <Y4TBIah6vJAG3kj2@wendy>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
 <20221124191400.287918-2-j.neuschaefer@gmx.net>
 <166950112932.8087.6546134123286782729.robh@kernel.org>
 <Y4SV+5/3Y0dw5QeU@wendy>
 <Y4S+oWz8fNsQj5Gj@probook>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y4S+oWz8fNsQj5Gj@probook>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 28, 2022 at 02:58:57PM +0100, Jonathan Neuschäfer wrote:
> On Mon, Nov 28, 2022 at 11:05:31AM +0000, Conor Dooley wrote:
> > On Sat, Nov 26, 2022 at 04:25:36PM -0600, Rob Herring wrote:
> [...]
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.example.dts:18:18: fatal error: dt-bindings/clock/nuvoton,wpcm450-clk.h: No such file or directory
> > >    18 |         #include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
> > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > > make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.example.dtb] Error 1
> > > make[1]: *** Waiting for unfinished jobs....
> > > make: *** [Makefile:1492: dt_binding_check] Error 2
> > 
> > FWIW this seems to now be in linux-next as dd71cd4dd6c9 ("spi: Add Nuvoton
> > WPCM450 Flash Interface Unit (FIU) bindings") & is breaking
> > dt_binding_check.
> 
> Ah, sorry about that. It should resolve itself once nuvoton,wpcm450-clk
> binding gets merged, but I don't see a definite timeframe for that, yet.
> 
> Alternatively, I can send a patch to simplify the example in the FIU
> binding.

Without being a Responsible Adult^TM for either SPI or DT, my preference
would be for simplifying the binding so that if your clk stuff doesn't
land for 6.2 the binding checks still work.
