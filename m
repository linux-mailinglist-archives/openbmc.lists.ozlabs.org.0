Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D46B66B5
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 17:06:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YNc10Fk2zF3w5
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 01:06:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YNKs5vCXzF3WN
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 00:54:25 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8IEqbIq097990; Wed, 18 Sep 2019 10:54:18 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v3m2eee8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 10:53:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8IEoSTx025333;
 Wed, 18 Sep 2019 14:53:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2v37jvqkym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 14:53:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8IErbwg55443798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 14:53:37 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7ABFBE056;
 Wed, 18 Sep 2019 14:53:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02C99BE04F;
 Wed, 18 Sep 2019 14:53:36 +0000 (GMT)
Received: from [9.80.232.134] (unknown [9.80.232.134])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Sep 2019 14:53:36 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.2 v2 3/4] ARM: dts: Aspeed: ast2600: Add I2C
 busses
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
References: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
 <1568391353-32584-4-git-send-email-eajames@linux.ibm.com>
 <9f747c91-0988-2eb1-7387-6bb5edff8611@kaod.org>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <7079ed45-7bfe-f580-2829-5d984c520608@linux.ibm.com>
Date: Wed, 18 Sep 2019 09:53:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9f747c91-0988-2eb1-7387-6bb5edff8611@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180147
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/18/19 5:18 AM, Cédric Le Goater wrote:
> On 13/09/2019 18:15, Eddie James wrote:
>> Add all the I2C busses to the AST2600 dtsi and set their required
>> properties.
>>
> The DT defines an interrupt per I2C bus but this is not how the I2C
> driver operates. It still uses the old mode from the Aspeed AST2500.


Oh? The I2C interrupt controller driver is a separate driver, which I 
didn't include a node for in the AST2600 dts. As far as I can tell the 
I2C bus driver just asks for it's interrupt and uses it, so by setting 
each bus to it's GIC interrupt line (instead of the line from the I2C 
interrupt controller like in the AST2500), the I2C driver receives the 
correct interrupt.

Thanks,

Eddie


>
> C.
>
>   
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-g6.dtsi | 272 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 272 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
>> index f3edcff..916503a 100644
>> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
>> @@ -12,6 +12,22 @@
>>   	interrupt-parent = <&gic>;
>>   
>>   	aliases {
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c3 = &i2c3;
>> +		i2c4 = &i2c4;
>> +		i2c5 = &i2c5;
>> +		i2c6 = &i2c6;
>> +		i2c7 = &i2c7;
>> +		i2c8 = &i2c8;
>> +		i2c9 = &i2c9;
>> +		i2c10 = &i2c10;
>> +		i2c11 = &i2c11;
>> +		i2c12 = &i2c12;
>> +		i2c13 = &i2c13;
>> +		i2c14 = &i2c14;
>> +		i2c15 = &i2c15;
>>   		serial4 = &uart5;
>>   	};
>>   
>> @@ -281,6 +297,262 @@
>>   				};
>>   			};
>>   
>> +			i2c0: i2c-bus@1e78a080 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a080 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c1_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c1: i2c-bus@1e78a100 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a100 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c2_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c2: i2c-bus@1e78a180 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a180 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c3_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c3: i2c-bus@1e78a200 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a200 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c4_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c4: i2c-bus@1e78a280 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a280 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c5_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c5: i2c-bus@1e78a300 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a300 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c6_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c6: i2c-bus@1e78a380 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a380 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c7_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c7: i2c-bus@1e78a400 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a400 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c8_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c8: i2c-bus@1e78a480 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a480 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c9_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c9: i2c-bus@1e78a500 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a500 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c10_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c10: i2c-bus@1e78a580 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a580 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c11_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c11: i2c-bus@1e78a600 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a600 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c12_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c12: i2c-bus@1e78a680 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a680 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c13_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c13: i2c-bus@1e78a700 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a700 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c14_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c14: i2c-bus@1e78a780 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a780 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c15_default>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c15: i2c-bus@1e78a800 {
>> +				#address-cells = <1>;
>> +				#size-cells = <1>;
>> +				#interrupt-cells = <1>;
>> +
>> +				reg = <0x1e78a800 0x80>;
>> +				compatible = "aspeed,ast2600-i2c-bus";
>> +				clocks = <&syscon ASPEED_CLK_APB1>;
>> +				resets = <&syscon ASPEED_RESET_I2C>;
>> +				bus-frequency = <100000>;
>> +				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_i2c16_default>;
>> +				status = "disabled";
>> +			};
>> +
>>   			fsim0: fsi@1e79b000 {
>>   				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
>>   				reg = <0x1e79b000 0x94>;
>>
