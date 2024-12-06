Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3E9E885C
	for <lists+openbmc@lfdr.de>; Sun,  8 Dec 2024 23:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y60Zh15ckz3d2m
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 09:50:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733455193;
	cv=none; b=UzgV9gTeNje6fwGhXenGMin6jrx3bDwKDf2SYVPKeWFQSy7Y0SKiQ9Ns56HrXtPGzX0f5qWhQGr2x8qs52e+e1dEJeVU8tl+jAe66ND/F/ZxjhPcpkWuFRYMv5ZaELP5LhCPX05wFTvJeoNddCeVUtGV1fwxwzjP0STZMmIFPIBXbb55XVFBKgN23P2uU0o+sxWxT9B+wPhC3WjNLOaEwmpvBSPngZDrGaJEbb5rW6jrsjxPARXdUW404/c59WmTDbnM35vga/W8ckLOREfiwV732PpBaeE7PigQO9CecBCcthOvbXh9NdNqviBq1Y0vwa90RMdeHZ3C4izBbh30XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733455193; c=relaxed/relaxed;
	bh=o1J08d2GpR5DBDse4TbjdicR+imRnKLikvjMWBZLku0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i19xqy0boPiqqkMLbZs6e50lD2rNGEEjUrTe1q+9IBidPBfNR5aygklnDYlPKZZVcJ1EO4EhMBJNKa5SGgGfvYXgqm1xkBRL3kOLH+i+hLvldPWUSPGUCVav2LEEkqe0ydssbOLhq7I6eKcpAp0P5M0boaVVNk5Ll9Xh3s81pgoTKNGQtY1mFiRrK8YihyMyf6jZ77IoPfiyLxfoCZumYr85/EbqTsEgeKOCtZYukfj6+DaYuW5igmPRse4b3EqtS8BpMsmEOmhvlbEON6vBWglspFObVeoqepzIWiAIneK+LDuUcLgOV+c2hFVEBSGlcr+V2X/Qiz+t9iUXJvxw0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CHO6Fy2k; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CHO6Fy2k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4Ghl26dwz2yMh
	for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2024 14:19:51 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-215909152c5so18380265ad.3
        for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2024 19:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733455188; x=1734059988; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1J08d2GpR5DBDse4TbjdicR+imRnKLikvjMWBZLku0=;
        b=CHO6Fy2kxNF3HZUd0Mme/lKJAYWELG+r1GEcSVdfyd81zKF2TVBnEEsoNuKpgL53XS
         GfFlkcgt6SMseej6jwo1eV93a8+tkHRU3rEjTsh0GQlNzgXJ2dSaLvgAcrvV9JDHoFnj
         JDyvSVWGVuUUVLGMUOKaYnvBehqhhrl1TvlCBBOYJ0tpLGnMlTVrbFa8LHSnY4yGIPvt
         FAyY4L9VL82FWPLZ8jn2jmjE0xtN5UdJxpdXhcSnaRsDb8PRpgn2QWyVL/izlGuivoEX
         BKn4QZG8Zf+ZWiKSubDcvUYTMJ6L0gOIBRfrdDEQu7qN0CVLa4Xtt16bDavYuNMqIWGx
         xb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733455188; x=1734059988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1J08d2GpR5DBDse4TbjdicR+imRnKLikvjMWBZLku0=;
        b=B6CPzF6AMj0RxeEmByYkS0/c5gOqSqjuIiY81QVmOIjr9PGcgObgA7dTQTh8fadQxD
         DvHeIBpZa5rO9ssEsF69cQXmd7frH6oVfjcu45BQwuu0L4nBGHuYzFAve28OUbu9OrZK
         1vCq1yhZk8Ko9VE97+qgyZAZ+/EWXTjW9JfCSnAFU3EB6ljWQ0ldDrWEOZFZC2hioRh5
         8kA+AZ368fiyXK3DZ6RO1I9HIQNbRTJ2nsQovo4XyU/0wjZhWXSVOYvs03OvbbslTcec
         tgCtfSeKu9z9p66ReaW1F1ydqUUfjKS2mqaj51Uqx64U2W2AtiJiQTE22ZyIzyU4O2l8
         FGfg==
X-Forwarded-Encrypted: i=1; AJvYcCUxGuwvrrwehVDY7X6a9VMtVNrMlThjMGdaDUelU/uBED0UAAA9+wn8ivSxE7uYwRdn629KGOQo@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwiAY8RH7EWiY65eUqXpAiAz42bPU0qNKQNBQrVdAWOMRwgWVKw
	VXOrPNRTWcPp7xQicpCZ55pGjmTrXFRtU/wmQoXI0k8E5zt5hoOi
X-Gm-Gg: ASbGncvDjdfKfF+CC8U4cz2ulsn7jvQtQfqGvQokwbQjGNY1/NdrBcUjZ6OzJxrwUpg
	49V7viC+KiK9kqI9leqediYWvQupCEJ43K/oEDn2rxrEInd0Bw0zw8VKBj1d35zBx76r/r4FDgO
	abowE4CPNzMjmu6J1cziif7U6l9qWqRRUta3uQbyRBOFFZLB/poL3pYX4tEeI65I1+wZ6nL11c4
	sm5RLNXYfwDAKqyeWl+7ecvx4wbdj7DbBbZ3vPx0i1ekkeCUXGcunVccla2dKUQ3zF8rIJt25tR
	FUZxwrepS6oKL7EZzZ4LPXa0jiST
X-Google-Smtp-Source: AGHT+IF785ewAXxfZzF45gbEj/3x8DTYf9enjYTZG3Qjck/WxskvwgRBw9uMc142aJEKW0klUE6onw==
X-Received: by 2002:a17:903:240a:b0:215:6816:6345 with SMTP id d9443c01a7336-21614d74ed8mr23832465ad.16.1733455188374;
        Thu, 05 Dec 2024 19:19:48 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21610638673sm5075265ad.271.2024.12.05.19.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 19:19:47 -0800 (PST)
Message-ID: <a04cd927-63cb-4271-bfc7-3ec97c5a978d@gmail.com>
Date: Fri, 6 Dec 2024 11:19:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Rob Herring <robh@kernel.org>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-2-a0987203069@gmail.com>
 <20241204142722.GA177756-robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241204142722.GA177756-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 09 Dec 2024 09:50:29 +1100
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Rob,

Thank you for your reply.

Rob Herring 於 12/4/2024 10:27 PM 寫道:
> On Mon, Dec 02, 2024 at 10:36:41AM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 ++++++++++++++++++
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>   2 files changed, 135 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> new file mode 100644
>> index 000000000000..e44abaf4da3e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> @@ -0,0 +1,134 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton DWMAC glue layer controller
>> +
>> +maintainers:
>> +  - Joey Lu <yclu4@nuvoton.com>
>> +
>> +description:
>> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
>> +  Synopsys DesignWare MAC (version 3.73a).
>> +
>> +allOf:
>> +  - $ref: snps,dwmac.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nuvoton,ma35d1-dwmac
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Register range should be one of the GMAC interface.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: MAC clock
>> +      - description: PTP clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: stmmaceth
>> +      - const: ptp_ref
>> +
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to access syscon registers.
>> +          - description: GMAC interface ID.
>> +            enum:
>> +              - 0
>> +              - 1
>> +    description:
>> +      A phandle to the syscon with one argument that configures system registers
>> +      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: stmmaceth
>> +
>> +  phy-mode:
>> +    enum:
>> +      - rmii
>> +      - rgmii
>> +      - rgmii-id
>> +      - rgmii-txid
>> +      - rgmii-rxid
>> +
>> +  tx-internal-delay-ps:
>> +    default: 0
>> +    minimum: 0
>> +    maximum: 2000
>> +    description:
>> +      RGMII TX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
>> +      Allowed values are from 0 to 2000.
>> +
>> +  rx-internal-delay-ps:
>> +    default: 0
>> +    minimum: 0
>> +    maximum: 2000
>> +    description:
>> +      RGMII RX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
>> +      Allowed values are from 0 to 2000.
>> +
>> +  mdio:
>> +    $ref: /schemas/net/mdio.yaml#
> Drop. snps,dwmac.yaml already has this.
Got it.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
> Drop all 4. Already required by snps,dwmac.yaml.
Got it.
>
>> +  - clocks
>> +  - clock-names
>> +  - nuvoton,sys
>> +  - resets
>> +  - reset-names
>> +  - phy-mode
> Drop this one too.
Got it.
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +    ethernet@40120000 {
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x40120000 0x10000>;
>> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys 0>;
>> +        resets = <&sys MA35D1_RESET_GMAC0>;
>> +        reset-names = "stmmaceth";
>> +
>> +        phy-mode = "rgmii-id";
>> +        phy-handle = <&eth_phy0>;
>> +        mdio {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ethernet-phy@0 {
>> +                reg = <0>;
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index eb1f3ae41ab9..4bf59ab910cc 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -67,6 +67,7 @@ properties:
>>           - ingenic,x2000-mac
>>           - loongson,ls2k-dwmac
>>           - loongson,ls7a-dwmac
>> +        - nuvoton,ma35d1-dwmac
>>           - qcom,qcs404-ethqos
>>           - qcom,sa8775p-ethqos
>>           - qcom,sc8280xp-ethqos
>> -- 
>> 2.34.1

Thanks!

BR,

Joey

