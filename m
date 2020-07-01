Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F4210A1D
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 13:09:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xdlV4mjPzDr1P
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 21:09:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xdkl0YgZzDr0X
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 21:08:29 +1000 (AEST)
IronPort-SDR: gn6ebyszD2uO72hbnJNHvyRZJWtcT7Q+1RA8Bbw708zjtbH98K65JwlfB5V5q4TgwROrQCBe9N
 c/WKzga5LKlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="148098271"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="148098271"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 04:08:25 -0700
IronPort-SDR: 4wVKGM0WWTc3V63b7peJqm0iDjMW9Ps6V0t50M8s98pgGLWPUVW/Oq9P+3IBXA+OYg1PH96GXs
 ZUXjdftdb3WA==
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="455067129"
Received: from aambroze-mobl1.ger.corp.intel.com (HELO [10.249.154.40])
 ([10.249.154.40])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 04:08:24 -0700
Subject: Re: "Initial commit" with entire git history - possible?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <6e3f0ebd-9ca0-c5b6-c49a-a533cea6c9ea@linux.intel.com>
 <43a3c7b0-df25-b4a7-13e7-3d944f892420@linux.intel.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <c7907f47-db04-12e2-9812-ee72cde822a9@linux.intel.com>
Date: Wed, 1 Jul 2020 13:08:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <43a3c7b0-df25-b4a7-13e7-3d944f892420@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Brad,

How (as a maintainer) I could 'move' code from our internal repository 
to github/openbmc hosted one? Is it specified somewhere?

Currently I've pushed whole code to gerrit as usual review to gather 
feedback, but after that I would still want to pursue path of pushing 
entire git history + review changes on top  of that.

Regards,
Adrian

W dniu 6/20/2020 o 00:16, James Feist pisze:
> On 6/19/2020 2:10 AM, Adrian Ambrożewicz wrote:
>> Hello,
>>
>> We're developing solution which will soon end as new openbmc-hosted 
>> repository.
>>
>> It would be nice to keep previous commit history intact when moving to 
>> upstream. Is it possible with our gerrit-based integration?
> 
> Maintainers should have push access to move code over, although it'd be 
> nice if code could be developed and reviewed in the open if possible.
> 
>>
>> Regards,
>> Adrian
