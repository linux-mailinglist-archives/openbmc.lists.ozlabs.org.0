Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8512E155
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 01:35:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p8GJ023RzDqB3
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 11:35:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dW5004DczDqk7
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 10:12:50 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 15:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="365887756"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 18 Dec 2019 15:12:47 -0800
Subject: Re: [PATCH v11 01/14] dt-bindings: Add PECI subsystem document
To: Rob Herring <robh@kernel.org>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-2-jae.hyun.yoo@linux.intel.com>
 <20191218025240.GA6601@bogus>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f6ff2cc5-a906-88ac-2b47-351a8a0770bf@linux.intel.com>
Date: Wed, 18 Dec 2019 15:12:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218025240.GA6601@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Rob,

On 12/17/2019 6:52 PM, Rob Herring wrote:
> On Wed, Dec 11, 2019 at 11:46:11AM -0800, Jae Hyun Yoo wrote:
>> This commit adds PECI subsystem document.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> Changes since v10:
>> - Changed documents format to DT schema format so I dropped all review tags.
>>    Please review it again.
>>
>>   .../devicetree/bindings/peci/peci-bus.yaml    | 129 ++++++++++++++++++
>>   .../devicetree/bindings/peci/peci-client.yaml |  54 ++++++++
>>   2 files changed, 183 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.yaml
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-client.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/peci/peci-bus.yaml b/Documentation/devicetree/bindings/peci/peci-bus.yaml
>> new file mode 100644
>> index 000000000000..b085e67089cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-bus.yaml
>> @@ -0,0 +1,129 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)

I see. I'll replace that with it for all new bindings in this patch set.

>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/peci/peci-bus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Device Tree Bindings for PECI bus
>> +
>> +maintainers:
>> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +description: |
>> +  PECI (Platform Environment Control Interface) is a one-wire bus interface that
>> +  provides a communication channel from Intel processors and chipset components
>> +  to external monitoring or control devices. PECI is designed to support the
>> +  following sideband functions:
>> +
>> +  * Processor and DRAM thermal management
>> +    - Processor fan speed control is managed by comparing Digital Thermal
>> +      Sensor (DTS) thermal readings acquired via PECI against the
>> +      processor-specific fan speed control reference point, or TCONTROL. Both
>> +      TCONTROL and DTS thermal readings are accessible via the processor PECI
>> +      client. These variables are referenced to a common temperature, the TCC
>> +      activation point, and are both defined as negative offsets from that
>> +      reference.
>> +    - PECI based access to the processor package configuration space provides
>> +      a means for Baseboard Management Controllers (BMC) or other platform
>> +      management devices to actively manage the processor and memory power
>> +      and thermal features.
>> +
>> +  * Platform Manageability
>> +    - Platform manageability functions including thermal, power, and error
>> +      monitoring. Note that platform 'power' management includes monitoring
>> +      and control for both the processor and DRAM subsystem to assist with
>> +      data center power limiting.
>> +    - PECI allows read access to certain error registers in the processor MSR
>> +      space and status monitoring registers in the PCI configuration space
>> +      within the processor and downstream devices.
>> +    - PECI permits writes to certain registers in the processor PCI
>> +      configuration space.
>> +
>> +  * Processor Interface Tuning and Diagnostics
>> +    - Processor interface tuning and diagnostics capabilities
>> +      (Intel Interconnect BIST). The processors Intel Interconnect Built In
>> +      Self Test (Intel IBIST) allows for infield diagnostic capabilities in
>> +      the Intel UPI and memory controller interfaces. PECI provides a port to
>> +      execute these diagnostics via its PCI Configuration read and write
>> +      capabilities.
>> +
>> +  * Failure Analysis
>> +    - Output the state of the processor after a failure for analysis via
>> +      Crashdump.
>> +
>> +  PECI uses a single wire for self-clocking and data transfer. The bus
>> +  requires no additional control lines. The physical layer is a self-clocked
>> +  one-wire bus that begins each bit with a driven, rising edge from an idle
>> +  level near zero volts. The duration of the signal driven high depends on
>> +  whether the bit value is a logic '0' or logic '1'. PECI also includes
>> +  variable data transfer rate established with every message. In this way, it
>> +  is highly flexible even though underlying logic is simple.
>> +
>> +  The interface design was optimized for interfacing between an Intel
>> +  processor and chipset components in both single processor and multiple
>> +  processor environments. The single wire interface provides low board
>> +  routing overhead for the multiple load connections in the congested routing
>> +  area near the processor and chipset components. Bus speed, error checking,
>> +  and low protocol overhead provides adequate link bandwidth and reliability
>> +  to transfer critical device operating conditions and configuration
>> +  information.
>> +
>> +  PECI subsystem provides single or multiple bus nodes support so each bus can
>> +  have one adapter node and multiple device specific client nodes that can be
>> +  attached to the PECI bus so each processor client's features can be supported
>> +  by the client node through an adapter connection in the bus.
>> +
>> +properties:
>> +  compatible:
>> +    const: simple-bus
> 
> This is wrong. We already have a schema for this.
> 
> What's needed is a peci-bus schema that defines the bus node structure
> and then schemas for the specific controllers and child devices. See
> i2c-controller.yaml for an example.

Oh, I see. I'll fix and submit it as '/schema/peci-bus.yaml' into
dt-schema tree.

>> +
>> +  "#address-cells":
>> +    # Required to define bus device control resource address.
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    # Required to define bus device control resource address.
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +required:
>> +  - compatible
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +    peci: bus@1e78b000 {
>> +        compatible = "simple-bus";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0x1e78b000 0x200>;
>> +
>> +        peci0: peci-bus@0 {
>> +            compatible = "aspeed,ast2600-peci";
>> +            reg = <0x0 0x100>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>> +            resets = <&syscon ASPEED_RESET_PECI>;
>> +            clock-frequency = <24000000>;
>> +        };
>> +
>> +        // Just an example. ast2600 doesn't have a second PECI module actually.
>> +        peci1: peci-bus@100 {
>> +            compatible = "aspeed,ast2600-peci";
>> +            reg = <0x100 0x100>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>> +            resets = <&syscon ASPEED_RESET_PECI>;
>> +            clock-frequency = <24000000>;
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/peci/peci-client.yaml b/Documentation/devicetree/bindings/peci/peci-client.yaml
>> new file mode 100644
>> index 000000000000..fc7c4110e929
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-client.yaml
>> @@ -0,0 +1,54 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/peci/peci-client.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Device Tree Bindings for PECI clients
>> +
>> +maintainers:
>> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - intel,peci-client
>> +
>> +  reg:
>> +    description: |
>> +      Address of a client CPU. According to the PECI specification, client
>> +      addresses start from 0x30.
> 
> 0x30 being the min should be a constraint in the bus schema.

Right. Will add that.

Thanks a lot for your review!

-Jae

>> +    maxItems: 1
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +    peci: bus@1e78b000 {
>> +        compatible = "simple-bus";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0x1e78b000 0x60>;
>> +
>> +        peci0: peci-bus@0 {
>> +            compatible = "aspeed,ast2600-peci";
>> +            reg = <0x0 0x100>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>> +            resets = <&syscon ASPEED_RESET_PECI>;
>> +            clock-frequency = <24000000>;
>> +
>> +            peci-client@30 {
>> +                compatible = "intel,peci-client";
>> +                reg = <0x30>;
>> +            };
>> +
>> +            peci-client@31 {
>> +                compatible = "intel,peci-client";
>> +                reg = <0x31>;
>> +            };
>> +        };
>> +    };
>> +...
>> -- 
>> 2.17.1
>>
> 
