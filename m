Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5937292A52
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 17:25:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFLD1517WzDqbg
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 02:25:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OG9QeULd; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFLC365wdzDqbY
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 02:24:13 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id w5so10632qvn.12
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSALveWQT8KQJ7rMcXhPMGY1pAdgx3ZZvD0NpEmEzd0=;
 b=OG9QeULd8aa27sJcYsjYAXgczASMOQpvyZ/SoGWDHNtL5LSRghnRWQaxFJ52txUoOD
 k9U+BoZom/uOmZA564DEYXqtYFX0llA89PJLTsKSsef+2zHBoCy8nvvPuu+yORg3TwxD
 n6uMYk7CxXTQS2PMHbP2JycCF4k26fHhuiccb6RESbnTa3xG8Ht+CtmdcZ46RKlCbiA1
 0lwm/jOjlxjZMOX2m3T0e/N2NCweHyltR62ISRwOPVDYbg4DID+KwX5RvqKh3zOUE3xS
 OPPe1F2pi60jtPV6QAEYWGe0R+b8JKneR9bCmFXALlUKg9m40mUD1WfL6DOfeykYyvZz
 hKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSALveWQT8KQJ7rMcXhPMGY1pAdgx3ZZvD0NpEmEzd0=;
 b=cUzlLhzqlBXxfxzR17/znCFa7HqAxdW6PQdu9GIz+Tq5Hp3+ZStgwZsUbpuh5NM7j2
 tUyoVEAmLKb8CdSYW1ilM8yaLSc1N7Y1DB4D/qvO03uwyYDEjsG7kFnnCwZJ/VtybXYj
 oErNnHVSkir0o/I/aFDgnyPm+aTFyNcUGh9I15bOIztD6UEODcBVu4jIY9ghQlsrL0PE
 sOM5EDYxcCE6SM6ZzYjAEYiXABeXvcdd/3wlAiawsg92+FseG7yqvAT1St3Xa2MlpiMI
 wrgOtfI5ImEOtSNfMbDf5FWLHX7HERsE65N7wk8vHqtQXyd0JsiOvL42WRA6ZRVe9LYn
 xTsA==
X-Gm-Message-State: AOAM533X+vTC8qlMKQ0F3mCT2OFIQrnseLYyhb+JaANP3HvL0/xfkXLc
 XtTyKUqQBmPACy2xB233LwXjkJKs1jksfLBul1A=
X-Google-Smtp-Source: ABdhPJx1tfr4z0VPgwg/QR5HjCeYx/f5202EeCeS+LVhtByn0BcBpW4yTx/Q0CDuRGM6TfgRidyndeugDuVOM7HoIZM=
X-Received: by 2002:a0c:f8cd:: with SMTP id h13mr284328qvo.10.1603121048706;
 Mon, 19 Oct 2020 08:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
In-Reply-To: <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Mon, 19 Oct 2020 22:23:57 +0700
Message-ID: <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000a3e16605b207b407"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a3e16605b207b407
Content-Type: text/plain; charset="UTF-8"

Thanks for your reply Matt Spinler,

Can you show me the discussion threads?

I also thought about the solution for that features:
In the current hwmon we support GPIOCHIP + GPIO option which used to enable
sensors to read. In the hwmon code, we just set that pin and wait before
reading.
I think we can support a similar option named GPIOENABLE + GPIOV. When the
status of Gpio pin defind in GPIOEANBLE match with GPIOV.
That sensors will be read and update to Dbus.
If not it will be removed from DBus until the GPIO pin math GPIOV.
Maybe we can have many different solutions.

If you don't mind, can you tell me how IBM supports that features?

Regards.
Thu Nguyen.

On Mon, Oct 19, 2020 at 9:16 PM Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 10/18/2020 8:58 AM, Thu Ba Nguyen wrote:
> > Dear, I'm supporting the host sensors for Ampere Computing LLC
> > platform. We are...
> > This Message Is From an External Sender
> > This message came from outside your organization.
> >
> > Dear,
> >
> > I'm supporting the host sensors for Ampere Computing LLC platform.
> > We are using phosphor-hwmon to update values of sensors and monitoring
> > sensors warning/errors base on threshold setting.
> >
> > There are some sensors which are turned off when host Off. It can be
> > the sensors reported by host or voltage/temperature/power sensors
> >  which use the same power source with host.
> >
> > I researched in openBmc sensor-architecture documents but can't find
> > any option to enable/disable sensors base on one status or GPIO pins.
> > I can't use REMOVERCS.
> >
> > Research in phosphor-hwmon code, I don't see the answer too.
> >
> > Do we have any options/solution to Enable/Disable some sensors when
> > Host On/Off?
>
> Hi,
> The phosphor-hwmon code doesn't support that yet.  It has been discussed
> before but nobody
> has implemented it.
>
> >
> > Thanks.
> > Thu Nguyen.
>
>

--000000000000a3e16605b207b407
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for your reply Matt Spinler,<div><=
br></div><div>Can you show me the discussion threads?</div><div><br></div><=
div>I also thought about the solution for that features:</div><div>In the c=
urrent hwmon we support GPIOCHIP=C2=A0+ GPIO=C2=A0option which used to enab=
le sensors to read. In the hwmon code, we just set that pin and wait before=
 reading.<br></div><div>I think we can support a similar option named GPIOE=
NABLE=C2=A0+ GPIOV. When the status of Gpio pin defind in GPIOEANBLE=C2=A0m=
atch with GPIOV.</div><div>That sensors will be read and update to Dbus.</d=
iv><div>If not it will be removed from DBus until the GPIO pin math GPIOV.<=
/div><div>Maybe we can have many different solutions.</div><div><br></div><=
div>If you don&#39;t mind, can you tell me how IBM supports that features?<=
/div><div><br></div><div>Regards.</div><div>Thu Nguyen.=C2=A0</div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Oct 19, 2020 at 9:16 PM Matt Spinler &lt;<a href=3D"mailto:mspinler@l=
inux.ibm.com">mspinler@linux.ibm.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1e=
x"><br>
<br>
On 10/18/2020 8:58 AM, Thu Ba Nguyen wrote:<br>
&gt; Dear, I&#39;m supporting the host sensors for Ampere Computing LLC <br=
>
&gt; platform. We are...<br>
&gt; This Message Is From an External Sender<br>
&gt; This message came from outside your organization.<br>
&gt;<br>
&gt; Dear,<br>
&gt;<br>
&gt; I&#39;m supporting the host sensors for Ampere Computing LLC platform.=
<br>
&gt; We are using phosphor-hwmon to update values of sensors and monitoring=
 <br>
&gt; sensors warning/errors base on threshold setting.<br>
&gt;<br>
&gt; There are some sensors which are turned off when host=C2=A0Off. It can=
 be <br>
&gt; the sensors reported by host or voltage/temperature/power sensors <br>
&gt; =C2=A0which use the same power source with host.<br>
&gt;<br>
&gt; I researched in openBmc sensor-architecture documents=C2=A0but can&#39=
;t find <br>
&gt; any option to enable/disable sensors base on one status or GPIO pins. =
<br>
&gt; I can&#39;t use REMOVERCS.<br>
&gt;<br>
&gt; Research in phosphor-hwmon code, I don&#39;t see the answer too.<br>
&gt;<br>
&gt; Do we have any options/solution to=C2=A0Enable/Disable some sensors wh=
en <br>
&gt; Host On/Off?<br>
<br>
Hi,<br>
The phosphor-hwmon code doesn&#39;t support that yet.=C2=A0 It has been dis=
cussed <br>
before but nobody<br>
has implemented it.<br>
<br>
&gt;<br>
&gt; Thanks.<br>
&gt; Thu Nguyen.<br>
<br>
</blockquote></div>

--000000000000a3e16605b207b407--
