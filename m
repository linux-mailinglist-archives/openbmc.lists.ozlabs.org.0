Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E278147CCE2
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 07:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJjdf63LGz3c63
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 17:11:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJjcq0gvhz2yZt;
 Wed, 22 Dec 2021 17:11:04 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BM65Bfb064928;
 Wed, 22 Dec 2021 14:05:11 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 14:10:37 +0800
Message-ID: <aa3cae53-38bb-e8a8-62df-aeda0272f1f4@aspeedtech.com>
Date: Wed, 22 Dec 2021 14:10:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/4] media: aspeed: Fix timing polarity incorrect
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
 <20211217095403.2618-5-jammy_huang@aspeedtech.com>
 <CACPK8Xf7rsjgCv=Honyf8gwDWbG67dPVjE+z_tXD4yEu1WaE5w@mail.gmail.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8Xf7rsjgCv=Honyf8gwDWbG67dPVjE+z_tXD4yEu1WaE5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BM65Bfb064928
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

OK, I will update in next patch as you advised.
Thanks for your review.

On 2021/12/22 上午 09:22, Joel Stanley wrote:
> On Fri, 17 Dec 2021 at 09:54, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>> This is a workaround for polarity unstable.
>> Sync value get by VR09C counts from sync's rising edge, which means
>> sync's polarity is negative if sync value is bigger than total/2.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 5ad3a20c5bac..f628f69bb7dd 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -989,6 +989,15 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>                  video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP,
>>                                               src_tb_edge);
>>                  det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
>> +               /*
>> +                * Workaround for polarity detection
>> +                * Use sync(VR098) counts from sync's rising edge till falling
>> +                * edge to tell sync polarity.
>> +                */
>> +               if (det->vsync > (FIELD_GET(VE_MODE_DETECT_V_LINES, mds) >> 1))
> Are you right shifting as this is the value / 2? I think it's clearer
> to write / 2 instead of >> 1.
>
> Mention in the comment that this is a workaround for when the sync
> value is larger than half.
>
>> +                       det->polarities &= ~V4L2_DV_VSYNC_POS_POL;
>> +               else
>> +                       det->polarities |= V4L2_DV_VSYNC_POS_POL;
>>                  if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
>>                          det->vbackporch = video->frame_top - det->vsync;
>>                          det->vfrontporch =
>> @@ -1010,6 +1019,15 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>                  video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
>>                                                src_lr_edge);
>>                  det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
>> +               /*
>> +                * Workaround for polarity detection
>> +                * Use sync(VR098) counts from sync's rising edge till falling
>> +                * edge to tell sync polarity.
>> +                */
>> +               if (det->hsync > (htotal >> 1))
>> +                       det->polarities &= ~V4L2_DV_HSYNC_POS_POL;
>> +               else
>> +                       det->polarities |= V4L2_DV_HSYNC_POS_POL;
>>                  if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
>>                          det->hbackporch = video->frame_left - det->hsync;
>>                          det->hfrontporch = htotal - video->frame_right;
>> --
>> 2.25.1
>>
-- 
Best Regards
Jammy

