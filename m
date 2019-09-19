Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C695BB7F0D
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 18:27:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z2LN2WRjzF56D
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 02:27:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z2KF5JhqzF55l
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 02:26:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JGI0GY016882; Thu, 19 Sep 2019 12:25:58 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4ct4h3nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 12:25:58 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8JGGSbC020424;
 Thu, 19 Sep 2019 16:25:57 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 2v3vbueuc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 16:25:57 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JGPvW416057198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 16:25:57 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4035AB2064;
 Thu, 19 Sep 2019 16:25:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB501B2067;
 Thu, 19 Sep 2019 16:25:56 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 16:25:56 +0000 (GMT)
Subject: Re: [PATCH v2 linux dev-5.3 1/4] dt-bindings: lpc: add aspeed-g6
 compatible strings
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, joel@jms.id.au
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-7-bradleyb@fuzziesquirrel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <e56e19b0-6483-a351-cc6e-8bc2ce7e74aa@linux.vnet.ibm.com>
Date: Thu, 19 Sep 2019 11:25:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919152340.23133-7-bradleyb@fuzziesquirrel.com>
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
> Assume The AST2600 SoCs contain the same LPC devices as the AST2500.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>   .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt   | 3 ++-
>   Documentation/devicetree/bindings/mfd/aspeed-lpc.txt      | 8 +++++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
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
