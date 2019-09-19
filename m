Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D744B7F1A
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 18:30:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z2Ql0HXGzF54m
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 02:30:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z2Pd4kHJzF4Zn
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 02:29:57 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JGHTKV032146; Thu, 19 Sep 2019 12:29:52 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3vdfdp33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 12:29:51 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8JGGTT5030580;
 Thu, 19 Sep 2019 16:29:48 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 2v3vc5euwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 16:29:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JGTmMb38928728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 16:29:48 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 311F9B2066;
 Thu, 19 Sep 2019 16:29:48 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D89C2B205F;
 Thu, 19 Sep 2019 16:29:47 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 16:29:47 +0000 (GMT)
Subject: Re: [PATCH v2 linux dev-5.3 3/4] ARM: dts: aspeed-g6: Add lpc devices
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, joel@jms.id.au
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-9-bradleyb@fuzziesquirrel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <592b8ba3-64e6-1202-7af3-4276b3494254@linux.vnet.ibm.com>
Date: Thu, 19 Sep 2019 11:29:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919152340.23133-9-bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=989 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190146
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


On 9/19/19 10:23 AM, Brad Bishop wrote:
> Assume everything is the same as G5, except the interrupt is updated.


BTW I think you could have kept my reviewed-by tag for this one.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>   arch/arm/boot/dts/aspeed-g6.dtsi | 91 ++++++++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 72038c16f541..b4991cbe1f36 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -249,6 +249,97 @@
>   				status = "disabled";
>   			};
>   
> +			lpc: lpc@1e789000 {
> +				compatible = "aspeed,ast2600-lpc", "simple-mfd";
> +				reg = <0x1e789000 0x1000>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0x0 0x1e789000 0x1000>;
> +
> +				lpc_bmc: lpc-bmc@0 {
> +					compatible = "aspeed,ast2600-lpc-bmc", "simple-mfd", "syscon";
> +					reg = <0x0 0x80>;
> +					reg-io-width = <4>;
> +
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					ranges = <0x0 0x0 0x80>;
> +
> +					kcs1: kcs1@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <1>;
> +						status = "disabled";
> +					};
> +					kcs2: kcs2@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <2>;
> +						status = "disabled";
> +					};
> +					kcs3: kcs3@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <3>;
> +						status = "disabled";
> +					};
> +				};
> +
> +				lpc_host: lpc-host@80 {
> +					compatible = "aspeed,ast2600-lpc-host", "simple-mfd", "syscon";
> +					reg = <0x80 0x1e0>;
> +					reg-io-width = <4>;
> +
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					ranges = <0x0 0x80 0x1e0>;
> +
> +					kcs4: kcs4@0 {
> +						compatible = "aspeed,ast2600-kcs-bmc";
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						kcs_chan = <4>;
> +						status = "disabled";
> +					};
> +
> +					lpc_ctrl: lpc-ctrl@0 {
> +						compatible = "aspeed,ast2600-lpc-ctrl";
> +						reg = <0x0 0x80>;
> +						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +						status = "disabled";
> +					};
> +
> +					lpc_snoop: lpc-snoop@0 {
> +						compatible = "aspeed,ast2600-lpc-snoop";
> +						reg = <0x0 0x80>;
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						status = "disabled";
> +					};
> +
> +					lhc: lhc@20 {
> +						compatible = "aspeed,ast2600-lhc";
> +						reg = <0x20 0x24 0x48 0x8>;
> +					};
> +
> +					lpc_reset: reset-controller@18 {
> +						compatible = "aspeed,ast2600-lpc-reset";
> +						reg = <0x18 0x4>;
> +						#reset-cells = <1>;
> +					};
> +
> +					ibt: ibt@c0 {
> +						compatible = "aspeed,ast2600-ibt-bmc";
> +						reg = <0xc0 0x18>;
> +						interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +						status = "disabled";
> +					};
> +
> +					sio_regs: regs {
> +						compatible = "aspeed,bmc-misc";
> +					};
> +				};
> +			};
> +
>   			sdc: sdc@1e740000 {
>   				compatible = "aspeed,ast2600-sd-controller";
>   				reg = <0x1e740000 0x100>;
