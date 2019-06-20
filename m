Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028704DB4B
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 22:34:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VD8F1Vq0zDrM9
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 06:34:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VD7h5mmwzDqx1
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 06:34:23 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 13:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,398,1557212400"; d="scan'208";a="335615876"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga005.jf.intel.com with ESMTP; 20 Jun 2019 13:34:21 -0700
Subject: Re: [RFC PATCH dev-5.1 4/6] i2c: aspeed: fix master pending state
 handling
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 C?ric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-5-jae.hyun.yoo@linux.intel.com>
 <4ef34869-3425-1258-2ab6-eecfee063aef@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <5afd2271-e5f4-1358-a1b3-da00a9fc8fb1@linux.intel.com>
Date: Thu, 20 Jun 2019 13:34:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <4ef34869-3425-1258-2ab6-eecfee063aef@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/20/2019 1:30 PM, Tao Ren wrote:
> On 6/20/19 12:49 PM, Jae Hyun Yoo wrote:
>> In case of a master pending state, it should not trigger the master
>> command because this H/W is sharing the same data buffer for slave
>> and master operation, so this commit fixes the issue with making
>> the master command triggering happens when the state goes to active
>> state.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Thank you Jae for the patch. I believe I hit the bug while debugging BMC-BIC multi-master communication on my Minipack ast2500 BMC platform. Let me apply the patch and run some testing, will try to share my results by this Friday (Pacific Time).

Thank you Tao for your help for testing it. It would be really helpful
to complete this patch implementation. Will wait the test results.

Regards,
Jae

> 
> 
> Cheers,
> 
> Tao
> 
