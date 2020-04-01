Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE219B5E1
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 20:46:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48swCT4F11zDr2J
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 05:46:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sw3h4gKHzDr9w
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 05:39:59 +1100 (AEDT)
IronPort-SDR: EExY2tIc6DfzH2qf2rg8lMfnExHc8FrYDvQQGl2JV0ZcU9uhRK7qMB4NPHrjJcddS6eSOW3BJ+
 /Rrzivou8lqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 11:39:56 -0700
IronPort-SDR: SxCgDGRU1eAhd+P2nV7WRn+i0usmqUyQ3a1XcKaTLV/KYYt8xIla1x7NCEy5iLpoApYa0unQeS
 vJqIvXNUAl5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; d="scan'208";a="242823783"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2020 11:39:56 -0700
Received: from [10.212.83.15] (jmbills-mobl.amr.corp.intel.com [10.212.83.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7845A58077B
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 11:39:56 -0700 (PDT)
Subject: Re: Can't not find interface "xyz.openbmc_project.Logging.Entry" in
 intel wolfpass
To: openbmc@lists.ozlabs.org
References: <472f36ef.d33d.17135999deb.Coremail.zhang_cy1989@163.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <aa49220a-eb6e-57dc-fbe2-eeb7c6226112@linux.intel.com>
Date: Wed, 1 Apr 2020 11:39:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <472f36ef.d33d.17135999deb.Coremail.zhang_cy1989@163.com>
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



On 4/1/2020 4:56 AM, zhang_cy1989 wrote:
> Dear All
>       I use the following command inside BMC, but return empty.
>       dbus-send --system --print-reply 
> --dest=xyz.openbmc_project.ObjectMapper 
> /xyz/openbmc_project/object_mapper 
> xyz.openbmc_project.ObjectMapper.GetSubTreePaths string:"/" int32:0 
> array:string:"xyz.openbmc_project.Logging.Entry"
> 
> method return time=5896.731621 sender=:1.27 -> destination=:1.141 
> serial=1425 reply_serial=2
>     array [
>     ]
> 
>      However, I use ipmitool to get sel list in another computer and got 
> those info:
> 
>     1 |  Pre-Init  |0000000121| Temperature #0x0b | Lower Non-critical 
> going low  | Asserted
>     2 |  Pre-Init  |0000000101| Temperature #0x0b | Lower Non-critical 
> going low  | Asserted
>     3 |  Pre-Init  |0000000098| Temperature #0x0b | Lower Non-critical 
> going low  | Asserted
> 
>     I can't find interface "xyz.openbmc_project.Logging.Entry" and can 
> get sel list by ipmitool, why?
In the Intel build, we don't use D-Bus for SEL log entries.  They are 
instead extracted from the journal by rsyslog and stored in a syslog 
file under /var/log.

>     Who could help me? waiting for you.
>     Thanks
> 
> BR
> Felix
> 
> 
