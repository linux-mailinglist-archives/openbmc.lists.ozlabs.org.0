Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A3B7F0F
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 18:28:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z2N54VXKzF1Dt
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 02:28:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z2Kp5PwmzF55v
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 02:26:38 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JGHpat131764; Thu, 19 Sep 2019 12:26:33 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v4b6sp4s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 12:26:33 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8JGGT3N022277;
 Thu, 19 Sep 2019 16:26:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 2v3vbtxubc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 16:26:32 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JGQV7t43450666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 16:26:31 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B362B2065;
 Thu, 19 Sep 2019 16:26:31 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EFC1B2064;
 Thu, 19 Sep 2019 16:26:31 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 16:26:31 +0000 (GMT)
Subject: Re: [PATCH v2 linux dev-5.3 2/4] ARM: aspeed-g6: lpc: add compatible
 strings
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, joel@jms.id.au
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-8-bradleyb@fuzziesquirrel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <1665cc70-0b85-5279-0ae0-c7108c3c2413@linux.vnet.ibm.com>
Date: Thu, 19 Sep 2019 11:26:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919152340.23133-8-bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190146
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


On 9/19/19 10:23 AM, Brad Bishop wrote:
> Assume the AST2600 SoC contains the same LPC devices as the AST2500.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
> v2:
>    - removed DT binding documentation changes
> ---
>   drivers/char/ipmi/bt-bmc.c            | 1 +
>   drivers/char/ipmi/kcs_bmc_aspeed.c    | 1 +
>   drivers/reset/reset-simple.c          | 1 +
>   drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 1 +
>   drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
>   5 files changed, 6 insertions(+)
>
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index 40b9927c072c..0e600449931b 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -513,6 +513,7 @@ static int bt_bmc_remove(struct platform_device *pdev)
>   static const struct of_device_id bt_bmc_match[] = {
>   	{ .compatible = "aspeed,ast2400-ibt-bmc" },
>   	{ .compatible = "aspeed,ast2500-ibt-bmc" },
> +	{ .compatible = "aspeed,ast2600-ibt-bmc" },
>   	{ },
>   };
>   
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 3c955946e647..a0a8bb89c9b3 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -301,6 +301,7 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
>   static const struct of_device_id ast_kcs_bmc_match[] = {
>   	{ .compatible = "aspeed,ast2400-kcs-bmc" },
>   	{ .compatible = "aspeed,ast2500-kcs-bmc" },
> +	{ .compatible = "aspeed,ast2600-kcs-bmc" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, ast_kcs_bmc_match);
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 1154f7b1f4dd..2fe9c889a75a 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
>   		.data = &reset_simple_active_low },
>   	{ .compatible = "aspeed,ast2400-lpc-reset" },
>   	{ .compatible = "aspeed,ast2500-lpc-reset" },
> +	{ .compatible = "aspeed,ast2600-lpc-reset" },
>   	{ .compatible = "bitmain,bm1880-reset",
>   		.data = &reset_simple_active_low },
>   	{ /* sentinel */ },
> diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> index 01ed21e8bfee..12e4421dee37 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> @@ -291,6 +291,7 @@ static int aspeed_lpc_ctrl_remove(struct platform_device *pdev)
>   static const struct of_device_id aspeed_lpc_ctrl_match[] = {
>   	{ .compatible = "aspeed,ast2400-lpc-ctrl" },
>   	{ .compatible = "aspeed,ast2500-lpc-ctrl" },
> +	{ .compatible = "aspeed,ast2600-lpc-ctrl" },
>   	{ },
>   };
>   
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 48f7ac238861..c7b4ac066b40 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -325,6 +325,8 @@ static const struct of_device_id aspeed_lpc_snoop_match[] = {
>   	  .data = &ast2400_model_data },
>   	{ .compatible = "aspeed,ast2500-lpc-snoop",
>   	  .data = &ast2500_model_data },
> +	{ .compatible = "aspeed,ast2600-lpc-snoop",
> +	  .data = &ast2500_model_data },
>   	{ },
>   };
>   
