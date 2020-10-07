Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C4286803
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 21:04:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C63g13s0czDqHx
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 06:04:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=WJ9anvLZ; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C63d73V13zDqC6
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 06:03:06 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id k25so3571438ioh.7
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Q/uIwh5rMLtMl4IqEbkXB/aN4wZgdbdaxXEVShpUHU=;
 b=WJ9anvLZiiP7jtxnvFJmvweelMJAQV2CiCmCFxrhDQ1Q6GTfsP76L145Z1B5x8wGvX
 PSiwOluwnALL4beGR6V0Uhx/t6KVkz1i0PQZgk56wRqrCAlPsZKSSWxAX/ZsnnbohDSi
 9fCm7T9f7g3hGv/NAFHX6B8naY2hbk3G7Y3lgI+CKZY++R0TSZpT6wnlrrmwL9Jbnqyl
 8yiwwq0A16BQFybpEKc1UQHO9avMwpsAth3zRAac4JHZ1Za8XmIXdGi6kfRQN9GJkn1F
 XXa7//VM65RCvt/QF4SjrjCdXbM+m41FZ2nb8l4z/pGrublJBVVd+E4omKUI9O6HKsv6
 wicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Q/uIwh5rMLtMl4IqEbkXB/aN4wZgdbdaxXEVShpUHU=;
 b=opV1KCEDZI7XkTy8U6SuUijpet713bp96rqlJ76LIDVtzIY1flHhtqk5eENFY7XkKB
 j0wBOHe0lSMUgOfWL45ZKr2WFmv+tzWYTVPn+7R2IHGbLG7DW08C+RLAOuoa0Y/GVGIJ
 SG2cQirKO4IQ12AlHn/kaHBFMbHLqljOD2/sUCXUvhJgQXP3s2K08PA1+at5t9rGfpw4
 QeHj/rnTxWGmlOHpDbk6edljvwTYqVANQnwSdtQRkoz+hWj/P/x5cw/8+d1JOPoLJXhC
 aF9m11x45TxSaYlK2616IH5OXHgs8MEoP5vK3cqHB+sgVNBJLNhtRIdocxlN3UVQVN/G
 C82g==
X-Gm-Message-State: AOAM531Yuq0F4pekudFpX9QZk1BuPhPNPg1N15ppr//ncqEJK3eXOXDb
 /io2Xi5Mm697aYT6GDKJS6javyNa7iqflsPhDMgHX5sH7uztu/91
X-Google-Smtp-Source: ABdhPJyGEIeQsgB7NUKkEDHPsZR/GzYazF3H5jxeN1+d2Pl9S8ez8ftFrFR6iR5tu0ZpQC7nC9VyEnRDe4TUgFkFWOs=
X-Received: by 2002:a02:7717:: with SMTP id g23mr4045297jac.97.1602097380953; 
 Wed, 07 Oct 2020 12:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGDkaHzu5UOES-irDLtu9jwLULyX9_BWAX7rgTPiaeXOT2ByA@mail.gmail.com>
 <20201007152428.GJ6152@heinlein>
In-Reply-To: <20201007152428.GJ6152@heinlein>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 7 Oct 2020 21:02:49 +0200
Message-ID: <CADVsX88d1PU5LomWa3xzGjnJf5OqJmjcCnQsZGfh94oPRXbn+g@mail.gmail.com>
Subject: Re: [c++] [hwmon] std::ifstream read file with timeout so long
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000049e97105b1195d99"
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
Cc: Nguyen Chanh <nguyenchanh2201@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000049e97105b1195d99
Content-Type: text/plain; charset="UTF-8"

Try to strace the process. Either attach strace or modify service file to
run the strace from the beginning.

To attach simply (replace $HWMON_PID with appropriate pid):

# strace -fv -tt -etrace=file -p $HWMON_PID -s 2048 -o /tmp/hwmon.log.$$

You should include "strace" package in the image by either modifying the
build/conf/local.conf and place / append the variable:
======= cut =======
IMAGE_INSTALL_append = " strace"
======= cut =======

Please note the space before the package name. It is required.

To modify service file, simply edit either source file:

https://github.com/openbmc/meta-phosphor/blob/a87fb2d1eb682ed0f04e0f269966b9ae4aafbb1e/recipes-phosphor/sensors/phosphor-hwmon/xyz.openbmc_project.Hwmon%40.service

in your local build tree or edit service file after booting the image using
"vi":

# vi /lib/systemd/system/xyz.openbmc_project.Hwmon\@.service

and change ExecStart param to:
======== cut ========
ExecParam=/usr/bin/strace -tt -etrace=file -fv -s 2048 -o /tmp/hwmon.log.$$
/usr/bin/phosphor-hwmon-readd -o %I
======== cut ========

Then reload systemd and restart the service:

# systemctl daemon-reload
# systemctl restart xyz.openbmc_project.Hwmon\@.service

And then check the /tmp/hwmon.log.* file.
With the "-tt" option you will get a precise timestamp between each syscall.

If there is nothing suspicious, try to remove the "-etrace=file" option.

On Wed, 7 Oct 2020 at 17:25, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Oct 06, 2020 at 10:42:18PM +0700, Nguyen Chanh wrote:
> > In https://github.com/openbmc/phosphor-hwmon => hwmonio.cpp , I saw we
> use
> > the std::ifstream to open and read a device sensor.
> >
> > But, I met an issue with it. In case the sensor was disabled (Ex: the Fan
> > was unplugged), the std::ifstream read will take a long time . The
> timeout
> > in there is so long. It makes my system have a BIG delay in each checking
> > sensor.
> >
> > Other observation : In case the sensor device is ready, the time for
> sensor
> > reading is expected.
> >
> > Measuring std::ifstream reading:
> >
> > In case unplugged sensor: 91385 microseconds
> > In case plugged sensor. : 507 microseconds
>
> Do you know which device driver it is interacting with?  This sounds
> like an issue with the underlying driver.  Perhaps it is attempting
> too many retries.
>
> >
> > The patch to measure the std::ifstream reading, please see attachment !
> >
> > Unexpected behavior you saw
> >
> > The timeout in there is so long
> >
> > Expected behavior
> >
> > Do we have any better solution in this case? take less more timeout.
> > [image: Screen Shot 2020-10-03 at 11.32.36 AM.png]
> > --
> > *Nguyen Minh Chanh *
> > *Embedded Software Engineer *
>
>
>
> --
> Patrick Williams
>

--00000000000049e97105b1195d99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Try to strace the process. Either attach strace or modify =
service file to run the strace from the beginning.<div><br></div><div>To at=
tach simply (replace $HWMON_PID with appropriate pid):</div><div><br></div>=
<div># strace -fv -tt -etrace=3Dfile -p $HWMON_PID -s 2048 -o /tmp/hwmon.lo=
g.$$</div><div><br></div><div>You should include &quot;strace&quot; package=
 in the image by either modifying the build/conf/local.conf and place / app=
end the variable:</div><div>=3D=3D=3D=3D=3D=3D=3D cut =3D=3D=3D=3D=3D=3D=3D=
</div><div>IMAGE_INSTALL_append =3D &quot; strace&quot;</div><div>=3D=3D=3D=
=3D=3D=3D=3D cut =3D=3D=3D=3D=3D=3D=3D</div><div><br></div><div>Please note=
 the space before the package name. It is required.</div><div><br></div><di=
v>To modify service file, simply edit either source file:</div><div><br></d=
iv><div><a href=3D"https://github.com/openbmc/meta-phosphor/blob/a87fb2d1eb=
682ed0f04e0f269966b9ae4aafbb1e/recipes-phosphor/sensors/phosphor-hwmon/xyz.=
openbmc_project.Hwmon%40.service">https://github.com/openbmc/meta-phosphor/=
blob/a87fb2d1eb682ed0f04e0f269966b9ae4aafbb1e/recipes-phosphor/sensors/phos=
phor-hwmon/xyz.openbmc_project.Hwmon%40.service</a><br></div><div><br></div=
><div>in your local build tree or edit service file after booting the image=
 using &quot;vi&quot;:</div><div><br></div><div># vi=C2=A0/lib/systemd/syst=
em/xyz.openbmc_project.Hwmon\@.service</div><div><br></div><div>and change =
ExecStart param to:</div><div>=3D=3D=3D=3D=3D=3D=3D=3D cut =3D=3D=3D=3D=3D=
=3D=3D=3D</div><div>ExecParam=3D/usr/bin/strace -tt -etrace=3Dfile -fv -s 2=
048 -o /tmp/hwmon.log.$$ /usr/bin/phosphor-hwmon-readd -o %I</div><div><div=
>=3D=3D=3D=3D=3D=3D=3D=3D cut =3D=3D=3D=3D=3D=3D=3D=3D</div><div><br></div>=
<div><div>Then reload systemd and restart the service:</div><div><br></div>=
<div># systemctl daemon-reload</div><div># systemctl restart xyz.openbmc_pr=
oject.Hwmon\@.service</div><div><br></div><div>And then check the /tmp/hwmo=
n.log.* file.</div><div>With the &quot;-tt&quot; option you will get a prec=
ise timestamp between each syscall.</div><div><br></div><div>If there is no=
thing suspicious, try to remove the &quot;-etrace=3Dfile&quot; option.</div=
><div></div></div><div></div></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, 7 Oct 2020 at 17:25, Patrick Wil=
liams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Oct=
 06, 2020 at 10:42:18PM +0700, Nguyen Chanh wrote:<br>
&gt; In <a href=3D"https://github.com/openbmc/phosphor-hwmon" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/openbmc/phosphor-hwmon</a> =3D&g=
t; hwmonio.cpp , I saw we use<br>
&gt; the std::ifstream to open and read a device sensor.<br>
&gt; <br>
&gt; But, I met an issue with it. In case the sensor was disabled (Ex: the =
Fan<br>
&gt; was unplugged), the std::ifstream read will take a long time . The tim=
eout<br>
&gt; in there is so long. It makes my system have a BIG delay in each check=
ing<br>
&gt; sensor.<br>
&gt; <br>
&gt; Other observation : In case the sensor device is ready, the time for s=
ensor<br>
&gt; reading is expected.<br>
&gt; <br>
&gt; Measuring std::ifstream reading:<br>
&gt; <br>
&gt; In case unplugged sensor: 91385 microseconds<br>
&gt; In case plugged sensor. : 507 microseconds<br>
<br>
Do you know which device driver it is interacting with?=C2=A0 This sounds<b=
r>
like an issue with the underlying driver.=C2=A0 Perhaps it is attempting<br=
>
too many retries.<br>
<br>
&gt; <br>
&gt; The patch to measure the std::ifstream reading, please see attachment =
!<br>
&gt; <br>
&gt; Unexpected behavior you saw<br>
&gt; <br>
&gt; The timeout in there is so long<br>
&gt; <br>
&gt; Expected behavior<br>
&gt; <br>
&gt; Do we have any better solution in this case? take less more timeout.<b=
r>
&gt; [image: Screen Shot 2020-10-03 at 11.32.36 AM.png]<br>
&gt; -- <br>
&gt; *Nguyen Minh Chanh *<br>
&gt; *Embedded Software Engineer *<br>
<br>
<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000049e97105b1195d99--
