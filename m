Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6305961E259
	for <lists+openbmc@lfdr.de>; Sun,  6 Nov 2022 14:27:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4wC7057Nz3cLr
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 00:27:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.175; helo=mail-oi1-f175.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4wBl40vfz3cG1
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 00:27:09 +1100 (AEDT)
Received: by mail-oi1-f175.google.com with SMTP id t62so9692771oib.12
        for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2022 05:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=70rG3D8Yrp5l4kQEMqm9SiHO8UxHi0ydxic0NbAwdXY=;
        b=YxU6AZw/+U916u3XBgVTbm3oIcvWzn3T6Co2NUWJZh+cUaPvF7uvPN9f3QgoIOsj7P
         NHOOY5kwHR1etwSBUwDwWj7drQVWOMZ9mgVwtA11T7xY19zpEQGe4xGmZ6s3K9XLKIEA
         QgnwkIXOvkdGVwtysSaDbCbi7+OTrq0xrQBYFcqWM+QfzvcAjyLKf8/R9/Remn7PnM7n
         PTez75QIBfzNEGXZX9J/mOtjCl+L1qSbh2htSuOdMzN9TXc10gFstRMaEEDiF6+f05to
         7h95FnbmdYQY1pPkKwaHV0uNAYwPxRhtqCAoY7Eot+6FVJhTg9ycrrnFeRiclyT/p1+R
         S9UA==
X-Gm-Message-State: ACrzQf1gSJuP6Y/2fHLP7xWHO5VFZ1v4IU0as8RgnZTLUNln2V7lCFzB
	Tzayf/oGmKyPIiS8LdY6Mg==
X-Google-Smtp-Source: AMsMyM7Sls3WiTU2TvqdLp/oEK24gdz+axBLfyyb2HTGWnoficc1u8L89/xNoNFThGX+S2ZP2YkBgg==
X-Received: by 2002:a05:6808:1823:b0:35a:6f80:6398 with SMTP id bh35-20020a056808182300b0035a6f806398mr4003830oib.68.1667741225773;
        Sun, 06 Nov 2022 05:27:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ek17-20020a056870f61100b0013c50b812a2sm1878335oab.36.2022.11.06.05.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 05:27:05 -0800 (PST)
Received: (nullmailer pid 2692032 invoked by uid 1000);
	Sun, 06 Nov 2022 13:27:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20221105185911.1547847-4-j.neuschaefer@gmx.net>
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
 <20221105185911.1547847-4-j.neuschaefer@gmx.net>
Message-Id: <166774077447.2683568.10429527253386553094.robh@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: spi: Add Nuvoton WPCM450 Flash Interface
 Unit (FIU)
Date: Sun, 06 Nov 2022 07:27:07 -0600
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Sat, 05 Nov 2022 19:59:06 +0100, Jonathan Neuschäfer wrote:
> The Flash Interface Unit (FIU) is the SPI flash controller in the
> Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
> (memory-mapped) access to 16 MiB per chip. Larger flash chips can be
> accessed by software-defined SPI transfers.
> 
> The FIU in newer NPCM7xx SoCs is not compatible with the WPCM450 FIU.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../bindings/spi/nuvoton,wpcm450-fiu.yaml     | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.example.dts:18:18: fatal error: dt-bindings/clock/nuvoton,wpcm450-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

