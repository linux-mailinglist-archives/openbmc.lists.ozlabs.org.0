Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CF46D4B3
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 14:45:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8JMS11Kvz30R1
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 00:45:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.180;
 helo=mail-oi1-f180.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8JLn23vNz2xtc
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 00:44:48 +1100 (AEDT)
Received: by mail-oi1-f180.google.com with SMTP id bf8so4182563oib.6
 for <openbmc@lists.ozlabs.org>; Wed, 08 Dec 2021 05:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eIDyK7IaEt6AWxSPZLft57NpyzGJfPRgZj/kMkxWENE=;
 b=4Mqj0r7UAPGq3wx8MUQ5vUjcVsqzPPnmre+fPc239pDlm/951bdNbHIjEH0mCChJA/
 JgKcwOuLepPS5n74zoqp8mqzM2pDDg8SbKPpvX7b0zHI3WlKGk3dy0pr9sM8T3aR2V8b
 6JULyU0grAyHeDx/BmJY42rCAoLYDN8l9j+m62ltwADTGGd2yd/+a7nyWj18EnQNibSQ
 jnNqigdmEEjKPJubSmJZdnpRRBSaFBdcKa4eQ8b2nX62p8beoJ6Zjtwlcc3K+HhCmHSN
 /qxJAkzd+zFZ9t48z0HEt2IHC/+SZlfISCW5m/AklNz+P6skGmHSGey6uhWzdnFsCRRK
 Y4Dg==
X-Gm-Message-State: AOAM533kcodYI6xomDttKx/cp3Tw2EMC0kZ+9hsCLQsb5rbDiAFzxHwI
 4dR5tOhMDZniZNZNMD99Xg==
X-Google-Smtp-Source: ABdhPJz9YvJWuibEYQzebm5H3zO4j8sZZJym7m5fdDKQt86UCjfwAiPutT7QpChbFcbNbWW9u//YRQ==
X-Received: by 2002:a05:6808:1885:: with SMTP id
 bi5mr12257718oib.54.1638971086359; 
 Wed, 08 Dec 2021 05:44:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w4sm665805oiv.37.2021.12.08.05.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 05:44:45 -0800 (PST)
Received: (nullmailer pid 3857730 invoked by uid 1000);
 Wed, 08 Dec 2021 13:44:28 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20211207210823.1975632-5-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-5-j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Date: Wed, 08 Dec 2021 07:44:28 -0600
Message-Id: <1638971068.731875.3857729.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 07 Dec 2021 22:08:19 +0100, Jonathan Neuschäfer wrote:
> This binding is heavily based on the one for NPCM7xx, because the
> hardware is similar. There are some notable differences, however:
> 
> - The addresses of GPIO banks are not physical addresses but simple
>   indices (0 to 7), because the GPIO registers are not laid out in
>   convenient blocks.
> - Pinmux settings can explicitly specify that the GPIO mode is used.
> 
> Certain pins support blink patterns in hardware. This is currently not
> modelled in the DT binding.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> 
> ---
> v2:
> - Move GPIO into subnodes
> - Improve use of quotes
> - Remove unnecessary minItems/maxItems lines
> - Remove "phandle: true"
> - Use separate prefixes for pinmux and pincfg nodes
> - Add nuvoton,interrupt-map property
> - Make it possible to set pinmux to GPIO explicitly
> 
> v1:
> - https://lore.kernel.org/lkml/20210602120329.2444672-5-j.neuschaefer@gmx.net/
> ---
>  .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.example.dt.yaml: pinctrl@b8003000: gpio@0:interrupts: [[2, 4, 3, 4, 4, 4]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.example.dt.yaml: pinctrl@b8003000: mux_uid: Additional properties are not allowed ('phandle' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.example.dt.yaml: pinctrl@b8003000: cfg_uid: Additional properties are not allowed ('phandle' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.example.dt.yaml: pinctrl@b8003000: '#address-cells', '#size-cells' do not match any of the regexes: '^cfg_.*$', '^gpio@.*$', '^mux_.*$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1564902

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

