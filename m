Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F883D24C7
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 15:43:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVtv95BsBz30JS
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 23:43:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cJp2XBKl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cJp2XBKl; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVttV4tBFz2yhk
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 23:42:41 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so5588827pjo.3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Q4SJi83fMMCFWAu0KnhyJl20JVy2XeQZ7HOhvgI8mAk=;
 b=cJp2XBKlK6eXjHRUy2ij33EkzFgPPP/J3jLGP8ZxLbUReA7gQV5D0MDTdN2QE0PKbl
 gPXYhSvLLy5nLwJEqrDVuIGUZ/oMGhktFEb5oTmlPFTNq0sDeQKWvOjbXYd0n5fYjV9R
 KizMTDGayVISEyxEV+yMNJ3NDQ2oOSoS/UcRgBlPL9cJKGV3K0oi0VktoN6kDUEJAlpS
 5WFukF6M+E3F+My89zEBOxbsXxUs+UyOCHV7JfwccAZi/TzrNrhlfBgB218VezaXeTHZ
 /wRuffIOHZiSIXbTyNND8wfYut1Yls7Xc86+SeG28YzRpna2yHmm2NgFZJFIRee+7/K5
 a5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Q4SJi83fMMCFWAu0KnhyJl20JVy2XeQZ7HOhvgI8mAk=;
 b=Q8S+LD+wXcHf66QM54TEok2c+rKhGs3bLtJuBb+vKR1eBW+5ovOTS0atIouGAFq3i9
 T/mOa+93r7hdXU+2/Z9lvtPIenq/YDqC3FosFmAuO3V3ybgENegI6/lkzNyXQWuTnvVY
 VoAa3+LHFuWLp4b0+6Qn84zfEI/8xaZpYASwGkulkik+oLEHGxSI5fHIPdmG3QUiRmhW
 aTd4JQQT1jyKTBzlONl1qlmYHrI9EWDnkZHiNkpNRnUd6cY16SirKqVJ2JeVjhhc2nyw
 8HNX1NROWnxNLxuR7CaF56OvjkG8qvngrCOEpfi7YHVrVWaHHdLWhY7UMZpxrYxZD+59
 AyMA==
X-Gm-Message-State: AOAM532ypJrbKELK1fvDhbtnI2OgqE4Au1Gc7pfbBreDsePYla573bXG
 1MYLwuudJBZOunGURdsIu9Vj5oTwvUDakbrNH6KA3rUcM1w=
X-Google-Smtp-Source: ABdhPJxukoUkEeyNzJoL7UgEnuSpuZqrEsM42ofsBem8btPAdCzaNM+C8h0wvfSCwauizHMXbKhaY27rnUSQhDecilI=
X-Received: by 2002:a17:90a:474f:: with SMTP id
 y15mr40969613pjg.2.1626961358297; 
 Thu, 22 Jul 2021 06:42:38 -0700 (PDT)
MIME-Version: 1.0
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Thu, 22 Jul 2021 19:12:25 +0530
Message-ID: <CA+FKyEU1L-CSB9N=8ure=qiUJcZEsrCXJ_4cFTUVeOLdGSOCKw@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (Server overview and
 header content)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d31e8505c7b6759b"
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

--000000000000d31e8505c7b6759b
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration for Server overview and header
content.
https://github.com/openbmc/webui-vue/issues/71

Regards
*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore
+91 9811 930 069

*"Everyone wants to go to heaven, but no one wants to die."*

--000000000000d31e8505c7b6759b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requesting feedback o=
n the current iteration for Server overview and header content.</div><div><=
a href=3D"https://github.com/openbmc/webui-vue/issues/71">https://github.co=
m/openbmc/webui-vue/issues/71</a></div><div><br></div><div>Regards<br></div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"backgroun=
d-color:rgb(255,255,255)"><font style=3D"font-size:12.72px" face=3D"tahoma,=
 sans-serif"><b>Parishrut Bhatia</b></font></span><div style=3D"font-size:1=
2.72px"><span style=3D"color:rgb(102,102,102)"><span style=3D"background-co=
lor:rgb(255,255,255)"><span style=3D"font-family:tahoma,sans-serif;font-siz=
e:small">User Experience Designer | IBM iX, Bangalore</span></span></span><=
/div><div style=3D"font-size:12.72px"><span style=3D"color:rgb(102,102,102)=
"><span style=3D"background-color:rgb(255,255,255)"><span style=3D"font-fam=
ily:tahoma,sans-serif;font-size:12.72px">+91 9811 930 069</span></span></sp=
an></div><div style=3D"font-size:12.72px"><span style=3D"background-color:r=
gb(255,255,255)"><br></span></div><div style=3D"font-size:12.72px"><i><span=
 style=3D"color:rgb(102,102,102)"><span style=3D"background-color:rgb(255,2=
55,255)">&quot;Everyone wants to go to heaven, but no one wants to die.&quo=
t;</span></span></i><br></div><div style=3D"font-size:12.72px"><br><br></di=
v></div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000d31e8505c7b6759b--
