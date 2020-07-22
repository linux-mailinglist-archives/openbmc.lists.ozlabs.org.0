Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C9F22A91F
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 08:52:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC3172vhyzDr8N
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 16:52:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A/FOgrP6; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBSd9153lzDqQX
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 18:03:05 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id 1so760075pfn.9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rKHj2RRvJrwBmGo/rK6zQyaIFDAFf3p1wvg+Ti5m0Sw=;
 b=A/FOgrP6poBwfaUe1z5p7n/GKCRJHjbjpp+WmbYP0B1hLMGBj+1JerQ0KtrMxJM17J
 aEaMKJn1tFMwrfQ62OUMehcXT+Q6+xJsc6GzP9etR93YNXEIU4pVkPcMpZflE0XWGDqJ
 qYD8kj3/xiTj4f7YHLZFtAW49h43PImJ8uKTvI88AePHkzDKJs2K52Lt/e6g5joTMg3F
 CPeuuQBvA6HxlfKx+y7ZchcWH+8kiEyS0NLes42vA6j4T2Comzyn1D1l5hEA2qt5sUNq
 ZshLPEDys5qPPo/BkMAjnBBEKkCW5LRR8BYXNEgK72Dun8MLcY8eXXCW+yQ++B83mcAN
 hiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rKHj2RRvJrwBmGo/rK6zQyaIFDAFf3p1wvg+Ti5m0Sw=;
 b=Fo0lpRIEOfYc5jWHzqQz/yVXSdVQu3SfuPogVcxpohPxZ5R1jVFZa+gj7tY/zGHOXa
 QVWjKqZ7qioFojat35KcZ01HI8BBkDSSSb+Eg+JApKJUA/9pOPOim7f0rlrJCr2/1MUX
 tvpCi8M8XPRgJhjLuO+vuTWatr7N3grngZBQmdTkrDW9WPSJjlEmeygKG3EA+HXUGsdz
 7cx1mZjNTBHPFG9j/XuIwESLylTGWcsAY4L0+6/mqV49VSWiHgobDLpV2Gjm7VdkAE8m
 uM3ua97HTmGYXTDYSkcIJed4YZoS6Twnp1e3mvZyLAP2XsDRM2u4ZraCRIUC1+8AT+8c
 eKLg==
X-Gm-Message-State: AOAM531z66tTidkn8ta1CRFu60S354r9xDcJzAoG675fV1kAbmRdNyM5
 r/K6OamIUCe1pxc0z3m/P6/xVNm0kVG4TJv9UGyFg9bgLNY=
X-Google-Smtp-Source: ABdhPJw7yUkUbz77mKWW1sHvcooZoTL0+5mYXlohofoh0N4S9590ntPM3bAKwRraCrUrMRwlqITkhaZzmAiL3JqfESE=
X-Received: by 2002:aa7:86c1:: with SMTP id h1mr26218447pfo.175.1595404982206; 
 Wed, 22 Jul 2020 01:03:02 -0700 (PDT)
MIME-Version: 1.0
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Wed, 22 Jul 2020 13:32:51 +0530
Message-ID: <CAD+gp9A-mBeKrFTZdVuQ6uz3snDAv2zF-db_=edR=4pOtFcUuQ@mail.gmail.com>
Subject: Query regarding using the Redfish in OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000003cc27805ab032bb9"
X-Mailman-Approved-At: Thu, 23 Jul 2020 16:51:51 +1000
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

--0000000000003cc27805ab032bb9
Content-Type: text/plain; charset="UTF-8"

  Hi Team,

I am newbiee to  Openbmc.  I want to view  the redfish/v1 (
https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser .Could you
please guide me on what changes i need to so that i view the /redfish/v1/
content in the browser .

here are the steps i have followed:

   1. Clone OpenBMC project : git clone
   https://github.com/openbmc/openbmc.git in the server machine .
   2. Compile using the following command: TEMPLATECONF=meta-phosphor/conf
   . openbmc-env
   3. modify the following files:


   -  #build vi conf/local.conf   (modify the  line "-MACHINE??=qemuarm" "
   to    "-MACHINE??=raspberrypi3-64" "
   - #build vi conf/bblayer.conf (add the following line
"/home/khader<username>/openbmc/meta-raspberrypi
   \"  to the line  above /home/khader<username>/openbmc/metaphosphor \"

       4. #build  bitbake obmc-phosphor-image

The above steps I have used to build an Openbmc project.


Can you help me what further steps should i need to do so that i can view
the /redfish/v1/  content in the webbrowser.

Note:- I am compiling the openbmc code in the server machine.

Any help /guidelines on this will really help me alot.
Appreciate all your help.

Thanks & Regards,
khader B Shaik

--0000000000003cc27805ab032bb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 Hi Team,<div><br></div><div>I am newbiee to=C2=A0 O=
penbmc.=C2=A0 I want to view=C2=A0 the redfish/v1 (<a href=3D"https://10.xx=
x.xxx.xxx:8000/redfish/v1">https://10.xxx.xxx.xxx:8000/redfish/v1</a>) cont=
ents in the browser .Could you please guide me on what changes i need to so=
 that=C2=A0i=C2=A0view the /redfish/v1/ content in the browser .</div><div>=
<br></div><div>here are the steps i have followed:</div><div><ol><li style=
=3D"margin-left:15px">Clone OpenBMC project : git clone=C2=A0<a href=3D"htt=
ps://github.com/openbmc/openbmc.git" target=3D"_blank">https://github.com/o=
penbmc/openbmc.git</a>=C2=A0in the server machine .</li><li style=3D"margin=
-left:15px">Compile using the following command: TEMPLATECONF=3Dmeta-phosph=
or/conf=C2=A0 . openbmc-env</li><li style=3D"margin-left:15px">modify the f=
ollowing files:</li></ol><ul><li style=3D"margin-left:15px">=C2=A0#build vi=
 conf/local.conf=C2=A0 =C2=A0(modify the=C2=A0 line &quot;-MACHINE??=3Dqemu=
arm&quot; &quot; to=C2=A0 =C2=A0 &quot;-MACHINE??=3Draspberrypi3-64&quot; &=
quot;</li><li style=3D"margin-left:15px">#build vi conf/bblayer.conf=C2=A0(=
add the following line &quot;<span style=3D"background-color:rgb(255,255,0)=
">/home/khader&lt;username&gt;/openbmc/meta-raspberrypi \</span>&quot;=C2=
=A0 to the line=C2=A0 above /home/khader&lt;username&gt;/openbmc/metaphosph=
or \&quot;</li></ul><div>=C2=A0 =C2=A0 =C2=A0 =C2=A04. #build=C2=A0 bitbake=
 obmc-phosphor-image</div><div><br></div><div>The above steps I have used t=
o build an Openbmc project.</div><div><br></div></div><div><br></div><div>C=
an you help me what further steps should i need to do so that i can view th=
e /redfish/v1/=C2=A0 content in the webbrowser.</div><div><br></div><div>No=
te:- I am compiling the openbmc code in the server machine.</div><div><br><=
/div><div>Any help /guidelines on this will really help me alot.</div><div>=
Appreciate all your help.</div><div><br></div><div>Thanks &amp; Regards,</d=
iv><div>khader B Shaik</div><div>=C2=A0</div></div>

--0000000000003cc27805ab032bb9--
