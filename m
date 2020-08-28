Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 509D1255EE6
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 18:39:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdQL4571nzDqp5
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 02:39:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdQK93SRYzDqnr
 for <openbmc@lists.ozlabs.org>; Sat, 29 Aug 2020 02:38:52 +1000 (AEST)
IronPort-SDR: Z2AVVG+zKn/3Zgstn1dhaHKcmT/nIchMG/JKVF3wS6uKQ4gRbgji+mMVaV+pWawxksJm617Cyr
 lBWS4t97rVCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="220944031"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="220944031"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:38:48 -0700
IronPort-SDR: b0/+PTllIgBftTfw6/OeoeeYamOItyLB5u7nmIdYSYpv/Oug8DNh+sWfnSSMg8N5idzcbQ4ujj
 tZJMEuEOKTSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="280996912"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.72.161])
 ([10.209.72.161])
 by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2020 09:38:47 -0700
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Alex Qiu <xqiu@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
Date: Fri, 28 Aug 2020 09:38:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Jason Ling <jasonling@google.com>, Josh Lehan <krellan@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/27/2020 2:49 PM, Alex Qiu wrote:
> Hi James,
> 
> After some debugging, I realized that the code I pointed out earlier 
> wasn't the root cause. Update is that, the HwmonTempSensor stops 
> updating after the hwmon driver returns EAGAIN as errno. I'll keep 
> debugging...
> 
> - Alex Qiu
> 
> 
> On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com 
> <mailto:xqiu@google.com>> wrote:
> 
>     Hi James and OpenBMC community,
> 
>     We have a sensor for HwmonTempSensor which doesn't have a valid
>     reading until the host is fully booted. Before it's becoming alive
>     and useful, it's getting disabled in code
>     (https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266)
>     because of errors thrown up by the hwmon driver. Ideally, the
>     thermal control loop should kick the fan to fail safe mode until no
>     more errors are observed.
> 
>     Any suggestions on how we should handle this kind of sensor properly?

For what its worth we use the PowerState property that has options of 
power on or BiosPost to disable scanning when the state is invalid: 
https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208


> 
>     Thank you!
> 
>     - Alex Qiu
> 
