Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C7C1A8E92
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:28:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4920Vp099nzDqJN
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:28:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4920Tz0gggzDqJN
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:27:18 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EM3aAS093759; Tue, 14 Apr 2020 18:27:12 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnma0k37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 18:27:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EMP9bh021104;
 Tue, 14 Apr 2020 22:27:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 30b5h6cxdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 22:27:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EMRB5N52101628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 22:27:11 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C909112064;
 Tue, 14 Apr 2020 22:27:11 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C4E1112061;
 Tue, 14 Apr 2020 22:27:10 +0000 (GMT)
Received: from [9.163.60.61] (unknown [9.163.60.61])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 Apr 2020 22:27:09 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4 1/2] fsi: aspeed: Run the bus at maximum
 speed
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
References: <20200414105140.1089095-1-joel@jms.id.au>
 <20200414105140.1089095-2-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <7d1d8fe8-f033-8853-1adc-08f1de769007@linux.vnet.ibm.com>
Date: Tue, 14 Apr 2020 17:27:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414105140.1089095-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_11:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140153
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


On 4/14/20 5:51 AM, Joel Stanley wrote:
> Testing of Tacoma has shown that the ASPEED master can be run at maximum
> speed.
>
> The exception is when wired externally with a cable, in which case we
> use a divisor of two to ensure reliable operation.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/fsi/fsi-master-aspeed.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index fe2da6f90590..80bc9132e4f8 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -83,7 +83,11 @@ static const u32 fsi_base = 0xa0000000;
>   
>   #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
>   
> -#define DEFAULT_DIVISOR			14
> +/* Run the bus at maximum speed by default */
> +#define FSI_DIVISOR_DEFAULT            1
> +#define FSI_DIVISOR_CABLED             2
> +static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
> +
>   #define OPB_POLL_TIMEOUT		10000
>   
>   static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
> @@ -389,9 +393,11 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
>   	opb_writel(aspeed, ctrl_base + FSI_MECTRL, reg);
>   
>   	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
> -			| fsi_mmode_crs0(DEFAULT_DIVISOR)
> -			| fsi_mmode_crs1(DEFAULT_DIVISOR)
> +			| fsi_mmode_crs0(aspeed_fsi_divisor)
> +			| fsi_mmode_crs1(aspeed_fsi_divisor)
>   			| FSI_MMODE_P8_TO_LSB);
> +	dev_info(aspeed->dev, "mmode set to %08x (divisor %d)\n",
> +			be32_to_cpu(reg), aspeed_fsi_divisor);
>   	opb_writel(aspeed, ctrl_base + FSI_MMODE, reg);
>   
>   	reg = cpu_to_be32(0xffff0000);
> @@ -450,6 +456,11 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
>   
>   	/* If the routing GPIO is high we should set the mux to low. */
>   	if (gpio) {
> +		/*
> +		 * Cable signal integrity means we should run the bus
> +		 * slightly slower
> +		 */
> +		aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
>   		gpiod_direction_output(mux_gpio, 0);
>   		dev_info(dev, "FSI configured for external cable\n");
>   	} else {
