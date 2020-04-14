Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1D1A8E98
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:29:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4920XD5WX5zDqnZ
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:29:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4920Vs0dv1zDqsX
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:28:04 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EM45Hi059086; Tue, 14 Apr 2020 18:28:00 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnn4rh6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 18:28:00 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EMOhjL020280;
 Tue, 14 Apr 2020 22:27:59 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 30b5h6v63e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 22:27:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EMRw3U12452376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 22:27:58 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DD9C112062;
 Tue, 14 Apr 2020 22:27:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF76C112063;
 Tue, 14 Apr 2020 22:27:56 +0000 (GMT)
Received: from [9.163.60.61] (unknown [9.163.60.61])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 Apr 2020 22:27:56 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4 2/2] fsi: aspeed: Add module param for bus
 divisor
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
References: <20200414105140.1089095-1-joel@jms.id.au>
 <20200414105140.1089095-3-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <58fdf880-52ec-3b3e-8fbc-14db8ae6d024@linux.vnet.ibm.com>
Date: Tue, 14 Apr 2020 17:27:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414105140.1089095-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_11:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140156
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
> For testing and hardware debugging a user may wish to override the
> divisor at runtime. By setting fsi_master_aspeed.bus_div=N, the divisor
> will be set to N, if 0 < N <= 0x3ff.
>
> This is a module parameter and not a device tree option as it will only
> need to be set when testing or debugging.


Looks good.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/fsi/fsi-master-aspeed.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 80bc9132e4f8..b44f71f1f0a8 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -87,6 +87,7 @@ static const u32 fsi_base = 0xa0000000;
>   #define FSI_DIVISOR_DEFAULT            1
>   #define FSI_DIVISOR_CABLED             2
>   static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
> +module_param_named(bus_div,aspeed_fsi_divisor, ushort, 0);
>   
>   #define OPB_POLL_TIMEOUT		10000
>   
> @@ -458,9 +459,12 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
>   	if (gpio) {
>   		/*
>   		 * Cable signal integrity means we should run the bus
> -		 * slightly slower
> +		 * slightly slower. Do not override if a kernel param
> +		 * has already overridden.
>   		 */
> -		aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
> +		if (aspeed_fsi_divisor == FSI_DIVISOR_DEFAULT)
> +			aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
> +
>   		gpiod_direction_output(mux_gpio, 0);
>   		dev_info(dev, "FSI configured for external cable\n");
>   	} else {
