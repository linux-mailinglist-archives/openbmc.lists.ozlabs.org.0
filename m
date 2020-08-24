Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A9250973
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 21:37:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb2SY6qkhzDqDN
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 05:37:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=inxHbaV6; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb2Rl2T8zzDqLh
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 05:36:19 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id k20so3747652otr.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=dZGGlr6TkkBVldkEC7Vv70098oHaReuiyDNB6ca9NDU=;
 b=inxHbaV6By3aKnMTReJYYYw07YKG2pQo7CfHFPcEAYmuYffoWHR8fbyT60nsGSYDQU
 mALpI8TiY0D2mTXN6wNvnIqN0ryCbFk2J+GfSrlf0z6hXOaTpGuS7FEQpf7EugG7TVpD
 F8GSYNdboyffV9cXbicP1i7sFgr0wonrCeM8CzQ2vr0mwqzqAGGo5Qbv2CdG2epMUiIV
 kscMXiSe4uCCKDut6vqrBLwLSyo3S5+o1AGwhnnjU4jv0A3fRKpIdtwhIEl/k6hFuC7H
 g/BU+hq4cNuBO5AcVAn2ibvMv35EOTi7OGZAh8oG9PzUuzC2FbB+XiXGIq7hr3JPG4m7
 Vybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=dZGGlr6TkkBVldkEC7Vv70098oHaReuiyDNB6ca9NDU=;
 b=rkoL+KYmaTsIY0O4r+1E9ilThv3pNWVA3BYehfdoGrUx+Xo5EwbmrfNsjcE3waeBdr
 XbyPAKjL/Eguu3F70R7i3ahDXymN4djNzTGSpKzMp2uwNLgxTTr148uqrtyBMFe5XHQ7
 gZeH1agMmC1t8O4pl7rAGWKNRe/sEYdKfwHRaEqQcP5AO8Yk47w6hytqFI3cX8rSdJeF
 Jb4Cj7Lu5wsyk8YYsAY+/DWFNnh1istcBrJ2cic1/JLYVS9w626fKCKx81wfbzcgWGBs
 rDECPrQJEWGapntKMvOqCm/YZJTyNCcoeOmdD01MwSqVcb6UmdzqEN2UuRukNvQ0G4GX
 xyfg==
X-Gm-Message-State: AOAM530q7JA91MeQ1TGQlPVa9pPJEVJOuURSr31XoWumQF2X86pMIT2Y
 75xMYRqBagV2lrgi1Oteyqu0LSFDoVkxJw==
X-Google-Smtp-Source: ABdhPJzdla3X85RLRjiuj9N2yCBPSrk9tOBPRCYe/lY6c3pVKAy+mRW9ptIgUJ8BYEJfVBb6T/CxiA==
X-Received: by 2002:a05:6830:45b:: with SMTP id
 d27mr4801546otc.312.1598297771662; 
 Mon, 24 Aug 2020 12:36:11 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:dba:1777:baf7:5859?
 ([2601:281:c001:2359:dba:1777:baf7:5859])
 by smtp.gmail.com with ESMTPSA id a15sm2106355oid.49.2020.08.24.12.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 12:36:11 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Server Power On mystery
Date: Mon, 24 Aug 2020 13:36:10 -0600
Message-Id: <78CB9EC6-C56D-4F67-A47D-62A9BBA2ECCD@gmail.com>
References: <659E5458-DE76-4F81-AD1A-95F7780F9606@gmail.com>
In-Reply-To: <659E5458-DE76-4F81-AD1A-95F7780F9606@gmail.com>
To: Ed Tanous <ed@tanous.net>
X-Mailer: iPhone Mail (17G80)
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

So for example, if a system had a PMbus HotSwap, a VR for the CPU, and an au=
xiliary PMBus sequencer for an FPGA, and an I2C mux, and the host and aux su=
pplies required different state management, where they don=E2=80=99t sequenc=
e together, how would that be done? By learning how the current pieces play t=
ogether I can imagine multiple new use cases and prototype them.

As for faking or neutering the host function, it=E2=80=99s just to remove si=
de effects to prove out solutions.

Longer term are goals related to remote update of PMBus device EEPROM. Say, g=
ive file to webui, power supply settings are updated. More on that later fro=
m one of the PMBus technical working group. Stay tuned. But the raspi will b=
e a basis for testing updates, assuming we succeed.=20

These are little different goal than how do I do X for design Y.

What makes it hard is the documentation is not complete and folk knowledge r=
equired is high. I=E2=80=99m not complaining. It=E2=80=99s just reality.

Mike

Sent from my iPhone

> On Aug 24, 2020, at 1:11 PM, Mike <proclivis@gmail.com> wrote:
>=20
> =EF=BB=BFEd,
>=20
> My goals are atypical=20
>=20
> - Understand typical obmc use cases to see how various ADI devices would f=
it in: Hot Swap, Power Sequencers, PMBus regulators=20
> - Try these use cases in raspi by neutering or faking the host
> - Create linux drivers to support obmc
>=20
> Mike
>=20
> Sent from my iPhone
>=20
>> On Aug 24, 2020, at 12:41 PM, Ed Tanous <ed@tanous.net> wrote:
>>=20
>> =EF=BB=BFI think the best thing would be to start off by stating exactly w=
hat
>> you're trying to accomplish, and we can go from there.  As is, you're
>> using a raspberry pi, which doesn't have a "host" in the normal BMC
>> sense, so I'm really confused as to what you're hoping to do with the
>> host power button.  Are you trying to reboot the raspberry pi?  Reboot
>> a host connected through some other means?
>>=20
>> -Ed
>>=20
>>>> On Fri, Aug 21, 2020 at 3:29 PM Mike Jones <proclivis@gmail.com> wrote:=

>>>=20
>>> Hi,
>>>=20
>>> I am trying to understand how the Server power button in the webui works=
.
>>>=20
>>> As before, using raspberry pi, and I=E2=80=99ll leave project links at t=
he end for anyone that wants to use them. Things work up to monitoring volta=
ges. Note the conf project has a phosphor branch for the full monty.
>>>=20
>>> To reverse engineer, I setup: dbus-monitor =E2=80=94system > someFile.lo=
g
>>>=20
>>> There is a message for systemd1.Manager; member=3DStartUnit and best I c=
an tell, somehow this gets routed to systemd to start some service or run so=
me exe. I see this mentioned in the dbus transactions:
>>>=20
>>> "obmc-host-start@0.target=E2=80=9D
>>>=20
>>> And that is in /lib/systemd/system and depends on obmc-host-startmin@0.t=
arget, but that does not depend on any service. So that is a dead end. It al=
so depends on a reboot attempts, but I think that is not responsible for pow=
er on/off.
>>>=20
>>> Then there are chassis services, but I cannot find a link from obmc-host=
-start@0.target to objc-chassis-poweron@0.target.
>>>=20
>>> In this doc: https://github.com/openbmc/docs/blob/master/architecture/op=
enbmc-systemd.md
>>>=20
>>> It shows:
>>>=20
>>>=20
>>> ls -1 /lib/systemd/system/obmc-chassis-poweron\@0.target.requires/
>>> op-power-start@0.service
>>> op-wait-power-on@0.service
>>>=20
>>>=20
>>> But when I =E2=80=9Cls=E2=80=9D that path, the above dependencies are no=
t there. There is only a dependency on phosphor-fan-presence-tach@0.service
>>>=20
>>> There is some state service that lead to things with xzy paths, and I ev=
entually found /run/systemd/units. These have file names starting with =E2=80=
=9Cinvocation=E2=80=9D in the names and link to GUID like nodes that don=E2=80=
=99t =E2=80=9Ccat=E2=80=9D like a normal file. So I am not sure how those wo=
rk. Is there some kernel driver that works like sysfs so that these nodes ar=
e not traditional files?
>>>=20
>>> What I am trying to understand is two things:
>>>=20
>>> - Interaction with the power regulator
>>> - Interaction with the host cpu
>>>=20
>>> So my hope is someone can connect the dots of the path from the dbus to s=
ystemd through the targets to a service executable doing the work so I can t=
ry to replace them with:
>>>=20
>>> - Something that turns the regulators on/off, with pmbus in this case.
>>> - Something that can behave like a host to keep the system happy like a r=
eal system.
>>>=20
>>> Mike
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
>>> method call time=3D1598039669.247458 sender=3D:1.48 -> destination=3Dorg=
.freedesktop.systemd1 serial=3D33 path=3D/org/freedesktop/systemd1; interfac=
e=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit
>>>  string "obmc-host-start@0.target"
>>>  string "replace"
>>> method call time=3D1598039669.276170 sender=3D:1.3 -> destination=3Dorg.=
freedesktop.DBus serial=3D775 path=3D/org/freedesktop/DBus; interface=3Dorg.=
freedesktop.DBus; member=3DGetConnectionUnixUser
>>>  string ":1.48"
>>> method return time=3D1598039669.276234 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D775
>>>  uint32 0
>>> method call time=3D1598039669.280376 sender=3D:1.3 -> destination=3Dorg.=
freedesktop.DBus serial=3D776 path=3D/org/freedesktop/DBus; interface=3Dorg.=
freedesktop.DBus; member=3DAddMatch
>>>  string "type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/fr=
eedesktop/DBus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChange=
d',arg0=3D':1.48'"
>>> method return time=3D1598039669.280661 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D776
>>> method call time=3D1598039669.280701 sender=3D:1.3 -> destination=3Dorg.=
freedesktop.DBus serial=3D777 path=3D/org/freedesktop/DBus; interface=3Dorg.=
freedesktop.DBus; member=3DGetNameOwner
>>>  string ":1.48"
>>> method return time=3D1598039669.280738 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D777
>>>  string ":1.48"
>>> signal time=3D1598039669.280774 sender=3D:1.3 -> destination=3D(null des=
tination) serial=3D778 path=3D/org/freedesktop/systemd1; interface=3Dorg.fre=
edesktop.systemd1.Manager; member=3DUnitNew
>>>  string "obmc-host-start@0.target"
>>>  object path "/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2et=
arget"
>>> signal time=3D1598039669.280823 sender=3D:1.3 -> destination=3D(null des=
tination) serial=3D779 path=3D/org/freedesktop/systemd1; interface=3Dorg.fre=
edesktop.systemd1.Manager; member=3DJobNew
>>>  uint32 1105
>>>  object path "/org/freedesktop/systemd1/job/1105"
>>>  string "obmc-host-start@0.target"
>>> method return time=3D1598039669.280883 sender=3D:1.3 -> destination=3D:1=
.48 serial=3D780 reply_serial=3D33
>>>  object path "/org/freedesktop/systemd1/job/1105"
>>> signal time=3D1598039669.281305 sender=3D:1.48 -> destination=3D(null de=
stination) serial=3D34 path=3D/xyz/openbmc_project/state/host0; interface=3D=
org.freedesktop.DBus.Properties; member=3DPropertiesChanged
>>>  string "xyz.openbmc_project.State.Host"
>>>  array [
>>>     dict entry(
>>>        string "RequestedHostTransition"
>>>        variant             string "xyz.openbmc_project.State.Host.Transi=
tion.On"
>>>     )
>>>  ]
>>>  array [
>>>  ]
