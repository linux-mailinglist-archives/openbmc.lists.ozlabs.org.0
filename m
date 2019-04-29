Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506FECA9
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 00:18:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tJw36Fz2zDqRG
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:18:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tJvJ6Sn7zDqNj
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 08:18:04 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TMHM9e063373
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:18:02 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s688fbbu7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 18:18:01 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 29 Apr 2019 23:18:01 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Apr 2019 23:17:59 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3TMGh5K40632532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 22:16:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC7F2112064;
 Mon, 29 Apr 2019 22:16:42 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B0DD112062;
 Mon, 29 Apr 2019 22:16:42 +0000 (GMT)
Received: from [9.80.207.28] (unknown [9.80.207.28])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 22:16:42 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 2/4] media: aspeed: reduce noisy log printing outs
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-3-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Mon, 29 Apr 2019 17:16:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425222040.2413-3-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19042922-0060-0000-0000-00000336461B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011019; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01196259; UDB=6.00627337; IPR=6.00977109; 
 MB=3.00026655; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-29 22:18:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042922-0061-0000-0000-00004924A026
Message-Id: <fb2cbc90-f351-97f8-2730-73203931e01e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=938 adultscore=0 classifier=spam adjust=0 reason=mlx
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
> Currently, this driver prints out too much log messages when a
> mode change happens, video turned off by screen saver and etc.
> Actually, all cases are reported to user space properly. Also,
> these are not critical errors but recoverable things, so this
> commit changes the log level of some noisy printing outs.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 4475c6e6d0ae..429f676f9dea 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -441,7 +441,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
>   
>   	if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
>   	    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
> -		dev_err(video->dev, "Engine busy; don't start frame\n");
> +		dev_dbg(video->dev, "Engine busy; don't start frame\n");
>   		return -EBUSY;
>   	}
>   
> @@ -771,7 +771,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   						      res_check(video),
>   						      MODE_DETECT_TIMEOUT);
>   		if (!rc) {
> -			dev_err(video->dev, "Timed out; first mode detect\n");
> +			dev_dbg(video->dev, "Timed out; first mode detect\n");
>   			clear_bit(VIDEO_RES_DETECT, &video->flags);
>   			return;
>   		}
> @@ -789,7 +789,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   						      MODE_DETECT_TIMEOUT);
>   		clear_bit(VIDEO_RES_DETECT, &video->flags);
>   		if (!rc) {
> -			dev_err(video->dev, "Timed out; second mode detect\n");
> +			dev_dbg(video->dev, "Timed out; second mode detect\n");
>   			return;
>   		}
>   
> @@ -823,7 +823,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>   	} while (invalid_resolution && (tries++ < INVALID_RESOLUTION_RETRIES));
>   
>   	if (invalid_resolution) {
> -		dev_err(video->dev, "Invalid resolution detected\n");
> +		dev_dbg(video->dev, "Invalid resolution detected\n");
>   		return;
>   	}
>   
> @@ -1471,7 +1471,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>   				!test_bit(VIDEO_FRAME_INPRG, &video->flags),
>   				STOP_TIMEOUT);
>   	if (!rc) {
> -		dev_err(video->dev, "Timed out when stopping streaming\n");
> +		dev_dbg(video->dev, "Timed out when stopping streaming\n");
>   
>   		/*
>   		 * Need to force stop any DMA and try and get HW into a good

