Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DABECAC
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 00:21:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tJyh6kN5zDqQy
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:21:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tJxt45pXzDqPy
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 08:20:18 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TMI7C5010030
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:20:15 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s68nyamnj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:20:15 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 29 Apr 2019 23:20:13 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 23:20:10 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3TMK92g34734176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 22:20:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17991112063;
 Mon, 29 Apr 2019 22:20:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD36E112066;
 Mon, 29 Apr 2019 22:20:08 +0000 (GMT)
Received: from [9.80.207.28] (unknown [9.80.207.28])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 22:20:08 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 3/4] media: aspeed: remove checking of
 VE_INTERRUPT_CAPTURE_COMPLETE
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-4-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Mon, 29 Apr 2019 17:20:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425222040.2413-4-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19042922-0040-0000-0000-000004E8DD6D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011019; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01196260; UDB=6.00627338; IPR=6.00977109; 
 MB=3.00026655; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-29 22:20:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042922-0041-0000-0000-000008F4E038
Message-Id: <2df11318-297a-c0fd-d661-125a88c3223e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290144
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
> VE_INTERRUPT_CAPTURE_COMPLETE and VE_INTERRUPT_COMP_COMPLETE are
> not set at the same time but the current interrupt handling
> mechanism of this driver doesn't clear the interrupt flag until
> both two are set, and this behavior causes unnecessary interrupt
> handler calls. In fact, this driver provides JPEG format only so
> taking care of the VE_INTERRUPT_COMP_COMPLETE is enough for getting
> compressed image frame so this commit gets rid of the
> VE_INTERRUPT_CAPTURE_COMPLETE checking logic to simplfy the logic.


I remember having trouble without checking both of these early in my 
driver development, but I did test with this patch set and it seems ok, 
so, should be fine.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 429f676f9dea..77c209a472ca 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -463,8 +463,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>   	aspeed_video_write(video, VE_COMP_ADDR, addr);
>   
>   	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
> -			    VE_INTERRUPT_COMP_COMPLETE |
> -			    VE_INTERRUPT_CAPTURE_COMPLETE);
> +			    VE_INTERRUPT_COMP_COMPLETE);
>   
>   	aspeed_video_update(video, VE_SEQ_CTRL, 0,
>   			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
> @@ -570,8 +569,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   		}
>   	}
>   
> -	if ((sts & VE_INTERRUPT_COMP_COMPLETE) &&
> -	    (sts & VE_INTERRUPT_CAPTURE_COMPLETE)) {
> +	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>   		struct aspeed_video_buffer *buf;
>   		u32 frame_size = aspeed_video_read(video,
>   						   VE_OFFSET_COMP_STREAM);
> @@ -600,11 +598,9 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   				    VE_SEQ_CTRL_FORCE_IDLE |
>   				    VE_SEQ_CTRL_TRIG_COMP, 0);
>   		aspeed_video_update(video, VE_INTERRUPT_CTRL,
> -				    VE_INTERRUPT_COMP_COMPLETE |
> -				    VE_INTERRUPT_CAPTURE_COMPLETE, 0);
> +				    VE_INTERRUPT_COMP_COMPLETE, 0);
>   		aspeed_video_write(video, VE_INTERRUPT_STATUS,
> -				   VE_INTERRUPT_COMP_COMPLETE |
> -				   VE_INTERRUPT_CAPTURE_COMPLETE);
> +				   VE_INTERRUPT_COMP_COMPLETE);
>   
>   		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
>   			aspeed_video_start_frame(video);

