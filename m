Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709504B433D
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 09:06:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxxdW6zfBz3cDY
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 19:06:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxxdC2kHJz2yLK;
 Mon, 14 Feb 2022 19:06:37 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 21E7vG2C063896;
 Mon, 14 Feb 2022 15:57:16 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Feb
 2022 16:05:44 +0800
Message-ID: <f57759d5-9c2d-5113-3286-4fa03a2c11b2@aspeedtech.com>
Date: Mon, 14 Feb 2022 16:05:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] media: aspeed: Use of_device_get_match_data() helper
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220214032708.854-1-jammy_huang@aspeedtech.com>
 <CACPK8XcLJuWitefi8LTAxDrhzAVe3b88haQYAJRLX5M=ceDg5g@mail.gmail.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8XcLJuWitefi8LTAxDrhzAVe3b88haQYAJRLX5M=ceDg5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 21E7vG2C063896
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

On 2022/2/14 下午 02:34, Joel Stanley wrote:
> On Mon, 14 Feb 2022 at 03:27, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>> Use of_device_get_match_data() to simplify the code.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 3904ded2052a..d4acf84cda9b 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/of.h>
>> +#include <linux/of_device.h>
>>   #include <linux/of_irq.h>
>>   #include <linux/of_reserved_mem.h>
>>   #include <linux/platform_device.h>
>> @@ -2451,7 +2452,6 @@ MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
>>   static int aspeed_video_probe(struct platform_device *pdev)
>>   {
>>          const struct aspeed_video_config *config;
>> -       const struct of_device_id *match;
>>          struct aspeed_video *video;
>>          int rc;
>>
>> @@ -2463,11 +2463,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>>          if (IS_ERR(video->base))
>>                  return PTR_ERR(video->base);
>>
>> -       match = of_match_node(aspeed_video_of_match, pdev->dev.of_node);
>> -       if (!match)
>> -               return -EINVAL;
>> -
>> -       config = match->data;
>> +       config = of_device_get_match_data(&pdev->dev);
> While normally this driver won't have probed without matching on some
> data, it would be sensible to add a check for a null pointer here.

OK, I will have a updated patch for this later.

Thanks for the help.

>>          video->version = config->version;
>>          video->jpeg_mode = config->jpeg_mode;
>>          video->comp_size_read = config->comp_size_read;
>> --
>> 2.25.1
>>
-- 
Best Regards
Jammy

