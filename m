Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89B3FDE40
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 17:08:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H06rH3fSbz2xrS
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 01:08:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jK0ZvE9b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jK0ZvE9b; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H06qp23Jgz2xXp;
 Thu,  2 Sep 2021 01:07:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181F3E6h109346; Wed, 1 Sep 2021 11:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WubeIqV+bNHaxDT9oH2jQj2VFae/G2tEpJEEH2xmuRA=;
 b=jK0ZvE9bXuPpXwyCuebtRZGkn9REAU23/RgbFFYuiUHRJDD0wDke2ED3RAIRTlCzTdua
 8xHmCBdWKwQLnWkxttctC9iG7C+A1gb11u9H/bqRrqA4WnipDPakPB+gkf2J0uwN4+vX
 txv6ZpNYbk9AYHVftdIAq6SF2nYKw1moB2NFBS+Og26r6PwyJ2jY3OsAyAb+X6Kj7SlK
 JzZN9BKCxOMqg8pFrhTnySZ2BddmziQqO6WClF7zwsZL6lsnvojZzWzvWRN5n04d7KVP
 RkdgP5g463yZ8xK4I6gv9NPEM3HZ0XpRpLk5WpVDzXSV8foIovMZoa2/NqQttIGX8ZRb iQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3atafaax55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 11:07:30 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181F4Zgu028916;
 Wed, 1 Sep 2021 15:07:29 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3aqcsdpjdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 15:07:29 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181F7S9t31326684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 15:07:28 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44C41B201A;
 Wed,  1 Sep 2021 15:07:28 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4008B2014;
 Wed,  1 Sep 2021 15:07:26 +0000 (GMT)
Received: from v0005c16 (unknown [9.163.14.239])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 15:07:26 +0000 (GMT)
Message-ID: <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
From: Eddie James <eajames@linux.ibm.com>
To: Zev Weiss <zev@bewilderbeest.net>
Date: Wed, 01 Sep 2021 10:07:24 -0500
In-Reply-To: <20210617220229.7352-1-zev@bewilderbeest.net>
References: <20210617220229.7352-1-zev@bewilderbeest.net>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zdqbiPxpgkzQjwtL_Sk62UEYgccaUkzp
X-Proofpoint-GUID: zdqbiPxpgkzQjwtL_Sk62UEYgccaUkzp
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010087
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
> As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
> garbage interrupts"), the ASpeed video engine sometimes asserts
> interrupts that the driver hasn't enabled.  In addition to the
> CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
> patch, COMP_READY has also been observed.  Instead of playing
> whack-a-mole with each one individually, we can instead just blanket
> ignore everything we haven't explicitly enabled.

Suspect this will fix an intermittent problem on AST2500 with
screensaver. Change looks good, thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>

> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
> 
> Changes since v2 [1]:
>  - minor commit message improvements
> 
> Changes since v1 [0]:
>  - dropped error message
>  - switched to a blanket-ignore approach as suggested by Ryan
> 
> [0] 
> https://lore.kernel.org/linux-arm-kernel/20201215024542.18888-1-zev@bewilderbeest.net/
> [1] 
> https://lore.kernel.org/openbmc/20210506234048.3214-1-zev@bewilderbeest.net/
> 
>  drivers/media/platform/aspeed-video.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/aspeed-video.c
> b/drivers/media/platform/aspeed-video.c
> index 7bb6babdcade..77611c296a25 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -563,6 +563,12 @@ static irqreturn_t aspeed_video_irq(int irq,
> void *arg)
>  	struct aspeed_video *video = arg;
>  	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
>  
> +	/*
> +	 * Hardware sometimes asserts interrupts that we haven't
> actually
> +	 * enabled; ignore them if so.
> +	 */
> +	sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
> +
>  	/*
>  	 * Resolution changed or signal was lost; reset the engine and
>  	 * re-initialize
> @@ -629,16 +635,6 @@ static irqreturn_t aspeed_video_irq(int irq,
> void *arg)
>  			aspeed_video_start_frame(video);
>  	}
>  
> -	/*
> -	 * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even
> when these
> -	 * are disabled in the VE_INTERRUPT_CTRL register so clear them
> to
> -	 * prevent unnecessary interrupt calls.
> -	 */
> -	if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
> -		sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
> -	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
> -		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
> -
>  	return sts ? IRQ_NONE : IRQ_HANDLED;
>  }
>  

