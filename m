Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C10DE58AA6E
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 13:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lzkdw4CjHz304j
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 21:59:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VT9RgJ+o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VT9RgJ+o;
	dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzkdT6x2Cz2xH3
	for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2022 21:58:35 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id b18so1801682qtq.13
        for <openbmc@lists.ozlabs.org>; Fri, 05 Aug 2022 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc;
        bh=12EUweBf0CXLW8+gSAKKg9xplGZSYosR37oZCD2Y1Eg=;
        b=VT9RgJ+oVb09HdRQa6Lq62UkO+czbOAM9zhFz3mQzPOunpvHA/Dup3iDIDNBrSTcRg
         ISw6ghOW+btNX/HqH0k2wNgSXpUg9bL7XcttzO3HDDNNozk+y3dM1mVPrsLCuGG1wDEB
         zPDESdIoCLKl87M3ZHZOLwvWZcZCGfdRYxSeLVkv1UokGzv1nB/bnYzWf+ZQw+cvxeeO
         puAKsVq9rrDGTJ2pP8KskFUBBm5iQIXGPWMPTn0Fzqb9UMJ5bQb/k0gtuQPFCBlS4+N1
         kK6jb8sG7doAKbDSIiJhVitTkmnihXzpan+QM+ytoVxdChvksAv2+bOnb1FKMbKjMQbE
         tC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc;
        bh=12EUweBf0CXLW8+gSAKKg9xplGZSYosR37oZCD2Y1Eg=;
        b=gY1MXiWCHUX6aGMLWw+LvgvlIIxyLIS1bMWiH/wm1fXYZ15Wy7/zgiXUSDnXrIThif
         Wp2Cb5ms7kZsurilrO2uKPTlBLUkHjo0ATPpmDR9DvX0MiP29aT9nstYfYZ5Nhlfqmyq
         ktmm+OIB9XVtLZbPiJHgE29dVCJEzKn08o3DvH2IgKG0jAmsYqRLLkObk0jjjaDIZVgp
         j2bfG/xg7vf1yqBcvotiEzRqGwcz//HCoW2/vHsNSPnfTCMMs/JK15VDds0qvaptQ5Xk
         QzH7bHJ/1RNJBBXMCnI9VyWF6Caf7wL74KnS65JNw4XWN3rgotfs3GCPfW7nzN7EQfU/
         vfIg==
X-Gm-Message-State: ACgBeo23gxaHrXv8wgmWfd5GAMpRxh1SlG9dGwmUThuhIVKNFvz/+lzE
	nKkuVhzu5eoybXOu8cMAbw==
X-Google-Smtp-Source: AA6agR4yn9VOrQApcMy/JIE89HsYzBMvrpAkEphl5ssbELPYZNrOf1zrKpwK4oe95pmrgYf1HSEKPA==
X-Received: by 2002:a05:622a:346:b0:31f:c40:eac0 with SMTP id r6-20020a05622a034600b0031f0c40eac0mr5373701qtw.326.1659700711064;
        Fri, 05 Aug 2022 04:58:31 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id c8-20020ac85188000000b0031eb51dd72csm2491484qtn.85.2022.08.05.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 04:58:30 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8c5c:a823:f5bd:8751])
	by serve.minyard.net (Postfix) with ESMTPSA id 4CFC71800FA;
	Fri,  5 Aug 2022 11:58:29 +0000 (UTC)
Date: Fri, 5 Aug 2022 06:58:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2] dt-binding: ipmi: add fallback to npcm845 compatible
Message-ID: <20220805115827.GG3834@minyard.net>
References: <20220804181800.235368-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804181800.235368-1-tmaimon77@gmail.com>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openipmi-developer@lists.sourceforge.net, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 04, 2022 at 09:18:00PM +0300, Tomer Maimon wrote:
> Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> index cbc10a68ddef..4fda76e63396 100644
> --- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> +++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> @@ -7,7 +7,7 @@ used to perform in-band IPMI communication with their host.
>  Required properties:
>  - compatible : should be one of
>      "nuvoton,npcm750-kcs-bmc"
> -    "nuvoton,npcm845-kcs-bmc"
> +    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"

This is just wrong.  The compatible is supposed to identify the device,
not the board the device is on.  I think compatible here should be
"npcm7xx-kcs-bmc", and just use that everywhere.  It's fine if that is
used on a board named npcm845.

-corey

>  - interrupts : interrupt generated by the controller
>  - kcs_chan : The KCS channel number in the controller
>  
> -- 
> 2.33.0
> 
