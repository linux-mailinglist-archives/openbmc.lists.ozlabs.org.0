Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA72E206
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 18:10:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DbK26SkyzDqLf
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 02:10:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DbJY0cFbzDqHx
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 02:09:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TG9cBL099250
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 12:09:45 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ssvrs1ap1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 12:09:39 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 29 May 2019 17:09:21 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 May 2019 17:09:19 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4TG9IQA786878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 16:09:18 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CA476A051
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 16:09:18 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAD5B6A047
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 16:09:17 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 16:09:17 +0000 (GMT)
Subject: Re: [PATCH dev-5.1 1/4] media: aspeed: remove source buffer
 allocation before mode detection
To: openbmc@lists.ozlabs.org
References: <20190523223329.6408-1-jae.hyun.yoo@linux.intel.com>
 <20190523223329.6408-2-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 29 May 2019 11:09:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523223329.6408-2-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052916-8235-0000-0000-00000EA02D42
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210332; UDB=6.00635883; IPR=6.00991365; 
 MB=3.00027104; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 16:09:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052916-8236-0000-0000-000045C51D49
Message-Id: <2a811885-096c-f309-a5ba-a6f5bc7ecb01@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290106
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


On 5/23/19 5:33 PM, Jae Hyun Yoo wrote:
> Mode detection doesn't require source buffer allocation so this
> commit removes that.


Reviewed-by: Eddie James <eajames@linux.ibm.com>

Tested-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 1bb863b32836..ee1f87a08c7c 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -733,27 +733,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   	det->height = MIN_HEIGHT;
>   	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
>   
> -	/*
> -	 * Since we need max buffer size for detection, free the second source
> -	 * buffer first.
> -	 */
> -	if (video->srcs[1].size)
> -		aspeed_video_free_buf(video, &video->srcs[1]);
> -
> -	if (video->srcs[0].size < VE_MAX_SRC_BUFFER_SIZE) {
> -		if (video->srcs[0].size)
> -			aspeed_video_free_buf(video, &video->srcs[0]);
> -
> -		if (!aspeed_video_alloc_buf(video, &video->srcs[0],
> -					    VE_MAX_SRC_BUFFER_SIZE)) {
> -			dev_err(video->dev,
> -				"Failed to allocate source buffers\n");
> -			return;
> -		}
> -	}
> -
> -	aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
> -
>   	do {
>   		if (tries) {
>   			set_current_state(TASK_INTERRUPTIBLE);

