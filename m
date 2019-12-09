Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181E116D5D
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 13:55:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wjpk4jBDzDqKT
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 23:55:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WjnB6W9KzDqDN
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 23:54:05 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: BMC Operating Mode [Manual / Normal]
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1505e06c-65c8-c953-9cd1-f47989a64255@linux.vnet.ibm.com>
Date: Mon, 9 Dec 2019 07:54:02 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9DCFD6EC-430D-426E-9227-508B3D25AF52@fuzziesquirrel.com>
References: <fa89fca6-8b4a-030d-7268-8a97958909f4@linux.vnet.ibm.com>
 <de8d57a1-dbd1-2d29-741a-e265e4fc6f7b@intel.com>
 <1505e06c-65c8-c953-9cd1-f47989a64255@linux.vnet.ibm.com>
To: vishwa <vishwa@linux.vnet.ibm.com>
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



> On Dec 9, 2019, at 6:08 AM, vishwa <vishwa@linux.vnet.ibm.com> wrote:
>=20
> Sorry, resuming the discussion only now. Had to keep the discussion on =
back burner due to other things.
>=20
> Ed, I am not sure if you are still watching this space..
>=20
> On 8/14/19 2:33 AM, Ed Tanous wrote:
>> On 8/9/19 12:13 AM, vishwa wrote:
>>> Hi All,
>>>=20
>>> IBM systems have a need to run BMC either in Manual or Normal Mode. =
What
>>> it means is this:
>>>=20
>>> Manual: It's mostly a lab / debug mode, where in the system would be
>>> booted with recovery disabled.
>>> For example: If we enter Quiesce state as part of power-on, then BMC
>>> remains in Quiesce state and would *not* attempt to re power-on and
>>> reboot the system.
>>>=20
>>> Normal: This is the default customer mode with recovery enabled in =
BMC.
>>> For example: If we enter Quiesce state as part of power-on, then an
>>> attempt will automatically be done to re power-on and boot the =
system.
>> We have a very similar mechanism in our non-OpenBMC stack.  We would
>> likely be interested in a generic interface for it, although the =
details
>> are different, as the BMC doesn't really monitor Quiesce, but the =
state
>> of the boot through ACPI and power rails.
>>=20
> How about having a policy defined in "xyz/openbmc_project/setting/" ?.
>=20
>>> There are other use-cases, where BMC does a Automatic power-on after
>>> coming back from an AC loss. Manual / Normal would influence this.
>> This is classically a separate setting called "power restore policy". =
 I
>> suspect you likely want to keep these separate as well, as the power
>> policy is something that a user is likely to set independent of
>> lab/debug/manual mode.
>>=20
> Yes.. 2 different things. However, if the user has set "power restore =
--> yes" and then set the mode to "Manual", then "power restore" will =
behave as if nothing was set.
>=20
> So, this proposed mode [Normal/Maintenance] is sort of a gate-keeper =
for any of these recovery actions.

This sounds like settings controlling other settings.  Do you have a =
list of all the settings that get ignored when this setting is active?

Rather than make all the code look at another setting, one idea for =
implementing this would be to turn on/off all the associated settings.  =
Would that work?

thx - brad=
