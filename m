Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A190F3EDA49
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 17:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpJgK3pWTz3bWy
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 01:56:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qoKFFpsE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qoKFFpsE; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpJfw2Y0Yz2yRS
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 01:56:07 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id b15so32588927ejg.10
 for <openbmc@lists.ozlabs.org>; Mon, 16 Aug 2021 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=039DumGXtdpO4nwZvr5T9gFGt8vBfKZ+LMUnhTCly0k=;
 b=qoKFFpsEnbdtlwKmeS5xp3+Rt84gowO8QmYUIuEL9Ms7UpbMiJjT+ajGfilnokORzw
 zbN0LM8bkGak9wcRStMIHmWpmFySpgdtuoQ+lEBVpSXbxce8gDbEY8slnp/7806V4nM7
 3lDl+6TD92jO7DoEi4e3/aktFE8qCGoPwhqFO7takq1dFMqOm87MviN9hhjlQxAxi6uR
 smdpDtbmHMmbBZdc4OKJjjiPbpxJZ5PgsKYCmPC7gvOYZK/lZ/FF7nSXXQe5qXDAzZtv
 jn1bSFXVNK7vATRRyHjwzcjzdWlN65C21Mz9I1IrBgVTuyHaNwan9lfNbRZq1NYoFBef
 VPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=039DumGXtdpO4nwZvr5T9gFGt8vBfKZ+LMUnhTCly0k=;
 b=VOTG/DUAho48F8OnW9wKggDq30HankwWsmXTYW8rwZQdqYjQi1YcwM0LEhbpYPj8zl
 DQRkr1qKy4aD1pDlqQZ2H/8yPSaMrukgwUQYQaAQLxXrSlLZzV0rgh/GOsiUovyvcVSA
 KuKj+kfuKpOY3uQEfUl+iIvIWtkZgOwJ/vKt/RgpByYpxCHF5ztPmao/H2BqEIz0FBGv
 FNEyDpTHtnaqa6i2htyrryh6b2SK8Lsm11MTCSgdvWGkuXh2LUp1UvzEI+y0z8BfMuym
 oT2REf8Bqj9v1aGLu5tLYSj3o82qcxc2hlGr550KRbEjC8SkYqORGnbktJhl/cC50exz
 +XdA==
X-Gm-Message-State: AOAM533Wn2Q9f+HhSSBkGx72vIGOn+H6EvpSPuLEyUsfTu81h2LzZHoM
 7hnsP1B75O/TH9fkQqqfICSyse+oFuK2Vgwi9S6THZng
X-Google-Smtp-Source: ABdhPJy2zxPMcukcPF3q+LBxzqFdKBsGwGOfpWo2ZIC5rqVy/KS/XMVIsjtOiErdh0esjV/t9WHedmQOMaS8LZF9Rg4=
X-Received: by 2002:a17:906:491a:: with SMTP id
 b26mr16897601ejq.25.1629129361129; 
 Mon, 16 Aug 2021 08:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7TbcveKrAFSODfKKJ_q1yaPEZgvn06mBO2tXe7h=Xr6jZHLw@mail.gmail.com>
In-Reply-To: <CAA7TbcveKrAFSODfKKJ_q1yaPEZgvn06mBO2tXe7h=Xr6jZHLw@mail.gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Mon, 16 Aug 2021 21:27:58 +0530
Message-ID: <CAA7TbcsaM_nFeA1q=Eq6zsW1gH_73HXSCmtsc=3O0hi2s8QGfA@mail.gmail.com>
Subject: Re: Creating Hard Shutdown interfaces/alarm for NIC Sensor
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000dd01dc05c9af3c50"
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ed Tanous <ed@tanous.net>, Jayashree D <jayashree-d@hcl.com>,
 Amithash Prasad <amithash@fb.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000dd01dc05c9af3c50
Content-Type: text/plain; charset="UTF-8"

Hi All,

        Gentle Reminder.  Any suggestions/idea on this.

Thanks,
Kumar

On Wed, Aug 11, 2021 at 4:51 PM Kumar Thangavel <
kumarthangavel.hcl@gmail.com> wrote:

> Hi All,
>
>
>
>          We have an use case of NIC sensor value goes above 120 (upper non
> recoverable), need to shutdown the slots.
>
>
>
>          Critical and Warning interfaces and alarm created based on the
> sensor threshold Severity value. Please refer the below code.
>
>
> https://github.com/openbmc/dbus-sensors/blob/master/src/Thresholds.cpp#L116
>
>
>
>          For NIC sensor, planning to create soft and hard shutdown
> interfaces and alarm based on severity value in hwmonTempSensor.
>
>
>
>          Already we have Severity 0  for Warning and Severity 1 for
> Critical.
>
>          We can have Severity 2 for Softshutdown and Severity 3 for
> Hardshutdown.
>
>
>
>          So, Based on the Severity value, the soft and hard shutdown alarm
> will set as true.
>
>          Then the sensor-monitor application would take the action based
> on the soft/hard shutdown alarm.
>
>
>          Could you please provide your suggestions on this.
>
>
>
> Thanks,
>
> Kumar.
>

--000000000000dd01dc05c9af3c50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Gen=
tle Reminder.=C2=A0 Any suggestions/idea on this.</div><div><br></div><div>=
Thanks,</div><div>Kumar</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Aug 11, 2021 at 4:51 PM Kumar Thangav=
el &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com">kumarthangavel.hcl@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0=
001pt;font-size:11pt;font-family:Calibri,sans-serif">Hi All,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 We have an
use case of NIC sensor value goes above 120 (upper non recoverable), need t=
o shutdown
the slots.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Critical and
Warning interfaces and alarm created based on the sensor threshold Severity
value. Please refer the below code.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a href=3D"https://github.com/openbmc/dbus-sensors/blob/master/src/Thre=
sholds.cpp#L116" style=3D"color:rgb(5,99,193)" target=3D"_blank">https://gi=
thub.com/openbmc/dbus-sensors/blob/master/src/Thresholds.cpp#L116</a></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 For NIC sensor,
planning to create soft and hard shutdown interfaces and alarm based on sev=
erity
value in hwmonTempSensor.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0 </p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Already we
have Severity 0 =C2=A0for Warning and Severity
1 for Critical. </p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 We can have
Severity 2 for Softshutdown and Severity 3 for Hardshutdown.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 So, Based on
the Severity value, the soft and hard shutdown alarm will set as true. </p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Then the
sensor-monitor application would take the action based on the soft/hard
shutdown alarm. </p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt=
;font-size:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"MsoNorm=
al" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,san=
s-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Could you please provide your su=
ggestions on this.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Thanks,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Kumar.</p></div>
</blockquote></div>

--000000000000dd01dc05c9af3c50--
