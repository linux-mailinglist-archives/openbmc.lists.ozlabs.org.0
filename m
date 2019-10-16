Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B20E6D9BF3
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 22:51:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tkx46kCCzDqSm
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 07:51:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tkvN24KzzDr6X
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 07:50:08 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9GKlfQm132439; Wed, 16 Oct 2019 16:50:03 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vp95qjq43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 16:50:03 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9GKjEA1016040;
 Wed, 16 Oct 2019 20:50:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 2vk6f7fq7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 20:50:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9GKo1pc41287942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 20:50:01 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E1D212405C;
 Wed, 16 Oct 2019 20:50:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B006124053;
 Wed, 16 Oct 2019 20:50:01 +0000 (GMT)
Received: from [9.211.157.93] (unknown [9.211.157.93])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Oct 2019 20:50:01 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.3 1/3] ARM: dts: aspeed-g6: Add remaining UARTs
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191016115903.24663-1-joel@jms.id.au>
 <20191016115903.24663-2-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <11e40bee-543c-4dc5-781f-860b810b56a6@linux.ibm.com>
Date: Wed, 16 Oct 2019 15:50:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016115903.24663-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160172
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/16/19 6:59 AM, Joel Stanley wrote:
> The AST2600 has five UARTs. Add UART 1 to 4.


Tested-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/boot/dts/aspeed-g6.dtsi | 60 ++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 16dec4e08d8f..6db29ee769d5 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -28,6 +28,10 @@
>   		i2c13 = &i2c13;
>   		i2c14 = &i2c14;
>   		i2c15 = &i2c15;
> +		serial0 = &uart1;
> +		serial1 = &uart2;
> +		serial2 = &uart3;
> +		serial3 = &uart4;
>   		serial4 = &uart5;
>   		serial5 = &vuart1;
>   		serial6 = &vuart2;
> @@ -306,6 +310,20 @@
>   				status = "disabled";
>   			};
>   
> +			uart1: serial@1e783000 {
> +				compatible = "ns16550a";
> +				reg = <0x1e783000 0x20>;
> +				reg-shift = <2>;
> +				reg-io-width = <4>;
> +				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
> +				resets = <&lpc_reset 4>;
> +				no-loopback-test;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_txd1_default &pinctrl_rxd1_default>;
> +				status = "disabled";
> +			};
> +
>   			uart5: serial@1e784000 {
>   				compatible = "ns16550a";
>   				reg = <0x1e784000 0x1000>;
> @@ -497,6 +515,48 @@
>   				status = "disabled";
>   			};
>   
> +			uart2: serial@1e78d000 {
> +				compatible = "ns16550a";
> +				reg = <0x1e78d000 0x20>;
> +				reg-shift = <2>;
> +				reg-io-width = <4>;
> +				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_GATE_UART2CLK>;
> +				resets = <&lpc_reset 5>;
> +				no-loopback-test;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
> +				status = "disabled";
> +			};
> +
> +			uart3: serial@1e78e000 {
> +				compatible = "ns16550a";
> +				reg = <0x1e78e000 0x20>;
> +				reg-shift = <2>;
> +				reg-io-width = <4>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_GATE_UART3CLK>;
> +				resets = <&lpc_reset 6>;
> +				no-loopback-test;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
> +				status = "disabled";
> +			};
> +
> +			uart4: serial@1e78f000 {
> +				compatible = "ns16550a";
> +				reg = <0x1e78f000 0x20>;
> +				reg-shift = <2>;
> +				reg-io-width = <4>;
> +				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_GATE_UART4CLK>;
> +				resets = <&lpc_reset 7>;
> +				no-loopback-test;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_txd4_default &pinctrl_rxd4_default>;
> +				status = "disabled";
> +			};
> +
>   			i2c: bus@1e78a000 {
>   				compatible = "simple-bus";
>   				#address-cells = <1>;
