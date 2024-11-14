Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19C9C9606
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 00:18:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqGK06F2dz3c66
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 10:17:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731577405;
	cv=none; b=IVYc6sCtiCLi6cFrhEpDy/5wYag3sSI/1E5sKSGfSHHemYbJF3e9PjiaY4YcGb6YKrwrtrPK1K3X5nYHhRqhrlsJmveZkrD4ArYyLFvcTRMUvkVXr4mXQHPNlu4OX81OKtspr6bkRiqck16RehNVRqESzjA0gHLX24agCj9N8zt1/YHDX7+S7V7rTmAkDkBj3Ke4jkCXuTRRlR8TSiaZH0IPWCWkwvJl6mNU1A47sYSo3GgBrgKzb1Lu48EHDWlgdNVJDuNnBpn9DkE30sjX7eQQj0Ot4Be4ov9eX+ZtO37A5eA/XtQPukdpVEXZ/BqdLxHQ5z0F7J+CX5aZlrcuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731577405; c=relaxed/relaxed;
	bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0hRNSAUP3OHM1OW1OA0RX8w77oXpb8D2sdiIcfpFnxKHO6Q35Rji8gUCom97IZUOpbSl4Sl6NVaAy9QfB8UFc2fx05Xvw4GmzO9NcOdsVmNwMYzYBI9v3s2uhpOaUJfxHrQONlbD+szuz07bHTxzfaqJpHYGlXfg7DQbpJYqk2pxQ+POOIKB5z8I0wqTUWCvAMwtBZVLT1AqvyQlizENN+crBw4+rpph168/HA6uaunTNeThTLGq3kpfmbOCPC0ZwZPZxde9zKpZDdyF/5g+nasl4MQuozmeY9On2Wd/bkKr4d593zPApH+xsydJnBMmlIMcuE+dMFzJaWEauRNDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WrqwBzFA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WrqwBzFA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpwFQ1nCkz2xfR
	for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 20:43:21 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ea0f283a82so5272a91.1
        for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731577398; x=1732182198; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=;
        b=WrqwBzFAQC4WG4U3TCJ5ncOPvbONrzy2tGJbrTpQWx8FpCujv7gmtCO2mLly3douOU
         tXU7SOGo6+OGbFyXMa9u5HZGuOKiHoVoHJjdPTag6INAP5B5L9jyCBVFZub4yZ8hzrSn
         lt1Oyuv4EG88XLdilp7mbMQUv2D7rxquC5+FqzhMksAga5ZX0dzJwH5OxIheOo4/ZBMw
         b/Wu3h0VKjy76EFvSPj2OC4MPDSwECyKLIXceppI6IE6pL14R7Acv8WzW4HeAFGvvSle
         m+7lS5mZJsS5dxIAKYKIyXVHKSyprk+zqh3PPkIOq5nkK61diYnxOtOgHda+fhvaoGJG
         +BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731577398; x=1732182198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7E3oRv+rq/XKtcZoaXZsJTQg3amz2zyCTxOxkN0m2BA=;
        b=Y0chDbabhSLAWtJIwhGDpoNda7o4WsyunLOTrBKdb9jrjjVBOOFc/A6X6SQmcZf4yz
         94uuxMaqT/2oKNS78Qbh4QHCv6IKKLgRIKJAvKUR4l28wJa8CmjdJm2W8xycxQhNOAtF
         0/9CzXelX0NfjIH7T3LGI78ruemqA36iJfh6mvOGzUg2pMkc0FrbHsN1lUBE4B6CGj0M
         HfPqs5pePHtnj2HjX+Kxf3wkpXWlvbf9NgZyoMg9K7WfdO8oHfRPuIOG6ST+0NB4GlJb
         nIWzUZpS6fk/KvTvdPMoWj4X4LS27qsAFhJLPh54vgBdl4rrRVudmA+OOfOnCoLFkULW
         gAxA==
X-Forwarded-Encrypted: i=1; AJvYcCViqfafFHORFI2wURY5ZyuYq0Qlmckzy7ELIbU9nSAbkMB6iCQ9p5bBywgEAUlLnYUbmB1mPPSF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUJBi1Z4EGVigZrW0ZSn9zrLqB3gSPqqcdsg7ECBrPtgBWUDFH
	oeDxN4TAjgdFLQj88cSj2smxLxkx96URkikom15mpjro29OMfbmY
X-Google-Smtp-Source: AGHT+IE7N5I7GpMECo0it1xEKMgqYnL8RbOemjcjR8CajkVg4l/czbLMGpNGruEWzRMOSH4KompvSQ==
X-Received: by 2002:a17:90b:3ec5:b0:2e9:5f95:54c1 with SMTP id 98e67ed59e1d1-2e9b173c441mr33338891a91.17.1731577398096;
        Thu, 14 Nov 2024 01:43:18 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f9c51esm783484a91.39.2024.11.14.01.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 01:43:17 -0800 (PST)
Message-ID: <bbc212a7-ae42-461a-b0a9-509838053ab2@gmail.com>
Date: Thu, 14 Nov 2024 17:43:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35
 family GMAC
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-2-a0987203069@gmail.com>
 <173147854152.3007386.10475661912425454611.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <173147854152.3007386.10475661912425454611.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 15 Nov 2024 10:17:38 +1100
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.torgue@foss.st.com, openbmc@lists.ozlabs.org, richardcochran@gmail.com, ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Rob,

Thank you for your reply.

On 11/13/24 14:15, Rob Herring (Arm) wrote:
> On Wed, 13 Nov 2024 13:18:55 +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
>>   1 file changed, 170 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://json-schema.org/draft-07/schema#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
> 	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too long
> 	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
> 	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too long
> 	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: 'oneOf' conditional failed, one must be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: Either unevaluatedProperties or additionalProperties must be present
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-0/ethernet@40120000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
> Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-1/ethernet@40130000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113051857.12732-2-a0987203069@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
These warnings/errors will be fixed in next patch.

Thanks!

BR,

Joey

