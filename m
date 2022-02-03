Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DD4A8A03
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 18:29:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqQdR3t4wz3bPK
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 04:29:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmIJ83Ow;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cmIJ83Ow; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqQd165V7z2xCM
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 04:28:53 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213GaLHD025467; 
 Thu, 3 Feb 2022 17:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XOC+iAfKQpepNSg/DOUwZB+zjt6TGu5WHfaET44FSDs=;
 b=cmIJ83Ow/XNkMVccJIuIcVSAuqwz6dCFk8QY4t9VkitzEdRSRnmbFeWW9LTOPcxM3cR+
 F4gtjvMW0W/9d6W0R4QwlPsgoNXWhzMJCuWZLUWVKU4WUqsfGeJFzfJcU9oOo6PnK8+/
 dmIihEklLCuzcDX23Qm0ctm6+1HbGFGPiFnSZjUelOS2z3JlEBmbkIvrTNGNIlZ9A5C9
 3ngeAP+OYKbnKWIsOz0D4Nz8gYgMfc3rASROQmHCWx4u5AzQ/4kX6LSqnZGBKT3qUxiS
 /WMDmI6ITDDw7kpjGMApX+3Xci4BvRi1xAwYm059Uf5Fw2JBiiQpbYhtC9vDmJSW+1MV og== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0aa3wk1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:28:48 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213HDK85000493;
 Thu, 3 Feb 2022 17:28:47 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3dvw7c1pb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:28:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213HSkPT33358238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 17:28:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFD3FAC05B;
 Thu,  3 Feb 2022 17:28:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4799CAC06A;
 Thu,  3 Feb 2022 17:28:46 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 17:28:45 +0000 (GMT)
Message-ID: <bb09edee-36ec-b832-6736-04570a9d21df@linux.ibm.com>
Date: Thu, 3 Feb 2022 11:28:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 5/6] ARM: dts: rainier: Add
 gpio-line-names property with bmc-secure-boot
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-6-andrew@aj.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220131012538.73021-6-andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XbLOSJNwYD2AIp3GrirwZ7T30HSjanlX
X-Proofpoint-ORIG-GUID: XbLOSJNwYD2AIp3GrirwZ7T30HSjanlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030100
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


On 1/30/22 19:25, Andrew Jeffery wrote:
> The "bmc-secure-boot" GPIO controls at runtime whether FIT signature
> verification is performed by u-boot and the SPL.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   arch/arm/dts/ast2600-rainier.dts | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
> index d0e82d151239..af35afb911fb 100755
> --- a/arch/arm/dts/ast2600-rainier.dts
> +++ b/arch/arm/dts/ast2600-rainier.dts
> @@ -104,6 +104,38 @@
>   	sdhci-drive-type = <1>;
>   };
>   
> +&gpio0 {
> +	status = "okay";


I'm surprised you don't need the u-boot,dm-pre-reloc flag here?


> +
> +	gpio-line-names =
> +	/*A0-A7*/	"","","","","","","","",
> +	/*B0-B7*/	"","","","","","","","",
> +	/*C0-C7*/	"","","","","","","","",
> +	/*D0-D7*/	"","","","","","","","",
> +	/*E0-E7*/	"","","","","","","","",
> +	/*F0-F7*/	"","","","","","","","",
> +	/*G0-G7*/	"","","","","","","","",
> +	/*H0-H7*/	"","","","","","","","",
> +	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"","","","","","","","",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"","","","","","","","",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"","","","","","","","",
> +	/*S0-S7*/	"","","","","","","","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","","","","","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","";
> +};
> +
>   &hace {
>   	u-boot,dm-pre-reloc;
>   	status = "okay";
