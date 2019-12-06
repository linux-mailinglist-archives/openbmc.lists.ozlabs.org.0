Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB21158CB
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 22:50:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V5qq3wggzDqj4
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 08:50:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=embeddedsteve@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JAbkvoXA"; 
 dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V5pp4sw0zDqgB
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 08:49:51 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id x195so1165632oix.4
 for <openbmc@lists.ozlabs.org>; Fri, 06 Dec 2019 13:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+OT9aHvuzTTAaM+hjghy22A62J08VKS8ga11RYqrdc=;
 b=JAbkvoXAWygk0qtybebyLAG20/VYnHrObY27G9NlzzgLHOb1/uiPO2Njy8zlTAnR1Y
 7j3bSxApumC7mInWbRgQ0lgqqSmCSDsqwzWsujJLfaG2Y/ejpeIvgxWelVdzNy8meRwK
 akNfhAjUl2rgalqf37n1mJ7NVQjKWBhR0HOgX8LTlK9YwGq3lRHOGedr7UDEOHe5kqDl
 mzwfcbUVfGMY87hob2KolaDIBK6BECJp6rk8iMDHKCfwuSAC0g/e1ZZH0vnxNiWKxLFe
 BcRLujzLmlkP3aLtXPYpDRnYYvShppdyXSledlsUqjE+Mzn9/jSBmxDORFgq9reiuO9w
 tUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+OT9aHvuzTTAaM+hjghy22A62J08VKS8ga11RYqrdc=;
 b=jsx+/ZqDPscN9+TOp+p3PyojkPGtQL3fO0Z4R9hBzqclTJ81vB3ZnKTuz32ZkwKdAL
 Z8yegbgE/7MFAZcTXP3gEkvvnpZ9o6/RS0aRCtvPYGPSXboYnsujJES0x3vRV57j4kaI
 bvwV0qEUWRopQe6UcKLt2PWuEWscTIXBZ1z4mukCkrWUg+H/I9YVOzzLlWTLPgHu6LG/
 hhGs2kyAhjTfAdmKkpvt/WZQwh5l9LjqikkLGu9/nxTcjIhGZFCAIL9QEDKx2mjS9I+w
 p52febu+6p0fzmUad/F4Gpznkv2SdPSGmWVj3QymSxHihStktRxE/u1eWifQ2N7gO2Gi
 sySg==
X-Gm-Message-State: APjAAAVVGNPla7KH4gHMt2Pw/9uJXAZ5tr9eyq5TKB3cplP0+uuwim3W
 nUt/ZOs+n6nv6pxOlBK2SM29n48m6fg0bEFVc/w=
X-Google-Smtp-Source: APXvYqzyuH1/NsBbWQXYcZciZqR4h9h4ZJUgmD8qwJSvLdNgeNAZ707oJlQqz9RQQA/r+c+Z+LHU3xQxjeiUVztLaLI=
X-Received: by 2002:aca:758c:: with SMTP id q134mr14756445oic.33.1575668988461; 
 Fri, 06 Dec 2019 13:49:48 -0800 (PST)
MIME-Version: 1.0
References: <CAN34fowOEdscU-f43KDygEmAzmJyYAC1bifzDPn+8MwKkPrfug@mail.gmail.com>
 <CAJoAoZ=hC9NT81sW4WPFP5hp7ds2k0RPf0f6wREPDHvv7qzknw@mail.gmail.com>
 <CAJoAoZ=HusYNxj5x=fNwmDoBdy9p26WbWRSEr0ohmuvLPsn06g@mail.gmail.com>
In-Reply-To: <CAJoAoZ=HusYNxj5x=fNwmDoBdy9p26WbWRSEr0ohmuvLPsn06g@mail.gmail.com>
From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Fri, 6 Dec 2019 16:49:37 -0500
Message-ID: <CAN34fozB7moOU_yCvT49qDoRppw1P5hTLhcu=T+dD2AnmxWiRQ@mail.gmail.com>
Subject: Re: Ongoing Questions about OpenBMC
To: Emily Shaffer <emilyshaffer@google.com>
Content-Type: multipart/alternative; boundary="00000000000057484f0599100687"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000057484f0599100687
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Emily,
   Thank you very much for your comments and suggestions.  Some have have
been helpful.  However, I've seemed to have run into an issue with the
"devtool modify" setup.   Please let me explain:
I have setup what I will call an "external build" setup (which is similar
to how we handle our current development).  As an example:
~/home/sbeckwit/yocto_dev    is the "root"
=E2=94=9C=E2=94=80=E2=94=80 obmc-build
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 downloads
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 sstate-cache
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 tmp
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 workspace
=E2=94=9C=E2=94=80=E2=94=80 obmc-dev
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 openbmc    This contains the openbm=
c git repo - all the meta, etc.

The bblaysers.conf file sits in the obmc-dev/openbmc/build/conf directory -
it includes a path to the workspace directory.
There is a devtool.conf also in this obmc-dev/openbmc/build/conf directory,
defines the "workspace_path" to point to the workspace directory.

I have tried run devtool modify from the "dev" directory (in the build
directory) and also from the obmc-build directory.  I've added the - -
bbpath parameter as well as trying the - - basepath, in all cases I get the
failure below.

Synopsis:
 -  The files devtool is looking for exist, in a directory in the path, but
for some reason it's just not able to "figure it out".  Maybe because of
the external build setup??
 - Is this something for the Yocto team??
We did an experiment with a "poky" (separate stand-alone setup we started
with) and this did seem to work, but this was a "self-contained" setup,
i.e. it does not use a "external build directory" setup.

You insights are greatly appreciated!

Regards,
Stephen Beckwith



Initialising tasks: 100%
|###########################################################| Time: 0:00:00
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_replace_entity_default (log file is located at
/home/sbeckwit/yocto_dev/obmc-build/tmp
/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitAUTOINC+455ee0b=
99c-
r1/devtooltmp-s45iteon/temp/log.do_patch.6941)
ERROR: Logfile of failure stored in:
/home/sbeckwit/yocto_dev/obmc-build/tmp/work/armv6-openbmc-linux-gnueabi/ph=
osphor-ipmi-host/1.0+gitAUTOINC+455ee0b99c-r1/devtooltmp-s45iteon/temp/log.=
do_patch.6941
Log data follows:
| DEBUG: Executing python function devtool_pre_patch
| DEBUG: Python function devtool_pre_patch finished
| DEBUG: Executing python function patch_task_patch_prefunc
| DEBUG: Python function patch_task_patch_prefunc finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are []
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: []
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function do_patch
| DEBUG: Executing python function patch_do_patch

File being looked for in the output: - yet these are IN the specified
directory that is in the path list:

| DEBUG: Searching for entity.yaml in paths:
| DEBUG: Searching for merge_yamls.py in paths:
| DEBUG: Searching for
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service in paths:
| DEBUG: Searching for phosphor-ipmi-host.service in paths:

=3D=3D> This path shows up in each of the 4 sets of files listed for each o=
f
the searches above.


*|
/home/sbeckwit/yocto_dev/obmc-dev/openbmc/meta-phosphor/recipes-phosphor/ip=
mi/phosphor-ipmi-host/*
| DEBUG: Python function patch_do_patch finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_replace_entity_default
| cp: cannot stat 'entity.yaml': No such file or directory
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function do_patch finished
| ERROR: Function failed: do_replace_entity_default (log file is located at
/home/sbeckwit/yocto_dev/obmc-build/tmp/work/armv6-openbmc-linux-gnueabi/ph=
osphor-ipmi-host/1.0+gitAUTOINC+455ee0b99c-r1/devtooltmp-s45iteon/temp/log.=
do_patch.6941)
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun
and 1 failed.
ERROR: Extracting source for phosphor-ipmi-host failed




*sbeckwit@ubuntu:~/yocto_dev/obmc-dev/openbmc/meta-phosphor/recipes-phospho=
r/ipmi/phosphor-ipmi-host$
lsentity.yaml     phosphor-ipmi-host.servicemerge_yamls.py
 xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service*


On Mon, Nov 25, 2019 at 4:43 PM Emily Shaffer <emilyshaffer@google.com>
wrote:

> On Mon, Nov 25, 2019 at 1:41 PM Emily Shaffer <emilyshaffer@google.com>
> wrote:
> >
> > On Mon, Nov 25, 2019 at 1:28 PM Stephen Beckwith
> > <embeddedsteve@gmail.com> wrote:
> > >
> > > Greetings,
> > >      I have some additional/newbie type questions here that are
> blocking my progress with this Proof-of-Concept.
> >
> > Hi and welcome. I can't answer every question you have but I'll reply
> > where I can and hope for the community to fill in more blanks. :)
> >
> > > We currently have an OpenBMC image booting in QEMU (version 4.1.0) an=
d
> have been investigating certain aspects of this image, namely IPMI comman=
d
> support and sensors, as these are 2 areas we will need to modify prior to
> porting this onto our target platform. (AST2500 based).
> > >
> > > Sensors:
> > > We=E2=80=99ve read through the documentation and pieced together the =
following:
> > >  -  Sensors get defined in the DTS file, which is =E2=80=9Cconsumed=
=E2=80=9D by the
> Linux kernel.  This defines the physical device=E2=80=99s aspects (i.e. o=
n which
> I2C bus at what address).
> > >  -  These sensors are inputs to the Linux Kernel=E2=80=99s hwmon sub-=
system.
> Access is exported via sysfs entries for access by ???
> > >  -  There are some .conf and .yaml files that contain the
> limits/ranges/properties for these devices. This information is
> =E2=80=9Cinitialized=E2=80=9D (?) into dbus objects, where the name of th=
e sensor=E2=80=99s
> configuration file is the exported sysfs name, correct?
> > >  -  systemd is used to start up the various services associated with
> these objects, as defined in dbus.
> > >  -  It was stated on the documentation that the sensors become
> =E2=80=9Cobjects=E2=80=9D that will broadcast their state change on the d=
bus for others to
> know about this change.  What is it that =E2=80=9Cdetects=E2=80=9D this c=
hange?  An
> interrupt from the Sensors? (which seems odd to me, in my 30+ years, I=E2=
=80=99ve
> not seen too many temp sensors that are interrupt driven).  Are these
> objects polled?  By whom?  Our best guess so far seems to indicate that t=
he
> phosphor-hwmon service is what polls these.
> >
> > phosphor-hwmon is responsible for most of these, yeah.
> >
> > >  -  Is there a sensor cache where polled readings are stored? It
> seemed to be hinted at but never stated explicitly.
> > >
> > >
> > > The reason for these questions are:
> > >  -  In poking around the image loaded in QEMU, we don=E2=80=99t seem =
to be
> seeing any Sensor updates occurring.  We would like to be able to =E2=80=
=9Cstub=E2=80=9D
> these for simulation purposes, as we need to add in all of the platform
> sensors we need to monitor (~ 100).
> > >  -  There is an lm75 defined.  It shows up in the sysfs.  However, it
> does not show up in the IPMI listing of the sensors or on the dbus.
>
> Ah, I skimmed in my first pass and neglected this. It's likely that
> this sensor isn't in your sensor list yaml, which IPMI draws on. See
>
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor=
-example.yaml
> .
>
> > >  -  It seems that maybe the sensor monitoring is not running?  Could
> it be that some service is not being started, due to this being QEMU?  An=
y
> insights on this?
> > >  -  If this is simply a limitation of Qemu, is there a recommended
> method/scheme to handle the =E2=80=9Cstubbing=E2=80=9D of sensors?  (i.e.=
 running a
> background script that writes to the sysfs entries to periodically change
> the readings?)
> > >
> > >
> > > IPMI Commands:
> > >  -  We=E2=80=99ve tracked through the code and believe we=E2=80=99ve =
found the code
> responsible for some of the commands.
> > >  -  As an experiment, we=E2=80=99d like to modify this source code ac=
cordingly
> to verify this is the code executing the command.  This then brought up t=
he
> question:  How is this done?
> > >  -  We=E2=80=99ve identified the following:
> > > the =E2=80=9Copenbmc=E2=80=9D meta directory is just that:  meta-data=
 - no code here.
> > > =E2=80=9CALL=E2=80=9D code is fetched from the various GitHub repos f=
or this project.
> > > So if we wanted to modify, say phosphor-ipmi-host, we would:
> > > a) clone this repo and populate it with the code
> > > b) make the modifications necessary.
> > > c) How then to tell the build system to use this modified code for th=
e
> build?  Modify the bitbake recipe in the meta- directory to point the
> SRC_URI here?
> >
> > During hacking, you can use 'devtool' which is used to help configure
> > the bitbake run. I think 'devtool modify' is what you're looking for
> > to ask for your local copy instead of the SRC_URI destination.
> >
> > >  -  Which then brought up the following question(s):
> > > How does one go about adding in new code in this setup?  (assuming
> that we=E2=80=99re NOT just trying to append to existing functionality, b=
ut adding
> entirely new proprietary functionality to the system both inside our laye=
r
> and in other repos).
> >
> > As I understand it, when you write the recipe for your internal
> > platform (which you will need to do anyway - for example a Zaius
> > builds differently than a Tioga Pass) you will point the SRC_URI to
> > the internal branch or fork of, say, phosphor-host-ipmi. That branch
> > carries your patches - proprietary features that can't be upstreamed,
> > or hotfixes you couldn't wait for upstream to merge. Then, your
> > internal branch of each project should be rebased regularly against
> > what is happening upstream.  I'll try not to get into upstreaming best
> > practices, but you should keep in mind when you're checking things in
> > downstream that should really be sent upstream - i.e., bug fixes that
> > affect everyone - that your downstream branch needs to be able to cope
> > once those patches make it into the upstream you're rebasing against.
> >
> > > Would we need to do this for each and every Repo we are adding and/or
> modifying as part of our system?
> >
> > If there are changes from upstream, those changes have to go
> > somewhere, and your recipe needs to reference them. If there's no
> > changes from upstream but you want to include different 100%-upstream
> > packages, you'd change that in your recipe, AIUI.
> >
> > > Is there a =E2=80=9Cglobal=E2=80=9D way to handle this? (Yocto docume=
ntation talks
> about the EXTERNALSRC capability and the .bbclass to include)
> >
> > Take it with a grain of salt from me; it's been some time since I did
> > much with bitbake recipes. These days I'm just a humble IPMI hospice
> > carer :)
> >
> >  - Emily
>

--00000000000057484f0599100687
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Emily,</div><div>=C2=A0=C2=A0 Thank you very much =
for your comments and suggestions.=C2=A0 Some have have been helpful.=C2=A0=
 However, I&#39;ve seemed to have run into an issue with the &quot;devtool =
modify&quot; setup.=C2=A0=C2=A0 Please let me explain:</div><div>I have set=
up what I will call an &quot;external build&quot; setup (which is similar t=
o how we handle our current development).=C2=A0 As an example:</div><div>~/=
home/sbeckwit/yocto_dev=C2=A0=C2=A0=C2=A0 is the &quot;root&quot;</div><div=
><span style=3D"font-family:monospace">=E2=94=9C=E2=94=80=E2=94=80 obmc-bui=
ld<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 downloads<br>=E2=94=
=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 sstate-cache<br>=E2=94=82=C2=A0=
=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 tmp<br>=E2=94=82=C2=A0=C2=A0 =E2=94=94=
=E2=94=80=E2=94=80 workspace<br>=E2=94=9C=E2=94=80=E2=94=80 obmc-dev<br>=E2=
=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 openbmc=C2=A0=C2=A0=C2=A0 <s=
pan style=3D"font-family:arial,sans-serif">This contains the openbmc git re=
po - all the meta, etc.</span>=C2=A0 <br></span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 </div><div>The bblaysers.conf file sits in the obmc-d=
ev/openbmc/build/conf directory - it includes a path to the workspace direc=
tory.</div><div>There is a devtool.conf also in this obmc-dev/openbmc/build=
/conf directory, defines the &quot;workspace_path&quot; to point to the wor=
kspace directory.</div><div><br></div><div>I have tried run devtool modify =
from the &quot;dev&quot; directory (in the build directory) and also from t=
he obmc-build directory.=C2=A0 I&#39;ve added the - - bbpath parameter as w=
ell as trying the - - basepath, in all cases I get the failure below.=C2=A0=
 <br></div><div><br></div><div>Synopsis:</div><div>=C2=A0-=C2=A0 The files =
devtool is looking for exist, in a directory in the path, but for some reas=
on it&#39;s just not able to &quot;figure it out&quot;.=C2=A0 Maybe because=
 of the external build setup??=C2=A0 <br></div><div>=C2=A0- Is this somethi=
ng for the Yocto team??=C2=A0 <br></div><div>We did an experiment with a &q=
uot;poky&quot; (separate stand-alone setup we started with) and this did se=
em to work, but this was a &quot;self-contained&quot; setup, i.e. it does n=
ot use a &quot;external build directory&quot; setup. <br></div><div><br></d=
iv><div>You insights are greatly appreciated!</div><div><br></div><div>Rega=
rds,</div><div>Stephen Beckwith</div><div><br></div><div><br></div><div><br=
><span style=3D"font-family:monospace">Initialising tasks: 100% |##########=
#################################################| Time: 0:00:00<br>NOTE: E=
xecuting RunQueue Tasks<br>ERROR: Function failed: do_replace_entity_defaul=
t (log file is located at /home/sbeckwit/yocto_dev/obmc-build/tmp</span>/wo=
rk/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitAUTOINC+455ee0b99c=
-<span style=3D"font-family:monospace">r1/devtooltmp-s45iteon/temp/log.do_p=
atch.6941)<br>ERROR: Logfile of failure stored in: /home/sbeckwit/yocto_dev=
/obmc-build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git=
AUTOINC+455ee0b99c-r1/devtooltmp-s45iteon/temp/log.do_patch.6941<br>Log dat=
a follows:<br>| DEBUG: Executing python function devtool_pre_patch<br>| DEB=
UG: Python function devtool_pre_patch finished<br>| DEBUG: Executing python=
 function patch_task_patch_prefunc<br>| DEBUG: Python function patch_task_p=
atch_prefunc finished<br>| DEBUG: Executing python function extend_recipe_s=
ysroot<br>| NOTE: Direct dependencies are []<br>| NOTE: Installed into sysr=
oot: []<br>| NOTE: Skipping as already exists in sysroot: []<br>| DEBUG: Py=
thon function extend_recipe_sysroot finished<br>| DEBUG: Executing python f=
unction do_patch<br>| DEBUG: Executing python function patch_do_patch<br></=
span><br>File being looked for in the output: - yet these are IN the specif=
ied directory that is in the path list:<br><br><span style=3D"font-family:m=
onospace">| DEBUG: Searching for entity.yaml in paths:<br>| DEBUG: Searchin=
g for merge_yamls.py in paths:<br>| DEBUG: Searching for xyz.openbmc_projec=
t.Ipmi.Internal.SoftPowerOff.service in paths:<br>| DEBUG: Searching for ph=
osphor-ipmi-host.service in paths:<br></span><br>=3D=3D&gt; This path shows=
 up in each of the 4 sets of files listed for each of the searches above.<b=
r><br><b><span style=3D"font-family:monospace">| =C2=A0 =C2=A0 /home/sbeckw=
it/yocto_dev/obmc-dev/openbmc/meta-phosphor/recipes-phosphor/ipmi/phosphor-=
ipmi-host/<br></span></b><br>| DEBU<span style=3D"font-family:monospace">G:=
 Python function patch_do_patch finished<br>| DEBUG: SITE files [&#39;endia=
n-little&#39;, &#39;bit-32&#39;, &#39;arm-common&#39;, &#39;arm-32&#39;, &#=
39;common-linux&#39;, &#39;common-glibc&#39;, &#39;arm-linux&#39;, &#39;arm=
-linux-gnueabi&#39;, &#39;common&#39;]<br>| DEBUG: Executing shell function=
 do_replace_entity_default<br>| cp: cannot stat &#39;entity.yaml&#39;: No s=
uch file or directory<br>| WARNING: exit code 1 from a shell command.<br>| =
DEBUG: Python function do_patch finished<br>| ERROR: Function failed: do_re=
place_entity_default (log file is located at /home/sbeckwit/yocto_dev/obmc-=
build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitAUTOIN=
C+455ee0b99c-r1/devtooltmp-s45iteon/temp/log.do_patch.6941)<br>NOTE: Tasks =
Summary: Attempted 3 tasks of which 0 didn&#39;t need to be rerun and 1 fai=
led.<br>ERROR: Extracting source for phosphor-ipmi-host failed<br></span><b=
r><b><span style=3D"font-family:monospace">sbeckwit@ubuntu:~/yocto_dev/obmc=
-dev/openbmc/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host$ ls<br>=
entity.yaml =C2=A0 =C2=A0 phosphor-ipmi-host.service<br>merge_yamls.py =C2=
=A0xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service<br></span></b><br=
></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Nov 25, 2019 at 4:43 PM Emily Shaffer &lt;<a =
href=3D"mailto:emilyshaffer@google.com">emilyshaffer@google.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Nov =
25, 2019 at 1:41 PM Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@google=
.com" target=3D"_blank">emilyshaffer@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Nov 25, 2019 at 1:28 PM Stephen Beckwith<br>
&gt; &lt;<a href=3D"mailto:embeddedsteve@gmail.com" target=3D"_blank">embed=
dedsteve@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Greetings,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 I have some additional/newbie type questions =
here that are blocking my progress with this Proof-of-Concept.<br>
&gt;<br>
&gt; Hi and welcome. I can&#39;t answer every question you have but I&#39;l=
l reply<br>
&gt; where I can and hope for the community to fill in more blanks. :)<br>
&gt;<br>
&gt; &gt; We currently have an OpenBMC image booting in QEMU (version 4.1.0=
) and have been investigating certain aspects of this image, namely IPMI co=
mmand support and sensors, as these are 2 areas we will need to modify prio=
r to porting this onto our target platform. (AST2500 based).<br>
&gt; &gt;<br>
&gt; &gt; Sensors:<br>
&gt; &gt; We=E2=80=99ve read through the documentation and pieced together =
the following:<br>
&gt; &gt;=C2=A0 -=C2=A0 Sensors get defined in the DTS file, which is =E2=
=80=9Cconsumed=E2=80=9D by the Linux kernel.=C2=A0 This defines the physica=
l device=E2=80=99s aspects (i.e. on which I2C bus at what address).<br>
&gt; &gt;=C2=A0 -=C2=A0 These sensors are inputs to the Linux Kernel=E2=80=
=99s hwmon sub-system.=C2=A0 Access is exported via sysfs entries for acces=
s by ???<br>
&gt; &gt;=C2=A0 -=C2=A0 There are some .conf and .yaml files that contain t=
he limits/ranges/properties for these devices. This information is =E2=80=
=9Cinitialized=E2=80=9D (?) into dbus objects, where the name of the sensor=
=E2=80=99s configuration file is the exported sysfs name, correct?<br>
&gt; &gt;=C2=A0 -=C2=A0 systemd is used to start up the various services as=
sociated with these objects, as defined in dbus.<br>
&gt; &gt;=C2=A0 -=C2=A0 It was stated on the documentation that the sensors=
 become =E2=80=9Cobjects=E2=80=9D that will broadcast their state change on=
 the dbus for others to know about this change.=C2=A0 What is it that =E2=
=80=9Cdetects=E2=80=9D this change?=C2=A0 An interrupt from the Sensors? (w=
hich seems odd to me, in my 30+ years, I=E2=80=99ve not seen too many temp =
sensors that are interrupt driven).=C2=A0 Are these objects polled?=C2=A0 B=
y whom?=C2=A0 Our best guess so far seems to indicate that the phosphor-hwm=
on service is what polls these.<br>
&gt;<br>
&gt; phosphor-hwmon is responsible for most of these, yeah.<br>
&gt;<br>
&gt; &gt;=C2=A0 -=C2=A0 Is there a sensor cache where polled readings are s=
tored? It seemed to be hinted at but never stated explicitly.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; The reason for these questions are:<br>
&gt; &gt;=C2=A0 -=C2=A0 In poking around the image loaded in QEMU, we don=
=E2=80=99t seem to be seeing any Sensor updates occurring.=C2=A0 We would l=
ike to be able to =E2=80=9Cstub=E2=80=9D these for simulation purposes, as =
we need to add in all of the platform sensors we need to monitor (~ 100).<b=
r>
&gt; &gt;=C2=A0 -=C2=A0 There is an lm75 defined.=C2=A0 It shows up in the =
sysfs.=C2=A0 However, it does not show up in the IPMI listing of the sensor=
s or on the dbus.<br>
<br>
Ah, I skimmed in my first pass and neglected this. It&#39;s likely that<br>
this sensor isn&#39;t in your sensor list yaml, which IPMI draws on. See<br=
>
<a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/master/scrip=
ts/sensor-example.yaml" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor-example.yaml</a=
>.<br>
<br>
&gt; &gt;=C2=A0 -=C2=A0 It seems that maybe the sensor monitoring is not ru=
nning?=C2=A0 Could it be that some service is not being started, due to thi=
s being QEMU?=C2=A0 Any insights on this?<br>
&gt; &gt;=C2=A0 -=C2=A0 If this is simply a limitation of Qemu, is there a =
recommended method/scheme to handle the =E2=80=9Cstubbing=E2=80=9D of senso=
rs?=C2=A0 (i.e. running a background script that writes to the sysfs entrie=
s to periodically change the readings?)<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; IPMI Commands:<br>
&gt; &gt;=C2=A0 -=C2=A0 We=E2=80=99ve tracked through the code and believe =
we=E2=80=99ve found the code responsible for some of the commands.<br>
&gt; &gt;=C2=A0 -=C2=A0 As an experiment, we=E2=80=99d like to modify this =
source code accordingly to verify this is the code executing the command.=
=C2=A0 This then brought up the question:=C2=A0 How is this done?<br>
&gt; &gt;=C2=A0 -=C2=A0 We=E2=80=99ve identified the following:<br>
&gt; &gt; the =E2=80=9Copenbmc=E2=80=9D meta directory is just that:=C2=A0 =
meta-data - no code here.<br>
&gt; &gt; =E2=80=9CALL=E2=80=9D code is fetched from the various GitHub rep=
os for this project.<br>
&gt; &gt; So if we wanted to modify, say phosphor-ipmi-host, we would:<br>
&gt; &gt; a) clone this repo and populate it with the code<br>
&gt; &gt; b) make the modifications necessary.<br>
&gt; &gt; c) How then to tell the build system to use this modified code fo=
r the build?=C2=A0 Modify the bitbake recipe in the meta- directory to poin=
t the SRC_URI here?<br>
&gt;<br>
&gt; During hacking, you can use &#39;devtool&#39; which is used to help co=
nfigure<br>
&gt; the bitbake run. I think &#39;devtool modify&#39; is what you&#39;re l=
ooking for<br>
&gt; to ask for your local copy instead of the SRC_URI destination.<br>
&gt;<br>
&gt; &gt;=C2=A0 -=C2=A0 Which then brought up the following question(s):<br=
>
&gt; &gt; How does one go about adding in new code in this setup?=C2=A0 (as=
suming that we=E2=80=99re NOT just trying to append to existing functionali=
ty, but adding entirely new proprietary functionality to the system both in=
side our layer and in other repos).<br>
&gt;<br>
&gt; As I understand it, when you write the recipe for your internal<br>
&gt; platform (which you will need to do anyway - for example a Zaius<br>
&gt; builds differently than a Tioga Pass) you will point the SRC_URI to<br=
>
&gt; the internal branch or fork of, say, phosphor-host-ipmi. That branch<b=
r>
&gt; carries your patches - proprietary features that can&#39;t be upstream=
ed,<br>
&gt; or hotfixes you couldn&#39;t wait for upstream to merge. Then, your<br=
>
&gt; internal branch of each project should be rebased regularly against<br=
>
&gt; what is happening upstream.=C2=A0 I&#39;ll try not to get into upstrea=
ming best<br>
&gt; practices, but you should keep in mind when you&#39;re checking things=
 in<br>
&gt; downstream that should really be sent upstream - i.e., bug fixes that<=
br>
&gt; affect everyone - that your downstream branch needs to be able to cope=
<br>
&gt; once those patches make it into the upstream you&#39;re rebasing again=
st.<br>
&gt;<br>
&gt; &gt; Would we need to do this for each and every Repo we are adding an=
d/or modifying as part of our system?<br>
&gt;<br>
&gt; If there are changes from upstream, those changes have to go<br>
&gt; somewhere, and your recipe needs to reference them. If there&#39;s no<=
br>
&gt; changes from upstream but you want to include different 100%-upstream<=
br>
&gt; packages, you&#39;d change that in your recipe, AIUI.<br>
&gt;<br>
&gt; &gt; Is there a =E2=80=9Cglobal=E2=80=9D way to handle this? (Yocto do=
cumentation talks about the EXTERNALSRC capability and the .bbclass to incl=
ude)<br>
&gt;<br>
&gt; Take it with a grain of salt from me; it&#39;s been some time since I =
did<br>
&gt; much with bitbake recipes. These days I&#39;m just a humble IPMI hospi=
ce<br>
&gt; carer :)<br>
&gt;<br>
&gt;=C2=A0 - Emily<br>
</blockquote></div>

--00000000000057484f0599100687--
