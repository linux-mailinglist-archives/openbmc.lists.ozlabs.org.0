Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F7E35F212
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 13:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL0Lx6nGbz30DL
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 21:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ov83anwB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ov83anwB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL0Lj1pTJz2yyC
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 21:17:32 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EB4Fh6049260; Wed, 14 Apr 2021 07:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Kt9N6B7ETBTNI0g9jj3P5B3eI54ge3N/HD7sqQLV7l4=;
 b=Ov83anwBDoZx2QTAentbv2ObUC4CGGE276+OwRmfmBMbHeLaekqKgMBzRE5a/xdqAN67
 rxcaWGagU4pPrJNECTKV3pfdn0LWdj1Jtxj2k5360Oqj/7FF2N+24bDXZrvm1c3ulIA2
 IgGNbnc8QYlm7uDTCHG+kJ0FOeP+VQQ7WjuO8cOa5+SHIczSQZWhYSY17oVXReKkTVpt
 K0Nkt0J7REI0+TB5F8xSS2VRibKZnI91jjUkqwKlSGRCvcGDZw+IaM2jKEhwwsWOlPyn
 ancQH9eE07kttrrGiJBv1sn+YZRL3KCMXR0YTA00pb+r4GOyatwUA372GOgC/ITfQ6c/ bQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn62re1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 07:17:23 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EBH2o3012833;
 Wed, 14 Apr 2021 11:17:22 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 37u3n9gn31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 11:17:22 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EBHLw428115338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 11:17:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFFD7AE063;
 Wed, 14 Apr 2021 11:17:21 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5C50AE05F;
 Wed, 14 Apr 2021 11:17:20 +0000 (GMT)
Received: from [9.85.205.211] (unknown [9.85.205.211])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 11:17:20 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 02/11] ast2600: Specify
 boot order
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-3-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <324da446-aef7-9e11-dbab-615ded7cea10@linux.vnet.ibm.com>
Date: Wed, 14 Apr 2021 08:17:19 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4z-CSoZ7AwAXu9LbbCNNQzJyRVY3j_G6
X-Proofpoint-ORIG-GUID: 4z-CSoZ7AwAXu9LbbCNNQzJyRVY3j_G6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_06:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140077
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
> Try to boot from the strapped device, but fall back to the UART.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>   arch/arm/mach-aspeed/ast2600/spl.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
> index 54f89b0e8431..d794421b4070 100644
> --- a/arch/arm/mach-aspeed/ast2600/spl.c
> +++ b/arch/arm/mach-aspeed/ast2600/spl.c
> @@ -51,6 +51,12 @@ u32 spl_boot_device(void)
>   	return BOOT_DEVICE_NONE;
>   }
> 
> +void board_boot_order(u32 *spl_boot_list)
> +{
> +	spl_boot_list[0] = spl_boot_device();
> +	spl_boot_list[1] = ASPEED_BOOT_DEVICE_UART;
> +}
> +
>   #ifdef CONFIG_SPL_OS_BOOT
>   int spl_start_uboot(void)
>   {
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
