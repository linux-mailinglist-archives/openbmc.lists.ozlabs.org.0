Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E9109539
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 22:44:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MLCd1tMJzDqcg
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:44:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=emilyshaffer@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dM2hj+/9"; 
 dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MLBm4NnszDqTY
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 08:43:44 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id y39so19007906qty.0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 13:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N022hgbiuzNvfKeR1X8awh1n4gk7sYEtP5VYpbT5J/A=;
 b=dM2hj+/9+fFrWahBO2pQnLlCIhS7EAG4gSTd1BKo7JlwpvW2Rhg0igOKD1KQphs66q
 a/OKKrP4924sUnWbhg3MLHB5hNlziVbuVhW1GdBMgZzdQbvr2X9L4kUatGTWUeIkVf1A
 JFjOqu5EyxH426O6/lQWwOL5vNxkdy/2DNHlX8R4mWGNpC7x7xDZaqx6qu7KCgB46D3p
 d0jjMz1i11peUqJluUD9AzEaLttudEquAXnLOb3oEzwF8TMaHhV8BLe0rEy68skssUAj
 vogAlA8vHLmEmmsoMdqwYV4gFqS57l/Tf76WszbcaFx4vAooltEwPgt1tYc7rt8sH+E1
 ayZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N022hgbiuzNvfKeR1X8awh1n4gk7sYEtP5VYpbT5J/A=;
 b=s6YnQ6ff63COCmOTEPGml2P2ujWPckBusGmY9n6dhTbvv0dUwycr5iufu0vhVjrUFt
 S1+0bIX4Is1kqg3ZVcH/JT4KmQiLn6p43s86INE8HoaJwsCjDqV8z6K7csQ3x+Qeh4JS
 /1WdxcV7kTvgwQxUPl5fFbqrrd9biG7sW9lovAJ6UsML3DF741YMjsJrvj3Gl5jeYZG2
 iZ6YwLdLnRLxCGemYwG+B+XXHqyzi+Q2xMYtuzJ4VWOVR+JZXy2xlR8eZXt6LtptQxMl
 Visyv+GeA7MMpz10ZJNj49TlfLGSgLRI5CFdqijFqlV3ClhlhXrXPkF3kA4SnxnWPFXy
 lwMg==
X-Gm-Message-State: APjAAAXc7hHtPhsZnk9G6DMttlDR/R39MfrPA8HILiqi5PUgCbN2OzkG
 WnoHXIepXhI6NsxNzLnrzg8wKRf8XEi0iKpBZunQpQ==
X-Google-Smtp-Source: APXvYqxIW8cXzi6Hp7rWSJ4JqDmyJIkdyh+i0wb+MsOwTnIeAYJPG17nuFJpDCmYCk9fNN3lELh+0ploKpcmxTHewQI=
X-Received: by 2002:ac8:60da:: with SMTP id i26mr20468485qtm.43.1574718220087; 
 Mon, 25 Nov 2019 13:43:40 -0800 (PST)
MIME-Version: 1.0
References: <CAN34fowOEdscU-f43KDygEmAzmJyYAC1bifzDPn+8MwKkPrfug@mail.gmail.com>
 <CAJoAoZ=hC9NT81sW4WPFP5hp7ds2k0RPf0f6wREPDHvv7qzknw@mail.gmail.com>
In-Reply-To: <CAJoAoZ=hC9NT81sW4WPFP5hp7ds2k0RPf0f6wREPDHvv7qzknw@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 25 Nov 2019 13:43:28 -0800
Message-ID: <CAJoAoZ=HusYNxj5x=fNwmDoBdy9p26WbWRSEr0ohmuvLPsn06g@mail.gmail.com>
Subject: Re: Ongoing Questions about OpenBMC
To: Stephen Beckwith <embeddedsteve@gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 25, 2019 at 1:41 PM Emily Shaffer <emilyshaffer@google.com> wro=
te:
>
> On Mon, Nov 25, 2019 at 1:28 PM Stephen Beckwith
> <embeddedsteve@gmail.com> wrote:
> >
> > Greetings,
> >      I have some additional/newbie type questions here that are blockin=
g my progress with this Proof-of-Concept.
>
> Hi and welcome. I can't answer every question you have but I'll reply
> where I can and hope for the community to fill in more blanks. :)
>
> > We currently have an OpenBMC image booting in QEMU (version 4.1.0) and =
have been investigating certain aspects of this image, namely IPMI command =
support and sensors, as these are 2 areas we will need to modify prior to p=
orting this onto our target platform. (AST2500 based).
> >
> > Sensors:
> > We=E2=80=99ve read through the documentation and pieced together the fo=
llowing:
> >  -  Sensors get defined in the DTS file, which is =E2=80=9Cconsumed=E2=
=80=9D by the Linux kernel.  This defines the physical device=E2=80=99s asp=
ects (i.e. on which I2C bus at what address).
> >  -  These sensors are inputs to the Linux Kernel=E2=80=99s hwmon sub-sy=
stem.  Access is exported via sysfs entries for access by ???
> >  -  There are some .conf and .yaml files that contain the limits/ranges=
/properties for these devices. This information is =E2=80=9Cinitialized=E2=
=80=9D (?) into dbus objects, where the name of the sensor=E2=80=99s config=
uration file is the exported sysfs name, correct?
> >  -  systemd is used to start up the various services associated with th=
ese objects, as defined in dbus.
> >  -  It was stated on the documentation that the sensors become =E2=80=
=9Cobjects=E2=80=9D that will broadcast their state change on the dbus for =
others to know about this change.  What is it that =E2=80=9Cdetects=E2=80=
=9D this change?  An interrupt from the Sensors? (which seems odd to me, in=
 my 30+ years, I=E2=80=99ve not seen too many temp sensors that are interru=
pt driven).  Are these objects polled?  By whom?  Our best guess so far see=
ms to indicate that the phosphor-hwmon service is what polls these.
>
> phosphor-hwmon is responsible for most of these, yeah.
>
> >  -  Is there a sensor cache where polled readings are stored? It seemed=
 to be hinted at but never stated explicitly.
> >
> >
> > The reason for these questions are:
> >  -  In poking around the image loaded in QEMU, we don=E2=80=99t seem to=
 be seeing any Sensor updates occurring.  We would like to be able to =E2=
=80=9Cstub=E2=80=9D these for simulation purposes, as we need to add in all=
 of the platform sensors we need to monitor (~ 100).
> >  -  There is an lm75 defined.  It shows up in the sysfs.  However, it d=
oes not show up in the IPMI listing of the sensors or on the dbus.

Ah, I skimmed in my first pass and neglected this. It's likely that
this sensor isn't in your sensor list yaml, which IPMI draws on. See
https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor-e=
xample.yaml.

> >  -  It seems that maybe the sensor monitoring is not running?  Could it=
 be that some service is not being started, due to this being QEMU?  Any in=
sights on this?
> >  -  If this is simply a limitation of Qemu, is there a recommended meth=
od/scheme to handle the =E2=80=9Cstubbing=E2=80=9D of sensors?  (i.e. runni=
ng a background script that writes to the sysfs entries to periodically cha=
nge the readings?)
> >
> >
> > IPMI Commands:
> >  -  We=E2=80=99ve tracked through the code and believe we=E2=80=99ve fo=
und the code responsible for some of the commands.
> >  -  As an experiment, we=E2=80=99d like to modify this source code acco=
rdingly to verify this is the code executing the command.  This then brough=
t up the question:  How is this done?
> >  -  We=E2=80=99ve identified the following:
> > the =E2=80=9Copenbmc=E2=80=9D meta directory is just that:  meta-data -=
 no code here.
> > =E2=80=9CALL=E2=80=9D code is fetched from the various GitHub repos for=
 this project.
> > So if we wanted to modify, say phosphor-ipmi-host, we would:
> > a) clone this repo and populate it with the code
> > b) make the modifications necessary.
> > c) How then to tell the build system to use this modified code for the =
build?  Modify the bitbake recipe in the meta- directory to point the SRC_U=
RI here?
>
> During hacking, you can use 'devtool' which is used to help configure
> the bitbake run. I think 'devtool modify' is what you're looking for
> to ask for your local copy instead of the SRC_URI destination.
>
> >  -  Which then brought up the following question(s):
> > How does one go about adding in new code in this setup?  (assuming that=
 we=E2=80=99re NOT just trying to append to existing functionality, but add=
ing entirely new proprietary functionality to the system both inside our la=
yer and in other repos).
>
> As I understand it, when you write the recipe for your internal
> platform (which you will need to do anyway - for example a Zaius
> builds differently than a Tioga Pass) you will point the SRC_URI to
> the internal branch or fork of, say, phosphor-host-ipmi. That branch
> carries your patches - proprietary features that can't be upstreamed,
> or hotfixes you couldn't wait for upstream to merge. Then, your
> internal branch of each project should be rebased regularly against
> what is happening upstream.  I'll try not to get into upstreaming best
> practices, but you should keep in mind when you're checking things in
> downstream that should really be sent upstream - i.e., bug fixes that
> affect everyone - that your downstream branch needs to be able to cope
> once those patches make it into the upstream you're rebasing against.
>
> > Would we need to do this for each and every Repo we are adding and/or m=
odifying as part of our system?
>
> If there are changes from upstream, those changes have to go
> somewhere, and your recipe needs to reference them. If there's no
> changes from upstream but you want to include different 100%-upstream
> packages, you'd change that in your recipe, AIUI.
>
> > Is there a =E2=80=9Cglobal=E2=80=9D way to handle this? (Yocto document=
ation talks about the EXTERNALSRC capability and the .bbclass to include)
>
> Take it with a grain of salt from me; it's been some time since I did
> much with bitbake recipes. These days I'm just a humble IPMI hospice
> carer :)
>
>  - Emily
