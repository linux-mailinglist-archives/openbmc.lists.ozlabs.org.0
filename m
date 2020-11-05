Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51B2A7E9B
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 13:32:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRjZj0ZtvzDqkR
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 23:32:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rNtg3kZH; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRjXV12DFzDqbv
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 23:30:16 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id gi3so190pjb.3
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 04:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=562u5Xj3SYLUPFZ+Pr4/51QlV5fd+Qkj8+L12mMMa9k=;
 b=rNtg3kZHFTx3FwOB8s4MGpx8xD2Xp6CiAXxc0vyARefs6o5OY7Psr2mWKPP6Uhsxc2
 7Y5HxnwNHLyig+1/vau27PiGpgZPQLu7ZlYXkfDlWU9QOTWFzYe8PHdLNsUgX9KDrDdd
 3sX1iOjoPp93TMthRqT1j08kXgWHIbmZFiFeCQnm++h41QXghiylneie+K4jNigbX7pd
 ouA+F2g0pForG+yR2Sh/HyMbP67J5QifCCBcF4x1A2DpiZ0NbBajOEHfg3z9pQwe2LjR
 CFR8fX/5yeHreSwsbvKVHyD0OZrNYuweVXGfRsdTII3tMWC77nyItdabMPg5CATFvTTF
 nDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=562u5Xj3SYLUPFZ+Pr4/51QlV5fd+Qkj8+L12mMMa9k=;
 b=sdgYkTLEAzKrW04fCs3keCpLUydKoKam97QIcNciWVsIgx5UVin0lALg5wkeLZn7UC
 w+1cGV/CEQAHrvaBzCsQvcoEtJQwxzBgc0OE+mSHk6uJPt0lyMBxmlu9ee5cO33U+d5E
 JL6RgmPJEb2PiRzWnryHqEho/StBC1Tk5gCxE/AFiVUq4H7wdOhbetjvOjvh4G06dhwe
 0al+L3JVwmN+yymG+bkIgurXuLTkMscNWZqBGnFQcfH6u1Y/4pHtmm7IQ52lrqiWXqWE
 GoDtpjGYEK7j/+ggBf+SHJWCeM/zFoiTvDbNiw06v2lmxKesk364a4hfpKpnW19kgBjE
 Ws6A==
X-Gm-Message-State: AOAM530R3oRXmYCdCbfxQ++bAd8rtW/7UeK17/Rms1L1QrH+aq0Ji9dr
 w8ggYTKVfUvKr7wGgdY3TGPBXTqEC1Jsrs6wANI=
X-Google-Smtp-Source: ABdhPJxfOhEMaqHLYepgt7ieXLhOaTZFP1tP3bTvICgi7RoPhhe0pkQmmnRSUQ4/bxT3kwUuN9DkufOX/waElYHpocY=
X-Received: by 2002:a17:90a:6301:: with SMTP id
 e1mr2221824pjj.131.1604579412582; 
 Thu, 05 Nov 2020 04:30:12 -0800 (PST)
MIME-Version: 1.0
References: <CAD+gp9B6Y8-hCP+hzT3Bh8xkg-mcFj_EnQ-FDz6Ax_tqAtJnnw@mail.gmail.com>
 <405411604558303@mail.yandex-team.ru>
In-Reply-To: <405411604558303@mail.yandex-team.ru>
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Thu, 5 Nov 2020 18:00:01 +0530
Message-ID: <CAD+gp9Dm_u=z=SqdsJb1OTCx26xA5h=26URUpOMe+Scq23H4cQ@mail.gmail.com>
Subject: Re: Error:"Failed to find the pwm0_gpio40 line"
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Content-Type: multipart/alternative; boundary="000000000000e6a5d905b35b41c4"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e6a5d905b35b41c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks alot Konstantin for the information.

We wanted to verify if the Chassis info is populated properly,
(redfish/v1/Chassis).We need to get the Chassis info and we are using curl
command on path, /redfidh/v1/Chassis.But no information is being populated.

Is there any way to verify chassis information ?

We have used the x86-power-control to populate the /redfish/v1/chassis, but
we no luck with this too. We did not see any data through this .

Any suggestions or input on this would be appreciated.

Thanks & Regards,
Khader B Shaik



On Thu, 5 Nov 2020 at 12:14, Konstantin Klubnichkin <kitsok@yandex-team.ru>
wrote:

> - =D0=B2=D1=81=D0=B5
>
> Hello!
>
> This error means GPIO library unable to find line with this name.
> To check you can
> cat /sys/kernel/debug/gpio | grep pwm0_gpio40
> or
> gpioinfo | grep pwm0_gpio40
>
> The most probably cause is missing line name in DTS.
> There must be something like this:
> &gpio {
> status =3D "okay";
> pinctrl-names =3D "pass-through";
> pinctrl-0 =3D <&pinctrl_gpid0_default
> &pinctrl_gpid2_default>;
> gpio-line-names =3D
> /* A0-A7 */ "A0", "A1", "A2", "A3", "A4", "A5", "A6", "A7",
> /* B0-B7 */ "B0", "B1", "B2", "POST_COMPLETE", "B4", "B5", "PS_PWROK",
> "B7",
> ................
> };
>
> I don't have PI on hands so my example is for AST2500 SoC, but as far as =
I
> remember there are many guides how to patch DTS for Raspberry.
>
> 05.11.2020, 09:03, "khader basha shaik" <shaikkhaderbasha601@gmail.com>:
>
> Hi Team,
>
> we are trying to control our board with RPI bmc.we are trying to control
> power on, off and reset
>
> we compiled x86-power-control with openbmc and create a patch for the san=
e
> with the GPIO name "pwm0_gpio40". and when we are try to use this.
> we are facing the below error.
>
> root@akky:~# systemctl status
> xyz.openbmc_project.Chassis.Control.Power.service
> =E2=97=8F xyz.openbmc_project.Chassis.Control.Power.service - Power Contr=
ol
> Loaded: loaded
> (/lib/systemd/system/xyz.openbmc_project.Chassis.Control.Power.service;
> enabled; vendor preset: enabled)
> Active: failed (Result: exit-code) since Thu 1970-01-01 00:00:13 UTC; 33s
> ago
> Process: 310 ExecStart=3D/usr/bin/power-control (code=3Dexited,
> status=3D255/EXCEPTION)
> Main PID: 310 (code=3Dexited, status=3D255/EXCEPTION)
>
> Jan 01 00:00:13 akky systemd[1]:
> xyz.openbmc_project.Chassis.Control.Power.service: Scheduled restart job,
> restart counter is at 2.
> Jan 01 00:00:13 akky systemd[1]: Stopped Power Control.
> Jan 01 00:00:13 akky systemd[1]:
> xyz.openbmc_project.Chassis.Control.Power.service: Start request repeated
> too quickly.
> Jan 01 00:00:13 akky systemd[1]:
> xyz.openbmc_project.Chassis.Control.Power.service: Failed with result
> 'exit-code'.
> Jan 01 00:00:13 akky systemd[1]: Failed to start Power Control.
> root@akky:~# /usr/bin/power-control -h
> Start Chassis power control service...
> Failed to find the pwm0_gpio40 line
>
> Could someone help me how to fix this or some pointers regarding this
> error.
>
> Also is physcial connection between the bmc and the server is needed or w=
e
> can test this through someother way.
>
> Thanks & Regards,
> Khader B Shaik
>
>
>
>
> --
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
>
>

--000000000000e6a5d905b35b41c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks alot Konstantin for the information.<div><br></div>=
<div><div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;,s=
ystem-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-seri=
f;font-size:14px">We wanted to verify if the Chassis info is populated prop=
erly, (redfish/v1/Chassis).We need to get the Chassis info and we are using=
 curl command on path, /redfidh/v1/Chassis.But no information is being popu=
lated.=C2=A0</div><div style=3D"box-sizing:border-box;font-family:&quot;Seg=
oe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&qu=
ot;,sans-serif;font-size:14px"><br></div><div style=3D"box-sizing:border-bo=
x;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,=
&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px">Is there any way to v=
erify chassis information ?</div></div><div style=3D"box-sizing:border-box;=
font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,sans-serif;font-size:14px"><br></div><div style=3D=
"box-sizing:border-box;font-family:&quot;Segoe UI&quot;,system-ui,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px">=
We have used the  x86-power-control to populate the /redfish/v1/chassis, bu=
t we no luck with this too. We did not see any data through this .</div><di=
v style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;,system-ui=
,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-s=
ize:14px"><br></div><div style=3D"box-sizing:border-box;font-family:&quot;S=
egoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&=
quot;,sans-serif;font-size:14px">Any suggestions or input on this would be =
appreciated.</div><div style=3D"box-sizing:border-box;font-family:&quot;Seg=
oe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&qu=
ot;,sans-serif;font-size:14px"><br></div><div style=3D"box-sizing:border-bo=
x;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,=
&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px">Thanks &amp;=C2=A0Reg=
ards,</div><div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&q=
uot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,san=
s-serif;font-size:14px">Khader B Shaik</div><div style=3D"box-sizing:border=
-box;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quo=
t;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px"><br></div><div sty=
le=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;,system-ui,&quo=
t;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:1=
4px"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 5 Nov 2020 at 12:14, Konstantin Klubnichkin &lt;<a =
href=3D"mailto:kitsok@yandex-team.ru">kitsok@yandex-team.ru</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>- =D0=B2=D1=
=81=D0=B5</div><div>=C2=A0</div><div>Hello!</div><div>=C2=A0</div><div>This=
 error means GPIO library unable to find line with this name.</div><div>To =
check you can</div><div>cat /sys/kernel/debug/gpio | grep pwm0_gpio40</div>=
<div>or</div><div>gpioinfo | grep pwm0_gpio40</div><div>=C2=A0</div><div>Th=
e most probably cause is missing line name in DTS.</div><div>There must be =
something like this:</div><div><div>&amp;gpio {</div><div>status =3D &quot;=
okay&quot;;</div><div>pinctrl-names =3D &quot;pass-through&quot;;</div><div=
>pinctrl-0 =3D &lt;&amp;pinctrl_gpid0_default</div><div>&amp;pinctrl_gpid2_=
default&gt;;</div><div>gpio-line-names =3D</div><div>/* A0-A7 */ &quot;A0&q=
uot;, &quot;A1&quot;, &quot;A2&quot;, &quot;A3&quot;, &quot;A4&quot;, &quot=
;A5&quot;, &quot;A6&quot;, &quot;A7&quot;,</div><div>/* B0-B7 */ &quot;B0&q=
uot;, &quot;B1&quot;, &quot;B2&quot;, &quot;POST_COMPLETE&quot;, &quot;B4&q=
uot;, &quot;B5&quot;, &quot;PS_PWROK&quot;, &quot;B7&quot;,</div><div>.....=
...........</div><div>};</div></div><div>=C2=A0</div><div>I don&#39;t have =
PI on hands so my example is for AST2500 SoC, but as far as I remember ther=
e are many guides how to patch DTS for Raspberry.</div><div>=C2=A0</div><di=
v>05.11.2020, 09:03, &quot;khader basha shaik&quot; &lt;<a href=3D"mailto:s=
haikkhaderbasha601@gmail.com" target=3D"_blank">shaikkhaderbasha601@gmail.c=
om</a>&gt;:</div><blockquote><div>Hi=C2=A0Team,<div>=C2=A0</div><div><div s=
tyle=3D"box-sizing:border-box;font-family:&quot;segoe ui&quot;,system-ui,&q=
uot;apple color emoji&quot;,&quot;segoe ui emoji&quot;,sans-serif;font-size=
:14px">we are trying to control our board with RPI bmc.we are trying to con=
trol power on, off and reset=C2=A0</div></div><div style=3D"box-sizing:bord=
er-box;font-family:&quot;segoe ui&quot;,system-ui,&quot;apple color emoji&q=
uot;,&quot;segoe ui emoji&quot;,sans-serif;font-size:14px">=C2=A0</div><div=
 style=3D"box-sizing:border-box;font-family:&quot;segoe ui&quot;,system-ui,=
&quot;apple color emoji&quot;,&quot;segoe ui emoji&quot;,sans-serif;font-si=
ze:14px"><div style=3D"box-sizing:border-box">we compiled x86-power-control=
 with openbmc and create a patch for the sane with the GPIO name &quot;pwm0=
_gpio40&quot;. and when we are try to use this.</div><div style=3D"box-sizi=
ng:border-box">we are facing the below error.</div><div style=3D"box-sizing=
:border-box">=C2=A0</div><div style=3D"box-sizing:border-box"><div style=3D=
"box-sizing:border-box"><div><a href=3D"mailto:root@akky" rel=3D"noopener n=
oreferrer" target=3D"_blank">root@akky</a>:~# systemctl status xyz.openbmc_=
project.Chassis.Control.Power.service<br>=E2=97=8F xyz.openbmc_project.Chas=
sis.Control.Power.service - Power Control<br>Loaded: loaded (/lib/systemd/s=
ystem/xyz.openbmc_project.Chassis.Control.Power.service; enabled; vendor pr=
eset: enabled)<br>Active: failed (Result: exit-code) since Thu 1970-01-01 0=
0:00:13 UTC; 33s ago<br>Process: 310 ExecStart=3D/usr/bin/power-control (co=
de=3Dexited, status=3D255/EXCEPTION)<br>Main PID: 310 (code=3Dexited, statu=
s=3D255/EXCEPTION)</div><div><div>=C2=A0</div><div><div>Jan 01 00:00:13 akk=
y systemd[1]: xyz.openbmc_project.Chassis.Control.Power.service: Scheduled =
restart job, restart counter is at 2.<br>Jan 01 00:00:13 akky systemd[1]: S=
topped Power Control.<br>Jan 01 00:00:13 akky systemd[1]: xyz.openbmc_proje=
ct.Chassis.Control.Power.service: Start request repeated too quickly.<br>Ja=
n 01 00:00:13 akky systemd[1]: xyz.openbmc_project.Chassis.Control.Power.se=
rvice: Failed with result &#39;exit-code&#39;.<br>Jan 01 00:00:13 akky syst=
emd[1]: Failed to start Power Control.<br><a href=3D"mailto:root@akky" rel=
=3D"noopener noreferrer" target=3D"_blank">root@akky</a>:~# /usr/bin/power-=
control -h<br>Start Chassis power control service...<br>Failed to find the =
pwm0_gpio40 line</div></div></div><div>=C2=A0</div><div>Could someone help =
me how to fix this or some pointers regarding this error.</div><div>=C2=A0<=
/div><div>Also is physcial=C2=A0connection between the bmc and the server i=
s needed or we can test this through someother=C2=A0way.</div><div>=C2=A0</=
div><div>Thanks &amp; Regards,</div><div>Khader B Shaik</div><div>=C2=A0</d=
iv></div></div></div></div></blockquote><div>=C2=A0</div><div>=C2=A0</div><=
div>--=C2=A0</div><div>Best regards,</div><div>Konstantin Klubnichkin,</div=
><div>lead firmware engineer,</div><div>server hardware R&amp;D group,</div=
><div>Yandex Moscow office.</div><div>tel: +7-903-510-33-33</div><div>=C2=
=A0</div></blockquote></div>

--000000000000e6a5d905b35b41c4--
