Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA223D19A
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 22:03:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMMxW4md0zDqg3
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 06:03:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qgYgFuLw; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMMvr3yC3zDqd2
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 06:01:44 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id x24so10218625otp.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 13:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=RRcAmqG8i2lmtNM3gSLVjzanhZXCu6mH0ed/a27oZFE=;
 b=qgYgFuLwtIr9j59TJF8ua4Cqy5UMZVif77+D/XwiElY0ANRqLUO2rJlN51wVYrrSuq
 h2pCHAyv5OAjFoAvrkfS/Xpr969Hz748ZSBLF6Amkhg6AA0jXk+9iogjQJHyY013YJU8
 gBJInq0r1xJ/WWFpJaDSAMam5IIzCJT2jW6IPDJwPAExrEEfckM/88K/pLtmCLZhTbz0
 fsLU4OY01n/r1Yyzue945HBKm/CdR33ngqup5QDQWt4sp4ODTJIziSwPH5PxA99xOdxB
 BOK8o4uHyAtl0ndFnxlAZ70HcWvOKSB6RIWI0OuoN6HBjS1jmropWrfRfhW6tQfnF7yW
 XBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=RRcAmqG8i2lmtNM3gSLVjzanhZXCu6mH0ed/a27oZFE=;
 b=Ri+AwZGSwvuYIyDB+B03SHylR7dvVuDCYZbNXajqqBAlda8EJiKW7E3pPFuU3E980W
 l9xVelL6Bwkb3GVgE18ca5CoIYEfwdekI5z8ARfMNCS9awYiXt7H+wzEr98hcki0w+iG
 sK4DFdX0+Hofoj4JCqQRZs9hjaRI9lQyVS8zecifrCNY19lEKnhHi21f8J/n0Dz5lQWf
 jCYUdhoNkfhcmFGRFSTehyGb6l8LmSd1r4+8QNxP1H0DU9WirzvYtOj1UZPzNl2Cay66
 aNMpqD0sSO6Gq0JbEf/jPScAxYMGHHySDn73SmjMm1QYgoo6ZBl5REQzL20Ay3vdw4wX
 nkwA==
X-Gm-Message-State: AOAM530H+vrfpLajVhM0WDh7A0QtC4K0/oWSchAOmAdeq878s4exVVrL
 9qB8+QG6peoRtbQkqGx+2Zr/qM2oz4o=
X-Google-Smtp-Source: ABdhPJzQxYa3MaFhPj91YiKRhW2IaA6gFK8mCaySf1kAXjJguQtKKr9dYZGCSpeDri0DnypZspgLsQ==
X-Received: by 2002:a05:6830:2149:: with SMTP id
 r9mr4266991otd.92.1596657702304; 
 Wed, 05 Aug 2020 13:01:42 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:31c8:a5f7:f522:9334?
 ([2601:281:c001:2359:31c8:a5f7:f522:9334])
 by smtp.gmail.com with ESMTPSA id l17sm568167otp.70.2020.08.05.13.01.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Aug 2020 13:01:41 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Message-Id: <53A2EEB8-24CE-4A27-85D3-92E5731E1255@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D831442E-AB98-4E28-BA16-47E5928602AA"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: How to put sensors into the ObjectMapper
Date: Wed, 5 Aug 2020 14:01:41 -0600
In-Reply-To: <14822464-CD32-4429-95C7-3B7F993A70A0@gmail.com>
To: Matt Spinler <mspinler@linux.ibm.com>
References: <34F75302-6F54-4EE1-849F-F5B1D7118259@gmail.com>
 <8d5f2838-4fe2-d8ec-1874-03ac90c4cc7f@linux.ibm.com>
 <14822464-CD32-4429-95C7-3B7F993A70A0@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_D831442E-AB98-4E28-BA16-47E5928602AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Matt,

I figured this out. For those after me:

> the-date raspberrypi4 systemd[1]: Condition check resulted in Phosphor =
Hwmon Poller being skipped.

This error comes from =
ConditionFileNotEmpty=3D/etc/default/objc/hwmon/%I.conf

In file xyz.openbmc_project.Hwmon@.service

By looking at the code for phosphor-hwmon-readd and running it on a =
command line, I eventually realized the conf files needed to be one =
directory higher and named differently.

Now I have telemetry in the webui.

I pushed my code for anyone that is following along.

Mike

> On Aug 4, 2020, at 6:09 PM, Mike Jones <proclivis@gmail.com> wrote:
>=20
> Matt,
>=20
> Thanks for the help, I wish this was less painful. I think I know how =
this is supposed to work, but it does not. So I will walk through all =
the steps I took to manually debug, and hopefully you see a smoking gun. =
It could be as simple as the service makes some path assumption that =
does not hold when using raspberrypi=E2=80=99s hwmon paths which uses =
soc rather than ahb paths on an aspeed.
>=20
> Sensors/phosphor-hwm adds 70-hwmon.rules and start_hwmon.sh.
>=20
> These are on the target file system.
>=20
> Then I tried to test starting Hwmon service manually like this:
>=20
> udevadm info /sys/bus/i2c/devices/1-0030
>=20
> Then using the variables=E2=80=A6
>=20
> /usr/bin/start_hwmon.sh start =
/devices/platform/soc/fe804000.i2c/i2c-1/1-0030 =
/soc/i2c@7e804000/ltc3880@30
>=20
> And a dbus query has no sensors. There is no process with hwmon in the =
name, and systemctl has nothing with hwmon either.
>=20
> So I edit start_hwmon.sh to print the values and run the command =
manually:
>=20
> systemctl =E2=80=94no-block start =
xyz.openbmc_project.Hwmon@-soc-i2c\x407e804000-ltc3880\x4030.service
>=20
> Now, I am low on how the services use the @.
>=20
> In sensors/phosphor-hwmon is xyz.openbmc_project.Hwmon@.service
>=20
> I am assuming that text after the @ is a way of naming an instance of =
the service, so that one service can be run per device. Perhaps you can =
confirm that.
>=20
> In /lib/systed/system I find the xyz.openbmc_project.Hwmon@.service
>=20
> I assume that if this service was running, ps and systemctl would show =
it. So perhaps it runs and exits. So I use
>=20
> Systemctl status  xyz.openbmc_project.Hwmon@.service
>=20
> And see it calls it Phosphor Hwmon Poller, says it is loaded and lists =
a file:// long path to the service, static, vendor preset: enabled. But =
it also shows
>=20
> Active:inactive (dead)
>=20
> The some lines like:
>=20
> the-date raspberrypi4 systemd[1]: Condition check resulted in Phosphor =
Hwmon Poller being skipped.
>=20
> If I had to guess, it can=E2=80=99f find something in the /sys path.
>=20
> journalctl -u  xyz.openbmc_project.Hwmon@.service gives the same =
messages.
>=20
> So going back to the start_hwmon.sh
>=20
> The udev variables are:
>=20
> DEVPATH =3D /devices/platform/soc/fe804000.i2c/i2c-1/1-0030
> OF_FULLNAME =3D /soc/i2c@7e804000/ltc3880@30
>=20
> The start script cooks up this service name =
@-soc-i2c\x407e804000-ltc3880\x4030.service
>=20
> Which is escaping OF_FULLNAME @ and replacing / with -
>=20
> I assume the service uses that to go a hunting for the hwmon device =
and hopefully it knows to look in =
/sys/devices/platform/soc/fe804000.i2c/i2c-1/1-0030, which is really a =
directory to hwmon. That would mean the service has to know to look in =
/sys/devices/platform, because that is not passed to the service.
>=20
> I noticed that the service file is really a configuration file. So I =
cat it out.
>=20
> It has a ConditionFileNotEmpty=3D/etc/default/obmc/hwmon/%I.conf
>=20
> This is the parent with child soc=E2=80=A6 to the conf files. So I =
should be a proper path. So I compare that path to the service name path =
to see if they match in any way.
>=20
> The path to this device is
>=20
> soc/i2c/@7e804000/ltc3880@30
>=20
> So its a match with the name of the service. That looks good.
>=20
> Then it seems to run
>=20
> /usr/bin/env phosphor-hwmon-readd -o $I
> With SyslogIdentifier phosphor-hwmon-readd
>=20
> I assume that the errors from the status somehow are consuming this =
Syslog.
>=20
> So perhaps this comes down to the meaning of
>=20
> the-date raspberrypi4 systemd[1]: Condition check resulted in Phosphor =
Hwmon Poller being skipped.
>=20
> A google search seems to indicate this is a systemd message and is =
applied to disk checks, etc.
>=20
> Any ideas on how to debug, or what might be amiss?
>=20
> Also, I searched the source tree for phosphor-hwmon-readd* and come up =
empty. So I am not sure how to find the source for this. It does end up =
on the rootfs, so something is building. The name of the sources must be =
different. So I could not look in code to see how it does its job when =
it is run.
>=20
> Mike
>=20
>=20
>=20
>> On Aug 4, 2020, at 1:54 PM, Matt Spinler <mspinler@linux.ibm.com =
<mailto:mspinler@linux.ibm.com>> wrote:
>>=20
>>=20
>>=20
>> On 8/3/2020 1:03 PM, Mike Jones wrote:
>>> My RaspPi work has progressed but I don=E2=80=99t know how to get =
sensors in the ObjectMapper, which I hope will mean sensors end up in =
webui.
>>>=20
>>> BASIC INFORMATION
>>> ------------------------------
>>>=20
>>> At this point, I have my PMbus devices in the device tree like this =
path:
>>>=20
>>> =
/sys/firmware/devicetree/base/soc/i2c@7e804000/ltc2974@32/regulators/vout0=
 to vout3
>>>=20
>>> And the config files like this path:
>>>=20
>>> /etc/default/obmc/hwmon/soc/i2c#7e804000/ltc2974@32/reg1@32.conf =
<mailto:32/reg1@32.conf> <mailto:32/reg1@32.conf =
<mailto:32/reg1@32.conf>>
>>>=20
>>> The sensors show up here:
>>>=20
>>> /sys/bus/i2c/devices/1-0032/hwmon/hwmon2
>>>=20
>>> Indicating that the device tree is causing hwmon to offer its =
telemetry nodes.
>>>=20
>>> =46rom my reading of the docs, it seems like the ObjectMapper keeps =
an inventory of sensors.
>>>=20
>>> So to search, I did something like:
>>>=20
>>> dbus-send =E2=80=94system -print-reply \
>>> =E2=80=94dest=3Dxyz.openbmc_project.ObjectMapper \
>>> /xyz/openbmc_project/object_mapper \
>>> xyz.openbmc_project.ObjectMapper.GetAncestors \
>>> string:=E2=80=9D/xyz/openbmc_project/inventory.system=E2=80=9D =
array:string: | grep ltc2974
>>>=20
>>> But none of my devices are there.
>>>=20
>>> I looked at meta-ibm and meta-hxt and could not see how to get the =
devices into the ObjectMapper.
>>>=20
>>> ACTUAL QUESTIONS
>>> ------------------------------
>>>=20
>>> So I have these questions:
>>>=20
>>> - What it the mechanism for getting these into the ObjectMapper?
>>=20
>> Hi,
>> The mapper just adds some convenience functions to be able to find =
things on D-Bus, so if the mapper
>> can't find it, then it isn't on D-Bus.
>>=20
>> =
https://github.com/openbmc/docs/blob/master/architecture/sensor-architectu=
re.md =
<https://github.com/openbmc/docs/blob/master/architecture/sensor-architect=
ure.md> talks about how
>> phosphor-hwmon-readd will put sensor values on D-Bus.  What I don't =
think it mentions is that it
>> uses a udev rule to start its service when udev sees the hwmon =
subsystem hotplug.
>>=20
>>> - Once there, will they show up in webui without any other files and =
recipes?
>>=20
>> Yea, they will show up as /xyz/openbmc_project/sensors/<type>/<name> =
and bmcweb can find that.
>>=20
>>> - What docs might describe what I need to know to connect the hwmon =
devices to the ObjectMapper?
>>=20
>> That sensors doc I mentioned above has the goal of describing that.
>>=20
>>> - Is there something I have to do to start the ObjectMapper service? =
I don=E2=80=99t see it with a grep through systemctl.
>>=20
>> The service file for that is =
/lib/systemd/system/xyz.openbmc_project.ObjectMapper.service. Hopefully
>> that is present on your system.
>>=20
>>> - Is there an existing meta layer that would be a good example and a =
pointer to the proper bb files to look at?
>>=20
>> The meta-ibm layer makes extensive use of phosphor-hwmon:
>> meta-ibm/recipes-phoshpor/sensors/phosphor-hwmon_%.bbappend
>>=20
>>>=20
>>> THE CODE/LAYERS
>>> ----------------------------
>>>=20
>>> My work so far is here:
>>>=20
>>> https://github.com/Proclivis/meta-pmbus =
<https://github.com/Proclivis/meta-pmbus>
>>>=20
>>> Configured by:
>>>=20
>>> https://github.com/Proclivis/conf-meta-rasberrypi-evb =
<https://github.com/Proclivis/conf-meta-rasberrypi-evb>
>>>=20
>>> Thanks, and sorry I am a newbie without tribal knowledge. I am =
trying to find solutions on my own and only ask for help when stuck. =
Unfortunately, I=E2=80=99m stuck.
>>>=20
>>> Mike
>=20


--Apple-Mail=_D831442E-AB98-4E28-BA16-47E5928602AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Matt,<div class=3D""><br class=3D""></div><div class=3D"">I =
figured this out. For those after me:</div><div class=3D""><br =
class=3D""></div><div class=3D""><blockquote type=3D"cite" class=3D""><div=
 class=3D"" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><div class=3D""><div class=3D""><div =
class=3D"">the-date raspberrypi4 systemd[1]: Condition check resulted in =
Phosphor Hwmon Poller being =
skipped.</div></div></div></div></blockquote><div class=3D""><br =
class=3D""></div>This error comes from =
ConditionFileNotEmpty=3D/etc/default/objc/hwmon/%I.conf</div><div =
class=3D""><br class=3D""></div><div class=3D"">In file =
xyz.openbmc_project.Hwmon@.service</div><div class=3D""><br =
class=3D""></div><div class=3D"">By looking at the code for =
phosphor-hwmon-readd and running it on a command line, I eventually =
realized the conf files needed to be one directory higher and named =
differently.</div><div class=3D""><br class=3D""></div><div class=3D"">Now=
 I have telemetry in the webui.</div><div class=3D""><br =
class=3D""></div><div class=3D"">I pushed my code for anyone that is =
following along.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Mike<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Aug 4, 2020, at 6:09 PM, =
Mike Jones &lt;<a href=3D"mailto:proclivis@gmail.com" =
class=3D"">proclivis@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">Matt,<div class=3D""><br=
 class=3D""></div><div class=3D"">Thanks for the help, I wish this was =
less painful. I think I know how this is supposed to work, but it does =
not. So I will walk through all the steps I took to manually debug, and =
hopefully you see a smoking gun. It could be as simple as the service =
makes some path assumption that does not hold when using raspberrypi=E2=80=
=99s hwmon paths which uses soc rather than ahb paths on an aspeed.<div =
class=3D""><br class=3D""></div><div class=3D"">Sensors/phosphor-hwm =
adds 70-hwmon.rules and start_hwmon.sh.</div><div class=3D""><br =
class=3D""></div><div class=3D"">These are on the target file =
system.</div><div class=3D""><br class=3D""></div><div class=3D"">Then I =
tried to test starting Hwmon service manually like this:</div><div =
class=3D""><br class=3D""></div><div class=3D"">udevadm info =
/sys/bus/i2c/devices/1-0030</div><div class=3D""><br class=3D""></div><div=
 class=3D"">Then using the variables=E2=80=A6</div><div class=3D""><br =
class=3D""></div><div class=3D"">/usr/bin/start_hwmon.sh start =
/devices/platform/soc/fe804000.i2c/i2c-1/1-0030 =
/soc/i2c@7e804000/ltc3880@30</div><div class=3D""><br =
class=3D""></div><div class=3D"">And a dbus query has no sensors. There =
is no process with hwmon in the name, and systemctl has nothing with =
hwmon either.</div><div class=3D""><br class=3D""></div><div class=3D"">So=
 I edit start_hwmon.sh to print the values and run the command =
manually:</div><div class=3D""><br class=3D""></div><div =
class=3D"">systemctl =E2=80=94no-block start =
xyz.openbmc_project.Hwmon@-soc-i2c\x407e804000-ltc3880\x4030.service</div>=
<div class=3D""><br class=3D""></div><div class=3D"">Now, I am low on =
how the services use the @.</div><div class=3D""><br class=3D""></div><div=
 class=3D"">In sensors/phosphor-hwmon is =
xyz.openbmc_project.Hwmon@.service</div><div class=3D""><br =
class=3D""></div><div class=3D"">I am assuming that text after the @ is =
a way of naming an instance of the service, so that one service can be =
run per device. Perhaps you can confirm that.</div><div class=3D""><br =
class=3D""></div><div class=3D"">In /lib/systed/system I find the =
xyz.openbmc_project.Hwmon@.service</div><div class=3D""><br =
class=3D""></div><div class=3D"">I assume that if this service was =
running, ps and systemctl would show it. So perhaps it runs and exits. =
So I use</div><div class=3D""><br class=3D""></div><div =
class=3D"">Systemctl status =
&nbsp;xyz.openbmc_project.Hwmon@.service</div><div class=3D""><br =
class=3D""></div><div class=3D"">And see it calls it Phosphor Hwmon =
Poller, says it is loaded and lists a file:// long path to the service, =
static, vendor preset: enabled. But it also shows</div><div class=3D""><br=
 class=3D""></div><div class=3D"">Active:inactive (dead)</div><div =
class=3D""><br class=3D""></div><div class=3D"">The some lines =
like:</div><div class=3D""><br class=3D""></div><div class=3D"">the-date =
raspberrypi4 systemd[1]: Condition check resulted in Phosphor Hwmon =
Poller being skipped.</div><div class=3D""><br class=3D""></div><div =
class=3D"">If I had to guess, it can=E2=80=99f find something in the =
/sys path.</div><div class=3D""><br class=3D""></div><div =
class=3D"">journalctl -u &nbsp;xyz.openbmc_project.Hwmon@.service gives =
the same messages.</div><div class=3D""><br class=3D""></div><div =
class=3D"">So going back to the start_hwmon.sh</div><div class=3D""><br =
class=3D""></div><div class=3D"">The udev variables are:</div><div =
class=3D""><br class=3D""></div><div class=3D"">DEVPATH =3D =
/devices/platform/soc/fe804000.i2c/i2c-1/1-0030</div><div =
class=3D"">OF_FULLNAME =3D /soc/i2c@7e804000/ltc3880@30</div><div =
class=3D""><br class=3D""></div><div class=3D"">The start script cooks =
up this service name =
@-soc-i2c\x407e804000-ltc3880\x4030.service</div><div class=3D""><br =
class=3D""></div><div class=3D"">Which is escaping OF_FULLNAME @ and =
replacing / with -</div><div class=3D""><br class=3D""></div><div =
class=3D"">I assume the service uses that to go a hunting for the hwmon =
device and hopefully it knows to look in =
/sys/devices/platform/soc/fe804000.i2c/i2c-1/1-0030, which is really a =
directory to hwmon. That would mean the service has to know to look in =
/sys/devices/platform, because that is not passed to the =
service.</div><div class=3D""><br class=3D""></div><div class=3D"">I =
noticed that the service file is really a configuration file. So I cat =
it out.</div><div class=3D""><br class=3D""></div><div class=3D"">It has =
a ConditionFileNotEmpty=3D/etc/default/obmc/hwmon/%I.conf</div><div =
class=3D""><br class=3D""></div><div class=3D"">This is the parent with =
child soc=E2=80=A6 to the conf files. So I should be a proper path. So I =
compare that path to the service name path to see if they match in any =
way.</div><div class=3D""><br class=3D""></div><div class=3D"">The path =
to this device is</div><div class=3D""><br class=3D""></div><div =
class=3D"">soc/i2c/@7e804000/ltc3880@30</div><div class=3D""><br =
class=3D""></div><div class=3D"">So its a match with the name of the =
service. That looks good.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Then it seems to run</div><div class=3D""><br =
class=3D""></div><div class=3D"">/usr/bin/env phosphor-hwmon-readd -o =
$I</div><div class=3D"">With SyslogIdentifier =
phosphor-hwmon-readd</div><div class=3D""><br class=3D""></div><div =
class=3D"">I assume that the errors from the status somehow are =
consuming this Syslog.</div><div class=3D""><br class=3D""></div><div =
class=3D"">So perhaps this comes down to the meaning of</div><div =
class=3D""><br class=3D""></div><div class=3D""><div class=3D"">the-date =
raspberrypi4 systemd[1]: Condition check resulted in Phosphor Hwmon =
Poller being skipped.</div></div><div class=3D""><br class=3D""></div><div=
 class=3D"">A google search seems to indicate this is a systemd message =
and is applied to disk checks, etc.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Any ideas on how to debug, or what =
might be amiss?</div><div class=3D""><br class=3D""></div><div =
class=3D"">Also, I searched the source tree for phosphor-hwmon-readd* =
and come up empty. So I am not sure how to find the source for this. It =
does end up on the rootfs, so something is building. The name of the =
sources must be different. So I could not look in code to see how it =
does its job when it is run.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Mike</div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div class=3D""><div=
 class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 4, 2020, at 1:54 PM, Matt Spinler &lt;<a =
href=3D"mailto:mspinler@linux.ibm.com" =
class=3D"">mspinler@linux.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On 8/3/2020 1:03 PM, Mike Jones =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">My =
RaspPi work has progressed but I don=E2=80=99t know how to get sensors =
in the ObjectMapper, which I hope will mean sensors end up in webui.<br =
class=3D""><br class=3D"">BASIC INFORMATION<br =
class=3D"">------------------------------<br class=3D""><br class=3D"">At =
this point, I have my PMbus devices in the device tree like this =
path:<br class=3D""><br =
class=3D"">/sys/firmware/devicetree/base/soc/i2c@7e804000/ltc2974@32/regul=
ators/vout0 to vout3<br class=3D""><br class=3D"">And the config files =
like this path:<br class=3D""><br =
class=3D"">/etc/default/obmc/hwmon/soc/i2c#7e804000/ltc2974@<a =
href=3D"mailto:32/reg1@32.conf" class=3D"">32/reg1@32.conf</a><span =
class=3D"Apple-converted-space">&nbsp;</span>&lt;<a =
href=3D"mailto:32/reg1@32.conf" =
class=3D"">mailto:32/reg1@32.conf</a>&gt;<br class=3D""><br class=3D"">The=
 sensors show up here:<br class=3D""><br =
class=3D"">/sys/bus/i2c/devices/1-0032/hwmon/hwmon2<br class=3D""><br =
class=3D"">Indicating that the device tree is causing hwmon to offer its =
telemetry nodes.<br class=3D""><br class=3D"">=46rom my reading of the =
docs, it seems like the ObjectMapper keeps an inventory of sensors.<br =
class=3D""><br class=3D"">So to search, I did something like:<br =
class=3D""><br class=3D"">dbus-send =E2=80=94system -print-reply \<br =
class=3D"">=E2=80=94dest=3Dxyz.openbmc_project.ObjectMapper \<br =
class=3D"">/xyz/openbmc_project/object_mapper \<br =
class=3D"">xyz.openbmc_project.ObjectMapper.GetAncestors \<br =
class=3D"">string:=E2=80=9D/xyz/openbmc_project/inventory.system=E2=80=9D =
array:string: | grep ltc2974<br class=3D""><br class=3D"">But none of my =
devices are there.<br class=3D""><br class=3D"">I looked at meta-ibm and =
meta-hxt and could not see how to get the devices into the =
ObjectMapper.<br class=3D""><br class=3D"">ACTUAL QUESTIONS<br =
class=3D"">------------------------------<br class=3D""><br class=3D"">So =
I have these questions:<br class=3D""><br class=3D"">- What it the =
mechanism for getting these into the ObjectMapper?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Hi,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The mapper just adds some convenience functions to be able to =
find things on D-Bus, so if the mapper</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">can't find it, then it isn't on D-Bus.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><a =
href=3D"https://github.com/openbmc/docs/blob/master/architecture/sensor-ar=
chitecture.md" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://github.com/openbmc/docs/blob/master/architecture/sensor=
-architecture.md</a><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D""><span class=3D"Apple-converted-space">&nbsp;</span>talks =
about how</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">phosphor-hwmon-readd will put sensor values on D-Bus.&nbsp; =
What I don't think it mentions is that it</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">uses a udev rule to start its service when udev sees the =
hwmon subsystem hotplug.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">- Once there, will they show up in =
webui without any other files and recipes?<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Yea, they will show up as =
/xyz/openbmc_project/sensors/&lt;type&gt;/&lt;name&gt; and bmcweb can =
find that.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">- =
What docs might describe what I need to know to connect the hwmon =
devices to the ObjectMapper?<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">That sensors doc I mentioned =
above has the goal of describing that.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">- Is there something I have to do to =
start the ObjectMapper service? I don=E2=80=99t see it with a grep =
through systemctl.<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The service file for that is =
/lib/systemd/system/xyz.openbmc_project.ObjectMapper.service. =
Hopefully</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">that is =
present on your system.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">- Is there an existing meta layer =
that would be a good example and a pointer to the proper bb files to =
look at?<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The meta-ibm layer makes extensive use of =
phosphor-hwmon:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">meta-ibm/recipes-phoshpor/sensors/phosphor-hwmon_%.bbappend</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">THE CODE/LAYERS<br class=3D"">----------------------------<br =
class=3D""><br class=3D"">My work so far is here:<br class=3D""><br =
class=3D""><a href=3D"https://github.com/Proclivis/meta-pmbus" =
class=3D"">https://github.com/Proclivis/meta-pmbus</a><br class=3D""><br =
class=3D"">Configured by:<br class=3D""><br class=3D""><a =
href=3D"https://github.com/Proclivis/conf-meta-rasberrypi-evb" =
class=3D"">https://github.com/Proclivis/conf-meta-rasberrypi-evb</a><br =
class=3D""><br class=3D"">Thanks, and sorry I am a newbie without tribal =
knowledge. I am trying to find solutions on my own and only ask for help =
when stuck. Unfortunately, I=E2=80=99m stuck.<br class=3D""><br =
class=3D"">Mike</blockquote></div></blockquote></div><br =
class=3D""></div></div></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_D831442E-AB98-4E28-BA16-47E5928602AA--
