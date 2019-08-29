Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA2A4CF5
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:59:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBYx3ZWPzDqRg
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:59:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="SzqqW5aR"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jzrs2phqzDqdh
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 20:49:49 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id q12so2877589wrj.12
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jHeD3Kv+tcMAmS4H+Al9j1578BcUWQlA5QOhrftK1uI=;
 b=SzqqW5aRW4Dk4d6Y6jVRNDP+Rh3WbyRh3k50TxR1LeEohULvTL9Bj5hdTjKoTWslIs
 z/W5UBReyHzNQg80Xsmi4rwuXxQBvmYDHFqHTi/hZWkoL9/04zoHnejKiClOG8BrGxH+
 /5UVeX4auI4tiLjKX8ERhmRthajmadmWorm2eKbV/cHck6rq2UQrRZl0pcLIpHq3LaoS
 2V9BqJYyd8+EEbTP9JWGTrdPmHG+OjYTFM7Fq5bkaz8kXWPR1BIzfJgfAxYlnPpNOKW+
 lQ6wdhg4GXen+v34r92oR+rVXG8sZog/5EOUXX7JmCrFw7EBFbzuU2vffUQdZcygASRr
 y4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jHeD3Kv+tcMAmS4H+Al9j1578BcUWQlA5QOhrftK1uI=;
 b=DMIWegXdyvNhDKcZnX8G8MjWPFLWPzvx2GdjD/XSlhH6Bf8VzueZov7Rh9CXhx/dpW
 ZEZpeQM97ak2wYlZdK3KE79Lm6vAgUP6HjxIveJVbbCDIOoM149D9GqUL+Vl7n/HgOtD
 GXVGxsXQIsH7IOfI8g8VpL6pUHikCw2BLxSGAvhJJS4iOoG2QADe/4/3IM+mMwHAB8gE
 rpcw+PT5XQsBv6E+twQO5ZKrsNaifptRX8vCd3pv4fiT0eUaTcHAprBV6di/PKjCD8Mj
 CkNVvqK+941jo5uSzOh5fm+Xl7VtP49bihU0ODpcj0cqLr0WOcfHyeJXdyx4UHdujNnD
 /7/Q==
X-Gm-Message-State: APjAAAWnIiB/k8GzK84KHGgXgAODwwbzRWJIcLpJba/pFx32Uf3q2auN
 gNR49fr6bPsXyKu13fwIWGYFZA==
X-Google-Smtp-Source: APXvYqz2qMe+fh3q/bTnYSOCuAtlMqCAz/KWKJ3lcS/jq5IqYKlKwb73QOH+7q7x/7umHXur6XZItg==
X-Received: by 2002:adf:fc03:: with SMTP id i3mr5602097wrr.48.1567075784823;
 Thu, 29 Aug 2019 03:49:44 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s1sm4927621wrg.80.2019.08.29.03.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 03:49:44 -0700 (PDT)
Date: Thu, 29 Aug 2019 11:49:42 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: hwrng: add NPCM RNG documentation
Message-ID: <20190829104942.uyz5ms4m65hcqvmk@holly.lan>
References: <20190828162617.237398-1-tmaimon77@gmail.com>
 <20190828162617.237398-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828162617.237398-2-tmaimon77@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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

On Wed, Aug 28, 2019 at 07:26:16PM +0300, Tomer Maimon wrote:
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

Having a controllable quality implies that the numeric quality of the
peripheral changes when it is stamped out on different SoCs (otherwise
the driver can confidently set the quality without needing any hint
from the DT). Is that really true here?


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
