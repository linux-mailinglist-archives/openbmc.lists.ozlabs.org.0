Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F72DD98E
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 20:55:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxjQd2X1nzDqWN
	for <lists+openbmc@lfdr.de>; Fri, 18 Dec 2020 06:55:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxjPc6cKkzDqVd;
 Fri, 18 Dec 2020 06:54:26 +1100 (AEDT)
IronPort-SDR: NUVV54Zfzjukn/qCvQILLDjaT8QLQKaIOilzdQOXIy2oR/o71RZBLwFNlHjp39UmAht2CyyrVW
 ZRmcw8NwXY4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="154544639"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="154544639"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 11:54:23 -0800
IronPort-SDR: FZ2N9ds8QEC0kE8o1hMo8/m1rRrLolO5/ePaqGLg0htBqC3Av5dnv+wi948si0iPkjyWbf+UEx
 /jTymnde4piA==
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="413599052"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.254.113.190])
 ([10.254.113.190])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 11:54:21 -0800
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
To: Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
 <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
 <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
Date: Thu, 17 Dec 2020 11:54:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
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
 Andrew Jeffery <andrew@aj.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Eddie James <eajames@linux.ibm.com>, linux-clk@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On 12/17/2020 2:46 AM, Stephen Boyd wrote:
> Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
>> Hi Joel,
>>
>> On 12/7/2020 6:39 PM, Joel Stanley wrote:
>>> On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> Video engine uses eclk and vclk for its clock sources and its reset
>>>> control is coupled with eclk so the current clock enabling sequence works
>>>> like below.
>>>>
>>>>    Enable eclk
>>>>    De-assert Video Engine reset
>>>>    10ms delay
>>>>    Enable vclk
>>>
>>> This is the case after " clk: ast2600: fix reset settings for eclk and
>>> vclk" is applied, correct? Without that patch applied the reset
>>> sequence is correct by accident for the 2600, but it will be wrong for
>>> the 2500?
>>
>> Correct. Video Engine reset was coupled with eclk for AST2500 and vclk
>> for AST2600 so above sequence was observed only in AST2500. As you said,
>> AST2600 didn't make the issue by accident but the clk/reset pair should
>> be fixed by this patch series.
> 
> So should the two patches be squashed together and go through the
> media tree?
> 

The first patch should go through clk tree, and the second one (this
patch) should go through media tree. Both patches should be applied at
the same time. Should I squash them in this case?
