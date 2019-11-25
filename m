Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1FF1092B9
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 18:24:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MDRV5xlhzDqZ2
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 04:24:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MDQg5bWSzDqXg
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 04:23:38 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 09:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; d="scan'208";a="408377842"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2019 09:23:34 -0800
Received: from [10.241.244.207] (unknown [10.241.244.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DE108580342;
 Mon, 25 Nov 2019 09:23:33 -0800 (PST)
Subject: Re: phosphor-sel-logger package
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
References: <40989749b52f46a585c025f6e87c2c06@quantatw.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <3f52b692-369e-1374-d7e3-1ae5a733287d@linux.intel.com>
Date: Mon, 25 Nov 2019 09:23:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <40989749b52f46a585c025f6e87c2c06@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Will,

On 11/25/2019 5:06 AM, Will Liang (±ç¥Ã¹b) wrote:
> HI Jason,
> 
> When I use the latest commit(7d5054ac), it can only record one sel log(the latest sel).
> After tracing code I found that the recordId [1] always be 1.
> [1] https://github.com/openbmc/phosphor-sel-logger/blob/7d5054ac15bee9945ac00c470c36c94b565ac8fa/src/sel_logger.cpp#L112
> 
Sorry for the confusion.  This comes from when we ran into issues 
persisting the journal to flash, so we had to move it from the journal 
to rsyslog.

The rsyslog implementation we use is available here: 
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-common/recipes-extended/rsyslog.

I haven't figured out the right way to put this in upstream, yet.

> I have questions about the above situation.
> 
> 1. where the "selLogFilename"[2] file be created?
>    Code [3] checks the file but can't find where to create it in this package.
>    [2] https://github.com/openbmc/phosphor-sel-logger/blob/7d5054ac15bee9945ac00c470c36c94b565ac8fa/include/sel_logger.hpp#L37
>    [3] https://github.com/openbmc/phosphor-sel-logger/blob/7d5054ac15bee9945ac00c470c36c94b565ac8fa/src/sel_logger.cpp#L55
> 
With the configuration above, rsyslog will create and update the 
ipmi_sel file in /var/log as entries get added to the journal.

> 2. After manually creating a file on /var/log/, the sel log behavior is normal. It can log several logs.
>    but after I clear the sel log, the record id does not restart at 1.
>    Commit id : 6afe9560852c6431c43c8e79a28e2b7cb498e355
> 
In intel-ipmi-oem, the clear SEL command deletes the files in /var/log 
to restart the count at 1: 
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L1071.

> BRs,
> will
> 
