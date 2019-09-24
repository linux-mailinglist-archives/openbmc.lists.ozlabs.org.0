Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B8BD347
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 22:05:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dByS4YWJzDqVd
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 06:05:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBdS3MKCzDqYj
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:51:08 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 85CDC1325D;
 Tue, 24 Sep 2019 15:51:05 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2 linux dev-5.3 3/4] ARM: dts: aspeed-g6: Add lpc devices
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <9196f950-59ea-4e7f-82f7-29769e0a2c81@www.fastmail.com>
Date: Tue, 24 Sep 2019 15:51:05 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <9540FAF9-C027-4455-80C2-D48113D3BFF8@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-4-bradleyb@fuzziesquirrel.com>
 <9196f950-59ea-4e7f-82f7-29769e0a2c81@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Fri, 20 Sep 2019, at 00:53, Brad Bishop wrote:
>> Assume everything is the same as G5, except the interrupt is updated.
>>
>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> ---
>>  arch/arm/boot/dts/aspeed-g6.dtsi | 91 ++++++++++++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi  
>> b/arch/arm/boot/dts/aspeed-g6.dtsi
>> index 72038c16f541..b4991cbe1f36 100644
>> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
>> @@ -249,6 +249,97 @@
>>  				status = "disabled";
>>  			};
>>
>> +			lpc: lpc@1e789000 {
>> +				compatible = "aspeed,ast2600-lpc", "simple-mfd";
>> +				reg = <0x1e789000 0x1000>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				ranges = <0x0 0x1e789000 0x1000>;
>> +
>> +				lpc_bmc: lpc-bmc@0 {
>> +					compatible = "aspeed,ast2600-lpc-bmc", "simple-mfd", "syscon";
>> +					reg = <0x0 0x80>;
>> +					reg-io-width = <4>;
>> +
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					ranges = <0x0 0x0 0x80>;
>> +
>> +					kcs1: kcs1@0 {
>> +						compatible = "aspeed,ast2600-kcs-bmc";
>> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>> +						kcs_chan = <1>;
>> +						status = "disabled";
>> +					};
>> +					kcs2: kcs2@0 {
>> +						compatible = "aspeed,ast2600-kcs-bmc";
>> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>> +						kcs_chan = <2>;
>> +						status = "disabled";
>> +					};
>> +					kcs3: kcs3@0 {
>> +						compatible = "aspeed,ast2600-kcs-bmc";
>> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>> +						kcs_chan = <3>;
>> +						status = "disabled";
>> +					};
>> +				};
>> +
>> +				lpc_host: lpc-host@80 {
>> +					compatible = "aspeed,ast2600-lpc-host", "simple-mfd", "syscon";
>> +					reg = <0x80 0x1e0>;
>> +					reg-io-width = <4>;
>> +
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					ranges = <0x0 0x80 0x1e0>;
>> +
>> +					kcs4: kcs4@0 {
>> +						compatible = "aspeed,ast2600-kcs-bmc";
>> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>> +						kcs_chan = <4>;
>> +						status = "disabled";
>> +					};
>
> I've got some patches floating around that I need to respin that adjust  
> the kcs binding.
> The new dtsi with the existing binding means we're going to increase the  
> amplification
> of dtc warnings :(
>
>> +
>> +					lpc_ctrl: lpc-ctrl@0 {
>> +						compatible = "aspeed,ast2600-lpc-ctrl";
>> +						reg = <0x0 0x80>;
>> +						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
>> +						status = "disabled";
>> +					};
>> +
>> +					lpc_snoop: lpc-snoop@0 {
>> +						compatible = "aspeed,ast2600-lpc-snoop";
>> +						reg = <0x0 0x80>;
>> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>> +						status = "disabled";
>> +					};
>> +
>> +					lhc: lhc@20 {
>> +						compatible = "aspeed,ast2600-lhc";
>> +						reg = <0x20 0x24 0x48 0x8>;
>> +					};
>> +
>> +					lpc_reset: reset-controller@18 {
>> +						compatible = "aspeed,ast2600-lpc-reset";
>> +						reg = <0x18 0x4>;
>> +						#reset-cells = <1>;
>> +					};
>> +
>> +					ibt: ibt@c0 {
>> +						compatible = "aspeed,ast2600-ibt-bmc";
>> +						reg = <0xc0 0x18>;
>> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>> +						status = "disabled";
>> +					};
>> +
>> +					sio_regs: regs {
>> +						compatible = "aspeed,bmc-misc";
>> +					};
>
> Can you please split the sio_regs one out to a separate patch?

Split in v3.

> The necessary patches got nak'ed upstream a while back and I haven't  
> circled back around
> to implement something more palatable. Put the patch adding it at the top  
> of
> your series, then you can send the earlier ones upstream.
>
> Andrew

