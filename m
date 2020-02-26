Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6B170194
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 15:52:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SJfj2K1JzDqWq
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 01:51:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SJdx4ygJzDq8W;
 Thu, 27 Feb 2020 01:51:17 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QEnpAS058061; Wed, 26 Feb 2020 09:50:09 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcntj9xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 09:50:09 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QEjsA6018664;
 Wed, 26 Feb 2020 14:50:08 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 2ydcmkqev4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 14:50:08 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QEo7hI51642780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 14:50:08 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7505B2067;
 Wed, 26 Feb 2020 14:50:07 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F6B3B2066;
 Wed, 26 Feb 2020 14:50:07 +0000 (GMT)
Received: from [9.211.122.13] (unknown [9.211.122.13])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 14:50:06 +0000 (GMT)
Subject: Re: [PATCH -next] media: aspeed: add AST2600 support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <f4ffad91-9742-9b68-be51-c1ec222e24b6@linux.ibm.com>
Date: Wed, 26 Feb 2020 08:50:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_05:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002260108
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2/25/20 1:58 PM, Jae Hyun Yoo wrote:
> Video engine in AST2600 has the exactly same register set with
> AST2500 except VR084 register which provides more precise JPEG
> size read back. This commit adds support for the difference and
> adds 'aspeed,ast2600-video-engine' compatible OF string.


Thanks Jae!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 47444a336ebb..7d98db1d9b52 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   // Copyright 2020 IBM Corp.
> -// Copyright (c) 2019 Intel Corporation
> +// Copyright (c) 2019-2020 Intel Corporation
>   
>   #include <linux/atomic.h>
>   #include <linux/bitfield.h>
> @@ -132,7 +132,8 @@
>   #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
>   #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
>   
> -#define VE_OFFSET_COMP_STREAM		0x078
> +#define AST2400_VE_COMP_SIZE_READ_BACK	0x078
> +#define AST2600_VE_COMP_SIZE_READ_BACK	0x084
>   
>   #define VE_SRC_LR_EDGE_DET		0x090
>   #define  VE_SRC_LR_EDGE_DET_LEFT	GENMASK(11, 0)
> @@ -252,12 +253,17 @@ struct aspeed_video_config {
>   
>   static const struct aspeed_video_config ast2400_config = {
>   	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
> -	.comp_size_read = VE_OFFSET_COMP_STREAM,
> +	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>   };
>   
>   static const struct aspeed_video_config ast2500_config = {
>   	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> -	.comp_size_read = VE_OFFSET_COMP_STREAM,
> +	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
> +};
> +
> +static const struct aspeed_video_config ast2600_config = {
> +	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
> +	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
>   };
>   
>   static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
> @@ -1673,6 +1679,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>   static const struct of_device_id aspeed_video_of_match[] = {
>   	{ .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
>   	{ .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
> +	{ .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
