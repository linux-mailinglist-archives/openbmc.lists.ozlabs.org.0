Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D16A5118B4
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 16:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpLTs1Ky9z3c7V
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 00:19:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.43; helo=mail-oa1-f43.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpLT70Hqfz2yK2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 00:18:34 +1000 (AEST)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso2095401fac.2
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 07:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=PhXcDgK09TfJ0k4/TcfwOYlktcKSTjsxAO+dgwid8sU=;
 b=4Wxh8cpJZMW2b3BNiKg3v9okMMW073ns/FsbRuqbQknu72rcu6r36QkQCFis7E4orN
 WLue+TFz3TEBy1q3in3+qRk6CoI5GNhLzoegvQjJuy+0V2sk8Smf9B96meqGbdA6eaRT
 84Zx5MWV0rRgRfBz3/MFj/ghnt5LZXWbsu1SW7OY822s6U2xBt0iICYL/nMVO5RrFyKX
 fcPwVOEUDuHY84oQVKQCeQx7dIj/WWvxRYd5z94GTX/t4j/9F/X/oroCqUmHgyiJ3/na
 FzAhy6qgqGTtmTCrmKpzGU5yIwAWBGySDXKOUWOIgLsEHn/Vsa7/oRVlRRy0XQn6mepM
 J9GA==
X-Gm-Message-State: AOAM5312NIPH69x10XrFcriBIP1afH6ICbeGCPhUhrjqZFzyUUbbnzPS
 IZIhsvXJJuSN3ixvkVtHuw==
X-Google-Smtp-Source: ABdhPJzEazdYi+wBumpNxD6+bRTRjB1cnfTbRe3mJ/iYA6rFI8tXYvlUpz6mMwksoa3oLiTqbPubyQ==
X-Received: by 2002:a05:6870:ea8d:b0:e6:135c:1a2e with SMTP id
 s13-20020a056870ea8d00b000e6135c1a2emr15718470oap.9.1651069109351; 
 Wed, 27 Apr 2022 07:18:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b14-20020a056870160e00b000e915a9121csm672499oae.52.2022.04.27.07.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:18:28 -0700 (PDT)
Received: (nullmailer pid 4142584 invoked by uid 1000);
 Wed, 27 Apr 2022 14:18:28 -0000
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
In-Reply-To: <20220427010154.29749-2-zev@bewilderbeest.net>
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <20220427010154.29749-2-zev@bewilderbeest.net>
Subject: Re: [PATCH v4 1/7] dt-bindings: hwmon: Add nuvoton,nct6775
Date: Wed, 27 Apr 2022 09:18:28 -0500
Message-Id: <1651069108.145838.4142583.nullmailer@robh.at.kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Krzysztof Kozlowski <krzk@kernel.org>, Renze Nicolai <renze@rnplus.nl>,
 Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 26 Apr 2022 18:01:48 -0700, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml: properties:nuvoton,tsi-channel-mask: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('default', 'maximum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml: properties:nuvoton,tsi-channel-mask: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml: properties:nuvoton,tsi-channel-mask: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml: ignoring, error in schema: properties: nuvoton,tsi-channel-mask
Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.example.dtb:0:0: /example-0/i2c/superio@4d: failed to match any schema with compatible: ['nuvoton,nct6779']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

