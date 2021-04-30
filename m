Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A28370291
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 23:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX4Xx0Fvkz302S
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 07:01:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=cySUWPUW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cySUWPUW; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX4Xh4GxRz2y6N
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 07:01:06 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id x131so3788392ybg.11
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 14:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yEqSJnPqkZZ+epZbG76Y2KBE96Bliei3AXjc2aSEdPY=;
 b=cySUWPUWq+9MteqcnHpXSGqghzqhb+HcW2pwBNXlU/MynifsWSuSGPFkMh9lH9uWlv
 BGuGGbTCKgmldjsJ9y46CM+yWv4XqN8xdgc73Fy29fP0M3c5x3DwSqnSNyqDf2NSduXC
 JyRwIGCkL+L5evkweViIiBxTfbkKoLTRO8BzduxbeWmFs9y3bUAnJ0dMYv49bUCKrJjF
 dB767dKL4yHlQ1ZyPMs0mV2jQqwpsZbKMFygu1Zl+sBQv9NDCAOYXp5J3/LMnfcNmtxM
 cYN99fmOsFzWZL6/rBN9heBSjQDIcnYhD3/I/ElEbu3oBRhhYjNOFVU21CEA2xwRCzn9
 gKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yEqSJnPqkZZ+epZbG76Y2KBE96Bliei3AXjc2aSEdPY=;
 b=mltp1KeSsOxCAL6AN3ScPhvvxsYxO5xosQe4Cj4xFog/2VJg4uzLAaG/CElxzdrPRV
 sr7bfomtP1Y4OC44b1NV4ztlyS/tP77baPp3zFl1x+sOmWRRW5w/Id0N7UPlj/OKJb64
 0yO15heCMQUxSoxcdmCNjLPO/VUQUUeC9iuENDa6/onWBD3YbZS32wK6wpNiEZIiYIEG
 +r8pSuaeIpLERjju7AoCeL/EsfLsAk7sierzp97BRX3Q84I4oU/WNKP21dIiNXbcZfEM
 MByy7TqvF1qCaRiuRa/gOoiEG7wKR9dZH7n/876vHBUodApcOU3Vw66qbTFUmHyGfpwr
 IEwA==
X-Gm-Message-State: AOAM533A4CNHv8dbinw+00NfY1Wee5t1wR+h4jlPgcTGZF9lM6V4Dvue
 TshHJ2KMo4TGk0eWbj5ADjuEsp8TQ5XlsMqyQzNmMg==
X-Google-Smtp-Source: ABdhPJx+mvcfpGjF3nk8jlUPHee1g68vQiQ3ou1qQSO0vghk9KenvUlDddjQMPfWvKXVRACNpGUQodtPQ1k9e0MfBLc=
X-Received: by 2002:a25:6084:: with SMTP id u126mr9523249ybb.198.1619816462516; 
 Fri, 30 Apr 2021 14:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein> <2CAF9521-76FA-4160-9711-4267341B018A@gmail.com>
 <YIxugif2LaXLaL4D@heinlein>
In-Reply-To: <YIxugif2LaXLaL4D@heinlein>
From: Jason Ling <jasonling@google.com>
Date: Fri, 30 Apr 2021 14:00:26 -0700
Message-ID: <CAHBbfcWDBADEkaPNbsUQFVRN3hsyHDhQ7o-6WbGi9Gfm0eEb2Q@mail.gmail.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000d9fc9f05c136e8d8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Mike Jones <proclivis@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d9fc9f05c136e8d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> > However, in general, ADI PMBus devices have a PAGE command, especially
> the LTC388X and LTC297X families.
> >
> > This means that many actions require locking the bus to create compound
> transactions or the use of PAGE_PLUS.
> >
> > The In System Programming code we support on linux via /dev/i2c has thi=
s
> issue. If another process touched hwmon during programming, and touches a
> PAGE, the programming may fail, or worse it sends the wrong settings.
> I'm not sure how this is even possible.  How did an hwmon driver touch
> the device and userspace access it?  I'm fairly sure.


IIRC there is some protection if you use the smbus_readX smbus_writeX APIs
but if you're doing ioctl(I2C_RDWR) then a hwmon driver being bound to a
device won't stop you from hammering on it.
Also userspace can pass the force option to i2c-dev and it'll let you
hammer away on the device as well.

On Fri, Apr 30, 2021 at 1:54 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, Apr 30, 2021 at 09:43:21AM -0600, Mike Jones wrote:
>
> > I had a similar discussion with Guenter, who suggested that any i2c cod=
e
> in user space is problematic, but I think it also said there was enough
> locking in the drivers that SMBus transactions from /dev/i2c or i2c-tools
> would not interact with hwmon.
>
> I'm pretty sure there is locking such that the kernel won't let you talk
> to a
> device that is already bound to a driver.  Once you unbind the kernel sid=
e
> you're free to do what you want.
>
> What I don't recall is how much of the i2c-mux support gets propagated
> out to userspace.  Hopefully you don't have to mess with moving muxes
> and talking past those devices.  (I've seen some nasty shell scripts
> using i2c-tools doing things like this in the past.)
>
> > However, in general, ADI PMBus devices have a PAGE command, especially
> the LTC388X and LTC297X families.
> >
> > This means that many actions require locking the bus to create compound
> transactions or the use of PAGE_PLUS.
> >
> > The In System Programming code we support on linux via /dev/i2c has thi=
s
> issue. If another process touched hwmon during programming, and touches a
> PAGE, the programming may fail, or worse it sends the wrong settings.
>
> I'm not sure how this is even possible.  How did an hwmon driver touch
> the device and userspace access it?  I'm fairly sure.
>
> > If the work within the PMBus community to have a standard programming
> file format, if it were to be applied in user space, OBMC would have to
> disable hwmon and all telemetry while the programming is in process.
> >
> > If the file (or data blob) was applied in a kernel driver, it could loc=
k
> the i2c during the process so that all hwmon activity and telemetry are
> held off.
>
> Right.  I would expect the locking at a pmbus level so that the
> pmbus-hwmon parts would block on a mutex until the firmware update is
> complete (if firmware update were done in the pmbus driver).
>
> > This problem is not unique to our desire for a file format. That is
> driven by the vendors complexity and business models.
> >
> > But, in the context of the ADM1266, it is a multipage device. The DS
> does not say it can do PAGE_PLUS. Therefore, unless I am missing somethin=
g,
> the above problems apply unless using a PAGEless bulk programming
> mechanism. I don=E2=80=99t know this part well enough to know how that wo=
rks, or if
> it is published.
> >
> > The other two families LTC388X and LTC297X do have a PAGEless bulk
> programming. We don=E2=80=99t like do it with telemetry hammering it, mai=
nly
> because it feels risky.
> >
> > Finally, one could argue that most OMBC systems are using the 1266 and
> not the other parts. But I can say I have sent patches for other parts to
> OBMC users, so they are in use.
>
> There is already some firmware blob support in the kernel, just not for
> pmbus.  Has anyone investigated what (if anything) we'd need to do to be
> able to leverage this?
>
> --
> Patrick Williams
>

--000000000000d9fc9f05c136e8d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; However, in general, ADI=
 PMBus devices have a PAGE command, especially the LTC388X and LTC297X fami=
lies.<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<=
br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; This m=
eans that many actions require locking the bus to create compound transacti=
ons or the use of PAGE_PLUS.<br></span><span class=3D"gmail-im" style=3D"co=
lor:rgb(80,0,80)">&gt;<br></span><span class=3D"gmail-im" style=3D"color:rg=
b(80,0,80)">&gt; The In System Programming code we support on linux via /de=
v/i2c has this issue. If another process touched hwmon during programming, =
and touches a PAGE, the programming may fail, or worse it sends the wrong s=
ettings.</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br></=
span>I&#39;m not sure how this is even possible.=C2=A0 How did an hwmon dri=
ver touch<br>the device and userspace access it?=C2=A0 I&#39;m fairly sure.=
</blockquote><div><br></div><div>IIRC there is some protection if you use t=
he smbus_readX smbus_writeX APIs but if you&#39;re doing ioctl(I2C_RDWR) th=
en a hwmon driver being bound to a device won&#39;t stop you from hammering=
 on it.</div><div>Also userspace can pass the force option to i2c-dev and i=
t&#39;ll let you hammer away on the device as well.=C2=A0</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr =
30, 2021 at 1:54 PM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xy=
z">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Fri, Apr 30, 2021 at 09:43:21AM -0600, Mike Jones wr=
ote:<br>
<br>
&gt; I had a similar discussion with Guenter, who suggested that any i2c co=
de in user space is problematic, but I think it also said there was enough =
locking in the drivers that SMBus transactions from /dev/i2c or i2c-tools w=
ould not interact with hwmon.<br>
<br>
I&#39;m pretty sure there is locking such that the kernel won&#39;t let you=
 talk to a<br>
device that is already bound to a driver.=C2=A0 Once you unbind the kernel =
side<br>
you&#39;re free to do what you want.<br>
<br>
What I don&#39;t recall is how much of the i2c-mux support gets propagated<=
br>
out to userspace.=C2=A0 Hopefully you don&#39;t have to mess with moving mu=
xes<br>
and talking past those devices.=C2=A0 (I&#39;ve seen some nasty shell scrip=
ts<br>
using i2c-tools doing things like this in the past.)<br>
<br>
&gt; However, in general, ADI PMBus devices have a PAGE command, especially=
 the LTC388X and LTC297X families.<br>
&gt; <br>
&gt; This means that many actions require locking the bus to create compoun=
d transactions or the use of PAGE_PLUS.<br>
&gt; <br>
&gt; The In System Programming code we support on linux via /dev/i2c has th=
is issue. If another process touched hwmon during programming, and touches =
a PAGE, the programming may fail, or worse it sends the wrong settings.<br>
<br>
I&#39;m not sure how this is even possible.=C2=A0 How did an hwmon driver t=
ouch<br>
the device and userspace access it?=C2=A0 I&#39;m fairly sure.<br>
<br>
&gt; If the work within the PMBus community to have a standard programming =
file format, if it were to be applied in user space, OBMC would have to dis=
able hwmon and all telemetry while the programming is in process.<br>
&gt; <br>
&gt; If the file (or data blob) was applied in a kernel driver, it could lo=
ck the i2c during the process so that all hwmon activity and telemetry are =
held off.<br>
<br>
Right.=C2=A0 I would expect the locking at a pmbus level so that the<br>
pmbus-hwmon parts would block on a mutex until the firmware update is<br>
complete (if firmware update were done in the pmbus driver).<br>
<br>
&gt; This problem is not unique to our desire for a file format. That is dr=
iven by the vendors complexity and business models.<br>
&gt; <br>
&gt; But, in the context of the ADM1266, it is a multipage device. The DS d=
oes not say it can do PAGE_PLUS. Therefore, unless I am missing something, =
the above problems apply unless using a PAGEless bulk programming mechanism=
. I don=E2=80=99t know this part well enough to know how that works, or if =
it is published.<br>
&gt; <br>
&gt; The other two families LTC388X and LTC297X do have a PAGEless bulk pro=
gramming. We don=E2=80=99t like do it with telemetry hammering it, mainly b=
ecause it feels risky.<br>
&gt; <br>
&gt; Finally, one could argue that most OMBC systems are using the 1266 and=
 not the other parts. But I can say I have sent patches for other parts to =
OBMC users, so they are in use.<br>
<br>
There is already some firmware blob support in the kernel, just not for<br>
pmbus.=C2=A0 Has anyone investigated what (if anything) we&#39;d need to do=
 to be<br>
able to leverage this?<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000d9fc9f05c136e8d8--
