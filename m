Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A43ECC7
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 00:31:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tKBC4CSczDqQS
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:30:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tK9B3qyLzDqPn
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 08:30:06 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TMMVlk136653
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:30:03 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s669rg7qh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:30:03 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 29 Apr 2019 23:30:03 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 23:30:00 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3TMU0ab29425714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 22:30:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF713112062;
 Mon, 29 Apr 2019 22:29:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C4FF112061;
 Mon, 29 Apr 2019 22:29:59 +0000 (GMT)
Received: from [9.80.207.28] (unknown [9.80.207.28])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 22:29:59 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 4/4] media: aspeed: clear interrupt status flags
 immediately
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-5-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Mon, 29 Apr 2019 17:29:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425222040.2413-5-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19042922-0072-0000-0000-00000422DAC2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011019; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01196263; UDB=6.00627340; IPR=6.00977113; 
 MB=3.00026655; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-29 22:30:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042922-0073-0000-0000-00004C03D31A
Message-Id: <23d85414-634a-2d2d-857e-2c3d824de7a5@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=742 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290145
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


On 4/25/19 5:20 PM, Jae Hyun Yoo wrote:
> Interrupt status flags should be cleared immediately otherwise
> interrupt handler will be called again and again until the flag
> is cleared, but this driver clears some flags through a 500ms
> delayed work which is a bad idea in interrupt handling, so this
> commit makes the interrupt handler clear the status flags
> immediately.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 77c209a472ca..e218f375b9f5 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -546,17 +546,18 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   	 * re-initialize
>   	 */
>   	if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
> +		aspeed_video_write(video, VE_INTERRUPT_STATUS,
> +				   VE_INTERRUPT_MODE_DETECT_WD);


aspeed_video_irq_res_change disables all IRQs and turns off the clocks. 
This shouldn't be necessary.


The rest looks fine.

Thanks,

Eddie


>   		aspeed_video_irq_res_change(video);
>   		return IRQ_HANDLED;
>   	}
>   
>   	if (sts & VE_INTERRUPT_MODE_DETECT) {
> +		aspeed_video_write(video, VE_INTERRUPT_STATUS,
> +				   VE_INTERRUPT_MODE_DETECT);
>   		if (test_bit(VIDEO_RES_DETECT, &video->flags)) {
>   			aspeed_video_update(video, VE_INTERRUPT_CTRL,
>   					    VE_INTERRUPT_MODE_DETECT, 0);
> -			aspeed_video_write(video, VE_INTERRUPT_STATUS,
> -					   VE_INTERRUPT_MODE_DETECT);
> -
>   			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
>   			wake_up_interruptible_all(&video->wait);
>   		} else {
> @@ -574,6 +575,9 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   		u32 frame_size = aspeed_video_read(video,
>   						   VE_OFFSET_COMP_STREAM);
>   
> +		aspeed_video_write(video, VE_INTERRUPT_STATUS,
> +				   VE_INTERRUPT_COMP_COMPLETE);
> +
>   		spin_lock(&video->lock);
>   		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>   		buf = list_first_entry_or_null(&video->buffers,
> @@ -599,8 +603,6 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   				    VE_SEQ_CTRL_TRIG_COMP, 0);
>   		aspeed_video_update(video, VE_INTERRUPT_CTRL,
>   				    VE_INTERRUPT_COMP_COMPLETE, 0);
> -		aspeed_video_write(video, VE_INTERRUPT_STATUS,
> -				   VE_INTERRUPT_COMP_COMPLETE);
>   
>   		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>   			aspeed_video_start_frame(video);

