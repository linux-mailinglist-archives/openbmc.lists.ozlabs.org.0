Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 223763D24C6
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 15:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVttm0m0jz30CP
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 23:42:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hA5tydg2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hA5tydg2; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVttV4pxjz2yXy
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 23:42:41 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id my10so6274022pjb.1
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zvX5kC+qAygMYmgqNat7bq+tovGMe96mTAVYi5Wd0eY=;
 b=hA5tydg2rbzE/7EMwRMhml7aGciyVo2tvVsoNBfxKvfz7lJedq1HmCpy08Ug3NS9Sr
 eY9IcesH7bQLktexwd/K8Tc2ghxuVRwd4xm8wkW+8DE6Qcatx/ruAMmDmbUlA3iYR6el
 xqT+iLFnFJu6zgmTd7ksxwm+AZ8dtFDdNxSDMMKEWlHTvi1BmQq64RAAv58fAeWoB/in
 Lh+QRCRIWTE8SBJNXHUICJVMZWXGmwjDugztuoE1Mm2Bdy1OCn2j6Ed08o5ZubUTONRc
 6zvBfOs9l/zp17A94DJTqx+QEP58t86hnALsIJUtCGhdqMzvwn05dYxB0QcBRerlWbhz
 4svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zvX5kC+qAygMYmgqNat7bq+tovGMe96mTAVYi5Wd0eY=;
 b=d9RwXtk576MXVZUnkAv+RO3Onu9lNA4rCvRkQRBq1+2FV+uWrnpFptt7cPDEhzj56S
 EhChU3Njvl+QonvDJ/RVEaPv1CCf4kN/AVBVTOhcLB6K1u10RehlMwp6QsBqUjb6+pEx
 XTJ/qg+3gwA3Oh/H8uJYZDzUara0mIF+ox/tbxacqm5+cfjDiORZriCVj1SaI54vpcbc
 Z+SuqLpSTACRE9xftdBrOsFKmsdrrA/SkGVQE3X+FcpAY8ZcI74g76EkWDg7aYXmoIUz
 JQAAIYyl04Yq+G8pg1hPFW1gAzLz0PwwcGAAoI2Q+0CbBc38UijHlHrB89zGuNc7VuY2
 LM1Q==
X-Gm-Message-State: AOAM532AbdUMVjJrDgbvDnSullZVUqI9mKIZh/aTaF2Dvwll2mrqVffm
 KUMRHl2WxnrTX1n6n4mxVYShxcxeYfKkSqk3SYwSDpsImw4=
X-Google-Smtp-Source: ABdhPJz5aLy/pMZhKnj2Y1MhXlDVpQ682OL0oL78Ha3c9gv09SURom0J7mqeTMQNHTnNRKUyb5L7DeXYkdKKwFVkTlQ=
X-Received: by 2002:a62:3896:0:b029:33a:f41a:11a4 with SMTP id
 f144-20020a6238960000b029033af41a11a4mr30353461pfa.9.1626961358131; Thu, 22
 Jul 2021 06:42:38 -0700 (PDT)
MIME-Version: 1.0
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Thu, 22 Jul 2021 19:12:24 +0530
Message-ID: <CA+FKyEXEq25WuvKNeLdCtXixdfEkT8yjVyfXq9=qx0qJz5dsUw@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (Key clear/Clear
 sensitive data)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d0962d05c7b67580"
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

--000000000000d0962d05c7b67580
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration for Key Clear / Clear
sensitive data feature.
https://github.com/openbmc/webui-vue/issues/72

Regards
*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore
+91 9811 930 069

*"Everyone wants to go to heaven, but no one wants to die."*

--000000000000d0962d05c7b67580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requesting feedback o=
n the current iteration for Key Clear / Clear sensitive data feature. <br><=
a href=3D"https://github.com/openbmc/webui-vue/issues/72">https://github.co=
m/openbmc/webui-vue/issues/72</a></div><div><br></div><div>Regards<br></div=
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

--000000000000d0962d05c7b67580--
