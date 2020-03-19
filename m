Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55718C16B
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 21:30:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jz6r3KQJzDrPQ
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 07:30:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=obmc.developers@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BpAiQwLY; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jz5j4vKXzDrPR
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 07:29:11 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id p125so4147612oif.10
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=V3DISJAOtDhd+zWEhcfbT3aYHQ9+p7pUjlUc+c3tOdo=;
 b=BpAiQwLYQ8KyIz8xsMnQUa3Y/qFHSqgRxApLhu8SO+lvMhAFLFDjHBYYwRDi8xnHT+
 W5AJva7ULXwym96LPso1SWzoZR7zp6cCGJz1XabLsgTFxBql92rNteR/7F40KbT74TYr
 xcvZ+2DHH/jHluQ1QOXOHfdba70lseK5MGvAp+7OmM/ayg7pL3GiZxvBTlwOwDl8HDvh
 apo92sFjA0iDkz1ZsVrL3pXH6EDg1urj/jTdWR3NTHtagex5GNXzzaKzmo2JqbYfq8Lu
 T79M0amfmzxZnKu87Muf265ejTf/DVxhuEhyzyQsVf8X1sqeg5C5dzmlFKSOtrcxrMdu
 2BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=V3DISJAOtDhd+zWEhcfbT3aYHQ9+p7pUjlUc+c3tOdo=;
 b=XQEmwuL2meaKoW4PQQJL0zmXrC6ME7ifcR037Esm1j/ORTQ0Zuq01JNKPXeoHZXT49
 nIl6y9wK2lVkv3TUcb9zwI6vijDas3b7amCedHBtPvtBLE4U2vkNxBvCxfB4a2qGp1sn
 FlwYnJnHQtfTCq/HlDo5JgZBnW0bSlle4R1xJ8jHNWMY7SHpBHmBo0AVYNwel338qIeh
 oGwJIVHE06tGfBL+U4dwk/G7nXLiK14mQuORf4ejyBcqsdIKjPck8K2lgwmfLHlDTd2c
 mGwhVmhzNnnACf3exrO+pe+iqrif5eJiGVvZ1IJnrezxyTmlAyHdx4FyMGvI5kznU1+o
 f6iA==
X-Gm-Message-State: ANhLgQ1VuIihPknmQReHSKpD0m3iv7ZtZITTkjEXqm5b9pLm77t/FiSq
 jGYMcrQrJxBZbgqRJT1GrqSi9k0DVACsIR80czO523HJ
X-Google-Smtp-Source: ADFU+vtpCYNLU5Z8V1rJaLSIVFIxm1VcaaIg0/jpMtWzrutIX0Ij+XPh74aT/+sSjFB45Er9iRpqKJGVO9pIfs7H/j0=
X-Received: by 2002:aca:574a:: with SMTP id l71mr2967777oib.148.1584649747854; 
 Thu, 19 Mar 2020 13:29:07 -0700 (PDT)
MIME-Version: 1.0
From: Anony Mous <obmc.developers@gmail.com>
Date: Thu, 19 Mar 2020 13:26:25 -0700
Message-ID: <CABbLDjMFQ6OqyRsMDDEkB9UqWN-fYRg76+X6e+GFMf=RJg+uVA@mail.gmail.com>
Subject: IPMI, SDR, SEL, FRU, YAML and dbus Questions
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000050790d05a13b0503"
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

--00000000000050790d05a13b0503
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To whom it may concern,

I have a few questions relating to IPMI, SDR, SEL, FRU, YAML and dbus in
OpenBMC. Please find below the list of questions. Any help is greatly
appreciated.

1. What is the purpose of the dbus interfaces, and how do they play in the
operation of the BMC?

2. How do we create/modify dbus interfaces and/or paths?

3. What is the relationship between IPMITool and phosphor-host-ipmid (or
phosphor-ipmid-host)?

4. How does IPMI, OpenIPMI, ipmitool, (etc.) interact with OpenBMC?

5. How do we implement IPMI raw commands that aren=E2=80=99t currently supp=
orted in
our builds (i.e. =E2=80=9Center sdr update mode=E2=80=9D)?

6. What is the purpose of the ipmi-oem-whitelist?

7. What package(s) are required to be able to create SEL files (in other
words allow events to be logged to SEL files)?

8. We keep seeing a =E2=80=9CSEL has no entries=E2=80=9D error. Is this bec=
ause we are
missing component(s) (covered in the previous question), or due to some
other cause?

9. How do we add our own SEL records to the SEL file?

10. Where are the SEL, SDR and FRU files stored? Or if this is
configurable, where is it configured, and how do change the configuration?

11. Where does the BMC read the FRU data, and how does it use it?

12. How do we create an initial FRU file (what is the format of the FRU
data)?

13. What are YAML files? What is the best way to populate a YAML file?

Thank you for your time.

--00000000000050790d05a13b0503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,=
Helvetica,sans-serif,serif,EmojiFont;font-size:16px">To whom it may concern=
,</span><br style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,s=
ans-serif,serif,EmojiFont;font-size:16px"><div style=3D"margin:0px;padding:=
0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit=
;font-stretch:inherit;font-size:16px;line-height:inherit;font-family:Calibr=
i,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;color:=
rgb(0,0,0)"><br></div><div style=3D"margin:0px;padding:0px;border:0px;font-=
variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inheri=
t;font-size:16px;line-height:inherit;font-family:Calibri,Arial,Helvetica,sa=
ns-serif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)">I have a=
 few questions relating to IPMI, SDR, SEL, FRU, YAML and dbus in OpenBMC. P=
lease find below the list of questions. Any help is greatly appreciated.<br=
></div><div style=3D"margin:0px;padding:0px;border:0px;font-variant-numeric=
:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:16p=
x;line-height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif,serif,=
EmojiFont;vertical-align:baseline;color:rgb(0,0,0)"><br></div><div style=3D=
"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-varian=
t-east-asian:inherit;font-stretch:inherit;font-size:16px;line-height:inheri=
t;font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-a=
lign:baseline;color:rgb(0,0,0)">1. What is the purpose of the dbus interfac=
es, and how do they play in the operation of the BMC?<br></div><div style=
=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-var=
iant-east-asian:inherit;font-stretch:inherit;font-size:16px;line-height:inh=
erit;font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertica=
l-align:baseline;color:rgb(0,0,0)"><br></div><div style=3D"margin:0px;paddi=
ng:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inhe=
rit;font-stretch:inherit;font-size:16px;line-height:inherit;font-family:Cal=
ibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;col=
or:rgb(0,0,0)">2. How do we create/modify dbus interfaces and/or paths?<br>=
</div><div style=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:=
inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:16px=
;line-height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif,serif,E=
mojiFont;vertical-align:baseline;color:rgb(0,0,0)"><br></div><div style=3D"=
margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-variant=
-east-asian:inherit;font-stretch:inherit;font-size:16px;line-height:inherit=
;font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-al=
ign:baseline;color:rgb(0,0,0)">3. What is the relationship between IPMITool=
 and phosphor-host-ipmid (or phosphor-ipmid-host)?<br></div><div style=3D"m=
argin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-=
east-asian:inherit;font-stretch:inherit;font-size:16px;line-height:inherit;=
font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-ali=
gn:baseline;color:rgb(0,0,0)"><br></div><div style=3D"margin:0px;padding:0p=
x;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;f=
ont-stretch:inherit;font-size:16px;line-height:inherit;font-family:Calibri,=
Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;color:rg=
b(0,0,0)">4. How does IPMI, OpenIPMI, ipmitool, (etc.) interact with OpenBM=
C?<br></div><div style=3D"margin:0px;padding:0px;border:0px;font-variant-nu=
meric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-siz=
e:16px;line-height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif,s=
erif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)"><br></div><div sty=
le=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-v=
ariant-east-asian:inherit;font-stretch:inherit;font-size:16px;line-height:i=
nherit;font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;verti=
cal-align:baseline;color:rgb(0,0,0)">5. How do we implement IPMI raw comman=
ds that aren=E2=80=99t currently supported in our builds (i.e. =E2=80=9Cent=
er sdr update mode=E2=80=9D)?<br></div><div style=3D"margin:0px;padding:0px=
;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;fo=
nt-stretch:inherit;font-size:16px;line-height:inherit;font-family:Calibri,A=
rial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;color:rgb=
(0,0,0)"><br></div><div style=3D"margin:0px;padding:0px;border:0px;font-var=
iant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;f=
ont-size:16px;line-height:inherit;font-family:Calibri,Arial,Helvetica,sans-=
serif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)">6. What is =
the purpose of the ipmi-oem-whitelist?<br></div><div style=3D"margin:0px;pa=
dding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:i=
nherit;font-stretch:inherit;font-size:16px;line-height:inherit;font-family:=
Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;=
color:rgb(0,0,0)"><br></div><div style=3D"margin:0px;padding:0px;border:0px=
;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:=
inherit;font-size:16px;line-height:inherit;font-family:Calibri,Arial,Helvet=
ica,sans-serif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)">7.=
 What package(s) are required to be able to create SEL files (in other word=
s allow events to be logged to SEL files)?<br></div><div style=3D"margin:0p=
x;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asi=
an:inherit;font-stretch:inherit;font-size:16px;line-height:inherit;font-fam=
ily:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:basel=
ine;color:rgb(0,0,0)"><br></div><div style=3D"margin:0px;padding:0px;border=
:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-stre=
tch:inherit;font-size:16px;line-height:inherit;font-family:Calibri,Arial,He=
lvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)=
">8. We keep seeing a =E2=80=9CSEL has no entries=E2=80=9D error. Is this b=
ecause we are missing component(s) (covered in the previous question), or d=
ue to some other cause?<br></div><div style=3D"margin:0px;padding:0px;borde=
r:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-str=
etch:inherit;font-size:16px;line-height:inherit;font-family:Calibri,Arial,H=
elvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0=
)"><br></div><div style=3D"margin:0px;padding:0px;border:0px;font-variant-n=
umeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-si=
ze:16px;line-height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif,=
serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)">9. How do we add =
our own SEL records to the SEL file?<br></div><div style=3D"margin:0px;padd=
ing:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inh=
erit;font-stretch:inherit;font-size:16px;line-height:inherit;font-family:Ca=
libri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;co=
lor:rgb(0,0,0)"><br></div><div style=3D"margin:0px;padding:0px;border:0px;f=
ont-variant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:in=
herit;font-size:16px;line-height:inherit;font-family:Calibri,Arial,Helvetic=
a,sans-serif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)">10. =
Where are the SEL, SDR and FRU files stored? Or if this is configurable, wh=
ere is it configured, and how do change the configuration?<br></div><div st=
yle=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-=
variant-east-asian:inherit;font-stretch:inherit;font-size:16px;line-height:=
inherit;font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vert=
ical-align:baseline;color:rgb(0,0,0)"><br></div><div style=3D"margin:0px;pa=
dding:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:i=
nherit;font-stretch:inherit;font-size:16px;line-height:inherit;font-family:=
Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;=
color:rgb(0,0,0)">11. Where does the BMC read the FRU data, and how does it=
 use it?<br></div><div style=3D"margin:0px;padding:0px;border:0px;font-vari=
ant-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;fo=
nt-size:16px;line-height:inherit;font-family:Calibri,Arial,Helvetica,sans-s=
erif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)"><br></div><d=
iv style=3D"margin:0px;padding:0px;border:0px;font-variant-numeric:inherit;=
font-variant-east-asian:inherit;font-stretch:inherit;font-size:16px;line-he=
ight:inherit;font-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont=
;vertical-align:baseline;color:rgb(0,0,0)">12. How do we create an initial =
FRU file (what is the format of the FRU data)?<br></div><div style=3D"margi=
n:0px;padding:0px;border:0px;font-variant-numeric:inherit;font-variant-east=
-asian:inherit;font-stretch:inherit;font-size:16px;line-height:inherit;font=
-family:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;vertical-align:b=
aseline;color:rgb(0,0,0)"><br></div><div style=3D"margin:0px;padding:0px;bo=
rder:0px;font-variant-numeric:inherit;font-variant-east-asian:inherit;font-=
stretch:inherit;font-size:16px;line-height:inherit;font-family:Calibri,Aria=
l,Helvetica,sans-serif,serif,EmojiFont;vertical-align:baseline;color:rgb(0,=
0,0)">13. What are YAML files? What is the best way to populate a YAML file=
?<br></div><div style=3D"margin:0px;padding:0px;border:0px;font-variant-num=
eric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size=
:16px;line-height:inherit;font-family:Calibri,Arial,Helvetica,sans-serif,se=
rif,EmojiFont;vertical-align:baseline;color:rgb(0,0,0)"><br></div><span sty=
le=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helvetica,sans-serif,serif=
,EmojiFont;font-size:16px">Thank you for your time.</span>=C2=A0=C2=A0<br><=
/div>

--00000000000050790d05a13b0503--
