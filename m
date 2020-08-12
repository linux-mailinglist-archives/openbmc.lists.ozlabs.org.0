Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C1242E3B
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 19:45:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRcYh10HVzDqd9
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 03:45:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pmjD5TUB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRcXd20FPzDqcK;
 Thu, 13 Aug 2020 03:44:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07CHa9G8064927; Wed, 12 Aug 2020 13:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=xpHH9ckC/WDv/YWbsfRZjaFUmnhGdi1m1E4Iwm8eTDU=;
 b=pmjD5TUBzIcDm6rMFZAQIfCu9F23a8RNRtOQiTt94gsO/5g7OSU7995LHOCAD5+6Gs2W
 6JHGtxeYoMCFOUJnZVswuJ2WD/uLyV1wCWxA+D2spzzIi58vNREAHCAJb6brdBOTDkvd
 6anffMGYSU6+Drbx5FQI/FdgfgNwkUHj4n8n585xHzz72gGnxQ+AOl6mOXkIuwrsaoq+
 E7H1lGSrV3oxxriFCgTPPDppYx6nhDFdMFXQh/nr0lbuY1n1ZSbZ1/F1+eWDdn6WUgiA
 tHtFeyVIDe0Cn3Big1tdsUUspNbFvodjoGxzdEGh6NjeP5p32TL88FaSLiACwgODf5cw CA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32v184rkx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 13:44:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07CHJG1J014964;
 Wed, 12 Aug 2020 17:44:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 32skp9maym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 17:44:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07CHiZTK52625896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 17:44:35 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9705AC059;
 Wed, 12 Aug 2020 17:44:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D602AC05B;
 Wed, 12 Aug 2020 17:44:34 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 17:44:34 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Aug 2020 12:44:34 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.8] mtd: spi-nor: sfdp: Revert "default to
 addr_width of 3 for configurable widths"
In-Reply-To: <20200812035847.2352277-1-joel@jms.id.au>
References: <20200812035847.2352277-1-joel@jms.id.au>
Message-ID: <361a6a5c27f19a4a2ce944a147f13b6b@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_13:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120113
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-08-11 22:58, Joel Stanley wrote:
> This reverts commit f9acd7fa80be6ee14aecdc54429f2a48e56224e8 which
> breaks mounting of UBI volumes with the aspeed-smc driver:
> 
>  ubi0: default fastmap pool size: 25
>  ubi0: default fastmap WL pool size: 12
>  ubi0: attaching mtd3
>  ubi0: scanning is finished
>  ubi0 error: ubi_read_volume_table: the layout volume was not found
>  ubi0 error: ubi_attach_mtd_dev: failed to attach mtd3, error -22
> 
> Found by bisecting between v5.7 and v5.8.
> 
> Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3
> for configurable widths")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Tested-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
> This identifies why we are seeing SPI NOR failures on v5.8. There is
> potentially a fix that needs to be made in the aspeed-smc driver 
> instead
> of reverting the core spi-nor change.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 55c0c508464b..9db07182e9c8 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -456,7 +456,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	/* Number of address bytes. */
>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) 
> {
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
> -	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>  		nor->addr_width = 3;
>  		break;
