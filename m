Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 002B22E20B
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 18:11:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DbKy45YczDqJW
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 02:11:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DbKT0Br4zDqJH
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 02:10:36 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TGATbx050823
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 12:10:34 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ssurnmudu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 12:10:32 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 29 May 2019 17:10:00 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 May 2019 17:09:57 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4TG9u1h23396736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 16:09:56 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A816D6A04D;
 Wed, 29 May 2019 16:09:56 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 476816A051;
 Wed, 29 May 2019 16:09:56 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 May 2019 16:09:56 +0000 (GMT)
Subject: Re: [PATCH dev-5.1 2/4] media: aspeed: use different delays for
 triggering VE H/W reset
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20190523223329.6408-1-jae.hyun.yoo@linux.intel.com>
 <20190523223329.6408-3-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 29 May 2019 11:09:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523223329.6408-3-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052916-0036-0000-0000-00000AC45245
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011180; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210333; UDB=6.00635884; IPR=6.00991365; 
 MB=3.00027104; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 16:09:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052916-0037-0000-0000-00004BFD796F
Message-Id: <47f9b613-ce3f-dd70-5fd8-0fd036e1038a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/23/19 5:33 PM, Jae Hyun Yoo wrote:
> In case of watchdog timeout detected while doing mode detection,
> it's better triggering video engine hardware reset immediately so
> this commit fixes code for the case. Other than the case, it will
> trigger video engine hardware reset after RESOLUTION_CHANGE_DELAY.


Reviewed-by: Eddie James <eajames@linux.ibm.com>

Tested-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index ee1f87a08c7c..b8540cc7848d 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -522,7 +522,7 @@ static void aspeed_video_bufs_done(struct aspeed_video *video,
>   	spin_unlock_irqrestore(&video->lock, flags);
>   }
>   
> -static void aspeed_video_irq_res_change(struct aspeed_video *video)
> +static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>   {
>   	spin_lock(&video->lock);
>   	dev_dbg(video->dev, "Resolution changed; resetting\n");
> @@ -534,7 +534,7 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video)
>   	spin_unlock(&video->lock);
>   	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>   
> -	schedule_delayed_work(&video->res_work, RESOLUTION_CHANGE_DELAY);
> +	schedule_delayed_work(&video->res_work, delay);
>   }
>   
>   static irqreturn_t aspeed_video_irq(int irq, void *arg)
> @@ -547,7 +547,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   	 * re-initialize
>   	 */
>   	if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
> -		aspeed_video_irq_res_change(video);
> +		aspeed_video_irq_res_change(video, 0);
>   		return IRQ_HANDLED;
>   	}
>   
> @@ -565,7 +565,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   			 * Signal acquired while NOT doing resolution
>   			 * detection; reset the engine and re-initialize
>   			 */
> -			aspeed_video_irq_res_change(video);
> +			aspeed_video_irq_res_change(video,
> +						    RESOLUTION_CHANGE_DELAY);
>   			return IRQ_HANDLED;
>   		}
>   	}

