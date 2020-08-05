Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D0723C274
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 02:10:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLsT46J0SzDqb5
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 10:10:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YuWoUpkc; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLsRs5XdBzDqWb
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 10:09:13 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id a24so17488408oia.6
 for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2020 17:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=IJ9rvR9oNZJ/pCKy+79ie8RhT5a5VtECDA4T1SO7pOM=;
 b=YuWoUpkcUxOOCLTrRLmfLefR8/DQ8nJszPLkTJuPF1/ekl83qGZD1xmosxS7Lqupv7
 qGm4NJeobUWfGbxqoRv+ZD14gzvn5OIpmmZT7DEYLW1BMYk5nhFDo0dZRyrDL8YSFcXQ
 hXsjj7TlN2527Y5UFiy1u/V5CJTTsoRDMHbGbPN54NtV0SuoB8w+xcczlXYTHR4jydUg
 7jjmIt3h/tldT2fwnZEwI2Kfk7MgJ5xifUdJY9WMDYT+9tAQGRtk8fFMkdZ2kgccATPi
 a4M+1gDdTu1Os9yjX8LaRoAG4sM/NlFg0rmMVnpyiisLVU8fGS11U9rn0dihbqybQIeV
 TzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=IJ9rvR9oNZJ/pCKy+79ie8RhT5a5VtECDA4T1SO7pOM=;
 b=MlSXX+kBNAasv2drKplSPT8Tw7qCfkJcpOtPRyfYjUpfpBzg6R4nHx2vYDVSflpYwO
 FkYooIuw3jroomL33P0VI/55AhfqDJBgwd4XTJmdqb/BkQqVNyQPkZESuUYKFI8+ewmZ
 waovGXKPkgi2AwkATsFSwMKUznQzzPq8iSnRxgw370iCO3TutCVY0xw+MQPRBMPakCGZ
 8kqQNXANaeCTTGfciUQxNOrW2Kcvee19t8walh48BQsTYylsJGEt3tOLtyWxJOt9vJPK
 hQjyDnBAv47qEVnq6CaIylfypx+x1JRg0PAP5N3/5itUIAJdCup4PHfK2JFeB0GXdesO
 xfsQ==
X-Gm-Message-State: AOAM533DEzMJNQI/dKZwmRKYYHHBTXS+cWKxcUSYKdZfVZzF27yyZdlK
 97PS8R+LpcwJouNXazgJ4JguDN0VHOw=
X-Google-Smtp-Source: ABdhPJx5gBXf1sBKnN/6G0kWzWh1MFQiiY8UYJWI1/IhXqXF+VM2KAkcup/8cceWiKXZ/zUoOPWttQ==
X-Received: by 2002:aca:acc9:: with SMTP id v192mr736800oie.84.1596586149680; 
 Tue, 04 Aug 2020 17:09:09 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:31c8:a5f7:f522:9334?
 ([2601:281:c001:2359:31c8:a5f7:f522:9334])
 by smtp.gmail.com with ESMTPSA id v4sm70959ool.21.2020.08.04.17.09.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 17:09:09 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Message-Id: <14822464-CD32-4429-95C7-3B7F993A70A0@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_832AC050-F9E8-425B-BE19-BF99E7C939A1"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: How to put sensors into the ObjectMapper
Date: Tue, 4 Aug 2020 18:09:08 -0600
In-Reply-To: <8d5f2838-4fe2-d8ec-1874-03ac90c4cc7f@linux.ibm.com>
To: Matt Spinler <mspinler@linux.ibm.com>
References: <34F75302-6F54-4EE1-849F-F5B1D7118259@gmail.com>
 <8d5f2838-4fe2-d8ec-1874-03ac90c4cc7f@linux.ibm.com>
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


--Apple-Mail=_832AC050-F9E8-425B-BE19-BF99E7C939A1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Matt,

Thanks for the help, I wish this was less painful. I think I know how =
this is supposed to work, but it does not. So I will walk through all =
the steps I took to manually debug, and hopefully you see a smoking gun. =
It could be as simple as the service makes some path assumption that =
does not hold when using raspberrypi=E2=80=99s hwmon paths which uses =
soc rather than ahb paths on an aspeed.

Sensors/phosphor-hwm adds 70-hwmon.rules and start_hwmon.sh.

These are on the target file system.

Then I tried to test starting Hwmon service manually like this:

udevadm info /sys/bus/i2c/devices/1-0030

Then using the variables=E2=80=A6

/usr/bin/start_hwmon.sh start =
/devices/platform/soc/fe804000.i2c/i2c-1/1-0030 =
/soc/i2c@7e804000/ltc3880@30

And a dbus query has no sensors. There is no process with hwmon in the =
name, and systemctl has nothing with hwmon either.

So I edit start_hwmon.sh to print the values and run the command =
manually:

systemctl =E2=80=94no-block start =
xyz.openbmc_project.Hwmon@-soc-i2c\x407e804000-ltc3880\x4030.service

Now, I am low on how the services use the @.

In sensors/phosphor-hwmon is xyz.openbmc_project.Hwmon@.service

I am assuming that text after the @ is a way of naming an instance of =
the service, so that one service can be run per device. Perhaps you can =
confirm that.

In /lib/systed/system I find the xyz.openbmc_project.Hwmon@.service

I assume that if this service was running, ps and systemctl would show =
it. So perhaps it runs and exits. So I use

Systemctl status  xyz.openbmc_project.Hwmon@.service

And see it calls it Phosphor Hwmon Poller, says it is loaded and lists a =
file:// long path to the service, static, vendor preset: enabled. But it =
also shows

Active:inactive (dead)

The some lines like:

the-date raspberrypi4 systemd[1]: Condition check resulted in Phosphor =
Hwmon Poller being skipped.

If I had to guess, it can=E2=80=99f find something in the /sys path.

journalctl -u  xyz.openbmc_project.Hwmon@.service gives the same =
messages.

So going back to the start_hwmon.sh

The udev variables are:

DEVPATH =3D /devices/platform/soc/fe804000.i2c/i2c-1/1-0030
OF_FULLNAME =3D /soc/i2c@7e804000/ltc3880@30

The start script cooks up this service name =
@-soc-i2c\x407e804000-ltc3880\x4030.service

Which is escaping OF_FULLNAME @ and replacing / with -

I assume the service uses that to go a hunting for the hwmon device and =
hopefully it knows to look in =
/sys/devices/platform/soc/fe804000.i2c/i2c-1/1-0030, which is really a =
directory to hwmon. That would mean the service has to know to look in =
/sys/devices/platform, because that is not passed to the service.

I noticed that the service file is really a configuration file. So I cat =
it out.

It has a ConditionFileNotEmpty=3D/etc/default/obmc/hwmon/%I.conf

This is the parent with child soc=E2=80=A6 to the conf files. So I =
should be a proper path. So I compare that path to the service name path =
to see if they match in any way.

The path to this device is

soc/i2c/@7e804000/ltc3880@30

So its a match with the name of the service. That looks good.

Then it seems to run

/usr/bin/env phosphor-hwmon-readd -o $I
With SyslogIdentifier phosphor-hwmon-readd

I assume that the errors from the status somehow are consuming this =
Syslog.

So perhaps this comes down to the meaning of

the-date raspberrypi4 systemd[1]: Condition check resulted in Phosphor =
Hwmon Poller being skipped.

A google search seems to indicate this is a systemd message and is =
applied to disk checks, etc.

Any ideas on how to debug, or what might be amiss?

Also, I searched the source tree for phosphor-hwmon-readd* and come up =
empty. So I am not sure how to find the source for this. It does end up =
on the rootfs, so something is building. The name of the sources must be =
different. So I could not look in code to see how it does its job when =
it is run.

Mike



> On Aug 4, 2020, at 1:54 PM, Matt Spinler <mspinler@linux.ibm.com> =
wrote:
>=20
>=20
>=20
> On 8/3/2020 1:03 PM, Mike Jones wrote:
>> My RaspPi work has progressed but I don=E2=80=99t know how to get =
sensors in the ObjectMapper, which I hope will mean sensors end up in =
webui.
>>=20
>> BASIC INFORMATION
>> ------------------------------
>>=20
>> At this point, I have my PMbus devices in the device tree like this =
path:
>>=20
>> =
/sys/firmware/devicetree/base/soc/i2c@7e804000/ltc2974@32/regulators/vout0=
 to vout3
>>=20
>> And the config files like this path:
>>=20
>> /etc/default/obmc/hwmon/soc/i2c#7e804000/ltc2974@32/reg1@32.conf =
<mailto:32/reg1@32.conf> <mailto:32/reg1@32.conf =
<mailto:32/reg1@32.conf>>
>>=20
>> The sensors show up here:
>>=20
>> /sys/bus/i2c/devices/1-0032/hwmon/hwmon2
>>=20
>> Indicating that the device tree is causing hwmon to offer its =
telemetry nodes.
>>=20
>> =46rom my reading of the docs, it seems like the ObjectMapper keeps =
an inventory of sensors.
>>=20
>> So to search, I did something like:
>>=20
>> dbus-send =E2=80=94system -print-reply \
>> =E2=80=94dest=3Dxyz.openbmc_project.ObjectMapper \
>> /xyz/openbmc_project/object_mapper \
>> xyz.openbmc_project.ObjectMapper.GetAncestors \
>> string:=E2=80=9D/xyz/openbmc_project/inventory.system=E2=80=9D =
array:string: | grep ltc2974
>>=20
>> But none of my devices are there.
>>=20
>> I looked at meta-ibm and meta-hxt and could not see how to get the =
devices into the ObjectMapper.
>>=20
>> ACTUAL QUESTIONS
>> ------------------------------
>>=20
>> So I have these questions:
>>=20
>> - What it the mechanism for getting these into the ObjectMapper?
>=20
> Hi,
> The mapper just adds some convenience functions to be able to find =
things on D-Bus, so if the mapper
> can't find it, then it isn't on D-Bus.
>=20
> =
https://github.com/openbmc/docs/blob/master/architecture/sensor-architectu=
re.md =
<https://github.com/openbmc/docs/blob/master/architecture/sensor-architect=
ure.md> talks about how
> phosphor-hwmon-readd will put sensor values on D-Bus.  What I don't =
think it mentions is that it
> uses a udev rule to start its service when udev sees the hwmon =
subsystem hotplug.
>=20
>> - Once there, will they show up in webui without any other files and =
recipes?
>=20
> Yea, they will show up as /xyz/openbmc_project/sensors/<type>/<name> =
and bmcweb can find that.
>=20
>> - What docs might describe what I need to know to connect the hwmon =
devices to the ObjectMapper?
>=20
> That sensors doc I mentioned above has the goal of describing that.
>=20
>> - Is there something I have to do to start the ObjectMapper service? =
I don=E2=80=99t see it with a grep through systemctl.
>=20
> The service file for that is =
/lib/systemd/system/xyz.openbmc_project.ObjectMapper.service. Hopefully
> that is present on your system.
>=20
>> - Is there an existing meta layer that would be a good example and a =
pointer to the proper bb files to look at?
>=20
> The meta-ibm layer makes extensive use of phosphor-hwmon:
> meta-ibm/recipes-phoshpor/sensors/phosphor-hwmon_%.bbappend
>=20
>>=20
>> THE CODE/LAYERS
>> ----------------------------
>>=20
>> My work so far is here:
>>=20
>> https://github.com/Proclivis/meta-pmbus =
<https://github.com/Proclivis/meta-pmbus>
>>=20
>> Configured by:
>>=20
>> https://github.com/Proclivis/conf-meta-rasberrypi-evb =
<https://github.com/Proclivis/conf-meta-rasberrypi-evb>
>>=20
>> Thanks, and sorry I am a newbie without tribal knowledge. I am trying =
to find solutions on my own and only ask for help when stuck. =
Unfortunately, I=E2=80=99m stuck.
>>=20
>> Mike


--Apple-Mail=_832AC050-F9E8-425B-BE19-BF99E7C939A1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Matt,<div class=3D""><br class=3D""></div><div =
class=3D"">Thanks for the help, I wish this was less painful. I think I =
know how this is supposed to work, but it does not. So I will walk =
through all the steps I took to manually debug, and hopefully you see a =
smoking gun. It could be as simple as the service makes some path =
assumption that does not hold when using raspberrypi=E2=80=99s hwmon =
paths which uses soc rather than ahb paths on an aspeed.<div =
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
class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
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
class=3D""></div></div></body></html>=

--Apple-Mail=_832AC050-F9E8-425B-BE19-BF99E7C939A1--
