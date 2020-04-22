Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 661581B453D
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 14:34:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496fy96jgnzDq6Q
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 22:34:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 496fkL42c1zDqYh
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 22:24:10 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: dbus-sensors
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20200422121131.GE196148@heinlein.lan.stwcx.xyz>
Date: Wed, 22 Apr 2020 08:24:06 -0400
Message-Id: <56790A50-40DE-44F5-A043-A91E1C48C8C2@fuzziesquirrel.com>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
 <ED37CD16-CFB6-4D78-BF6E-062849051D02@fuzziesquirrel.com>
 <20200422121131.GE196148@heinlein.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
Content-Transfer-Encoding: quoted-printable
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
 Matt Spinler <mspinler@linux.ibm.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 8:11 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Wed, Apr 22, 2020 at 07:56:14AM -0400, Brad Bishop wrote:
>> at 5:54 PM, James Feist <james.feist@linux.intel.com> wrote:
>>>> 3. After creating this event log, make sure not to do it again until
>>>>    main power is cycled.
>>>
>>> I'd rather this be until the status goes OK again.
>>
>> We have user-experience requirements that the server administrator mus=
t be
>> =E2=80=9Cnagged=E2=80=9D in this fashion when something is broken like=
 this.  Could the
>> behavior be selectable via build switch?  Any other ideas on how to
>> accommodate both behaviors?
>
> This sounds like a form of error filtering.  Shouldn't that decision be
> done at a much higher level in the stack than down in the entity that
> reads the hardware sensor?

Thats an interesting thought.  When the error reporting code sees the err=
or =20
for the first time, it could maintain a list of errors that it needs to =20
=E2=80=9Creplay=E2=80=9D at different system events, like when the server=
 powers on.

This is certainly more flexible and I like the idea - but one down side =20
though is the logging code becomes stateful and the complexity is slightl=
y =20
higher.
