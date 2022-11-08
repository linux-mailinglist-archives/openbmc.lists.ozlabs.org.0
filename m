Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6E621187
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 13:54:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N67NF5B7dz3cfB
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 23:54:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.48; helo=mail-oa1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N67Mt0cCQz2yHc
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 23:54:17 +1100 (AEDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13bd19c3b68so16103845fac.7
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 04:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DE+XyWQiVN5ob054jGunfYyC5EmPdaoUKQ02JS4SQzY=;
        b=MBGEHhBG86ul79ct/jTRLor7oKS4lvJGGD1QVcTysEJxNPF0SDHNdoQg6+oVMnwg9E
         /tCPwL1AEWogwGrX9iHJTf1+gxfB86G41e/mquu8ZRxxhyIcbhegmBXRXrlm6VrjRfhR
         osPquSpMBP7Int2/wsXHzEqG5AJkTvC5lodCXshsTdq4l9HHTd3MtexXy+/srV68gSyw
         ktd8YzLobaJp1kTywOb00Evhv0TnQxpNzNllSy3+KySC0OrHt2AlWN9I/aKxZpKy5Jg0
         i77qmdxCeQ89pn9hZUNuqGLySNAPC+z2WZn5QjVIlM2pomBiiF6Hfe+ScpXsLtNPGss2
         xAHg==
X-Gm-Message-State: ACrzQf1E9iU6YsHzNzJF8ytkE8C98Xikx5wO51Uz4DRXg8jqddn6VIWz
	+1gFJ+gwjwCou1I/cw+PaA==
X-Google-Smtp-Source: AMsMyM7wgArqbuF5lY4XwPob9rxcmWPy8aaAYCeDk+Dhw5/7qAQJlOjnkzlSx1eXSdY3/4ET2jQfyQ==
X-Received: by 2002:a05:6870:6086:b0:132:e9d6:ea36 with SMTP id t6-20020a056870608600b00132e9d6ea36mr44309846oae.116.1667912054075;
        Tue, 08 Nov 2022 04:54:14 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m8-20020a4aab88000000b00480816a5b8csm3141349oon.18.2022.11.08.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 04:54:13 -0800 (PST)
Received: (nullmailer pid 3254925 invoked by uid 1000);
	Tue, 08 Nov 2022 12:54:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jim Liu <jim.t90615@gmail.com>
In-Reply-To: <20221108092840.14945-4-JJLIU0@nuvoton.com>
References: <20221108092840.14945-1-JJLIU0@nuvoton.com>
 <20221108092840.14945-4-JJLIU0@nuvoton.com>
Message-Id: <166791192799.3252677.10703620015363460099.robh@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
Date: Tue, 08 Nov 2022 06:54:14 -0600
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
Cc: devicetree@vger.kernel.org, KWLIU@nuvoton.com, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 08 Nov 2022 17:28:40 +0800, Jim Liu wrote:
> NPCM750 include two SGPIO modules.
> Each module supports up to 64 input and 64 output pins.
> the output pin must be serial to parallel device(such as the hc595)
> the input in must be parallel to serial device(such as the hc165)
> 
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v2:
>    - modify description
> ---
>  .../bindings/gpio/nuvoton,sgpio.yaml          | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/gpio/nuvoton,sgpio.example.dts:35.3-36.1 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/gpio/nuvoton,sgpio.example.dtb] Error 1
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

