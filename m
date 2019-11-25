Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27330109538
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 22:42:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ML8l1s2tzDqXt
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:41:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=emilyshaffer@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Tpoe3Nkd"; 
 dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ML863Rs2zDqTY
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 08:41:18 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id c124so9840761qkg.0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 13:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qs8V7n3DMkNF2tS5bgEOywBvuUHfv/aIZc5xiT7nwlw=;
 b=Tpoe3NkdBbMQApCIFIO8g1OO4vnPlg6GBbOCBlgWIq5r3C4MejeteezCfZMY8PTZB0
 hq05+gZRtJR4lWefiwhrjhHirFJBT9NlElVtyqYz6YUyDpTAMECd2bZz+ZTaGVx2SFe8
 oJeJqnMv9hZuqQgKGbOu+eSIX0lA8h6mZ2/ZWxx14TEp1A1uG6jZ35QK5eTy/V59R3tK
 OjrxNjCDzEVwBUkESBhLLKH6Cud+qmdi1Fu2QbfvToOBYOIrstFb95bPBuH35fRptAsN
 0vjTFqtyo8FiYgHH+ppGXMqND5ryAg8QNX5FTB5eHXiVWweckmASjLISOeoixl63J+sE
 BZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qs8V7n3DMkNF2tS5bgEOywBvuUHfv/aIZc5xiT7nwlw=;
 b=QCdf1wi07UeibqmFhi4/wRwnFydDPMcCSn6KN8iSS+TS496Yvi2QTb6zO4GMbaJJtR
 gdwIm7RUrI+a7QRCN1rH2N+ul8qNWFi8f8yMyVtnBVIv+2dDUngrrBNNO1fkD9R/91cr
 RscljHcIDRMz5GD1wlZ+ckAyefvUK/nLU3YyDyAlmy45ygcBRumBDVUvYcFnRb0u/XRN
 kygZDD1kgFiogrLbxat2s8yfU9c6DwteMgJizXlP6oII1CQ5c4lxl5Yfb6YvVOEtmcbx
 In1lF3ThR2h+b2RnmI15ITYeSMaJbFzkbcztTk8zm5m9SVF2ayxIiIPqdySA5wmM/dsR
 E46A==
X-Gm-Message-State: APjAAAUxTS2WDr8wUa+F9z3gL0PR6DxEhNIrbvPJ0OK8Mj6ZNLT4sLyA
 gfF9G/lJ290ROYPPKGkNrEF9eFIESVzf4sv2blzQ5w==
X-Google-Smtp-Source: APXvYqy0XS2Y8EJ/TJM4TNuQoDBneKIru51oqXO9RecN2WSVQe+3EG6qELTTOeIZvfGAUhCagG+sTiQGXLAcryiWtso=
X-Received: by 2002:a05:620a:15bc:: with SMTP id
 f28mr18943239qkk.57.1574718075856; 
 Mon, 25 Nov 2019 13:41:15 -0800 (PST)
MIME-Version: 1.0
References: <CAN34fowOEdscU-f43KDygEmAzmJyYAC1bifzDPn+8MwKkPrfug@mail.gmail.com>
In-Reply-To: <CAN34fowOEdscU-f43KDygEmAzmJyYAC1bifzDPn+8MwKkPrfug@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 25 Nov 2019 13:41:04 -0800
Message-ID: <CAJoAoZ=hC9NT81sW4WPFP5hp7ds2k0RPf0f6wREPDHvv7qzknw@mail.gmail.com>
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

On Mon, Nov 25, 2019 at 1:28 PM Stephen Beckwith
<embeddedsteve@gmail.com> wrote:
>
> Greetings,
>      I have some additional/newbie type questions here that are blocking =
my progress with this Proof-of-Concept.

Hi and welcome. I can't answer every question you have but I'll reply
where I can and hope for the community to fill in more blanks. :)

> We currently have an OpenBMC image booting in QEMU (version 4.1.0) and ha=
ve been investigating certain aspects of this image, namely IPMI command su=
pport and sensors, as these are 2 areas we will need to modify prior to por=
ting this onto our target platform. (AST2500 based).
>
> Sensors:
> We=E2=80=99ve read through the documentation and pieced together the foll=
owing:
>  -  Sensors get defined in the DTS file, which is =E2=80=9Cconsumed=E2=80=
=9D by the Linux kernel.  This defines the physical device=E2=80=99s aspect=
s (i.e. on which I2C bus at what address).
>  -  These sensors are inputs to the Linux Kernel=E2=80=99s hwmon sub-syst=
em.  Access is exported via sysfs entries for access by ???
>  -  There are some .conf and .yaml files that contain the limits/ranges/p=
roperties for these devices. This information is =E2=80=9Cinitialized=E2=80=
=9D (?) into dbus objects, where the name of the sensor=E2=80=99s configura=
tion file is the exported sysfs name, correct?
>  -  systemd is used to start up the various services associated with thes=
e objects, as defined in dbus.
>  -  It was stated on the documentation that the sensors become =E2=80=9Co=
bjects=E2=80=9D that will broadcast their state change on the dbus for othe=
rs to know about this change.  What is it that =E2=80=9Cdetects=E2=80=9D th=
is change?  An interrupt from the Sensors? (which seems odd to me, in my 30=
+ years, I=E2=80=99ve not seen too many temp sensors that are interrupt dri=
ven).  Are these objects polled?  By whom?  Our best guess so far seems to =
indicate that the phosphor-hwmon service is what polls these.

phosphor-hwmon is responsible for most of these, yeah.

>  -  Is there a sensor cache where polled readings are stored? It seemed t=
o be hinted at but never stated explicitly.
>
>
> The reason for these questions are:
>  -  In poking around the image loaded in QEMU, we don=E2=80=99t seem to b=
e seeing any Sensor updates occurring.  We would like to be able to =E2=80=
=9Cstub=E2=80=9D these for simulation purposes, as we need to add in all of=
 the platform sensors we need to monitor (~ 100).
>  -  There is an lm75 defined.  It shows up in the sysfs.  However, it doe=
s not show up in the IPMI listing of the sensors or on the dbus.
>  -  It seems that maybe the sensor monitoring is not running?  Could it b=
e that some service is not being started, due to this being QEMU?  Any insi=
ghts on this?
>  -  If this is simply a limitation of Qemu, is there a recommended method=
/scheme to handle the =E2=80=9Cstubbing=E2=80=9D of sensors?  (i.e. running=
 a background script that writes to the sysfs entries to periodically chang=
e the readings?)
>
>
> IPMI Commands:
>  -  We=E2=80=99ve tracked through the code and believe we=E2=80=99ve foun=
d the code responsible for some of the commands.
>  -  As an experiment, we=E2=80=99d like to modify this source code accord=
ingly to verify this is the code executing the command.  This then brought =
up the question:  How is this done?
>  -  We=E2=80=99ve identified the following:
> the =E2=80=9Copenbmc=E2=80=9D meta directory is just that:  meta-data - n=
o code here.
> =E2=80=9CALL=E2=80=9D code is fetched from the various GitHub repos for t=
his project.
> So if we wanted to modify, say phosphor-ipmi-host, we would:
> a) clone this repo and populate it with the code
> b) make the modifications necessary.
> c) How then to tell the build system to use this modified code for the bu=
ild?  Modify the bitbake recipe in the meta- directory to point the SRC_URI=
 here?

During hacking, you can use 'devtool' which is used to help configure
the bitbake run. I think 'devtool modify' is what you're looking for
to ask for your local copy instead of the SRC_URI destination.

>  -  Which then brought up the following question(s):
> How does one go about adding in new code in this setup?  (assuming that w=
e=E2=80=99re NOT just trying to append to existing functionality, but addin=
g entirely new proprietary functionality to the system both inside our laye=
r and in other repos).

As I understand it, when you write the recipe for your internal
platform (which you will need to do anyway - for example a Zaius
builds differently than a Tioga Pass) you will point the SRC_URI to
the internal branch or fork of, say, phosphor-host-ipmi. That branch
carries your patches - proprietary features that can't be upstreamed,
or hotfixes you couldn't wait for upstream to merge. Then, your
internal branch of each project should be rebased regularly against
what is happening upstream.  I'll try not to get into upstreaming best
practices, but you should keep in mind when you're checking things in
downstream that should really be sent upstream - i.e., bug fixes that
affect everyone - that your downstream branch needs to be able to cope
once those patches make it into the upstream you're rebasing against.

> Would we need to do this for each and every Repo we are adding and/or mod=
ifying as part of our system?

If there are changes from upstream, those changes have to go
somewhere, and your recipe needs to reference them. If there's no
changes from upstream but you want to include different 100%-upstream
packages, you'd change that in your recipe, AIUI.

> Is there a =E2=80=9Cglobal=E2=80=9D way to handle this? (Yocto documentat=
ion talks about the EXTERNALSRC capability and the .bbclass to include)

Take it with a grain of salt from me; it's been some time since I did
much with bitbake recipes. These days I'm just a humble IPMI hospice
carer :)

 - Emily
