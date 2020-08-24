Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D0250821
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 20:42:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb1Fp5gvHzDqNW
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:42:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=b2QXZlDC; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb1DV6ZtdzDqN1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 04:41:29 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id q16so5725207ybk.6
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 11:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DntQ1vWT0H3FSs5hAvYGH395vXZsQuSqaXakbefMG3o=;
 b=b2QXZlDC4Dd3Ejo1uP57gM8pUcxCg6OmJJnFVl89EFr6LIgblNmqwfK4VhEg9CGXqz
 g7l0X4hhNzHkt67UiMDqZsJOcZg/qSP0s2lNWKeJsXdY1+/sG32Vg6Rx6uMLnY8qDZyY
 dzIHftVWkDuqojvC4Wa5ay79xDtGoFH98ddl6VPCcntT6kiB/uPt65Y0v/5F1PaDogdH
 WJsRn9fksfcAAtE0pAzDaLW435TpZMJ63NrmwW8HQrtoPMgqBvAy/eus966h3K0Ar/pq
 IpkfKADisW1yllkKrE7zNlzYu0ycEgPHtr0vWLh5R19cA2LMU81xP6zw+lKGNwZhj0ui
 J1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DntQ1vWT0H3FSs5hAvYGH395vXZsQuSqaXakbefMG3o=;
 b=BqLElEaQTJ1UDFVXw+Co9oVJqhYIEct0bKr0dqPqP9VXP7OliA4dP/AFgSrFJv+jF8
 uUPg/rUZ5+dJs47WA9+i7MYT3C+LIHfG7lFlIro4MQtMp1GjNPV/IkxaCCF3eHiid/lz
 yawdn+PHIPDLR7VS51rKNrVv8+h2dCTtLk0WEhKQcOl6c7x5kPbMdYsXk6I01WyDyYEv
 Kcjk7R7iOf3wvt3m8w63s3AN1OpmdC/35ec4KS8cPCOQ/ZORKFB1aAgaLWKkTzjk4v4r
 mtYZTto9/vc4ELkbJsqjngN9k76MKHOTTECBdGnN6cMxLnXsDNVndz8nSq7uBNT0KIpq
 6ofA==
X-Gm-Message-State: AOAM533ue7AxQtb2TZcJw3JAzNMtcepz88ZT9dFCbwPdy6tKi41w9aWi
 Ph6zDRfiK8/mlEJUQ+MxlTpHrRW8+GayH3AichD4mCrCKtI=
X-Google-Smtp-Source: ABdhPJwZBUixtLwSsbJLhBPCUlBCJbBM6K+L17habIO+sc94xaGyJ6NIa0emC3OOOCrFZpWzNgw4RwBPm/tMLg8z9Ps=
X-Received: by 2002:a25:8481:: with SMTP id v1mr9513352ybk.203.1598294485663; 
 Mon, 24 Aug 2020 11:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <9DB3C10D-AC72-4508-879A-1E15BB9E4E69@gmail.com>
In-Reply-To: <9DB3C10D-AC72-4508-879A-1E15BB9E4E69@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 24 Aug 2020 11:41:14 -0700
Message-ID: <CACWQX83ErNXrvAR47+FHXGTiQhvx9FnhuXqebxxwYYvK+-cioA@mail.gmail.com>
Subject: Re: Server Power On mystery
To: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I think the best thing would be to start off by stating exactly what
you're trying to accomplish, and we can go from there.  As is, you're
using a raspberry pi, which doesn't have a "host" in the normal BMC
sense, so I'm really confused as to what you're hoping to do with the
host power button.  Are you trying to reboot the raspberry pi?  Reboot
a host connected through some other means?

-Ed

On Fri, Aug 21, 2020 at 3:29 PM Mike Jones <proclivis@gmail.com> wrote:
>
> Hi,
>
> I am trying to understand how the Server power button in the webui works.
>
> As before, using raspberry pi, and I=E2=80=99ll leave project links at th=
e end for anyone that wants to use them. Things work up to monitoring volta=
ges. Note the conf project has a phosphor branch for the full monty.
>
> To reverse engineer, I setup: dbus-monitor =E2=80=94system > someFile.log
>
> There is a message for systemd1.Manager; member=3DStartUnit and best I ca=
n tell, somehow this gets routed to systemd to start some service or run so=
me exe. I see this mentioned in the dbus transactions:
>
> "obmc-host-start@0.target=E2=80=9D
>
> And that is in /lib/systemd/system and depends on obmc-host-startmin@0.ta=
rget, but that does not depend on any service. So that is a dead end. It al=
so depends on a reboot attempts, but I think that is not responsible for po=
wer on/off.
>
> Then there are chassis services, but I cannot find a link from obmc-host-=
start@0.target to objc-chassis-poweron@0.target.
>
> In this doc: https://github.com/openbmc/docs/blob/master/architecture/ope=
nbmc-systemd.md
>
> It shows:
>
>
> ls -1 /lib/systemd/system/obmc-chassis-poweron\@0.target.requires/
> op-power-start@0.service
> op-wait-power-on@0.service
>
>
> But when I =E2=80=9Cls=E2=80=9D that path, the above dependencies are not=
 there. There is only a dependency on phosphor-fan-presence-tach@0.service
>
> There is some state service that lead to things with xzy paths, and I eve=
ntually found /run/systemd/units. These have file names starting with =E2=
=80=9Cinvocation=E2=80=9D in the names and link to GUID like nodes that don=
=E2=80=99t =E2=80=9Ccat=E2=80=9D like a normal file. So I am not sure how t=
hose work. Is there some kernel driver that works like sysfs so that these =
nodes are not traditional files?
>
> What I am trying to understand is two things:
>
> - Interaction with the power regulator
> - Interaction with the host cpu
>
> So my hope is someone can connect the dots of the path from the dbus to s=
ystemd through the targets to a service executable doing the work so I can =
try to replace them with:
>
> - Something that turns the regulators on/off, with pmbus in this case.
> - Something that can behave like a host to keep the system happy like a r=
eal system.
>
> Mike
>
> My repos
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
>
> https://github.com/Proclivis/meta-pmbus-raspberrypi.git
> https://github.com/Proclivis/meta-pmbus-phosphor.git
> https://github.com/Proclivis/conf-openbmc-adi.git
>
> The monitor messages for StartUnit
> =E2=80=94=E2=80=94=E2=80=94
>
> method call time=3D1598039669.247458 sender=3D:1.48 -> destination=3Dorg.=
freedesktop.systemd1 serial=3D33 path=3D/org/freedesktop/systemd1; interfac=
e=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit
>    string "obmc-host-start@0.target"
>    string "replace"
> method call time=3D1598039669.276170 sender=3D:1.3 -> destination=3Dorg.f=
reedesktop.DBus serial=3D775 path=3D/org/freedesktop/DBus; interface=3Dorg.=
freedesktop.DBus; member=3DGetConnectionUnixUser
>    string ":1.48"
> method return time=3D1598039669.276234 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D775
>    uint32 0
> method call time=3D1598039669.280376 sender=3D:1.3 -> destination=3Dorg.f=
reedesktop.DBus serial=3D776 path=3D/org/freedesktop/DBus; interface=3Dorg.=
freedesktop.DBus; member=3DAddMatch
>    string "type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/f=
reedesktop/DBus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChan=
ged',arg0=3D':1.48'"
> method return time=3D1598039669.280661 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D776
> method call time=3D1598039669.280701 sender=3D:1.3 -> destination=3Dorg.f=
reedesktop.DBus serial=3D777 path=3D/org/freedesktop/DBus; interface=3Dorg.=
freedesktop.DBus; member=3DGetNameOwner
>    string ":1.48"
> method return time=3D1598039669.280738 sender=3Dorg.freedesktop.DBus -> d=
estination=3D:1.3 serial=3D4294967295 reply_serial=3D777
>    string ":1.48"
> signal time=3D1598039669.280774 sender=3D:1.3 -> destination=3D(null dest=
ination) serial=3D778 path=3D/org/freedesktop/systemd1; interface=3Dorg.fre=
edesktop.systemd1.Manager; member=3DUnitNew
>    string "obmc-host-start@0.target"
>    object path "/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2e=
target"
> signal time=3D1598039669.280823 sender=3D:1.3 -> destination=3D(null dest=
ination) serial=3D779 path=3D/org/freedesktop/systemd1; interface=3Dorg.fre=
edesktop.systemd1.Manager; member=3DJobNew
>    uint32 1105
>    object path "/org/freedesktop/systemd1/job/1105"
>    string "obmc-host-start@0.target"
> method return time=3D1598039669.280883 sender=3D:1.3 -> destination=3D:1.=
48 serial=3D780 reply_serial=3D33
>    object path "/org/freedesktop/systemd1/job/1105"
> signal time=3D1598039669.281305 sender=3D:1.48 -> destination=3D(null des=
tination) serial=3D34 path=3D/xyz/openbmc_project/state/host0; interface=3D=
org.freedesktop.DBus.Properties; member=3DPropertiesChanged
>    string "xyz.openbmc_project.State.Host"
>    array [
>       dict entry(
>          string "RequestedHostTransition"
>          variant             string "xyz.openbmc_project.State.Host.Trans=
ition.On"
>       )
>    ]
>    array [
>    ]
