Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39A1B132B
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 19:05:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TlWM1qkMzF3NL
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 03:05:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TlVY6HpXzF4jq;
 Fri, 13 Sep 2019 03:04:20 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 10:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="190048964"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 10:04:16 -0700
Subject: Re: [PATCH -next 1/2] media: aspeed: refine hsync/vsync polarity
 setting logic
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
 <20190910190756.31432-2-jae.hyun.yoo@linux.intel.com>
 <a11026fa-f2bb-47a2-b792-6009c2bbe63d@www.fastmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <564501a5-f4db-b1ed-76b5-9e76c29aa7d4@linux.intel.com>
Date: Thu, 12 Sep 2019 10:04:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a11026fa-f2bb-47a2-b792-6009c2bbe63d@www.fastmail.com>
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On 9/11/2019 10:33 PM, Andrew Jeffery wrote:
> On Wed, 11 Sep 2019, at 04:37, Jae Hyun Yoo wrote:
>> This commit refines hsync/vsync polarity setting logic by making
>> also clearing register bits possible based on probed sync state
>> accordingly.
> 
> That was tough to parse, but I think I understand. Trying to rephrase:
> 
> Enable clearing of hsync/vsync plarity bits based on probed sync state.

Correct.

> What was the issue that drove the change? Do you know why it was done
> the way it was prior to this patch?

Because this driver detects weird resolutions sometimes. Investigated
that it uses
     aspeed_video_update(video, VE_CTRL, 0, ctrl);
so only setting of polarity bits is available. Means that clearing of
the bits isn't available so it can't set back the polarities to normal.

To fix the issue, this patch makes it use
     aspeed_video_write(video, VE_CTRL, ctrl);
instead of above one with adding bit masking code changes.

Thanks,
Jae
