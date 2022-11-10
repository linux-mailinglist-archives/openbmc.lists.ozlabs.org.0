Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE26239C4
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 03:26:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N75Kx6r3hz3cMN
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 13:25:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N75KZ1cn4z2yHc;
	Thu, 10 Nov 2022 13:25:35 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2AA21AR2098463;
	Thu, 10 Nov 2022 10:01:10 +0800 (GMT-8)
	(envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Nov
 2022 10:24:48 +0800
Message-ID: <7860c838-a3cd-d4e5-43d0-fe504138e1ef@aspeedtech.com>
Date: Thu, 10 Nov 2022 10:24:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Log spam from aspeed-video driver
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Zev Weiss <zev@bewilderbeest.net>
References: <Y1dX9r9ybGjBrW0k@hatter.bewilderbeest.net>
 <CACPK8XfQhaG2pb6=0YL6J3ME2XLxuQdV37tTuoOX5-05c7pDnQ@mail.gmail.com>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <CACPK8XfQhaG2pb6=0YL6J3ME2XLxuQdV37tTuoOX5-05c7pDnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2AA21AR2098463
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

Thanks for your advice.

On 2022/11/10 上午 07:54, Joel Stanley wrote:
> On Tue, 25 Oct 2022 at 03:29, Zev Weiss <zev@bewilderbeest.net> wrote:
>> Hi all,
>>
>> Since the recent update of the OpenBMC kernel to 6.0, I've been seeing a
>> lot of new log noise from aspeed-video driver when the host is powered
>> off after having been on:
>>
>>       [  335.526279] aspeed-video 1e700000.video: Timed out; first mode detect
>>       [  335.544172] aspeed-video 1e700000.video: No signal; don't start frame
>>       [  337.165555] aspeed-video 1e700000.video: Timed out; first mode detect
>>       [  337.186214] aspeed-video 1e700000.video: No signal; don't start frame
>>       [  338.815501] aspeed-video 1e700000.video: Timed out; first mode detect
>>       [  338.834008] aspeed-video 1e700000.video: No signal; don't start frame
>>
>> It just emits that pair of messages continuously, about every 1.6
>> seconds.
> Our current generation machines don't use the bmc kvm setup, so this
> hasn't seen much testing by IBM.
>
> I'd like to hear from aspeed. If this is a problem with the driver
> then it's something to look into. If it's log spam then we should put
> it back to a dbg call.
>
>> Looking through the commit history of the driver, it looks like that
>> stems from commit a3de90afe392 ("media: aspeed: use
>> v4l2_info/v4l2_warn/v4l2_dbg for log"), which converted a bunch of print
>> calls from dev_dbg() to various v4l2_*() calls.  Reverting to the old
>> 5.15 kernel (which didn't include that change), I found by enabling the
>> dev_dbg() prints via sysfs (and cranking up the console loglevel) that
>> the conditions triggering those messages have been happening all along,
>> I just hadn't been seeing them because the debug prints were disabled by
>> default.
>>
>> I should note that aside from the dmesg spam I don't see any functional
>> problems with the driver; obmc-ikvm works as expected.
>>
>> Was switching those dev_dbg() calls to v4l2_warn() instead of v4l2_dbg()
>> intentional?  Does this indicate some latent bug that should be fixed,
>> or should they just be converted to v4l2_dbg()?

vl42_warn was used to warn the user something unexpected happen. But 
since these

things can be corrected and won't affect the user expericen,  I will 
update a patch to use

v4l2_dbg rather than v4l2_warn.

>>
>>
>> Thanks,
>> Zev
>>
-- 
Best Regards
Jammy

