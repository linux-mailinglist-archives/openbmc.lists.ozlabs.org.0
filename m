Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC34935E7B3
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:44:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKcz059wRz30Gj
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 06:44:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ee5syDIx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ee5syDIx; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKcyl48njz2yyW
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 06:43:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DKXGXU137416; Tue, 13 Apr 2021 16:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kuHA5mzOhChVc/NlmVGBBHW1tKD4XpRYJlJVwojdAPA=;
 b=ee5syDIxfyE61QfQjus9WP9VuRkihk67LNgMqNpekQIRVngn2Wz4+MellX5XKHMk1Jy2
 UI5A/KVXMB5leyExV17gfrAH9qRZsWZzohUu4P7sxMXtrTlhpjddMgpnu18rWPhxfOPQ
 IlyDd65QxeqEe68seROx7ao9Z7eJ4szcwq0AyjblVkSv9d/Bq6VIZxbow0mWmvovIuqB
 eOGpTXKT0VMhIPPsGV8dLWcChcIOyZHcVkfxUQDcYyLybFf+9S2Q7+c20Z6L9usNM530
 Q3Ne8jtimxP7f0Kx0o7UIWx5PJm7Cam1Lv1YJz3xpdzDDZgKYpzczkD5yNWPEEFpKkiB cw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vjtunuhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:43:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DKawql008310;
 Tue, 13 Apr 2021 20:43:51 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 37u3n9ap3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:43:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DKhoQQ15991134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:43:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB9A378066;
 Tue, 13 Apr 2021 20:43:49 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC6FA78063;
 Tue, 13 Apr 2021 20:43:48 +0000 (GMT)
Received: from [9.80.229.103] (unknown [9.80.229.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:43:48 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 08/11] ast2600: Add HACE to
 device tree
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-9-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <e367800c-7804-6f9c-1ae4-ff4983dc7fb0@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 17:43:46 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-9-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5lQX6n97-h3SZGfyuR6zf5fw3QsYu5eV
X-Proofpoint-ORIG-GUID: 5lQX6n97-h3SZGfyuR6zf5fw3QsYu5eV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130137
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/13/2021 5:07 AM, Joel Stanley wrote:
> HACE is the Hash and Crypto Egine in the AST2600.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>   arch/arm/dts/ast2600-rainier.dts | 5 +++++
>   arch/arm/dts/ast2600-tacoma.dts  | 5 +++++
>   arch/arm/dts/ast2600.dtsi        | 9 +++++++++
>   arch/arm/dts/ast2600a1-evb.dts   | 4 ++++
>   4 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
> index 67e177baf1bd..aae507b4c23d 100755
> --- a/arch/arm/dts/ast2600-rainier.dts
> +++ b/arch/arm/dts/ast2600-rainier.dts
> @@ -103,3 +103,8 @@
>   	pinctrl-0 = <&pinctrl_emmc_default>;
>   	sdhci-drive-type = <1>;
>   };
> +
> +&hace {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
> index 85d1e3902b11..c8ed5e35a74c 100755
> --- a/arch/arm/dts/ast2600-tacoma.dts
> +++ b/arch/arm/dts/ast2600-tacoma.dts
> @@ -94,3 +94,8 @@
>   	pinctrl-0 = <&pinctrl_emmc_default>;
>   	sdhci-drive-type = <1>;
>   };
> +
> +&hace {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
> index e619f7118886..57ea98a47b67 100644
> --- a/arch/arm/dts/ast2600.dtsi
> +++ b/arch/arm/dts/ast2600.dtsi
> @@ -304,6 +304,15 @@
> 
>   			};
> 
> +			hace: hace@1e6d0000 {
> +				compatible = "aspeed,ast2600-hace";
> +				reg = <0x1e6d0000 0x200>;
> +				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scu ASPEED_CLK_GATE_YCLK>;
> +				clock-names = "yclk";
> +				status = "disabled";
> +			};
> +
>   			smp-memram@0 {
>   				compatible = "aspeed,ast2600-smpmem", "syscon";
>   				reg = <0x1e6e2180 0x40>;
> diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
> index 2827e00c0eb4..2ae6e3bdf192 100644
> --- a/arch/arm/dts/ast2600a1-evb.dts
> +++ b/arch/arm/dts/ast2600a1-evb.dts
> @@ -301,3 +301,7 @@
>   &display_port {
>   	status = "okay";
>   };
> +
> +&hace {
> +	status = "okay";
> +};
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
