Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 606514123E5
	for <lists+openbmc@lfdr.de>; Mon, 20 Sep 2021 20:27:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCtLz270fz2yPc
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 04:27:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C0RCjcNl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C0RCjcNl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCtLW00MVz2yKK
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 04:26:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KHTFOK017114
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 14:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Dn9j2UjKe/y5uVpO80Jh02XFltQQAIwtTbHp8pTTG1Y=;
 b=C0RCjcNlCaI0KCkTwB5LiCmMLAWH3io6m31CH2kGd7LtuEtwPZbYaKqYnF8S7dBgJ48+
 iTEZi5+bZAkRnXd0Fa465U2EocmOcrzJ7Npr/JkUSFD3SzOg5fza6L0q+ikSylH77kYZ
 wF3rnhK2yMfAwMyEzXY1Re8YIKGeHABvSyCiQbt91NeWFDmH6MIHDz5w7Ij9/dVtm1Xc
 uvVCugcKkEeM1DlURddxXKoraiEHOnGRuBFjb87qIYv2ewqQPWFeqT6+OUY4kGC74D1H
 WDhSGo6a1+7inPBy9RqfiCbwK7BS110+kK2LUzhLc7H01YHUMzcuv8+WOUJ4Ua7BU5ov zQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5wdv1mnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 14:26:39 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KIH8IK018617
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 18:26:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3b57ra79dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 18:26:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KIQaI236241780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 18:26:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84E526A05F;
 Mon, 20 Sep 2021 18:26:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 596696A054;
 Mon, 20 Sep 2021 18:26:36 +0000 (GMT)
Received: from [9.211.87.144] (unknown [9.211.87.144])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 18:26:36 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.10 v2 1/3] ARM: dts: rainier: Define name for
 gpio line Q2
To: Ben Tyner <bentyner@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20210920150549.6431-1-bentyner@linux.ibm.com>
 <20210920150549.6431-2-bentyner@linux.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <461dec3c-f3d1-950c-4e14-fb10380b1fb1@linux.ibm.com>
Date: Mon, 20 Sep 2021 13:26:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920150549.6431-2-bentyner@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8v8F1jvP59sf23o-pnVkwd443HtAqV-K
X-Proofpoint-ORIG-GUID: 8v8F1jvP59sf23o-pnVkwd443HtAqV-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109200108
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/20/21 10:05 AM, Ben Tyner wrote:
> From: Ben Tyner <ben.tyner@ibm.com>
>
> gpio-line-names Q2 set to regulator-standby-faulted


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 9250d9465407..e1227636c0d6 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -242,7 +242,7 @@ &gpio0 {
>   	/*N0-N7*/	"","","","","","","","",
>   	/*O0-O7*/	"","","","usb-power","","","","",
>   	/*P0-P7*/	"","","","","pcieslot-power","","","",
> -	/*Q0-Q7*/	"cfam-reset","","","","","","","",
> +	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
>   	/*R0-R7*/	"","power-chassis-control","power-chassis-good","","","","","",
>   	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
>   				"","","","",
