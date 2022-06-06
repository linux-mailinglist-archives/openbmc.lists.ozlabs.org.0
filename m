Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75C53E4C4
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 15:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGvb05NcJz3blW
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 23:33:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=giZa5jrt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=giZa5jrt;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGvYl6796z3blG
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 23:32:43 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256Cff7I006345;
	Mon, 6 Jun 2022 13:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FcfuuVdaGPY7iVjz7IxTjfavgoWVEpuevHhgS+HlHvw=;
 b=giZa5jrtsmehglMAsKqcrqFxzftwF4aFLOKPUV+KWEtSMHrkfhy3qwFufqNCxJGmakQS
 dhliolRcgeM06/dz5cDpLPWrXtRDf1G5sVrB6LEp/olH/8OrUqgcDiSbdzQIvg8zVB18
 mx8u8gpSrKqKP2lsxgBDwoBF2fGrFuoPgJs7IFu42XDlXLfkPfMnCjDzmczMhk21wsl4
 w0paBWHC3fTF1b3iSfrYEuXIMjYFRip7y4joazcLMdD7x2f3zKAFsQLLOHQBuucHMIXq
 FbRNkHDihuK25ulotLHjfVv73BVTiOCsSXcDxwEEgCin9+ta7Cz0cW9XVljjYeY6H5Vo lw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gghes7y7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 13:32:39 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 256DKC3m027607;
	Mon, 6 Jun 2022 13:32:39 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma03wdc.us.ibm.com with ESMTP id 3gfy19dtcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 13:32:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 256DWcIA26608024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jun 2022 13:32:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73D1FBE051;
	Mon,  6 Jun 2022 13:32:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12350BE04F;
	Mon,  6 Jun 2022 13:32:38 +0000 (GMT)
Received: from [9.160.184.8] (unknown [9.160.184.8])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jun 2022 13:32:37 +0000 (GMT)
Message-ID: <11f761ee-256a-4925-9edb-da1cf874e6b6@linux.ibm.com>
Date: Mon, 6 Jun 2022 08:32:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] ARM: dts: ast2600:
 Fix indentation
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, zweiss@equinix.com,
        openbmc@lists.ozlabs.org
References: <20220606000434.1399583-1-joel@jms.id.au>
 <20220606000434.1399583-3-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220606000434.1399583-3-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ul5DhXB480YrGSF7JYaHdd0viF-Bz-zK
X-Proofpoint-ORIG-GUID: Ul5DhXB480YrGSF7JYaHdd0viF-Bz-zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_04,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=929
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206060060
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


On 6/5/22 19:04, Joel Stanley wrote:
> These lines were mistakenly added with space indentation instead of
> tabs.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Fixes: ba6ce6626286 ("aspeed: Add machine names")
> Reported-by: Zev Weiss <zweiss@equinix.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/dts/ast2600-evb.dts    | 4 ++--
>   arch/arm/dts/ast2600-fpga.dts   | 4 ++--
>   arch/arm/dts/ast2600-ncsi.dts   | 4 ++--
>   arch/arm/dts/ast2600-p10bmc.dts | 4 ++--
>   arch/arm/dts/ast2600-tacoma.dts | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
> index 3aeef78df22d..515afa83af69 100644
> --- a/arch/arm/dts/ast2600-evb.dts
> +++ b/arch/arm/dts/ast2600-evb.dts
> @@ -3,8 +3,8 @@
>   #include "ast2600-u-boot.dtsi"
>   
>   / {
> -        model = "AST2600 EVB";
> -        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
> +	model = "AST2600 EVB";
> +	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
>   
>   	memory {
>   		device_type = "memory";
> diff --git a/arch/arm/dts/ast2600-fpga.dts b/arch/arm/dts/ast2600-fpga.dts
> index be0788d92473..069a41185597 100644
> --- a/arch/arm/dts/ast2600-fpga.dts
> +++ b/arch/arm/dts/ast2600-fpga.dts
> @@ -3,8 +3,8 @@
>   #include "ast2600-u-boot.dtsi"
>   
>   / {
> -        model = "AST2600 FPGA";
> -        compatible = "aspeed,ast2600-fpga", "aspeed,ast2600";
> +	model = "AST2600 FPGA";
> +	compatible = "aspeed,ast2600-fpga", "aspeed,ast2600";
>   
>   	memory {
>   		device_type = "memory";
> diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
> index f55294cdf95e..dbe888a945e3 100644
> --- a/arch/arm/dts/ast2600-ncsi.dts
> +++ b/arch/arm/dts/ast2600-ncsi.dts
> @@ -3,8 +3,8 @@
>   #include "ast2600-u-boot.dtsi"
>   
>   / {
> -        model = "AST2600 EVB w/ NCSI";
> -        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
> +	model = "AST2600 EVB w/ NCSI";
> +	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
>   
>   	memory {
>   		device_type = "memory";
> diff --git a/arch/arm/dts/ast2600-p10bmc.dts b/arch/arm/dts/ast2600-p10bmc.dts
> index d1d78d5c3545..aa9edcd66507 100755
> --- a/arch/arm/dts/ast2600-p10bmc.dts
> +++ b/arch/arm/dts/ast2600-p10bmc.dts
> @@ -5,8 +5,8 @@
>   #include "ast2600-u-boot.dtsi"
>   
>   / {
> -        model = "IBM P10 BMC";
> -        compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
> +	model = "IBM P10 BMC";
> +	compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
>   
>   	memory {
>   		device_type = "memory";
> diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
> index 67b3e3013c6b..76f987052140 100755
> --- a/arch/arm/dts/ast2600-tacoma.dts
> +++ b/arch/arm/dts/ast2600-tacoma.dts
> @@ -5,8 +5,8 @@
>   #include "ast2600-u-boot.dtsi"
>   
>   / {
> -        model = "Tacoma";
> -        compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
> +	model = "Tacoma";
> +	compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
>   
>   	memory {
>   		device_type = "memory";
