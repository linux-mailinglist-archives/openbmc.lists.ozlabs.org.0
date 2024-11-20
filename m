Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F372D9D43D9
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 23:16:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtwgV2sMcz3c9b
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 09:16:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732092004;
	cv=none; b=UFlGotg2sO865FXy6Sm4lbdLCJFHMn9VVweZLLldYo55G6/R/ms3Sk+U5mJL8s7yFUaKJc+hJAF6a6KjNlkLhgbFXfvCTeq8q0+uc8hzqVJEsws1XPFMP1+NJXvRBn883Iu9OrsMKUDfKHpmylTpc3jR/A/qNJIzMo9JjFJlcKCThQIad4Mz37bLumhPBrIQxuEupmW+Cq6aERkySIIZM8v82DQx4Zl6ad99uuc7L2D99U8gHIrcF/6oXck+yV6gb4jdejWHEFkaDwxT8hJCgV4QAMQLZCaJT5TafMawyGi1GUcRwHXusT7OnopFhrqc2HnpXIV1IZs/MFzYom0VIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732092004; c=relaxed/relaxed;
	bh=otVzPudNyMZ+ABjcE6wfYbv41dBTUXAQhybV35zixxE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=mqUW0Jdo/BSLDzxOB+wBy8IaY0IiDSNrqh955Ykq6waz+X4VF5D6D8Y9ODppzvHJm5X9cvRdhsjXb460Hz2OEbhkFJIsdIgJjhIjygmYVXU7Fxv0pxpIoWVVjkKaIRmA7tUo6wJ/tGSgaQYcltnI3N+WiqxajX2kC01Eoj1AzmM/py8dP7ahLlqSvSJ2SAhgsF48Jjz3N+ZLbLsQD/Vev9AESCGW9WihtdlUIV7bOycuSP2u/2oRCDJsUnEbo3YoEFFDHI+GkzKgS2Cr9J/alb5BopkiAEkZ+DkojZjtCEE3OEn/5Zj1eGcN98ylO/EFkiIQfH6NKPfpRb9SFvZUiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aUgYyVR9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aUgYyVR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtZYb0vtDz2yQL
	for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 19:40:01 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7248c1849bdso3644411b3a.3
        for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 00:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732091999; x=1732696799; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otVzPudNyMZ+ABjcE6wfYbv41dBTUXAQhybV35zixxE=;
        b=aUgYyVR9Ho+rgTXMrDkvp0o4DIPBhdmMCDJ7/0OZoMElFHOuML8gWfmf5DvPRE6VTe
         IRmqqUbqcwST6qCForD0batO4gSwp0fNS6xAHAUCmV6fJ8Gmk4elgwuSV3UsoKROj7cb
         yUWnAgVI59Ly2/pUOwybo9/to7Y7HI6xsPBiQC7ofDkcESL7uIhn6cNHAv3XOOzmq5mE
         /l4Q2XZlsztXgT4kJDZGPybLkyqy5S4nDF+RP2nDeO60phw8FaE271dafEJxOeexV+Kx
         5hbOHoDDxIB600b/sWVUk9lNRmcnOZBGx0lJrgHwNUyK6yHAhd0CJ+YVackUvDJEQ88X
         Emsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732091999; x=1732696799;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otVzPudNyMZ+ABjcE6wfYbv41dBTUXAQhybV35zixxE=;
        b=NfEAFPk4e1MHyazzc46c7gF82sSF+4D22Oth+d25dW4YUCPQ0Jhe0LZA3KRE4Su3+C
         km3ULYCK+smxAfLf3Uzg0MbOkh8T+/7u7yQH0izSPW5eUNvh41bCcRw6/h4Ewk60Jdks
         jcsnyFvDqNC7lbPRW7Md6qS8sbTSlTWjhX82zDNMm5jJYDwT71bVfIphUA5FUWFOGLNc
         k6h6gPFcX9oNecfFyPmsmKM8BD/3f0sy8YCOpg2VITwjKI4ahCub9LsZSEtkb+EXOiy8
         fUXJwBQcyvOUn+e1SmE5mTAPtbneEDl2hfJ4eOUfjoRY8IywwB/gb1jvLUHN821r6UxF
         CgOg==
X-Forwarded-Encrypted: i=1; AJvYcCXenUAB+WelgjOSJhpC5sfYgUKxnGzuytwlljs0vcCPWG52Ce9N1anrc9Pgcx4+nkM0OPLe1rtt@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKcdy54VWI/3bcT2AnE4ppQ4/6T3S9bbk/jyFmvjkx9cI2vOmX
	xH6lzyG/yvgh7FxYV0NIgnQKmS9WkjQqDbTFKu8hIKwp5JwNux96
X-Google-Smtp-Source: AGHT+IGksaGBOOPKGbpcLkMU1tNiZu/dLi8FdP/Y5naOotLnNmH2PHc76VRSizNoDnhnbMRSe1b68w==
X-Received: by 2002:a05:6a00:995:b0:71e:594:f1ef with SMTP id d2e1a72fcca58-724bed27c09mr2525737b3a.16.1732091998688;
        Wed, 20 Nov 2024 00:39:58 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beefee95sm1070421b3a.72.2024.11.20.00.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 00:39:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------mOQs0W70zxFjiHeaOz2MW1HZ"
Message-ID: <ee1c7f01-5e6f-4e0e-89dc-e45c5d1054ab@gmail.com>
Date: Wed, 20 Nov 2024 16:39:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Rob Herring <robh@kernel.org>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-2-a0987203069@gmail.com>
 <20241119181237.GA1871579-robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241119181237.GA1871579-robh@kernel.org>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 21 Nov 2024 09:16:18 +1100
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

This is a multi-part message in MIME format.
--------------mOQs0W70zxFjiHeaOz2MW1HZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Rob,

Thank you for your reply.

Rob Herring 於 11/20/2024 2:12 AM 寫道:
> On Mon, Nov 18, 2024 at 04:27:05PM +0800, Joey Lu wrote:
>> Create initial schema for Nuvoton MA35 family Gigabit MAC.
>>
>> Signed-off-by: Joey Lu<a0987203069@gmail.com>
>> ---
>>   .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 ++++++++++++++++++
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>   2 files changed, 174 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> new file mode 100644
>> index 000000000000..92cbbcc72f2b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
>> @@ -0,0 +1,173 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton DWMAC glue layer controller
>> +
>> +maintainers:
>> +  - Joey Lu<yclu4@nuvoton.com>
>> +
>> +description:
>> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
>> +  Synopsys DesignWare MAC (version 3.73a).
>> +
>> +# We need a select here so we don't match all nodes with 'snps,dwmac'
> You mean snps,dwmac-3.70a?
I found that the yaml can pass |dt_binding_check| without |select|. I 
will drop these lines.
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
>> +    oneOf:
> oneOf is not correct. I think you wanted 'items'.
I will fix it.
>> +      - enum:
>> +          - nuvoton,ma35d1-dwmac
>> +      - const: snps,dwmac-3.70a
> But you said above the h/w is 3.73a.
>
> Really, I'd prefer to just drop this because it's not useful on its own.
> But the driver does check for snps,dwmac-3.70a. All those
> of_device_is_compatible() calls in the driver should really be replaced
> with static match data structs.
Yes, I will drop it.
>> +
>> +  reg:
>> +    description:
>> +      Register range should be one of the GMAC interface.
> Need to define how many entries and what they are if more than 1.
This will be fixed.
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
>> +  phy-handle:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
> The type is already defined. Drop.
I will drop it.
>> +    description:
>> +      Specifies a reference to a node representing a PHY device.
>> +
>> +  tx-internal-delay-ps:
>> +    enum: [0, 2000]
>> +    default: 0
>> +    description:
>> +      RGMII TX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
>> +
>> +  rx-internal-delay-ps:
>> +    enum: [0, 2000]
>> +    default: 0
>> +    description:
>> +      RGMII RX path delay used only when PHY operates in RGMII mode with
>> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
>> +
>> +  mdio:
>> +    $ref: /schemas/net/mdio.yaml#
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
>> +  - phy-mode
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +    //Example 1
> Not a useful comment.
I will drop it.
>> +    gmac0: ethernet@40120000 {
> Drop unused labels.
All unused labels will be dropped.
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40120000 0x0 0x10000>;
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
>> +        mdio0: mdio {
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
>> +    gmac1: ethernet@40130000 {
> Drop the example. It's almost the same as the first one.
I will drop it.
>> +        compatible = "nuvoton,ma35d1-dwmac";
>> +        reg = <0x0 0x40130000 0x0 0x10000>;
>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "macirq";
>> +        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
>> +        clock-names = "stmmaceth", "ptp_ref";
>> +
>> +        nuvoton,sys = <&sys 1>;
>> +        resets = <&sys MA35D1_RESET_GMAC1>;
>> +        reset-names = "stmmaceth";
>> +
>> +        phy-mode = "rmii";
>> +        phy-handle = <&eth_phy1>;
>> +        mdio1: mdio {
>> +            compatible = "snps,dwmac-mdio";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            eth_phy1: ethernet-phy@1 {
>> +                reg = <1>;
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index 4e2ba1bf788c..aecdb3d37b53 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -66,6 +66,7 @@ properties:
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

--------------mOQs0W70zxFjiHeaOz2MW1HZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Rob,</p>
    <p>Thank you for your reply.<br>
    </p>
    <div class="moz-cite-prefix">Rob Herring 於 11/20/2024 2:12 AM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">On Mon, Nov 18, 2024 at 04:27:05PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Create initial schema for Nuvoton MA35 family Gigabit MAC.

Signed-off-by: Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:a0987203069@gmail.com">&lt;a0987203069@gmail.com&gt;</a>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..92cbbcc72f2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: <a class="moz-txt-link-freetext" href="http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#">http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#</a>
+$schema: <a class="moz-txt-link-freetext" href="http://devicetree.org/meta-schemas/core.yaml#">http://devicetree.org/meta-schemas/core.yaml#</a>
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:yclu4@nuvoton.com">&lt;yclu4@nuvoton.com&gt;</a>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+# We need a select here so we don't match all nodes with 'snps,dwmac'
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You mean snps,dwmac-3.70a?
</pre>
    </blockquote>
    I found that the yaml can pass <code>dt_binding_check</code>
    without <code>select</code>. I will drop these lines.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    oneOf:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
oneOf is not correct. I think you wanted 'items'.
</pre>
    </blockquote>
    I will fix it.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+      - enum:
+          - nuvoton,ma35d1-dwmac
+      - const: snps,dwmac-3.70a
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But you said above the h/w is 3.73a.

Really, I'd prefer to just drop this because it's not useful on its own. 
But the driver does check for snps,dwmac-3.70a. All those 
of_device_is_compatible() calls in the driver should really be replaced 
with static match data structs.
</pre>
    </blockquote>
    Yes, I will drop it.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+  reg:
+    description:
+      Register range should be one of the GMAC interface.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Need to define how many entries and what they are if more than 1.
</pre>
    </blockquote>
    This will be fixed.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  phy-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The type is already defined. Drop.
</pre>
    </blockquote>
    I will drop it.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    description:
+      Specifies a reference to a node representing a PHY device.
+
+  tx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+
+  rx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include &lt;dt-bindings/interrupt-controller/arm-gic.h&gt;
+    #include &lt;dt-bindings/clock/nuvoton,ma35d1-clk.h&gt;
+    #include &lt;dt-bindings/reset/nuvoton,ma35d1-reset.h&gt;
+    //Example 1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not a useful comment.
</pre>
    </blockquote>
    I will drop it.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    gmac0: ethernet@40120000 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Drop unused labels.
</pre>
    </blockquote>
    All unused labels will be dropped.<br>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = &lt;0x0 0x40120000 0x0 0x10000&gt;;
+        interrupts = &lt;GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH&gt;;
+        interrupt-names = "macirq";
+        clocks = &lt;&amp;clk EMAC0_GATE&gt;, &lt;&amp;clk EPLL_DIV8&gt;;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = &lt;&amp;sys 0&gt;;
+        resets = &lt;&amp;sys MA35D1_RESET_GMAC0&gt;;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = &lt;&amp;eth_phy0&gt;;
+        mdio0: mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = &lt;1&gt;;
+            #size-cells = &lt;0&gt;;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = &lt;0&gt;;
+            };
+        };
+    };
+
+  - |
+    //Example 2
+    gmac1: ethernet@40130000 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Drop the example. It's almost the same as the first one.
</pre>
    </blockquote>
    I will drop it.
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = &lt;0x0 0x40130000 0x0 0x10000&gt;;
+        interrupts = &lt;GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH&gt;;
+        interrupt-names = "macirq";
+        clocks = &lt;&amp;clk EMAC1_GATE&gt;, &lt;&amp;clk EPLL_DIV8&gt;;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = &lt;&amp;sys 1&gt;;
+        resets = &lt;&amp;sys MA35D1_RESET_GMAC1&gt;;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rmii";
+        phy-handle = &lt;&amp;eth_phy1&gt;;
+        mdio1: mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = &lt;1&gt;;
+            #size-cells = &lt;0&gt;;
+
+            eth_phy1: ethernet-phy@1 {
+                reg = &lt;1&gt;;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..aecdb3d37b53 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -66,6 +66,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
-- 
2.34.1
</pre>
      </blockquote>
    </blockquote>
    <p>Thanks!</p>
    <p>BR,</p>
    <p>Joey<br>
    </p>
    <blockquote type="cite"
      cite="mid:20241119181237.GA1871579-robh@kernel.org">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------mOQs0W70zxFjiHeaOz2MW1HZ--
