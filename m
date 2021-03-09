Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85C332CC0
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 18:03:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw1k43DQ5z3cVv
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:03:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw1jr3R5yz3cJq;
 Wed, 10 Mar 2021 04:02:55 +1100 (AEDT)
IronPort-SDR: n1l8jhDMsWipsHyCU6H506SKOtzqIi3GEcbPRKdj3vM+VT7oOmi1jaLd8xeJzBZw2Gmmz+1Vit
 zc4NIoKtc9Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273313070"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="273313070"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 09:02:52 -0800
IronPort-SDR: oWcoa8Y/WiZv6p/AyfcMdgE44YAoMStz78ikxsMY68hnO1KLYe+pgGwYLsDYsxnrmh1/KyMsrd
 7uJEw9YVuVng==
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="409814455"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.251.3.100])
 ([10.251.3.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 09:02:51 -0800
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
To: Rob Herring <robh@kernel.org>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
 <20210306203011.GA1152769@robh.at.kernel.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
Date: Tue, 9 Mar 2021 09:02:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210306203011.GA1152769@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-i2c@vger.kernel.org,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 3/6/2021 12:30 PM, Rob Herring wrote:
> On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
>> Append bindings to support transfer mode.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>> ---
>> Changes since v3:
>> - None
>>
>> Changes since v2:
>> - Moved SRAM resources back to default dtsi and added mode selection
>>    property.
>>
>> Changes since v1:
>> - Removed buffer reg settings from default device tree and added the settings
>>    into here to show the predefined buffer range per each bus.
>>
>>   .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
>>   1 file changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> index b47f6ccb196a..242343177324 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> @@ -17,6 +17,20 @@ Optional Properties:
>>   - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>>   		  specified
>>   - multi-master	: states that there is another master active on this bus.
>> +- aspeed,i2c-xfer-mode	: should be "byte", "buf" or "dma" to select transfer
>> +			  mode defaults to "byte" mode when not specified.
>> +
>> +			  I2C DMA mode on AST2500 has these restrictions:
>> +			    - If one of these controllers is enabled
>> +				* UHCI host controller
>> +				* MCTP controller
>> +			      I2C has to use buffer mode or byte mode instead
>> +			      since these controllers run only in DMA mode and
>> +			      I2C is sharing the same DMA H/W with them.
>> +			    - If one of these controllers uses DMA mode, I2C
>> +			      can't use DMA mode
>> +				* SD/eMMC
>> +				* Port80 snoop
> 
> How does one decide between byte or buf mode?

If a given system makes just one byte r/w transactions most of the time
then byte mode will be a right setting. Otherwise, buf mode is more
efficient because it doesn't generate a bunch of interrupts on every
byte handling.

>>   
>>   Example:
>>   
>> @@ -26,20 +40,29 @@ i2c {
>>   	#size-cells = <1>;
>>   	ranges = <0 0x1e78a000 0x1000>;
>>   
>> -	i2c_ic: interrupt-controller@0 {
>> -		#interrupt-cells = <1>;
>> -		compatible = "aspeed,ast2400-i2c-ic";
>> +	i2c_gr: i2c-global-regs@0 {
>> +		compatible = "aspeed,ast2500-i2c-gr", "syscon";
>>   		reg = <0x0 0x40>;
>> -		interrupts = <12>;
>> -		interrupt-controller;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x0 0x40>;
>> +
>> +		i2c_ic: interrupt-controller@0 {
>> +			#interrupt-cells = <1>;
>> +			compatible = "aspeed,ast2500-i2c-ic";
>> +			reg = <0x0 0x4>;
>> +			interrupts = <12>;
>> +			interrupt-controller;
>> +		};
>>   	};
>>   
>>   	i2c0: i2c-bus@40 {
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   		#interrupt-cells = <1>;
>> -		reg = <0x40 0x40>;
>> -		compatible = "aspeed,ast2400-i2c-bus";
>> +		reg = <0x40 0x40>, <0x200 0x10>;
>> +		compatible = "aspeed,ast2500-i2c-bus";
> 
> The example changes are all unrelated to adding the new property. Should
> be a separate patch or just dropped.

The example changes are not directly related to the new property but
related to the transfer mode support in this patch set. 'i2c_gr' node is
added to provide a way for accessing I2C global registers to enable
I2C SRAM, and 'reg' is modified to add the SRAM resource range.

Thanks,
Jae

>>   		clocks = <&syscon ASPEED_CLK_APB>;
>>   		resets = <&syscon ASPEED_RESET_I2C>;
>>   		bus-frequency = <100000>;
>> -- 
>> 2.17.1
>>
