Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D86B24C348
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 18:24:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXVMx3clvzDqx2
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 02:24:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0DJ8cgNE; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXVM51RLRzDqGF
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 02:23:28 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id g3so1428166ybc.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 09:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gADqIU20TF4kec+J+9r++6S/WxNoa+sZt0XCBIZ7Zus=;
 b=0DJ8cgNELURG8VWDcwlbCcGeug7h375t00qfpYROXIWrhXSleHvfUI6ZqE2IcnZoiz
 vPBJFBJRPS8VGe6eReZWyPlK4U/92R2yCTRw++WMvggniNMdGDJRtjZHFWLZSnwS9Rhs
 Nkq3TvzQ6EVthXjVNWnUng4i+APgrD6KGyC0HzLNvXjxQiwfewpx476cgs1prUJDj3S4
 E+A4ne65P+Q4uhtpS5sFgBlRWbV2YmVFL5WBsHQeDSKnH1STekmRTre8c2F2TJqHOxzx
 dWZB8DzbNn7m7s9d2xDgJ/b9PZqCJWXlK5DTzBUDtdWJl2eUNtWQ1iZ8+sCUGbayasAc
 KxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gADqIU20TF4kec+J+9r++6S/WxNoa+sZt0XCBIZ7Zus=;
 b=bVnx/l7IiKyT3KnkR50Z2JH+5scm/BBjsroZ6szGKpvyYSkYBtTrApmFM8RkKtCrYp
 Wc/lnbaTY8cgmMb0PGxJTim6LegIF+CW2qQZn0r7nwzfUv3aRgsw7hr7pUmqjdwgNk1X
 R4x51MtdwLwMaeFZAKKPXcA1jU2O+yWOTy18u/zZn0ss+2N5kpixtD7y5WsoIp3CAnIk
 pmYEyuR1MiBPbqF4zlWSlb8+v4GWyO2UrkEaF4RnV5zhC1YdhofFE5evOTe3IPt7Qv+1
 wTmgpEoY1INZKEHGyaVi60Q5nFLhzGMdpYXDqw/JwouxjJX5+mlXcvIgzplprFLwd2LA
 lHqw==
X-Gm-Message-State: AOAM532/e00oR/edkOAU8pl63ywuX+CCokgRbEvZSU7e00SbLbEbBn9L
 bXjXtFCzWEUAh8cGpO5WavO5JT36p6kva8cYzcOYB1/SyvXFpg==
X-Google-Smtp-Source: ABdhPJwLdxNqP6zC/wsv3piUc2vxOIp8H/yt2+E9Op7ZBmdpB8bidRx7KorBeAvFCFtLrpvWf0RhDKOjy7pEMDF0g5Q=
X-Received: by 2002:a25:d48e:: with SMTP id m136mr6104497ybf.148.1597940604882; 
 Thu, 20 Aug 2020 09:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8pG0gLhS5Ycxdhvx=1xdm7J2mCP0VfiHyuZOofB3gWHhw@mail.gmail.com>
In-Reply-To: <CAFR_W8pG0gLhS5Ycxdhvx=1xdm7J2mCP0VfiHyuZOofB3gWHhw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 20 Aug 2020 09:23:13 -0700
Message-ID: <CACWQX821VpWvbnnv51hbwVSuhaQWjCeovvEBkLwAVp6pvGidkQ@mail.gmail.com>
Subject: Re: Board Sensor Calibration
To: Maxim Sloyko <maxims@google.com>
Content-Type: multipart/alternative; boundary="000000000000205f4e05ad518aee"
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

--000000000000205f4e05ad518aee
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 19, 2020 at 10:41 AM Maxim Sloyko <maxims@google.com> wrote:

>

> Hi OpenBMC!



Hi!




>

> We would like to have a value reported by a certain sensor changed
according to our calibration results. This is a temperature sensor and the
calibration has nothing to do with the sensor itself -- so no need to
change the driver or anything -- but with a sensor placement on the board.
Basically we want to infer the temperature at a different location by
calibrating the sensor.



Do you have more details on what the transfer function is?  Is it a simple
offset, or is it a more complicated lookup table?  Does it include multiple
sensors to generate this new value, or is it a single sensor?  Is it
intended to "replace" the existing value, or is it intended to complement
it?



The ideas I've heard before that this might be:

1. The temp sensor isn't that accurate, so we want to calibrate it to a
better transfer function that we determined empirically.

2. The temp sensor is adjacent to the thing we really want to measure, so
we want to create an offset including the CFM that approximates the
temperature of the thing we can't measure directly.

3. I want to transform the value of the sensor into different units, (Power
+ CFM to exit air air, or power + time to energy)




>

> Are there any tools in OpenBMC that would allow us to add the calibration
curve to, say, phosphor-hwmon and have it report the value different from
the one reported by the underlying sensor? Did anybody else have to deal
with something like this and what was your solution? Do people more
familiar with sensor architecture have any recommendations on how best to
handle this?



The closest examples that come to mind for dbus-sensors type architectures
are:

CFM sensor and Exit air temp sensor.  Both pull in a number of other
sensors, and run them through a math transform to come up with a "new"
sensor value derived from the other inputs.  This sounds similar to what
you want, although it's probably more complex than you're looking for.

The "virtual sensor" proposal currently in review, which I personally have
technical issues with, and have left comments as such.  I don't believe
there's a working implementation of this yet, but there are those working
on it.



If it were me, and I wanted to add a simple lookup table to dbus sensors,
I'd probably model it in an entity manager config for the temperature
sensor, similar to how the stepwise controller models it, and add that into
the Hwmon temp sensor daemon.  The below example adds a +5 celcius offset
to the bmc temp sensor as an example.  Bear in mind, this wouldn't work
today, you'd have to adjust hwmontempsensor to take this into account.



{

    "Address": "0x4A",

    "Bus": 6,

    "Name": "BMC Temp",

    "Thresholds": [],

    "Type": "TMP75",

    "CalibrationOutput": [

        5.0,

        105.0

    ],

    "CalibrationReading": [

         0.0,

        100.0

    ],

}

-- 
-Ed

--000000000000205f4e05ad518aee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><br>On Wed, Aug 19, 2020 at 10:41 AM Maxim Sloyko &lt;<a href=3D"m=
ailto:maxims@google.com" target=3D"_blank">maxims@google.com</a>&gt; wrote:=
<br><br>&gt;<br><br>&gt; Hi OpenBMC!<br><br><br><br>Hi!</div><div><br><br><=
br><br>&gt;<br><br>&gt; We would like to have a value reported by a certain=
 sensor changed according to our calibration results. This is a temperature=
 sensor and the calibration has nothing to do with the sensor itself -- so =
no need to change the driver or anything -- but with a sensor placement on =
the board. Basically we want to infer the temperature at a different locati=
on by calibrating the sensor.<br><br><br></div><div><br>Do you have more de=
tails on what the transfer function is?=C2=A0 Is it a simple offset, or is =
it a more complicated lookup table?=C2=A0 Does it include multiple sensors =
to generate this new value, or is it a single sensor?=C2=A0 Is it intended =
to &quot;replace&quot; the existing value, or is it intended to complement =
it?<br><br><br><br>The ideas I&#39;ve heard before that this might be:<br><=
br>1. The temp sensor isn&#39;t that accurate, so we want to calibrate it t=
o a better transfer function that we determined empirically.<br><br>2. The =
temp sensor is adjacent to the thing we really want to measure, so we want =
to create an offset including the CFM that approximates the temperature of =
the thing we can&#39;t measure directly.<br><br>3. I want to transform the =
value of the sensor into different units, (Power + CFM to exit air air, or =
power + time to energy)</div><div><br><br><br><br>&gt;<br><br>&gt; Are ther=
e any tools in OpenBMC that would allow us to add the calibration curve to,=
 say, phosphor-hwmon and have it report the value different from the one re=
ported by the underlying sensor? Did anybody else have to deal with somethi=
ng like this and what was your solution? Do people more familiar with senso=
r architecture have any recommendations on how best to handle this?<br><br>=
<br></div><div><br>The closest examples that come to mind for dbus-sensors =
type architectures are:<br><br>CFM sensor and Exit air temp sensor.=C2=A0 B=
oth pull in a number of other sensors, and run them through a math transfor=
m to come up with a &quot;new&quot; sensor value derived from the other inp=
uts.=C2=A0 This sounds similar to what you want, although it&#39;s probably=
 more complex than you&#39;re looking for.<br><br>The &quot;virtual sensor&=
quot; proposal currently in review, which I personally have technical issue=
s with, and have left comments as such.=C2=A0 I don&#39;t believe there&#39=
;s a working implementation of this yet, but there are those working on it.=
<br><br><br><br>If it were me, and I wanted to add a simple lookup table to=
 dbus sensors, I&#39;d probably model it in an entity manager config for th=
e temperature sensor, similar to how the stepwise controller models it, and=
 add that into the Hwmon temp sensor daemon.=C2=A0 The below example adds a=
 +5 celcius offset to the bmc temp sensor as an example.=C2=A0 Bear in mind=
, this wouldn&#39;t work today, you&#39;d have to adjust hwmontempsensor to=
 take this into account.<br><br><br><br>{<br><br>=C2=A0 =C2=A0 &quot;Addres=
s&quot;: &quot;0x4A&quot;,<br><br>=C2=A0 =C2=A0 &quot;Bus&quot;: 6,<br><br>=
=C2=A0 =C2=A0 &quot;Name&quot;: &quot;BMC Temp&quot;,<br><br>=C2=A0 =C2=A0 =
&quot;Thresholds&quot;: [],<br><br>=C2=A0 =C2=A0 &quot;Type&quot;: &quot;TM=
P75&quot;,<br><br>=C2=A0 =C2=A0 &quot;CalibrationOutput&quot;: [<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 5.0,<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 105.0<br><=
br>=C2=A0 =C2=A0 ],<br><br>=C2=A0 =C2=A0 &quot;CalibrationReading&quot;: [<=
br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.0,<br><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 100.0<br><br>=C2=A0 =C2=A0 ],<br><br>}<br><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr">-Ed</div></div>

--000000000000205f4e05ad518aee--
