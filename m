Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA281FFD60
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 23:28:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nw5b4QB6zDr0k
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 07:28:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XmrH0mpG; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nw3N3S7VzDrL9
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 07:26:08 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id k4so6490348oik.2
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=dRr3bHnwQXxRBB3j0go+ubIE9akxqFex3kKGuROFmtU=;
 b=XmrH0mpG6Ngdnu5O0U4dVQxHijWsMov0iLcx/DfFBoC1ETP3xf1db2TnyAk5/mkKZ2
 TbqoudqWuufMorTNOCtZi2UBZtikbBXyGDhf/9evMvq7f4WQTuZB5mwMMT6klTUiGTvg
 LTX4QpYXoKmEOUoTKvEnNBkMieNFTsuRZq+urzQkPizCgIdKRdJ/qgOohGrSHiLKTDW9
 Aam5inLKXthvOBCdKKehTgiJGHVfMSP35X9d7gcOR2BtL4MvTY/wHlUNQyh+tBrpaedP
 YBA0GRe3KV2gG/XLHorCRm88emJDQwi4uG0JA0h7ErxxRrkMhsKqk4Rq3aJ84t7zjboQ
 cbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dRr3bHnwQXxRBB3j0go+ubIE9akxqFex3kKGuROFmtU=;
 b=KlC4lcHdpe1CAiMoQR7llTRwo3UTlnD7WKwUJDBjtxvRCqRbiaiO/3wDlLpmCxDiRk
 oQev5RKy+nF56VsTwYtsNoYdy4gBBmHWWVzIjgqHcyL7D8irQ9J03OQlsplZDkOlQUAR
 aJIz6qJ3tpuajDVQ5oUEco0hbHodvSpVY0YGgu4bGS+W5uQJpjEASJqiYW/lHaYTmZkA
 hNXxcYlxqTDKVqkiTjj0Vr/8lIeajCMAQJLANhpszOHSdv9WHhTiGHuFYUhgoy/kWpxH
 aJrc2GV3btZ6U2beMK97MJggZktiB627QrCQQt63Vl+AtKqZvIHPCBK+oZKrDF1m17qR
 me7g==
X-Gm-Message-State: AOAM532c7sc5PVsRQppJvWPFGvU2XCNboEMA6NHrI4Rtz48dfAlewNEw
 CM/ci+YO7OeGzBIdBRlT2CiJ03pIZ/RltEcD2iEsndGPWEM=
X-Google-Smtp-Source: ABdhPJzowbM7nBT0CL6j9b60pHIqT/TcC6V+ah/GsGzsPIkXjhn57pNEKksJ1C57Fo0wvW1qMTef3WTFZdi4Min6zGE=
X-Received: by 2002:a54:4e9a:: with SMTP id c26mr738786oiy.62.1592515565210;
 Thu, 18 Jun 2020 14:26:05 -0700 (PDT)
MIME-Version: 1.0
From: Alex Qiu <xqiu@google.com>
Date: Thu, 18 Jun 2020 14:25:54 -0700
Message-ID: <CAA_a9xJJn16M2p-wu7-cMsWK3+CEqMTccCg7uhWo1=MMbdxXpw@mail.gmail.com>
Subject: Feedback on Current OpenBMC and Proposing Some Improvements ----
 Difficulties and Issue Examples
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000090a6d505a8626c41"
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
Cc: gBMC Discussions <gbmc-discuss@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000090a6d505a8626c41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Splitted from main email thread "Feedback on Current OpenBMC and Proposing
Some Improvements")

Difficulties

The current architecture allows different JSON configuration files to be
loaded to represent varieties of FRUs and boards, however, the architecture
still emphasizes individual sensors internally, and there are no solid
concepts of individual FRUs and entities as a whole object in memory. This
data-driven architecture starts to cause difficulties on the implementation
when some sensors require specialized treatments according to requirement
of hardware platforms.

Due to having no place for code as control flow around the sensors or data
purely generated based on configuration files:

   1.

   When the current configuration format cannot express a hardware topology
   or topology discovery logic, a new schema is added case by case. This no=
t
   only causes burden to the configuration files themselves but also the
   configuration file parser. In practice, some code is often preferred to
   intervene around the hardware topology.
   2.

   It is hard for developers to debug against a certain hardware, as the
   developer has to filter the log for it based on various condition
   statements.
   3.

   It is hard for new developers to ramp up on debugging, because there is
   no symbol for developers to quickly look up and find the code related to
   one hardware or module to put debug statements.
   4.

   Unfortunately, debugging hardware issues occupy the life of BMC
   developers quite often, then debug codes are sometimes asked to be turne=
d
   into workarounds which will stay in the code base. The harder to debug, =
the
   even harder it is to put up an elegant workaround for hardware issues.
   5.

   If the OpenBMC framework does not provide enough flexibility to
   accommodate specialized code for specific requirements, they quickly bec=
ome
   downstream patches and technical debts, and they cause cost on maintenan=
ce
   as an open source software.

Issue Examples

In this section, I will describe issues that we=E2=80=99re facing with the =
existing
dynamic software stack, and they should all be well handled by
"Improvements".
Configuring device registers according to needs

For the context, related discussions can be found in the mailing list
archive
<https://lists.ozlabs.org/pipermail/openbmc/2020-January/020078.html>
=E2=80=9CConfiguring shunt_resistor in hwmon=E2=80=9D. Although we managed =
to properly
adjust the IPMI readouts using scales, we later realized that it would
still be better to configure it directly in hwmon sysfs. If we configure it
in hwmon, we can have the correct reading right from the bottom. On the
other hand, an implementation using the device tree is probably against the
idea of having the dynamic software stack to configure hardware only when
discovered.

Also, hardware engineers came up with requests to configure the voltage
regulator outputs, and from my understanding, this is not what hwmon sysfs
interface intended to do, and we needed that within a very short time
period. I had to use shell script to configure the device registers by
issuing raw I2C commands using i2ctools.

All these requirements ended up in shell scripts run as standalone services
aside from OpenBMC applications, which had their own hardware topology
discovery logic inside them. This may be redundant to what we do in the
dynamic software stack.
Handling special requirements and logics

As our hardware program progresses, we are maintaining more and more
patches in Yocto to apply upon entity-manager and dbus-sensors.

We had to replace some code logic due to various reasons, for example, we
found the existing 8-bit / 16-bit addressable EEPROM detection logic is not
stable enough, and we were left with 8-bit addressable EEPROMs with their
content corrupted in the first byte.


(Continuing to thread "Feedback on Current OpenBMC and Proposing Some
Improvements ---- "Improvements" Ideas")


- Alex Qiu

--00000000000090a6d505a8626c41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(Splitted=C2=A0from main email thread &quot;Feedback =
on Current OpenBMC and Proposing Some Improvements&quot;)</div><div><br></d=
iv><div><span style=3D"background-color:transparent;color:rgb(0,0,0);font-f=
amily:Arial;font-size:20pt;white-space:pre-wrap">Difficulties</span><br></d=
iv><div><span id=3D"gmail-docs-internal-guid-470c27a4-7fff-91bb-d765-70a5ac=
732c72"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">The current archit=
ecture allows different JSON configuration files to be loaded to represent =
varieties of FRUs and boards, however, the architecture still emphasizes in=
dividual sensors internally, and there are no solid concepts of individual =
FRUs and entities as a whole object in memory. This data-driven architectur=
e starts to cause difficulties on the implementation when some sensors requ=
ire specialized treatments according to requirement of hardware platforms.<=
/span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Due to havin=
g no place for code as control flow around the sensors or data purely gener=
ated based on configuration files:</span></p><ol style=3D"margin-top:0px;ma=
rgin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:decimal;font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">When the current configuration format can=
not express a hardware topology or topology discovery logic, a new schema i=
s added case by case. This not only causes burden to the configuration file=
s themselves but also the configuration file parser. In practice, some code=
 is often preferred to intervene around the hardware topology.</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:decimal;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">It is hard for developers to debug against a certain ha=
rdware, as the developer has to filter the log for it based on various cond=
ition statements.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
ecimal;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">It is hard for new develo=
pers to ramp up on debugging, because there is no symbol for developers to =
quickly look up and find the code related to one hardware or module to put =
debug statements.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
ecimal;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">Unfortunately, debugging =
hardware issues occupy the life of BMC developers quite often, then debug c=
odes are sometimes asked to be turned into workarounds which will stay in t=
he code base. The harder to debug, the even harder it is to put up an elega=
nt workaround for hardware issues.</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:decimal;font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">If the=
 OpenBMC framework does not provide enough flexibility to accommodate speci=
alized code for specific requirements, they quickly become downstream patch=
es and technical debts, and they cause cost on maintenance as an open sourc=
e software.</span></p></li></ol><h1 dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:20pt;margin-bottom:6pt"><span style=3D"font-size:20pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Issue Examples</span></h1><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">In this section, I will describe issues that we=E2=
=80=99re facing with the existing dynamic software stack, and they should a=
ll be well handled by &quot;Improvements&quot;.</span></p><h2 dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:18pt;margin-bottom:6pt"><span style=3D"=
font-size:16pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:400;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">Configuring device regist=
ers according to needs</span></h2><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">For the context, related discussions can be found in the </span><a =
href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-January/020078.html=
" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-fa=
mily:Arial;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;text-decoration-line:underline;vertical-align:basel=
ine;white-space:pre-wrap">mailing list archive</span></a><span style=3D"fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap"> =E2=80=9CConfiguring shunt_resistor in hwmo=
n=E2=80=9D. Although we managed to properly adjust the IPMI readouts using =
scales, we later realized that it would still be better to configure it dir=
ectly in hwmon sysfs. If we configure it in hwmon, we can have the correct =
reading right from the bottom. On the other hand, an implementation using t=
he device tree is probably against the idea of having the dynamic software =
stack to configure hardware only when discovered.</span></p><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Also, hardware engineers came up with=
 requests to configure the voltage regulator outputs, and from my understan=
ding, this is not what hwmon sysfs interface intended to do, and we needed =
that within a very short time period. I had to use shell script to configur=
e the device registers by issuing raw I2C commands using i2ctools.</span></=
p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">All these requiremen=
ts ended up in shell scripts run as standalone services aside from OpenBMC =
applications, which had their own hardware topology discovery logic inside =
them. This may be redundant to what we do in the dynamic software stack.</s=
pan></p></span></div><div><span id=3D"gmail-docs-internal-guid-6ef74ed1-7ff=
f-299c-aab0-533895e8949e"><h2 dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:18pt;margin-bottom:6pt"><span style=3D"font-size:16pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Handling special requirements and logics</span></h2><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">As our hardware program progres=
ses, we are maintaining more and more patches in Yocto to apply upon entity=
-manager and dbus-sensors.</span></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">We had to replace some code logic due to various reasons, fo=
r example, we found the existing 8-bit / 16-bit addressable EEPROM detectio=
n logic is not stable enough, and we were left with 8-bit addressable EEPRO=
Ms with their content corrupted in the first byte.</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap"><br></span></p><p style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">(Continuing to thread &quot;Feedback on Current OpenBMC and Pro=
posing Some Improvements ---- &quot;Improvements&quot; Ideas&quot;)</span><=
/p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><br></p></span></div><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></di=
v></div>

--00000000000090a6d505a8626c41--
