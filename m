Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9297E5522C2
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 19:29:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRc8k3tfVz3c8X
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 03:29:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=YSEahRpz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=YSEahRpz;
	dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRc8M4cyBz3bkQ
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2022 03:29:23 +1000 (AEST)
Received: from zn.tnic (p200300ea974657f0329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9746:57f0:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BF7F31EC05ED;
	Mon, 20 Jun 2022 19:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1655746156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=gUlzAeZNwuh0l98Jvd0V4kz7rJaVDobs7VUQsJjRpeE=;
	b=YSEahRpz9+/ygJgmF92+3xk1J5HAo3hHVl4w9sGjucH52jxe7gW9H6wSNQ8CuDpU/r5T0C
	W7BOM9jwhx6/Ngrtqk3n0Brh7nsp200ln1+QzRqPns66eY5a2w5zSmtakQeKrt3jGYkWer
	2GTQ0k8fwOOFgZR46oPpCZUOKpL7ffk=
Date: Mon, 20 Jun 2022 19:29:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: medadyoung@gmail.com
Subject: Re: [PATCH v12 2/3] ARM: dts: nuvoton: Add memory controller node
Message-ID: <YrCuZkvG8atg0z54@zn.tnic>
References: <20220610084340.2268-1-ctcchien@nuvoton.com>
 <20220610084340.2268-3-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220610084340.2268-3-ctcchien@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, linux-edac@vger.kernel.org, KFTING@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org, linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 04:43:39PM +0800, medadyoung@gmail.com wrote:
> From: Medad CChien <ctcchien@nuvoton.com>
> 
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

This one needs an Ack from DT folks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
