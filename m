Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB22E9F0E
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 21:55:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8nvX07FzzDqRF
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 07:55:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BfbvJu3f; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8ntk1S10zDqPN
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 07:54:33 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id b26so67657679lff.9
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2021 12:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CMgWjh2Lm43FS1Hx42U3oFS3z4epGfjI57d9ZckEio4=;
 b=BfbvJu3fyO18XoyxOzT6HUJnqoxYfUBlTtmrFN6Xi92UA+878UjzUhFfJYB3rKvINv
 H9QLP7onoR+aqYQFQXtvWkEHL7xhCEOA99U3Pd665k0lFeQYi/PuqgSYgyyYvlye8Ogx
 mo+H/aqUBb7IM2EM7H5tzHx2KR0W3/e7H/uUPXQ+YHt3ft/fucJ63t2pTUNo2CpmGM8F
 s0egrRwcuyC0xGWPvV7VyM+rJRzhvu3Ju6BkqNJHGj0tHeVxhCTWebldi9gWNubHz4uy
 16awkFiOYeoTWwAhtvkZ2syOA+vpfc8rRry9q4q4k2yeXsPMbTzTHKyxYa1lONOwuHJc
 x19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CMgWjh2Lm43FS1Hx42U3oFS3z4epGfjI57d9ZckEio4=;
 b=LmW34sT7FQxRXJAJYhlLh2U6xidtGrmYEIEf+x1+DldlPEkrlzfKd+/N01ErLufwzh
 yVTxKK3+gIJw+LkO6ex4IDRv5BHtxWk7TMNylTvE78xH/aVLTSTrPhUZhtbaWwdJ3vm5
 fAdB6nEVugz/C/LQco+kUYKdAvt67KzOSY13iDYybIRzLVS9h+T5eHG5gcPnbjmfdFsQ
 fOn01FHIrDK9oqOxZ/O3KWeZQMIlGpOBkSaZmE8f/loHAuvKocEB4FG/s+mYb/dcnMig
 DWusDrLq22Vrw9/6V2zPwoGbYsBCWFZr/xmEnguGdsA+o94JB8dQ6XiAMPy9j3rCCorr
 iBaw==
X-Gm-Message-State: AOAM531UQSz9j6QZ7uyev9wOrnfC91NfcHz+6UK30sYWMrVgM6R7AmgK
 Vnz5muLHoZ6X4y1Eb5+4vNG4I9KJz8VkSndicos=
X-Google-Smtp-Source: ABdhPJwqyMc+TaqPoEueEJMiCddntBNvILoArHAqb8nCadCEH2Rh+FJs+EFImCcX9y9RHKyFS3QlN1MKrphmKy6hXuc=
X-Received: by 2002:a2e:8942:: with SMTP id b2mr37797904ljk.274.1609793668614; 
 Mon, 04 Jan 2021 12:54:28 -0800 (PST)
MIME-Version: 1.0
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
In-Reply-To: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Mon, 4 Jan 2021 12:54:17 -0800
Message-ID: <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000c78c0405b8194b68"
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

--000000000000c78c0405b8194b68
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com> wrote:

> Hi,
>
> Just putting on the list what was decided after some lengthy discussions
> on discord.
>
> I need a median of some sensor values, where this median sensor has
> threshold interfaces
> whose values must be defined in entity-manager.  Since exprtk
> expressions are not allowed in
> entity-manager, I cannot just port the PVS's JSON config into an
> entity-manager config.
>
> I missed this discussion but why can't we simply use virtual sensor as
expertk provides median function and we have threshold support for
each virtual sensor. Please help, if I am missing anything.


> Instead, I will make a new entity-manager config that will have the
> component sensors
> along  with the thresholds to use, with a subtype of median, vaguely
> something like:
>
> {
>
> Type: "VirtualSensor"
>
> Name: "MySensorName"
>
> Subtype: "Median"
>
> Sensors: [ "Sensor1", "Sensor2", .... ]
>
> ThresholdsWithHysteresis [ ]
>
> minInput: 0
>
> maxInput: 100
>
> }
>
>
> The minInput/maxInput are needed so we don't use garbage sensor readings
> in the median
> algorithm.  PVS will look for this config to be provided on D-Bus by
> entity-manager, and if
> it's there it will calculate the median (in C++, not exprtk) and use it
> as the virtual sensor value.
>
> Thanks,
> Matt
>
>

--000000000000c78c0405b8194b68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 4, 2021 at 9:49 AM Matt S=
pinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspinler@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi,<br>
<br>
Just putting on the list what was decided after some lengthy discussions <b=
r>
on discord.<br>
<br>
I need a median of some sensor values, where this median sensor has <br>
threshold interfaces<br>
whose values must be defined in entity-manager.=C2=A0 Since exprtk <br>
expressions are not allowed in<br>
entity-manager, I cannot just port the PVS&#39;s JSON config into an <br>
entity-manager config.<br>
<br></blockquote><div>I missed this discussion but why can&#39;t we simply =
use virtual sensor as=C2=A0</div><div>expertk provides median function and =
we have threshold support for=C2=A0</div><div>each virtual sensor. Please h=
elp, if I am missing anything.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Instead, I will make a new entity-manager config that will have the <br>
component sensors<br>
along=C2=A0 with the thresholds to use, with a subtype of median, vaguely <=
br>
something like:<br>
<br>
{<br>
<br>
Type: &quot;VirtualSensor&quot;<br>
<br>
Name: &quot;MySensorName&quot;<br>
<br>
Subtype: &quot;Median&quot;<br>
<br>
Sensors: [ &quot;Sensor1&quot;, &quot;Sensor2&quot;, .... ]<br>
<br>
ThresholdsWithHysteresis [ ]<br>
<br>
minInput: 0<br>
<br>
maxInput: 100<br>
<br>
}<br>
<br>
<br>
The minInput/maxInput are needed so we don&#39;t use garbage sensor reading=
s <br>
in the median<br>
algorithm.=C2=A0 PVS will look for this config to be provided on D-Bus by <=
br>
entity-manager, and if<br>
it&#39;s there it will calculate the median (in C++, not exprtk) and use it=
 <br>
as the virtual sensor value.<br>
<br>
Thanks,<br>
Matt<br>
<br>
</blockquote></div></div>

--000000000000c78c0405b8194b68--
