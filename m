Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E146016A3
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 20:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrmLt1lYQz3cht
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 05:52:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.45; helo=mail-oa1-f45.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrmLR0sKpz3bb2;
	Tue, 18 Oct 2022 05:51:40 +1100 (AEDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-132b8f6f1b2so14265056fac.11;
        Mon, 17 Oct 2022 11:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiJGN1wykXSQ00DVk7YPI2dlZqV1IWIoUviA+sQDHg0=;
        b=nFE7vGVeqX5bc19hpSLF8O1RX1SRxKihMrjh6SQOCdaA0ty3FdulNqyD2ZEegcGAOZ
         oxNKlcLYIpZWZwu1ua/mQeRk0tyM2jJ5LbBd2u3aXO37Cdgcll2leGy6f+oKn07A3JL4
         kFrSQLuNMHjqfgO7VANsMZPJsU7dXN1pHeV8XjOcl+upzGyT73eQtQAqXZas+IyoEWBn
         CyVDg1n6wz2ZX/PaMQhnYuaZktXYKnGz1/hmxRk8LOHO1bIg4JC0JAccgFwpwssy1n/i
         Sxf2yW3BI7KfV1/Zloef/Div3dU5YaIblonKY70gYs6eED5W6JPVDAjk6ArEhCiL9qfF
         Q/eA==
X-Gm-Message-State: ACrzQf3OW4ZRlbOUt2AzjopmYSCUXLQ60I4vnkZ+IhVXqgNWZAvULZjW
	wiucR4bYuNDVaRqPu44Znw==
X-Google-Smtp-Source: AMsMyM6U30yroNpKFEKjCm7TCa6yB+1N8pcSiQ3DbD3vbcRuDFpLFvQGdmxPGsO1PpfLcrfrsqc6TQ==
X-Received: by 2002:a05:6870:6488:b0:131:a45b:a8ca with SMTP id cz8-20020a056870648800b00131a45ba8camr6395086oab.260.1666032698384;
        Mon, 17 Oct 2022 11:51:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 52-20020a9d0bb7000000b006619f38a686sm5073054oth.56.2022.10.17.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 11:51:37 -0700 (PDT)
Received: (nullmailer pid 2273470 invoked by uid 1000);
	Mon, 17 Oct 2022 18:51:38 -0000
Date: Mon, 17 Oct 2022 13:51:38 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH linux v2 1/3] spi: dt-bindings: aspeed: Add a ranges
 property
Message-ID: <20221017185138.GA2264550-robh@kernel.org>
References: <20221017091624.130227-1-clg@kaod.org>
 <20221017091624.130227-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221017091624.130227-2-clg@kaod.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Naresh Solanki <naresh.solanki@9elements.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 17, 2022 at 11:16:22AM +0200, Cédric Le Goater wrote:
> "ranges" predefines settings for the decoding ranges of each CS.

Please explain the problem, not what the change is.

> Cc: Naresh Solanki <naresh.solanki@9elements.com>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  .../devicetree/bindings/spi/aspeed,ast2600-fmc.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> index fa8f4ac20985..a11cbc4c4c5c 100644
> --- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -38,6 +38,14 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  ranges:
> +    minItems: 1
> +    maxItems: 5
> +    description: |
> +      Defines the address mapping for child devices with four integer
> +      values for each chip-select line in use:
> +      <cs-number> 0 <physical address of mapping> <size>
> +
>  required:
>    - compatible
>    - reg
> @@ -58,6 +66,7 @@ examples:
>          compatible = "aspeed,ast2600-fmc";
>          clocks = <&syscon ASPEED_CLK_AHB>;
>          interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +        ranges = <0 0 0x20000000 0x2000000>, <1 0 0x22000000 0x2000000>;

By having ranges here, 'reg' in child nodes become translatable 
addresses. But they are not because they are SPI chip-selects. Only 
memory mapped addresses should be translatable. 

Probably the ranges here should be in 'reg' of the controller.

>  
>          flash@0 {
>                  reg = < 0 >;
> -- 
> 2.37.3
> 
> 
