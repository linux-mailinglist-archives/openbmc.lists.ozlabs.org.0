Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB0C952A
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 01:46:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kCTL3nh3zDqWd
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 09:46:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kCPm1yQPzDqMy
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 09:43:23 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x92NfxcN028663; Wed, 2 Oct 2019 19:43:12 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vd4tt9akc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 19:43:12 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x92Ne3m3010332;
 Wed, 2 Oct 2019 23:43:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2v9y587p6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 23:43:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x92NhBqu62390572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 23:43:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14E09BE051;
 Wed,  2 Oct 2019 23:43:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C809DBE04F;
 Wed,  2 Oct 2019 23:43:10 +0000 (GMT)
Received: from [9.211.121.154] (unknown [9.211.121.154])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 23:43:10 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.3 1/4] ARM: dts: aspeed-g6: Add VUART
 descriptions
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191002102328.5196-1-joel@jms.id.au>
 <20191002102328.5196-2-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <c723c7cc-cbf0-ab63-75f1-7a7a7bf12d11@linux.ibm.com>
Date: Wed, 2 Oct 2019 18:43:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002102328.5196-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020193
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/2/19 5:23 AM, Joel Stanley wrote:
> The AST2600 has two VUART devices.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/boot/dts/aspeed-g6.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 5bea04b67b5c..2ad90a906266 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -29,6 +29,8 @@
>   		i2c14 = &i2c14;
>   		i2c15 = &i2c15;
>   		serial4 = &uart5;
> +		serial5 = &vuart1;
> +		serial6 = &vuart2;
>   	};
>   
>   
> @@ -475,6 +477,26 @@
>   				};
>   			};
>   
> +			vuart1: serial@1e787000 {
> +				compatible = "aspeed,ast2500-vuart";
> +				reg = <0x1e787000 0x40>;
> +				reg-shift = <2>;
> +				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				no-loopback-test;
> +				status = "disabled";
> +			};
> +
> +			vuart2: serial@1e788000 {
> +				compatible = "aspeed,ast2500-vuart";
> +				reg = <0x1e788000 0x40>;
> +				reg-shift = <2>;
> +				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&syscon ASPEED_CLK_APB1>;
> +				no-loopback-test;
> +				status = "disabled";
> +			};
> +
>   			i2c: bus@1e78a000 {
>   				compatible = "simple-bus";
>   				#address-cells = <1>;
