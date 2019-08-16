Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C690755
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 19:58:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699zv3bkxzDr9W
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 03:58:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4699Wp6rQ5zDsQB
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 03:37:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2019 10:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,394,1559545200"; d="scan'208";a="184974038"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2019 10:37:53 -0700
Subject: Re: [External] Re: ipmitool FRU write question
To: Harry Sung1 <hsung1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
 <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
 <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <7c781d83-b9a4-16e4-6233-7bad9942c04b@intel.com>
Date: Fri, 16 Aug 2019 10:37:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
Content-Type: text/plain; charset=utf-8
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

On 8/16/19 9:52 AM, Harry Sung1 wrote:
> 
> Hi Ed,
> 
> Thanks for your kindly reply! I have surveyed the entity-manager before.
> But I encountered an issue when I using phosphor-inventory-manager and entity-manager at the same time.
> Both of them have same method "Notify" under same interface " xyz.openbmc_project.Inventory.Manager ", but different signature.
> 
> phosphor-inventory-manager:
> NAME                                  TYPE    SIGNATURE   RESULT/VALUE   FLAGS
> xyz.openbmc_project.Inventory.Manager interface -             -             -
> .Notify                               method    a{oa{sa{sv}}} -             -
> 
> entity-manager
> NAME                                  TYPE    SIGNATURE   RESULT/VALUE   FLAGS
> xyz.openbmc_project.Inventory.Manager interface -         -            -
> .Notify                               method    a{sa{sv}} -            -

Looking at the code, there's some irony there.  That function appears to
be implemented for compatibility, as it doesn't actually do anything
except return immediately.
https://github.com/openbmc/entity-manager/blob/b0097d41d206006a6c9a0e464cb87ccbf797921b/src/EntityManager.cpp#L1641

The irony is that (as you've found) it got the interface wrong, so it
doesn't really do anything useful in terms of compatibility.

> 
> So when some services call the 'Notify' method failed because of getting wrong service. 
> Ex: https://github.com/openbmc/ipmi-fru-parser/blob/master/writefrudata.cpp#L206
> Have you ever seen this issue before?

If you are using FruDevice, you should use it in tandem with the command
sets I linked previously.  Given how entity-manager is architected,
there is no concept of a "Notify".  Entity manager relies on the
published ObjectManager interfaces to know when things have been
added/removed.  In the command sets I linked, they interact with
FruDevice directly, so technically entity manager isn't even required
for interacting with the physical fru devices.  Entity manager is used
for reconfiguring the system once the hardware has been detected via
FruDevice.

> 
> Should I use intel-dbus-interfaces if I want to use Frudevice (entity-manager) and write FRU command(intel-ipmi-oem)?
> Or it is compatible with original dbus-interface?

I don't believe anything you've looked at so far requires
intel-dbus-interfaces.  Most of the entity-manager/frudevice bindings
are using sdbusplus directly to create their interfaces.
