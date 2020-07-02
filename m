Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E72212FB1
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 00:53:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yYL36Jm8zDrBZ
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 08:53:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yYK55zHbzDqXD
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 08:52:56 +1000 (AEST)
IronPort-SDR: kvsD5v/afJW/zgIaUdyOg8NFZH6fEuCeoXnEzCRf0fRYdPbXjHbZrxGYg0eddgMQMdDMAegfiR
 OAvTQcvzOxDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="145190014"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="145190014"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 15:52:53 -0700
IronPort-SDR: Jsvpvd8IZhPzqO+CfCf1KQI/Vi4VMzqZAaYfdjPoLbr9v/KXsdgYRn5j3635JK5u7TdheAkN2H
 +iQ6DcojkM/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="296038671"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 02 Jul 2020 15:52:53 -0700
Received: from [10.209.134.10] (jmbills-mobl.amr.corp.intel.com
 [10.209.134.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 63CDA58077A
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 15:52:53 -0700 (PDT)
Subject: Re: Weird build dependency issue causing missing symbols
To: openbmc@lists.ozlabs.org
References: <c99c6e23-a2b4-01de-7cb9-ab035dcf8e01@linux.intel.com>
 <20200702213328.GD3922@heinlein> <20200702214237.GE3922@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <6bf99821-eb01-c0c6-2456-d1dad3bf0421@linux.intel.com>
Date: Thu, 2 Jul 2020 15:52:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200702214237.GE3922@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 7/2/2020 2:42 PM, Patrick Williams wrote:
> On Thu, Jul 02, 2020 at 04:33:28PM -0500, Patrick Williams wrote:
>> On Thu, Jul 02, 2020 at 12:58:43PM -0700, Bills, Jason M wrote:
>>> We have narrowed this down to being caused by two separate issues:
>>> 1. When phosphor-dbus-interfaces is rebuilt it will sometimes change the
>>> order of the PropertiesVariant in server.hpp.
>>
>> This sounds like a bug in sdbus++.  We should be sorting the variant
>> parameters or issuing them in array order.  I'll look into it.
> 
> sdbus++: server: fix PropertyVariant order
> https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/34344
> 
Thanks for the quick response!  I tested this change with tainting and 
cleaning phosphor-dbus-interfaces.  It still shows this diff after the 
clean build, but I don't know what is different and it doesn't trigger 
the symbol error:
./tmp/sysroots-components/arm1176jzs/phosphor-dbus-interfaces/usr/include/xyz/openbmc_project/Led/Physical/server.hpp
67d66
<                 uint8_t,
68a68
 >                 uint8_t,

This looks good!  Thanks again!
