Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14DA46D4AB
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 14:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8JM14gXHz3c5w
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 00:45:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.52; helo=mail-ot1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8JLm1CG2z2xtc
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 00:44:46 +1100 (AEDT)
Received: by mail-ot1-f52.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso2786531otr.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Dec 2021 05:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=d9pU8JusJ0nsIKbrfuBpVn2ASUUJN8eQS5WgDx97T70=;
 b=KQoVAE3CXB/f4dowCQKvqmOTD8E+t+Li1Hk7YFjaM57g/cp4qw7eeAKb1SzdGw8TkG
 UsyFCMLz1ZMVJaLcdUI/igUMtbOPIsVcO9MZM6IC+GLvPbgChesiu7wFQp52B0lKXGB1
 9nvPNRxciNbQu4ifGkLxKE0vhMA3vEKEWXyVEjbKGJ9qfR5CqqvQ2C/dujWDrmf+yUf5
 OG7qLq3sz0EjWuPzyL13nTiXhww0+sC4btFBJe5psOtzJZnAGvZyNwb3+JLMDdiE8BP4
 ZPXjHMj0EUrFrKJI0uSBLivfoFTF2aP5os7C3uLs3OM+ZU7GXCE18PHDTchoPL0iaLZa
 Az9A==
X-Gm-Message-State: AOAM531lT9aFFTnP3jy58clpB4tLwCJbshg1UsmSg7aC/zhg5x306hj3
 u4wtoQ6I6EPos53FjKYzew==
X-Google-Smtp-Source: ABdhPJzklnesFyQINRJbzyMBRDzJZ0023nhrzxD3hZxHsZWpdpkix8DxjCFFAzRhCkjwB6GkAez0mg==
X-Received: by 2002:a9d:2ab:: with SMTP id 40mr42325048otl.208.1638971083269; 
 Wed, 08 Dec 2021 05:44:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w80sm633310oif.2.2021.12.08.05.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 05:44:42 -0800 (PST)
Received: (nullmailer pid 3857728 invoked by uid 1000);
 Wed, 08 Dec 2021 13:44:28 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20211207210823.1975632-2-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-2-j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Date: Wed, 08 Dec 2021 07:44:28 -0600
Message-Id: <1638971068.720448.3857727.nullmailer@robh.at.kernel.org>
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
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 07 Dec 2021 22:08:16 +0100, Jonathan Neuschäfer wrote:
> A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> version information.
> 
> This patch adds a binding to describe this node.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> ---
> v2:
> - Rename node in example to syscon@800000
> - Add subnode to example
> 
> v1:
> - https://lore.kernel.org/lkml/20210602120329.2444672-2-j.neuschaefer@gmx.net/
> ---
>  .../bindings/arm/npcm/nuvoton,gcr.yaml        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.example.dt.yaml: syscon@800000: 'uart-mux-controller' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.example.dt.yaml: uart-mux-controller: $nodename:0: 'uart-mux-controller' does not match '^mux-controller(@.*|-[0-9a-f]+)?$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mux/mux-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1564899

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

