Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A0F24E360
	for <lists+openbmc@lfdr.de>; Sat, 22 Aug 2020 00:29:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYGQK0wjDzDrKW
	for <lists+openbmc@lfdr.de>; Sat, 22 Aug 2020 08:28:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SvnM/7Yu; dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYGPK05qXzDrJB
 for <openbmc@lists.ozlabs.org>; Sat, 22 Aug 2020 08:28:02 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id c6so2656210ilo.13
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 15:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=pk47HxLCrGszc4fJfI0VdKnK8u/Ez4lNcFwPBNeFibY=;
 b=SvnM/7YuOw8o/rdProYFW9E1ND5kE4aJM/ZLigFIF1iCUt3n9gqurEIVZs7hA7oeEr
 Rp9xuYBSqqG5kg93cOfEWPlCjo/WGFfCWHO2QsSJChFVDQbAuS0w/Nv1u6dKqdhlGo9F
 RSbtEQfpMjj3f48Dp19Z6Dea19uXCAWeromX6t5L+jg7xgMIUjhH/MlatCWcEemHEMMT
 lsQqzTuk4jw5kSwyzxiD9q3Qvbs5ndD6uFBxFlcyrqjExGoHeP/TaXdTnwrbKmKq9gyx
 7LQeMa38EyfujfaB19I8BTx4HpTY3vR4uA6thuy2mk5mssBZzeZj4LbpqiXvgogdeLGA
 S1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=pk47HxLCrGszc4fJfI0VdKnK8u/Ez4lNcFwPBNeFibY=;
 b=pB02e8RXZLER2sPSjPZgieO/hKmwQeD5nlsG1U5461bHCh51l8+4GKfYu1LNjBu9Va
 5Ed7ygOoHiU+giGWQq1fgasNnY50t9V1A4RHxBMz462gYMtyeFrHZi4aN/1PkgD0QfYH
 CEg1Ur3Xqylj5h38O7+jXtXfiAGwz/InZWCKHJI8L29C1+/tgiL9pZh1qWjzvqJx4FhH
 TLm5JuGY1Uy70tqadRPUFztKzZTSFxmYQD5nt4HVWQ1UvQ7fdwc278nqRZMzbWsHTNgE
 xycI9grWgVjLkd27Swz3ljruspDXsgkxvClsoYI3pmoHlfo96Cz9t5/hlf+abmY0hevB
 +b3A==
X-Gm-Message-State: AOAM533/I7lLK8O+cKpqANkMzUTN0dvDIn4yUy8gwYJwLTHtKa6qCkzV
 Ha5E6m9+7FyWqR5XSs9Sp53Q50RIm+6rzQ==
X-Google-Smtp-Source: ABdhPJzGfU4rNyYAs2SBiCGmnhUAJoFlMRgTQfBIJj287PFEaTOu3Tfx25DiqD3kmRh9mE4s6/xBXw==
X-Received: by 2002:a92:660e:: with SMTP id a14mr4224900ilc.262.1598048876112; 
 Fri, 21 Aug 2020 15:27:56 -0700 (PDT)
Received: from [10.73.10.6] ([199.115.102.154])
 by smtp.gmail.com with ESMTPSA id q1sm1997019iow.8.2020.08.21.15.27.55
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Aug 2020 15:27:55 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_3AC3668B-1A45-49B7-B1E9-54C587E8D7CA"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Server Power On mystery
Message-Id: <9DB3C10D-AC72-4508-879A-1E15BB9E4E69@gmail.com>
Date: Fri, 21 Aug 2020 16:27:54 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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


--Apple-Mail=_3AC3668B-1A45-49B7-B1E9-54C587E8D7CA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

I am trying to understand how the Server power button in the webui =
works.

As before, using raspberry pi, and I=E2=80=99ll leave project links at =
the end for anyone that wants to use them. Things work up to monitoring =
voltages. Note the conf project has a phosphor branch for the full =
monty.

To reverse engineer, I setup: dbus-monitor =E2=80=94system > =
someFile.log

There is a message for systemd1.Manager; member=3DStartUnit and best I =
can tell, somehow this gets routed to systemd to start some service or =
run some exe. I see this mentioned in the dbus transactions:

"obmc-host-start@0.target <mailto:obmc-host-start@0.target>=E2=80=9D

And that is in /lib/systemd/system and depends on =
obmc-host-startmin@0.target, but that does not depend on any service. So =
that is a dead end. It also depends on a reboot attempts, but I think =
that is not responsible for power on/off.

Then there are chassis services, but I cannot find a link from =
obmc-host-start@0.target to objc-chassis-poweron@0.target.

In this doc: =
https://github.com/openbmc/docs/blob/master/architecture/openbmc-systemd.m=
d =
<https://github.com/openbmc/docs/blob/master/architecture/openbmc-systemd.=
md>

It shows:


ls -1 /lib/systemd/system/obmc-chassis-poweron\@0.target.requires/
op-power-start@0.service
op-wait-power-on@0.service

But when I =E2=80=9Cls=E2=80=9D that path, the above dependencies are =
not there. There is only a dependency on =
phosphor-fan-presence-tach@0.service =
<mailto:phosphor-fan-presence-tach@0.service>

There is some state service that lead to things with xzy paths, and I =
eventually found /run/systemd/units. These have file names starting with =
=E2=80=9Cinvocation=E2=80=9D in the names and link to GUID like nodes =
that don=E2=80=99t =E2=80=9Ccat=E2=80=9D like a normal file. So I am not =
sure how those work. Is there some kernel driver that works like sysfs =
so that these nodes are not traditional files?

What I am trying to understand is two things:

- Interaction with the power regulator
- Interaction with the host cpu

So my hope is someone can connect the dots of the path from the dbus to =
systemd through the targets to a service executable doing the work so I =
can try to replace them with:

- Something that turns the regulators on/off, with pmbus in this case.
- Something that can behave like a host to keep the system happy like a =
real system.

Mike

My repos
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94

https://github.com/Proclivis/meta-pmbus-raspberrypi.git =
<https://github.com/Proclivis/meta-pmbus-raspberrypi.git>
https://github.com/Proclivis/meta-pmbus-phosphor.git =
<https://github.com/Proclivis/meta-pmbus-phosphor.git>
https://github.com/Proclivis/conf-openbmc-adi.git =
<https://github.com/Proclivis/conf-openbmc-adi.git>

The monitor messages for StartUnit
=E2=80=94=E2=80=94=E2=80=94

method call time=3D1598039669.247458 sender=3D:1.48 -> =
destination=3Dorg.freedesktop.systemd1 serial=3D33 =
path=3D/org/freedesktop/systemd1; =
interface=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit
   string "obmc-host-start@0.target <mailto:obmc-host-start@0.target>"
   string "replace"
method call time=3D1598039669.276170 sender=3D:1.3 -> =
destination=3Dorg.freedesktop.DBus serial=3D775 =
path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; =
member=3DGetConnectionUnixUser
   string ":1.48"
method return time=3D1598039669.276234 sender=3Dorg.freedesktop.DBus -> =
destination=3D:1.3 serial=3D4294967295 reply_serial=3D775
   uint32 0
method call time=3D1598039669.280376 sender=3D:1.3 -> =
destination=3Dorg.freedesktop.DBus serial=3D776 =
path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; =
member=3DAddMatch
   string =
"type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/freedesktop/=
DBus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChanged',arg0=3D=
':1.48'"
method return time=3D1598039669.280661 sender=3Dorg.freedesktop.DBus -> =
destination=3D:1.3 serial=3D4294967295 reply_serial=3D776
method call time=3D1598039669.280701 sender=3D:1.3 -> =
destination=3Dorg.freedesktop.DBus serial=3D777 =
path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; =
member=3DGetNameOwner
   string ":1.48"
method return time=3D1598039669.280738 sender=3Dorg.freedesktop.DBus -> =
destination=3D:1.3 serial=3D4294967295 reply_serial=3D777
   string ":1.48"
signal time=3D1598039669.280774 sender=3D:1.3 -> destination=3D(null =
destination) serial=3D778 path=3D/org/freedesktop/systemd1; =
interface=3Dorg.freedesktop.systemd1.Manager; member=3DUnitNew
   string "obmc-host-start@0.target <mailto:obmc-host-start@0.target>"
   object path =
"/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2etarget"
signal time=3D1598039669.280823 sender=3D:1.3 -> destination=3D(null =
destination) serial=3D779 path=3D/org/freedesktop/systemd1; =
interface=3Dorg.freedesktop.systemd1.Manager; member=3DJobNew
   uint32 1105
   object path "/org/freedesktop/systemd1/job/1105"
   string "obmc-host-start@0.target <mailto:obmc-host-start@0.target>"
method return time=3D1598039669.280883 sender=3D:1.3 -> =
destination=3D:1.48 serial=3D780 reply_serial=3D33
   object path "/org/freedesktop/systemd1/job/1105"
signal time=3D1598039669.281305 sender=3D:1.48 -> destination=3D(null =
destination) serial=3D34 path=3D/xyz/openbmc_project/state/host0; =
interface=3Dorg.freedesktop.DBus.Properties; member=3DPropertiesChanged
   string "xyz.openbmc_project.State.Host"
   array [
      dict entry(
         string "RequestedHostTransition"
         variant             string =
"xyz.openbmc_project.State.Host.Transition.On"
      )
   ]
   array [
   ]=

--Apple-Mail=_3AC3668B-1A45-49B7-B1E9-54C587E8D7CA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D"">Hi,<div class=3D""><br =
class=3D""></div><div class=3D"">I am trying to understand how the =
Server power button in the webui works.</div><div class=3D""><br =
class=3D""></div><div class=3D"">As before, using raspberry pi, and =
I=E2=80=99ll leave project links at the end for anyone that wants to use =
them. Things work up to monitoring voltages. Note the conf project has a =
phosphor branch for the full monty.</div><div class=3D""><br =
class=3D""></div><div class=3D"">To reverse engineer, I setup: =
dbus-monitor =E2=80=94system &gt; someFile.log</div><div class=3D""><br =
class=3D""></div><div class=3D"">There is a message for =
systemd1.Manager; member=3DStartUnit and best I can tell, somehow this =
gets routed to systemd to start some service or run some exe. I see this =
mentioned in the dbus transactions:</div><div class=3D""><br =
class=3D""></div><div class=3D"">"<a =
href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a>=E2=80=9D</div><div class=3D""><br =
class=3D""></div><div class=3D"">And that is in /lib/systemd/system and =
depends on&nbsp;<a href=3D"mailto:obmc-host-startmin@0.target" =
class=3D"">obmc-host-startmin@0.target</a>, but that does not depend on =
any service. So that is a&nbsp;dead end. It also depends on a reboot =
attempts, but I think that is not&nbsp;responsible for power =
on/off.</div><div class=3D""><br class=3D""></div><div class=3D"">Then =
there are chassis services, but I cannot find a link from <a =
href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a> to <a =
href=3D"mailto:objc-chassis-poweron@0.target" =
class=3D"">objc-chassis-poweron@0.target</a>.</div><div class=3D""><br =
class=3D""></div><div class=3D"">In this doc:&nbsp;<a =
href=3D"https://github.com/openbmc/docs/blob/master/architecture/openbmc-s=
ystemd.md" =
class=3D"">https://github.com/openbmc/docs/blob/master/architecture/openbm=
c-systemd.md</a></div><div class=3D""><br class=3D""></div><div =
class=3D"">It shows:</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D""><div class=3D""><pre =
style=3D"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; =
word-wrap: normal; padding: 16px; overflow: auto; line-height: 1.45; =
background-color: rgb(246, 248, 250); border-top-left-radius: 6px; =
border-top-right-radius: 6px; border-bottom-right-radius: 6px; =
border-bottom-left-radius: 6px; caret-color: rgb(36, 41, 46); color: =
rgb(36, 41, 46);" class=3D""><code style=3D"box-sizing: border-box; =
padding: 0px; margin: 0px; border-top-left-radius: 6px; =
border-top-right-radius: 6px; border-bottom-right-radius: 6px; =
border-bottom-left-radius: 6px; word-break: normal; border: 0px; =
display: inline; overflow: visible; line-height: inherit; word-wrap: =
normal;" class=3D""><font face=3D"Helvetica" class=3D"">ls -1 =
/lib/systemd/system/obmc-chassis-poweron\@0.target.requires/
<a href=3D"mailto:op-power-start@0.service" =
class=3D"">op-power-start@0.service</a>
<a href=3D"mailto:op-wait-power-on@0.service" =
class=3D"">op-wait-power-on@0.service</a></font></code></pre><div =
class=3D""><br class=3D""></div></div><div class=3D"">But when I =
=E2=80=9Cls=E2=80=9D that path, the above dependencies are not there. =
There is only a dependency on <a =
href=3D"mailto:phosphor-fan-presence-tach@0.service" =
class=3D"">phosphor-fan-presence-tach@0.service</a></div></div><div =
class=3D""><br class=3D""></div><div class=3D"">There is some state =
service that lead to things with xzy paths, and I eventually found =
/run/systemd/units. These have file names starting with =E2=80=9Cinvocatio=
n=E2=80=9D in the names and link to GUID like nodes that don=E2=80=99t =
=E2=80=9Ccat=E2=80=9D like a normal file. So I am not sure how those =
work. Is there some kernel driver that works like sysfs so that these =
nodes are not traditional files?</div><div class=3D""><br =
class=3D""></div><div class=3D"">What I am trying to understand is two =
things:</div><div class=3D""><br class=3D""></div><div class=3D"">- =
Interaction with the power regulator</div><div class=3D"">- Interaction =
with the host cpu</div><div class=3D""><br class=3D""></div><div =
class=3D"">So my hope is someone can connect the dots of the path from =
the dbus to systemd through the targets to a service executable doing =
the work so I can try to replace them with:</div><div class=3D""><br =
class=3D""></div><div class=3D"">- Something that turns the regulators =
on/off, with pmbus in this case.</div><div class=3D"">- Something that =
can behave like a host to keep the system happy like a real =
system.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Mike</div><div class=3D""><br class=3D""></div><div =
class=3D"">My repos</div><div class=3D"">=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94</div><div class=3D""><br class=3D""></div><div =
class=3D""><a =
href=3D"https://github.com/Proclivis/meta-pmbus-raspberrypi.git" =
class=3D"">https://github.com/Proclivis/meta-pmbus-raspberrypi.git</a></di=
v><div class=3D""><a =
href=3D"https://github.com/Proclivis/meta-pmbus-phosphor.git" =
class=3D"">https://github.com/Proclivis/meta-pmbus-phosphor.git</a></div><=
div class=3D""><a =
href=3D"https://github.com/Proclivis/conf-openbmc-adi.git" =
class=3D"">https://github.com/Proclivis/conf-openbmc-adi.git</a></div><div=
 class=3D""><br class=3D""></div><div class=3D"">The monitor messages =
for StartUnit</div><div class=3D"">=E2=80=94=E2=80=94=E2=80=94</div><div =
class=3D""><br class=3D""></div><div class=3D""><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">method call time=3D1598039669.247458 sender=3D:1.48 -&gt; =
destination=3Dorg.freedesktop.systemd1 serial=3D33 =
path=3D/org/freedesktop/systemd1; =
interface=3Dorg.freedesktop.systemd1.Manager; member=3DStartUnit<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; string "<a =
href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a>"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; string "replace"<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">method =
call time=3D1598039669.276170 sender=3D:1.3 -&gt; =
destination=3Dorg.freedesktop.DBus serial=3D775 =
path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; =
member=3DGetConnectionUnixUser<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; string ":1.48"<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">method =
return time=3D1598039669.276234 sender=3Dorg.freedesktop.DBus -&gt; =
destination=3D:1.3 serial=3D4294967295 reply_serial=3D775<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; uint32 0<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">method call time=3D1598039669.280376 =
sender=3D:1.3 -&gt; destination=3Dorg.freedesktop.DBus serial=3D776 =
path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; =
member=3DAddMatch<o:p class=3D""></o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; string =
"type=3D'signal',sender=3D'org.freedesktop.DBus',path=3D'/org/freedesktop/=
DBus',interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChanged',arg0=3D=
':1.48'"<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">method return time=3D1598039669.280661 =
sender=3Dorg.freedesktop.DBus -&gt; destination=3D:1.3 serial=3D4294967295=
 reply_serial=3D776<o:p class=3D""></o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">method call time=3D1598039669.280701 sender=3D:1.3 -&gt; =
destination=3Dorg.freedesktop.DBus serial=3D777 =
path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBus; =
member=3DGetNameOwner<o:p class=3D""></o:p></div><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; string ":1.48"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">method return time=3D1598039669.280738 =
sender=3Dorg.freedesktop.DBus -&gt; destination=3D:1.3 serial=3D4294967295=
 reply_serial=3D777<o:p class=3D""></o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; string ":1.48"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">signal time=3D1598039669.280774 =
sender=3D:1.3 -&gt; destination=3D(null destination) serial=3D778 =
path=3D/org/freedesktop/systemd1; =
interface=3Dorg.freedesktop.systemd1.Manager; member=3DUnitNew<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; string "<a =
href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a>"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; object path =
"/org/freedesktop/systemd1/unit/obmc_2dhost_2dstart_400_2etarget"<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">signal =
time=3D1598039669.280823 sender=3D:1.3 -&gt; destination=3D(null =
destination) serial=3D779 path=3D/org/freedesktop/systemd1; =
interface=3Dorg.freedesktop.systemd1.Manager; member=3DJobNew<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; uint32 1105<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; object path =
"/org/freedesktop/systemd1/job/1105"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; string "<a =
href=3D"mailto:obmc-host-start@0.target" =
class=3D"">obmc-host-start@0.target</a>"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">method return time=3D1598039669.280883 =
sender=3D:1.3 -&gt; destination=3D:1.48 serial=3D780 reply_serial=3D33<o:p=
 class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; object path =
"/org/freedesktop/systemd1/job/1105"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">signal time=3D1598039669.281305 =
sender=3D:1.48 -&gt; destination=3D(null destination) serial=3D34 =
path=3D/xyz/openbmc_project/state/host0; =
interface=3Dorg.freedesktop.DBus.Properties; =
member=3DPropertiesChanged<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; string =
"xyz.openbmc_project.State.Host"<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; array [<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dict entry(<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string =
"RequestedHostTransition"<o:p class=3D""></o:p></div><div style=3D"margin:=
 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
variant&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; string "xyz.openbmc_project.State.Host.Transition.On"<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; ]<o:p class=3D""></o:p></div><div style=3D"margin:=
 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp; array [<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">&nbsp;&nbsp; =
]</div></div></div></body></html>=

--Apple-Mail=_3AC3668B-1A45-49B7-B1E9-54C587E8D7CA--
