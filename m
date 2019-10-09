Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113BD1037
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 15:34:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pFYd4R7mzDqPc
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 00:34:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pFX96c6kzDqKf
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 00:32:54 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x99DNEtJ114387
 for <openbmc@lists.ozlabs.org>; Wed, 9 Oct 2019 09:32:50 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vhgcgrar2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Oct 2019 09:32:49 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Wed, 9 Oct 2019 14:32:47 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 9 Oct 2019 14:32:42 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x99DWf0v29425698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2019 13:32:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 458B1AE05F;
 Wed,  9 Oct 2019 13:32:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24AACAE04D;
 Wed,  9 Oct 2019 13:32:41 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Oct 2019 13:32:41 +0000 (GMT)
Received: from yukon.kaod.org (yukon.tls.ibm.com [9.101.4.25])
 by smtp.tls.ibm.com (Postfix) with ESMTP id B3E35220121;
 Wed,  9 Oct 2019 15:32:40 +0200 (CEST)
Subject: Re: [PATCH 2/5] ARM: dts: aspeed: add I2C buffer mode support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-3-jae.hyun.yoo@linux.intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Wed, 9 Oct 2019 15:32:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191007231313.4700-3-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100913-0028-0000-0000-000003A87C75
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100913-0029-0000-0000-0000246A8138
Message-Id: <6f015065-3a45-878d-86b2-0edf10f1f4cb@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910090127
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 08/10/2019 01:13, Jae Hyun Yoo wrote:
> Byte mode currently this driver uses makes lots of interrupt call
> which isn't good for performance and it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> adds buffer mode transfer support which uses I2C SRAM buffer
> instead of using a single byte buffer.
> 
> AST2400:
> It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
> 0x1e78a800 to 0x1e78afff that can be used for all busses with
> buffer pool manipulation. To simplify implementation for supporting
> both AST2400 and AST2500, it assigns each 128 Bytes per bus without
> using buffer pool manipulation so total 1792 Bytes of I2C SRAM
> buffer will be used.
> 
> AST2500:
> It has 16 Bytes of individual I2C SRAM buffer per each bus and its
> range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
> page selection' bit field in the Function control register, and
> neither 'base address pointer' bit field in the Pool buffer control
> register it has. To simplify implementation for supporting both
> AST2400 and AST2500, it writes zeros on those register bit fields
> but it's okay because it does nothing in AST2500.
> 
> This commit fixes all I2C bus nodes to support buffer mode
> transfer.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 47 +++++++++++++++++++-------------
>  arch/arm/boot/dts/aspeed-g5.dtsi | 47 +++++++++++++++++++-------------
>  2 files changed, 56 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index dffb595d30e4..f51b016aa769 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -420,12 +420,21 @@
>  };
>  
>  &i2c {
> -	i2c_ic: interrupt-controller@0 {
> -		#interrupt-cells = <1>;
> -		compatible = "aspeed,ast2400-i2c-ic";
> +	i2c_gr: i2c-global-regs@0 {
> +		compatible = "aspeed,ast2400-i2c-gr", "syscon";
>  		reg = <0x0 0x40>;
> -		interrupts = <12>;
> -		interrupt-controller;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x40>;
> +
> +		i2c_ic: interrupt-controller@0 {
> +			#interrupt-cells = <1>;
> +			compatible = "aspeed,ast2400-i2c-ic";
> +			reg = <0x0 0x4>;
> +			interrupts = <12>;
> +			interrupt-controller;
> +		};
>  	};
>  
>  	i2c0: i2c-bus@40 {
> @@ -433,7 +442,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x40 0x40>;
> +		reg = <0x40 0x40>, <0x800 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -449,7 +458,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x80 0x40>;
> +		reg = <0x80 0x40>, <0x880 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -465,7 +474,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0xc0 0x40>;
> +		reg = <0xc0 0x40>, <0x900 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -482,7 +491,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x100 0x40>;
> +		reg = <0x100 0x40>, <0x980 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -499,7 +508,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x140 0x40>;
> +		reg = <0x140 0x40>, <0xa00 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -516,7 +525,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x180 0x40>;
> +		reg = <0x180 0x40>, <0xa80 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -533,7 +542,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x1c0 0x40>;
> +		reg = <0x1c0 0x40>, <0xb00 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -550,7 +559,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x300 0x40>;
> +		reg = <0x300 0x40>, <0xb80 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -567,7 +576,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x340 0x40>;
> +		reg = <0x340 0x40>, <0xc00 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -584,7 +593,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x380 0x40>;
> +		reg = <0x380 0x40>, <0xc80 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -601,7 +610,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x3c0 0x40>;
> +		reg = <0x3c0 0x40>, <0xd00 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -618,7 +627,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x400 0x40>;
> +		reg = <0x400 0x40>, <0xd80 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -635,7 +644,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x440 0x40>;
> +		reg = <0x440 0x40>, <0xe00 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -652,7 +661,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x480 0x40>;
> +		reg = <0x480 0x40>, <0xe80 0x80>;
>  		compatible = "aspeed,ast2400-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index e8feb8b66a2f..cbc31ce3fab2 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -513,12 +513,21 @@
>  };
>  
>  &i2c {
> -	i2c_ic: interrupt-controller@0 {
> -		#interrupt-cells = <1>;
> -		compatible = "aspeed,ast2500-i2c-ic";
> +	i2c_gr: i2c-global-regs@0 {
> +		compatible = "aspeed,ast2500-i2c-gr", "syscon";
>  		reg = <0x0 0x40>;
> -		interrupts = <12>;
> -		interrupt-controller;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x40>;
> +
> +		i2c_ic: interrupt-controller@0 {
> +			#interrupt-cells = <1>;
> +			compatible = "aspeed,ast2500-i2c-ic";
> +			reg = <0x0 0x4>;
> +			interrupts = <12>;
> +			interrupt-controller;
> +		};
>  	};
>  
>  	i2c0: i2c-bus@40 {
> @@ -526,7 +535,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x40 0x40>;
> +		reg = <0x40 0x40>, <0x200 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -542,7 +551,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x80 0x40>;
> +		reg = <0x80 0x40>, <0x210 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -558,7 +567,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0xc0 0x40>;
> +		reg = <0xc0 0x40>, <0x220 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -575,7 +584,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x100 0x40>;
> +		reg = <0x100 0x40>, <0x230 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -592,7 +601,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x140 0x40>;
> +		reg = <0x140 0x40>, <0x240 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -609,7 +618,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x180 0x40>;
> +		reg = <0x180 0x40>, <0x250 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -626,7 +635,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x1c0 0x40>;
> +		reg = <0x1c0 0x40>, <0x260 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -643,7 +652,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x300 0x40>;
> +		reg = <0x300 0x40>, <0x270 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -660,7 +669,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x340 0x40>;
> +		reg = <0x340 0x40>, <0x280 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -677,7 +686,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x380 0x40>;
> +		reg = <0x380 0x40>, <0x290 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -694,7 +703,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x3c0 0x40>;
> +		reg = <0x3c0 0x40>, <0x2a0 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -711,7 +720,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x400 0x40>;
> +		reg = <0x400 0x40>, <0x2b0 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -728,7 +737,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x440 0x40>;
> +		reg = <0x440 0x40>, <0x2c0 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> @@ -745,7 +754,7 @@
>  		#size-cells = <0>;
>  		#interrupt-cells = <1>;
>  
> -		reg = <0x480 0x40>;
> +		reg = <0x480 0x40>, <0x2d0 0x10>;
>  		compatible = "aspeed,ast2500-i2c-bus";
>  		clocks = <&syscon ASPEED_CLK_APB>;
>  		resets = <&syscon ASPEED_RESET_I2C>;
> 

