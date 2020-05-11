Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DDF1CE2CA
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 20:30:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LTy0083qzDqgB
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 04:30:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LTtz5qZ1zDqRC
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 04:27:39 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id m18so8331458otq.9
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 11:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8XrifLV0oFLLyLn6BjacaXHOgkoMzKo1Zf9sFmdQHNs=;
 b=Ip7HJLxZR1m4tn69uuXqsyEVBb6qZ0QuQfWlN7NWnAtsHDBH97v9pnXZH85l1tNXTb
 GBmudgN72YOJANEoSnVKRKMKUiko+gtifXBgNqtGVkDcZoyrguSFo7MCjBn/pNpzyJ9e
 gSBsowaMX/FMyEV4MaqqFmJ3Yltty/tBjbiz941EYcKnvcLIjVSzjSRnqAMfabMLVGqW
 jW2FcBTVo9mKENQCLCpuENFka0iOCBzqmUdWijL2gK0o4DyYL/XiDf16D3eJSp+ipILU
 knCaRxjBaGDRPTilw3g5HiGppLxbqNXHHh/prBgnjJzg/LiGURzGKCCTSdVKwkhK9M8Z
 JZxw==
X-Gm-Message-State: AGi0PubOFu2EV0z7DKreG28lEZojKInWUqV7d51zlnJvHfrWDfZUk2p2
 37QjtYgASZnc/NCEFrQnuw==
X-Google-Smtp-Source: APiQypIEDiszqremOLj3ZVCWNAGbs747WHBAa7K2a7Gvw2bUX1jdvt5C7wSdJKYiwrOZmAnZ6GAWZg==
X-Received: by 2002:a9d:2264:: with SMTP id o91mr13983559ota.258.1589221656049; 
 Mon, 11 May 2020 11:27:36 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm4802742oia.31.2020.05.11.11.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 11:27:35 -0700 (PDT)
Received: (nullmailer pid 19748 invoked by uid 1000);
 Mon, 11 May 2020 16:09:49 -0000
Date: Mon, 11 May 2020 11:09:49 -0500
From: Rob Herring <robh@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Message-ID: <20200511160949.GA19364@bogus>
References: <20200510102330.66715-1-tali.perry1@gmail.com>
 <20200510102330.66715-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510102330.66715-2-tali.perry1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, wsa@the-dreams.de,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, ofery@google.com,
 kfting@nuvoton.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 10 May 2020 13:23:28 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:compatible: [{'const': 'nuvoton,npcm7xx-i2c'}] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clock-frequency:enum: False schema does not allow [100000, 400000, 1000000]
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clocks: {'maxItems': 1, 'items': [{'description': 'Reference clock for the I2C bus'}]} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clocks: 'maxItems' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: properties:clock-frequency: 'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'default', '$ref']
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1287083

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

