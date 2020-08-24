Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E14042507A8
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 20:31:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb10N2d1JzDqND
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:31:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f;
 helo=mail-il1-x12f.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MxBhGnRg; dkim-atps=neutral
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb0y94NdLzDqMW
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 04:29:03 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id k4so8134567ilr.12
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to; bh=6UVnwscAD+1HR4b5GbRJJUWxifc/XRDnSlBP0jiyKXk=;
 b=MxBhGnRgxznAkCPYsLpNL1z936j1AqRlzztVURQ9bmhpubGwhpkJWcza9K5GUfhpwM
 PnQWWU9YNP8EOPhlFVbto6ujMk6K+7wWmz8ZRLlKZV98mmYVuWpo3JnlVzl2HCVVY2ha
 mSRStltqe5n9Q/axQXFX/POQ7Em0d5Tk4+oh5bmiRgez2SWUPBc00OzSk3xXDIlGkSoC
 FqWIHVSeWDSWGLoEmgRu7Zb2zoDLkdfJnLChNhJNh+syxN7VTWkrfUa+fvZvcMo2z+yb
 pcmkiGd0vjCQN2+K58Ii/XdexQdPgPVZY8ggdD+l/7JthPfSge4pjiBgjDog4lZminy0
 0F7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to;
 bh=6UVnwscAD+1HR4b5GbRJJUWxifc/XRDnSlBP0jiyKXk=;
 b=ZS3vLobahYx3pL+poHMrSZDVkv55MiwwSbNGlCihYa7p9yfDZoncKsuTneoPGkxjl9
 bdeHObiQlZD3WSoh54pYVJabeBJK2OJFaKupu3kCrbQIeOmWigKagOvTtF59yD8fCk23
 ZGjwGZcyMA0tnmwuBFtPm4pgmrHsL43KbbhGEkI0t8mVGqTla/7t1hNgbt/Vcbj9HoDC
 xsd+9NA7gAfKXaD01SN+79WVyQCUDZtaDloVwoGcIp4B9wXwAdtYVlCSOS+cfux9Bv9Q
 cs/8uk1afPEp6COb10tfFRrcMk/TYfOnWvP+JM2H+ey/vNFairRgJHGA0MslqaDR+bE8
 DXbg==
X-Gm-Message-State: AOAM530WeJ48rP7XKWpipp52KJbU6rPfVjNXZhQatviwuicO1inhaAnK
 SSqtYh5yizig1IV5x51M2/7QoIo5gt1ruQ==
X-Google-Smtp-Source: ABdhPJyjys85DC2YytrQf8sTlGy0lo6qhVXmlDHTZhw56A9klFKcXjwh90QsFYiaxblYJZ8SovOtZQ==
X-Received: by 2002:a92:498a:: with SMTP id k10mr5682651ilg.246.1598293740168; 
 Mon, 24 Aug 2020 11:29:00 -0700 (PDT)
Received: from [10.0.11.6] ([199.115.102.154])
 by smtp.gmail.com with ESMTPSA id z9sm7302587ioq.52.2020.08.24.11.28.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2020 11:28:59 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_BAE3F1A3-59AC-4ABF-9111-2A7E2E4F85BD"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: Server Power On mystery
From: Mike Jones <proclivis@gmail.com>
X-Priority: 3 (Normal)
In-Reply-To: <OFA1F61B0D.4E9452AB-ON002585CE.00128E43-002585CE.00128E46@notes.na.collabserv.com>
Date: Mon, 24 Aug 2020 12:28:59 -0600
Message-Id: <F0D0F87A-EEB3-4DBA-9922-5194DE8CC395@gmail.com>
References: <OF0D96B592.C63EA11D-ON002585CE.0011F8B0-002585CE.0012716F@LocalDomain>
 <9DB3C10D-AC72-4508-879A-1E15BB9E4E69@gmail.com>
 <OFA1F61B0D.4E9452AB-ON002585CE.00128E43-002585CE.00128E46@notes.na.collabserv.com>
To: Milton Miller II <miltonm@us.ibm.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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


--Apple-Mail=_BAE3F1A3-59AC-4ABF-9111-2A7E2E4F85BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Milton,

This is giving me a good start and I am digging through the docs.

I want to test my concepts, so for each of these, I=E2=80=99ll write =
what I think is true and you can tell me where I am wrong, and put a =
question where I am not sure.

- BMC power is assumed to be independent from BMC power
- Enabling chassis power can interact with a HotSwap device or power =
path switching device, or an IBC, etc, to power on/off everything in the =
chassis but the BMC
- When the Host is off, does this imply it has no power, or that the =
host is in an idle state and not running but has power applied?
- For the above question, I assume most systems are VRM based
- What about auxiliary supplies? Suppose a design has an FPGA or DSP =
independent from the host. Are these expected to follow chassis or host =
power? In non-CPU systems, the poweron of an FPGA and other support =
chips can have a complicated sequence. Is that handled in an integrated =
fashion with the VRM or independently?

Mike

> On Aug 23, 2020, at 9:22 PM, Milton Miller II <miltonm@us.ibm.com> =
wrote:
>=20
> Resend as plain text.
>=20
>> On August 21, 2020, Mike Jones wrote:>I am trying to understand how
>> the Server power button in the webui
>>> works.
>>>=20
>>> As before, using raspberry pi, and I=E2=80=99ll leave project links =
at the
>>> end for anyone that wants to use them. Things work up to monitoring
>>> voltages. Note the conf project has a phosphor branch for the full
>>> monty.>>To reverse engineer, I setup: dbus-monitor =E2=80=94system >
>> someFile.log
>>>=20
>>> There is a message for systemd1.Manager; member=3DStartUnit and best =
I
>>> can tell, somehow this gets routed to systemd to start some service
>>> or run some exe. I see this mentioned in the dbus transactions:
>>>=20
>>> "obmc-host-start@0.target=E2=80=9D
>>>=20
>>> And that is in /lib/systemd/system and depends
>>> on obmc-host-startmin@0.target, but that does not depend on any
>>> service. So that is a dead end. It also depends on a reboot
>> attempts,
>>> but I think that is not responsible for power on/off.
>>>=20
>>> Then there are chassis services, but I cannot find a link from
>>> obmc-host-start@0.target to objc-chassis-poweron@0.target.
>>=20
>>=20
>>=20
>>>> In this
>>> doc: https://github.com/openbmc/docs/blob/master/architecture/openbm
>> c
>>> -systemd.md
>>>=20
>>> It shows:
>>>=20
>>>=20
>>> ls -1 /lib/systemd/system/obmc-chassis-poweron\@0.target.requires/
>>> op-power-start@0.service op-wait-power-on@0.service>>But when I =
=E2=80=9Cls=E2=80=9D
>> that path, the above dependencies are not there.
>>> There is only a dependency on phosphor-fan-presence-tach@0.service
>>>=20
>>> There is some state service that lead to things with xzy paths, and
>> I
>>> eventually found /run/systemd/units. These have file names starting
>>> with =E2=80=9Cinvocation=E2=80=9D in the names and link to GUID like =
nodes that
>> don=E2=80=99t
>>> =E2=80=9Ccat=E2=80=9D like a normal file. So I am not sure how those =
work. Is there
>>> some kernel driver that works like sysfs so that these nodes are not
>>> traditional files?
>>>=20
>>> What I am trying to understand is two things:
>>>=20
>>> - Interaction with the power regulator
>>> - Interaction with the host cpu
>>>=20
>>> So my hope is someone can connect the dots of the path from the dbus
>>> to systemd through the targets to a service executable doing the
>> work
>>> so I can try to replace them with:
>>>=20
>>> - Something that turns the regulators on/off, with pmbus in this
>>> case.
>>> - Something that can behave like a host to keep the system happy
>> like
>>> a real system.
>>=20
>>=20
>>=20
>> Hi.  There is some design documentation here
>>=20
>> https://github.com/openbmc/docs/blob/master/designs/state-management- =
<https://github.com/openbmc/docs/blob/master/designs/state-management->
>> and-external-interfaces.md
>>=20
>> and that links to phosphor-state-manager which has a lot of the units
>>=20
>> that kick off power and state transitions.
>>=20
>>=20
>> The op-power-start are for systems following the OpenPOWER reference=20=

>> designs.  The regulators are sequenced by an external microcontroller
>>=20
>> based on the state of a POWER_ON gpio from the BMC and a return=20
>> PGOOD to indicate the state.  There are also other op- prefixed units
>> that=20
>> initiate the host processor initialization (after the units check
>> that fans are=20
>> running as you found). =20
>>=20
>> There is also a watchdog that is started when the host is started and
>>=20
>> pinged and stopped via IPMI.
>>=20
>> If you are prototyping for a x86 system, there are alternative=20
>> power implementations where the gpio toggles to represent a=20
>> main power button push and their start cpu sequences.  I think=20
>> there are also arm systems but don't know what they are using=20
>> for host interaction.
>>=20
>> I hope this advances your investigation and learning.
>>=20
>> milton
>>=20
>>>> Mike
>>>=20
>>> My repos
>>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>>>=20
>>> https://github.com/Proclivis/meta-pmbus-raspberrypi.git
>>> https://github.com/Proclivis/meta-pmbus-phosphor.git
>>> https://github.com/Proclivis/conf-openbmc-adi.git
>>>=20
>>> The monitor messages for StartUnit
>>> =E2=80=94=E2=80=94=E2=80=94
>>>=20
>>> method call time=3D1598039669.247458 sender=3D:1.48 ->
>>> destination=3Dorg.freedesktop.systemd1 serial=3D33
>>> path=3D/org/freedesktop/systemd1;
>>> interface=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit
>>>  string "obmc-host-start@0.target"
>>>  string "replace"
>>> method call time=3D1598039669.276170 sender=3D:1.3 ->
>>> destination=3Dorg.freedesktop.DBus serial=3D775
>>> path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus;
>>> member=3DGetConnectionUnixUser
>>>  string ":1.48"
>>> method return time=3D1598039669.276234 sender=3Dorg.freedesktop.DBus =
->
>>> destination=3D:1.3 serial=3D4294967295 reply_serial=3D775
>>>  uint32 0
>>> method call time=3D1598039669.280376 sender=3D:1.3 ->
>>> destination=3Dorg.freedesktop.DBus serial=3D776
>>> path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus;
>>> member=3DAddMatch
>>>  string
>>> "type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/freedesk=
top/
>> D
>>> Bus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChanged',ar=
g0
>> =3D
>>> ':1.48'"
>>> method return time=3D1598039669.280661 sender=3Dorg.freedesktop.DBus =
->
>>> destination=3D:1.3 serial=3D4294967295 reply_serial=3D776
>>> method call time=3D1598039669.280701 sender=3D:1.3 ->
>>> destination=3Dorg.freedesktop.DBus serial=3D777
>>> path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus;
>>> member=3DGetNameOwner
>>>  string ":1.48"
>>> method return time=3D1598039669.280738 sender=3Dorg.freedesktop.DBus =
->
>>> destination=3D:1.3 serial=3D4294967295 reply_serial=3D777
>>>  string ":1.48"
>>> signal time=3D1598039669.280774 sender=3D:1.3 -> destination=3D(null
>>> destination) serial=3D778 path=3D/org/freedesktop/systemd1;
>>> interface=3Dorg.freedesktop.systemd1.Manager; member=3DUnitNew
>>>  string "obmc-host-start@0.target"
>>>  object path
>>> "/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2etarget"
>>> signal time=3D1598039669.280823 sender=3D:1.3 -> destination=3D(null
>>> destination) serial=3D779 path=3D/org/freedesktop/systemd1;
>>> interface=3Dorg.freedesktop.systemd1.Manager; member=3DJobNew
>>>  uint32 1105
>>>  object path "/org/freedesktop/systemd1/job/1105"
>>>  string "obmc-host-start@0.target"
>>> method return time=3D1598039669.280883 sender=3D:1.3 ->
>> destination=3D:1.48
>>> serial=3D780 reply_serial=3D33
>>>  object path "/org/freedesktop/systemd1/job/1105"
>>> signal time=3D1598039669.281305 sender=3D:1.48 -> destination=3D(null
>>> destination) serial=3D34 path=3D/xyz/openbmc_project/state/host0;
>>> interface=3Dorg.freedesktop.DBus.Properties; =
member=3DPropertiesChanged
>>>  string "xyz.openbmc_project.State.Host"
>>>  array [
>>>     dict entry(
>>>        string "RequestedHostTransition"
>>>        variant             string
>>> "xyz.openbmc_project.State.Host.Transition.On"
>>>     )
>>>  ]
>>>  array [
>>>  ]


--Apple-Mail=_BAE3F1A3-59AC-4ABF-9111-2A7E2E4F85BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Milton,<div class=3D""><br class=3D""></div><div =
class=3D"">This is giving me a good start and I am digging through the =
docs.</div><div class=3D""><br class=3D""></div><div class=3D"">I want =
to test my concepts, so for each of these, I=E2=80=99ll write what I =
think is true and you can tell me where I am wrong, and put a question =
where I am not sure.</div><div class=3D""><br class=3D""></div><div =
class=3D"">- BMC power is assumed to be independent from BMC =
power</div><div class=3D"">- Enabling chassis power can interact with a =
HotSwap device or power path switching device, or an IBC, etc, to power =
on/off everything in the chassis but the BMC</div><div class=3D"">- When =
the Host is off, does this imply it has no power, or that the host is in =
an idle state and not running but has power applied?</div><div =
class=3D"">- For the above question, I assume most systems are VRM =
based</div><div class=3D"">- What about auxiliary supplies? Suppose a =
design has an FPGA or DSP independent from the host. Are these expected =
to follow chassis or host power? In non-CPU systems, the poweron of an =
FPGA and other support chips can have a complicated sequence. Is that =
handled in an integrated fashion with the VRM or =
independently?</div><div class=3D""><br class=3D""></div><div =
class=3D"">Mike<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Aug 23, 2020, at 9:22 PM, =
Milton Miller II &lt;<a href=3D"mailto:miltonm@us.ibm.com" =
class=3D"">miltonm@us.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Resend as plain text.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
August 21, 2020, Mike Jones wrote:&gt;I am trying to understand how<br =
class=3D"">the Server power button in the webui<br class=3D""><blockquote =
type=3D"cite" class=3D"">works.<br class=3D""><br class=3D"">As before, =
using raspberry pi, and I=E2=80=99ll leave project links at the<br =
class=3D"">end for anyone that wants to use them. Things work up to =
monitoring<br class=3D"">voltages. Note the conf project has a phosphor =
branch for the full<br class=3D"">monty.&gt;&gt;To reverse engineer, I =
setup: dbus-monitor =E2=80=94system &gt;<br =
class=3D""></blockquote>someFile.log<br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D"">There is a message for =
systemd1.Manager; member=3DStartUnit and best I<br class=3D"">can tell, =
somehow this gets routed to systemd to start some service<br class=3D"">or=
 run some exe. I see this mentioned in the dbus transactions:<br =
class=3D""><br class=3D"">"<a href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a>=E2=80=9D<br class=3D""><br =
class=3D"">And that is in /lib/systemd/system and depends<br class=3D"">on=
 <a href=3D"mailto:obmc-host-startmin@0.target" =
class=3D"">obmc-host-startmin@0.target</a>, but that does not depend on =
any<br class=3D"">service. So that is a dead end. It also depends on a =
reboot<br class=3D""></blockquote>attempts,<br class=3D""><blockquote =
type=3D"cite" class=3D"">but I think that is not responsible for power =
on/off.<br class=3D""><br class=3D"">Then there are chassis services, =
but I cannot find a link from<br class=3D""><a =
href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a> to <a =
href=3D"mailto:objc-chassis-poweron@0.target" =
class=3D"">objc-chassis-poweron@0.target</a>.<br =
class=3D""></blockquote><br class=3D""><br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">In this<br class=3D""></blockquote>doc: <a =
href=3D"https://github.com/openbmc/docs/blob/master/architecture/openbm" =
class=3D"">https://github.com/openbmc/docs/blob/master/architecture/openbm=
</a><br class=3D""></blockquote>c<br class=3D""><blockquote type=3D"cite" =
class=3D"">-systemd.md<br class=3D""><br class=3D"">It shows:<br =
class=3D""><br class=3D""><br class=3D"">ls -1 =
/lib/systemd/system/obmc-chassis-poweron\@0.target.requires/<br =
class=3D""><a href=3D"mailto:op-power-start@0.service" =
class=3D"">op-power-start@0.service</a> <a =
href=3D"mailto:op-wait-power-on@0.service" =
class=3D"">op-wait-power-on@0.service</a>&gt;&gt;But when I =E2=80=9Cls=E2=
=80=9D<br class=3D""></blockquote>that path, the above dependencies are =
not there.<br class=3D""><blockquote type=3D"cite" class=3D"">There is =
only a dependency on <a =
href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a><br class=3D""><br =
class=3D"">There is some state service that lead to things with xzy =
paths, and<br class=3D""></blockquote>I<br class=3D""><blockquote =
type=3D"cite" class=3D"">eventually found /run/systemd/units. These have =
file names starting<br class=3D"">with =E2=80=9Cinvocation=E2=80=9D in =
the names and link to GUID like nodes that<br =
class=3D""></blockquote>don=E2=80=99t<br class=3D""><blockquote =
type=3D"cite" class=3D"">=E2=80=9Ccat=E2=80=9D like a normal file. So I =
am not sure how those work. Is there<br class=3D"">some kernel driver =
that works like sysfs so that these nodes are not<br =
class=3D"">traditional files?<br class=3D""><br class=3D"">What I am =
trying to understand is two things:<br class=3D""><br class=3D"">- =
Interaction with the power regulator<br class=3D"">- Interaction with =
the host cpu<br class=3D""><br class=3D"">So my hope is someone can =
connect the dots of the path from the dbus<br class=3D"">to systemd =
through the targets to a service executable doing the<br =
class=3D""></blockquote>work<br class=3D""><blockquote type=3D"cite" =
class=3D"">so I can try to replace them with:<br class=3D""><br =
class=3D"">- Something that turns the regulators on/off, with pmbus in =
this<br class=3D"">case.<br class=3D"">- Something that can behave like =
a host to keep the system happy<br class=3D""></blockquote>like<br =
class=3D""><blockquote type=3D"cite" class=3D"">a real system.<br =
class=3D""></blockquote><br class=3D""><br class=3D""><br class=3D"">Hi. =
&nbsp;There is some design documentation here<br class=3D""><br =
class=3D""><a =
href=3D"https://github.com/openbmc/docs/blob/master/designs/state-manageme=
nt-" =
class=3D"">https://github.com/openbmc/docs/blob/master/designs/state-manag=
ement-</a><br class=3D"">and-external-interfaces.md<br class=3D""><br =
class=3D"">and that links to phosphor-state-manager which has a lot of =
the units<br class=3D""><br class=3D"">that kick off power and state =
transitions.<br class=3D""><br class=3D""><br class=3D"">The =
op-power-start are for systems following the OpenPOWER reference<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">designs. =
&nbsp;The regulators are sequenced by an external microcontroller<br =
class=3D""><br class=3D"">based on the state of a POWER_ON gpio from the =
BMC and a return<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">PGOOD to indicate the state. &nbsp;There are also other op- =
prefixed units<br class=3D"">that<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">initiate the =
host processor initialization (after the units check<br class=3D"">that =
fans are<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">running as you found). &nbsp;<br class=3D""><br =
class=3D"">There is also a watchdog that is started when the host is =
started and<br class=3D""><br class=3D"">pinged and stopped via IPMI.<br =
class=3D""><br class=3D"">If you are prototyping for a x86 system, there =
are alternative<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">power implementations where the gpio toggles to represent =
a<span class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">main =
power button push and their start cpu sequences. &nbsp;I think<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">there are =
also arm systems but don't know what they are using<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">for host =
interaction.<br class=3D""><br class=3D"">I hope this advances your =
investigation and learning.<br class=3D""><br class=3D"">milton<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><blockquote=
 type=3D"cite" class=3D"">Mike<br class=3D""></blockquote><br =
class=3D"">My repos<br class=3D"">=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94<br class=3D""><br class=3D""><a =
href=3D"https://github.com/Proclivis/meta-pmbus-raspberrypi.git" =
class=3D"">https://github.com/Proclivis/meta-pmbus-raspberrypi.git</a><br =
class=3D"">https://github.com/Proclivis/meta-pmbus-phosphor.git<br =
class=3D"">https://github.com/Proclivis/conf-openbmc-adi.git<br =
class=3D""><br class=3D"">The monitor messages for StartUnit<br =
class=3D"">=E2=80=94=E2=80=94=E2=80=94<br class=3D""><br class=3D"">method=
 call time=3D1598039669.247458 sender=3D:1.48 -&gt;<br =
class=3D"">destination=3Dorg.freedesktop.systemd1 serial=3D33<br =
class=3D"">path=3D/org/freedesktop/systemd1;<br =
class=3D"">interface=3Dorg.freedesktop.systemd1.Manager; =
member=3DStartUnit<br class=3D"">&nbsp;string =
"obmc-host-start@0.target"<br class=3D"">&nbsp;string "replace"<br =
class=3D"">method call time=3D1598039669.276170 sender=3D:1.3 -&gt;<br =
class=3D"">destination=3Dorg.freedesktop.DBus serial=3D775<br =
class=3D"">path=3D/org/freedesktop/DBus; =
interface=3Dorg.freedesktop.DBus;<br =
class=3D"">member=3DGetConnectionUnixUser<br class=3D"">&nbsp;string =
":1.48"<br class=3D"">method return time=3D1598039669.276234 =
sender=3Dorg.freedesktop.DBus -&gt;<br class=3D"">destination=3D:1.3 =
serial=3D4294967295 reply_serial=3D775<br class=3D"">&nbsp;uint32 0<br =
class=3D"">method call time=3D1598039669.280376 sender=3D:1.3 -&gt;<br =
class=3D"">destination=3Dorg.freedesktop.DBus serial=3D776<br =
class=3D"">path=3D/org/freedesktop/DBus; =
interface=3Dorg.freedesktop.DBus;<br class=3D"">member=3DAddMatch<br =
class=3D"">&nbsp;string<br =
class=3D"">"type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/f=
reedesktop/<br class=3D""></blockquote>D<br class=3D""><blockquote =
type=3D"cite" =
class=3D"">Bus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChan=
ged',arg0<br class=3D""></blockquote>=3D<br class=3D""><blockquote =
type=3D"cite" class=3D"">':1.48'"<br class=3D"">method return =
time=3D1598039669.280661 sender=3Dorg.freedesktop.DBus -&gt;<br =
class=3D"">destination=3D:1.3 serial=3D4294967295 reply_serial=3D776<br =
class=3D"">method call time=3D1598039669.280701 sender=3D:1.3 -&gt;<br =
class=3D"">destination=3Dorg.freedesktop.DBus serial=3D777<br =
class=3D"">path=3D/org/freedesktop/DBus; =
interface=3Dorg.freedesktop.DBus;<br class=3D"">member=3DGetNameOwner<br =
class=3D"">&nbsp;string ":1.48"<br class=3D"">method return =
time=3D1598039669.280738 sender=3Dorg.freedesktop.DBus -&gt;<br =
class=3D"">destination=3D:1.3 serial=3D4294967295 reply_serial=3D777<br =
class=3D"">&nbsp;string ":1.48"<br class=3D"">signal =
time=3D1598039669.280774 sender=3D:1.3 -&gt; destination=3D(null<br =
class=3D"">destination) serial=3D778 path=3D/org/freedesktop/systemd1;<br =
class=3D"">interface=3Dorg.freedesktop.systemd1.Manager; =
member=3DUnitNew<br class=3D"">&nbsp;string "<a =
href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a>"<br class=3D"">&nbsp;object =
path<br =
class=3D"">"/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2etarge=
t"<br class=3D"">signal time=3D1598039669.280823 sender=3D:1.3 -&gt; =
destination=3D(null<br class=3D"">destination) serial=3D779 =
path=3D/org/freedesktop/systemd1;<br =
class=3D"">interface=3Dorg.freedesktop.systemd1.Manager; =
member=3DJobNew<br class=3D"">&nbsp;uint32 1105<br class=3D"">&nbsp;object=
 path "/org/freedesktop/systemd1/job/1105"<br class=3D"">&nbsp;string =
"<a href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a>"<br class=3D"">method return =
time=3D1598039669.280883 sender=3D:1.3 -&gt;<br =
class=3D""></blockquote>destination=3D:1.48<br class=3D""><blockquote =
type=3D"cite" class=3D"">serial=3D780 reply_serial=3D33<br =
class=3D"">&nbsp;object path "/org/freedesktop/systemd1/job/1105"<br =
class=3D"">signal time=3D1598039669.281305 sender=3D:1.48 -&gt; =
destination=3D(null<br class=3D"">destination) serial=3D34 =
path=3D/xyz/openbmc_project/state/host0;<br =
class=3D"">interface=3Dorg.freedesktop.DBus.Properties; =
member=3DPropertiesChanged<br class=3D"">&nbsp;string =
"xyz.openbmc_project.State.Host"<br class=3D"">&nbsp;array [<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;dict entry(<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string =
"RequestedHostTransition"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;variant =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st=
ring<br class=3D"">"xyz.openbmc_project.State.Host.Transition.On"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;)<br class=3D"">&nbsp;]<br =
class=3D"">&nbsp;array [<br =
class=3D"">&nbsp;]</blockquote></blockquote></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_BAE3F1A3-59AC-4ABF-9111-2A7E2E4F85BD--
