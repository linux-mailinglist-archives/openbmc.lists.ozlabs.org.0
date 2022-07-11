Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E0570997
	for <lists+openbmc@lfdr.de>; Mon, 11 Jul 2022 19:55:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhWl442yHz3c3V
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 03:55:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.49; helo=mail-io1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhWkl234Gz3051
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 03:55:26 +1000 (AEST)
Received: by mail-io1-f49.google.com with SMTP id v185so5599396ioe.11
        for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2022 10:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=zQYfTc7ETRTCZIgWWYw80Iww1nESA3imnUOHAbZNink=;
        b=OEMVrNL/YM9qa2xLa0GPwWSDo9vP7BgnGAZm5pN4yAvwhdVmj9K/uFhSArDfg5hi7e
         CkeDP+RhjJ3uu+rHRDZ2eSI46pXxeoEULEfRk41Zwt7Y8M8iKmZyEjhvTW8w/8sim6Or
         Fgnh1RvFnz8FfUruUgfxdtTjNbGIEm1wt3JO9qxDB/O2OmcuJ4KnH1l9KchLaAzUrE4l
         NAhQiTN7RfvBoX/VoV2Y37/8blkmbIgXVlxlp7/Ww0Ncn9i7ormc0KSbnzhJNKcoss6B
         +vNmqw+GRl3RNkHPZdsXJdaKA/a30bhFt11q9963ekf2lEoS62UV1xFUHphpJyk53gha
         olTA==
X-Gm-Message-State: AJIora/2bJEmUUkF1yryw123izr2oCN0T0JwO8su7HPZTgVnOVEpPdrx
	FanFOTDq5oVqSG+ipfMZyw==
X-Google-Smtp-Source: AGRyM1uE9R2fPsn1VUU8DOTLoa3jlkmDcdWazULz/mhKIHwM2a2Mr0Dxk1I9Ka1+ZBiBywhlw3BqfQ==
X-Received: by 2002:a05:6638:1651:b0:33c:a8d2:71a6 with SMTP id a17-20020a056638165100b0033ca8d271a6mr11256299jat.165.1657562121188;
        Mon, 11 Jul 2022 10:55:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z17-20020a056638215100b0033eda79403bsm3170853jaj.9.2022.07.11.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:55:20 -0700 (PDT)
Received: (nullmailer pid 4172124 invoked by uid 1000);
	Mon, 11 Jul 2022 17:55:19 -0000
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
In-Reply-To: <20220711134312.234268-2-tmaimon77@gmail.com>
References: <20220711134312.234268-1-tmaimon77@gmail.com> <20220711134312.234268-2-tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: npcm: Add npcm845 compatible string
Date: Mon, 11 Jul 2022 11:55:19 -0600
Message-Id: <1657562119.172361.4172123.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, linux-kernel@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, linux-iio@vger.kernel.org, tali.perry1@gmail.com, zhengbin13@huawei.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 11 Jul 2022 16:43:10 +0300, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 ADC.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.example.dtb: adc@f000c000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nuvoton,npcm750-adc'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

