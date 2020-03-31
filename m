Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32E199F2E
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 21:34:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sKK55NfqzDqQJ
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 06:34:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sKJD6dtlzDqDL
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 06:33:47 +1100 (AEDT)
IronPort-SDR: AwawqI8lFzF2XjyC8T1c3fg2JUbsrCSV7Fa0vPg/jFwLdc0cJw4GC1+7JYgJB7rKIOrvvG15uY
 PNO3Ddiemy0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 12:33:45 -0700
IronPort-SDR: 4vPzUdAtOX2qBve5u4QnpzjhT848da2wBGcmEIpbyx9APo0w34igqU4NMcEr4Iw0oKUG+pwdpV
 oIIxuP1djorA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; d="scan'208";a="448799450"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2020 12:33:44 -0700
Received: from [10.212.186.139] (jmbills-mobl.amr.corp.intel.com
 [10.212.186.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8ADEB580565
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 12:33:44 -0700 (PDT)
Subject: Re: New repos request
To: openbmc@lists.ozlabs.org
References: <7388c9a0-20da-a9a2-af08-76d3e4aca4f1@linux.intel.com>
 <56BA4944-EF73-40E7-9E16-35A327A2DC9B@fuzziesquirrel.com>
 <723777DD-6CF7-4C46-B79D-BE2AAF66C693@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <da673369-58c1-e64a-72ac-75283ae3c7fc@linux.intel.com>
Date: Tue, 31 Mar 2020 12:33:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <723777DD-6CF7-4C46-B79D-BE2AAF66C693@fb.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/31/2020 10:03 AM, Vijay Khemka wrote:
> Hi Jason,
> Can we get some details about these repos like features, usage.
Sure. I will update the ones that I know below but will have to depend 
on others to add more detail.
> 
> Regards
> -Vijay
> 
> ﻿On 3/31/20, 8:45 AM, "openbmc on behalf of Brad Bishop" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of bradleyb@fuzziesquirrel.com> wrote:
> 
>      at 4:05 PM, Bills, Jason M <jason.m.bills@linux.intel.com> wrote:
>      
>      > Hi Brad,
>      >
>      > We're doing some housekeeping and have some code various places that we'd
>      > like to move into github.com/openbmc repos.
>      >
>      > I'd like to request the following four new repos, if possible:
>      > host-error-monitor
This application will monitor various GPIOs and signals from the host 
and take the appropriate action when they are detected.  For example, 
log the event, capture a crashdump, etc.

Will be ported from: https://github.com/Intel-BMC/host-error-monitor

>      > libpeci
This is a library to provide an interface to the PECI driver.

Will be ported from: 
https://github.com/Intel-BMC/provingground/tree/master/libpeci

>      > pfr-manager
Will be ported from: 
https://github.com/Intel-BMC/provingground/tree/master/intel-pfr-manager

>      > service-config-manager
Will be ported from: 
https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager

>      >
>      > Please let me know if you have any questions.  Thanks!
>      > -Jason
>      
>      done!
Thanks, Brad!
>      
> 
