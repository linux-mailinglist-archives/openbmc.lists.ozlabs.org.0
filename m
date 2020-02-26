Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0985416F415
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 01:10:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rx600mpQzDqXm
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 11:10:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rx5970KgzDqKL;
 Wed, 26 Feb 2020 11:10:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 16:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; d="scan'208";a="317248380"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga001.jf.intel.com with ESMTP; 25 Feb 2020 16:09:58 -0800
Subject: Re: [PATCH -next] media: aspeed: add AST2600 support
To: Joel Stanley <joel@jms.id.au>
References: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XeiH1iLQbmP+3yJninJtK7rQv=HMVnHzqjPH04V4xW+zg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b13f037d-ac0c-a9e4-d938-da93a6099af4@linux.intel.com>
Date: Tue, 25 Feb 2020 16:09:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XeiH1iLQbmP+3yJninJtK7rQv=HMVnHzqjPH04V4xW+zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 2/25/2020 3:52 PM, Joel Stanley wrote:
> On Tue, 25 Feb 2020 at 19:56, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Video engine in AST2600 has the exactly same register set with
>> AST2500 except VR084 register which provides more precise JPEG
>> size read back. This commit adds support for the difference and
>> adds 'aspeed,ast2600-video-engine' compatible OF string.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for your review!

> Did you post an update to the device tree bindings too?

Device tree bindings and aspeed-g6.dtsi change were merged in
'next-20200225' tag already.

Thanks,

Jae

>> ---
>>   drivers/media/platform/aspeed-video.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 47444a336ebb..7d98db1d9b52 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   // Copyright 2020 IBM Corp.
>> -// Copyright (c) 2019 Intel Corporation
>> +// Copyright (c) 2019-2020 Intel Corporation
>>
>>   #include <linux/atomic.h>
>>   #include <linux/bitfield.h>
>> @@ -132,7 +132,8 @@
>>   #define  VE_COMP_CTRL_HQ_DCT_CHR       GENMASK(26, 22)
>>   #define  VE_COMP_CTRL_HQ_DCT_LUM       GENMASK(31, 27)
>>
>> -#define VE_OFFSET_COMP_STREAM          0x078
>> +#define AST2400_VE_COMP_SIZE_READ_BACK 0x078
>> +#define AST2600_VE_COMP_SIZE_READ_BACK 0x084
>>
>>   #define VE_SRC_LR_EDGE_DET             0x090
>>   #define  VE_SRC_LR_EDGE_DET_LEFT       GENMASK(11, 0)
>> @@ -252,12 +253,17 @@ struct aspeed_video_config {
>>
>>   static const struct aspeed_video_config ast2400_config = {
>>          .jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
>> -       .comp_size_read = VE_OFFSET_COMP_STREAM,
>> +       .comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>>   };
>>
>>   static const struct aspeed_video_config ast2500_config = {
>>          .jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
>> -       .comp_size_read = VE_OFFSET_COMP_STREAM,
>> +       .comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
>> +};
>> +
>> +static const struct aspeed_video_config ast2600_config = {
>> +       .jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
>> +       .comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
>>   };
>>
>>   static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
>> @@ -1673,6 +1679,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>>   static const struct of_device_id aspeed_video_of_match[] = {
>>          { .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
>>          { .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
>> +       { .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
>>          {}
>>   };
>>   MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
>> --
>> 2.17.1
>>
