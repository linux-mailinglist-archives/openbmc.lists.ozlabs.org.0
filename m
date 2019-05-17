Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3021C47
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 19:16:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455FLW1JSVzDqSk
	for <lists+openbmc@lfdr.de>; Sat, 18 May 2019 03:16:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455FKx3Q2lzDqS7
 for <openbmc@lists.ozlabs.org>; Sat, 18 May 2019 03:15:32 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HHDRVC048099
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 13:15:28 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shyusu8jr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 13:15:28 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Fri, 17 May 2019 18:15:28 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 18:15:25 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4HHFOQs29294626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 17:15:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B421B205F;
 Fri, 17 May 2019 17:15:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C12EB2068;
 Fri, 17 May 2019 17:15:23 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 May 2019 17:15:23 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 17 May 2019 12:15:36 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, joel@jms.id.au
Subject: Re: [PATCH u-boot  v2016.07-aspeed-openbmc] aspeed/flash: fix
 definition of the MT25QL01GB chip
In-Reply-To: <20190516161330.32029-1-clg@kaod.org>
References: <20190516161330.32029-1-clg@kaod.org>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19051717-0040-0000-0000-000004F10ED5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011113; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01204704; UDB=6.00632449; IPR=6.00985639; 
 MB=3.00026935; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-17 17:15:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051717-0041-0000-0000-000008FD1F66
Message-Id: <42a4c9cc3d713dbcdd53f997ecd83890@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=921 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170102
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-05-16 11:13, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Tested-by: Adriana Kobylak <anoo@us.ibm.com>

> Fixes: 3c33d1e84ebb ("aspeed/flash: Add MT25QL01GB chip")
> ---
> 
>  It should fix https://github.com/openbmc/u-boot/issues/18
> 
>  arch/arm/mach-aspeed/flash.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-aspeed/flash.c 
> b/arch/arm/mach-aspeed/flash.c
> index 54a6059f4216..db69d514952f 100644
> --- a/arch/arm/mach-aspeed/flash.c
> +++ b/arch/arm/mach-aspeed/flash.c
> @@ -1149,10 +1149,11 @@ static ulong flash_get_size (ulong base,
> flash_info_t *info)
>  			info->readcmd = 0x0b;
>  			info->dualport = 0;
>  			info->dummybyte = 1;
> -			info->buffersize = 1;
> +			info->buffersize = 256;
>  			WriteClk = 50;
>  			EraseClk = 25;
>  			ReadClk  = 50;
> +			info->address32 = 1;
>  			break;
> 
>  		default:	/* use JEDEC ID */

