Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA373AEA
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 21:55:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v5fj1LSFzDqMK
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 05:55:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v5dn2HCdzDqLW
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 05:54:21 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 12:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,303,1559545200"; d="scan'208";a="171595360"
Received: from unknown (HELO [10.241.240.244]) ([10.241.240.244])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jul 2019 12:53:07 -0700
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: Creating event logs for blackout power losses
To: openbmc@lists.ozlabs.org
References: <77618bc2-0725-c104-1744-7ceca51e2d09@linux.ibm.com>
Message-ID: <fc74bffa-ca1b-1d3d-cb54-1f4be0cae11b@linux.intel.com>
Date: Wed, 24 Jul 2019 12:53:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <77618bc2-0725-c104-1744-7ceca51e2d09@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/28/2019 8:26 AM, Matt Spinler wrote:
> Hi,
> We've been asked by field support to create an OpenBMC event log when we 
> detect that
> we suffered a power blackout, by which I mean the system is up and 
> running, and then the
> BMC suddenly reboots and when it comes back up main power is off. The 
> issue for it is
> https://github.com/ibm-openbmc/dev/issues/677.
> 
> I have a proposal in there for how to detect it in the chassis state 
> manager code, which
> basically just consists of persisting the chassis power state and then 
> checking it against
> the actual value on startup, and an error proposed at
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/22791. 
> 
> Does anyone have any other ideas or thoughts?  Is it OK if we make this 
> the default behavior, or
> would it be preferred we enable it with a compile flag?

Sorry for the late replay as I have been out of the office.

In my testing on this type of failure, I found that there is a race 
condition between the Chassis and BMC losing power after the blackout. 
If the Chassis loses power while the BMC is still active, it can 
sometimes detect it, change the Chassis State to Off, and persist it 
before losing power.  When this happens, the next boot will see only the 
Off state persisted and not detect the blackout.

To work around this, we have added a delay when persisting the Chassis 
State.  In a normal Off, it will be persisted after the delay; in a 
blackout off, the delay will prevent the BMC from persisting the Off 
state allowing the blackout to be detected.

> 
> Thanks,
> Matt
