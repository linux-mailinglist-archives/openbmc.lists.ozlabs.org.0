Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA6DC485
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 14:15:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vlP467tLzDqPw
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 23:15:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vlMc2NTBzDrWW
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 23:14:35 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 95B413C5;
 Fri, 18 Oct 2019 08:14:30 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: phosphor-hwmon refactoring proposal
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <cf6f11adb105ae774fa5d1ecf2959f9f64d1b131.camel@ozlabs.org>
Date: Fri, 18 Oct 2019 08:14:30 -0400
Message-Id: <43161B7F-E635-49A8-B145-E3BA19C6236D@fuzziesquirrel.com>
References: <170FEA13-6C0D-4D08-9118-1831E85DD5A8@fuzziesquirrel.com>
 <cf6f11adb105ae774fa5d1ecf2959f9f64d1b131.camel@ozlabs.org>
To: Jeremy Kerr <jk@ozlabs.org>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: Patrick Venture <venture@google.com>, jolie.ku@ibm.com,
 Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 6:26 AM, Jeremy Kerr <jk@ozlabs.org> wrote:

> Hi Brad,
>
>> I have a quick phosphor-hwmon change proposal I=E2=80=99d like to get =
feedback
>> on.
>>
>> One issue with phosphor-hwmon that has been brought up a couple times
>> now  is that it gets its configuration settings from a file with a
>> path in the  filesystem that mirrors the path to the hwmon device in
>> the device tree.   This is problematic because the device tree path is
>> not required to be  stable, so whenever things move around there, the
>> config files all have to  be moved.
>
> Yep, sounds like we should find a better approach.
>
>> The proposal is simply to quit passing the configuration via the
>> environment and instead look for a config file, the location specified
>> via logic in the application, with a path like:
>>
>> /usr/share/phosphor-hwmon/i2c/2-004c.conf
>>
>> This is the path to the hwmon parent device relative to /sys/bus
>
> We want to ensure that any of those paths use persistent kernel
> naming/numbering though. In your example, we would need that i2c bus to
> be guaranteed to be probed as i2c bus id 2.
>
> There are facilities in place to ensure this happens, and as far as I
> know we are currently using those, but we will need to ensure that stay=
s
> the case.

Can you elaborate a tiny bit on what the facilities are?  I just want to =
=20
convince myself we are in fact using those.

> Would this be specific to each bus type? The example for i2c is good, a=
s
> we do have a mechanism for persistent device paths under /sys/bus/i2c/,

We=E2=80=99ll need FSI+sbefifo too for the occ hwmon devices.  Are there =
facilities =20
for stable bus id probing for FSI+sbefifo?

> but the same is not true for other bus types (eg, /sys/bus/platform). T=
o
> handle that, we may want the paths to be of the form:
>
>  /usr/share/phosphor-hwmon/<bus>/<bus-specific-id>.conf

Slightly confused...I thought this is what I was trying to say :-)

The application would be passed the /sys/devices/=E2=80=A6 path on the co=
mmand =20
line, then find that device under /sys/bus/.  Once it has done that, it c=
an =20
extract <bus> and <bus-specific-id> from the discovered /sys/bus/=E2=80=A6=
 path.  =20
It then uses <bus> and <bus-specific-id> to construct the path to the =20
config file, as you=E2=80=99ve spec=E2=80=99ed out.

> Where <bus> is from a predefined set of supported bus types, and

Why must they be pre-defined?  Is it because <bus-specific-id> may not be=
 =20
guaranteed to be stable for a given <bus> and we therefore need to ensure=
 =20
a-priori that they are stable before allowing users to use the program wi=
th =20
hwmon devices on those bus types?

> <bus-specific-id> depends on that; it would typically be the name under
> /sys/bus/<bus>/devices, but we may want to introduce custom mappings
> perhaps?

I can=E2=80=99t think of any use case for custom mappings right now.  I d=
id not =20
think very hard about it though.

Are we desiging anything that would prevent us from adding the custom =20
mappings later when we discover a need for them?

Thanks!

-brad
