Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE9B7AE8
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 15:52:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YywJ3sxczF55p
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 23:52:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YytC39BtzF55S
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 23:50:57 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JDmRgM042899; Thu, 19 Sep 2019 09:50:47 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v49w7u1jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 09:50:46 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8JDnVBE003424;
 Thu, 19 Sep 2019 13:50:46 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 2v3vbty8ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 13:50:45 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JDoigR46203192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 13:50:44 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C81E6E065;
 Thu, 19 Sep 2019 13:50:44 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C87106E05D;
 Thu, 19 Sep 2019 13:50:43 +0000 (GMT)
Received: from [9.85.183.6] (unknown [9.85.183.6])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 13:50:43 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.3 1/3] ARM: aspeed-g6: lpc: add compatible
 strings
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, joel@jms.id.au
References: <20190917202039.25266-1-bradleyb@fuzziesquirrel.com>
 <20190917202039.25266-2-bradleyb@fuzziesquirrel.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <82a15a14-29a8-e019-09a3-60318626afee@linux.ibm.com>
Date: Thu, 19 Sep 2019 08:50:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917202039.25266-2-bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190130
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


On 9/17/19 3:20 PM, Brad Bishop wrote:
> Assume The AST2600 SoCs contain the same LPC devices as the AST2500.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>   .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt   | 3 ++-
>   Documentation/devicetree/bindings/mfd/aspeed-lpc.txt      | 8 +++++++-
>   drivers/char/ipmi/bt-bmc.c                                | 1 +
>   drivers/char/ipmi/kcs_bmc_aspeed.c                        | 1 +
>   drivers/reset/reset-simple.c                              | 1 +
>   drivers/soc/aspeed/aspeed-lpc-ctrl.c                      | 1 +
>   drivers/soc/aspeed/aspeed-lpc-snoop.c                     | 2 ++
>   7 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> index 028268fd99ee..4b43b7829bd9 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
> @@ -1,6 +1,6 @@
>   * Aspeed BT (Block Transfer) IPMI interface
>   
> -The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
> +The Aspeed SOCs (AST2400, AST2500 and AST2600) are commonly used as BMCs
>   (BaseBoard Management Controllers) and the BT interface can be used to
>   perform in-band IPMI communication with their host.
>   
> @@ -9,6 +9,7 @@ Required properties:
>   - compatible : should be one of
>   	"aspeed,ast2400-ibt-bmc"
>   	"aspeed,ast2500-ibt-bmc"
> +	"aspeed,ast2600-ibt-bmc"
>   - reg: physical address and size of the registers
>   
>   Optional properties:
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 86446074e206..e1197bab57bb 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -46,6 +46,7 @@ Required properties
>   - compatible:	One of:
>   		"aspeed,ast2400-lpc", "simple-mfd"
>   		"aspeed,ast2500-lpc", "simple-mfd"
> +		"aspeed,ast2600-lpc", "simple-mfd"
>   
>   - reg:		contains the physical address and length values of the Aspeed
>                   LPC memory region.
> @@ -64,6 +65,7 @@ BMC Node
>   - compatible:	One of:
>   		"aspeed,ast2400-lpc-bmc"
>   		"aspeed,ast2500-lpc-bmc"
> +		"aspeed,ast2600-lpc-bmc"
>   
>   - reg:		contains the physical address and length values of the
>                   H8S/2168-compatible LPC controller memory region
> @@ -74,6 +76,7 @@ Host Node
>   - compatible:   One of:
>   		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
>   		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> +		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
>   
>   - reg:		contains the address and length values of the host-related
>                   register space for the Aspeed LPC controller
> @@ -128,6 +131,7 @@ Required properties:
>   - compatible:	One of:
>   		"aspeed,ast2400-lpc-ctrl";
>   		"aspeed,ast2500-lpc-ctrl";
> +		"aspeed,ast2600-lpc-ctrl";
>   
>   - reg:		contains offset/length values of the host interface controller
>   		memory regions
> @@ -168,6 +172,7 @@ Required properties:
>   - compatible:	One of:
>   		"aspeed,ast2400-lhc";
>   		"aspeed,ast2500-lhc";
> +		"aspeed,ast2600-lhc";
>   
>   - reg:		contains offset/length values of the LHC memory regions. In the
>   		AST2400 and AST2500 there are two regions.
> @@ -187,7 +192,8 @@ state of the LPC bus. Some systems may chose to modify this configuration.
>   
>   Required properties:
>   
> - - compatible:		"aspeed,ast2500-lpc-reset" or
> + - compatible:		"aspeed,ast2600-lpc-reset" or
> +			"aspeed,ast2500-lpc-reset"
>   			"aspeed,ast2400-lpc-reset"
>    - reg:			offset and length of the IP in the LHC memory region
>    - #reset-controller	indicates the number of reset cells expected
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
