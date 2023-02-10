Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 737FA69153E
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 01:15:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCZ4f2rBYz3cff
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 11:15:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Xr0NVssl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Xr0NVssl;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCZ441v0kz3bV1
	for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 11:14:44 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B72BB531;
	Thu,  9 Feb 2023 16:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1675988082;
	bh=8xr4JKGBtjyVH8iE2NnTKRsloX6eBPwF8GAnW6Ulnpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xr0NVsslTOaBHj0kdFLggaRt57QQfNKAc5tjhyVgF3e39jzTUBPNB+vIgT1/QBjac
	 A2TDVhnuXkMdkMLDmDF3y9b2TpPzP3HiUTvIQtMHhOZ6jbf+VRL5rfo1uNuD8noVUl
	 RWATlaxOzuch2oZ7GTZjxlADwlteGtzDDhYlQeBk=
Date: Thu, 9 Feb 2023 16:14:40 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] hwmon: (peci/cputemp) Number cores as seen by host
 system
Message-ID: <Y+WMcCukyTvPcN2F@hatter.bewilderbeest.net>
References: <20230209011632.32668-1-zev@bewilderbeest.net>
 <20230209175001.GA667937@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230209175001.GA667937@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jean Delvare <jdelvare@suse.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 09, 2023 at 09:50:01AM PST, Guenter Roeck wrote:
>On Wed, Feb 08, 2023 at 05:16:32PM -0800, Zev Weiss wrote:
>> While porting OpenBMC to a new platform with a Xeon Gold 6314U CPU
>> (Ice Lake, 32 cores), I discovered that the core numbering used by the
>> PECI interface appears to correspond to the cores that are present in
>> the physical silicon, rather than those that are actually enabled and
>> usable by the host OS (i.e. it includes cores that the chip was
>> manufactured with but later had fused off).
>>
>> Thus far the cputemp driver has transparently exposed that numbering
>> to userspace in its 'tempX_label' sysfs files, making the core numbers
>> it reported not align with the core numbering used by the host system,
>> which seems like an unfortunate source of confusion.
>>
>> We can instead use a separate counter to label the cores in a
>> contiguous fashion (0 through numcores-1) so that the core numbering
>> reported by the PECI cputemp driver matches the numbering seen by the
>> host.
>>
>
>I don't really have an opinion if this change is desirable or not.
>I suspect one could argue either way. I'l definitely want to see
>feedback from others. Any comments or thoughts, anyone ?
>

Agreed, I'd definitely like to get some input from Intel folks on this.

Though since I realize my initial email didn't quite explain this 
explicitly, I should probably clarify with an example how weird the 
numbering can get with the existing code -- on the 32-core CPU I'm 
working with at the moment, the tempX_label files produce the following 
core numbers:

     Core 0
     Core 1
     Core 2
     Core 3
     Core 4
     Core 5
     Core 6
     Core 7
     Core 8
     Core 9
     Core 11
     Core 12
     Core 13
     Core 14
     Core 15
     Core 18
     Core 20
     Core 22
     Core 23
     Core 24
     Core 26
     Core 27
     Core 28
     Core 29
     Core 30
     Core 31
     Core 33
     Core 34
     Core 35
     Core 36
     Core 38
     Core 39

i.e. it's not just a different permutation of the expected core numbers, 
we end up with gaps (e.g. the nonexistence of core 10), and core numbers 
well in excess of the number of cores the processor really "has" (e.g.  
number 39) -- all of which seems like a rather confusing thing to see in 
your BMC's sensor readings.


Thanks,
Zev

