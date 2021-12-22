Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AB47CCE0
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 07:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJjd86dpHz3bmk
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 17:11:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJjcq0M9Jz2xvP;
 Wed, 22 Dec 2021 17:11:04 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BM64kGh064294;
 Wed, 22 Dec 2021 14:04:46 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 14:10:12 +0800
Message-ID: <203e9233-c32d-1c16-be0e-3d95ef1c3829@aspeedtech.com>
Date: Wed, 22 Dec 2021 14:10:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] media: aspeed: Use FIELD_GET to improve readability
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
 <20211217095403.2618-3-jammy_huang@aspeedtech.com>
 <CACPK8XcmcP=vu8pWVKdiQVokPyh39Tuy0mfmgPSzb0wb0tcJuA@mail.gmail.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8XcmcP=vu8pWVKdiQVokPyh39Tuy0mfmgPSzb0wb0tcJuA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BM64kGh064294
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

On 2021/12/22 上午 08:59, Joel Stanley wrote:
> On Fri, 17 Dec 2021 at 09:53, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>> Use the bitfield macro FIELD_GET, and GENMASK to do the shift and mask in
>> one go for reg values.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 35 ++++++++++++---------------
>>   1 file changed, 16 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index d5f77b205175..581a4261f9b7 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -156,26 +156,22 @@
>>   #define  VE_SRC_LR_EDGE_DET_NO_H       BIT(13)
>>   #define  VE_SRC_LR_EDGE_DET_NO_DISP    BIT(14)
>>   #define  VE_SRC_LR_EDGE_DET_NO_CLK     BIT(15)
>> -#define  VE_SRC_LR_EDGE_DET_RT_SHF     16
>> -#define  VE_SRC_LR_EDGE_DET_RT         GENMASK(27, VE_SRC_LR_EDGE_DET_RT_SHF)
>> +#define  VE_SRC_LR_EDGE_DET_RT         GENMASK(27, 16)
>>   #define  VE_SRC_LR_EDGE_DET_INTERLACE  BIT(31)
>>
>>   #define VE_SRC_TB_EDGE_DET             0x094
>>   #define  VE_SRC_TB_EDGE_DET_TOP                GENMASK(12, 0)
>> -#define  VE_SRC_TB_EDGE_DET_BOT_SHF    16
>> -#define  VE_SRC_TB_EDGE_DET_BOT                GENMASK(28, VE_SRC_TB_EDGE_DET_BOT_SHF)
>> +#define  VE_SRC_TB_EDGE_DET_BOT                GENMASK(28, 16)
>>
>>   #define VE_MODE_DETECT_STATUS          0x098
>>   #define  VE_MODE_DETECT_H_PERIOD       GENMASK(11, 0)
>> -#define  VE_MODE_DETECT_V_LINES_SHF    16
>> -#define  VE_MODE_DETECT_V_LINES                GENMASK(27, VE_MODE_DETECT_V_LINES_SHF)
>> +#define  VE_MODE_DETECT_V_LINES                GENMASK(27, 16)
>>   #define  VE_MODE_DETECT_STATUS_VSYNC   BIT(28)
>>   #define  VE_MODE_DETECT_STATUS_HSYNC   BIT(29)
>>
>>   #define VE_SYNC_STATUS                 0x09c
>>   #define  VE_SYNC_STATUS_HSYNC          GENMASK(11, 0)
>> -#define  VE_SYNC_STATUS_VSYNC_SHF      16
>> -#define  VE_SYNC_STATUS_VSYNC          GENMASK(27, VE_SYNC_STATUS_VSYNC_SHF)
>> +#define  VE_SYNC_STATUS_VSYNC          GENMASK(27, 16)
>>
>>   #define VE_H_TOTAL_PIXELS              0x0A0
>>
>> @@ -988,23 +984,24 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>                  sync = aspeed_video_read(video, VE_SYNC_STATUS);
>>                  htotal = aspeed_video_read(video, VE_H_TOTAL_PIXELS);
>>
>> -               video->frame_bottom = (src_tb_edge & VE_SRC_TB_EDGE_DET_BOT) >>
>> -                       VE_SRC_TB_EDGE_DET_BOT_SHF;
>> -               video->frame_top = src_tb_edge & VE_SRC_TB_EDGE_DET_TOP;
>> +               video->frame_bottom = FIELD_GET(VE_SRC_TB_EDGE_DET_BOT,
>> +                                               src_tb_edge);
>> +               video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP,
>> +                                            src_tb_edge);
>>                  det->vfrontporch = video->frame_top;
>> -               det->vbackporch = ((mds & VE_MODE_DETECT_V_LINES) >>
>> -                       VE_MODE_DETECT_V_LINES_SHF) - video->frame_bottom;
>> -               det->vsync = (sync & VE_SYNC_STATUS_VSYNC) >>
>> -                       VE_SYNC_STATUS_VSYNC_SHF;
>> +               det->vbackporch = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
>> +                       video->frame_bottom;
>> +               det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
>>                  if (video->frame_top > video->frame_bottom)
>>                          continue;
>>
>> -               video->frame_right = (src_lr_edge & VE_SRC_LR_EDGE_DET_RT) >>
>> -                       VE_SRC_LR_EDGE_DET_RT_SHF;
>> -               video->frame_left = src_lr_edge & VE_SRC_LR_EDGE_DET_LEFT;
>> +               video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT,
>> +                                              src_lr_edge);
>> +               video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
>> +                                             src_lr_edge);
> I suggest putting these on one line to further improve readability:
>
>                 video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT,
> src_lr_edge);
>                 video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
> src_lr_edge);
>
> The same for the other lines you've changed above.
>
> And then add:
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>>                  det->hfrontporch = video->frame_left;
>>                  det->hbackporch = htotal - video->frame_right;
>> -               det->hsync = sync & VE_SYNC_STATUS_HSYNC;
>> +               det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
>>                  if (video->frame_left > video->frame_right)
>>                          continue;
>>
>> --
>> 2.25.1
>>
-- 
Best Regards
Jammy

