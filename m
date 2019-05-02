Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2411FB2
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 18:05:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w0V03kNfzDqWC
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 02:05:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w0CP15z2zDqSR
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 01:52:47 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 08:52:44 -0700
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; d="scan'208";a="139319253"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.251.24.64])
 ([10.251.24.64])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
 02 May 2019 08:52:44 -0700
Subject: Re: A question about phosphor-sel-logger
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
References: <f68b269b1a854bfabfb021c1ae1955cc@quantatw.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <04fa16ca-4f2a-0f2d-e6ef-8118fd757b0e@linux.intel.com>
Date: Thu, 2 May 2019 08:52:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f68b269b1a854bfabfb021c1ae1955cc@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 5/1/2019 7:36 PM, Will Liang (±ç¥Ã¹b) wrote:
> Hi,
> 
> Our BMC is using package "phosphor-sel-logger" to support IPMI SEL. it saved the event data in the journal and the id is 1-65534.
> It means it can save 65534 records. Actually, we found the file size of single journal file is around 8MB(the default of journal file is 64MB, it will be separated by 8 files).
> We cannot show all SELs(65534 records) in IPMI. it might be a bug here if we don't limit the maximum.
> 
> Is it necessary to limit the number of SELs to smaller?

Hi Will,

The reason that value is left at 65534 is because in the journal we 
don't have a way to determine how many total SEL entries are possible or 
how much space is left.

With the journal set at 64MB we could see more than 30000 entries.  When 
I made the journal persistent at 6MB, we could see anywhere between 
1200-2000 entries.

We could choose a smaller number for IPMI to report, but it will be 
arbitrary because the journal size can be changed without notifying IPMI.

However, because of the size (1200 entries in 6MB) and other limitations 
with a persistent journal, I'm experimenting with using rsyslog to log 
SEL entries into a syslog file.  This will allow the journal to remain 
volatile while persisting only the logs that we need to.  It will also 
have a more consistent size, so it will be possible to fix the size to a 
smaller number more accurately as you suggest.

You can see my current rsyslog changes here: 
https://gerrit.openbmc-project.xyz/q/topic:"rsyslog+SEL"+(status:open%20OR%20status:merged)

If you are interested, I will also share my rsyslog configuration, but I 
was planning to test it out internally for a while to make sure it will 
work so I don't cause thrash if it has to change again.

Thanks,
-Jason

> 
> BRs,
> Will
> 
