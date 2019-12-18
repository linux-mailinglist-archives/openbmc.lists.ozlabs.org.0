Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA912E153
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 01:33:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p8Cp53mVzDqBg
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 11:33:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d06C6dL0zDqLJ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 13:57:05 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id k14so513569otn.4
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 18:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HnATBlbL+eZiW12mo0hwrch2CUsppmWX32lWHiTL+YQ=;
 b=pPATZ8miEbR+Q6zTs8dY9mJ0JDKVB3dGj2qCls6IrqIhYBep+fGSTGT4DS3c9+1+T7
 /5FUGTH3l6qZlJu7GOtjyW3vZCQ+5L4ZLyYDJQy7MRwJaQV+Kh+h8i5YX9CBvhllgkkD
 LECN4TIpbUsJts/wlel1Z+BYuPsz/qKorb8JxhSsLtqbAm5Fh6xyQnmD+vFoJGHaMrbC
 0kZY6Aks3j/vWxI5SLy2IHnQeqtiCPSsYnziWAImDPT9dB5P85O0uuhuG+LtGA2VQxTj
 aW8HpB+8d28cayHQRu+PX1cAHsSELKyYfqHyieW0ZeWo2qAlJm7Z1C/paPXJdBU9fw9P
 JB1w==
X-Gm-Message-State: APjAAAXERp+gbabhd7s2iaz356ORuggdv4FSB1AusuzRhYE/iHeNgu0A
 PvjJ64tP11v7jo/tL31nTg==
X-Google-Smtp-Source: APXvYqyihxi8JukdWSv/sqB94AVfuF+A3sZ6QOp7w2twJ4p+CCqPcHedgqwNmZ40BJJHYASG2nIe0Q==
X-Received: by 2002:a05:6830:20c6:: with SMTP id
 z6mr43585otq.272.1576637823440; 
 Tue, 17 Dec 2019 18:57:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z21sm288506oto.52.2019.12.17.18.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 18:57:02 -0800 (PST)
Date: Tue, 17 Dec 2019 20:57:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v11 04/14] dt-bindings: Add bindings document of Aspeed
 PECI adapter
Message-ID: <20191218025702.GA18998@bogus>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-5-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211194624.2872-5-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 02 Jan 2020 11:32:09 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Eric Sandeen <sandeen@redhat.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 David Kershner <david.kershner@unisys.com>, Guenter Roeck <linux@roeck-us.net>,
 Wu Hao <hao.wu@intel.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Philippe Ombredanne <pombredanne@nexb.com>, Johan Hovold <johan@kernel.org>,
 Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sagar Dharia <sdharia@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 11:46:14AM -0800, Jae Hyun Yoo wrote:
> This commit adds bindings document of Aspeed PECI adapter for ASPEED
> AST24xx/25xx/26xx SoCs.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> Changes since v10:
> - Changed documents format to DT schema format so I dropped all review tags.
>   Please review it again.
> 
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> new file mode 100644
> index 000000000000..0f5c2993fe9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed PECI Bus Device Tree Bindings
> +
> +maintainers:
> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-peci
> +      - aspeed,ast2500-peci
> +      - aspeed,ast2600-peci
> +
> +  reg:
> +    maxItems: 1
> +

> +  "#address-cells":
> +    # Required to define a client address.
> +    const: 1
> +
> +  "#size-cells":
> +    # Required to define a client address.
> +    const: 0

These 2 can be defined by the bus schema.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |

You can drop the '|' if there's no formatting to preserve.

> +      Clock source for PECI controller. Should reference the external
> +      oscillator clock.
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    # Operation frequency of PECI controller in units of Hz.
> +    minimum: 187500
> +    maximum: 24000000
> +
> +  msg-timing:
> +    description: |
> +      Message timing negotiation period. This value will determine the period
> +      of message timing negotiation to be issued by PECI controller. The unit
> +      of the programmed value is four times of PECI clock period.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 255
> +        default: 1
> +
> +  addr-timing:
> +    description: |
> +      Address timing negotiation period. This value will determine the period
> +      of address timing negotiation to be issued by PECI controller. The unit
> +      of the programmed value is four times of PECI clock period.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 255
> +        default: 1
> +
> +  rd-sampling-point:
> +    description: |
> +      Read sampling point selection. The whole period of a bit time will be
> +      divided into 16 time frames. This value will determine the time frame
> +      in which the controller will sample PECI signal for data read back.
> +      Usually in the middle of a bit time is the best.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 15
> +        default: 8
> +
> +  cmd-timeout-ms:
> +    # Command timeout in units of ms.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 1
> +        maximum: 60000
> +        default: 1000
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - interrupts
> +  - clocks
> +  - resets
> +  - clock-frequency
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    peci: bus@1e78b000 {
> +        compatible = "simple-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x1e78b000 0x60>;

You can drop this node in the examples.

> +
> +        peci0: peci-bus@0 {
> +            compatible = "aspeed,ast2600-peci";
> +            reg = <0x0 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
> +            resets = <&syscon ASPEED_RESET_PECI>;
> +            clock-frequency = <24000000>;
> +            msg-timing = <1>;
> +            addr-timing = <1>;
> +            rd-sampling-point = <8>;
> +            cmd-timeout-ms = <1000>;
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
