Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0424750A3
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 03:01:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDJPW6M9gz3brX
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 13:01:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDJPF5jBQz2ynd;
 Wed, 15 Dec 2021 13:00:47 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BF1Y3pH022113;
 Wed, 15 Dec 2021 09:34:03 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Dec
 2021 09:59:26 +0800
Message-ID: <8bc81b12-795e-b7a1-64dd-a15f30c5f19d@aspeedtech.com>
Date: Wed, 15 Dec 2021 09:59:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] media: aspeed: move err-handling together to the bottom
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211206004811.1118-1-jammy_huang@aspeedtech.com>
 <20211214155300.0132946e@coco.lan>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20211214155300.0132946e@coco.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BF1Y3pH022113
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mauro,

Because I saw similar error-handling in aspeed_video_init(), I just want 
to make it clear and identical.
It's ok if not applied. Just style problem, as you said.

On 2021/12/14 下午 10:53, Mauro Carvalho Chehab wrote:
> Em Mon, 6 Dec 2021 08:48:11 +0800
> Jammy Huang <jammy_huang@aspeedtech.com> escreveu:
>
>> refine aspeed_video_setup_video() flow.
> Why? It makes no difference where the error handling code is. Let's
> keep it as preferred by the driver's author ;-)
>
> Regards,
> Mauro
>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>> v2:
>>   - remove change-id in comment
>> ---
>>   drivers/media/platform/aspeed-video.c | 24 +++++++++++-------------
>>   1 file changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index fea5e4d0927e..f5c40d6b4ece 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -1641,11 +1641,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>   
>>   	rc = video->ctrl_handler.error;
>>   	if (rc) {
>> -		v4l2_ctrl_handler_free(&video->ctrl_handler);
>> -		v4l2_device_unregister(v4l2_dev);
>> -
>>   		dev_err(video->dev, "Failed to init controls: %d\n", rc);
>> -		return rc;
>> +		goto err_ctrl_init;
>>   	}
>>   
>>   	v4l2_dev->ctrl_handler = &video->ctrl_handler;
>> @@ -1663,11 +1660,8 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>   
>>   	rc = vb2_queue_init(vbq);
>>   	if (rc) {
>> -		v4l2_ctrl_handler_free(&video->ctrl_handler);
>> -		v4l2_device_unregister(v4l2_dev);
>> -
>>   		dev_err(video->dev, "Failed to init vb2 queue\n");
>> -		return rc;
>> +		goto err_vb2_init;
>>   	}
>>   
>>   	vdev->queue = vbq;
>> @@ -1685,15 +1679,19 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
>>   	video_set_drvdata(vdev, video);
>>   	rc = video_register_device(vdev, VFL_TYPE_GRABBER, 0);
>>   	if (rc) {
>> -		vb2_queue_release(vbq);
>> -		v4l2_ctrl_handler_free(&video->ctrl_handler);
>> -		v4l2_device_unregister(v4l2_dev);
>> -
>>   		dev_err(video->dev, "Failed to register video device\n");
>> -		return rc;
>> +		goto err_video_reg;
>>   	}
>>   
>>   	return 0;
>> +
>> +err_video_reg:
>> +	vb2_queue_release(vbq);
>> +err_vb2_init:
>> +err_ctrl_init:
>> +	v4l2_ctrl_handler_free(&video->ctrl_handler);
>> +	v4l2_device_unregister(v4l2_dev);
>> +	return rc;
>>   }
>>   
>>   static int aspeed_video_init(struct aspeed_video *video)
>
>
> Thanks,
> Mauro

-- 
Best Regards
Jammy

