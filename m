Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D1CB33C
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 04:13:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kthb1cgxzDqcH
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 12:13:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=krellan@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Dl4RQcz9"; 
 dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ktgy6mgHzDqGk
 for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2019 12:12:54 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id u3so3277910lfl.10
 for <openbmc@lists.ozlabs.org>; Thu, 03 Oct 2019 19:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xp8qo/EUSZS/hd4qD4Vw2cIt/7n23fkJsg5PjqDaE5E=;
 b=Dl4RQcz9Iyocdkc/h6PMJdOHFSeGQA3XiAUM/tqIfLm9KJp6Q1/LZpMuZVZ1fNIKCS
 FVzpkBVOd0W8OK1Vsx4EfT8REjVzBgnnt2mnQet2K/mh+WBb5IVdVIjoWbZtI2s01/tl
 On7m2xytF4YdKSQ/1fr6Q/9Oa/qItyUPw9/d2XNBSFLjs+5BPGyTQDFZsmvhqemGn9aK
 L3xdnVWkiuTVT+dVJS0tmL7HZHk30hlIv1B69xECPbXD3MIHeC3Grl4cwKq3RIFIJRFZ
 yl6sg1lL45se6hedbTAzil1g2ozXftgDvPcffxi82h9HzUUACav/2W6EfQd7fNZc02L1
 83rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xp8qo/EUSZS/hd4qD4Vw2cIt/7n23fkJsg5PjqDaE5E=;
 b=JkiZv+miCbGAIpOIcltoBOR+5MoXkhsniMWl0dnOjBbg/Hbc4sW8DUpB7/5iKJwcQp
 X7p9xpIp71LXcVmEVxIRB/6queU3NfFhecoSFEFVpoFcG2xZkJRgj05ciFHbFSRCORY6
 F0/WZT5TEu17j3NDrSOF2+doa7HadFr8cr5y/w1T9WpmUjYmtH4+AydmRjskdYOlQVUj
 LFShubPAKonPdhy4y3xU0BzKRvl+zHsI0KfvoWJTNyKmE9XGYd1PzXsPMEd+v+hHyaEf
 3cpufO1ZTL0KPpSiC7o91XJt8ZQartNuvn1p4qMvhWSoH5L8M3MwTcz1GFvgU6ydMZF5
 BTfg==
X-Gm-Message-State: APjAAAUbTre1gkY3oOWctWdWJB0yvKZAxULmn2UIVDXtQZDZ0j52/xEe
 M8AufwFd/HkHDPGLIK/rEUqvaKNqMYrjf8HrKemUpA==
X-Google-Smtp-Source: APXvYqxiZzmJH8mhu0Nmv+ZlX+fv016Jm58x3A8RRlJmkfZCPVFJY58opQHCtDG4rDMWmeXZIoZeNsxnE46OuIMGqps=
X-Received: by 2002:ac2:5451:: with SMTP id d17mr7278675lfn.77.1570155170152; 
 Thu, 03 Oct 2019 19:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzNuQDWtXG9CCLd9qEvqhcsDa2V=6a4KogjkwCC2RZtwA@mail.gmail.com>
In-Reply-To: <CAO=notzNuQDWtXG9CCLd9qEvqhcsDa2V=6a4KogjkwCC2RZtwA@mail.gmail.com>
From: Josh Lehan <krellan@google.com>
Date: Thu, 3 Oct 2019 19:12:39 -0700
Message-ID: <CANPkJS-UOXmBC8d9Le27OPBiBdPL589uHpmVF7KUbLTzduFhfA@mail.gmail.com>
Subject: Re: Gain,Offset with dbus-sensors values
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="00000000000029105805940c3dbb"
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000029105805940c3dbb
Content-Type: text/plain; charset="UTF-8"

Thanks for asking this. In particular, in PSUsensor it seems there is only
an ability to customize the scaling factor for an entire category of
sensors at once: InScaleFactor, CurrScaleFactor, PowerScaleFactor,
TempScaleFactor, and so on.

https://github.com/openbmc/dbus-sensors/blob/2adc95cb4d9ac879f66aa9ef12a6ce8b7c1578fe/src/PSUSensorMain.cpp#L408

Ideally, there would be a way to customize the scaling factor on a
per-sensor basis, for example to customize the scaling of Vout without also
affecting Vin.

Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941



On Thu, Oct 3, 2019 at 5:03 PM Patrick Venture <venture@google.com> wrote:

> James;
>
> We have some sensors that need a gain and offset value set in the json
> file, for PSU sensors, but only vout/vin or some specific ones, and
> not applied to all sensors.
>
> Akin to:
> https://github.com/openbmc/phosphor-hwmon/blob/2227bd52c5bb8d62dcfe33b58d65515d21e9be17/sensor.cpp#L59
>
> Also, is there a way to customize the very verbose suffixes PSUsensor
> applies
> such as "Temperature" and "Output_Power".  With IPMI we're only
> granted 16 characters for the name and ipmid uses the last part of the
> dbus path for the name.
>
> Perhaps ipmid should allow overriding the name value.
>
> Patrick
>

--00000000000029105805940c3dbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for asking this. In particular, in PSUsensor it see=
ms there is only an ability to customize the scaling factor for an entire c=
ategory of sensors at once: InScaleFactor, CurrScaleFactor, PowerScaleFacto=
r, TempScaleFactor, and so on.<div><br></div><div><a href=3D"https://github=
.com/openbmc/dbus-sensors/blob/2adc95cb4d9ac879f66aa9ef12a6ce8b7c1578fe/src=
/PSUSensorMain.cpp#L408">https://github.com/openbmc/dbus-sensors/blob/2adc9=
5cb4d9ac879f66aa9ef12a6ce8b7c1578fe/src/PSUSensorMain.cpp#L408</a><br></div=
><div><br></div><div>Ideally, there would be a way to customize the scaling=
 factor on a per-sensor basis, for example to customize the scaling of Vout=
 without also affecting Vin.</div><div><br></div><div>Josh</div><div><br cl=
ear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"l=
ine-height:1.5em;padding-top:10px;margin-top:10px;color:rgb(85,85,85);font-=
family:sans-serif"><span style=3D"border-width:2px 0px 0px;border-style:sol=
id;border-color:rgb(213,15,37);padding-top:2px;margin-top:2px">Josh Lehan=
=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;bo=
rder-color:rgb(51,105,232);padding-top:2px;margin-top:2px">=C2=A0Software E=
ngineer=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:s=
olid;border-color:rgb(0,153,57);padding-top:2px;margin-top:2px">=C2=A0<a hr=
ef=3D"mailto:krellan@google.com" target=3D"_blank">krellan@google.com</a>=
=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;bo=
rder-color:rgb(238,178,17);padding-top:2px;margin-top:2px">=C2=A0+1 650-733=
-8941</span></div><br></div></div></div></div></div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 3=
, 2019 at 5:03 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
>venture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">James;<br>
<br>
We have some sensors that need a gain and offset value set in the json<br>
file, for PSU sensors, but only vout/vin or some specific ones, and<br>
not applied to all sensors.<br>
<br>
Akin to: <a href=3D"https://github.com/openbmc/phosphor-hwmon/blob/2227bd52=
c5bb8d62dcfe33b58d65515d21e9be17/sensor.cpp#L59" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/openbmc/phosphor-hwmon/blob/2227bd52c5bb8d62=
dcfe33b58d65515d21e9be17/sensor.cpp#L59</a><br>
<br>
Also, is there a way to customize the very verbose suffixes PSUsensor appli=
es<br>
such as &quot;Temperature&quot; and &quot;Output_Power&quot;.=C2=A0 With IP=
MI we&#39;re only<br>
granted 16 characters for the name and ipmid uses the last part of the<br>
dbus path for the name.<br>
<br>
Perhaps ipmid should allow overriding the name value.<br>
<br>
Patrick<br>
</blockquote></div>

--00000000000029105805940c3dbb--
