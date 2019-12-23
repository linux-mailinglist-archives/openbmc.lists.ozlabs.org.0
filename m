Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D91290C0
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 02:48:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47h2M84CqbzDqQL
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 12:48:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=cheng.c.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47h2LP1HxSzDqGT
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 12:48:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Dec 2019 17:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,346,1571727600"; d="scan'208";a="219364600"
Received: from cyang29-mobl1.ccr.corp.intel.com (HELO [10.239.192.99])
 ([10.239.192.99])
 by orsmga003.jf.intel.com with ESMTP; 22 Dec 2019 17:48:05 -0800
Subject: Re: Power Supply Cold Redundancy
To: Brandon Wyman <bjwyman@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
 <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
 <33a034df-8e29-681e-f83d-aa496f558d4f@linux.intel.com>
 <CAARXrtnL8-zpiL73E5E=q9=WcX_BDa31ZbcThBTNyMr1UF1HpQ@mail.gmail.com>
 <B8C11063-6338-4AC3-892C-701EF7ED077E@fuzziesquirrel.com>
 <CAK_vbW1rTmUOLFJARd=OtWX8JVHGOJXA3rEHZ3wj8CpHOHZybQ@mail.gmail.com>
From: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
Message-ID: <1f61578d-368d-e89e-f5c2-108d0b4b0891@linux.intel.com>
Date: Mon, 23 Dec 2019 09:48:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAK_vbW1rTmUOLFJARd=OtWX8JVHGOJXA3rEHZ3wj8CpHOHZybQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wyman,

     X86-power-control only contains some power on/off related features, 
we do not have any plan to put any PSU related feature to it.


Thank you very much!

On 12/21/2019 2:39 AM, Brandon Wyman wrote:
> On Fri, Dec 20, 2019 at 7:13 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>>
>>
>>> On Dec 19, 2019, at 10:15 PM, Lei YU <mine260309@gmail.com> wrote:
>>>
>>> On Fri, Dec 20, 2019 at 10:31 AM Yang, Cheng C
>>> <cheng.c.yang@linux.intel.com> wrote:
>>>> Originally, I also thought I may push my code to phosphor-power, but
>>>> when I was trying to devtool modify phosphor-power, I found a error happen
>>>>
>>>> ERROR: Nothing PROVIDES 'openpower-dbus-interfaces' (but
>>>> /home/cyang29/openbmc-openbmc/meta-phosphor/recipes-phosphor/power/phosphor-power_git.bb
>>>> DEPENDS on or otherwise requires it).
>>>>
>>>> We do not use openpower-dbus-interfaces.
>>> Right, that is a problem, and the good news is that Matt is already moving
>>> openpower-dbus-interfaces into phosphor-dbus-interfaces
>>> (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/27380),
>>> so it will be no problem in future :)
>> This ^ does help but I don’t think its the whole story.  It sounds like phosphor-power needs a meson option to turn off its dependency on org.openpower dbus interfaces…regardless of what repository is providing those.
>>
>> Going a step further - what are the org.openpower interfaces that phosphor-power depends on anyway?  Can they just be moved to xyz.openbmc_project?
>>
>> -brad
> I am not looking to chase anyone away from phosphor-power, but I do
> recall seeing some power supply related commits in x86-power-control,
> which seems to be some intel related repository.
> https://github.com/openbmc/x86-power-control/commits/master
