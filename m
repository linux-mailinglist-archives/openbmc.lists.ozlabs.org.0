Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53363245A10
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 01:39:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVDD02vsgzDqPw
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 09:39:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=chalapathyvenkata619@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X/stCCoD; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSlX45KQjzDqlJ
 for <openbmc@lists.ozlabs.org>; Sat, 15 Aug 2020 00:03:13 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id kq25so10048040ejb.3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qGB9r6Fiepe4jyF8wAmOz6CHFPinOzRa14p9Opulaak=;
 b=X/stCCoDHh0HOH8JciPvW5cbyorHkvFMeaTq6pRE9LJkm603UHXzjyP/Ubxog4tMrQ
 0d2uaDS3TOlwfqaRxOrtAFIhAFTGtUVpzFsdmzp/QP871oISNAv2WyegNy9otRQTs3Az
 YneVH9NmIc6tL7ehq54lH+mNGdGN5DzTFyfeXgLzwkoCVxo/Ses5mtsyM9h7PoP2+3DK
 3OsUDKWs4F8gbGeVLRmnBSG4LiGEa/KNKQu3RTHXBTqLWW1M5u/XFH+BbJ1twV/hdN65
 vDNoSyOm6ZIPaPggeZx4q/mM6kOqmsf6ir6FtfafjM12if5HMGYb5byAvvyaLHISGM4Q
 xyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qGB9r6Fiepe4jyF8wAmOz6CHFPinOzRa14p9Opulaak=;
 b=Wm54q/jXDfF9Q42RowftUn7PsvANiPA79tu/irDCpT3jUq+kpGIfFbOyaR2nvzbQSz
 LFxGCsRL9+jXRMqNEKydsRZMG6JrU2AOHEd4ZKEAtK7Pzn9i3zBLfgbT7wDpcNFBBan1
 YlvTcocr0hIp5khYQrA2Gtm7zhjGauIwGRWdHwDmg9Z5Ovjjt7zt8lwT1Jo/Hd+XZ+GU
 rM9Yao7lDoEVcVWJcZWn2qwJcSNXZiG9BIV0RcMZ6W5wu6tU6owbIQv1sBRawilExKsC
 vOPlc9J4j8ZsxFMy9bKoVs/IFmzk8L00dzx3LZJjk84Vio1pt2XYp8SCP4eNck9HeK4X
 sYZw==
X-Gm-Message-State: AOAM530y02nm88UHRRdIbgFclXrDJ+OtOSzmar4C/yfnhMWpVyeZn/yZ
 P+HGY/YdytDbFKZyxxKfcQeBsLzdBMXYdHdfwqCKaOPse04=
X-Google-Smtp-Source: ABdhPJwbx7r479+uns0CuW1TKEKMhiNLi9QIiMbkxp8DrVsLP63tIUg+Z0C7oAZuVPxbKWwe+27ATsgnN5uRV+nKUN0=
X-Received: by 2002:a17:906:2a49:: with SMTP id
 k9mr2618844eje.117.1597413788272; 
 Fri, 14 Aug 2020 07:03:08 -0700 (PDT)
MIME-Version: 1.0
From: Venkata Chalapathy <chalapathyvenkata619@gmail.com>
Date: Fri, 14 Aug 2020 22:02:57 +0800
Message-ID: <CAB2jT4Yt5=biGEiOWYEdzix7ydc3XH8JcTs7VPoHdec+JhYVrw@mail.gmail.com>
Subject: Generate Crashdump log via Redfish
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000068cb2a05acd6e105"
X-Mailman-Approved-At: Mon, 17 Aug 2020 09:37:30 +1000
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

--00000000000068cb2a05acd6e105
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,



I=E2=80=99m looking for guidance on generating a crashdump log via the Redf=
ish
interface. There are two actions available to the user to generate the dump
=E2=80=93 OnDemand and SendRawPeci. But I=E2=80=99m not aware of the payloa=
d data I need to
be sending along with the request to generate the dump in either of the
cases. Could you please share the payload that I need to attach to the
request.



      "#Crashdump.OnDemand": {

        "target":
"/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.OnD=
emand"

      },

      "#Crashdump.SendRawPeci": {

        "target":
"/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.Sen=
dRawPeci"



Best Regards,

Venka

--00000000000068cb2a05acd6e105
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">Hi Everyone,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">I=E2=80=99m looking for guidance on generating =
a crashdump log via
the Redfish interface. There are two actions available to the user to gener=
ate
the dump =E2=80=93 OnDemand and SendRawPeci. But I=E2=80=99m not aware of t=
he payload data I
need to be sending along with the request to generate the dump in either of=
 the
cases. Could you please share the payload that I need to attach to the requ=
est.</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"line-height:12pt;background:rgb(255,255,254=
);margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><s=
pan style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;color:black"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><span style=3D"font-size:9pt;fo=
nt-family:&quot;Courier New&quot;;color:rgb(163,21,21)">&quot;#Crashdump.On=
Demand&quot;</span><span style=3D"font-size:9pt;font-family:&quot;Courier N=
ew&quot;;color:black">:=C2=A0{</span></p>

<p class=3D"MsoNormal" style=3D"line-height:12pt;background:rgb(255,255,254=
);margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><s=
pan style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;color:black"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><span style=3D"font=
-size:9pt;font-family:&quot;Courier New&quot;;color:rgb(163,21,21)">&quot;t=
arget&quot;</span><span style=3D"font-size:9pt;font-family:&quot;Courier Ne=
w&quot;;color:black">:=C2=A0</span><span style=3D"font-size:9pt;font-family=
:&quot;Courier New&quot;;color:rgb(4,81,165)">&quot;/redfish/v1/Systems/sys=
tem/LogServices/Crashdump/Actions/Oem/Crashdump.OnDemand&quot;</span><span =
style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;color:black"></s=
pan></p>

<p class=3D"MsoNormal" style=3D"line-height:12pt;background:rgb(255,255,254=
);margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><s=
pan style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;color:black"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},</span></p>

<p class=3D"MsoNormal" style=3D"line-height:12pt;background:rgb(255,255,254=
);margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><s=
pan style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;color:black"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><span style=3D"font-size:9pt;fo=
nt-family:&quot;Courier New&quot;;color:rgb(163,21,21)">&quot;#Crashdump.Se=
ndRawPeci&quot;</span><span style=3D"font-size:9pt;font-family:&quot;Courie=
r New&quot;;color:black">:=C2=A0{</span></p>

<p class=3D"MsoNormal" style=3D"line-height:12pt;background:rgb(255,255,254=
);margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><s=
pan style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;color:black"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><span style=3D"font=
-size:9pt;font-family:&quot;Courier New&quot;;color:rgb(163,21,21)">&quot;t=
arget&quot;</span><span style=3D"font-size:9pt;font-family:&quot;Courier Ne=
w&quot;;color:black">:=C2=A0</span><span style=3D"font-size:9pt;font-family=
:&quot;Courier New&quot;;color:rgb(4,81,165)">&quot;/redfish/v1/Systems/sys=
tem/LogServices/Crashdump/Actions/Oem/Crashdump.SendRawPeci&quot;</span><sp=
an style=3D"font-size:9pt;font-family:&quot;Courier New&quot;;color:black">=
</span></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Best Regards,</p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Venka</p></div>

--00000000000068cb2a05acd6e105--
