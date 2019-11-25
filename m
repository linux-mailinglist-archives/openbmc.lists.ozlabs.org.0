Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 773E610951F
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 22:28:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MKrn4510zDqDr
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:28:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=embeddedsteve@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GY7VxWKM"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MKrC31LvzDqDr
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 08:27:36 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id x21so7482011oic.0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 13:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wZBg482ILZamMwh6WC7fyu0JuB/xmeOrSua1mC9I8Yk=;
 b=GY7VxWKMZDfaGGwyjL8GEG3l8e56kDZhuDiRQVcomy6drmwzkNpFYEtBifSRI6n+y+
 zwO4BG1qb6FXkuvSe9OEtCspFY04sJcEGXKhXR0xvHK1BDDCt6Wwr/2ZWr6F7McIoikk
 j7ZwYOxC70XNYT1v23eALvtp1/WA4Jh9WTUZIGz1pKOrYlWjdJEFrg31lQgqiQnaUPw2
 xGVKD+RCOIUpbVsRfFK7psGefKp05j6AgTmu2JMYAnLHe8Pr+S8tkQxMjIURKu6VAOiH
 fzwzaHHWly1xKuX6KkesmloCf9CRwp0WaWYRVHICqG/A/Ee4fatchuqPeNze6b2XdFB3
 lOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wZBg482ILZamMwh6WC7fyu0JuB/xmeOrSua1mC9I8Yk=;
 b=pYTnbi8LLmTtFkgYd3GWgrzifaUHTwAclsA9NOnL4fedFxnwKqzM3uDjtITQCf5WAl
 WNcwMwUEZAJom58sADY6CkzeFTcV9h0shNZqG5P9MAlKRh2F9ve7IxE5YPKBD6Rl1jNC
 eF1kKur2GsaXjIug1OYIJFW6ig5Hc64vpWQEi4o0Dp68eTZqUtGReTx4qXPAJg0iYsk0
 0XqO7zG8MUXMs2PgFEhTe6WAMVobfitgydAa6210UefYxVJcZ1eoD7p9dJIVW0EOOxSI
 dN2C16pDZPHSYuKK++5xlzvOAl9AJxaRa80OxhgtiHapWsVtiieZA34QoWXa83Is2gGQ
 PbiA==
X-Gm-Message-State: APjAAAUKNzX2ZiH37/jrGeFIfZrRlR8KnWPH4J5rUC5Xzsemc9Ch/FLD
 hNOrOrkw571x4ysIZlShbnTwk1S9Gx2P2fOFf07JuhIT
X-Google-Smtp-Source: APXvYqy9pQj78xKEH8xhxVZqjfcTlo/sKPrMrjpMJYYjU4wcmgI05cxgDrTvzpUPnTFfl+9qFWSbxqdU5+84NHpPxA0=
X-Received: by 2002:a05:6808:b1c:: with SMTP id
 s28mr766358oij.12.1574717252603; 
 Mon, 25 Nov 2019 13:27:32 -0800 (PST)
MIME-Version: 1.0
From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Mon, 25 Nov 2019 16:27:21 -0500
Message-ID: <CAN34fowOEdscU-f43KDygEmAzmJyYAC1bifzDPn+8MwKkPrfug@mail.gmail.com>
Subject: Ongoing Questions about OpenBMC
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007696e70598326e84"
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

--0000000000007696e70598326e84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings,
     I have some additional/newbie type questions here that are blocking my
progress with this Proof-of-Concept.
We currently have an OpenBMC image booting in QEMU (version 4.1.0) and have
been investigating certain aspects of this image, namely IPMI command
support and sensors, as these are 2 areas we will need to modify prior to
porting this onto our target platform. (AST2500 based).

Sensors:
We=E2=80=99ve read through the documentation and pieced together the follow=
ing:
 -  Sensors get defined in the DTS file, which is =E2=80=9Cconsumed=E2=80=
=9D by the Linux
kernel.  This defines the physical device=E2=80=99s aspects (i.e. on which =
I2C bus
at what address).
 -  These sensors are inputs to the Linux Kernel=E2=80=99s hwmon sub-system=
.
Access is exported via sysfs entries for access by ???
 -  There are some .conf and .yaml files that contain the
limits/ranges/properties for these devices. This information is
=E2=80=9Cinitialized=E2=80=9D (?) into dbus objects, where the name of the =
sensor=E2=80=99s
configuration file is the exported sysfs name, correct?
 -  systemd is used to start up the various services associated with these
objects, as defined in dbus.
 -  It was stated on the documentation that the sensors become =E2=80=9Cobj=
ects=E2=80=9D
that will broadcast their state change on the dbus for others to know about
this change.  What is it that =E2=80=9Cdetects=E2=80=9D this change?  An in=
terrupt from the
Sensors? (which seems odd to me, in my 30+ years, I=E2=80=99ve not seen too=
 many
temp sensors that are interrupt driven).  Are these objects polled?  By
whom?  Our best guess so far seems to indicate that the phosphor-hwmon
service is what polls these.
 -  Is there a sensor cache where polled readings are stored? It seemed to
be hinted at but never stated explicitly.


The reason for these questions are:
 -  In poking around the image loaded in QEMU, we don=E2=80=99t seem to be =
seeing
any Sensor updates occurring.  We would like to be able to =E2=80=9Cstub=E2=
=80=9D these for
simulation purposes, as we need to add in all of the platform sensors we
need to monitor (~ 100).
 -  There is an lm75 defined.  It shows up in the sysfs.  However, it does
not show up in the IPMI listing of the sensors or on the dbus.
 -  It seems that maybe the sensor monitoring is not running?  Could it be
that some service is not being started, due to this being QEMU?  Any
insights on this?
 -  If this is simply a limitation of Qemu, is there a recommended
method/scheme to handle the =E2=80=9Cstubbing=E2=80=9D of sensors?  (i.e. r=
unning a
background script that writes to the sysfs entries to periodically change
the readings?)


IPMI Commands:
 -  We=E2=80=99ve tracked through the code and believe we=E2=80=99ve found =
the code
responsible for some of the commands.
 -  As an experiment, we=E2=80=99d like to modify this source code accordin=
gly to
verify this is the code executing the command.  This then brought up the
question:  How is this done?
 -  We=E2=80=99ve identified the following:
the =E2=80=9Copenbmc=E2=80=9D meta directory is just that:  meta-data - no =
code here.
=E2=80=9CALL=E2=80=9D code is fetched from the various GitHub repos for thi=
s project.
So if we wanted to modify, say phosphor-ipmi-host, we would:
a) clone this repo and populate it with the code
b) make the modifications necessary.
c) How then to tell the build system to use this modified code for the
build?  Modify the bitbake recipe in the meta- directory to point the
SRC_URI here?
 -  Which then brought up the following question(s):
How does one go about adding in new code in this setup?  (assuming that
we=E2=80=99re NOT just trying to append to existing functionality, but addi=
ng
entirely new proprietary functionality to the system both inside our layer
and in other repos).
Would we need to do this for each and every Repo we are adding and/or
modifying as part of our system?
Is there a =E2=80=9Cglobal=E2=80=9D way to handle this? (Yocto documentatio=
n talks about
the EXTERNALSRC capability and the .bbclass to include)

Regards,
Stephen Beckwith

--0000000000007696e70598326e84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<br>=C2=A0 =C2=A0 =C2=A0I have some additional/n=
ewbie type questions here that are blocking my progress with this Proof-of-=
Concept.<br>We currently have an OpenBMC image booting in QEMU (version 4.1=
.0) and have been investigating certain aspects of this image, namely IPMI =
command support and sensors, as these are 2 areas we will need to modify pr=
ior to porting this onto our target platform. (AST2500 based).<br><br>Senso=
rs:<br>We=E2=80=99ve read through the documentation and pieced together the=
 following:<br>=C2=A0- =C2=A0Sensors get defined in the DTS file, which is =
=E2=80=9Cconsumed=E2=80=9D by the Linux kernel.=C2=A0 This defines the phys=
ical device=E2=80=99s aspects (i.e. on which I2C bus at what address).<br>=
=C2=A0- =C2=A0These sensors are inputs to the Linux Kernel=E2=80=99s hwmon =
sub-system.=C2=A0 Access is exported via sysfs entries for access by ???<br=
>=C2=A0- =C2=A0There are some .conf and .yaml files that contain the limits=
/ranges/properties for these devices. This information is =E2=80=9Cinitiali=
zed=E2=80=9D (?) into dbus objects, where the name of the sensor=E2=80=99s =
configuration file is the exported sysfs name, correct?<br>=C2=A0- =C2=A0sy=
stemd is used to start up the various services associated with these object=
s, as defined in dbus. =C2=A0<br>=C2=A0- =C2=A0It was stated on the documen=
tation that the sensors become =E2=80=9Cobjects=E2=80=9D that will broadcas=
t their state change on the dbus for others to know about this change.=C2=
=A0 What is it that =E2=80=9Cdetects=E2=80=9D this change?=C2=A0 An interru=
pt from the Sensors? (which seems odd to me, in my 30+ years, I=E2=80=99ve =
not seen too many temp sensors that are interrupt driven).=C2=A0 Are these =
objects polled?=C2=A0 By whom?=C2=A0 Our best guess so far seems to indicat=
e that the phosphor-hwmon service is what polls these.<br>=C2=A0- =C2=A0Is =
there a sensor cache where polled readings are stored? It seemed to be hint=
ed at but never stated explicitly.<br><br><br>The reason for these question=
s are:<br>=C2=A0- =C2=A0In poking around the image loaded in QEMU, we don=
=E2=80=99t seem to be seeing any Sensor updates occurring.=C2=A0 We would l=
ike to be able to =E2=80=9Cstub=E2=80=9D these for simulation purposes, as =
we need to add in all of the platform sensors we need to monitor (~ 100). =
=C2=A0<br>=C2=A0- =C2=A0There is an lm75 defined.=C2=A0 It shows up in the =
sysfs.=C2=A0 However, it does not show up in the IPMI listing of the sensor=
s or on the dbus. =C2=A0<br>=C2=A0- =C2=A0It seems that maybe the sensor mo=
nitoring is not running?=C2=A0 Could it be that some service is not being s=
tarted, due to this being QEMU?=C2=A0 Any insights on this?<br>=C2=A0- =C2=
=A0If this is simply a limitation of Qemu, is there a recommended method/sc=
heme to handle the =E2=80=9Cstubbing=E2=80=9D of sensors? =C2=A0(i.e. runni=
ng a background script that writes to the sysfs entries to periodically cha=
nge the readings?)<br><br><br>IPMI Commands:<br>=C2=A0- =C2=A0We=E2=80=99ve=
 tracked through the code and believe we=E2=80=99ve found the code responsi=
ble for some of the commands. =C2=A0<br>=C2=A0- =C2=A0As an experiment, we=
=E2=80=99d like to modify this source code accordingly to verify this is th=
e code executing the command.=C2=A0 This then brought up the question: =C2=
=A0How is this done?<br>=C2=A0- =C2=A0We=E2=80=99ve identified the followin=
g:<br>	the =E2=80=9Copenbmc=E2=80=9D meta directory is just that: =C2=A0met=
a-data - no code here.<br>	=E2=80=9CALL=E2=80=9D code is fetched from the v=
arious GitHub repos for this project.<br>So if we wanted to modify, say pho=
sphor-ipmi-host, we would:<br>	a) clone this repo and populate it with the =
code<br>	b) make the modifications necessary.<br>	c) How then to tell the b=
uild system to use this modified code for the build?=C2=A0 Modify the bitba=
ke recipe in the meta- directory to point the SRC_URI here? =C2=A0 <br>=C2=
=A0- =C2=A0Which then brought up the following question(s):<br>	How does on=
e go about adding in new code in this setup? =C2=A0(assuming that we=E2=80=
=99re NOT just trying to append to existing functionality, but adding entir=
ely new proprietary functionality to the system both inside our layer and i=
n other repos).<br>	Would we need to do this for each and every Repo we are=
 adding and/or modifying as part of our system?<br><div>	Is there a =E2=80=
=9Cglobal=E2=80=9D way to handle this? (Yocto documentation talks about the=
 EXTERNALSRC capability and the .bbclass to include)</div><div><br></div><d=
iv>Regards,</div><div>Stephen Beckwith</div><div><br></div></div>

--0000000000007696e70598326e84--
