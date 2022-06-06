Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9853E4C3
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 15:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGvYq0KG7z3bl6
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 23:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqRM8KbU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqRM8KbU;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGvYL5w5tz30BP
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 23:32:22 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256BwlnT001041;
	Mon, 6 Jun 2022 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PYRUO2V/mrnp8OqehAl7OXTib8sjWMN/IMHbi2nL4I4=;
 b=dqRM8KbUUPZnnTi6ydFsT0Py4h7NDFBtD8bopy+lGgAHmFVpCZGTSGNnPLm6FEvyYsSP
 hGGKGeT1A1Awkp3tBNLOUpZ25StHAJ7ASop06i6k0pJ520p1O8m2Iqn4W4CgRZsyh2YQ
 RoeaNKto3BgHeck4hjnhMArY8UETtIYcLUFhO5+iTdobXr7m4Z07rktrCcbLhq1Ga6eL
 jK1hzQcfqEKGUYrUWyMJQocMOFggmU3rx0u5A6wcn/zBhyewGORKL/Tc87Jw8OuXXw53
 8uTkCvtQnwSx28X+kwkpXpK3FvzXPG8yNfKc9mogXaJz7ckeUsI57SQL5xiZ9H+Dhz82 +w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gghdt04d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 13:32:17 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 256DJxKA015099;
	Mon, 6 Jun 2022 13:32:16 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3gfy19dtw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 13:32:16 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 256DWF9433292656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jun 2022 13:32:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 853FBBE054;
	Mon,  6 Jun 2022 13:32:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 278DFBE053;
	Mon,  6 Jun 2022 13:32:15 +0000 (GMT)
Received: from [9.160.184.8] (unknown [9.160.184.8])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jun 2022 13:32:15 +0000 (GMT)
Message-ID: <bb372f2c-237f-67af-08c6-bffbe108d681@linux.ibm.com>
Date: Mon, 6 Jun 2022 08:32:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/2] ARM: dts: Rename
 Rainier to P10 BMC
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, zweiss@equinix.com,
        openbmc@lists.ozlabs.org
References: <20220606000434.1399583-1-joel@jms.id.au>
 <20220606000434.1399583-2-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220606000434.1399583-2-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y64wCMOZfYBlSZd5FW3FFc2UwyuzVAWK
X-Proofpoint-GUID: y64wCMOZfYBlSZd5FW3FFc2UwyuzVAWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_04,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206060060
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


On 6/5/22 19:04, Joel Stanley wrote:
> The Rainier device tree is used for all IBM P10 BMCs, which includes
> both Rainier and Everest.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> --
> v2: Preserve sort order in makefile
>
>   arch/arm/dts/Makefile                                    | 2 +-
>   arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} (93%)
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 3515100c65ce..8f876a0aa0d7 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -685,8 +685,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2600-fpga.dtb \
>   	ast2600-intel.dtb \
>   	ast2600-ncsi.dtb \
> +	ast2600-p10bmc.dtb \
>   	ast2600-pfr.dtb \
> -	ast2600-rainier.dtb \
>   	ast2600-s6q.dtb \
>   	ast2600-slt.dtb \
>   	ast2600-tacoma.dtb
> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-p10bmc.dts
> similarity index 93%
> rename from arch/arm/dts/ast2600-rainier.dts
> rename to arch/arm/dts/ast2600-p10bmc.dts
> index aa91b12ed399..d1d78d5c3545 100755
> --- a/arch/arm/dts/ast2600-rainier.dts
> +++ b/arch/arm/dts/ast2600-p10bmc.dts
> @@ -5,8 +5,8 @@
>   #include "ast2600-u-boot.dtsi"
>   
>   / {
> -        model = "Rainier";
> -        compatible = "ibm,rainier-bmc", "aspeed,ast2600";
> +        model = "IBM P10 BMC";
> +        compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
>   
>   	memory {
>   		device_type = "memory";
