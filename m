Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1768419C68C
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 17:56:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tSNq2b4gzDqML
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 02:56:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tSBt2C30zDrWV
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 02:48:05 +1100 (AEDT)
IronPort-SDR: MiKA5SgzmO9Ndmdzp8y7wk/hvALv+bFnBDgRNsaMsycJdjI90Xmiwycpt7WO6+nkMNnL6J2P+J
 EozWa9eTUNAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 08:48:02 -0700
IronPort-SDR: WIpUA4OOrkzReJ64RdIJjzCC0jtp9PZKbc8NeRu2+zZmjNjdfAX3CLhjYuu9tE6yRc9YMnNwzy
 BkCJs/sTNgwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; d="scan'208";a="450972026"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2020 08:48:01 -0700
Received: from [10.251.12.50] (jmbills-mobl.amr.corp.intel.com [10.251.12.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 973EC5802C8;
 Thu,  2 Apr 2020 08:48:01 -0700 (PDT)
Subject: Re: openbmc Digest, Vol 56, Issue 11
To: zhang_cy1989 <zhang_cy1989@163.com>, openbmc@lists.ozlabs.org
References: <mailman.2145.1585766879.27067.openbmc@lists.ozlabs.org>
 <27868164.25af.17138893c91.Coremail.zhang_cy1989@163.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <c9a7eb65-b910-fe41-e49a-22c6f059b572@linux.intel.com>
Date: Thu, 2 Apr 2020 08:48:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27868164.25af.17138893c91.Coremail.zhang_cy1989@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 4/1/2020 6:37 PM, zhang_cy1989 wrote:
> Dear Jason
> 
>>In the Intel build, we don't use D-Bus for SEL log entries.  They are  >instead extracted from the journal by rsyslog and stored in a syslog 
>  >file under /var/log.
> 
> I am still confused.
> Could you give me more info how  SEL works in the intel build?
> 
> I trace the SEL commands in phosphor-ipmi-host, including:
> Get SEL info
> Get SEL Entry
> Delete SEL Entry...
> 
> Those commands need interface:xyz.openbmc_project.Logging.Entry.
> And get object paths by GetSubTreePaths method.
> 
> I don't know how those commands return results in the intel build?
> Can you give me any further tips?
These commands are overridden in intel-ipmi-oem to get the SEL entry 
from /var/log instead of D-Bus.

For example, Get SEL Entry is overridden here:
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L827.

> 
> Thanks
> BR
> Felix
> 
> 
> 
> 
> 
> 
> 
> 
> At 2020-04-02 02:47:59, openbmc-request@lists.ozlabs.org wrote:
>>Send openbmc mailing list submissions to
>>	openbmc@lists.ozlabs.org
>>
>>To subscribe or unsubscribe via the World Wide Web, visit
>>	https://lists.ozlabs.org/listinfo/openbmc
>>or, via email, send a message with subject or body 'help' to
>>	openbmc-request@lists.ozlabs.org
>>
>>You can reach the person managing the list at
>>	openbmc-owner@lists.ozlabs.org
>>
>>When replying, please edit your Subject line so it is more specific
>>than "Re: Contents of openbmc digest..."
>>
>>
>>Today's Topics:
>>
>>   1. OpenBMC Janitor/Gardener (Richard Hanley)
>>   2. Re: New repos request (Bills, Jason M)
>>   3. Re: Can't not find interface
>>      "xyz.openbmc_project.Logging.Entry" in intel wolfpass (Bills, Jason M)
>>   4. Re: OpenBMC Janitor/Gardener (Vijay Khemka)
>>
>>
>>----------------------------------------------------------------------
>>
>>Message: 1
>>Date: Wed, 1 Apr 2020 10:34:53 -0700
>>From: Richard Hanley <rhanley@google.com>
>>To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>Subject: OpenBMC Janitor/Gardener
>>Message-ID:
>>	<CAH1kD+ans6=BbPP9Sut7OQC3Fdt_=+=QEgzyFgyPa_9vwLS0TQ@mail.gmail.com>
>>Content-Type: text/plain; charset="utf-8"
>>
>>Hi,
>>
>>I was recently looking into the linux kernel introduction, and I noticed
>>the kernel janitors https://kernelnewbies.org/KernelJanitors.  It seems
>>like a pretty interesting idea, and I've been thinking about janitorial
>>tasks in OpenBMC.
>>
>>For some context, we've had a handful of new developers join recently, and
>>I've been looking for some small refactoring projects that they could work
>>on upstream.
>>
>>So I guess there are two parts to this email.  First does anyone have some
>>bite sized improvement task that's been on their wishlist, but there hasn't
>>been anyone around to work on it.  (In particular things around bmcweb and
>>phosphor dbus interfaces would be appreciated).
>>
>>The other thing is, what do people think would be the best way to publicize
>>these kinds of refactoring/janitorial/gardening tasks. One way would be to
>>create a *gardening* tag in the github issues.  That way people can set up
>>filters for ideas that experts think are a good idea, but probably won't
>>need deep design discussions to get started.
>>
>>Another way would be to have a monthly/quarterly wishlist gathering on the
>>mailing list.  That way we have some dedicated time to discuss issues of
>>the day, and put them together into a markdown document (like a per project
>>version of the security group wishlist
>>https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list
>>)
>>
>>Maybe this is already happening, and I just haven't noticed it.  Anywho,
>>hope you are all doing well.
>>
>>Cheers,
>>Richard
>>-------------- next part --------------
>>An HTML attachment was scrubbed...
>>URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20200401/c3be5db8/attachment-0001.htm>
>>
>>------------------------------
>>
>>Message: 2
>>Date: Wed, 1 Apr 2020 11:34:32 -0700
>>From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
>>To: openbmc@lists.ozlabs.org
>>Subject: Re: New repos request
>>Message-ID: <e497c65a-7283-f623-2f8f-7a48e3ed6ef7@linux.intel.com>
>>Content-Type: text/plain; charset=utf-8; format=flowed
>>
>>
>>
>>On 3/31/2020 12:58 PM, Vijay Khemka wrote:
>>> 
>>> 
>>> ?On 3/31/20, 12:34 PM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
>>> 
>>>      
>>>      
>>>      On 3/31/2020 10:03 AM, Vijay Khemka wrote:
>>>      > Hi Jason,
>>>      > Can we get some details about these repos like features, usage.
>>>      Sure. I will update the ones that I know below but will have to depend
>>>      on others to add more detail.
>>>      >
>>>      > Regards
>>>      > -Vijay
>>>      >
>>>      > On 3/31/20, 8:45 AM, "openbmc on behalf of Brad Bishop" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of bradleyb@fuzziesquirrel.com> wrote:
>>>      >
>>>      >      at 4:05 PM, Bills, Jason M <jason.m.bills@linux.intel.com> wrote:
>>>      >
>>>      >      > Hi Brad,
>>>      >      >
>>>      >      > We're doing some housekeeping and have some code various places that we'd
>>>      >      > like to move into github.com/openbmc repos.
>>>      >      >
>>>      >      > I'd like to request the following four new repos, if possible:
>>>      >      > host-error-monitor
>>>      This application will monitor various GPIOs and signals from the host
>>>      and take the appropriate action when they are detected.  For example,
>>>      log the event, capture a crashdump, etc.
>>> 
>>> Why can't we use phosphor-gpio-montor for this. In my understanding, phosphor-gpio-monitor
>>> does the same.
>>Sorry, I wasn't aware of phosphor-gpio-monitor.  Right now it is all 
>>GPIOs, so could probably be done there.  Additional monitoring may be 
>>added in the future for non-GPIO signals.
>>
>>>      
>>>      Will be ported from: https://github.com/Intel-BMC/host-error-monitor
>>>      
>>>      >      > libpeci
>>>      This is a library to provide an interface to the PECI driver.
>>>      
>>>      Will be ported from:
>>>      https://github.com/Intel-BMC/provingground/tree/master/libpeci
>>>      
>>>      >      > pfr-manager
>>>      Will be ported from:
>>>      https://github.com/Intel-BMC/provingground/tree/master/intel-pfr-manager
>>>      
>>>      >      > service-config-manager
>>>      Will be ported from:
>>>      https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager
>>>      
>>>      >      >
>>>      >      > Please let me know if you have any questions.  Thanks!
>>>      >      > -Jason
>>>      >
>>>      >      done!
>>>      Thanks, Brad!
>>>      >
>>>      >
>>>      
>>> 
>>
>>
>>------------------------------
>>
>>Message: 3
>>Date: Wed, 1 Apr 2020 11:39:55 -0700
>>From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
>>To: openbmc@lists.ozlabs.org
>>Subject: Re: Can't not find interface
>>	"xyz.openbmc_project.Logging.Entry" in intel wolfpass
>>Message-ID: <aa49220a-eb6e-57dc-fbe2-eeb7c6226112@linux.intel.com>
>>Content-Type: text/plain; charset=UTF-8; format=flowed
>>
>>
>>
>>On 4/1/2020 4:56 AM, zhang_cy1989 wrote:
>>> Dear All
>>>  ???? I use the following command inside BMC, but return empty.
>>>  ???? dbus-send --system --print-reply 
>>> --dest=xyz.openbmc_project.ObjectMapper 
>>> /xyz/openbmc_project/object_mapper 
>>> xyz.openbmc_project.ObjectMapper.GetSubTreePaths string:"/" int32:0 
>>> array:string:"xyz.openbmc_project.Logging.Entry"
>>> 
>>> method return time=5896.731621 sender=:1.27 -> destination=:1.141 
>>> serial=1425 reply_serial=2
>>>  ?? array [
>>>  ?? ]
>>> 
>>>  ??? However, I use ipmitool to get sel list in another computer and got 
>>> those info:
>>> 
>>>  ?? 1 |? Pre-Init? |0000000121| Temperature #0x0b | Lower Non-critical 
>>> going low? | Asserted
>>>  ?? 2 |? Pre-Init? |0000000101| Temperature #0x0b | Lower Non-critical 
>>> going low? | Asserted
>>>  ?? 3 |? Pre-Init? |0000000098| Temperature #0x0b | Lower Non-critical 
>>> going low? | Asserted
>>> 
>>>  ?? I can't find interface "xyz.openbmc_project.Logging.Entry" and can 
>>> get sel list by ipmitool, why?
>>In the Intel build, we don't use D-Bus for SEL log entries.  They are 
>>instead extracted from the journal by rsyslog and stored in a syslog 
>>file under /var/log.
>>
>>>  ?? Who could help me? waiting for you.
>>>  ?? Thanks
>>> 
>>> BR
>>> Felix
>>> 
>>> 
>>
>>
>>------------------------------
>>
>>Message: 4
>>Date: Wed, 1 Apr 2020 18:47:39 +0000
>>From: Vijay Khemka <vijaykhemka@fb.com>
>>To: Richard Hanley <rhanley@google.com>, OpenBMC Maillist
>>	<openbmc@lists.ozlabs.org>
>>Subject: Re: OpenBMC Janitor/Gardener
>>Message-ID: <F7B1155E-705F-402C-A60B-3C7B39E2675C@fb.com>
>>Content-Type: text/plain; charset="utf-8"
>>
>>Hi Richard,
>>Thanks for starting this introduction, I have been also thinking in the same line as having a wishlist per project and we can consolidate it to create pool of small project which can be grabbed by anyone who is interested in contributing. This will also reduce duplication of effort  by multiple people, it can be a common implementation.
>>
>>Regards
>>-Vijay
>>
>>From: openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on behalf of Richard Hanley <rhanley@google.com>
>>Date: Wednesday, April 1, 2020 at 10:37 AM
>>To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>Subject: OpenBMC Janitor/Gardener
>>
>>Hi,
>>
>>I was recently looking into the linux kernel introduction, and I noticed the kernel janitors https://kernelnewbies.org/KernelJanitors<https://urldefense.proofpoint.com/v2/url?u=https-3A__kernelnewbies.org_KernelJanitors&d=DwMFaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=ZzfBQAzaR2vYWK6uVXgOWlcVJRWLg9NTsMm_dxgs4mY&s=rkRy56V3ybhJpI_crtyC3Kwqr2-2tMy6Lky2fIzvYaE&e=>.  It seems like a pretty interesting idea, and I've been thinking about janitorial tasks in OpenBMC.
>>
>>For some context, we've had a handful of new developers join recently, and I've been looking for some small refactoring projects that they could work on upstream.
>>
>>So I guess there are two parts to this email.  First does anyone have some bite sized improvement task that's been on their wishlist, but there hasn't been anyone around to work on it.  (In particular things around bmcweb and phosphor dbus interfaces would be appreciated).
>>
>>The other thing is, what do people think would be the best way to publicize these kinds of refactoring/janitorial/gardening tasks. One way would be to create a *gardening* tag in the github issues.  That way people can set up filters for ideas that experts think are a good idea, but probably won't need deep design discussions to get started.
>>
>>Another way would be to have a monthly/quarterly wishlist gathering on the mailing list.  That way we have some dedicated time to discuss issues of the day, and put them together into a markdown document (like a per project version of the security group wishlist https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list)
>>
>>Maybe this is already happening, and I just haven't noticed it.  Anywho, hope you are all doing well.
>>
>>Cheers,
>>Richard
>>-------------- next part --------------
>>An HTML attachment was scrubbed...
>>URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20200401/a57889e6/attachment.htm>
>>
>>End of openbmc Digest, Vol 56, Issue 11
>>***************************************
> 
> 
> 
