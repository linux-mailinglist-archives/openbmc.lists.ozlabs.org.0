Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3822FB3B
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 23:22:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFt6f5ng0zF1fN
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 07:22:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFt4h03g7zF1fk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 07:20:19 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RL3JEY168934; Mon, 27 Jul 2020 17:20:17 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32j2papx6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 17:20:16 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RL9Jcf013409;
 Mon, 27 Jul 2020 21:20:15 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 32gcy5c90u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 21:20:15 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RLKC2W52560278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 21:20:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2DCBBE051;
 Mon, 27 Jul 2020 21:20:14 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A543DBE053;
 Mon, 27 Jul 2020 21:20:14 +0000 (GMT)
Received: from [9.163.49.148] (unknown [9.163.49.148])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 21:20:14 +0000 (GMT)
Subject: Re: [PATCH 2/2] rainier: Add LEDs that are controlled by ASPEED
To: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
 devicetree@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
References: <FCA5474B-8A73-4D2B-9EF7-8B2E49DDFDD2@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <898571b3-ceb7-98b6-b280-3fa3a653e32a@linux.ibm.com>
Date: Mon, 27 Jul 2020 16:20:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <FCA5474B-8A73-4D2B-9EF7-8B2E49DDFDD2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_14:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270138
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 7/27/20 7:40 AM, vishwanatha subbanna wrote:
> These are the LEDs that have direct GPIO connection from ASPEED


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++++++--
> 1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index ecbce50..dc68c49 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -72,6 +72,26 @@
> 	leds {
> 		compatible = "gpio-leds";
>
> +		/* BMC Card fault LED at the back */
> +		bmc-ingraham0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* Enclosure ID LED at the back */
> +		rear-enc-id0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* Enclosure fault LED at the back */
> +		rear-enc-fault0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* PCIE slot power LED */
> +		pcieslot-power {
> +			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> +		};
> +
> 		/* System ID LED that is at front on Op Panel */
> 		front-sys-id0 {
> 			retain-state-shutdown;
> @@ -112,7 +132,7 @@
> 	/*E0-E7*/	"","","","","","","","",
> 	/*F0-F7*/	"","","","","","","","",
> 	/*G0-G7*/	"","","","","","","","",
> -	/*H0-H7*/	"","","","","","","","",
> +	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
> 	/*I0-I7*/	"","","","","","","","",
> 	/*J0-J7*/	"","","","","","","","",
> 	/*K0-K7*/	"","","","","","","","",
> @@ -120,7 +140,7 @@
> 	/*M0-M7*/	"","","","","","","","",
> 	/*N0-N7*/	"","","","","","","","",
> 	/*O0-O7*/	"","","","","","","","",
> -	/*P0-P7*/	"","","","","","","","",
> +	/*P0-P7*/	"","","","","pcieslot-power","","","",
> 	/*Q0-Q7*/	"cfam-reset","","","","","","","",
> 	/*R0-R7*/	"","","","","","","","",
> 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
