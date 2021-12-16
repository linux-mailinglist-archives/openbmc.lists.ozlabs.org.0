Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92210476BDA
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 09:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4vp3bhLz3cWR
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 19:26:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GcJgUqn8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GcJgUqn8; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF4sr1JJnz3fg5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 19:24:47 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id g14so83072464edb.8
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 00:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pkG+giCLMJYvVea+cG1TCfdH2ZZGyapo5oQdYqvB1gk=;
 b=GcJgUqn8PgKpXtgar91QhrTMO1nKFhKLtp06SEwkuvph1LWHz7R0ogx4v5E69dwUAp
 Ap6pdLeSj+Ww8Yi9VAP0F8GPIHhvKXT/Ec2Rg2EcSyiHKDeNIBHTReznRxbgLUhhTAv+
 j13GyJ89Tnn2eO6qGQQoaRb49Up5ezLkL+uDXRpJiYPQhKOLjTHQFERCsei9mzPZe7fb
 NEyKfbU2pQNjEA33lZNooFkGphZV4d+CESnrRLTH5e/s3AjprwLnYR9QIm96RiSVjHWV
 9tnXUWTKdMoLkhjAkmWMwlnmvkqvc6m22TZAlY2s8Fxe5n95y0FCeXBOkTGeUpRh1VWc
 z0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pkG+giCLMJYvVea+cG1TCfdH2ZZGyapo5oQdYqvB1gk=;
 b=KPv6itTj2oGTzHPwbfEC72HsXj9H4fWFBqF18Nr4SZSgejw0a2UhVDvWVUbNvoaoL1
 McJEmflbOO+LdEnVd624q4SLKfLLx8+00mjrTkRxw6yVLewzktmh9lZk6yUBKyBbzt0I
 cSDK4MruECS/2bYevLh5zmVLJrJwAKQYIdQKLGrcaGJvgzYSmEYA7QKGBNReaE1SSR4N
 p007eI4T/TA+YUzvrOr94SKlp9LK208dG7sLxJF2mhQn5Tmcey0Sgcv28Ho8j2GvvH0e
 LFIM5G0Y+wTHUDazko2ZhVph4AWHM4oSPipEdlA/MAv9QDKM5qWZ6NmJPKmxlzaaoFBx
 VcAA==
X-Gm-Message-State: AOAM532TSA6wzLa2ntqDW6IgGFu+T0jB8AIng1NHvULVNI55CoLVA6dc
 3FBjc2h2tApoOaD8n/j6XMYFG4c942FBdQ2uSuGJv90tXWY=
X-Google-Smtp-Source: ABdhPJw499js3QqlH61nVJqbHP0UU5/nzGKWZI8iMyrGDY39J8pPDHjw80UXQJtD3wJaNQC9N2ZniM25TUrPiuEh5Bg=
X-Received: by 2002:a17:907:16ac:: with SMTP id
 hc44mr15359555ejc.363.1639643078644; 
 Thu, 16 Dec 2021 00:24:38 -0800 (PST)
MIME-Version: 1.0
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Thu, 16 Dec 2021 13:56:37 +0530
Message-ID: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
Subject: hwmontempsensor issue in dbus-sensor
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000043614305d33f2769"
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

--00000000000043614305d33f2769
Content-Type: text/plain; charset="UTF-8"

Hi All,


In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor.
https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab


While testing those changes in my platform, I found that each sensor in
hwmon temp has been creating twice.
After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is
created twice.


/sys/class/hwmon/hwmon2/temp2_input
/sys/class/hwmon/hwmon2/temp1_input


Before your change, hwmon temp sensor will check whether the path is
already exists or not.
If it exists, it will skip and proceed with next path.
https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96


Could you please explain why it is creating twice in hwmon temp ?


Journalctl log before your changes applied :


Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
"/sys/class/hwmon/hwmon2/temp2_input"
Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type :
xyz.openbmc_project.Configuration.TMP421
Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP
Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
/xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path :
/xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path :
"/sys/class/hwmon/hwmon2/temp1_input"



Journalctl log after your changes applied :


Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
"/sys/class/hwmon/hwmon2/temp2_input"
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
xyz.openbmc_project.Configuration.TMP421
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
/xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
/xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP


Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
"/sys/class/hwmon/hwmon2/temp1_input"
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type :
xyz.openbmc_project.Configuration.TMP421
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
/xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path :
/xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP



Thanks,

Kumar.

--00000000000043614305d33f2769
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,=
36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&q=
uot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inheri=
t;font-weight:inherit">Hi All,</p><p style=3D"box-sizing:border-box;margin:=
0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Ap=
ple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;=
font-style:inherit;font-weight:inherit"><br>In dbus-sensors repo, I saw the=
 patch for changes in Hwmon Temp Sensor.<br style=3D"box-sizing:border-box"=
><a aria-label=3D"Link https://github.com/openbmc/dbus-sensors/commit/544e7=
dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a=
60faf8a26f410c1568e5341b22b7ab" title=3D"https://github.com/openbmc/dbus-se=
nsors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b35=
19ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab" href=3D"https://github.co=
m/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff=
-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab" rel=3D"n=
oopener noreferrer" target=3D"_blank" tabindex=3D"-1" style=3D"box-sizing:b=
order-box;background-color:transparent;outline-style:none;color:rgb(98,100,=
167);text-decoration-line:none">https://github.com/openbmc/dbus-sensors/com=
mit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe=
091f9c79a60faf8a26f410c1568e5341b22b7ab</a></p><p style=3D"box-sizing:borde=
r-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,syste=
m-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;fo=
nt-size:14px;font-style:inherit;font-weight:inherit"><br style=3D"box-sizin=
g:border-box"></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36=
,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inher=
it;font-weight:inherit">While testing those changes in my platform, I found=
 that each sensor in hwmon temp has been creating twice.<br style=3D"box-si=
zing:border-box">After analyzed the patch, for below 2 paths SP_OUTLET_TEMP=
 sensor is created twice.</p><p style=3D"box-sizing:border-box;margin:0px;c=
olor:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple C=
olor Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-=
style:inherit;font-weight:inherit"><br style=3D"box-sizing:border-box"></p>=
<p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-famil=
y:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inh=
erit">/sys/class/hwmon/hwmon2/temp2_input<br style=3D"box-sizing:border-box=
">/sys/class/hwmon/hwmon2/temp1_input</p><p style=3D"box-sizing:border-box;=
margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&=
quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-siz=
e:14px;font-style:inherit;font-weight:inherit"><br style=3D"box-sizing:bord=
er-box"></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36=
);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,=
&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;fon=
t-weight:inherit">Before your change, hwmon temp sensor will check whether =
the path is already exists or not.<br style=3D"box-sizing:border-box">If it=
 exists, it will skip and proceed with next path.<br style=3D"box-sizing:bo=
rder-box"><a aria-label=3D"Link https://github.com/openbmc/dbus-sensors/com=
mit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe=
091f9c79a60faf8a26f410c1568e5341b22b7abL96" title=3D"https://github.com/ope=
nbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8=
d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abl96" href=3D"ht=
tps://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0f=
bce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b2=
2b7abL96" rel=3D"noopener noreferrer" target=3D"_blank" tabindex=3D"-1" sty=
le=3D"box-sizing:border-box;background-color:transparent;outline-style:none=
;color:rgb(98,100,167);text-decoration-line:none">https://github.com/openbm=
c/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7e=
d4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96</a></p><p styl=
e=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot=
;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit"><=
br style=3D"box-sizing:border-box"></p><p style=3D"box-sizing:border-box;ma=
rgin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:=
14px;font-style:inherit;font-weight:inherit">Could you please explain why i=
t is creating twice in hwmon temp ?</p><p style=3D"box-sizing:border-box;ma=
rgin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:=
14px;font-style:inherit;font-weight:inherit"><br style=3D"box-sizing:border=
-box"></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);=
font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-=
weight:inherit">Journalctl log before your changes applied :</p><p style=3D=
"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Seg=
oe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&qu=
ot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit"><br s=
tyle=3D"box-sizing:border-box"></p><p style=3D"box-sizing:border-box;margin=
:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px=
;font-style:inherit;font-weight:inherit">Dec 31 16:01:32 yosemitev2 hwmonte=
mpsensor[286]: Path : &quot;/sys/class/hwmon/hwmon2/temp2_input&quot;<br st=
yle=3D"box-sizing:border-box">Dec 31 16:01:32 yosemitev2 hwmontempsensor[28=
6]: Type : xyz.openbmc_project.Configuration.TMP421<br style=3D"box-sizing:=
border-box">Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTL=
ET_TEMP<br style=3D"box-sizing:border-box">Dec 31 16:01:32 yosemitev2 hwmon=
tempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OU=
TLET_TEMP<br style=3D"box-sizing:border-box">Dec 31 16:01:32 yosemitev2 hwm=
ontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_=
OUTLET_REMOTE_TEMP<br style=3D"box-sizing:border-box">Dec 31 16:01:32 yosem=
itev2 hwmontempsensor[286]: Path : &quot;/sys/class/hwmon/hwmon2/temp1_inpu=
t&quot;</p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36)=
;font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font=
-weight:inherit"><br style=3D"box-sizing:border-box"></p><p style=3D"box-si=
zing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&q=
uot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,san=
s-serif;font-size:14px;font-style:inherit;font-weight:inherit"><br style=3D=
"box-sizing:border-box"></p><p style=3D"box-sizing:border-box;margin:0px;co=
lor:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-s=
tyle:inherit;font-weight:inherit">Journalctl log after your changes applied=
 :</p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font=
-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-weig=
ht:inherit"><br style=3D"box-sizing:border-box"></p><p style=3D"box-sizing:=
border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,=
system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-ser=
if;font-size:14px;font-style:inherit;font-weight:inherit">Dec 31 16:01:54 y=
osemitev2 hwmontempsensor[327]: Path : &quot;/sys/class/hwmon/hwmon2/temp2_=
input&quot;<br style=3D"box-sizing:border-box">Dec 31 16:01:54 yosemitev2 h=
wmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP421=
<br style=3D"box-sizing:border-box">Dec 31 16:01:54 yosemitev2 hwmontempsen=
sor[327]: Name : SP_OUTLET_TEMP<br style=3D"box-sizing:border-box">Dec 31 1=
6:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensor=
s/temperature/SP_OUTLET_TEMP<br style=3D"box-sizing:border-box">Dec 31 16:0=
1:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/t=
emperature/SP_OUTLET_REMOTE_TEMP</p><p style=3D"box-sizing:border-box;margi=
n:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14p=
x;font-style:inherit;font-weight:inherit"><br style=3D"box-sizing:border-bo=
x"></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);fon=
t-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot=
;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-wei=
ght:inherit">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : &quot;=
/sys/class/hwmon/hwmon2/temp1_input&quot;<br style=3D"box-sizing:border-box=
">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.openbm=
c_project.Configuration.TMP421<br style=3D"box-sizing:border-box">Dec 31 16=
:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP<br style=3D"b=
ox-sizing:border-box">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path=
 : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP<br style=3D"box-=
sizing:border-box">Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : =
/xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP</p><p style=
=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font-family:&quot;=
Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;,sans-serif;font-size:14px;font-style:inherit;font-weight:inherit"><b=
r></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(36,36,36);font=
-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inherit;font-weig=
ht:inherit"><br></p><p style=3D"box-sizing:border-box;margin:0px;color:rgb(=
36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoj=
i&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14px;font-style:inh=
erit;font-weight:inherit">Thanks,</p><p style=3D"box-sizing:border-box;marg=
in:0px;color:rgb(36,36,36);font-family:&quot;Segoe UI&quot;,system-ui,&quot=
;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,sans-serif;font-size:14=
px;font-style:inherit;font-weight:inherit">Kumar.</p></div>

--00000000000043614305d33f2769--
