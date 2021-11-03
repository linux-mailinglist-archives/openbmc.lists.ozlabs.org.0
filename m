Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E127443C5C
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 06:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkZS51GkQz2yJV
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 16:04:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkZRn4Q6Mz2xBq;
 Wed,  3 Nov 2021 16:03:46 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1A34dkWW071525;
 Wed, 3 Nov 2021 12:39:46 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Nov
 2021 13:02:37 +0800
Message-ID: <3a40bb81-2c6e-47e3-fb85-e615aecd129a@aspeedtech.com>
Date: Wed, 3 Nov 2021 13:02:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] media: aspeed: fix mode-detect always time out at 2nd
 run
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20211103011357.22067-1-jammy_huang@aspeedtech.com>
 <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
 <CACPK8XezrCtCbKVgNOPNt+N_7ki6Rctf9M8oLBHyixa+Wph2Sw@mail.gmail.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8XezrCtCbKVgNOPNt+N_7ki6Rctf9M8oLBHyixa+Wph2Sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A34dkWW071525
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,

Sure. Thanks for your reminder.

On 2021/11/3 上午 09:53, Joel Stanley wrote:
> On Wed, 3 Nov 2021 at 01:47, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, 3 Nov 2021 at 01:13, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>>> aspeed_video_get_resolution() will try to do res-detect again if the
>>> timing got in last try is invalid. But it will always time out because
>>> VE_SEQ_CTRL_TRIG_MODE_DET is only cleared after 1st mode-detect.
>>>
>>> To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before setting
>>> it in aspeed_video_enable_mode_detect().
>>>
>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>>> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> When applying, can we please have this tag added:
>
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>
> Cheers,
>
> Joel
>
>
>>> ---
>>> v2:
>>>    - update commit message
>>> ---
>>>   drivers/media/platform/aspeed-video.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>>> index 5ffbabf884eb..fea5e4d0927e 100644
>>> --- a/drivers/media/platform/aspeed-video.c
>>> +++ b/drivers/media/platform/aspeed-video.c
>>> @@ -518,6 +518,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>>>          aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>>>                              VE_INTERRUPT_MODE_DETECT);
>>>
>>> +       /* Disable mode detect in order to re-trigger */
>>> +       aspeed_video_update(video, VE_SEQ_CTRL,
>>> +                           VE_SEQ_CTRL_TRIG_MODE_DET, 0);
>>> +
>>>          /* Trigger mode detect */
>>>          aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
>>>   }
>>> @@ -809,10 +813,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>>>                          return;
>>>                  }
>>>
>>> -               /* Disable mode detect in order to re-trigger */
>>> -               aspeed_video_update(video, VE_SEQ_CTRL,
>>> -                                   VE_SEQ_CTRL_TRIG_MODE_DET, 0);
>>> -
>>>                  aspeed_video_check_and_set_polarity(video);
>>>
>>>                  aspeed_video_enable_mode_detect(video);
>>> --
>>> 2.25.1
>>>
-- 
Best Regards
Jammy

