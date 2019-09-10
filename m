Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82AAE819
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 12:28:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SLpb03mtzDrhY
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 20:28:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="aEbCPCQi"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SLkz5MCRzDrft
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 20:25:14 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id h7so18025196wrw.8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vEAz+Y7APZfz1l8Dh96l5dI6vRULTuCJ/MZX/t986yo=;
 b=aEbCPCQi0wcPkmxmCDIuGnHOPhylUfSgnlSVwIZ6W2w5o7qQhdLkBb5lz7h87Kf4+0
 uh8Z0WnKWZYkh593TZ9xl2Y+bhFfehBF2Qa4IN6vOJypJN+F2gKkJKTTp3UmT9m3ZW58
 SGIQcXSQjx5L5RAfIBBtFOkIfOXgQkQzD+xiLjRO7Zii80i8bCMpGPnz1kL9f5lkpZOe
 7F6xVFBVBmZqKsnAALHkc8z6Db7ua5cAOQe3bll5o5Yjad1JMTg1DF9GVB8+3MpiLbCu
 yXBh/wYj4RZ6I5CtCoswqeNKEDdlJ16163CLEfR5vxdM7PW53MDiHKWGehXR/a2dbZe5
 lWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vEAz+Y7APZfz1l8Dh96l5dI6vRULTuCJ/MZX/t986yo=;
 b=IRkITBDi8d76htWwQ0nW1q2uTc296bNuMutNORWX3LZlpdlyXTTuMQ5OCS6drXXIVu
 UjUhU1DwKHzNFYlJFW00F72tNSd2lVJ3Vjf9y6s87yVRSboE3Nc63TdZmP0IZoCAIRib
 81n5mqhD0hph1LWgCixI7zeb2l2UNknC+WGArDax07ANrc2pVAkuByeSWeM+yKrJHLwG
 C5b5G77nakKJV/vodQ+d8LprUWgBsX6yxPFD5r2H/wUwqq1PXxe5Qni7Hr+T8fbNh1g9
 ALoIYeBVXXnLYx4EnW0fwwc7BX/Ya2neRzhyjb+uaA3KrB7n8KvSDLK2yVYqRtutIrAt
 6Lqw==
X-Gm-Message-State: APjAAAUI0OoBcvz70fy5yPW9P6sDaRDx3jqpicqsK7x8am1Mdzak705v
 4hkVZXp9/4YDMFJbuxZYznzMng==
X-Google-Smtp-Source: APXvYqwcFh+5AHaeQ32JwyB8p5MAuUpAL0phC2yYPGlCXsZIhaa4ZKBqf85xJnZPvtb1eRPGpd2mqA==
X-Received: by 2002:a5d:500f:: with SMTP id e15mr10799631wrt.300.1568111108330; 
 Tue, 10 Sep 2019 03:25:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a144sm4235807wme.13.2019.09.10.03.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 03:25:07 -0700 (PDT)
Date: Tue, 10 Sep 2019 11:25:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: hwrng: add NPCM RNG documentation
Message-ID: <20190910102505.vgyomi575ldrk2lq@holly.lan>
References: <20190909123840.154745-1-tmaimon77@gmail.com>
 <20190909123840.154745-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909123840.154745-2-tmaimon77@gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: mark.rutland@arm.com, sumit.garg@linaro.org, linux-crypto@vger.kernel.org,
 herbert@gondor.apana.org.au, arnd@arndb.de, devicetree@vger.kernel.org,
 avifishman70@gmail.com, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, vkoul@kernel.org,
 robh+dt@kernel.org, mpm@selenic.com, venture@google.com, tglx@linutronix.de,
 jens.wiklander@linaro.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 09, 2019 at 03:38:39PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Random Number Generator (RNG).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> 
> diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> new file mode 100644
> index 000000000000..a697b4425fb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> @@ -0,0 +1,17 @@
> +NPCM SoC Random Number Generator
> +
> +Required properties:
> +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> +- reg         : Specifies physical base address and size of the registers.
> +
> +Optional property:
> +- quality : estimated number of bits of true entropy per 1024 bits
> +			read from the rng.
> +			If this property is not defined, it defaults to 1000.

There are pending unreplied review comments about this property (my own
as it happens):
https://patchwork.kernel.org/patch/11119371/


Daniel.

> +
> +Example:
> +
> +rng: rng@f000b000 {
> +	compatible = "nuvoton,npcm750-rng";
> +	reg = <0xf000b000 0x8>;
> +};
> -- 
> 2.18.0
> 
