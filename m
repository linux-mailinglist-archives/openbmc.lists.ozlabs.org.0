Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D9255EF0
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 18:44:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdQRF3179zDqrn
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 02:44:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=F9EX1okD; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdQQD21K9zDqk8
 for <openbmc@lists.ozlabs.org>; Sat, 29 Aug 2020 02:43:15 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id v16so1399191otp.10
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qwZlrNx/66Js6B38PffK6L+Eq4MZiP43o68oMoe0tBk=;
 b=F9EX1okDvBLlZwssjxEpp7FaDyoCdzVh9Uj5mwgbYi7NJwtc6+nEJK4IEL3jDWidm5
 PEDKNfK1zXD8o5rwLzdTCuFU5GLDubgGOlA1u/wZH7EEqnZ3NHsdP18AJwvk66QKLzYm
 joRTzafoSqyOdkFl0X+dEhH+0jpsJZ2Wapp486ay7/gGVD6SOhTbJ+iz0NxLzRfZz8DL
 Rd60V4mA+yC0k5PApADg5z5ylqsKfmAU4eFmLbEaOFmpypsm9JilsedG6oFaUVtm7JFE
 kSBNYaMcA53bJ96RfEBpFFn3GVd7qCVI2dD3o4LP2Fphubugbju0UcPw5VSzRMVghvAe
 m0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwZlrNx/66Js6B38PffK6L+Eq4MZiP43o68oMoe0tBk=;
 b=CaX+stMa2hRvYoYtb5VnK18o2pWSUbWjYeWTVaXxkq37qO4HXnrdqNDa9dAsO+qxvS
 OBy/ZrviAgrp0nnpJ1syrMwt3PsQT31HX38MJeFHEt3Q1Q85dJegP9lXEEFCbt9SZSZG
 EB7i+KxNQkPjMEqfz4rK4TRhjSMAvjj/O/9jW2PzDtwvD+dry6GeK18+fAt+J5uMpfZK
 f3ZIDksFUihmyH7/jnXMs9oaPgZtce4OVS8ToSSl1DPK83cmJfXR1UVQQbR/gzTrA7GZ
 NkaGmi8R13pe2BX3RplCO1j27lWIHmQKw4i65L5uAsbzpIO4FLJfEfQUb28w2338uc+B
 oFYw==
X-Gm-Message-State: AOAM532ER/5zJrciSPa03H2Rs8ltwxCTxCOSxzmc5XFJqEI4e66Rwkak
 ZT6HRVL0lVmb4F/dmdeAzJz6mwYI1exe07/T7HD+oQ==
X-Google-Smtp-Source: ABdhPJxztdp1hBmK9yXoN2+zLNtF4rEG6XWP5gnnZKBF2s656xcRTUncIb0Q1J/j8j4LLIwocQiZQTt6kC39hzEyF4k=
X-Received: by 2002:a9d:d02:: with SMTP id 2mr1812273oti.306.1598632990636;
 Fri, 28 Aug 2020 09:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
In-Reply-To: <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Fri, 28 Aug 2020 09:43:00 -0700
Message-ID: <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000088df3a05adf2bf83"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jason Ling <jasonling@google.com>,
 Josh Lehan <krellan@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000088df3a05adf2bf83
Content-Type: text/plain; charset="UTF-8"

Hi James,

Thx for the reply! So right now, one thing is that the sensor is not
dependent on the power state of the host solely, but also dependent on the
boot progress of the host. And the more serious issue is that returning
EAGAIN from the driver freezes the sensor, which is what I'm debugging
right now. Do we have special treatment on errno returned by the driver?
Thx.

- Alex Qiu


On Fri, Aug 28, 2020 at 9:38 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 8/27/2020 2:49 PM, Alex Qiu wrote:
> > Hi James,
> >
> > After some debugging, I realized that the code I pointed out earlier
> > wasn't the root cause. Update is that, the HwmonTempSensor stops
> > updating after the hwmon driver returns EAGAIN as errno. I'll keep
> > debugging...
> >
> > - Alex Qiu
> >
> >
> > On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com
> > <mailto:xqiu@google.com>> wrote:
> >
> >     Hi James and OpenBMC community,
> >
> >     We have a sensor for HwmonTempSensor which doesn't have a valid
> >     reading until the host is fully booted. Before it's becoming alive
> >     and useful, it's getting disabled in code
> >     (
> https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266
> )
> >     because of errors thrown up by the hwmon driver. Ideally, the
> >     thermal control loop should kick the fan to fail safe mode until no
> >     more errors are observed.
> >
> >     Any suggestions on how we should handle this kind of sensor properly?
>
> For what its worth we use the PowerState property that has options of
> power on or BiosPost to disable scanning when the state is invalid:
>
> https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208
>
>
> >
> >     Thank you!
> >
> >     - Alex Qiu
> >
>

--00000000000088df3a05adf2bf83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>Thx for the reply! So right=
=C2=A0now, one thing is that the sensor is not dependent on the power state=
 of the host solely, but also dependent on the boot progress of the host. A=
nd the more serious issue is that returning EAGAIN from the driver freezes =
the sensor, which is what I&#39;m debugging right now. Do we have special t=
reatment on errno returned by the driver? Thx.</div><div><br clear=3D"all">=
<div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr">- Alex Qiu</div></div></div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug =
28, 2020 at 9:38 AM James Feist &lt;<a href=3D"mailto:james.feist@linux.int=
el.com">james.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 8/27/2020 2:49 PM, Alex Qiu wrote:<br=
>
&gt; Hi James,<br>
&gt; <br>
&gt; After some debugging, I realized that the code I pointed out earlier <=
br>
&gt; wasn&#39;t the root cause. Update is that, the HwmonTempSensor stops <=
br>
&gt; updating after the hwmon driver returns EAGAIN as errno. I&#39;ll keep=
 <br>
&gt; debugging...<br>
&gt; <br>
&gt; - Alex Qiu<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu &lt;<a href=3D"mailto:xqiu@go=
ogle.com" target=3D"_blank">xqiu@google.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:xqiu@google.com" target=3D"_blank">xqiu@g=
oogle.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi James and OpenBMC community,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We have a sensor for HwmonTempSensor which doesn&#3=
9;t have a valid<br>
&gt;=C2=A0 =C2=A0 =C2=A0reading until the host is fully booted. Before it&#=
39;s becoming alive<br>
&gt;=C2=A0 =C2=A0 =C2=A0and useful, it&#39;s getting disabled in code<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"https://github.com/openbmc/dbus-sensors=
/blob/master/include/sensor.hpp#L266" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266=
</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0because of errors thrown up by the hwmon driver. Id=
eally, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0thermal control loop should kick the fan to fail sa=
fe mode until no<br>
&gt;=C2=A0 =C2=A0 =C2=A0more=C2=A0errors are observed.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Any suggestions on how we should handle this kind o=
f sensor properly?<br>
<br>
For what its worth we use the PowerState property that has options of <br>
power on or BiosPost to disable scanning when the state is invalid: <br>
<a href=3D"https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1a=
c655f3eda785f6845f214/src/HwmonTempMain.cpp#L208" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1=
ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208</a><br>
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank you!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- Alex Qiu<br>
&gt; <br>
</blockquote></div>

--00000000000088df3a05adf2bf83--
