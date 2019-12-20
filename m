Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C508B127386
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 03:32:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fCSz0WmFzDqvT
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 13:32:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=cheng.c.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fCSB1C6gzDqjv
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 13:31:52 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 18:31:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,334,1571727600"; d="scan'208";a="248544776"
Received: from cyang29-mobl1.ccr.corp.intel.com (HELO [10.239.192.102])
 ([10.239.192.102])
 by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2019 18:31:47 -0800
Subject: Re: Power Supply Cold Redundancy
To: Lei YU <mine260309@gmail.com>
References: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
 <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
From: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
Message-ID: <33a034df-8e29-681e-f83d-aa496f558d4f@linux.intel.com>
Date: Fri, 20 Dec 2019 10:31:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Originally, I also thought I may push my code to phosphor-power, but 
when I was trying to devtool modify phosphor-power, I found a error happen

ERROR: Nothing PROVIDES 'openpower-dbus-interfaces' (but 
/home/cyang29/openbmc-openbmc/meta-phosphor/recipes-phosphor/power/phosphor-power_git.bb 
DEPENDS on or otherwise requires it).

We do not use openpower-dbus-interfaces.

On 12/20/2019 10:06 AM, Lei YU wrote:
> On Fri, Dec 20, 2019 at 9:13 AM Yang, Cheng C
> <cheng.c.yang@linux.intel.com> wrote:
>> Hi Brad & James,
>>
>>       I am going to upstream an Intel specific feature called Power
>> Supply Cold Redundancy which is to keep one PSU in standby mode when
>> there are two PSU on the system.
>>
>> You can get more information about this feature in design doc
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27637
>>
>> My question is which repo should I push the code, is there any exist
>> repo maintain all PSU related features? If not can you help to create a
>> repo for this?
> phosphor-power is the repo for power supply related services and
> tools, and it has a C++ i2c library that could be used to interact
> with i2c devices.
> It looks like a good place to add the service.
>
> Be noted that if you have PSU driver bind to the device, e.g. for PSU
> vin/vout/fault monitor, it's not possible to do i2c read/write
> directly, unless you unbind the driver.
