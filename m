Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9EEF02C1
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 17:32:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476wDj66bmzF4hn
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 03:32:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476wCq6WYYzF4hJ
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 03:31:34 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 08:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="402032814"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2019 08:31:30 -0800
Received: from [10.241.244.168] (unknown [10.241.244.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 188FF58045B
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 08:31:30 -0800 (PST)
Subject: Re: sel-logger package issue
To: openbmc@lists.ozlabs.org
References: <8475c2506dda499788d71ff2b0f25e0f@quantatw.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <9dd11b4a-0209-a904-1f63-006231a4c085@linux.intel.com>
Date: Tue, 5 Nov 2019 08:31:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8475c2506dda499788d71ff2b0f25e0f@quantatw.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Will,

On 11/5/2019 4:02 AM, Will Liang (±ç¥Ã¹b) wrote:
> Hi,
> 
> I found that the sel-logger service crashed when the "Value out of range"[1] exception occurred.
> 
> [1]https://github.com/openbmc/phosphor-sel-logger/blob/6afe9560852c6431c43c8e79a28e2b7cb498e355/include/sensorutils.hpp#L166
> 
> It is because the try-catch[2] does not catch the exception type(std::out_of_range).
> Therefore, you can change the catch type to "std::exception" to catch all the exception or only catch the "std::out_of_range" type.
Good catch!  Since the error message is generic, I'm okay with catching 
std::exception (unless others have strong feelings about it).  Please 
submit a patch with the fix.

Thanks!
-Jason

> 
> [2]https://github.com/openbmc/phosphor-sel-logger/blob/6afe9560852c6431c43c8e79a28e2b7cb498e355/include/threshold_event_monitor.hpp#L162
> 
> 
> BRs,
> Will
> 
