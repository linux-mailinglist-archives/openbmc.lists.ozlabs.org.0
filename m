Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF627B75C
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 00:02:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0c2Z0Ws9zDqK1
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 08:02:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=n88WBXv8; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0c1q6p1ZzDqJl
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 08:02:07 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6F0DD806F7;
 Mon, 28 Sep 2020 15:02:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 6F0DD806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1601330525;
 bh=Vwp6F98i7JT3cLQyM1qOaa36J8W3OAKfZl5Zx05YrYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n88WBXv8qcQbgiOt/oDUzngGAENLasISMmOtL86AOdeJsUU8yLHqpC4Cr61YI4A20
 or/iajvhc03uY0iF4731vVU+eURYlfvUB4zJOR4KUJFIt+ziqUwdrWw9ZC67nRZwZS
 2PwPOHKcEilMRRDoddSMOTsdC1rPbaIsBL5jrKb8=
Date: Mon, 28 Sep 2020 17:02:00 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
Message-ID: <20200928220124.k47kocdvi2ahgtc6@hatter.bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-3-zev@bewilderbeest.net>
 <51512c43-ee82-17b5-71c4-35849b1f0922@linux.intel.com>
 <20200928195423.3kftebgltdmpronq@hatter.bewilderbeest.net>
 <28b289f1-0ef0-2432-f71b-0ca4420a39e2@linux.intel.com>
 <20200928210917.idrpngkpduwxe2rf@hatter.bewilderbeest.net>
 <b79f8dfb-8257-943b-3c2b-062840aa2515@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b79f8dfb-8257-943b-3c2b-062840aa2515@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 28, 2020 at 04:32:31PM CDT, Jae Hyun Yoo wrote:
>>Oh I see -- I had thought you were referring to other existing hwmon 
>>drivers in the kernel.
>>
>>As far as I can tell, all those instances appear to be numbering CPU 
>>*sockets* though -- which as Jason mentioned in a call earlier today 
>>I gather is done to line up with motherboard silkscreen labeling.  
>>But in the code in question here we're labeling *cores* within a 
>>given socket, which I don't see arising anywhere in any existing 
>>entity-manager configs.  So I'm still unclear on why we want to use 
>>one-based indexing here instead of zero-based -- I'd think we'd want 
>>the PECI driver to match the PECI spec?
>
>PECI driver uses zero-based index for PECI command handling but label is
>user facing stuff which shouldn't make confusion to users. We can modify
>driver like you did in this patch and previous driver also used
>zero-based indexing but I changed it to natural number based indexing
>to avoid confusion between driver labels and dbus-sensors names.
>Any specific reason for the zero-based indexing? Any benefit?
>

[Re-adding CCs...]

Well, as I see it basically just consistency with a larger set of 
things.  Most other related numbering schemes I'm aware of are 
zero-based -- userspace tools like 'taskset' and 'lscpu', system APIs 
like the <sched.h> CPU_SET() routines, and the kernel's own numbering 
(e.g. what's shown in /proc/cpuinfo) all number processors starting from 
zero, so dbus-sensors seems kind of like the odd one out there.  
(Personally I'd be fully in support of changing it to be zero-based as 
well, though I have no idea offhand about how distruptive a change that 
would be.)

It also seems pretty OpenBMC-specific, whereas I'd expect we want to aim 
for greater generality in things going into mainline.


Thanks,
Zev

