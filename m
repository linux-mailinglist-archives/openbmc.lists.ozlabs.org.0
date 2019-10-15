Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE1D802E
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 21:25:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t5425zyMzDr0X
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:25:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t4zD2XFPzDr28
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 06:21:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A5D3E5C08B;
 Tue, 15 Oct 2019 15:21:08 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: The type of sensor value in redfish should be double or int64?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <de3911ab-f416-cc87-3d48-b70ce5e57612@intel.com>
Date: Tue, 15 Oct 2019 15:21:08 -0400
Message-Id: <E19C0FD2-2F95-4943-B3CC-D4447D2FABE8@fuzziesquirrel.com>
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
 <de3911ab-f416-cc87-3d48-b70ce5e57612@intel.com>
To: Ed Tanous <ed.tanous@intel.com>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 James Feist <james.feist@linux.intel.com>, Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 1:07 PM, Ed Tanous <ed.tanous@intel.com> wrote:

> On 10/15/19 8:17 AM, Patrick Venture wrote:
>> On Mon, Oct 14, 2019 at 7:57 PM Carol Wang <karo33bug@gmail.com> wrote=
:
>>> Hi,
>>>
>>> I tried to override sensor values with redfish Patch, referring to th=
e =20
>>> Voltages example of =20
>>> https://github.com/openbmc/bmcweb/search?q=3D413961de&type=3DCommits,=
 but =20
>>> met an error "Invalid argument". Comparing the code =20
>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensor=
s.hpp#L2192 =20
>>> and the doc =20
>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/o=
penbmc_project/Sensor/Value.interface.yaml#L21, =20
>>> the current code uses double type, but the doc says the value type =20
>>> should be int64. It seems a scale difference. Why the code uses doubl=
e =20
>>> here?
>
> To my understanding, the phosphor-hwmon sensor system doesn't support
> overriding sensor values at runtime, regardless of whether or not you
> resolved the type issues with the arguments.

I=E2=80=99m just curious=E2=80=A6what is the use-case for writing a volta=
ge sensor=E2=80=A6or any =20
sensor for that matter?  What do you do with the user-supplied value when=
 =20
the sensor is a piece of hardware that does not comprehend setting a =20
value?  This is probably my lack of Redfish-fu showing.

FWIW when I originally defined the Sensor.Value interface, it was meant t=
o =20
be read only.  In fact the documentation says this, even if it is not =20
enforced anywhere:

     All Sensor.Value properties are read-only.

If a device provides some kind of control mechanism there are other =20
interfaces for expressing/modeling those, typically/ideally in the contro=
l =20
namespace.

> If your goal is just "get
> it to work", I'd recommend switching to dbus-sensors (which I realize i=
s
> non-trivial for some systems).  With that said, it would be great to ge=
t
> this int64 to double conversion going again.
>
>
>> The short answer is, code generally authored by Intel uses doubles for
>> the sensor values, whereas the original OpenBMC sensor models used
>> int64.
>>
>> A while back there was a bit of a debate about this, and it looks like
>> we never truly resolved it.  Brad, perhaps this is a good time to?
>> The idea is, that with the int64 storage, we store the raw value and
>> we also store the scaling factor, so that one can scale the number if
>> they choose to.  Sort of keeping the values as they are -- instead of
>> operating on them before publishing them to dbus.  We do notably
>> however, modify values in phosphor-hwmon before publishing them as
>> often there are scaling factors and offsets, beyond the conversion
>> from mC to C.
>>
>> phosphor-host-ipmid's sensor YAML requires the type to be specified
>> for the sensor value interface already, and does validly support both
>> types: int64_t and double (I tested it when I briefly had a mixed
>> environment).
>> phosphor-hwmon reports values without applying the scaling factor, but
>> it is aware of the scaling factor, so it could.
>> phosphor-pid-control works with both types correctly.
>
> bmcweb also works with both types for everything but the PATCH interfac=
e.
>
>> I'm not sure about the phosphor-fan stuff, but I imagine we'll find
>> some arithmetic we can drop where it ingests values.
>>
>> This change from int64 to double is big enough though that many
>> configuration files would need to be adjusted, which is non-trivial.
>> I argue however that having code that doesn't have a common interface
>> or interfaces for sensors is less than ideal.  Having multiple options
>> for talking to sensors is fine, but in my opinion this is only true if
>> they implement different interfaces, or the same interface.  In this
>> case, we have dbus-sensors and phosphor-hwmon which both implement the
>> same interface, but differently: int64 vs double.
>>
>> I think using doubles makes sense at the dbus level because generally
>> one wants that version of the value.  Therefore you end up with code
>> in each daemon that reads the sensor value and the scale so that it
>> can perform the same operation that another daemon is also going to
>> perform, etc.  Instead of just doing it once.
>>
>> I'll climb off my debate box now and climb onto my voting box and say,
>> I'd like to make phosphor-hwmon report the value as double and I'm
>> willing to review incoming patches that address other aspects of the
>> codebase to bring it all together -- since they'll need to be in a
>> locked step-forward.
>
> Another vote for moving to double.  The systems I work on don't use
> phosphor-hwmon, so there's not a lot of ways to test the other
> components.  The pieces that I use (dbus-sensors, phosphor-pid-control,
> bmcweb) all work correctly with double.
>
> The reviews to move to double are still open, unresolved, and James has
> patches to several daemons that need to be converted.
> https://gerrit.openbmc-project.xyz/q/topic:%22double-sensor%22+(status:=
open%20OR%20status:merged)

