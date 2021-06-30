Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F903B7B40
	for <lists+openbmc@lfdr.de>; Wed, 30 Jun 2021 03:29:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GF3g76Lk0z3022
	for <lists+openbmc@lfdr.de>; Wed, 30 Jun 2021 11:29:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RwURcsUt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RwURcsUt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GF3fq74M7z2xy4
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jun 2021 11:29:39 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15U14Hbn048544; Tue, 29 Jun 2021 21:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ekXCOItgoKQyPjyhBVAipIbWHfhh60rQkHFgYwr7BlI=;
 b=RwURcsUtuYKl3r0QQ4bVZY503SFg1p67/lBR8A6O3TXGazgu4z0XGXOtkVCLMMgFlbvY
 z1nFW7mnqvILOBdjM0MECr73LJEDAQWUKRwPYXN/twvFPdTbN3XxxA0oKJzSR6LhNtMh
 8aFb+f7D2ODeFVdQ76fsFbMgm+2cCkHwktSv+dVTrkDXZdgeOZNruqLJCFSq536guSlo
 e+Wrb2BCuF+fwzWJJ1tG4HqIqyxQdN85udSNFVf2R5FQ/RrJV7m37KVnuIIq57Gg/KfI
 8GLdilAKCSDMrDv65Gi9pfS4eutiOOsK8/0d5dD+TrCnj/9/e8Dwl2muUNu2/dGUu+/5 Tg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39g9nf74tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 21:29:32 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15U1SMB4018718;
 Wed, 30 Jun 2021 01:29:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 39duvc915d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 01:29:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15U1TUuN27722084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 01:29:30 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC08ABE059;
 Wed, 30 Jun 2021 01:29:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70D62BE054;
 Wed, 30 Jun 2021 01:29:30 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.115.220])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 01:29:30 +0000 (GMT)
Message-ID: <5318bae8415b9fa28f6b2ad79703aab0beaa18d5.camel@linux.ibm.com>
Subject: Re: [PATCH linux dev-5.10 2/2] soc: aspeed: Re-enable XDMA on AST2600
From: Eddie James <eajames@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 29 Jun 2021 20:29:29 -0500
In-Reply-To: <20210629073520.318514-3-joel@jms.id.au>
References: <20210629073520.318514-1-joel@jms.id.au>
 <20210629073520.318514-3-joel@jms.id.au>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5AftZMzAX5u7RCokSJwYzHifxQSjpatM
X-Proofpoint-GUID: 5AftZMzAX5u7RCokSJwYzHifxQSjpatM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_14:2021-06-29,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300005
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

On Tue, 2021-06-29 at 17:05 +0930, Joel Stanley wrote:
> Recent builds of the vendor u-boot tree disable features of the
> BMC that may allow unwanted access if not correctly configured. This
> includes the PCIe DMA (XDMA) functionality.
> 
> The bit to "un-disable" it is in the SCU. It does not appear to
> matter
> when it is cleared, as long as it is cleared before attempting a
> transfer.

Thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/soc/aspeed/aspeed-xdma.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/aspeed/aspeed-xdma.c
> b/drivers/soc/aspeed/aspeed-xdma.c
> index e6b4744bda64..48cfe30c90ad 100644
> --- a/drivers/soc/aspeed/aspeed-xdma.c
> +++ b/drivers/soc/aspeed/aspeed-xdma.c
> @@ -34,6 +34,9 @@
>  #define SCU_AST2600_MISC_CTRL			0x0c0
>  #define  SCU_AST2600_MISC_CTRL_XDMA_BMC		 BIT(8)
>  
> +#define SCU_AST2600_DEBUG_CTRL			0x0c8
> +#define  DEBUG_CTRL_XDMA_DISABLE	 	 BIT(2)
> +
>  #define SCU_AST2500_PCIE_CONF			0x180
>  #define SCU_AST2600_PCIE_CONF			0xc20
>  #define  SCU_PCIE_CONF_VGA_EN			 BIT(0)
> @@ -831,10 +834,15 @@ static int aspeed_xdma_init_scu(struct
> aspeed_xdma *ctx, struct device *dev)
>  		regmap_update_bits(scu, ctx->chip->scu_pcie_conf, bmc |
> vga,
>  				   selection);
>  
> -		if (ctx->chip->scu_misc_ctrl)
> +		if (ctx->chip->scu_misc_ctrl) {
>  			regmap_update_bits(scu, ctx->chip-
> >scu_misc_ctrl,
>  					   SCU_AST2600_MISC_CTRL_XDMA_B
> MC,
>  					   SCU_AST2600_MISC_CTRL_XDMA_B
> MC);
> +
> +			/* Allow XDMA to be used on AST2600 */
> +			regmap_update_bits(scu, SCU_AST2600_DEBUG_CTRL,
> +					   DEBUG_CTRL_XDMA_DISABLE, 0);
> +		}
>  	} else {
>  		dev_warn(dev, "Unable to configure PCIe: %ld;
> continuing.\n",
>  			 PTR_ERR(scu));

