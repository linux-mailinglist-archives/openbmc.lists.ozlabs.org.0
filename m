Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E530263986E
	for <lists+openbmc@lfdr.de>; Sat, 26 Nov 2022 23:25:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKRC867DJz3f24
	for <lists+openbmc@lfdr.de>; Sun, 27 Nov 2022 09:25:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.44; helo=mail-io1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKRBp60gyz3bjd
	for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2022 09:25:36 +1100 (AEDT)
Received: by mail-io1-f44.google.com with SMTP id r81so5252385iod.2
        for <openbmc@lists.ozlabs.org>; Sat, 26 Nov 2022 14:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlyB3iEQfZN2ouKWA070xdoCwtuTYqQ3/sG9m3p7/80=;
        b=1eUpRb1LtfVavGeECIhptpUYjrInlHckPOpykORYpwktzBwV2QPLwenL2RI3HXoQyz
         jyfm0DVfsx06JvmXbC8VsGKbiHy1cEOyJ+cHYLjmT/6ohQgNqOy5N+Rx51kkmgUEKOzA
         CQC7tLvWyMqHDlxPc/iRPTja77ZMOSbBsjLonjI+by+q3VZVKnY6FgnS316gEQ9xZ5Bu
         YMlbnLClcggsdkpYG3utRYtECrIcdEh6yqHl2om/inkZx+JvIBiAdbNJpJYMzrROlpcG
         GI9A8O+hZjWX5kPsvtPjNDE54IFyukPWeS9qUrjZ4wePWbTzhfeMG3zeBNuUKChD356X
         jQDQ==
X-Gm-Message-State: ANoB5plVTEUHGly9pW5IIML+gvthrfB8xDhL0gknVfJPkUk/UbtugBra
	sect7rkxrFdpSxrcFpyzTQ==
X-Google-Smtp-Source: AA0mqf6yWHEStBRsGoTfckgJSkpmKT6XWvb9nkZy76Ew7cHLnrwvgiNck/FaNKmTl5/fQQkixWY/ew==
X-Received: by 2002:a5d:8941:0:b0:6a1:2c0c:6084 with SMTP id b1-20020a5d8941000000b006a12c0c6084mr10279947iot.128.1669501533882;
        Sat, 26 Nov 2022 14:25:33 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id z15-20020a05663822af00b00389d2ff28a5sm712108jas.47.2022.11.26.14.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 14:25:33 -0800 (PST)
Received: (nullmailer pid 35346 invoked by uid 1000);
	Sat, 26 Nov 2022 22:25:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20221124191400.287918-2-j.neuschaefer@gmx.net>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
 <20221124191400.287918-2-j.neuschaefer@gmx.net>
Message-Id: <166950112932.8087.6546134123286782729.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash
 Interface Unit (FIU)
Date: Sat, 26 Nov 2022 16:25:36 -0600
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Thu, 24 Nov 2022 20:13:58 +0100, Jonathan Neuschäfer wrote:
> The Flash Interface Unit (FIU) is the SPI flash controller in the
> Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
> (memory-mapped) access to 16 MiB per chip. Larger flash chips can be
> accessed by software-defined SPI transfers.
> 
> The FIU in newer NPCM7xx SoCs is not compatible with the WPCM450 FIU.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v2:
> - A few cleanups suggested by Krzysztof Kozlowski
> - Simplify binding by making second reg item mandatory
> 
> v1:
> - https://lore.kernel.org/lkml/20221105185911.1547847-4-j.neuschaefer@gmx.net/
> ---
>  .../bindings/spi/nuvoton,wpcm450-fiu.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221124191400.287918-2-j.neuschaefer@gmx.net

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

