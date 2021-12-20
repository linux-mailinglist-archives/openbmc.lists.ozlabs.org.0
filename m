Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B547A434
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 06:11:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHSNd4hWfz307L
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 16:11:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PVKQTTdU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PVKQTTdU; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHSN96qycz2xsS
 for <openbmc@lists.ozlabs.org>; Mon, 20 Dec 2021 16:10:47 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id bm14so20550935edb.5
 for <openbmc@lists.ozlabs.org>; Sun, 19 Dec 2021 21:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMg8+vZmB/aGZZElJj5lzZwfoZJ3nYUKH4zqDGXmTws=;
 b=PVKQTTdUjm7NGiqTGiCvAR79+nNwI62LzbZ4cWId2slWpK6tvbGhxzG8auqZLYhrWU
 dLOqJSbfyd2aM+hoyCJ7ISs/f0ZaXceU8rJKPhwFJisrW4uYgkKxFbGPz0z/jnWm3NRo
 1qkSW7WiL1zfK2PCZ0R/EDacd98w7K9tQHwwzy0ZBdEUjWDmMdJhxHzZdnrUucC1VwXw
 gmxGmAH9J8PQXKyKlGk5xa9PJqktEgbB0GJzfLhNSXqCtvSrZ0XS1XI9m2XLSiRNOSoI
 +tRMVrvSYZ+/P/eTcYo9dwqg+R0cJ4Nxbz9xtywQtRwO2Vuge79u7Mw3ReagkEydEamL
 7d5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMg8+vZmB/aGZZElJj5lzZwfoZJ3nYUKH4zqDGXmTws=;
 b=J8B1nMv5lNQjKQh6uV6JqyQbC1+aARmUwqUllKubiTF5cYvGAnFR3J0isJ+nw7sOIo
 7mTIracTqaLKIxUhP/+Qsm+uCqmKQB9AM/bLzRsnUSqZA4uG4Am3RacpLfyUm867eP9v
 aAtsmmrGvVpq8EIUYyM31Hu11DldOY2wPlBSSPt733aQEOA8oBvrHyehIDGoK8Wh8y5S
 R5obFjtft7s8liHKjMsHBQeRBlZnHxSOsg6bqBbUVbF+u0UoImyOrSvDQthivYiA0OKP
 4zJlllVeV2pgcq3y0NTab4H2ezggHJZB0AlatMuC3NDRX2NUPgG2yhjXt6BPtu8xaJ9U
 433A==
X-Gm-Message-State: AOAM5315qPqHO21hy23CuF2v33/Jh7wp3/6OzZ2rZozIL1/IZ4gTEmrx
 FnqazkeOJux5SxVM8hL4OZubomn2er0en4mMOGkZ/V2y
X-Google-Smtp-Source: ABdhPJxQ1Kdep7C9AYYavpDC4klyLbYhhm9bFD7dqkaTrbEqSiChUybSTCHjpxdAEwDOru6vz0nxiPzJM/SsTNyB1G8=
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr11813474ejc.141.1639977044242; 
 Sun, 19 Dec 2021 21:10:44 -0800 (PST)
MIME-Version: 1.0
References: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
In-Reply-To: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Mon, 20 Dec 2021 10:42:43 +0530
Message-ID: <CAA7Tbct7QyLjEa3WZug=U+jVzhGqLdCeX1H+GU=KNtMnqcAXZg@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000029731b05d38ce936"
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
Cc: bruce.mitchell@linux.vnet.ibm.com, velumanit@hcl.com,
 Jayashree D <jayashree-d@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000029731b05d38ce936
Content-Type: text/plain; charset="UTF-8"

Hi All,

Gentle Reminder on this.

Thanks,
Kumar.

On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <
kumarthangavel.hcl@gmail.com> wrote:

> Hi All,
>
>
> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor.
>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab
>
>
> While testing those changes in my platform, I found that each sensor in
> hwmon temp has been creating twice.
> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is
> created twice.
>
>
> /sys/class/hwmon/hwmon2/temp2_input
> /sys/class/hwmon/hwmon2/temp1_input
>
>
> Before your change, hwmon temp sensor will check whether the path is
> already exists or not.
> If it exists, it will skip and proceed with next path.
>
> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96
>
>
> Could you please explain why it is creating twice in hwmon temp ?
>
>
> Journalctl log before your changes applied :
>
>
> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> "/sys/class/hwmon/hwmon2/temp2_input"
> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type :
> xyz.openbmc_project.Configuration.TMP421
> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP
> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
> "/sys/class/hwmon/hwmon2/temp1_input"
>
>
>
> Journalctl log after your changes applied :
>
>
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> "/sys/class/hwmon/hwmon2/temp2_input"
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> xyz.openbmc_project.Configuration.TMP421
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>
>
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> "/sys/class/hwmon/hwmon2/temp1_input"
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
> xyz.openbmc_project.Configuration.TMP421
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
> /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>
>
>
> Thanks,
>
> Kumar.
>

--00000000000029731b05d38ce936
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><div><br></div><div>Gentle Reminder on this.</d=
iv><div><br></div><div>Thanks,</div><div>Kumar.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021=
 at 1:56 PM Kumar Thangavel &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.=
com">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><p style=3D"box-sizing:bo=
rder-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,sy=
stem-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif=
;font-size:14px;font-style:inherit;font-weight:inherit">Hi All,</p><p style=
=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;=
Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit"><b=
r>In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor.<b=
r style=3D"box-sizing:border-box"><a aria-label=3D"Link https://github.com/=
openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-b=
fc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab" title=3D"h=
ttps://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0=
fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b=
22b7ab" href=3D"https://github.com/openbmc/dbus-sensors/commit/544e7dc58cec=
ef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a=
26f410c1568e5341b22b7ab" rel=3D"noopener noreferrer" style=3D"box-sizing:bo=
rder-box;background-color:transparent;outline-style:none;color:rgb(98,100,1=
67);text-decoration-line:none" target=3D"_blank">https://github.com/openbmc=
/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed=
4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab</a></p><p style=3D=
"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Seg=
oe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&qu=
ot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit"><br s=
tyle=3D"box-sizing:border-box"></p><p style=3D"box-sizing:border-box;margin=
:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px=
;font-style:inherit;font-weight:inherit">While testing those changes in my =
platform, I found that each sensor in hwmon temp has been creating twice.<b=
r style=3D"box-sizing:border-box">After analyzed the patch, for below 2 pat=
hs SP_OUTLET_TEMP sensor is created twice.</p><p style=3D"box-sizing:border=
-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system=
-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;fon=
t-size:14px;font-style:inherit;font-weight:inherit"><br style=3D"box-sizing=
:border-box"></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,=
36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&q=
uot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inheri=
t;font-weight:inherit">/sys/class/hwmon/hwmon2/temp2_input<br style=3D"box-=
sizing:border-box">/sys/class/hwmon/hwmon2/temp1_input</p><p style=3D"box-s=
izing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&=
quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sa=
ns-serif;font-size:14px;font-style:inherit;font-weight:inherit"><br style=
=3D"box-sizing:border-box"></p><p style=3D"box-sizing:border-box;margin:0px=
;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;fon=
t-style:inherit;font-weight:inherit">Before your change, hwmon temp sensor =
will check whether the path is already exists or not.<br style=3D"box-sizin=
g:border-box">If it exists, it will skip and proceed with next path.<br sty=
le=3D"box-sizing:border-box"><a aria-label=3D"Link https://github.com/openb=
mc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7=
ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96" title=3D"htt=
ps://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fb=
ce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22=
b7abl96" href=3D"https://github.com/openbmc/dbus-sensors/commit/544e7dc58ce=
cef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8=
a26f410c1568e5341b22b7abL96" rel=3D"noopener noreferrer" style=3D"box-sizin=
g:border-box;background-color:transparent;outline-style:none;color:rgb(98,1=
00,167);text-decoration-line:none" target=3D"_blank">https://github.com/ope=
nbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8=
d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96</a></p><p s=
tyle=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&q=
uot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit=
"><br style=3D"box-sizing:border-box"></p><p style=3D"box-sizing:border-box=
;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-si=
ze:14px;font-style:inherit;font-weight:inherit">Could you please explain wh=
y it is creating twice in hwmon temp ?</p><p style=3D"box-sizing:border-box=
;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-si=
ze:14px;font-style:inherit;font-weight:inherit"><br style=3D"box-sizing:bor=
der-box"></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,3=
6);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;fo=
nt-weight:inherit">Journalctl log before your changes applied :</p><p style=
=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;=
Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit"><b=
r style=3D"box-sizing:border-box"></p><p style=3D"box-sizing:border-box;mar=
gin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quo=
t;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:1=
4px;font-style:inherit;font-weight:inherit">Dec 31 16:01:32 yosemitev2 hwmo=
ntempsensor[286]: Path : &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br=
 style=3D"box-sizing:border-box">Dec 31 16:01:32 yosemitev2 hwmontempsensor=
[286]: Type : xyz.openbmc_project.Configuration.TMP421<br style=3D"box-sizi=
ng:border-box">Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_O=
UTLET_TEMP<br style=3D"box-sizing:border-box">Dec 31 16:01:32 yosemitev2 hw=
montempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP=
_OUTLET_TEMP<br style=3D"box-sizing:border-box">Dec 31 16:01:32 yosemitev2 =
hwmontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/=
SP_OUTLET_REMOTE_TEMP<br style=3D"box-sizing:border-box">Dec 31 16:01:32 yo=
semitev2 hwmontempsensor[286]: Path : &quot;/sys/class/hwmon/hwmon2/temp1_i=
nput&quot;</p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,=
36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot=
;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;f=
ont-weight:inherit"><br style=3D"box-sizing:border-box"></p><p style=3D"box=
-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe U=
I&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,=
sans-serif;font-size:14px;font-style:inherit;font-weight:inherit"><br style=
=3D"box-sizing:border-box"></p><p style=3D"box-sizing:border-box;margin:0px=
;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;fon=
t-style:inherit;font-weight:inherit">Journalctl log after your changes appl=
ied :</p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);f=
ont-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-w=
eight:inherit"><br style=3D"box-sizing:border-box"></p><p style=3D"box-sizi=
ng:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quo=
t;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-=
serif;font-size:14px;font-style:inherit;font-weight:inherit">Dec 31 16:01:5=
4 yosemitev2 hwmontempsensor[327]: Path : &quot;/sys/class/hwmon/hwmon2/tem=
p2_input&quot;<br style=3D"box-sizing:border-box">Dec 31 16:01:54 yosemitev=
2 hwmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP=
421<br style=3D"box-sizing:border-box">Dec 31 16:01:54 yosemitev2 hwmontemp=
sensor[327]: Name : SP_OUTLET_TEMP<br style=3D"box-sizing:border-box">Dec 3=
1 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sen=
sors/temperature/SP_OUTLET_TEMP<br style=3D"box-sizing:border-box">Dec 31 1=
6:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensor=
s/temperature/SP_OUTLET_REMOTE_TEMP</p><p style=3D"box-sizing:border-box;ma=
rgin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:=
14px;font-style:inherit;font-weight:inherit"><br style=3D"box-sizing:border=
-box"></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);=
font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-=
weight:inherit">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : &qu=
ot;/sys/class/hwmon/hwmon2/temp1_input&quot;<br style=3D"box-sizing:border-=
box">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.ope=
nbmc_project.Configuration.TMP421<br style=3D"box-sizing:border-box">Dec 31=
 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP<br style=
=3D"box-sizing:border-box">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]:=
 Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br style=3D=
"box-sizing:border-box">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Pa=
th : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP</p><p s=
tyle=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&q=
uot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit=
"><br></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);=
font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-=
weight:inherit"><br></p><p style=3D"box-sizing:border-box;margin:0px;color:=
rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color =
Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style=
:inherit;font-weight:inherit">Thanks,</p><p style=3D"box-sizing:border-box;=
margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&=
quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-siz=
e:14px;font-style:inherit;font-weight:inherit">Kumar.</p></div>
</blockquote></div>

--00000000000029731b05d38ce936--
