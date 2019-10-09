Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6AD10A6
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 15:56:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pG301NYfzDqS3
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 00:56:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pG1g0pVpzDqRL;
 Thu, 10 Oct 2019 00:55:01 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x99DhQE0109695; Wed, 9 Oct 2019 09:54:51 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vhf7b467q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 09:54:50 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x99Dq5LU008540;
 Wed, 9 Oct 2019 13:54:49 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 2vejt7j4jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 13:54:48 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x99DslDP51052858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2019 13:54:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94EF06A04D;
 Wed,  9 Oct 2019 13:54:47 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 053D76A047;
 Wed,  9 Oct 2019 13:54:46 +0000 (GMT)
Received: from [9.41.103.158] (unknown [9.41.103.158])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Oct 2019 13:54:46 +0000 (GMT)
Subject: Re: [PATCH -next v2 1/2] media: aspeed: refine hsync/vsync polarity
 setting logic
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190913181105.11836-1-jae.hyun.yoo@linux.intel.com>
 <20190913181105.11836-2-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <37727919-cb53-363f-5dce-24634fbad1c9@linux.vnet.ibm.com>
Date: Wed, 9 Oct 2019 08:54:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913181105.11836-2-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910090131
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


On 9/13/19 1:11 PM, Jae Hyun Yoo wrote:
> To prevent inaccurate detections of resolution, this commit enables
> clearing of hsync/vsync polarity bits based on probed sync state.


Thanks Jae, looks fine.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> Changes since v1:
>   * Updated commit message.
>
>   drivers/media/platform/aspeed-video.c | 43 +++++++++++++--------------
>   1 file changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..8f77079da55a 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -614,7 +614,7 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
>   	int i;
>   	int hsync_counter = 0;
>   	int vsync_counter = 0;
> -	u32 sts;
> +	u32 sts, ctrl;
>   
>   	for (i = 0; i < NUM_POLARITY_CHECKS; ++i) {
>   		sts = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
> @@ -629,30 +629,29 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
>   			hsync_counter++;
>   	}
>   
> -	if (hsync_counter < 0 || vsync_counter < 0) {
> -		u32 ctrl = 0;
> +	ctrl = aspeed_video_read(video, VE_CTRL);
>   
> -		if (hsync_counter < 0) {
> -			ctrl = VE_CTRL_HSYNC_POL;
> -			video->detected_timings.polarities &=
> -				~V4L2_DV_HSYNC_POS_POL;
> -		} else {
> -			video->detected_timings.polarities |=
> -				V4L2_DV_HSYNC_POS_POL;
> -		}
> -
> -		if (vsync_counter < 0) {
> -			ctrl = VE_CTRL_VSYNC_POL;
> -			video->detected_timings.polarities &=
> -				~V4L2_DV_VSYNC_POS_POL;
> -		} else {
> -			video->detected_timings.polarities |=
> -				V4L2_DV_VSYNC_POS_POL;
> -		}
> +	if (hsync_counter < 0) {
> +		ctrl |= VE_CTRL_HSYNC_POL;
> +		video->detected_timings.polarities &=
> +			~V4L2_DV_HSYNC_POS_POL;
> +	} else {
> +		ctrl &= ~VE_CTRL_HSYNC_POL;
> +		video->detected_timings.polarities |=
> +			V4L2_DV_HSYNC_POS_POL;
> +	}
>   
> -		if (ctrl)
> -			aspeed_video_update(video, VE_CTRL, 0, ctrl);
> +	if (vsync_counter < 0) {
> +		ctrl |= VE_CTRL_VSYNC_POL;
> +		video->detected_timings.polarities &=
> +			~V4L2_DV_VSYNC_POS_POL;
> +	} else {
> +		ctrl &= ~VE_CTRL_VSYNC_POL;
> +		video->detected_timings.polarities |=
> +			V4L2_DV_VSYNC_POS_POL;
>   	}
> +
> +	aspeed_video_write(video, VE_CTRL, ctrl);
>   }
>   
>   static bool aspeed_video_alloc_buf(struct aspeed_video *video,
