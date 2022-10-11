Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F775FAD27
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 09:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmmtN5N1fz2xHW
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 18:02:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eTg8F6Wl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eTg8F6Wl;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmmsm5D7wz2xrr
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 18:01:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665471692; x=1697007692;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=VJ/2Si4uV7VO/YZ0RUk6W6sb8YgHkXx9mKLWR0TZcEY=;
  b=eTg8F6Wlj+vNF8UqCMmzQ4lN4gdphZ1r1PS1YA++a6R7cgTPMPRRy1Au
   DB/OTowFvPGm8x5cBjstnCsn0rYi404LkE1gFXA9JkBBC2drZzgfCq1cU
   FBDXaxGrSXhdIdfvDuyJlGrFHJTGGJAEY7h2gEFVBWSGtUluXjWYFLmOK
   lwbZWTbAQZKVpxYQ4145JX09qz0hyAFdq4Bxl2VcGwfqn274X6ZO9Yyj3
   VILRFIelUnqpXQKYx8c7OmbO7U1jbRyYg9ntVtUd2Lk0ob2GvDkTjtKkB
   7m/Fythv/IsKkrLdJPbJppyeGQYdcMs/U7WJmovbvox5zLNwS4fUY87Nc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="303166347"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; 
   d="scan'208";a="303166347"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 00:01:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="768686430"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; 
   d="scan'208";a="768686430"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.175.56]) ([10.249.175.56])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 00:01:27 -0700
Message-ID: <1754fb22-7ea0-06f1-6105-ad4a7259da97@linux.intel.com>
Date: Tue, 11 Oct 2022 15:01:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Unable to connect to a BMC Serial Console
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Shubhabrata Bose <shubhabrata.bose@tcs.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BM1PR01MB24678016E23DB9B97349C7A185209@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
 <c259d074d0e5dae670bfe18155a23db600796afd.camel@codeconstruct.com.au>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <c259d074d0e5dae670bfe18155a23db600796afd.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
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

On 2022-10-11 09:06, Jeremy Kerr wrote:
> Hi Shubh,
> 
>> TCS Confidential
> 
> Really? :)
> 
>> I am new to OpenBMC and I need some help about how to access the BMC
>> console which I am not able to, after many tries.
> 
> Just to confirm - you're referring to the console for the BMC system
> itself, right? As distinct from the host serial.
> 
>> Currently, I have connected my Host Server (i.e., Thinkstation P510 –
>> Intel X86-64 CPU installed with OS: Ubuntu 18.04)
>> with Intel Server Board S2600GZ (OS :Ubuntu 14) which has a BMC chip
>> using aUSB-TTL Serial console cable 
>> (“xcluma Usb To Ttl Serial Cable Debugger For Raspberry Pi Beaglebone
>> Cubietruck”.)
>> The minicom is not showing me any prompt & it’s paused; nothing is
>> going ahead.
> 
> A few things to check:
> 
>  - Where have you attached to the TTL signals? Are you sure that's a 
>    BMC serial port?
>  - What are you expecting to see there? The BMC might only be 
>    outputting console data during boot.
>  - Are you using the correct baud rate? (since there should be 
>    activity on the TX line during boot, you can use this to find the 
>    TX line and set your baud rate)
> 
> I'm not familiar with the S2600GZ, but I have done a bit of OpenBMC
> development using a S2600STB platform, which may be similar. In that
> case, slides 25 and 28 of this might help:
> 
> http://jk.ozlabs.org/docs/lca2021/lca2021%20-%20Server%20platforms%20-%20Jeremy%20Kerr.pdf

I used to have a S2600CO4 board which is the same gen (E5v2) as S2600GZ
and tried some reverse engineering before. Bad news is that the BMC on
that generation seems not running linux, or have some encryption.
binwalk over the BMC image gives nothing, as well as 7zip.

Tried the S2600STB BMC image now, binwalk can detect the kernel and
rootfs, and I can use 7zip to extract the rootfs.

And, yeah, most vendors will hide these UART pins for BMC console on
production hardware, you have to find it in your own. Oscilloscope or
multimeter would help. Or if there is some unsoldered pins around BMC
like that on S2600STB, they got a higher chance to be the UART pin.

> 
> Otherwise, maybe Intel folks here can provide better connection details
> for the GZ.
> 
> Cheers,
> 
> 
> Jeremy
> 
