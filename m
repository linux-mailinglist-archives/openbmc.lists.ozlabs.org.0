Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A25292D210D
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 03:45:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cql0W6jqvzDqbh
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 13:45:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XZI3f5jG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqkzT21hdzDqVb;
 Tue,  8 Dec 2020 13:44:36 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B82YSxr109954; Mon, 7 Dec 2020 21:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=5Bk2Ywd9o/UYLJs8EAOe+X0boCqeHPuiBlvOT+0VMmI=;
 b=XZI3f5jGPBgo2Y3976ZSgdhLVE0hq4ThjFVf7Dw01iK7ADyLwbYxeIbuydN/rufqrIvc
 arzzqjFgretQNK7yCXi336fcJCMY3O7zo4yBRwrR3Ri65wA+31cdbMN/+wXY95oDOrw6
 hcxo7TOe923v6iar2xpL26E+sEAQSzPTpB92f41nb9hO/XorVQ/Ln3fvd1k07OicHeCS
 4Df3/m3Yg2+XhQvLAMof9vPKrkwRFTiN/j5dX/1IvRUWPlzx7SE/yQvfx6q6tGmpz4Lr
 PJXnKLL3w2xFs0aZI5/O6ovgshFDVpV0OiLXlY1NYEnM4YY62lyIWVfsEb7ebUj5KSgD Pw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359p7xkkww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 21:44:27 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B82h4ZL001593;
 Tue, 8 Dec 2020 02:44:26 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3581u99mxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 02:44:26 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B82iPxd24248724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 02:44:25 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DF14136055;
 Tue,  8 Dec 2020 02:44:25 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D44313604F;
 Tue,  8 Dec 2020 02:44:24 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.121.191])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 02:44:24 +0000 (GMT)
Message-ID: <68107c4964e7590e59bf9bcaf84e6dc2ca62edc3.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
From: Eddie James <eajames@linux.ibm.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd
 <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Date: Mon, 07 Dec 2020 20:44:24 -0600
In-Reply-To: <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_19:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080014
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
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2020-12-07 at 08:42 -0800, Jae Hyun Yoo wrote:
> Video engine uses eclk and vclk for its clock sources and its reset
> control is coupled with eclk so the current clock enabling sequence
> works
> like below.
> 
>  Enable eclk
>  De-assert Video Engine reset
>  10ms delay
>  Enable vclk
> 
> It introduces improper reset on the Video Engine hardware and
> eventually
> the hardware generates unexpected DMA memory transfers that can
> corrupt
> memory region in random and sporadic patterns. This issue is observed
> very rarely on some specific AST2500 SoCs but it causes a critical
> kernel panic with making a various shape of signature so it's
> extremely
> hard to debug. Moreover, the issue is observed even when the video
> engine is not actively used because udevd turns on the video engine
> hardware for a short time to make a query in every boot.
> 
> To fix this issue, this commit changes the clock handling logic to
> make
> the reset de-assertion triggered after enabling both eclk and vclk.
> Also,
> it adds clk_unprepare call for a case when probe fails.

Thanks Jae, good find.

Reviewed-by: Eddie James <eajames@linux.ibm.com>

> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine
> driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/media/platform/aspeed-video.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c
> b/drivers/media/platform/aspeed-video.c
> index c46a79eace98..db072ff2df70 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -514,8 +514,8 @@ static void aspeed_video_off(struct aspeed_video
> *video)
>  	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>  
>  	/* Turn off the relevant clocks */
> -	clk_disable(video->vclk);
>  	clk_disable(video->eclk);
> +	clk_disable(video->vclk);
>  
>  	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -526,8 +526,8 @@ static void aspeed_video_on(struct aspeed_video
> *video)
>  		return;
>  
>  	/* Turn on the relevant clocks */
> -	clk_enable(video->eclk);
>  	clk_enable(video->vclk);
> +	clk_enable(video->eclk);
>  
>  	set_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -1719,8 +1719,11 @@ static int aspeed_video_probe(struct
> platform_device *pdev)
>  		return rc;
>  
>  	rc = aspeed_video_setup_video(video);
> -	if (rc)
> +	if (rc) {
> +		clk_unprepare(video->vclk);
> +		clk_unprepare(video->eclk);
>  		return rc;
> +	}
>  
>  	return 0;
>  }

