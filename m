Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972A173B2D
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 16:17:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TY6g6mW3zDrNR
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 02:16:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TY5k4BFmzDrFd;
 Sat, 29 Feb 2020 02:16:09 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SFFcKc105420; Fri, 28 Feb 2020 10:16:00 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yepxphvrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 10:15:59 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01SFFxa3107442;
 Fri, 28 Feb 2020 10:15:59 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yepxphuy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 10:15:56 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01SFC17N007473;
 Fri, 28 Feb 2020 15:14:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2yepv2pkys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:14:55 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01SFEshx16253840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 15:14:54 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 333582805C;
 Fri, 28 Feb 2020 15:14:54 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C33028068;
 Fri, 28 Feb 2020 15:14:53 +0000 (GMT)
Received: from [9.211.148.203] (unknown [9.211.148.203])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Feb 2020 15:14:53 +0000 (GMT)
Subject: Re: [PATCH v2] ARM: dts: rainier: Set PCA9552 pin types
To: Matthew Barth <msbarth@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Brandon Wyman <bjwyman@gmail.com>
References: <20200225201415.431668-1-msbarth@linux.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <59ceccbd-b776-51fc-e80b-39427c70ec70@linux.ibm.com>
Date: Fri, 28 Feb 2020 09:14:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225201415.431668-1-msbarth@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280121
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


On 2/25/20 2:14 PM, Matthew Barth wrote:
> All 16 pins of the PCA9552 at 7-bit address 0x61 should be set as type
> GPIO.
>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>


Reviewed-by: Eddie James <eajames@linux.ibm.com>


> ---
> v2: Added leds-pca955x.h include
>      Added upstream to patch
> ---
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index c63cefce636d..d9fa9fd48058 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -4,6 +4,7 @@
>   
>   #include "aspeed-g6.dtsi"
>   #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
>   
>   / {
>   	model = "Rainier";
> @@ -351,66 +352,82 @@
>   
>   		gpio@0 {
>   			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@1 {
>   			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@2 {
>   			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@3 {
>   			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@4 {
>   			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@5 {
>   			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@6 {
>   			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@7 {
>   			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@8 {
>   			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@9 {
>   			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@10 {
>   			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@11 {
>   			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@12 {
>   			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@13 {
>   			reg = <13>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@14 {
>   			reg = <14>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   
>   		gpio@15 {
>   			reg = <15>;
> +			type = <PCA955X_TYPE_GPIO>;
>   		};
>   	};
>   
