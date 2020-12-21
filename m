Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA62E0191
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 21:32:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0B406JSLzDqQc
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 07:32:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0B2y0YGRzDqNm;
 Tue, 22 Dec 2020 07:31:52 +1100 (AEDT)
IronPort-SDR: x8ORFaoOsgEme3DsdqpNYvOlEX/QnaiGTrTOuozkp3X/Lta0pEA0O4BPtD/U7bKD8VdqkuyfCY
 DNH4KjFYLcXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="175927613"
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; d="scan'208";a="175927613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 12:31:48 -0800
IronPort-SDR: jbpk4wHi2BbEYcQvfiLDlQ0dffQ71lPrQNFpA2D+HPdRV/+ww2GY8CEgewuCh4WFAjhkuGpbOZ
 FzPmn1B6kvMw==
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; d="scan'208";a="456810261"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.251.28.113])
 ([10.251.28.113])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 12:31:47 -0800
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
To: Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
 <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
 <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
 <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
 <160842289176.1580929.13125223155803124427@swboyd.mtv.corp.google.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <4b67f62c-012b-d6e9-cf98-1093175793c4@linux.intel.com>
Date: Mon, 21 Dec 2020 12:31:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <160842289176.1580929.13125223155803124427@swboyd.mtv.corp.google.com>
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

On 12/19/2020 4:08 PM, Stephen Boyd wrote:
> Quoting Jae Hyun Yoo (2020-12-17 11:54:15)
>> On 12/17/2020 2:46 AM, Stephen Boyd wrote:
>>> Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
>>> So should the two patches be squashed together and go through the
>>> media tree?
>>>
>>
>> The first patch should go through clk tree, and the second one (this
>> patch) should go through media tree. Both patches should be applied at
>> the same time. Should I squash them in this case?
> 
> If one depends on the other, and having the first one breaks something
> unless the second one is applied, then yes they should be squashed
> together.
> 

Okay. Will send a squashed commit as v2.

Thanks,
Jae
