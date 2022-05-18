Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C246052C113
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 19:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3L3h4B13z3c8w
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 03:45:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=QgCtwW8B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=QgCtwW8B; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3L3B123vz2yPY
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 03:44:37 +1000 (AEST)
Received: from zn.tnic (p200300ea974657d0329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9746:57d0:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 482851EC064D;
 Wed, 18 May 2022 19:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1652895868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=BSrK6ISkCDs9DDx3yHsim7FQBme+cBGtrIf8vV2CXP4=;
 b=QgCtwW8BgIpZDZ4SVm1lnqK7AQshTGtATAdfZqSJsD/6Kkg3SYkhtLYKOWwFVftsJ8D5fe
 3VZQm4soeBvt0bQkhY1d9gG8wq2efOLGJ6Wf3PfaeZX9APZ44EtemhKfjBi64QOsfbRvvj
 xSlR4mBGiMXGqg9F469FxEY6wyydLdw=
Date: Wed, 18 May 2022 19:44:27 +0200
From: Borislav Petkov <bp@alien8.de>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v9 1/3] ARM: dts: nuvoton: Add memory controller node
Message-ID: <YoUwe6Tj4Uh6ukc8@zn.tnic>
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-2-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220510031056.1657-2-ctcchien@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 benjaminfair@google.com, linux-edac@vger.kernel.org, KFTING@nuvoton.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, james.morse@arm.com,
 YSCHU@nuvoton.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 11:10:54AM +0800, Medad CChien wrote:
> ECC must be configured in the BootBlock header.
> Then, you can read error counts via the EDAC kernel framework.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 3696980a3da1..ba542b26941e 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -106,6 +106,13 @@
>  		interrupt-parent = <&gic>;
>  		ranges;
>  
> +		mc: memory-controller@f0824000 {
> +			compatible = "nuvoton,npcm750-memory-controller";
> +			reg = <0x0 0xf0824000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
>  		rstc: rstc@f0801000 {
>  			compatible = "nuvoton,npcm750-reset";
>  			reg = <0xf0801000 0x70>;
> -- 

Please integrate scripts/checkpatch.pl into your patch creation
workflow. Some of the warnings/errors *actually* make sense.

In this case:

WARNING: DT compatible string "nuvoton,npcm750-memory-controller" appears un-documented -- check ./Documentation/devicetree/bindings/
#35: FILE: arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:110:
+                       compatible = "nuvoton,npcm750-memory-controller";

For that I'm guessing patch 2 needs to go first in the series.

In any case, the first two need an ACK from devicetree folks.

WARNING: From:/Signed-off-by: email address mismatch: 'From: Medad CChien <medadyoung@gmail.com>' != 'Signed-off-by: Medad CChien <ctcchien@nuvoton.com>'

For this one I wasn't sure so I had to ask: I guess it kinda makes sense
to have the From: be the same as your SOB email. I.e., make sure the
right authorship and SOB is maintained even when sending from machines
with broken email setups.

And that you can fix very easily: just add in your .git/config:

[user]
        name = Medad CChien
        email = ctcchien@nuvoton.com

and git would use that as the author and also slap a From: at the
beginning of the patch with the correct name and email address.

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
