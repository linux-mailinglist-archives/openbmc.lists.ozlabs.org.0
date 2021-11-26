Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF145E928
	for <lists+openbmc@lfdr.de>; Fri, 26 Nov 2021 09:19:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0nhx6Crcz3c6N
	for <lists+openbmc@lfdr.de>; Fri, 26 Nov 2021 19:19:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0nhf0JDwz306d;
 Fri, 26 Nov 2021 19:19:13 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1AQ7r4nW033248;
 Fri, 26 Nov 2021 15:53:04 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Nov
 2021 16:17:20 +0800
Message-ID: <b6ba49f3-a9ed-f5e6-959c-309db8cce7f6@aspeedtech.com>
Date: Fri, 26 Nov 2021 16:17:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 00/10] add aspeed-jpeg support for aspeed-video
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, <eajames@linux.ibm.com>,
 <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <5ab806d1-e407-1fa4-83ec-93ebe8df7db4@xs4all.nl>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <5ab806d1-e407-1fa4-83ec-93ebe8df7db4@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AQ7r4nW033248
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

Hi Hans,

Please refer to Page 132, 'Video stream data format – ASPEED mode compression' of
https://github.com/AspeedTech-BMC/openbmc/releases/download/v07.02/SDK_User_Guide_v07.02.pdf

Is above information enough??
Or maybe we can postpone this series until the source code for this format ready.
I think I can accomplish it by the end of this year.

On 2021/11/25 下午 10:31, Hans Verkuil wrote:
> Hi Jammy,
>
> I suggest posting a v3 that moves the patches that deal with the
> Aspeed JPEG format to the end of the series. That way I can easily
> merge the patches up to that point, and the Aspeed JPEG support can
> be handled separately.
>
> I'm not sure if it can be merged without that format being documented,
> either in pixfmt-reserved.rst, by implementing support for it in
> libv4lconvert from v4l-utils, or by providing a URL to some other
> publicly available source code. We really don't like adding pixel
> formats that cannot be interpreted by someone without access to the
> datasheets.
>
> Regards,
>
> 	Hans
>
> On 18/11/2021 08:40, Jammy Huang wrote:
>> The aim of this series is to add aspeed-jpeg support for aspeed-video
>> driver.
>>
>> To achieve this major goal some refactors are included.
>>
>> In the last, debugfs information is also updated per this change.
>>
>> Changes in v5:
>>   - Use model data to tell different soc
>>
>> Changes in v4:
>>   - Add definition for the Aspeed JPEG format
>>   - Reserve controls for ASPEED
>>   - Use s_fmt to update format rather than new control
>>   - Update aspeed hq quality range, 1 ~ 12
>>
>>
>> Jammy Huang (10):
>>    media: aspeed: move err-handling together to the bottom
>>    media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log
>>    media: aspeed: add more debug log messages
>>    media: aspeed: refactor to gather format/compress settings
>>    media: v4l: Add definition for the Aspeed JPEG format
>>    media: v4l2-ctrls: Reserve controls for ASPEED
>>    media: aspeed: use model-data
>>    media: aspeed: Support aspeed mode to reduce compressed data
>>    media: aspeed: add comments and macro
>>    media: aspeed: Extend debug message
>>
>>   .../media/uapi/v4l/pixfmt-reserved.rst        |  12 +
>>   drivers/media/platform/aspeed-video.c         | 534 ++++++++++++++----
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>>   include/uapi/linux/aspeed-video.h             |  15 +
>>   include/uapi/linux/v4l2-controls.h            |   5 +
>>   include/uapi/linux/videodev2.h                |   1 +
>>   6 files changed, 467 insertions(+), 101 deletions(-)
>>   create mode 100644 include/uapi/linux/aspeed-video.h
>>
-- 
Best Regards
Jammy

