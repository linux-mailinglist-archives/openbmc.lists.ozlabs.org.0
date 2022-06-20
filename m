Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E855226D
	for <lists+openbmc@lfdr.de>; Mon, 20 Jun 2022 18:41:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRb4W50g1z3c8h
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 02:40:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=n1wHZBcS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRb4027rxz3bpY
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2022 02:40:26 +1000 (AEST)
Received: from zn.tnic (p200300ea974657f0329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9746:57f0:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 46D431EC05ED;
	Mon, 20 Jun 2022 18:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1655743211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=uVkwYYD3WNvkHSrPcC3CPbJPRGT2Rr8D4frbfFUL2Hs=;
	b=n1wHZBcSwAq8PYDjrtgmPSl7w3SaSZeFIoFaI1Uu6DNJRlYzUcqGQdWqi32jQLApZWcS2a
	hse+Za2prAk7smsjcBp9MCBk67LYupuxF7bWvaaFGclzZRn6B6Vgse2fzeRZGyb1KUqLJa
	ZC9u+BDllQRkUxZk5raV/125ljU+3lo=
Date: Mon, 20 Jun 2022 18:40:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: medadyoung@gmail.com
Subject: Re: [PATCH v12 1/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
Message-ID: <YrCi1fg+mUPwZ7sX@zn.tnic>
References: <20220610084340.2268-1-ctcchien@nuvoton.com>
 <20220610084340.2268-2-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220610084340.2268-2-ctcchien@nuvoton.com>
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

On Fri, Jun 10, 2022 at 04:43:38PM +0800, medadyoung@gmail.com wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4383949ff654..7f832e6ed4e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2367,12 +2367,14 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/*/*/*npcm*
>  F:	Documentation/devicetree/bindings/*/*npcm*
> +F:	Documentation/devicetree/bindings/*/npcm-memory-controller.yaml
>  F:	arch/arm/boot/dts/nuvoton-npcm*
>  F:	arch/arm/mach-npcm/
>  F:	drivers/*/*npcm*
>  F:	drivers/*/*/*npcm*
>  F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
>  
> +

That looks like it went in when committing. You can remove it in case
you have to resend v13.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
