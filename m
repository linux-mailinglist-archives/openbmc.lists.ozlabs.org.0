Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ECF9C1204
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:52:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky404THbz3gHL
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730974567;
	cv=none; b=Ce4wikwLWIpSBCQDUTeM/eYvwsHWulh8oEu42GD6auLKJvE+5/wpVL7Mm4ORtbsDQFAHFOZh7OzdMXh2+PEV9zH2Fw4UuHC1879cmQREiDjir+4W0gF+wnYkjkCBQCtEiyNqwJz5EBBlhtMg4nohMRdAgTbqxnl4mxtFwuylJsUTfu7/uFaKIOysShDkwi4Ag6hnGNf4FclK5l6hTRSjyqOdjmpR5yhOywkPCW9r2uVG3HjdVJY6QJ1fafGG3DWObsSkvf1dey4AjFXxUG/NYyBqSGlZs/CMsyjiH2WX+APmjS9okBbdBxlIHfcUednCHfjN4WJGF0fKmA2Wh4gm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730974567; c=relaxed/relaxed;
	bh=6uC1tGDKghOkea1zNnMHJyn2LWZSucub90BQiLOEDDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iV9vWJsQcTP+P1MQyDZZka8YMKxEk6p/g0eUzr4iKg6IdZbfWXLXMoIP99jB6bOZDtmOrgetJdbnHWIb4sjv9jbke+sUlHmX4jJDEwsWvx8cTSvQK9dn5aqYtRpXCHeR+Xi59BC2iPcTOrpv7N+2BntgLNcr2iqgEXJJkmWYHWLU409nkHWNebPEF9/Qk2E+pmcvQmxLap5XCQVsMizB3r1y5KvVf4x1ofdIrKWWpkFcoA/sm5uK9PVqIv5H2r+wpUWZOkGZSz3vAW3oAxB0yCR9IEG/FNx/QXqXbmcpvbYvel25csty9uPd7BP5mRrHTILvCipon82dZir/cls/Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cEo6AZqV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cEo6AZqV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkdJL37Tzz3bl5
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 21:16:00 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20cbcd71012so8640625ad.3
        for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2024 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730974558; x=1731579358; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uC1tGDKghOkea1zNnMHJyn2LWZSucub90BQiLOEDDk=;
        b=cEo6AZqVftuUIHGlNZSgX4rx/PpMy54d40JmO3R5/RqiyHgYwuw7+p14cwhnpogsnZ
         uyjB9r9C/mNXdkrQGiLIFScZRIrs5x5Q9ixHZT/XoE7TBNH6CnE2Sv/AK/k78yMVH2bh
         oWEptaAyVw5sUEYRbMEP4k0mSj2KyaP+3YBubXL7qkLlSzO5KtoReHneouJLEhqiY0V2
         Qj9bLWxLGIgx7zp4ZmAjv7wfy2vVFACdnv03LSpizbA3f/8MGvQWkYPx1rOxt3AwnJOl
         BVLjns21BqaLM/fE9uGWr6YzgNmQtmklj3O4n3LUqm+GoMNhJ+pUDiITK9FgX+CRFbeQ
         TlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730974558; x=1731579358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uC1tGDKghOkea1zNnMHJyn2LWZSucub90BQiLOEDDk=;
        b=fqwdLweNvRKm9rY6EqS8xGsr04366uIq4E0i4HAv+1LCfcV0dp/qsfTLlNN8vSh0pI
         q2scxhYn12N0ILL8AyX3B+FjLA4ch0oG0BKOs+Oc91c6589hCU2Qf7/mP22fLxiS9a4/
         gLUc7E28FXaTKfJEimufhriUvPrQ5FwTWtAAkdZ6LDzvJu4Ds3VO26veVn58BJ/k8VH0
         VNxqph6jee5kpYLUZRnR/RFsZ0JQY9bDPamOA3N8XVbi+5otAWqz8hyvXLOSSWr/6DsX
         iS8caYUnt2DegOGQp9lLLsjDoq3sDMXDCPjvG+fpVDLPszcERh2aotZj2irQnGmZxCLE
         2pcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEuGE6RrH7tVCIKupATEpHqwmiLGyBwPucEUcYOnpir65i0zAAGi88UUVFBd23faYtblwIhUkJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3K8stuGyUgEUMkTU12vqTuFgUj6ieuN/T18wCNVRzZcy5TH8Y
	LdA4q0j5waStqE7hcOErOBFk3245ZiJKsfZBsD4tN+rZeprD+34RgtpfPzeE
X-Google-Smtp-Source: AGHT+IG072GIpekpia0RPF6UHV7Q1vjZLLM17qv655ofL8si24CR7LuYWccsfVgbbHuGdYv/1tSAPA==
X-Received: by 2002:a17:902:9009:b0:20c:968e:4dcd with SMTP id d9443c01a7336-2111aec8494mr240923005ad.7.1730974557542;
        Thu, 07 Nov 2024 02:15:57 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddc940sm8817035ad.58.2024.11.07.02.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:15:57 -0800 (PST)
Message-ID: <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
Date: Thu, 7 Nov 2024 18:15:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Conor Dooley <conor@kernel.org>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241106-bloated-ranch-be94506d360c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 08 Nov 2024 09:50:58 +1100
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Conor,

Thank you for your reply.

Conor Dooley 於 11/6/2024 11:44 PM 寫道:
> On Wed, Nov 06, 2024 at 07:19:28PM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35xx-dwmac.yaml    | 163 ++++++++++++++++++
>>   1 file changed, 163 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml
>> new file mode 100644
>> index 000000000000..f4d24ca872b2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35xx-dwmac.yaml
>> @@ -0,0 +1,163 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/nuvoton,ma35xx-dwmac.yaml#
> The filename needs to match the compatible.
I will fix it.
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
>> +# We need a select here so we don't match all nodes with 'snps,dwmac'
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - nuvoton,ma35d1-dwmac
>> +  required:
>> +    - compatible
>> +
>> +allOf:
>> +  - $ref: snps,dwmac.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    - items:
>> +        - enum:
>> +            - nuvoton,ma35d1-dwmac
>> +        - const: snps,dwmac-3.70a
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
>> +    items:
>> +      - description: MAC clock
>> +      - description: PTP clock
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    contains:
>> +      - enum:
>> +          - stmmaceth
>> +          - ptp_ref
> This can just be an items list like interrupt-names, since the clocks
> property has a fixed order.
I will fix it.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: macirq
> This name carries no information, this is an interrupt for a mac after
> all. You don't need a name since you only have one interrupt.
This interrupt name is an argument required by the stmmac driver to 
obtain interrupt information.
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: phandle to access GCR (Global Control Register) registers.
> Why do you need a phandle to this? You appear to have multiple dwmacs on
> your device if the example is anything to go by, how come you don't need
> to access different portions of this depending on which dwmac instance
> you are?
On our platform, a system register is required to specify the TX/RX 
clock path delay control, switch modes between RMII and RGMII, and 
configure other related settings.
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: stmmaceth
>> +
>> +  mac-id:
>> +    maxItems: 1
>> +    description:
>> +      The interface of MAC.
> A vendor prefix is required for custom properties, but I don't think you
> need this and actually it is a bandaid for some other information you're
> missing. Probably related to your nuvoton,sys property only being a
> phandle with no arguments.
This property will be removed.
>> +
>> +  phy-mode:
>> +    enum:
>> +      - rmii
>> +      - rgmii-id
>> +
>> +  tx_delay:
> Needs constraints, a type, a vendor prefix and a unit suffix. No
> underscores in property names either. See the amlogic dwmac binding for
> an example.
I will fix it.
>> +    maxItems: 1
>> +    description:
>> +      Control transmit clock path delay in nanoseconds.
>> +
>> +  rx_delay:
> Ditto here.
I will fix it.
>
>> +    maxItems: 1
>> +    description:
>> +      Control receive clock path delay in nanoseconds.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - nuvoton,sys
>> +  - resets
>> +  - reset-names
>> +  - mac-id
>> +  - phy-mode
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +    //Example 1
>> +    eth0: ethernet@40120000 {
> The eth0 label is not used, drop it.
The label is used in dtsi and dts.
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40120000 0x0 0x10000>;
>> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys>;
>> +        resets = <&sys MA35D1_RESET_GMAC0>;
>> +        reset-names = "stmmaceth";
>> +        mac-id = <0>;
>> +
>> +        clk_csr = <4>;
> This property is not documented.
This unused property will be removed.
>
> Cheers,
> Conor.
>
>> +        phy-mode = "rgmii-id";
>> +        phy-handle = <&eth_phy0>;
>> +        mdio0 {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy0: ethernet-phy@0 {
>> +                reg = <0>;
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    //Example 2
>> +    eth1: ethernet@40130000 {
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40130000 0x0 0x10000>;
>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys>;
>> +        resets = <&sys MA35D1_RESET_GMAC1>;
>> +        reset-names = "stmmaceth";
>> +        mac-id = <1>;
>> +
>> +        clk_csr = <4>;
>> +        phy-mode = "rmii";
>> +        phy-handle = <&eth_phy1>;
>> +        mdio1 {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy1: ethernet-phy@1 {
>> +                reg = <1>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1

Thanks!

BR,

Joey

