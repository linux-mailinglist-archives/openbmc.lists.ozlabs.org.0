Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D9B23F136
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 18:27:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNW3Z13zxzDqdD
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 02:27:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNW260YSCzDqMd
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 02:24:33 +1000 (AEST)
IronPort-SDR: B+NtIsaeLZblulkttWSFzxwufrw1bkf1Ys4qx09XnShVyvXERBJBYbDB5Gc5E8s+3uNfcb1apk
 PAP2+DXqtHFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="132684553"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="132684553"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 09:24:30 -0700
IronPort-SDR: x/Yw992+8dclqwp0Ydi2ZImQtRDAUS5nNl0lo0xk2IBUgAlaMbFv3uyHWyyR/qoKH1WOOiN5Q0
 CQwxgonSawUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="333587834"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.36.209])
 ([10.209.36.209])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 09:24:29 -0700
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
Date: Fri, 7 Aug 2020 09:24:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/6/2020 3:52 PM, Jason Ling wrote:
> Assuming that you mean "Omit Name attribute from the sensor 
> configuration definition and then change hwmontemp to require any Name.*"
> This won't work since Entity-Manager requires Name (tried it, 
> entity-manager does indeed complain about not finding name).
> 
> My rationale for an omit list vs permit list
> (1) if it's a permit list then everytime you add another temp you want 
> to monitor you need to add to this list..if you want to drop a temp then 
> you have to modify the list again.
> (2) General assumption is that the primary use case is to display all 
> named temperatures which means a permit list is typically large
> (3) adding a permit list also breaks all existing code. Everyone has to 
> go back into their json config and add all the sensor values to the list.
> 
> My rationale for using the value for the "Name" attribute rather than 
> labels or referencing sysfs attributes
> (1) Looking at just the config , it's obvious as to what you're omitting.
> (2) If it's label base, a label change in a driver would mean a breakage 
> in the userspace daemon. Not a big deal; but it can be annoying.
> (3) if it's sysfs attribute based then it's my opinion that it's not as 
> readable.
> 

I'm not a huge fan of this as the PSU sensor already has a way of 
handling this, and it adds a new way of handling it. I'd rather follow 
what is already there. It's already confusing enough that hwmontemp and 
psu do things in slightly different ways.

> 
