Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 363593A86B4
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 18:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Dbp5Yzxz3byq
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 02:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NV+oh9oH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NV+oh9oH; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4DbV5GFzz3btM
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 02:41:08 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so14914821otl.3
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=1XG4bDz8y2yMSHAUJ5cffZSMXkQcY2Y8iU9eHS07568=;
 b=NV+oh9oHOJwEYdkZ43UBySitNHrk/v+d2qtuzVEZsjNV6KqqrBZ4mRAO27WVUpMtW6
 l2yqQ5HOkMDolWRG25dafD/pqcq/oxu3G4hkAIBWxJrk1vUBaAZsQVLNAAfhYzNSLD2c
 lyBAgxc7DXHoVzXSKchVq/eU0o5wEz3/Yx1pNbreN9D4A1v4Ya8/TcFEs7A+4KM0emhR
 3Q2a+JECbPNwJFqPi6XVA9D3Q3nE3JQTs/sAVe28vZrgppc6uuW3gKd0Ht7lt+eZOeu7
 H8i3HWryVMq85Mu5KIXPCyx8ndz8W8qMc2bIiudBE6QC2CjmZF/ExJjMK1oOsLzN1pJk
 4W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=1XG4bDz8y2yMSHAUJ5cffZSMXkQcY2Y8iU9eHS07568=;
 b=T94caZ0KDrE7qOWeHVanSx0ppSi7o3LVglNbFs7D7gbhzu/Ld3IM8y1jikdK0A6KKB
 QRrYpB+7ZVpf+tpKEBxdsLPBZfOXtkvYfvtZbAPNPc4hAfuGHHRyTFplebjpUNWadPWC
 Qj7Q2FVK1NB0HBZuqFUWA3ganSoUyZhWvfWBbambhODJHfqP7cVAu4SJh51b9qsKodQz
 c5zgqciIlDjgWNKMOkCDw/pDjCkVWwI3zBSoRlOW9PC4quR2WXKLyvHUpiIx17xrhhPV
 N2iE+FiGDkjV8NGadQjAWdHcxX1k8dagVLsfZF3LJxIMqOlyRt3uxxNOl2kjzidrS79/
 lI0g==
X-Gm-Message-State: AOAM53054KqoGkv6eO9NT7iqZtvhrN9PuJ3AG//lrb7mgeAmoneIyE9C
 F0c/dmHcV8SDvg8CJrG8DdXj3I98Fmc=
X-Google-Smtp-Source: ABdhPJwv5qB75wuS4bpwp8PQPISQjRp1cn3xJSMYsP5Hcreq+IQZmgN5TTXstCve2FUTD0wjBrPklg==
X-Received: by 2002:a9d:3e8:: with SMTP id f95mr147259otf.53.1623775263059;
 Tue, 15 Jun 2021 09:41:03 -0700 (PDT)
Received: from smtpclient.apple ([2600:100e:b052:710b:f86c:b0df:1a62:dd73])
 by smtp.gmail.com with ESMTPSA id s2sm3831258oom.17.2021.06.15.09.41.02
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:41:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-AA1EFEC4-A607-47DE-A437-6BE528587D0A
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 15 Jun 2021 10:41:01 -0600
Subject: VR Fault Logs
Message-Id: <F872E1FF-CC21-40DC-9A90-CC55F91AB8FC@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: iPad Mail (18F72)
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


--Apple-Mail-AA1EFEC4-A607-47DE-A437-6BE528587D0A
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99m working on adding fault log capabilities to ltc2978.c driver whi=
ch covers ADI=E2=80=99s family of PMBus VR controllers and sequencer/manager=
s.

These parts have a blackbox fault log that triggers on over current and many=
 other hardware problems. End users use this information for remote diagnosi=
s.

Putting aside whether or not this should have a standard hwmon interface or n=
ot, for now I added debugfs nodes to this driver to test functionality.

What I want to discuss is use model, as it would apply to obmc if exposed th=
rough a redfish api.

As it works now, the log is fetched like this:

cat /sys/kernel/debug/pmbus/hwmon1/raw_data > /tmp/ltc2974.raw

This creates a raw binary file of the log.

To interpret the log, hexdump it like:

hexdump -ve '"%07.7_ax  " 16/1 "%02x " "\n"' /tmp/ltc2974.raw

This creates the following text:

0000000  18 00 00 00 00 00 00 00 00 ff ff 27 db 0c db 4e
0000010  80 41 80 f0 c2 ff 7b 00 00 ff ff 27 db 1e db 0f
0000020  80 02 80 00 00 ff ff 27 db 22 db f0 81 ee 80 00
0000030  00 ff ff 2b db 22 db 47 81 bd 87 00 00 00 00 00
0000040  00 00 00 00 00 00 00 00 db 22 00 00 00 00 00 08
0000050  c2 ef 80 00 80 4b 00 00 db 22 00 00 00 00 db 06
0000060  80 00 80 51 00 00 db 27 00 00 00 00 80 00 81 a0
0000070  00 00 db 22 00 00 00 00 80 00 80 04 00 00 db 22
0000080  00 00 00 00 00 08 c2 f0 80 00 80 41 00 00 db 22
0000090  00 00 00 00 db 05 80 00 80 a8 00 00 db 27 00 00
00000a0  00 00 80 00 81 0b 00 00 db 22 00 00 00 00 80 00
00000b0  80 06 00 00 db 22 00 00 00 00 00 08 c2 ef 80 00
00000c0  80 43 00 00 db 22 00 00 00 00 db 05 80 00 80 0e
00000d0  00 00 db 27 00 00 00 00 80 00 81 72 00 00 db 22
00000e0  00 00 00 00 80 00 80 06 00 00 db 22 00 00 00 00
00000f0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Use this tool to decode:

http://pmbus.analogplayground.com/fault

For example:

http://pmbus.analogplayground.com/fault?_hasdata=3D&f1=3D10&f2=3D2&f3=3D0000=
000++18+00+00+00+00+00+00+00+00+ff+ff+27+db+0c+db+4e%0D%0A0000010++80+41+80+=
f0+c2+ff+7b+00+00+ff+ff+27+db+1e+db+0f%0D%0A0000020++80+02+80+00+00+ff+ff+27=
+db+22+db+f0+81+ee+80+00%0D%0A0000030++00+ff+ff+2b+db+22+db+47+81+bd+87+00+0=
0+00+00+00%0D%0A0000040++00+00+00+00+00+00+00+00+db+22+00+00+00+00+00+08%0D%=
0A0000050++c2+ef+80+00+80+4b+00+00+db+22+00+00+00+00+db+06%0D%0A0000060++80+=
00+80+51+00+00+db+27+00+00+00+00+80+00+81+a0%0D%0A0000070++00+00+db+22+00+00=
+00+00+80+00+80+04+00+00+db+22%0D%0A0000080++00+00+00+00+00+08+c2+f0+80+00+8=
0+41+00+00+db+22%0D%0A0000090++00+00+00+00+db+05+80+00+80+a8+00+00+db+27+00+=
00%0D%0A00000a0++00+00+80+00+81+0b+00+00+db+22+00+00+00+00+80+00%0D%0A00000b=
0++80+06+00+00+db+22+00+00+00+00+00+08+c2+ef+80+00%0D%0A00000c0++80+43+00+00=
+db+22+00+00+00+00+db+05+80+00+80+0e%0D%0A00000d0++00+00+db+27+00+00+00+00+8=
0+00+81+72+00+00+db+22%0D%0A00000e0++00+00+00+00+80+00+80+06+00+00+db+22+00+=
00+00+00%0D%0A00000f0++00+00+00+00+00+00+00+00+00+00+00+00+00+00+00


Press that url and see the decoded data.

Obmc could call this tool for decoding, or built into obmc. However, every v=
endor has it=E2=80=99s own proprietary formats.

I=E2=80=99m looking for feedback on this model of a driver as it relates to o=
bmc integration. Is there a better model?

You can comment on usefulness if you want, but my interest is more on integr=
ation. I have customers that would use this, if they design in this family o=
f parts. They use it to day in their proprietary BMCs.

Mike
=20

Sent from my iPad=

--Apple-Mail-AA1EFEC4-A607-47DE-A437-6BE528587D0A
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>Hi,</div><div><br></div><div>I=E2=80=99=
m working on adding fault log capabilities to ltc2978.c driver which covers A=
DI=E2=80=99s family of PMBus VR controllers and sequencer/managers.</div><di=
v><br></div><div>These parts have a blackbox fault log that triggers on over=
 current and many other hardware problems. End users use this information fo=
r remote diagnosis.</div><div><br></div><div>Putting aside whether or not th=
is should have a standard hwmon interface or not, for now I added debugfs no=
des to this driver to test functionality.</div><div><br></div><div>What I wa=
nt to discuss is use model, as it would apply to obmc if exposed through a r=
edfish api.</div><div><br></div><div>As it works now, the log is fetched lik=
e this:</div><div><br></div><div><span style=3D"font-family: Calibri, sans-s=
erif; font-size: 14.666666984558105px; -webkit-text-size-adjust: auto;">cat /=
sys/kernel/debug/pmbus/hwmon1/raw_data &gt; /tmp/ltc2974.raw</span></div><di=
v><br></div><div>This creates a raw binary file of the log.</div><div><br></=
div><div>To interpret the log, hexdump it like:</div><div><br></div><div><sp=
an style=3D"font-family: Calibri, sans-serif; font-size: 14.666666984558105p=
x; -webkit-text-size-adjust: auto;">hexdump -ve '"%07.7_ax&nbsp; "</span><sp=
an style=3D"font-family: Calibri, sans-serif; font-size: 14.666666984558105p=
x; -webkit-text-size-adjust: auto;">&nbsp;</span><span dir=3D"ltr" style=3D"=
font-family: Calibri, sans-serif; font-size: 14.666666984558105px; -webkit-t=
ext-size-adjust: auto;">16/1</span><span style=3D"font-family: Calibri, sans=
-serif; font-size: 14.666666984558105px; -webkit-text-size-adjust: auto;">&n=
bsp;"%02x " "\n"' /tmp/ltc2974.raw</span></div><div><span style=3D"font-fami=
ly: Calibri, sans-serif; font-size: 14.666666984558105px; -webkit-text-size-=
adjust: auto;"><br></span></div><div><span style=3D"font-family: Calibri, sa=
ns-serif; font-size: 14.666666984558105px; -webkit-text-size-adjust: auto;">=
This creates the following text:</span></div><div><br></div><p class=3D"MsoN=
ormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt=
; font-family: Calibri, sans-serif;">0000000&nbsp;&nbsp;<span dir=3D"ltr">18=
 00 00 00 00 00 00</span>&nbsp;00 00 ff ff 27 db 0c db 4e<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; fon=
t-size: 11pt; font-family: Calibri, sans-serif;">0000010&nbsp; 80 41 80 f0 c=
2 ff 7b 00 00 ff ff 27 db 1e db 0f<o:p></o:p></p><p class=3D"MsoNormal" styl=
e=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fami=
ly: Calibri, sans-serif;">0000020&nbsp;&nbsp;<span dir=3D"ltr">80 02 80 00 0=
0</span>&nbsp;ff ff 27 db 22 db f0 81 ee 80 00<o:p></o:p></p><p class=3D"Mso=
Normal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11p=
t; font-family: Calibri, sans-serif;">0000030&nbsp; 00 ff ff 2b db 22 db 47 8=
1 bd&nbsp;<span dir=3D"ltr">87 00 00 00 00 00</span><o:p></o:p></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size:=
 11pt; font-family: Calibri, sans-serif;">0000040&nbsp;&nbsp;<span dir=3D"lt=
r">00 00 00 00 00 00 00</span>&nbsp;00 db&nbsp;<span dir=3D"ltr">22 00 00 00=
 00 00 08</span><o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-=
size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-=
serif;">0000050&nbsp; c2 ef 80 00 80 4b 00 00 db&nbsp;<span dir=3D"ltr">22 0=
0 00 00 00</span>&nbsp;db 06<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-=
webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Ca=
libri, sans-serif;">0000060&nbsp;&nbsp;<span dir=3D"ltr">80 00 80 51 00 00</=
span>&nbsp;db&nbsp;<span dir=3D"ltr">27 00 00 00 00 80 00</span>&nbsp;81 a0<=
o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">0000070&n=
bsp; 00 00 db&nbsp;<span dir=3D"ltr">22 00 00 00 00 80 00</span>&nbsp;80 04 0=
0 00 db 22<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-a=
djust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;=
">0000080&nbsp;&nbsp;<span dir=3D"ltr">00 00 00 00 00 08</span>&nbsp;c2 f0&n=
bsp;<span dir=3D"ltr">80 00 80 41 00 00</span>&nbsp;db 22<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; fon=
t-size: 11pt; font-family: Calibri, sans-serif;">0000090&nbsp;&nbsp;<span di=
r=3D"ltr">00 00 00 00</span>&nbsp;db&nbsp;<span dir=3D"ltr">05 80 00 80</spa=
n>&nbsp;a8 00 00 db 27 00 00<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-=
webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Ca=
libri, sans-serif;">00000a0&nbsp;&nbsp;<span dir=3D"ltr">00 00 80 00 81</spa=
n>&nbsp;0b 00 00 db&nbsp;<span dir=3D"ltr">22 00 00 00 00 80 00</span><o:p><=
/o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; mar=
gin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">00000b0&nbsp;&=
nbsp;<span dir=3D"ltr">80 06 00 00</span>&nbsp;db&nbsp;<span dir=3D"ltr">22 0=
0 00 00 00 00 08</span>&nbsp;c2 ef 80 00<o:p></o:p></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; fon=
t-family: Calibri, sans-serif;">00000c0&nbsp;&nbsp;<span dir=3D"ltr">80 43 0=
0 00</span>&nbsp;db&nbsp;<span dir=3D"ltr">22 00 00 00 00</span>&nbsp;db&nbs=
p;<span dir=3D"ltr">05 80 00 80</span>&nbsp;0e<o:p></o:p></p><p class=3D"Mso=
Normal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11p=
t; font-family: Calibri, sans-serif;">00000d0&nbsp; 00 00 db&nbsp;<span dir=3D=
"ltr">27 00 00 00 00 80 00</span>&nbsp;81 72 00 00 db 22<o:p></o:p></p><p cl=
ass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font=
-size: 11pt; font-family: Calibri, sans-serif;">00000e0&nbsp;&nbsp;<span dir=
=3D"ltr">00 00 00 00 80 00 80</span>&nbsp;06 00 00 db&nbsp;<span dir=3D"ltr"=
>22 00 00 00 00</span><o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit=
-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri,=
 sans-serif;">00000f0&nbsp;&nbsp;<span dir=3D"ltr">00 00 00 00 00 00 00</spa=
n>&nbsp;<span dir=3D"ltr">00 00 00 00 00 00 00</span>&nbsp;00<o:p></o:p></p>=
<p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in;=
 font-size: 11pt; font-family: Calibri, sans-serif;"><br></p><p class=3D"Mso=
Normal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11p=
t; font-family: Calibri, sans-serif;">Use this tool to decode:</p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size:=
 11pt; font-family: Calibri, sans-serif;"><br></p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;"><a href=3D"http://pmbus.analogplayground.com/faul=
t">http://pmbus.analogplayground.com/fault</a></p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;"><br></p><p class=3D"MsoNormal" style=3D"-webkit-t=
ext-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, s=
ans-serif;">For example:</p><p class=3D"MsoNormal" style=3D"-webkit-text-siz=
e-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-ser=
if;"><br></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto;=
 margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><a href=3D=
"http://pmbus.analogplayground.com/fault?_hasdata=3D&amp;f1=3D10&amp;f2=3D2&=
amp;f3=3D0000000++18+00+00+00+00+00+00+00+00+ff+ff+27+db+0c+db+4e%0D%0A00000=
10++80+41+80+f0+c2+ff+7b+00+00+ff+ff+27+db+1e+db+0f%0D%0A0000020++80+02+80+0=
0+00+ff+ff+27+db+22+db+f0+81+ee+80+00%0D%0A0000030++00+ff+ff+2b+db+22+db+47+=
81+bd+87+00+00+00+00+00%0D%0A0000040++00+00+00+00+00+00+00+00+db+22+00+00+00=
+00+00+08%0D%0A0000050++c2+ef+80+00+80+4b+00+00+db+22+00+00+00+00+db+06%0D%0=
A0000060++80+00+80+51+00+00+db+27+00+00+00+00+80+00+81+a0%0D%0A0000070++00+0=
0+db+22+00+00+00+00+80+00+80+04+00+00+db+22%0D%0A0000080++00+00+00+00+00+08+=
c2+f0+80+00+80+41+00+00+db+22%0D%0A0000090++00+00+00+00+db+05+80+00+80+a8+00=
+00+db+27+00+00%0D%0A00000a0++00+00+80+00+81+0b+00+00+db+22+00+00+00+00+80+0=
0%0D%0A00000b0++80+06+00+00+db+22+00+00+00+00+00+08+c2+ef+80+00%0D%0A00000c0=
++80+43+00+00+db+22+00+00+00+00+db+05+80+00+80+0e%0D%0A00000d0++00+00+db+27+=
00+00+00+00+80+00+81+72+00+00+db+22%0D%0A00000e0++00+00+00+00+80+00+80+06+00=
+00+db+22+00+00+00+00%0D%0A00000f0++00+00+00+00+00+00+00+00+00+00+00+00+00+0=
0+00">http://pmbus.analogplayground.com/fault?_hasdata=3D&amp;f1=3D10&amp;f2=
=3D2&amp;f3=3D0000000++18+00+00+00+00+00+00+00+00+ff+ff+27+db+0c+db+4e%0D%0A=
0000010++80+41+80+f0+c2+ff+7b+00+00+ff+ff+27+db+1e+db+0f%0D%0A0000020++80+02=
+80+00+00+ff+ff+27+db+22+db+f0+81+ee+80+00%0D%0A0000030++00+ff+ff+2b+db+22+d=
b+47+81+bd+87+00+00+00+00+00%0D%0A0000040++00+00+00+00+00+00+00+00+db+22+00+=
00+00+00+00+08%0D%0A0000050++c2+ef+80+00+80+4b+00+00+db+22+00+00+00+00+db+06=
%0D%0A0000060++80+00+80+51+00+00+db+27+00+00+00+00+80+00+81+a0%0D%0A0000070+=
+00+00+db+22+00+00+00+00+80+00+80+04+00+00+db+22%0D%0A0000080++00+00+00+00+0=
0+08+c2+f0+80+00+80+41+00+00+db+22%0D%0A0000090++00+00+00+00+db+05+80+00+80+=
a8+00+00+db+27+00+00%0D%0A00000a0++00+00+80+00+81+0b+00+00+db+22+00+00+00+00=
+80+00%0D%0A00000b0++80+06+00+00+db+22+00+00+00+00+00+08+c2+ef+80+00%0D%0A00=
000c0++80+43+00+00+db+22+00+00+00+00+db+05+80+00+80+0e%0D%0A00000d0++00+00+d=
b+27+00+00+00+00+80+00+81+72+00+00+db+22%0D%0A00000e0++00+00+00+00+80+00+80+=
06+00+00+db+22+00+00+00+00%0D%0A00000f0++00+00+00+00+00+00+00+00+00+00+00+00=
+00+00+00</a></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><br></=
p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0i=
n; font-size: 11pt; font-family: Calibri, sans-serif;"><br></p><p class=3D"M=
soNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 1=
1pt; font-family: Calibri, sans-serif;">Press that url and see the decoded d=
ata.</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; marg=
in: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><br></p><p clas=
s=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-s=
ize: 11pt; font-family: Calibri, sans-serif;">Obmc could call this tool for d=
ecoding, or built into obmc. However, every vendor has it=E2=80=99s own prop=
rietary formats.</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust=
: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><br=
></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin:=
 0in; font-size: 11pt; font-family: Calibri, sans-serif;">I=E2=80=99m lookin=
g for feedback on this model of a driver as it relates to obmc integration. I=
s there a better model?</p><p class=3D"MsoNormal" style=3D"-webkit-text-size=
-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-seri=
f;"><br></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">You can comm=
ent on usefulness if you want, but my interest is more on integration. I hav=
e customers that would use this, if they design in this family of parts. The=
y use it to day in their proprietary BMCs.</p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;"><br></p><p class=3D"MsoNormal" style=3D"-webkit-text-si=
ze-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-se=
rif;">Mike</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbs=
p;</o:p></p><br><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: au=
to; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Sent fr=
om my iPad</p></body></html>=

--Apple-Mail-AA1EFEC4-A607-47DE-A437-6BE528587D0A--
