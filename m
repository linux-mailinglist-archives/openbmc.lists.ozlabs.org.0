Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41D26641D6
	for <lists+openbmc@lfdr.de>; Tue, 10 Jan 2023 14:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrs9x60TYz3cBX
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 00:29:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrs9X5C7Fz3c7S
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 00:29:34 +1100 (AEDT)
Received: by mail-ot1-f46.google.com with SMTP id e17-20020a9d7311000000b00678202573f1so6940116otk.8
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2023 05:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zKAe0OFUWm2XvE8TtB0lP81U5fBp4FRhR/a1eftM+Ek=;
        b=wwIE4chC3ml3xnXEmeKdIUnV3wFG8j/bfsbLmhumwJTyvkGVtD6bXaefmq+404BH1s
         SsRFeYeIub9W0aY9QZ05gCu9XeCObwPGTaZdmv1dYex88Xs1gDAeKfDiyxY15tLsbnFj
         g9R7G6PhME7RWjDoCoGxbSPRWuczkZCVAbyeLcG3bMTRorN/DSOPBCz3j31UKYq98Av1
         hpCxilkFfSSWABdyDtShCiuglcI8P3bZCN6vmIzgTyFu5QP6rtVouD/Z8RG7Od+eLCRg
         dZ5f7vGmvKTT30Z6HHYCGQMKXe/TCkPGQ/LaPoNgPnMiTTXTcJlE5EUVzepKNRM0Gi6C
         K9AA==
X-Gm-Message-State: AFqh2kptPX4bKzFPpSWsg7B9Uo6kHaaHECOy08L31l0LxOrt5ok0ytMS
	cZ/o/n9yVBM19pWblXMa+Q==
X-Google-Smtp-Source: AMrXdXsD1u2a+0P2EAP8UF4IZ31u4JKrWLup4jFFntlInWFYKtWuEjk3NnGkodmas2ONEijs/l13jg==
X-Received: by 2002:a05:6830:20c4:b0:66c:4f82:b83c with SMTP id z4-20020a05683020c400b0066c4f82b83cmr38750946otq.7.1673357371404;
        Tue, 10 Jan 2023 05:29:31 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y18-20020a0568302a1200b0066f7e1188f0sm6053005otu.68.2023.01.10.05.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 05:29:31 -0800 (PST)
Received: (nullmailer pid 1984996 invoked by uid 1000);
	Tue, 10 Jan 2023 13:29:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jim Liu <jim.t90615@gmail.com>
In-Reply-To: <20230110083238.19230-4-jim.t90615@gmail.com>
References: <20230110083238.19230-1-jim.t90615@gmail.com>
 <20230110083238.19230-4-jim.t90615@gmail.com>
Message-Id: <167335661623.1967925.9927691364268671668.robh@kernel.org>
Subject: Re: [PATCH v4 3/3] dt-bindings: gpio: add NPCM sgpio driver bindings
Date: Tue, 10 Jan 2023 07:29:30 -0600
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
Cc: KWLIU@nuvoton.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 10 Jan 2023 16:32:38 +0800, Jim Liu wrote:
> Add dt-bindings document for the Nuvoton NPCM7xx and NPCM8xx sgpio driver
> 
> Signed-off-by: Jim Liu <jim.t90615@gmail.com>
> ---
> Changes for v4:
>    - modify in/out property
>    - modify bus-frequency property
> Changes for v3:
>    - modify description
>    - modify in/out property name
> Changes for v2:
>    - modify description
> ---
>  .../bindings/gpio/nuvoton,sgpio.yaml          | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,input-ngpios: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maximum', 'minimum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,input-ngpios: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,input-ngpios: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,output-ngpios: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maximum', 'minimum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,output-ngpios: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,output-ngpios: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230110083238.19230-4-jim.t90615@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

