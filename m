Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A8652219
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 15:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbz4W70rjz3c7p
	for <lists+openbmc@lfdr.de>; Wed, 21 Dec 2022 01:10:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.171; helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbz492jLjz2ybK
	for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2022 01:10:15 +1100 (AEDT)
Received: by mail-oi1-f171.google.com with SMTP id v82so10660916oib.4
        for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 06:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SjBHXkyHGiWve/uXORSeTIM3nsUbZRLtIdh/xsIJaqY=;
        b=MlDKM/rlR8fA7iqlexeMPYeYeT4yBYcJ/Y0KHLhRqLq2gJMb3/da36WNfJG9f8BQeL
         bQ685CSeT+VzWYW10jP5iXlHjnnjSkJz4FIzyNP4cbRYLIhv8KpYm53oSeoUHVAZdijA
         WQohWSy9xSS7HRu7NzJqVTgI0qz0L7f9Is+EjAWS5pwEZgix6gRdrbq3HkFrr2F3UcCK
         GpIEaJI6pbdzI1eGV9FVGF+1WyOSIyCoa/tUrmv7lA8L2ugNdKbUVTQWqcZt23nRlpEt
         bPDXPPWmfwo0R8bpmYz4Hp4HGGpQ6MemcSC1ah3Z37ckqtJmCb8BEYg/4ftYimd1+I4T
         WNiQ==
X-Gm-Message-State: AFqh2krfg+stVfjoNad5no/HW5CMUxEE4pOEeuTr0HmXM8Uo5M+bcGsC
	w5sv4HnPuehsa35Ke4JW+g==
X-Google-Smtp-Source: AMrXdXspHadroOLYY8Z4ogPudHrY6urHxn+kioyUvSh0MS4YyW567+BPsFy8G7Mi/VU2mH5AF4CEDg==
X-Received: by 2002:a05:6808:2182:b0:361:8ea:a3b5 with SMTP id be2-20020a056808218200b0036108eaa3b5mr3111612oib.54.1671545411626;
        Tue, 20 Dec 2022 06:10:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p26-20020a9d745a000000b006391adb6034sm5642896otk.72.2022.12.20.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 06:10:11 -0800 (PST)
Received: (nullmailer pid 226274 invoked by uid 1000);
	Tue, 20 Dec 2022 14:10:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jim Liu <jim.t90615@gmail.com>
In-Reply-To: <20221220080139.1803-4-JJLIU0@nuvoton.com>
References: <20221220080139.1803-1-JJLIU0@nuvoton.com>
 <20221220080139.1803-4-JJLIU0@nuvoton.com>
Message-Id: <167154528944.200721.11678821541440830244.robh@kernel.org>
Subject:  Re: [PATCH v3 3/3] dt-bindings: gpio: add npcm7xx sgpio driver bindings
Date: Tue, 20 Dec 2022 08:10:10 -0600
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
Cc: KWLIU@nuvoton.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 20 Dec 2022 16:01:39 +0800, Jim Liu wrote:
> Add dt-bindings document for the NPCM7xx sgpio driver
> 
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v3:
>    - modify description
>    - modify in/out property name
> Changes for v2:
>    - modify description
> ---
>  .../bindings/gpio/nuvoton,sgpio.yaml          | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,input-ngpios: True is not of type 'object'
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,input-ngpios: More than one condition true in oneOf schema:
	{'description': 'Vendor specific properties must have a type and '
	                'description unless they have a defined, common '
	                'suffix.',
	 'oneOf': [{'additionalProperties': False,
	            'description': 'A vendor boolean property can use "type: '
	                           'boolean"',
	            'properties': {'deprecated': True,
	                           'description': True,
	                           'type': {'const': 'boolean'}},
	            'required': ['type', 'description']},
	           {'additionalProperties': False,
	            'description': 'A vendor string property with exact values '
	                           'has an implicit type',
	            'oneOf': [{'required': ['enum']}, {'required': ['const']}],
	            'properties': {'const': {'type': 'string'},
	                           'deprecated': True,
	                           'description': True,
	                           'enum': {'items': {'type': 'string'}}},
	            'required': ['description']},
	           {'description': 'A vendor property needs a $ref to '
	                           'types.yaml',
	            'oneOf': [{'required': ['$ref']}, {'required': ['allOf']}],
	            'properties': {'$ref': {'pattern': 'types.yaml#/definitions/'},
	                           'allOf': {'items': [{'properties': {'$ref': {'pattern': 'types.yaml#/definitions/'}},
	                                                'required': ['$ref']}]}},
	            'required': ['description']},
	           {'description': 'A vendor property can have a $ref to a a '
	                           '$defs schema',
	            'properties': {'$ref': {'pattern': '^#/(definitions|\\$defs)/'}},
	            'required': ['$ref']}],
	 'type': 'object'}
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,output-ngpios: True is not of type 'object'
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml: properties:nuvoton,output-ngpios: More than one condition true in oneOf schema:
	{'description': 'Vendor specific properties must have a type and '
	                'description unless they have a defined, common '
	                'suffix.',
	 'oneOf': [{'additionalProperties': False,
	            'description': 'A vendor boolean property can use "type: '
	                           'boolean"',
	            'properties': {'deprecated': True,
	                           'description': True,
	                           'type': {'const': 'boolean'}},
	            'required': ['type', 'description']},
	           {'additionalProperties': False,
	            'description': 'A vendor string property with exact values '
	                           'has an implicit type',
	            'oneOf': [{'required': ['enum']}, {'required': ['const']}],
	            'properties': {'const': {'type': 'string'},
	                           'deprecated': True,
	                           'description': True,
	                           'enum': {'items': {'type': 'string'}}},
	            'required': ['description']},
	           {'description': 'A vendor property needs a $ref to '
	                           'types.yaml',
	            'oneOf': [{'required': ['$ref']}, {'required': ['allOf']}],
	            'properties': {'$ref': {'pattern': 'types.yaml#/definitions/'},
	                           'allOf': {'items': [{'properties': {'$ref': {'pattern': 'types.yaml#/definitions/'}},
	                                                'required': ['$ref']}]}},
	            'required': ['description']},
	           {'description': 'A vendor property can have a $ref to a a '
	                           '$defs schema',
	            'properties': {'$ref': {'pattern': '^#/(definitions|\\$defs)/'}},
	            'required': ['$ref']}],
	 'type': 'object'}
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221220080139.1803-4-JJLIU0@nuvoton.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

