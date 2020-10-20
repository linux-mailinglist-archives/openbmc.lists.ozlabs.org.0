Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DB2294564
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 01:17:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG8fV2G9zzDqft
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 10:17:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tOMmojlH; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG8dj6F84zDqf5
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 10:16:39 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id f21so505044qko.5
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 16:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOG4WfFr1DbXDcupgiomKjiB/SEEOKUmSZCw6V9NPmg=;
 b=tOMmojlHiIqEBf1XMLIh1ALm0F9QR2/QZ1PNe1uPJQfeB7IYs/S6G1rbp/EuF9hseK
 vH0XTXF87lw5kDnvXGPr06CPeNym9psmButANrffifx6RJf5RkYPRZAq9vZPGysZ9qLI
 FOZ9MjiRMxjF5hK4a/g6VXN+RpraRJotELJVnVm0RB4zEBAqzvESF+8QFpKfCcjRgv2U
 YIo5etfyE01WYOTioWIeRVGHdhaJwPNnjYYlu6jYBUstMPGVPh/h1AXRc2cNlu2eevRh
 JEBRVHcrQL4yo6QuZMJ2KTkPpnxT85K2eH32ndpMQ5bd+GoYUleTfNs7LxSDxkf9EAL8
 Zs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOG4WfFr1DbXDcupgiomKjiB/SEEOKUmSZCw6V9NPmg=;
 b=L0OjKDZXrHxwGB3Xa9rCsEDW73Bibj+WxPB0kq8d/bgE8yTNWtOFTPYXY316d4zPWl
 uWwL32UvzsoL+8MdjIHsKL84IWzfEAa5S+QJIad8Xw+lNK1bzzah+GwqrijGi0C1B3iv
 W5qZ/gTEl/Tu/9Dg+DGMai8FXOEgfxrboYWefXGc9i+0qobpwn0d2080BIDvf8EI04/G
 hLTBKyr3YAg0XwGTUpvczBILaMV+ty0Gut47rSDGKhcUC/kMEzlMYCw2geQwdKMoMWK/
 7zjAKxhPs+BYHPWnB5uyAhOTWrBx+eXlhyQk3ZRkALpD7AwbhaKHx/proIuUob6zl+Jx
 i+Lg==
X-Gm-Message-State: AOAM531hIdrDxCW8bqJVSUPnk9t7w/YIvoyb5v0GnK840XNxKlwoVzMZ
 DFg/4Bhf58qxXQpQnMU+0Yiiz3cHZojk3RvtdFPuJr+6tj4=
X-Google-Smtp-Source: ABdhPJwgqaGMsluS4gGn1hLYnaF1cZpMVEb1LR7qDKaa1lKcqMeukA7gjYQSnGDHpianVRyRDQ6cBTnQ4PW6ujtbxNg=
X-Received: by 2002:a05:620a:2e3:: with SMTP id
 a3mr598479qko.117.1603235796068; 
 Tue, 20 Oct 2020 16:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
 <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
 <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
In-Reply-To: <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Wed, 21 Oct 2020 06:16:24 +0700
Message-ID: <CALioo35hggtvar8C2QgAyYRyB4MCPXD9Lmq2_WXPnFYE9EYDTQ@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000001dad3e05b2226c28"
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

--0000000000001dad3e05b2226c28
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 8:46 PM Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 10/19/2020 10:23 AM, Thu Ba Nguyen wrote:
> > Thanks for your reply Matt Spinler, Can you show me the discussion
> > threads? I also...
> > This Message Is From an External Sender
> > This message came from outside your organization.
> >
> > Thanks for your reply Matt Spinler,
> >
> > Can you show me the discussion threads?
>
> Sure: https://lists.ozlabs.org/pipermail/openbmc/2019-October/018967.html
>
> >
> > I also thought about the solution for that features:
> > In the current hwmon we support GPIOCHIP + GPIO option which used to
> > enable sensors to read. In the hwmon code, we just set that pin and
> > wait before reading.
> > I think we can support a similar option named GPIOENABLE + GPIOV. When
> > the status of Gpio pin defind in GPIOEANBLE match with GPIOV.
> > That sensors will be read and update to Dbus.
> > If not it will be removed from DBus until the GPIO pin math GPIOV.
> > Maybe we can have many different solutions.
>
> As Ed mentioned, I think a good direction to start with is how
> dbus-sensors handles it, so we  can have
> common behavior.  I believe they look at the host state D-Bus property
> and still keep the sensor
> on D-Bus even when power is off.
>

[Thu] Yah, I think  using the host state D-Bus property to verify host
state.
Then handling the host sensors based on this status is a better solution.
Keeping the sensors on Dbus can cause the value or the status of
warning/critical value of sensors
is out update. I expected that the host sensors will be removed from Dbus
when the host is off.

>
> > If you don't mind, can you tell me how IBM supports that features?
>
> We lucked out out in that the driver was only loaded when power was on.
>
[Thu] What will be displayed when you open health --> sensors page in
OpenBmc web?
Are the host sensors still there and value is "na" or some things like that?

>
> >
> > Regards.
> > Thu Nguyen.
> >
> > On Mon, Oct 19, 2020 at 9:16 PM Matt Spinler <mspinler@linux.ibm.com
> > <mailto:mspinler@linux.ibm.com>> wrote:
> >
> >
> >
> >     On 10/18/2020 8:58 AM, Thu Ba Nguyen wrote:
> >     > Dear, I'm supporting the host sensors for Ampere Computing LLC
> >     > platform. We are...
> >     > This Message Is From an External Sender
> >     > This message came from outside your organization.
> >     >
> >     > Dear,
> >     >
> >     > I'm supporting the host sensors for Ampere Computing LLC platform.
> >     > We are using phosphor-hwmon to update values of sensors and
> >     monitoring
> >     > sensors warning/errors base on threshold setting.
> >     >
> >     > There are some sensors which are turned off when host Off. It
> >     can be
> >     > the sensors reported by host or voltage/temperature/power sensors
> >     >  which use the same power source with host.
> >     >
> >     > I researched in openBmc sensor-architecture documents but can't
> >     find
> >     > any option to enable/disable sensors base on one status or GPIO
> >     pins.
> >     > I can't use REMOVERCS.
> >     >
> >     > Research in phosphor-hwmon code, I don't see the answer too.
> >     >
> >     > Do we have any options/solution to Enable/Disable some sensors when
> >     > Host On/Off?
> >
> >     Hi,
> >     The phosphor-hwmon code doesn't support that yet.  It has been
> >     discussed
> >     before but nobody
> >     has implemented it.
> >
> >     >
> >     > Thanks.
> >     > Thu Nguyen.
> >
>
>

--0000000000001dad3e05b2226c28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 2020=
 at 8:46 PM Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspi=
nler@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><br>
<br>
On 10/19/2020 10:23 AM, Thu Ba Nguyen wrote:<br>
&gt; Thanks for your reply Matt Spinler, Can you show me the discussion <br=
>
&gt; threads? I also...<br>
&gt; This Message Is From an External Sender<br>
&gt; This message came from outside your organization.<br>
&gt;<br>
&gt; Thanks for your reply Matt Spinler,<br>
&gt;<br>
&gt; Can you show me the discussion threads?<br>
<br>
Sure: <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2019-October/01=
8967.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/pi=
permail/openbmc/2019-October/018967.html</a><br>
<br>
&gt;<br>
&gt; I also thought about the solution for that features:<br>
&gt; In the current hwmon we support GPIOCHIP=C2=A0+ GPIO=C2=A0option which=
 used to <br>
&gt; enable sensors to read. In the hwmon code, we just set that pin and <b=
r>
&gt; wait before reading.<br>
&gt; I think we can support a similar option named GPIOENABLE=C2=A0+ GPIOV.=
 When <br>
&gt; the status of Gpio pin defind in GPIOEANBLE=C2=A0match with GPIOV.<br>
&gt; That sensors will be read and update to Dbus.<br>
&gt; If not it will be removed from DBus until the GPIO pin math GPIOV.<br>
&gt; Maybe we can have many different solutions.<br>
<br>
As Ed mentioned, I think a good direction to start with is how <br>
dbus-sensors handles it, so we=C2=A0 can have<br>
common behavior.=C2=A0 I believe they look at the host state D-Bus property=
 <br>
and still keep the sensor<br>
on D-Bus even when power is off.<br></blockquote><div>=C2=A0</div><div>[Thu=
] Yah, I think =C2=A0using=C2=A0<span style=3D"color:rgb(0,0,0);font-family=
:-webkit-standard;font-size:medium">the host state D-Bus property</span><sp=
an style=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-size:medium"=
>=C2=A0to verify host state.</span></div><div><font color=3D"#000000" face=
=3D"-webkit-standard" size=3D"3"><span style=3D"caret-color: rgb(0, 0, 0);"=
>Then handling the host sensors based on this status is a better solution.<=
/span></font></div><div><font color=3D"#000000" face=3D"-webkit-standard" s=
ize=3D"3"><span style=3D"caret-color: rgb(0, 0, 0);">Keeping the sensors on=
 Dbus can cause the value or the status of warning/critical value of sensor=
s</span></font></div><div><font color=3D"#000000" face=3D"-webkit-standard"=
 size=3D"3"><span style=3D"caret-color: rgb(0, 0, 0);">is out update. I exp=
ected that the host sensors will be removed from Dbus when the host is off.=
</span></font></div><div><font color=3D"#000000" face=3D"-webkit-standard" =
size=3D"3"><span style=3D"caret-color: rgb(0, 0, 0);"><br></span></font></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204=
);padding-left:1ex">
&gt;<br>
&gt; If you don&#39;t mind, can you tell me how IBM supports that features?=
<br>
<br>
We lucked out out in that the driver was only loaded when power was on.<br>=
</blockquote><div>[Thu] What will be displayed when you open health --&gt; =
sensors page in OpenBmc web?=C2=A0</div><div>Are the host sensors still the=
re and value is &quot;na&quot; or some things like that?</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1=
ex">
<br>
&gt;<br>
&gt; Regards.<br>
&gt; Thu Nguyen.<br>
&gt;<br>
&gt; On Mon, Oct 19, 2020 at 9:16 PM Matt Spinler &lt;<a href=3D"mailto:msp=
inler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com" target=3D"_blank"=
>mspinler@linux.ibm.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/18/2020 8:58 AM, Thu Ba Nguyen wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Dear, I&#39;m supporting the host sensors for =
Ampere Computing LLC<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; platform. We are...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This Message Is From an External Sender<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This message came from outside your organizati=
on.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Dear,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m supporting the host sensors for Ampere=
 Computing LLC platform.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; We are using phosphor-hwmon to update values o=
f sensors and<br>
&gt;=C2=A0 =C2=A0 =C2=A0monitoring<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; sensors warning/errors base on threshold setti=
ng.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; There are some sensors which are turned off wh=
en host=C2=A0Off. It<br>
&gt;=C2=A0 =C2=A0 =C2=A0can be<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the sensors reported by host or voltage/temper=
ature/power sensors<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0which use the same power source with hos=
t.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I researched in openBmc sensor-architecture do=
cuments=C2=A0but can&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0find<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; any option to enable/disable sensors base on o=
ne status or GPIO<br>
&gt;=C2=A0 =C2=A0 =C2=A0pins.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I can&#39;t use REMOVERCS.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Research in phosphor-hwmon code, I don&#39;t s=
ee the answer too.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Do we have any options/solution to=C2=A0Enable=
/Disable some sensors when<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Host On/Off?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0The phosphor-hwmon code doesn&#39;t support that ye=
t.=C2=A0 It has been<br>
&gt;=C2=A0 =C2=A0 =C2=A0discussed<br>
&gt;=C2=A0 =C2=A0 =C2=A0before but nobody<br>
&gt;=C2=A0 =C2=A0 =C2=A0has implemented it.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thu Nguyen.<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--0000000000001dad3e05b2226c28--
