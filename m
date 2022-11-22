Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F42163485E
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 21:38:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGx123Qcrz3ccg
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 07:38:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.170; helo=mail-il1-f170.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGx0g2tPBz2xb4
	for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 07:38:11 +1100 (AEDT)
Received: by mail-il1-f170.google.com with SMTP id g7so7676157ile.0
        for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 12:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IxhuJmnEARIWlXQpcwKPNDNfyA1cKV7mmycNRMiAUnw=;
        b=5T6RpkZBrc6NDoGuoiUtAZNSY4Fgp1QVHuC1Pp6PXg3+CgcJp2FpaSVMzQ20Mc8Xk/
         /kY1m/82UDQOKHXPVxAuFTKuBl7uV5a45BWTPlAc50BsrKtZNeyuaMDNRjY/8nfwg1Y6
         qodcIN7yspaybsSiIZZmF9EHXabvv7C7nRIIZXXQnmgcnlUq71OttVp/F1DdEIjVqA5K
         OBWHN0gOsjlkib3blJGRk6vXa7tKUSIqJKAazQHoAYXufQoKn8uvg6rU2RoFmSM8xwqV
         yZursZimoex7H7pDuVTyys84bFA62ZS/fQYSRRm6Tj7dVsCXU8Hcjs6NQDg0jPmaxqSz
         pxnw==
X-Gm-Message-State: ANoB5pnFt8oRd3PgZPfs2O73qGzrT5JQH+t7q6ockjfoWVLr6aqua0GN
	iXfyXnoBonkZCGiZsWTt3Q==
X-Google-Smtp-Source: AA0mqf7szvteT0DhoEE8ltblx51SieTice/p6rYK2egqQEWY2mUi7XDAmn+bUokAsQxJd8B3HHq92g==
X-Received: by 2002:a92:cc4c:0:b0:2fc:81e8:db26 with SMTP id t12-20020a92cc4c000000b002fc81e8db26mr3822882ilq.73.1669149488075;
        Tue, 22 Nov 2022 12:38:08 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u14-20020a056e02110e00b00302c31956b2sm2302289ilk.10.2022.11.22.12.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 12:38:07 -0800 (PST)
Received: (nullmailer pid 514983 invoked by uid 1000);
	Tue, 22 Nov 2022 20:28:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Marvin Lin <milkfafa@gmail.com>
In-Reply-To: <20221122085724.3245078-3-milkfafa@gmail.com>
References: <20221122085724.3245078-1-milkfafa@gmail.com>
 <20221122085724.3245078-3-milkfafa@gmail.com>
Message-Id: <166914597689.442814.4178753345805789388.robh@kernel.org>
Subject: Re: [PATCH v7 2/7] media: dt-binding: nuvoton: Add bindings for NPCM
 VCD and ECE engine
Date: Tue, 22 Nov 2022 14:28:34 -0600
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 22 Nov 2022 16:57:19 +0800, Marvin Lin wrote:
> Add dt-binding document for Video Capture/Differentiation Engine (VCD)
> and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  .../bindings/media/nuvoton,npcm-video.yaml    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml: properties:nuvoton,syscon-gcr: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('$ref' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml: properties:nuvoton,syscon-gcr: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	'/schemas/types.yaml#definitions/phandle' does not match 'types.yaml#/definitions/'
		hint: A vendor property needs a $ref to types.yaml
	'/schemas/types.yaml#definitions/phandle' does not match '^#/(definitions|\\$defs)/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml: properties:nuvoton,syscon-gfxi: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('$ref' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml: properties:nuvoton,syscon-gfxi: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	'/schemas/types.yaml#definitions/phandle' does not match 'types.yaml#/definitions/'
		hint: A vendor property needs a $ref to types.yaml
	'/schemas/types.yaml#definitions/phandle' does not match '^#/(definitions|\\$defs)/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221122085724.3245078-3-milkfafa@gmail.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

