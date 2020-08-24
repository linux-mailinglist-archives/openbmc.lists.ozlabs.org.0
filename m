Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB842508ED
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 21:12:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb1wQ0ZQyzDqQC
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 05:12:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jfm7SE3o; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb1vd4B89zDqNr
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 05:11:55 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id j18so4428672oig.5
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 12:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Z244jXPv4vSvLn0E+UsFvP4gfFQMJXXmU2BM07EdIPE=;
 b=jfm7SE3ozGpWy8XUfVgnG8gO304a0ytVAz3OJfiGLR1YkaKu4VL3+uqvajQnpOxV2N
 k/6A4S7ymTxPmyTVbBzzENn/D7XoQF4NU390Yrj4MhGJWzcT+a9sgs1Quw/Iqruvj/fv
 RlvDdXT2/Kgm32RjqznLxzG5tiyOzZsxrJbahVNfIW/7Ef9I578T/kmhX2V+Uk5ca7Ni
 P/XllZwpqZHJyD4VBbyi0/Hk797Hd7zca37/9Og+j7SEzfG8sjNHhTX1KhT9itN4ax4u
 SfBqCkluEFqbYtwITTeuFtDyJ4mal2oP12hIMSvx5gGUUOuBrkOl20ERgmCnfsk3ZVXq
 2V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Z244jXPv4vSvLn0E+UsFvP4gfFQMJXXmU2BM07EdIPE=;
 b=dnXPWzEg84rvuYUwtbGg2roY6KtJM6UzHy+IbbTAaDi/+2tjyd1QGFoXpZrxnbFh/6
 XJ+57UIoh7TjCduvxr1PKFdEOb/90aPLuq64X+IxrA2VrKXNYVIbWebs/hgrS9WgPMP4
 e6ZjVoIW3y+YjSoRV7stBR0gK8Ld9wSyEO5tfw1j79IeoAdHwXP13CVFtKV3VmF1/CtG
 OWXtf2NAZBWWnun6W4fSUySve2xWI2c2sUm/fIvdzXLc6TWGIjKCwWtKZmRrmEWHqull
 dhOtxSpmEZMRoP4ADh8Q1gpwjKMzFZzKliT6fx3mGuHgfCgRdABUD/nxB8UbOF/T3bgp
 TY8A==
X-Gm-Message-State: AOAM531TdhELaqCb0n8eQ3sKg6j8QKXbTg5Sf23Fn3jTRhJdsq87zdEZ
 1YOx4D5ClHUyF6Wwbvp/3obcuNBF4cf7ug==
X-Google-Smtp-Source: ABdhPJwpGWKhoJta9i5rtzWhmHslKCCXPq6APwSKbr1pOvw5w7NeYc6wIWMQX6PRQdx+eB8ifraDmw==
X-Received: by 2002:aca:130e:: with SMTP id e14mr553169oii.21.1598296308101;
 Mon, 24 Aug 2020 12:11:48 -0700 (PDT)
Received: from ?IPv6:2600:100e:b00b:ffb8:5086:70c7:8107:59db?
 ([2600:100e:b00b:ffb8:5086:70c7:8107:59db])
 by smtp.gmail.com with ESMTPSA id 102sm2207922oth.3.2020.08.24.12.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 12:11:47 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Server Power On mystery
Date: Mon, 24 Aug 2020 13:11:45 -0600
Message-Id: <659E5458-DE76-4F81-AD1A-95F7780F9606@gmail.com>
References: <CACWQX83ErNXrvAR47+FHXGTiQhvx9FnhuXqebxxwYYvK+-cioA@mail.gmail.com>
In-Reply-To: <CACWQX83ErNXrvAR47+FHXGTiQhvx9FnhuXqebxxwYYvK+-cioA@mail.gmail.com>
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

Ed,

My goals are atypical=20

- Understand typical obmc use cases to see how various ADI devices would fit=
 in: Hot Swap, Power Sequencers, PMBus regulators=20
- Try these use cases in raspi by neutering or faking the host
- Create linux drivers to support obmc

Mike

Sent from my iPhone

> On Aug 24, 2020, at 12:41 PM, Ed Tanous <ed@tanous.net> wrote:
>=20
> =EF=BB=BFI think the best thing would be to start off by stating exactly w=
hat
> you're trying to accomplish, and we can go from there.  As is, you're
> using a raspberry pi, which doesn't have a "host" in the normal BMC
> sense, so I'm really confused as to what you're hoping to do with the
> host power button.  Are you trying to reboot the raspberry pi?  Reboot
> a host connected through some other means?
>=20
> -Ed
>=20
>> On Fri, Aug 21, 2020 at 3:29 PM Mike Jones <proclivis@gmail.com> wrote:
>>=20
>> Hi,
>>=20
>> I am trying to understand how the Server power button in the webui works.=

>>=20
>> As before, using raspberry pi, and I=E2=80=99ll leave project links at th=
e end for anyone that wants to use them. Things work up to monitoring voltag=
es. Note the conf project has a phosphor branch for the full monty.
>>=20
>> To reverse engineer, I setup: dbus-monitor =E2=80=94system > someFile.log=

>>=20
>> There is a message for systemd1.Manager; member=3DStartUnit and best I ca=
n tell, somehow this gets routed to systemd to start some service or run som=
e exe. I see this mentioned in the dbus transactions:
>>=20
>> "obmc-host-start@0.target=E2=80=9D
>>=20
>> And that is in /lib/systemd/system and depends on obmc-host-startmin@0.ta=
rget, but that does not depend on any service. So that is a dead end. It als=
o depends on a reboot attempts, but I think that is not responsible for powe=
r on/off.
>>=20
>> Then there are chassis services, but I cannot find a link from obmc-host-=
start@0.target to objc-chassis-poweron@0.target.
>>=20
>> In this doc: https://github.com/openbmc/docs/blob/master/architecture/ope=
nbmc-systemd.md
>>=20
>> It shows:
>>=20
>>=20
>> ls -1 /lib/systemd/system/obmc-chassis-poweron\@0.target.requires/
>> op-power-start@0.service
>> op-wait-power-on@0.service
>>=20
>>=20
>> But when I =E2=80=9Cls=E2=80=9D that path, the above dependencies are not=
 there. There is only a dependency on phosphor-fan-presence-tach@0.service
>>=20
>> There is some state service that lead to things with xzy paths, and I eve=
ntually found /run/systemd/units. These have file names starting with =E2=80=
=9Cinvocation=E2=80=9D in the names and link to GUID like nodes that don=E2=80=
=99t =E2=80=9Ccat=E2=80=9D like a normal file. So I am not sure how those wo=
rk. Is there some kernel driver that works like sysfs so that these nodes ar=
e not traditional files?
>>=20
>> What I am trying to understand is two things:
>>=20
>> - Interaction with the power regulator
>> - Interaction with the host cpu
>>=20
>> So my hope is someone can connect the dots of the path from the dbus to s=
ystemd through the targets to a service executable doing the work so I can t=
ry to replace them with:
>>=20
>> - Something that turns the regulators on/off, with pmbus in this case.
>> - Something that can behave like a host to keep the system happy like a r=
eal system.
>>=20
>> Mike
>>=20
>> My repos
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>>=20
>> https://github.com/Proclivis/meta-pmbus-raspberrypi.git
>> https://github.com/Proclivis/meta-pmbus-phosphor.git
>> https://github.com/Proclivis/conf-openbmc-adi.git
>>=20
>> The monitor messages for StartUnit
>> =E2=80=94=E2=80=94=E2=80=94
>>=20
>> method call time=3D1598039669.247458 sender=3D:1.48 -> destination=3Dorg.=
freedesktop.systemd1 serial=3D33 path=3D/org/freedesktop/systemd1; interface=
=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit
>>   string "obmc-host-start@0.target"
>>   string "replace"
>> method call time=3D1598039669.276170 sender=3D:1.3 -> destination=3Dorg.f=
reedesktop.DBus serial=3D775 path=3D/org/freedesktop/DBus; interface=3Dorg.f=
reedesktop.DBus; member=3DGetConnectionUnixUser
>>   string ":1.48"
>> method return time=3D1598039669.276234 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D775
>>   uint32 0
>> method call time=3D1598039669.280376 sender=3D:1.3 -> destination=3Dorg.f=
reedesktop.DBus serial=3D776 path=3D/org/freedesktop/DBus; interface=3Dorg.f=
reedesktop.DBus; member=3DAddMatch
>>   string "type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/fr=
eedesktop/DBus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChange=
d',arg0=3D':1.48'"
>> method return time=3D1598039669.280661 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D776
>> method call time=3D1598039669.280701 sender=3D:1.3 -> destination=3Dorg.f=
reedesktop.DBus serial=3D777 path=3D/org/freedesktop/DBus; interface=3Dorg.f=
reedesktop.DBus; member=3DGetNameOwner
>>   string ":1.48"
>> method return time=3D1598039669.280738 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D777
>>   string ":1.48"
>> signal time=3D1598039669.280774 sender=3D:1.3 -> destination=3D(null dest=
ination) serial=3D778 path=3D/org/freedesktop/systemd1; interface=3Dorg.free=
desktop.systemd1.Manager; member=3DUnitNew
>>   string "obmc-host-start@0.target"
>>   object path "/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2et=
arget"
>> signal time=3D1598039669.280823 sender=3D:1.3 -> destination=3D(null dest=
ination) serial=3D779 path=3D/org/freedesktop/systemd1; interface=3Dorg.free=
desktop.systemd1.Manager; member=3DJobNew
>>   uint32 1105
>>   object path "/org/freedesktop/systemd1/job/1105"
>>   string "obmc-host-start@0.target"
>> method return time=3D1598039669.280883 sender=3D:1.3 -> destination=3D:1.=
48 serial=3D780 reply_serial=3D33
>>   object path "/org/freedesktop/systemd1/job/1105"
>> signal time=3D1598039669.281305 sender=3D:1.48 -> destination=3D(null des=
tination) serial=3D34 path=3D/xyz/openbmc_project/state/host0; interface=3Do=
rg.freedesktop.DBus.Properties; member=3DPropertiesChanged
>>   string "xyz.openbmc_project.State.Host"
>>   array [
>>      dict entry(
>>         string "RequestedHostTransition"
>>         variant             string "xyz.openbmc_project.State.Host.Transi=
tion.On"
>>      )
>>   ]
>>   array [
>>   ]
