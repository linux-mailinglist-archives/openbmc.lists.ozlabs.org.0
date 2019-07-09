Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6962D8F
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 03:42:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jQ6L70vJzDqRD
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 11:42:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.166.66; helo=mail-io1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jQ5F3wjfzDq8v
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 11:41:04 +1000 (AEST)
Received: by mail-io1-f66.google.com with SMTP id k20so39623257ios.10
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jul 2019 18:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/fpLbSng1uN6X7o4b5xQuv3f/Fj2KEoI/i2jodHhjdM=;
 b=ctev0oJ2x2zlaePW7y2Z+SXkcLFQ+UZXk3GoJporQuM9Bi5H9KkHQBigW4YbqLc1Ww
 dpVC3XmmRde77d4Gk3/XPYqn6WBxKA9aaVWNZVNfl20hgpW8P708NTGB6wTwLhpBJu7H
 oLmoDfRlI0bgO16vyqfHfi/ejfS5o9dsRis/U60lkZN5iocJ/Q7NOSeIwtYzuS2hmnoD
 PVsFGloJpGXUoa21/FfuuoAfnyTGhm3o7OWZqsbFHKRvqCduArU5o9Vmr7y0x4fMHwAE
 37HOj1e89YW+I8u7H/DQ0uNt0oCr3Z5JUKFBz3UmMP7JzFAHq6UKh3sw8k3uLNSks2kI
 DqSg==
X-Gm-Message-State: APjAAAXn8ASPaCCUT8CVcZgr7X9dBhGhTTnLbFDPoaU6fnAR5vXUF9J5
 vZagup0sLog24ExKjOoSCw==
X-Google-Smtp-Source: APXvYqwXjNg2CA80+uLWD4z0UL3VPDGz/jzUkMpvESID16KJ5KddPNLxNm0TuJc/0RtYi0YQQa3HZQ==
X-Received: by 2002:a02:22c6:: with SMTP id o189mr23689060jao.35.1562636459755; 
 Mon, 08 Jul 2019 18:40:59 -0700 (PDT)
Received: from localhost ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l2sm14566219ioh.20.2019.07.08.18.40.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 18:40:59 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:40:58 -0600
From: Rob Herring <robh@kernel.org>
To: George Hung <ghung.quanta@gmail.com>
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
Message-ID: <20190709014058.GA30269@bogus>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
 <20190605141253.38554-2-ghung.quanta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605141253.38554-2-ghung.quanta@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 paulmck@linux.ibm.com, wak@google.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, tomer.maimon@nuvoton.com, devicetree@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Avi.Fishman@nuvoton.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-edac <linux-edac@vger.kernel.org>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2019 at 10:12:53PM +0800, George Hung wrote:
> Add device tree documentation for Nuvoton BMC ECC
> 
> Signed-off-by: George Hung <ghung.quanta@gmail.com>
> ---
>  .../bindings/edac/npcm7xx-sdram-edac.txt        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> new file mode 100644
> index 000000000000..dd4dac59a5bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> @@ -0,0 +1,17 @@
> +Nuvoton NPCM7xx SoC EDAC device driver
> +
> +The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
> +uses the EDAC framework to implement the ECC detection and corrtection.
> +
> +Required properties:
> +- compatible:	should be "nuvoton,npcm7xx-sdram-edac"

Is this for the whole SDRAM controller or just ECC related registers? 
In the former case, the naming should just reflect the block name and 
not a Linux term.

> +- reg:		Memory controller register set should be <0xf0824000 0x1000>
> +- interrupts:	should be MC interrupt #25
> +
> +Example:
> +
> +	mc: memory-controller@f0824000 {
> +		compatible = "nuvoton,npcm7xx-sdram-edac";
> +		reg = <0xf0824000 0x1000>;
> +		interrupts = <0 25 4>;
> +	};
> -- 
> 2.21.0
> 
