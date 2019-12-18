Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361512E152
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 01:32:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p8Bh0JMVzDqBg
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 11:32:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d01938GRzDqLJ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 13:52:44 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id 77so496676oty.6
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 18:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sakYv7BHYRv9Zt+Z2j2doXtLovgAGwFnnV7hzjdze40=;
 b=C9X2toRC6RuYaj1LKn0O/C470BVyUE46thb/pdD8e6GMH+xcNBq/0vv6fXEoRS6mBs
 VZ6J6UDCww4RzlBtGIxZJphYb/9UylCJ7bzhxuwwgfmGrMjPZEJ8GOuYUbvIiqi+6k4S
 dcaLeeJm9yYxmGFRVMLGRElmCM8xNDieaSpIbhmMz5EBokCc2+lAYZhT9Il+HQJuknTQ
 CgfcggehbUI+HCEjJ2NkKz4kJYlDwonAGsr+keTxDl7F2brOm8OghZnBFPYAzCSx1Pyu
 /G/jHSGUsxTQPl5de1ZqhYQRb2iS9HzfivrvzyXWVG8b97vO+Y7NUyNUFSH9mouUPq/X
 T4Xw==
X-Gm-Message-State: APjAAAVQxj4R6paBz7EgkCyVQMlCHAY9cXiA5ewcCii0QWC1ZGPlq5ci
 74wt+zHpQs+KgwOdg3ylsw==
X-Google-Smtp-Source: APXvYqxfxhhIzHwdJZry8Ru7K7JGWxVQ5hecBIvtj7j8AmbBTKCq3Uq+fMuOL/X20DJuaPkTBziq6w==
X-Received: by 2002:a9d:6c06:: with SMTP id f6mr19195otq.318.1576637561893;
 Tue, 17 Dec 2019 18:52:41 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s83sm327757oif.33.2019.12.17.18.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 18:52:41 -0800 (PST)
Date: Tue, 17 Dec 2019 20:52:40 -0600
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v11 01/14] dt-bindings: Add PECI subsystem document
Message-ID: <20191218025240.GA6601@bogus>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211194624.2872-2-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 02 Jan 2020 11:32:08 +1100
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
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Eric Sandeen <sandeen@redhat.com>,
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
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 11, 2019 at 11:46:11AM -0800, Jae Hyun Yoo wrote:
> This commit adds PECI subsystem document.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> Changes since v10:
> - Changed documents format to DT schema format so I dropped all review tags.
>   Please review it again.
> 
>  .../devicetree/bindings/peci/peci-bus.yaml    | 129 ++++++++++++++++++
>  .../devicetree/bindings/peci/peci-client.yaml |  54 ++++++++
>  2 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.yaml
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-client.yaml
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-bus.yaml b/Documentation/devicetree/bindings/peci/peci-bus.yaml
> new file mode 100644
> index 000000000000..b085e67089cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-bus.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Device Tree Bindings for PECI bus
> +
> +maintainers:
> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +description: |
> +  PECI (Platform Environment Control Interface) is a one-wire bus interface that
> +  provides a communication channel from Intel processors and chipset components
> +  to external monitoring or control devices. PECI is designed to support the
> +  following sideband functions:
> +
> +  * Processor and DRAM thermal management
> +    - Processor fan speed control is managed by comparing Digital Thermal
> +      Sensor (DTS) thermal readings acquired via PECI against the
> +      processor-specific fan speed control reference point, or TCONTROL. Both
> +      TCONTROL and DTS thermal readings are accessible via the processor PECI
> +      client. These variables are referenced to a common temperature, the TCC
> +      activation point, and are both defined as negative offsets from that
> +      reference.
> +    - PECI based access to the processor package configuration space provides
> +      a means for Baseboard Management Controllers (BMC) or other platform
> +      management devices to actively manage the processor and memory power
> +      and thermal features.
> +
> +  * Platform Manageability
> +    - Platform manageability functions including thermal, power, and error
> +      monitoring. Note that platform 'power' management includes monitoring
> +      and control for both the processor and DRAM subsystem to assist with
> +      data center power limiting.
> +    - PECI allows read access to certain error registers in the processor MSR
> +      space and status monitoring registers in the PCI configuration space
> +      within the processor and downstream devices.
> +    - PECI permits writes to certain registers in the processor PCI
> +      configuration space.
> +
> +  * Processor Interface Tuning and Diagnostics
> +    - Processor interface tuning and diagnostics capabilities
> +      (Intel Interconnect BIST). The processors Intel Interconnect Built In
> +      Self Test (Intel IBIST) allows for infield diagnostic capabilities in
> +      the Intel UPI and memory controller interfaces. PECI provides a port to
> +      execute these diagnostics via its PCI Configuration read and write
> +      capabilities.
> +
> +  * Failure Analysis
> +    - Output the state of the processor after a failure for analysis via
> +      Crashdump.
> +
> +  PECI uses a single wire for self-clocking and data transfer. The bus
> +  requires no additional control lines. The physical layer is a self-clocked
> +  one-wire bus that begins each bit with a driven, rising edge from an idle
> +  level near zero volts. The duration of the signal driven high depends on
> +  whether the bit value is a logic '0' or logic '1'. PECI also includes
> +  variable data transfer rate established with every message. In this way, it
> +  is highly flexible even though underlying logic is simple.
> +
> +  The interface design was optimized for interfacing between an Intel
> +  processor and chipset components in both single processor and multiple
> +  processor environments. The single wire interface provides low board
> +  routing overhead for the multiple load connections in the congested routing
> +  area near the processor and chipset components. Bus speed, error checking,
> +  and low protocol overhead provides adequate link bandwidth and reliability
> +  to transfer critical device operating conditions and configuration
> +  information.
> +
> +  PECI subsystem provides single or multiple bus nodes support so each bus can
> +  have one adapter node and multiple device specific client nodes that can be
> +  attached to the PECI bus so each processor client's features can be supported
> +  by the client node through an adapter connection in the bus.
> +
> +properties:
> +  compatible:
> +    const: simple-bus

This is wrong. We already have a schema for this.

What's needed is a peci-bus schema that defines the bus node structure 
and then schemas for the specific controllers and child devices. See 
i2c-controller.yaml for an example.

> +
> +  "#address-cells":
> +    # Required to define bus device control resource address.
> +    const: 1
> +
> +  "#size-cells":
> +    # Required to define bus device control resource address.
> +    const: 1
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    peci: bus@1e78b000 {
> +        compatible = "simple-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x1e78b000 0x200>;
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
> +        };
> +
> +        // Just an example. ast2600 doesn't have a second PECI module actually.
> +        peci1: peci-bus@100 {
> +            compatible = "aspeed,ast2600-peci";
> +            reg = <0x100 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
> +            resets = <&syscon ASPEED_RESET_PECI>;
> +            clock-frequency = <24000000>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/peci/peci-client.yaml b/Documentation/devicetree/bindings/peci/peci-client.yaml
> new file mode 100644
> index 000000000000..fc7c4110e929
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-client.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-client.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Device Tree Bindings for PECI clients
> +
> +maintainers:
> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - intel,peci-client
> +
> +  reg:
> +    description: |
> +      Address of a client CPU. According to the PECI specification, client
> +      addresses start from 0x30.

0x30 being the min should be a constraint in the bus schema.

> +    maxItems: 1
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
> +
> +            peci-client@30 {
> +                compatible = "intel,peci-client";
> +                reg = <0x30>;
> +            };
> +
> +            peci-client@31 {
> +                compatible = "intel,peci-client";
> +                reg = <0x31>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
