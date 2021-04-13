Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969C835E7B2
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKcy12v2qz30KF
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 06:43:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IXkrpz72;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IXkrpz72; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKcxn0TRsz2xYn
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 06:43:08 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DKYF4G101850; Tue, 13 Apr 2021 16:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=y5WGRaf5caZcY6kITbSDJS6dDiehFRSbnsneElZu4MU=;
 b=IXkrpz72mUyeKA/5pvSLkp4u3oRCHxvXL2YvIdDbfx3H5r+xZ103plhfTcQ8xxD5KhDj
 qxqzs5KxLV4Qj82+OOJg9ifjABeny8W09QxluqVSogmEhajwT/jlZLgXKFgoPKldSZUH
 7FC1tsukGGr4IvJXSZoKrAmJxfcZ8pK/Z4UXR9ZWpB7Oih00rFIMJA1sKMJScgbAh41f
 hNKpSZFJSadtS72AoU9vsDhJlyrnGISfHD6BGs8tdeberrpmfwXOdtoZNXdQV50thhBc
 yR1S1igKlWJhVzGfEfwZFRP9Kb6FJDzibaAi4AblT09THF7kdnlgrYBlm8HBaxkesWfe Vg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wdws7r50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:43:01 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DKbuk0023340;
 Tue, 13 Apr 2021 20:43:00 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 37uhcmr0gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:43:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DKgxap59245290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:42:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61FEB78060;
 Tue, 13 Apr 2021 20:42:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 477787805E;
 Tue, 13 Apr 2021 20:42:58 +0000 (GMT)
Received: from [9.80.229.103] (unknown [9.80.229.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:42:58 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 09/11] clk: aspeed: Add
 HACE yclk to ast2600
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-10-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <04ea5cd9-673a-16b8-72c2-27c19b8d9344@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 17:42:56 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-10-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2Ufz-6-TZpp2ox-ueCU-vpM-JSJ8mRoc
X-Proofpoint-GUID: 2Ufz-6-TZpp2ox-ueCU-vpM-JSJ8mRoc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130137
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
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>   drivers/clk/aspeed/clk_ast2600.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
> index 4c00008a5dfd..ba9a0a0a9a5a 100644
> --- a/drivers/clk/aspeed/clk_ast2600.c
> +++ b/drivers/clk/aspeed/clk_ast2600.c
> @@ -1066,6 +1066,25 @@ static ulong ast2600_enable_usbbhclk(struct ast2600_scu *scu)
>   	return 0;
>   }
> 
> +/* also known as yclk */
> +static ulong ast2600_enable_haceclk(struct ast2600_scu *scu)
> +{
> +	u32 reset_bit;
> +	u32 clkstop_bit;
> +
> +	reset_bit = BIT(ASPEED_RESET_HACE);
> +	clkstop_bit = BIT(13);
> +
> +	writel(reset_bit, &scu->sysreset_ctrl1);
> +	udelay(100);
> +	writel(clkstop_bit, &scu->clk_stop_clr_ctrl1);
> +	mdelay(20);
> +
> +	writel(reset_bit, &scu->sysreset_clr_ctrl1);
> +
> +	return 0;
> +}
> +
>   static int ast2600_clk_enable(struct clk *clk)
>   {
>   	struct ast2600_clk_priv *priv = dev_get_priv(clk->dev);
> @@ -1104,6 +1123,9 @@ static int ast2600_clk_enable(struct clk *clk)
>   		case ASPEED_CLK_GATE_USBPORT2CLK:
>   			ast2600_enable_usbbhclk(priv->scu);
>   			break;
> +		case ASPEED_CLK_GATE_YCLK:
> +			ast2600_enable_haceclk(priv->scu);
> +			break;
>   		default:
>   			pr_debug("can't enable clk \n");
>   			return -ENOENT;
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
