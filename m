Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B2E07E5
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 17:51:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yJ0Q280xzDqCt
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 02:51:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yHzh1cCxzDqC6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 02:51:10 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 08:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,216,1569308400"; d="scan'208";a="372571581"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 22 Oct 2019 08:51:07 -0700
Subject: Re: [External] Power-on monitor for phosphor-hwmon question
To: Matt Spinler <mspinler@linux.ibm.com>, Ivan Li11 <rli11@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <97ba4063-0066-4ba5-bd98-03f1b6aa63dd@linux.intel.com>
Date: Tue, 22 Oct 2019 08:51:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/22/19 6:23 AM, Matt Spinler wrote:
> 
> 
> On 10/21/2019 6:02 AM, Ivan Li11 wrote:
>>
>> Hi Team,
>>
>> Does anyone have suggestion for this ?
>>
> Hi, you're right, it doesn't support that yet.  We've had a few internal
> discussions about how to handle that gracefully, though our platforms 
> don't use
> sel-logger, but nothing solid came out of them and we don't have anything
> scheduled yet.
> 
> It would be easy enough to have a watch on the PGOOD property, and then 
> do you
> what you want, like maybe turning off the thresholds.
> 
> I heard that the d-bus sensors repository has some sort of support for 
> this,
> but since we don't use it I'm not sure what all that entails. I think it 
> may
> also force you to replace phosphor-inventor-manager with entity-manager.

It should force you to switch 100%, but you would at least have to run both.

Here's what dbus-sensors does:

https://github.com/openbmc/dbus-sensors/blob/432d1edf7ac86f69558273307a59e4b1cf86b8a6/src/Utils.cpp#L141

Basically just a dbus-match that sets a "powerStatusOn" bool that can be 
queried. Depending on the sensor type thresholds don't get crossed if 
that bool is set. We also have a similar bool for bios post, as some 
sensors come up later after power on.

> 
>> Thanks your great support in advance.
>>
>> *From:*openbmc <openbmc-bounces+rli11=lenovo.com@lists.ozlabs.org> *On 
>> Behalf Of *Ivan Li11
>> *Sent:* Friday, October 18, 2019 5:59 PM
>> *To:* openbmc@lists.ozlabs.org
>> *Subject:* [External] Power-on monitor for phosphor-hwmon question
>>
>> Hi Team,
>>
>> We found that there’s no power-on monitor mechanism in phosphor-hwmon.
>>
>> https://github.com/openbmc/phosphor-hwmon
>>
>> And it will cause incorrect threshold logs to be added to journal log 
>> by ‘sel-logger’ when system is in power off(S5) state.
>>
>> Is there any plan to implement it? Or other repository we can refer to ?
>>
>> Thanks,
>>
>> Ivan
>>
> 
