Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9E37033C
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 23:50:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX5db6d3Yz302H
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 07:50:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kUFTicFS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kUFTicFS; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX5dL2cqSz2yhs
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 07:50:11 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 y14-20020a056830208eb02902a1c9fa4c64so29215478otq.9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 14:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=jCjtp+r3bSVDksUZ3sz/JBhv5MnL4p+AiGgNhhmbtg0=;
 b=kUFTicFSampNfCjC/EFfN1V1ybPhZp7s5qtTnhx+HdgZtSeZjH2FYinef7MUkB9HEk
 LR4BuK5YuySnqrKHBMbTBpT1MXQyS6aTrHQOxBgVBtQb5wdRi0Zb1gipeth/Clm562n5
 zyIMhB+w2WXaJjVcDIMTNfycRHhdZtA8OhDnPV/xszvAOLlifQtQ1VIrTg4PyUKtIm5r
 3+mPGJhcKGEiorpf+7wvoEfDyn6r+luRo6ok93joROQWb9PA4MIPKYbFXqrTSTIYDnk4
 uePf1f510Ho4aeka2a3324jw+xaxYPjxaSsfSNZBJYWmoCo4bVWJzW9aHTDhXOTf07Ru
 cUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=jCjtp+r3bSVDksUZ3sz/JBhv5MnL4p+AiGgNhhmbtg0=;
 b=KUKPdfiDnYHEaJHtOh8axXxDhgA0RYoqwsCSQ/+099CGqYNUGFqPsTj9jt2QVCPktT
 QIzEvDgA7bTzP6jNoCuevgFZrSLVnCxXt9sdCp4imXCL6ov2IxWs0Fh6oZdAPdcnn3BQ
 CjmM5lJ0FzWsOJLj0DuN80naYobYEOYDn19Wo/t/GB04sPJWe4ZNUgk47wGuocgxsrcm
 BGyxqSRs3XLerds6Aqj3HMne5avcnWLU8VUiCpV6B9aqKavdW1LJGhMaSJ3mqa2WyKDL
 +Q+zspnJ8i/vS56vlPbYw659CKaYWQS5U7PjOmQ2YMbcmcz67d5zyu7LznuPpiOGpUrp
 7v4w==
X-Gm-Message-State: AOAM533FPW3Dvmt8UlUXvMPUhumAIqJI06gq/9Wud6pxYDvGjA1LdWkE
 UF982I0FuiZK/A4A46wzj9o=
X-Google-Smtp-Source: ABdhPJzrAdypgI1Ys9ZsdXrfgEgGbmLVdq/tBUwHyIuuIFGgq00KHIbdl2J8nHOiR96uOjjL9uGENw==
X-Received: by 2002:a9d:109:: with SMTP id 9mr5223564otu.92.1619819408419;
 Fri, 30 Apr 2021 14:50:08 -0700 (PDT)
Received: from smtpclient.apple ([70.39.113.236])
 by smtp.gmail.com with ESMTPSA id w2sm1065411oov.23.2021.04.30.14.50.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 14:50:07 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Message-Id: <11B9116E-FE0F-4211-B9CD-4CB8CA352826@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_118F4630-170E-4EDA-B674-311E8172E315"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
Date: Fri, 30 Apr 2021 15:50:07 -0600
In-Reply-To: <CAHBbfcWDBADEkaPNbsUQFVRN3hsyHDhQ7o-6WbGi9Gfm0eEb2Q@mail.gmail.com>
To: Jason Ling <jasonling@google.com>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein> <2CAF9521-76FA-4160-9711-4267341B018A@gmail.com>
 <YIxugif2LaXLaL4D@heinlein>
 <CAHBbfcWDBADEkaPNbsUQFVRN3hsyHDhQ7o-6WbGi9Gfm0eEb2Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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


--Apple-Mail=_118F4630-170E-4EDA-B674-311E8172E315
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

For some additional context, devices like LTC2991/2 have no EEPROM. The =
configuration is set when the driver initializes using values in the =
device tree.

So if they are updated in the field somehow, it has to be done after =
every boot, because they will be reset to the device tree values.

So any provisioning for updates could include provision for initial =
values if you want it to be controlled outside device tree.

> On Apr 30, 2021, at 3:00 PM, Jason Ling <jasonling@google.com> wrote:
>=20
> > However, in general, ADI PMBus devices have a PAGE command, =
especially the LTC388X and LTC297X families.
> >
> > This means that many actions require locking the bus to create =
compound transactions or the use of PAGE_PLUS.
> >
> > The In System Programming code we support on linux via /dev/i2c has =
this issue. If another process touched hwmon during programming, and =
touches a PAGE, the programming may fail, or worse it sends the wrong =
settings.
> I'm not sure how this is even possible.  How did an hwmon driver touch
> the device and userspace access it?  I'm fairly sure.
>=20
> IIRC there is some protection if you use the smbus_readX smbus_writeX =
APIs but if you're doing ioctl(I2C_RDWR) then a hwmon driver being bound =
to a device won't stop you from hammering on it.
> Also userspace can pass the force option to i2c-dev and it'll let you =
hammer away on the device as well.=20
>=20
> On Fri, Apr 30, 2021 at 1:54 PM Patrick Williams <patrick@stwcx.xyz =
<mailto:patrick@stwcx.xyz>> wrote:
> On Fri, Apr 30, 2021 at 09:43:21AM -0600, Mike Jones wrote:
>=20
> > I had a similar discussion with Guenter, who suggested that any i2c =
code in user space is problematic, but I think it also said there was =
enough locking in the drivers that SMBus transactions from /dev/i2c or =
i2c-tools would not interact with hwmon.
>=20
> I'm pretty sure there is locking such that the kernel won't let you =
talk to a
> device that is already bound to a driver.  Once you unbind the kernel =
side
> you're free to do what you want.
>=20
> What I don't recall is how much of the i2c-mux support gets propagated
> out to userspace.  Hopefully you don't have to mess with moving muxes
> and talking past those devices.  (I've seen some nasty shell scripts
> using i2c-tools doing things like this in the past.)
>=20
> > However, in general, ADI PMBus devices have a PAGE command, =
especially the LTC388X and LTC297X families.
> >=20
> > This means that many actions require locking the bus to create =
compound transactions or the use of PAGE_PLUS.
> >=20
> > The In System Programming code we support on linux via /dev/i2c has =
this issue. If another process touched hwmon during programming, and =
touches a PAGE, the programming may fail, or worse it sends the wrong =
settings.
>=20
> I'm not sure how this is even possible.  How did an hwmon driver touch
> the device and userspace access it?  I'm fairly sure.
>=20
> > If the work within the PMBus community to have a standard =
programming file format, if it were to be applied in user space, OBMC =
would have to disable hwmon and all telemetry while the programming is =
in process.
> >=20
> > If the file (or data blob) was applied in a kernel driver, it could =
lock the i2c during the process so that all hwmon activity and telemetry =
are held off.
>=20
> Right.  I would expect the locking at a pmbus level so that the
> pmbus-hwmon parts would block on a mutex until the firmware update is
> complete (if firmware update were done in the pmbus driver).
>=20
> > This problem is not unique to our desire for a file format. That is =
driven by the vendors complexity and business models.
> >=20
> > But, in the context of the ADM1266, it is a multipage device. The DS =
does not say it can do PAGE_PLUS. Therefore, unless I am missing =
something, the above problems apply unless using a PAGEless bulk =
programming mechanism. I don=E2=80=99t know this part well enough to =
know how that works, or if it is published.
> >=20
> > The other two families LTC388X and LTC297X do have a PAGEless bulk =
programming. We don=E2=80=99t like do it with telemetry hammering it, =
mainly because it feels risky.
> >=20
> > Finally, one could argue that most OMBC systems are using the 1266 =
and not the other parts. But I can say I have sent patches for other =
parts to OBMC users, so they are in use.
>=20
> There is already some firmware blob support in the kernel, just not =
for
> pmbus.  Has anyone investigated what (if anything) we'd need to do to =
be
> able to leverage this?
>=20
> --=20
> Patrick Williams


--Apple-Mail=_118F4630-170E-4EDA-B674-311E8172E315
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">For =
some additional context, devices like LTC2991/2 have no EEPROM. The =
configuration is set when the driver initializes using values in the =
device tree.<div class=3D""><br class=3D""></div><div class=3D"">So if =
they are updated in the field somehow, it has to be done after every =
boot, because they will be reset to the device tree values.</div><div =
class=3D""><br class=3D""></div><div class=3D"">So any provisioning for =
updates could include provision for initial values if you want it to be =
controlled outside device tree.<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Apr =
30, 2021, at 3:00 PM, Jason Ling &lt;<a =
href=3D"mailto:jasonling@google.com" =
class=3D"">jasonling@google.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; However, in =
general, ADI PMBus devices have a PAGE command, especially the LTC388X =
and LTC297X families.<br class=3D""></span><span class=3D"gmail-im" =
style=3D"color:rgb(80,0,80)">&gt;<br class=3D""></span><span =
class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; This means that =
many actions require locking the bus to create compound transactions or =
the use of PAGE_PLUS.<br class=3D""></span><span class=3D"gmail-im" =
style=3D"color:rgb(80,0,80)">&gt;<br class=3D""></span><span =
class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; The In System =
Programming code we support on linux via /dev/i2c has this issue. If =
another process touched hwmon during programming, and touches a PAGE, =
the programming may fail, or worse it sends the wrong =
settings.</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br =
class=3D""></span>I'm not sure how this is even possible.&nbsp; How did =
an hwmon driver touch<br class=3D"">the device and userspace access =
it?&nbsp; I'm fairly sure.</blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">IIRC there is some protection if you =
use the smbus_readX smbus_writeX APIs but if you're doing =
ioctl(I2C_RDWR) then a hwmon driver being bound to a device won't stop =
you from hammering on it.</div><div class=3D"">Also userspace can pass =
the force option to i2c-dev and it'll let you hammer away on the device =
as well.&nbsp;</div></div><br class=3D""><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021 at 1:54 PM Patrick =
Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" =
class=3D"">patrick@stwcx.xyz</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Fri, Apr 30, 2021 at 09:43:21AM =
-0600, Mike Jones wrote:<br class=3D"">
<br class=3D"">
&gt; I had a similar discussion with Guenter, who suggested that any i2c =
code in user space is problematic, but I think it also said there was =
enough locking in the drivers that SMBus transactions from /dev/i2c or =
i2c-tools would not interact with hwmon.<br class=3D"">
<br class=3D"">
I'm pretty sure there is locking such that the kernel won't let you talk =
to a<br class=3D"">
device that is already bound to a driver.&nbsp; Once you unbind the =
kernel side<br class=3D"">
you're free to do what you want.<br class=3D"">
<br class=3D"">
What I don't recall is how much of the i2c-mux support gets =
propagated<br class=3D"">
out to userspace.&nbsp; Hopefully you don't have to mess with moving =
muxes<br class=3D"">
and talking past those devices.&nbsp; (I've seen some nasty shell =
scripts<br class=3D"">
using i2c-tools doing things like this in the past.)<br class=3D"">
<br class=3D"">
&gt; However, in general, ADI PMBus devices have a PAGE command, =
especially the LTC388X and LTC297X families.<br class=3D"">
&gt; <br class=3D"">
&gt; This means that many actions require locking the bus to create =
compound transactions or the use of PAGE_PLUS.<br class=3D"">
&gt; <br class=3D"">
&gt; The In System Programming code we support on linux via /dev/i2c has =
this issue. If another process touched hwmon during programming, and =
touches a PAGE, the programming may fail, or worse it sends the wrong =
settings.<br class=3D"">
<br class=3D"">
I'm not sure how this is even possible.&nbsp; How did an hwmon driver =
touch<br class=3D"">
the device and userspace access it?&nbsp; I'm fairly sure.<br class=3D"">
<br class=3D"">
&gt; If the work within the PMBus community to have a standard =
programming file format, if it were to be applied in user space, OBMC =
would have to disable hwmon and all telemetry while the programming is =
in process.<br class=3D"">
&gt; <br class=3D"">
&gt; If the file (or data blob) was applied in a kernel driver, it could =
lock the i2c during the process so that all hwmon activity and telemetry =
are held off.<br class=3D"">
<br class=3D"">
Right.&nbsp; I would expect the locking at a pmbus level so that the<br =
class=3D"">
pmbus-hwmon parts would block on a mutex until the firmware update is<br =
class=3D"">
complete (if firmware update were done in the pmbus driver).<br =
class=3D"">
<br class=3D"">
&gt; This problem is not unique to our desire for a file format. That is =
driven by the vendors complexity and business models.<br class=3D"">
&gt; <br class=3D"">
&gt; But, in the context of the ADM1266, it is a multipage device. The =
DS does not say it can do PAGE_PLUS. Therefore, unless I am missing =
something, the above problems apply unless using a PAGEless bulk =
programming mechanism. I don=E2=80=99t know this part well enough to =
know how that works, or if it is published.<br class=3D"">
&gt; <br class=3D"">
&gt; The other two families LTC388X and LTC297X do have a PAGEless bulk =
programming. We don=E2=80=99t like do it with telemetry hammering it, =
mainly because it feels risky.<br class=3D"">
&gt; <br class=3D"">
&gt; Finally, one could argue that most OMBC systems are using the 1266 =
and not the other parts. But I can say I have sent patches for other =
parts to OBMC users, so they are in use.<br class=3D"">
<br class=3D"">
There is already some firmware blob support in the kernel, just not =
for<br class=3D"">
pmbus.&nbsp; Has anyone investigated what (if anything) we'd need to do =
to be<br class=3D"">
able to leverage this?<br class=3D"">
<br class=3D"">
-- <br class=3D"">
Patrick Williams<br class=3D"">
</blockquote></div>
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_118F4630-170E-4EDA-B674-311E8172E315--
