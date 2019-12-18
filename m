Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A312E158
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 01:38:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p8Jq6V9KzDqCc
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 11:38:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dWSs6ZfRzDqlF
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 10:30:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 15:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="365890260"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga004.jf.intel.com with ESMTP; 18 Dec 2019 15:30:01 -0800
Subject: Re: [PATCH v11 07/14] dt-bindings: peci: add NPCM PECI documentation
To: Rob Herring <robh@kernel.org>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-8-jae.hyun.yoo@linux.intel.com>
 <20191218144206.GA26118@bogus>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <a86e253a-5ef6-f448-0c0b-15be0467a9ef@linux.intel.com>
Date: Wed, 18 Dec 2019 15:30:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218144206.GA26118@bogus>
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

On 12/18/2019 6:42 AM, Rob Herring wrote:
> On Wed, Dec 11, 2019 at 11:46:17AM -0800, Jae Hyun Yoo wrote:
>> From: Tomer Maimon <tmaimon77@gmail.com>
>>
>> Added device tree binding documentation for Nuvoton BMC
>> NPCM Platform Environment Control Interface(PECI).
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> Changes since v10:
>> - Newly added in v11.
>>
>>   .../devicetree/bindings/peci/peci-npcm.yaml   | 102 ++++++++++++++++++
>>   1 file changed, 102 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/peci/peci-npcm.yaml b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
>> new file mode 100644
>> index 000000000000..bcd5626e68e7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-npcm.yaml
>> @@ -0,0 +1,102 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/peci/peci-npcm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton NPCM PECI Bus Device Tree Bindings
>> +
>> +maintainers:
>> +  - Tomer Maimon <tmaimon77@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,npcm750-peci # for the NPCM7XX BMC.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    # Required to define a client address.
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    # Required to define a client address.
>> +    const: 0
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    # PECI reference clock.
>> +    maxItems: 1
>> +
>> +  cmd-timeout-ms:
>> +    # Command timeout in units of ms.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> You can drop this as standard units already have a type.

I'm assuming you pointed the timeout-ms as one of standard
units, right? I'll drop this ref.

>> +      - minimum: 1
>> +        maximum: 60000
>> +        default: 1000
>> +
>> +  pull-down:
>> +    description: |
>> +      Defines the PECI I/O internal pull down operation.
>> +        0: pull down always enable
>> +        1: pull down only during transactions.
>> +        2: pull down always disable.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - minimum: 0
>> +        maximum: 2
>> +        default: 0
>> +
>> +  host-neg-bit-rate:
>> +    description: |
>> +      Define host negotiation bit rate divider.
>> +      the host negotiation bit rate calculate with formula:
>> +      clock frequency[Hz] / [4 x {host-neg-bit-rate + 1}]
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - minimum: 7
>> +        maximum: 31
>> +        default: 15
>> +
>> +  high-volt-range:
>> +    description: |
>> +      Adapts PECI I/O interface to voltage range.
>> +        0: PECI I/O interface voltage range of 0.8-1.06V (default)
>> +        1: PECI I/O interface voltage range of 0.95-1.26V
>> +    type: boolean
> 
> These last 4 properties are vendor specific or PECI common. For the
> former, needs a vendor prefix. For the latter, needs to be moved to
> common location.

These are Nuvoton vendor specifics. I'll add prefix for them and will
check Aspeed bindings too.

Thanks a lot for your review!

-Jae

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - interrupts
>> +  - clocks
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
>> +    peci: bus@100000 {
>> +        compatible = "simple-bus";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0x100000 0x200>;
>> +
>> +        peci0: peci-bus@0 {
>> +            compatible = "nuvoton,npcm750-peci";
>> +            reg = <0x0 0x200>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk NPCM7XX_CLK_APB3>;
>> +            cmd-timeout-ms = <1000>;
>> +            pull-down = <0>;
>> +            host-neg-bit-rate = <15>;
>> +        };
>> +    };
>> +...
>> -- 
>> 2.17.1
>>
> 
