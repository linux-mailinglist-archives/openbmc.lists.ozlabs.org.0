Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853849C0D4
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 02:42:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk60h0yBkz30QY
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 12:42:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jk60M6d90z2ygC;
 Wed, 26 Jan 2022 12:42:09 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20Q1Y3Zk090248;
 Wed, 26 Jan 2022 09:34:03 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 26 Jan
 2022 09:41:26 +0800
Message-ID: <8681fe29-69c2-f701-aff4-c27cef2d32d7@aspeedtech.com>
Date: Wed, 26 Jan 2022 09:41:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/2] Fix incorrect resolution detected
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, "eajames@linux.ibm.com"
 <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <20220118100729.7651-1-jammy_huang@aspeedtech.com>
 <c3202b1f-ff8f-8108-e8a3-8710c8c74d10@xs4all.nl>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <c3202b1f-ff8f-8108-e8a3-8710c8c74d10@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20Q1Y3Zk090248
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2022/1/25 下午 06:43, Hans Verkuil wrote:
> Hi Jammy,
>
> On 18/01/2022 11:07, Jammy Huang wrote:
>> This series fixes incorrect resolution detected.
>> We found this problem happened occasionally in the switch between bios
>> and bootloader.
> Can you rebase this on top of:
>
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.18f
>
> This series doesn't apply cleanly.

OK, I will update patch based on this code base.

Regards,

	Jammy

>
> Regards,
>
> 	Hans
>
>> Changes in v4:
>>   - Correct the subject of patch
>>
>> Changes in v3:
>>   - In v2, we tried to increase the min-required-count of stable signal
>>     to avoid incorrect transient state in timing detection. But it is
>>     not working for all conditions.
>>     Thus, we go another way in v3. Use regs, which can represent the
>>     signal status, to decide if we needs to do detection again.
>>   
>> Changes in v2:
>>   - Separate the patch into two patches
>>
>> Jammy Huang (2):
>>    media: aspeed: Add macro for the fields of the mode-detect registers
>>    media: aspeed: Fix unstable timing detection
>>
>>   drivers/media/platform/aspeed-video.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
-- 
Best Regards
Jammy

