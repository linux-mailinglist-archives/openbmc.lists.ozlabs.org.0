Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835025601A
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 19:54:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdS0s2J7SzDqsN
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 03:54:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdS001BMYzDqnp
 for <openbmc@lists.ozlabs.org>; Sat, 29 Aug 2020 03:54:06 +1000 (AEST)
IronPort-SDR: nQmCXQqf1283xgedCYlA6+WtaHeo1aItpUkJBDvOFsYti8sYbkBrkDYmjAlyMDiLGsbu3tRynn
 bpLQ20YpJhRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="218270436"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="218270436"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 10:54:03 -0700
IronPort-SDR: QEJVoDD18l+JeODusV6aLS2+AkSuITnInd3Us7rG8ydCxCwtx5LwLxYPPM9PUB7CSc1ADhejNZ
 b2Ej8sfIJjUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="281015769"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.72.161])
 ([10.209.72.161])
 by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2020 10:54:02 -0700
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Alex Qiu <xqiu@google.com>
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
Date: Fri, 28 Aug 2020 10:54:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jason Ling <jasonling@google.com>,
 Josh Lehan <krellan@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/28/2020 9:43 AM, Alex Qiu wrote:
> Hi James,
> 
> Thx for the reply! So right now, one thing is that the sensor is not 
> dependent on the power state of the host solely, but also dependent on 
> the boot progress of the host.

Would the BiosPost power state not suffice?

> And the more serious issue is that 
> returning EAGAIN from the driver freezes the sensor, which is what I'm 
> debugging right now. Do we have special treatment on errno returned by 
> the driver? Thx.

I ran into a similar issue with the CPUSensor and this was my fix:
https://github.com/openbmc/dbus-sensors/commit/c22b842bfa8cfe798d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0

I haven't hit this issue with hwmon sensor though.

> 
> - Alex Qiu
> 
> 
> On Fri, Aug 28, 2020 at 9:38 AM James Feist <james.feist@linux.intel.com 
> <mailto:james.feist@linux.intel.com>> wrote:
> 
>     On 8/27/2020 2:49 PM, Alex Qiu wrote:
>      > Hi James,
>      >
>      > After some debugging, I realized that the code I pointed out earlier
>      > wasn't the root cause. Update is that, the HwmonTempSensor stops
>      > updating after the hwmon driver returns EAGAIN as errno. I'll keep
>      > debugging...
>      >
>      > - Alex Qiu
>      >
>      >
>      > On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com
>     <mailto:xqiu@google.com>
>      > <mailto:xqiu@google.com <mailto:xqiu@google.com>>> wrote:
>      >
>      >     Hi James and OpenBMC community,
>      >
>      >     We have a sensor for HwmonTempSensor which doesn't have a valid
>      >     reading until the host is fully booted. Before it's becoming
>     alive
>      >     and useful, it's getting disabled in code
>      >   
>       (https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266)
>      >     because of errors thrown up by the hwmon driver. Ideally, the
>      >     thermal control loop should kick the fan to fail safe mode
>     until no
>      >     more errors are observed.
>      >
>      >     Any suggestions on how we should handle this kind of sensor
>     properly?
> 
>     For what its worth we use the PowerState property that has options of
>     power on or BiosPost to disable scanning when the state is invalid:
>     https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208
> 
> 
>      >
>      >     Thank you!
>      >
>      >     - Alex Qiu
>      >
> 
