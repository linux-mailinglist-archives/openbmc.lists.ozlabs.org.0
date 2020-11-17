Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 152162B5E2A
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 12:21:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb3S40GNxzDqSV
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 22:21:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jozef.wludzik@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb3PZ4HYhzDqRF
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 22:19:44 +1100 (AEDT)
IronPort-SDR: +qlKz9vR0WJZhfm9prJgLBfy05V31kDz7EpS8Ua0vyTRlwKQhCBSUTbT3wxVqk2LHwpd/arvnw
 9poj42cSNHEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="157935164"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="157935164"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 03:19:41 -0800
IronPort-SDR: A6N3J4/H30tVyuslnbVknndPmCMUApfOX52k2SV1q4kCJen1XCKEuel56AHAIADJ57qnqM0yZy
 FezxyaphxA7Q==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="358856237"
Received: from jwludzik-mobl.ger.corp.intel.com (HELO [10.213.1.209])
 ([10.213.1.209])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 03:19:40 -0800
Subject: Re: Add peci-pcie repo to CI
To: openbmc@lists.ozlabs.org
References: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
 <eef808e1-34e1-096e-a335-5b6ebbff9964@linux.intel.com>
 <033645AC-B5C4-4FE9-A1DC-BE2030431613@gmail.com>
 <CACWQX815h68gp-BFFMg+5aM-hM8WgyzFYo94cOXo7SXfqDWpuw@mail.gmail.com>
From: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Message-ID: <5024f9ba-ef40-954f-1578-a9353532ff90@linux.intel.com>
Date: Tue, 17 Nov 2020 12:19:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CACWQX815h68gp-BFFMg+5aM-hM8WgyzFYo94cOXo7SXfqDWpuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Sorry for subject, I forgot to change it. It should be "Add telemetry 
report to CI jobs". Mail is not related to peci-pcie.
Great, thanks for help with enabling it. I decreased meson version to 
0.54.3, it is ok for telemetry project. Telemetry required to bump boost 
to 1.74.0 in container to use CI in the latest patches ->

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/38323

Regards,
Jozef

On 11/16/2020 17:36 PM, Ed Tanous wrote:
> On Mon, Nov 16, 2020 at 8:20 AM Andrew Geissler <geissonator@gmail.com> wrote:
>>
>>
>>> On Nov 16, 2020, at 9:32 AM, Wludzik, Jozef <jozef.wludzik@linux.intel.com> wrote:
>>>
>>> Hi OpenBMC,
>>> I am looking for guidance or advice how to enable CI jobs for telemetry repository (https://github.com/openbmc/telemetry <https://github.com/openbmc/telemetry>). Thanks in advance for response.
>>>
>> I added the repo to our CI. I do see this error though:
>>
>> meson.build:1:0: ERROR: Meson version is 0.54.3 but project requires >=0.55.0
> FYI, That package won't build and work until PECI is added back to the
> linux tree.  See discussion below for details as to why, and what you
> can do to help upstream it.
>
> https://lore.kernel.org/openbmc/CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com/
>
>> If you need that level of meson then please submit a gerrit commit to openbmc-build-scripts
>> to update what CI uses:
>> https://github.com/openbmc/openbmc-build-scripts/blob/master/build-unit-test-docker.sh#L284
>>
>>> Thanks,
>>> Jozef
>>>
