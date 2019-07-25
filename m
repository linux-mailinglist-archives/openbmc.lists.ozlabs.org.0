Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C4756D3
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 20:24:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vgbs5lHQzDqQS
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 04:24:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=ryanarnellibm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bkfc47+u"; 
 dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vgbJ5f8RzDqP8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 04:24:06 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id b29so27969173lfq.1
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=r58lyfHOwoe3dzcGvhNz4OU4QdsC1XwcaxQguKa0rlw=;
 b=Bkfc47+u+COKp3qDoxY+DkV4dnQ4eqxpcyggTMl/wkJEpeVImYgQp25niK0gtzkXrH
 xHfB0ManDRB3acsv9R24oHBB+hWwXVisodidNCfqDv1qzw3wLf64eZkW2XMeGRvvbkR8
 ajPpfIWX8qZx9xGpa76w4g9snaQxdxf1f8Xdj/jmJyVMynFEembKSWScrSNkYdmubkL6
 BtEuGmq/XnZRKHQYPcGyxXzDiFRoPSVkUufQlyAmM5xF1SMpjh3DyQQctat6TnTcDN9P
 NbQ++mw14gEZToZsDFNJNzuWjMZFEKcKpUopkN9semhe3/8CIyKX6HkyGf/nLrIwl4eR
 JLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=r58lyfHOwoe3dzcGvhNz4OU4QdsC1XwcaxQguKa0rlw=;
 b=YON1QtwXQym6+y/ay8bxChlF7/AXc/B+ymEeUdEFVfns5s2vq4RxDResWIaarXP5qM
 xex+ZZhHa41Wf05nWBWB8T/RAbarnhiXAU2AQRiBJuzf2he2hzdjHvRLN7CmmMNDDYPj
 oUZT55kNNaaAtnpiJOFeZurT4pMqMnSw5UiPZ12fjjPqaFgNm3BcsBrOskIhZT0LXzkp
 CXmW2PoCTjmJ8vgTNN2jd86s4OAkFheHj+2YXS6vpdStJEsJMBLa0BQtdq5M20JsHXfm
 rG/bnaCfXqWcC7uXbiY+aVbXtEOg4YT9zzPNdLcSVEZyOiCdSbwahDONukHZMXAbDr6b
 3k2A==
X-Gm-Message-State: APjAAAXTWpmJT7qjzhrXRHAM9x+ngjNDy09mf1IBUUjWINo5NCiEFzzS
 PTfDUQwQPlRN6xzIsNmJOZKV+fmVrfRUEXU+30gXeA==
X-Google-Smtp-Source: APXvYqwIiKrWohbl1BsGWP7/VcU++8x8eLLT3vC7QKlCzUypmRZh37oRoHHDMwPgWALYzWNT+8/vSxGcrjHowo3ttKo=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr31922915lfk.20.1564079041568; 
 Thu, 25 Jul 2019 11:24:01 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Arnell <ryanarnellibm@gmail.com>
Date: Thu, 25 Jul 2019 13:23:50 -0500
Message-ID: <CAH3qHnbrcXzRyh==xZgNBJO3nRLf-j_X11JDymdpaQDUPo68ZA@mail.gmail.com>
Subject: Event log new GUI
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ac666b058e858755"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ac666b058e858755
Content-Type: text/plain; charset="UTF-8"

Hi all,
We took initiative on redesigning the event log page to be more robust and
user friendly. We have made the log table more compact, made columns
sortable, added batch operations, improved the detail panel to name a few.

Please feel free to review the new GUI and leave your feedback by adding
comments in the following invision prototype link.

https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319141765_01-Event-Logs

You can also review the issue in github and leave your comments there. We
look forward to hearing from you.

https://github.com/openbmc/phosphor-webui/issues/89

Thank you

*Ryan Arnell*
UX Engineer | IBM Design | IBM Studios Austin



*E:* iffy.ryan@ibm.com

--000000000000ac666b058e858755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div>We took initiative on redesigning the ev=
ent log page to be more robust and user friendly. We have made the log tabl=
e more compact, made columns sortable, added batch operations, improved the=
 detail panel to name a few.=C2=A0</div><div><br></div><div>Please feel fre=
e to review the new GUI and leave your feedback by adding comments in the f=
ollowing invision prototype link.=C2=A0=C2=A0</div><div><br></div><div><a r=
el=3D"nofollow" href=3D"https://ibm.invisionapp.com/share/8ENYRVXAPFD#/3191=
41765_01-Event-Logs" style=3D"box-sizing:border-box;color:rgb(3,102,214);te=
xt-decoration-line:none;font-family:-apple-system,system-ui,&quot;Segoe UI&=
quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:14px" target=3D"_blank=
">https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319141765_01-Event-Logs</a=
><br></div><div><br></div><div>You can also review the issue in github and =
leave your comments there. We look forward to hearing from you.=C2=A0</div>=
<div><br></div><div><a href=3D"https://github.com/openbmc/phosphor-webui/is=
sues/89" target=3D"_blank">https://github.com/openbmc/phosphor-webui/issues=
/89</a>=C2=A0<br></div><div><br></div><div>Thank you</div><div>





<p class=3D"m_5773488863098765984gmail-p1" style=3D"margin:0px;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-siz=
e:11px;line-height:normal;font-family:Verdana"><b>Ryan Arnell</b>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<br>
UX Engineer | IBM=C2=A0Design=C2=A0|=C2=A0IBM Studios Austin</p>
<p class=3D"m_5773488863098765984gmail-p2" style=3D"margin:0px;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-siz=
e:12px;line-height:normal;font-family:Times">=C2=A0</p>
<p class=3D"m_5773488863098765984gmail-p1" style=3D"margin:0px;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-siz=
e:11px;line-height:normal;font-family:Verdana"><b>E:</b>=C2=A0<a href=3D"ma=
ilto:iffy.ryan@ibm.com" target=3D"_blank">iffy.ryan@ibm.com</a></p></div><d=
iv><br></div><div><br></div><div><br></div></div>

--000000000000ac666b058e858755--
