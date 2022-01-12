Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F42B48BE77
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 07:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYcXF1mWLz3035
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 17:06:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYcWy098Wz2xsc;
 Wed, 12 Jan 2022 17:06:35 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20C5x3q2088074;
 Wed, 12 Jan 2022 13:59:03 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 Jan
 2022 14:05:40 +0800
Message-ID: <a779f1c1-e5b0-5d55-bc6c-5f253d03525d@aspeedtech.com>
Date: Wed, 12 Jan 2022 14:05:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] media: aspeed: Fix no complete irq for non-64-aligned
 width
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20211214045348.13702-1-jammy_huang@aspeedtech.com>
 <CACPK8XfkXi6M=gzfkYcuoga6WxnzSm2+mspBt4gjop7Ytm+VCA@mail.gmail.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8XfkXi6M=gzfkYcuoga6WxnzSm2+mspBt4gjop7Ytm+VCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20C5x3q2088074
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

OK, thanks for your review. I will send another updated patch per your 
advice.

On 2022/1/12 上午 08:51, Joel Stanley wrote:
> On Tue, 14 Dec 2021 at 04:53, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>> In ast2500, engine will stop occasionally for 1360x768.
>>
>> This is a bug which has been addressed, but the workaround is specific
>> for 1680 only. Here we make it more complete.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 793b2adaa0f5..4d3e6b105d44 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -1055,18 +1055,20 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
>>          /* Set capture/compression frame sizes */
>>          aspeed_video_calc_compressed_size(video, size);
>>
>> -       if (video->active_timings.width == 1680) {
>> +       if (!IS_ALIGNED(act->width, 64)) {
>>                  /*
>>                   * This is a workaround to fix a silicon bug on A1 and A2
> Please add:  "a AST2500 silicon bug" so we know which A1/A2 this is
> referring to.
>
> With that added, you can add:
>
>   Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>>                   * revisions. Since it doesn't break capturing operation of
>>                   * other revisions, use it for all revisions without checking
>> -                * the revision ID. It picked 1728 which is a very next
>> -                * 64-pixels aligned value to 1680 to minimize memory bandwidth
>> +                * the revision ID. It picked new width which is a very next
>> +                * 64-pixels aligned value to minimize memory bandwidth
>>                   * and to get better access speed from video engine.
>>                   */
>> +               u32 width = ALIGN(act->width, 64);
>> +
>>                  aspeed_video_write(video, VE_CAP_WINDOW,
>> -                                  1728 << 16 | act->height);
>> -               size += (1728 - 1680) * video->active_timings.height;
>> +                                  width << 16 | act->height);
>> +               size = width * act->height;
> You could make it clearer by putting the write on one line:
>
>                  aspeed_video_write(video, VE_CAP_WINDOW, width << 16 |
> act->height);

-- 
Best Regards
Jammy

