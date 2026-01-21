Return-Path: <openbmc+bounces-1264-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFwwNtxMcWkahAAAu9opvQ
	(envelope-from <openbmc+bounces-1264-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:02:04 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05E5E6DF
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:02:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxJ7p2CL5z2yDY;
	Thu, 22 Jan 2026 09:01:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768965734;
	cv=none; b=TfkdDNBcRxYpCprAnJC1A+bQu4zo7ikPFSlKxbx8xMbiB2enNKbuOaOGuOzConq/DinnT4yEl2YH9Uc0leuiFCdknJqft78KFkXDnBW9U4U0lWIn0XcRdZKsGafqmPtH6SJSKvfKPzdSrBxsreHvGPWb522VrlL2+cp5PADjBOjPuWe92N/8PPrS1HN1sdfLcz1mSkAFrpTe3JKwaX+yDVgQ1aPqFetqWlWENMuwkqWkTA4hCarlwF27PKe6HD8ltRrNeB55W8nLNhsyLGYoyILFUr3cJDAkl+MaIWdsJ2uvpxxdhZQdfNaz/ldS+NDhwLo4Oezt4OUun7jROngVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768965734; c=relaxed/relaxed;
	bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGdUdnucqKIv04FV1MKVzogtLA4wPsIItSYDjUxLoqLDEjaXXnWYvWey4FpAr1qmoqsWXH+0tHiv0PqCzmu04LLrHW7QZ+UxJwCC1e5qWQP7qnpY1GXVx3FIf/xYxf35FiTJ14cQj9b9nvIyfokQ4WPGIFqCtG926ix1gZJQPjv3CfCVVrOqHiOibCweh3CQpvO4sz/mzsyW/b9Pmh8jRCaSONG0VNLG4heLrnE5j5mZjGwSAOMOW6geINxbeHH9TBvDwT77X+/btkoAOdJBibbw22DVxCyrGPEgLyXNud+bKLY6DPA9ZtcTuNtmdmfnk3jS7ZqfQtQ4XQkDpOdG2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xg8/jCoc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xg8/jCoc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwqHm66VKz2xqD
	for <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 14:22:12 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso3499133b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 20 Jan 2026 19:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768965730; x=1769570530; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=;
        b=Xg8/jCocg8WCGdNAGspEEpL2lKCz9oV7Cdy6GsqQCZBF2TrcXgqrInzlzkpU7hack8
         vYSEVpxDU/Xz0Yhjt67qG2Ekuo7mGREK3yYgtTF261CZxErsnQM8n+VR8YutEtnMODq7
         +uZqlBnfBMgFciptFtE2HW56QFX6bgdX5daAFHMXbogiLUSt5LJIlhAKPW7zIYpuZ3Oh
         TB5F6IWqULF+fQ2A9M+rQtJ1NjlYiplQ/o9TUQ61r6K9wKxdp2Qb1TB7PLpVDhYd/fSL
         aLnvmF04J1LuYB8XNWvuVEf1qXQwltd15/3JmIPDIjzxHpalHzZtgVocX8TWMQOa5P5Q
         Ba+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768965730; x=1769570530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17+DNkkNcmMDigIJBL8XgDaqQaWKVbdBHFS6qgPE1RU=;
        b=w6zeyXzvEw0166lYMZbuLZWzoPH77R2zUPfOFB0cioFyFh7BbH3HieRgklD6srPJL2
         viWA6nmAWebEpf7wEV5gG0AIc1VGUTBlB6VIatEiHVJhaYtTQzVIqQ89xAtL0B7WzRYY
         fob+Q3fdiJNLVi1Pb+wBlQ99Ca/DEGtmqgfG3UxO/S8gShTRL318/9Yd9UrS/AziijWd
         92CIvEUkVBeNyfhcDFWbS5Iwo8+Ncgra+J4l7KD8JsyVJDNpxClhJUTJDHTrpdsCJ2nK
         tGocMAKrb6MrQqmEP1x4N2fWKUba8Oek0zdQBU4EUuzV7gArHM0UOg1tWSqymOnbxKkK
         sr1w==
X-Forwarded-Encrypted: i=1; AJvYcCXEpGs3FUxcnkNHfIYllpp5Yq5hxPCJRMW80IY8JT+Sec8RCceCTWPn+ruPIiOIbOn5Ju6CLLh/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMENa5Uw4N9daNwFxtyvydQdAR1FQ4bEwgrlVly1wYk5rxY7GB
	yJQMjEkeVRkzCmp9Rl25LKw/lNpJNibdGT+PzdFE6rFD6SgLqa1fHYSY
X-Gm-Gg: AZuq6aLojmzfdie/iz0RLMbgWIw2WMAZ4mMYnZwaRWHR4k86Zb2ta68BsbEM/DXmsIM
	Mss5nKvZxcDAsJru4f7c5aquqx6nOjx3HJd5iodFBjAExkMFzHtQ0gnD8cGbn/po8GydPvqYTfo
	69x88wh39b7xo+pz6vsclivxg39Vpi8SUEqj6JoQpXlTtNtJjYTDz4GCRMYGvRnaQLFOGZVZ/pO
	/wgNLy4rtrPGjUcqC1DYSdodEZIKNkY7rXHj/pg6FxDaQQi11qNLiu+rF5bVMHjGwbfwSOC85k6
	rxd95wnYfwQFI8xKPK3fkIvHocL45+5fEi2vohmRtqmFanTh7oAPMCm5I/qcvw/t2gml6ea7JTc
	GyTH9Vc8aV5q9amzyCO8qlWSAlEdNCpI4Z1yB0uWds002jtiDMBc+7dWvijyyiiMuR783bvEvre
	NC+17SYbuLGkbB2L8rRK8kODi1FFB/3lg+PPIStO5OroRTMAJSIj3h66NIMZE7izoc
X-Received: by 2002:aa7:888b:0:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-81fe87db4bamr3212275b3a.11.1768965730358;
        Tue, 20 Jan 2026 19:22:10 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1291135sm13268978b3a.47.2026.01.20.19.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 19:22:10 -0800 (PST)
Message-ID: <7a43bedf-6d31-4ae1-b2c6-97cb3757ad9f@gmail.com>
Date: Wed, 21 Jan 2026 11:22:03 +0800
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 1/3] dt-bindings: net: nuvoton: Add schema for
 Nuvoton MA35 family GMAC
To: Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-2-a0987203069@gmail.com>
 <20260121020728.GA1671298-robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260121020728.GA1671298-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_HEX,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1264-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[2.100.46.192:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,devicetree.org:url,nuvoton.com:email]
X-Rspamd-Queue-Id: 2A05E5E6DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Rob Herring 於 1/21/2026 10:07 AM 寫道:
> On Mon, Jan 19, 2026 at 03:33:39PM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>   2 files changed, 127 insertions(+)
>>   create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> This should not be executable.
>
> Rob
Thanks for catching this.

I will fix the file mode in the next revision.

Joey

>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> new file mode 100755
>> index 000000000000..8eaddfdc937c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> @@ -0,0 +1,126 @@
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
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - nuvoton,sys
>> +  - resets
>> +  - reset-names
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
>> +            eth_phy0: ethernet-phy@0 {
>> +                reg = <0>;
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index dd3c72e8363e..10cb5e555750 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -69,6 +69,7 @@ properties:
>>           - ingenic,x2000-mac
>>           - loongson,ls2k-dwmac
>>           - loongson,ls7a-dwmac
>> +        - nuvoton,ma35d1-dwmac
>>           - nxp,s32g2-dwmac
>>           - qcom,qcs404-ethqos
>>           - qcom,sa8775p-ethqos
>> -- 
>> 2.43.0
>>

