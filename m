Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1470763D06
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 23:02:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jvsq12vyzDqY6
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 07:02:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jvsC166VzDqXS
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 07:02:22 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69L2GTf030455
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 17:02:19 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tn0435e4y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 17:02:18 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Tue, 9 Jul 2019 22:02:17 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Jul 2019 22:02:14 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69L2DWV46465286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jul 2019 21:02:13 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DFBB6E054;
 Tue,  9 Jul 2019 21:02:13 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 653496E04C;
 Tue,  9 Jul 2019 21:02:13 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jul 2019 21:02:13 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Jul 2019 16:04:41 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: Remove mbox node from
 device tree
In-Reply-To: <20190708024749.22039-1-joel@jms.id.au>
References: <20190708024749.22039-1-joel@jms.id.au>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19070921-0012-0000-0000-0000174E241F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011401; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229850; UDB=6.00647736; IPR=6.01011109; 
 MB=3.00027658; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-09 21:02:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070921-0013-0000-0000-000058012FC4
Message-Id: <33f00e308eb93f73a93c8c6d2728a5b4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090252
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
 openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>,
 Hongwei Zhang <hongweiz@ami.com>, John Wang <wangzqbj@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-07-07 21:47, Joel Stanley wrote:
> This device driver was never upstreamed and so it has been dropped from
> the tree. Remove the node from systems that had it enabled.

Seems there are other systems that have it enabled, like witherspoon, 
palmetto, zaius, and lanyang, should this be removed from their tree as 
well?

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         | 4 ----
>  3 files changed, 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index c762c02dc716..628195b66d46 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -235,10 +235,6 @@
>  	flash = <&spi1>;
>  };
> 
> -&mbox {
> -	status = "okay";
> -};
> -
>  &mac0 {
>  	status = "okay";
>  	pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> index a3d6b71518fc..73319917cb74 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
> @@ -163,10 +163,6 @@
>  	status = "okay";
>  };
> 
> -&mbox {
> -	status = "okay";
> -};
> -
>  &pwm_tacho {
>  	status = "okay";
>  	pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> index 270c9236deff..caac895c60b4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -317,10 +317,6 @@
>  	flash = <&spi1>;
>  };
> 
> -&mbox {
> -	status = "okay";
> -};
> -
>  &mac0 {
>  	status = "okay";
>  	pinctrl-names = "default";

