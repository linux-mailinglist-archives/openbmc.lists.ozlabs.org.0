Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30515880F2F
	for <lists+openbmc@lfdr.de>; Wed, 20 Mar 2024 11:00:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q4oNgJq6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V03ww549Mz3dTB
	for <lists+openbmc@lfdr.de>; Wed, 20 Mar 2024 21:00:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q4oNgJq6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V03wJ4PGSz2xdX;
	Wed, 20 Mar 2024 20:59:27 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so513858a12.1;
        Wed, 20 Mar 2024 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710928763; x=1711533563; darn=lists.ozlabs.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPX/wc1kHc0xpncDz4EPl2M7ifASvEah0FtURCCx5xI=;
        b=Q4oNgJq6lFCkWD6sg6J72sXh5gAgvWcQC7xtstg2wk0l0PUAZq7TnstOCiVdUO02rQ
         gM8zNXXJK9HGaBkU2UbgVz2DV8xb84mwy7Vx+9ppF7m45L4mvwOJTzncz7buYRsDwqBp
         lgDjqfpf8yWTHAh4L6jbT99Hq2RtJOshDVui1bbJDkvIP/oVGUYzdcDkaKdwWmP8e0Bo
         JPnVJXRx0cSxQBE3vnOB+M6/8zFyHkO/OyrxK71meCNplDoKg76ccJHXiyx7S0QgGJ46
         7lIIQGntdw1Cx6pLciXmP2bJ5l7bLjvSE9NgunR1qIfIkPPBEyXukWcoF4BxzSLeEGBa
         bmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710928763; x=1711533563;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BPX/wc1kHc0xpncDz4EPl2M7ifASvEah0FtURCCx5xI=;
        b=pPkw/LqiGrSnJ0/r1mWLfBSqwfvsE5b1EJG5b1fvPWCAheI8tr8bgpxfFUH6B7eaRW
         E3Jdp7+FATNmTfvUnmpHTz82Vn10eY+eOjRD9DIikSqiMhqDAANQQxTmQUWmZQB7rhd8
         vqSUJ6/500fLGwZeAaY5dzVatd+LbTZa1zdzm5r+ohHP0qv1/qiFjJopnlUE8L+/yvfj
         pB8COTBzXcvWSu9kkyqtxSYmY9ssCT1QJguE8p2Lcl9ZhzEdB2qerUmtjvib7HrXF21J
         TicfdQ5upIUMPd9E0CDyL3ikJ5ZWj0JZvDK7eFAyLM5uMppHH3obbn7zvTCvESaDwEhC
         MT/A==
X-Forwarded-Encrypted: i=1; AJvYcCUYEYk84599myzO1J9XqK+9t+EMScv3/M0F5EpYOrcZoon8LCWIV2IVU8CwYUh7ua1oMrMJhmjsOLfKqZflhnAEPgZ01BpTdN8vDiVJNTGYx0yf3IsAy0+TzmaGf0gzJg5vEYD4CLdF
X-Gm-Message-State: AOJu0YysVLRCCPyCGcnDs5znfB5g1LicDrOqZqxUJDL3MlJDwjaMtP2P
	DnL+EjNb7H5RcpgoPQ+/vnO6m9KceiPXYxPmlzMIK0s20k5QD9M/
X-Google-Smtp-Source: AGHT+IGPdoo2p9wK26gb/R65q3+5xOWI5IU/8tKcJGmZKV0qfg6GQKC70xY68niFKAUI936svRyaow==
X-Received: by 2002:a17:90a:f188:b0:29d:d940:911e with SMTP id bv8-20020a17090af18800b0029dd940911emr2624315pjb.3.1710928762641;
        Wed, 20 Mar 2024 02:59:22 -0700 (PDT)
Received: from [192.168.29.219] ([49.37.251.254])
        by smtp.gmail.com with ESMTPSA id pd14-20020a17090b1dce00b0029bb8e80fd9sm1162395pjb.39.2024.03.20.02.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 02:59:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------DJCdYTcUxWnkG4a00FcQOnHD"
Message-ID: <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
Date: Wed, 20 Mar 2024 15:29:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: aspeed: Add eSPI controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 patrick.rudolph@9elements.com, chiawei_wang@aspeedtech.com,
 ryan_chen@aspeedtech.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
 <20240319093405.39833-5-manojkiran.eda@gmail.com>
 <bad5df79-e040-4868-9db6-701110894ea3@linaro.org>
From: Manojkiran Eda <manojkiran.eda@gmail.com>
In-Reply-To: <bad5df79-e040-4868-9db6-701110894ea3@linaro.org>
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------DJCdYTcUxWnkG4a00FcQOnHD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 19/03/24 3:26 pm, Krzysztof Kozlowski wrote:
> On 19/03/2024 10:34, Manojkiran Eda wrote:
>> This commit adds the device tree bindings for aspeed eSPI
>> controller.
>>
>> Although aspeed eSPI hardware supports 4 different channels,
>> this commit only adds the support for flash channel, the
>> bindings for other channels could be upstreamed when the driver
>> support for those are added.
>>
>> Signed-off-by: Manojkiran Eda<manojkiran.eda@gmail.com>
>> ---
>>   .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>> new file mode 100644
>> index 000000000000..3d3ad528e3b3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
> Why Rob's comments got ignored?
>
> This is not a soc component.
I did not mean to ignore, i have few reasons listed below that provides 
information on why i felt this belongs into soc.
>
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# # Copyright (c) 2024 IBM Corporation.
>> +# # Copyright (c) 2021 Aspeed Technology Inc.
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/soc/aspeed/aspeed,espi.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Aspeed eSPI Controller
>> +
>> +maintainers:
>> +  - Manojkiran Eda<manojkiran.eda@gmail.com>
>> +  - Patrick Rudolph<patrick.rudolph@9elements.com>
>> +  - Chia-Wei Wang<chiawei_wang@aspeedtech.com>
>> +  - Ryan Chen<ryan_chen@aspeedtech.com>
>> +
>> +description:
>> +  Aspeed eSPI controller implements a device side eSPI endpoint device
>> +  supporting the flash channel.
> Explain what is eSPI.
eSPI is a serial bus interface for client and server platforms that is 
based on SPI,  using the same master and slave topology but operates 
with a different protocol to meet new requirements. For instance, eSPI 
uses I/O, or input/output, communication, instead of MOSI/MISO used in 
SPI. It also includes a transaction layer on top of the SPI protocol, 
defining packets such as command and response packets that allow both 
the master and slave to initiate alert and reset signals. eSPI supports 
communication between Embedded Controller (EC), Baseboard Management 
Controller (BMC), Super-I/O (SIO) and Port-80 debug cards. I could add 
this to the commit message as well in the next patchset.
>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - aspeed,ast2500-espi
>> +          - aspeed,ast2600-espi
>> +      - const: simple-mfd
>
> That's not simple-mfd. You have driver for this. Drop.
>
>> +      - const: syscon
> That's not syscon. Why do you have ranges then? Where is any explanation
> of hardware which would justify such combination?
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^espi-ctrl@[0-9a-f]+$":
>> +    type: object
>> +
>> +    description: Controls the flash channel of eSPI hardware
> That explains nothing. Unless you wanted to use here MTD bindings.
>
> This binding did not improve much. I don't understand why this is not
> SPI (nothing in commit msg, nothing in description), what is eSPI,

eSPI uses Peripheral, Virtual Wire, Out of Band, and Flash Access 
channels to communicate different sets of data.

  * The *Peripheral* Channel is used for communication between eSPI host
    bridge located on the master side and eSPI endpoints located on the
    slave side. LPC Host and LPC Peripherals are an example of eSPI host
    bridge and eSPI endpoints respectively.
  * *Virtual Wire* Channel: The Virtual Wire channel is used to
    communicate the state of sideband pins or GPIO tunneled through eSPI
    as in-band messages. Serial IRQ interrupts are communicated through
    this channel as in-band messages.
  * *OOB* Channel: The SMBus packets are tunneled through eSPI as
    Out-Of-Band (OOB) messages. The whole SMBus packet is embedded
    inside the eSPI OOB message as data.
  * *Flash Access* Channel: The Flash Access channel provides a path
    allowing the flash components to be shared run-time between chipset
    and the eSPI slaves that require flash accesses such as EC (Embedded
    Controller) and BMC.

Although , eSPI reuses the timing and electrical specification of Serial 
Peripheral Interface (SPI) but it runs an entirely different protocol to 
meet a set of different requirements. Which is why i felt probably 
placing this in soc was a better choice rather than spi. Do you think 
otherwise ?

>   why
> do you need child device, what are other children (commit msg is quite
> vague here). Why there is no MTD bindings here?
>
> All this looks like crafted for your driver,

Apologies, this was not my intention. I wanted this to be as generic as 
possible. But i don't really have much knowledge on what's the right way 
to model things in kernel at the moment. Still trying to learn and 
understand by looking at various other drivers. Appreciate all the 
feedback.
>   instead of using existing
> DT bindings like SPI or MTD/NAND. This is a strong no-go.

>> +
>> +    properties:
>> +      compatible:
>> +        items:
> No items, just use enum.
sure, will fix it.
>> +          - enum:
>> +              - aspeed,ast2500-espi-ctrl
>> +              - aspeed,ast2600-espi-ctrl
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +      clocks:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - compatible
>> +      - interrupts
>> +      - clocks
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +
>> +    espi: espi@1e6ee000 {
>> +        compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
>> +        reg = <0x1e6ee000 0x1000>;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0x1e6ee000 0x1000>;
>> +
>> +        espi_ctrl: espi-ctrl@0 {
>> +            compatible = "aspeed,ast2600-espi-ctrl";
>> +            reg = <0x0 0x800>,<0x0 0x4000000>;
> Fix your style in DTS. There is always a space after ','.
sure , will fix that. Is there a link that could help me understand 
various styling requirements on the DTS files. Also is there any 
formatting tool available currently ? that could fix the styling in the 
DTS files automatically rather than manual inspection/modification. Did 
i accidentally missed running some tool check ?
>
>> +            reg-names = "espi_ctrl","espi_flash";
>> +            interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
>> +        };
>> +    };
> Best regards,
> Krzysztof
>
>
Krzysztof,Thanks for the review comments. I am still figuring out few of the 
review comments (would need a little more time, since its my first 
attempt into kernel development) , but mean while I wanted to make sure 
if the direction of choosing "soc" vs "spi" was correct, so that i could 
re-work on the comments.So i have selectively answered to few of your 
comments. Could you let me know if the reasoning that was provided in 
reply to your comments help ? Thanks, Manoj

--------------DJCdYTcUxWnkG4a00FcQOnHD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 19/03/24 3:26 pm, Krzysztof
      Kozlowski wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap="">On 19/03/2024 10:34, Manojkiran Eda wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This commit adds the device tree bindings for aspeed eSPI
controller.

Although aspeed eSPI hardware supports 4 different channels,
this commit only adds the support for flash channel, the
bindings for other channels could be upstreamed when the driver
support for those are added.

Signed-off-by: Manojkiran Eda <a class="moz-txt-link-rfc2396E" href="mailto:manojkiran.eda@gmail.com">&lt;manojkiran.eda@gmail.com&gt;</a>
---
 .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
new file mode 100644
index 000000000000..3d3ad528e3b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why Rob's comments got ignored?

This is not a soc component.</pre>
    </blockquote>
    <font size="2">I did not mean to ignore, i have few reasons listed
      below that provides information on why i felt this belongs into
      soc.</font><br>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# # Copyright (c) 2024 IBM Corporation.
+# # Copyright (c) 2021 Aspeed Technology Inc.
+%YAML 1.2
+---
+$id: <a class="moz-txt-link-freetext" href="http://devicetree.org/schemas/soc/aspeed/aspeed,espi.yaml#">http://devicetree.org/schemas/soc/aspeed/aspeed,espi.yaml#</a>
+$schema: <a class="moz-txt-link-freetext" href="http://devicetree.org/meta-schemas/core.yaml#">http://devicetree.org/meta-schemas/core.yaml#</a>
+
+title: Aspeed eSPI Controller
+
+maintainers:
+  - Manojkiran Eda <a class="moz-txt-link-rfc2396E" href="mailto:manojkiran.eda@gmail.com">&lt;manojkiran.eda@gmail.com&gt;</a>
+  - Patrick Rudolph <a class="moz-txt-link-rfc2396E" href="mailto:patrick.rudolph@9elements.com">&lt;patrick.rudolph@9elements.com&gt;</a>
+  - Chia-Wei Wang <a class="moz-txt-link-rfc2396E" href="mailto:chiawei_wang@aspeedtech.com">&lt;chiawei_wang@aspeedtech.com&gt;</a>
+  - Ryan Chen <a class="moz-txt-link-rfc2396E" href="mailto:ryan_chen@aspeedtech.com">&lt;ryan_chen@aspeedtech.com&gt;</a>
+
+description:
+  Aspeed eSPI controller implements a device side eSPI endpoint device
+  supporting the flash channel.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Explain what is eSPI.</pre>
    </blockquote>
    <font size="2">eSPI is a serial bus interface for client and server
      platforms that is based on SPI,  using the same master and slave
      topology but operates with a different protocol to meet new
      requirements. </font><font size="2">For instance, eSPI uses I/O,
      or input/output, communication, instead of MOSI/MISO used in SPI.
      It also includes a transaction layer on top of the SPI protocol,
      defining packets such as command and response packets that allow
      both the master and slave to initiate alert and reset signals.
      eSPI supports communication between Embedded Controller (EC),
      Baseboard Management Controller (BMC), Super-I/O (SIO) and Port-80
      debug cards. I could add this to the commit message as well in the
      next patchset.<br>
    </font>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2500-espi
+          - aspeed,ast2600-espi
+      - const: simple-mfd
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

That's not simple-mfd. You have driver for this. Drop.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+      - const: syscon
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's not syscon. Why do you have ranges then? Where is any explanation
of hardware which would justify such combination?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^espi-ctrl@[0-9a-f]+$":
+    type: object
+
+    description: Controls the flash channel of eSPI hardware
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That explains nothing. Unless you wanted to use here MTD bindings.

This binding did not improve much. I don't understand why this is not
SPI (nothing in commit msg, nothing in description), what is eSPI,</pre>
    </blockquote>
    <p><font size="2">eSPI uses Peripheral, Virtual Wire, Out of Band,
        and Flash Access channels to communicate different sets of data.</font></p>
    <ul>
      <li><font size="2">The <strong>Peripheral</strong> Channel is
          used for communication between eSPI host bridge located on the
          master side and eSPI endpoints located on the slave side. LPC
          Host and LPC Peripherals are an example of eSPI host bridge
          and eSPI endpoints respectively.</font></li>
      <li><font size="2"><strong>Virtual Wire</strong> Channel: The
          Virtual Wire channel is used to communicate the state of
          sideband pins or GPIO tunneled through eSPI as in-band
          messages. Serial IRQ interrupts are communicated through this
          channel as in-band messages.</font></li>
      <li><font size="2"><strong>OOB</strong> Channel: The SMBus packets
          are tunneled through eSPI as Out-Of-Band (OOB) messages. The
          whole SMBus packet is embedded inside the eSPI OOB message as
          data.</font></li>
      <li><font size="2"><strong>Flash Access</strong> Channel: The
          Flash Access channel provides a path allowing the flash
          components to be shared run-time between chipset and the eSPI
          slaves that require flash accesses such as EC (Embedded
          Controller) and BMC.</font></li>
    </ul>
    <p><font size="2">Although , eSPI reuses the timing and electrical
        specification of Serial Peripheral Interface (SPI) but it runs
        an entirely different protocol to meet a set of different
        requirements. Which is why i felt probably placing this in soc
        was a better choice rather than spi. Do you think otherwise ?</font><br>
    </p>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap=""> why
do you need child device, what are other children (commit msg is quite
vague here). Why there is no MTD bindings here?

All this looks like crafted for your driver,</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap=""></pre>
    <font size="2">Apologies, this was not my intention. I wanted this
      to be as generic as possible. But i don't really have much
      knowledge on what's the right way to model things in kernel at the
      moment. Still trying to learn and understand by looking at various
      other drivers. Appreciate all the feedback.</font>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap=""> instead of using existing
DT bindings like SPI or MTD/NAND. This is a strong no-go.
</pre>
    </blockquote>
    <p></p>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+    properties:
+      compatible:
+        items:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No items, just use enum.
</pre>
    </blockquote>
    <font size="2">sure, will fix it.</font><br>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+          - enum:
+              - aspeed,ast2500-espi-ctrl
+              - aspeed,ast2600-espi-ctrl
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+    required:
+      - compatible
+      - interrupts
+      - clocks
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include &lt;dt-bindings/interrupt-controller/arm-gic.h&gt;
+    #include &lt;dt-bindings/clock/ast2600-clock.h&gt;
+
+    espi: espi@1e6ee000 {
+        compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
+        reg = &lt;0x1e6ee000 0x1000&gt;;
+
+        #address-cells = &lt;1&gt;;
+        #size-cells = &lt;1&gt;;
+        ranges = &lt;0x0 0x1e6ee000 0x1000&gt;;
+
+        espi_ctrl: espi-ctrl@0 {
+            compatible = "aspeed,ast2600-espi-ctrl";
+            reg = &lt;0x0 0x800&gt;,&lt;0x0 0x4000000&gt;;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Fix your style in DTS. There is always a space after ','.</pre>
    </blockquote>
    <font size="2">sure , will fix that. Is there a link that could help
      me understand various styling requirements on the DTS files. Also
      is there any formatting tool available currently ? that could fix
      the styling in the DTS files automatically rather than manual
      inspection/modification. Did i accidentally missed running some
      tool check ? </font><br>
    <blockquote type="cite"
      cite="mid:bad5df79-e040-4868-9db6-701110894ea3@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+            reg-names = "espi_ctrl","espi_flash";
+            interrupts = &lt;GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH&gt;;
+            clocks = &lt;&amp;syscon ASPEED_CLK_GATE_ESPICLK&gt;;
+        };
+    };
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Best regards,
Krzysztof


</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Krzysztof, <span
    style="white-space: normal">Thanks for the review comments.

I am still figuring out few of the review comments (would need a little more time, since its my first attempt into kernel development) , but mean while I wanted to make sure if the direction of choosing "soc" vs "spi" was correct, so that i could re-work on the comments.So i have selectively answered to few of your comments. Could you let me know if the reasoning that was provided in reply to your comments help ? 

Thanks,
Manoj  
</span></pre>
  </body>
</html>

--------------DJCdYTcUxWnkG4a00FcQOnHD--
