Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F246049BE4A
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 23:15:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk1QF6LdSz3bZL
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 09:15:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FyA4vq8/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FyA4vq8/; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jk1Pr0NsHz3002
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 09:15:27 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id y23so15606769oia.13
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 14:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=fGkAvqBatixHSgiCSE4ZRABRCj7otwMF5ZjLLe/60K4=;
 b=FyA4vq8/pBpb1Qw23xfekfitqFNapWm2MEHUcEhnB6AoEbLErEJEsA1hvIaWQSTK0w
 ygAIjQLlZ/u0rhXwa74lnB4UNuT9k2881mkMG0tsUEDUUO3kMnZ9Bhxx5C10FNpWdhkT
 f4F2XKz4XTA9+t14LUSuRMdimWzkWrfCgV+t93uJXIbfkIaUlMebs5+S5lZxxg51DbAg
 MHBiw7HQ+7Sd840XjbwN32UbA8hbl5axqe5if5CvGe43vJqJOZMZbKzNcoTnR7roi0P1
 Vt0oAW6s6t90UyJgSSV4IxIw5y7rLH99SUIZNhDld3T8+6VzwE87Q5DaQZbIa4PhxyNv
 KOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=fGkAvqBatixHSgiCSE4ZRABRCj7otwMF5ZjLLe/60K4=;
 b=6MD1HCWLU7H82qzTFHk9m+6y+NWwq0g27N+xQWxO7lUrMAgQS2fIlzbLu4HH60UhrQ
 5G/9zY+39bcsEUcTVmcOjwyBlUQxiG2nkcL7bm1XybkNL7noItkhKSp4Jr5ui9C3jUdW
 mZM9d+XEgBUlt53C5+VtE26+CP+fhoYmw6ppGv2N12zxqQ0m0vrYxKwKifKQjFAq0Avl
 dWAupJuz+/dRVX66fUsvCYXQ8dsEOq3pgpMtTi4wHwJwgQ8LzEMnziH5vfClzX0TiJnt
 5HOWI1muMtPe3lTfnXIIGnnBh29VPF1cKjbWsmMp/RGJHwWPbtA83Wy+5d7QBHOgFwJC
 KhKg==
X-Gm-Message-State: AOAM532bxb8EzZJN3Jsfdn66UqB1xctGYCvI5v5RTtcH1DqI09gmVGB8
 a/SmNUApJzL/j9pL3TbmUNAmdcVmcEWI6A==
X-Google-Smtp-Source: ABdhPJzKGJw0itRImzBW7tZB4FX9rlAysB52G3zVMi1fhynby/bEe+Hj8rpp3zIfIR8mHt80dOcm0A==
X-Received: by 2002:a05:6808:10c6:: with SMTP id
 s6mr1964405ois.321.1643148922170; 
 Tue, 25 Jan 2022 14:15:22 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b060:df6a:e1c2:78c2:49ec:71a5])
 by smtp.gmail.com with ESMTPSA id bq9sm8663873oib.28.2022.01.25.14.15.20
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 14:15:21 -0800 (PST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-E61133CC-DDF2-4AE9-A810-5D039A5BC2D2
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 25 Jan 2022 15:15:19 -0700
Subject: No dbus objects for phosphor-regulators
Message-Id: <8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: iPad Mail (19C56)
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


--Apple-Mail-E61133CC-DDF2-4AE9-A810-5D039A5BC2D2
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,
=20
I need some help getting phosphor-power/phosphor-regulators to add dbus obje=
cts.
=20
I made a config file below, and verified that it is on the target and loads w=
ithout error.
=20
When the target boots, using a I2C spy tool, the 0xDD command is being read p=
eriodically, suggesting that this service is processing the read command, an=
d a query show the service is up.
=20
Using dbus-monitor =E2=80=93system, I do not see any transactions that place=
 these sensor read values on dbus, nor does the normal probing the chassis a=
nd inventory show values.
=20
My bbappend is shown below, it is simple, but I wonder what is missing.
=20
What else do I need to so that there are dbus objects?
=20
Note I have not done anything to intentionally use open_power. My goal is to=
 only use phosphor-regulators to expose some telemetry that hwmon does not s=
upport.
=20
Mike
=20
*************** phosphor-power_%.bbappend ************
=20
FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
inherit obmc-phosphor-systemd
=20
SRC_URI +=3D file://config.json
do_install:append(){
    install -D ${WORKDIR}/config.json ${D}${datadir}/phosphor-regulators/con=
fig.json
}
FILES:${PN} +=3D "${datadir}/phosphor-regulators/config.json"
=20
************* config file ****************
=20
{
  "comments": [ "Config file for a ADI one-chassis system" ],
=20
  "rules": [
    {
      "comments": [ "Sets output voltage for a PMBus regulator rail" ],
      "id": "set_voltage_rule",
      "actions": [
        {
          "pmbus_write_vout_command": {
            "format": "linear"
          }
        }
      ]
    },
=20
    {
      "comments": [ "Reads sensors from a PMBus regulator rail" ],
      "id": "read_sensors_rule",
      "actions": [
        {
          "comments": [ "Read output voltage from READ_VOUT." ],
          "pmbus_read_sensor": {
            "type": "vout",
            "command": "0xDD",
            "format": "linear_16"
          }
        }
      ]
    }
  ],
=20
  "chassis": [
    {
      "comments": [ "Chassis number 1 containing CPUs and memory" ],
      "number": 1,
      "inventory_path": "system/chassis",
      "devices": [
        {
          "comments": [ "LTC3888 regulator producing the Vdd rail" ],
          "id": "vdd_regulator",
          "is_regulator": true,
          "fru": "system/chassis/motherboard/regulator1",
          "i2c_interface": {
            "bus": 11,
            "address": "0x4f"
          },
          "rails": [
            {
              "comments": [ "Vdd rail" ],
              "id": "vdd",
              "configuration": {
                "volts": 1.10,
                "rule_id": "set_voltage_rule"
              },
              "sensor_monitoring": {
                "rule_id": "read_sensors_rule"
              }
            }
          ]
        }
      ]
    }
  ]
}
=20
Mike

Sent from my iPad=

--Apple-Mail-E61133CC-DDF2-4AE9-A810-5D039A5BC2D2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><p class=3D"MsoNormal" style=3D"-webkit-tex=
t-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, san=
s-serif;">Hi,<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-siz=
e-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-ser=
if;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-=
adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif=
;">I need some help getting phosphor-power/phosphor-regulators to add dbus o=
bjects.<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><=
o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust=
: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">I m=
ade a config file below, and verified that it is on the target and loads wit=
hout error.<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-=
adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif=
;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-ad=
just: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"=
>When the target boots, using a I2C spy tool, the 0xDD command is being read=
 periodically, suggesting that this service is processing the read command, a=
nd a query show the service is up.<o:p></o:p></p><p class=3D"MsoNormal" styl=
e=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fami=
ly: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;">Using dbus-monitor =E2=80=93system, I do not see any tr=
ansactions that place these sensor read values on dbus, nor does the normal p=
robing the chassis and inventory show values.<o:p></o:p></p><p class=3D"MsoN=
ormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt=
; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNor=
mal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">My bbappend is shown below, it is simple, b=
ut I wonder what is missing.<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-=
webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Ca=
libri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Cali=
bri, sans-serif;">What else do I need to so that there are dbus objects?<o:p=
></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;<=
/o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; mar=
gin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Note I have no=
t done anything to intentionally use open_power. My goal is to only use phos=
phor-regulators to expose some telemetry that hwmon does not support.<o:p></=
o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; marg=
in: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:=
p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin=
: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Mike<o:p></o:p></=
p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0i=
n; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p>=
<p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in;=
 font-size: 11pt; font-family: Calibri, sans-serif;">*************** phospho=
r-power_%.bbappend ************<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-w=
ebkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Cal=
ibri, sans-serif;">FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"<o:p></o:=
p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin=
: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p>=
</p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0=
in; font-size: 11pt; font-family: Calibri, sans-serif;">inherit obmc-phospho=
r-systemd<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-ad=
just: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"=
><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">S=
RC_URI +=3D&nbsp;<a href=3D"file://config.json/" style=3D"color: rgb(5, 99, 1=
93);">file://config.json</a><o:p></o:p></p><p class=3D"MsoNormal" style=3D"-=
webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Ca=
libri, sans-serif;">do_install:append(){<o:p></o:p></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; fon=
t-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp; install -D ${WORKDIR}/con=
fig.json ${D}${datadir}/phosphor-regulators/config.json<o:p></o:p></p><p cla=
ss=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-=
size: 11pt; font-family: Calibri, sans-serif;">}<o:p></o:p></p><p class=3D"M=
soNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 1=
1pt; font-family: Calibri, sans-serif;">FILES:${PN} +=3D "${datadir}/phospho=
r-regulators/config.json"<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-web=
kit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calib=
ri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-webki=
t-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri=
, sans-serif;">************* config file ****************<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; fon=
t-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p cla=
ss=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-=
size: 11pt; font-family: Calibri, sans-serif;">{<o:p></o:p></p><p class=3D"M=
soNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 1=
1pt; font-family: Calibri, sans-serif;">&nbsp; "comments": [ "Config file fo=
r a ADI one-chassis system" ],<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"-w=
ebkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Cal=
ibri, sans-serif;">&nbsp; "rules": [<o:p></o:p></p><p class=3D"MsoNormal" st=
yle=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fa=
mily: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp; {<o:p></o:p></p><p class=3D"M=
soNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 1=
1pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "comm=
ents": [ "Sets output voltage for a PMBus regulator rail" ],<o:p></o:p></p><=
p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; f=
ont-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; "id": "set_voltage_rule",<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "actions": [<o:p></o:p><=
/p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0=
in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webk=
it-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibr=
i, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "pmbu=
s_write_vout_command": {<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webk=
it-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibr=
i, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; "format": "linear"<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-web=
kit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calib=
ri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:=
p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<o:p></o:p></p><p class=
=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-si=
ze: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp; },<o:p></o:p=
></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin:=
 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p>&nbsp;</o:p><=
/p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0=
in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp; {=
<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: aut=
o; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; "comments": [ "Reads sensors from a PMBus regulator r=
ail" ],<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "id": "read_sensors_rule",<o:p></o:p></p><p cl=
ass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font=
-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; "actions": [<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-s=
ize-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-s=
erif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p><p class=3D=
"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size:=
 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; "comments": [ "Read output voltage from READ_VOUT." ],<=
o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto=
; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "pmbus_read_sensor": {<o:p></o=
:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margi=
n: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "type": "vout",<o:p></o:p=
></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin:=
 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "command": "0xDD",<o:p></o:=
p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin=
: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "format": "linear_16"<o:p>=
</o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; ma=
rgin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p><p class=3D"MsoNor=
mal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 }<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ]<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-we=
bkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Cali=
bri, sans-serif;">&nbsp;&nbsp;&nbsp; }<o:p></o:p></p><p class=3D"MsoNormal" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-f=
amily: Calibri, sans-serif;">&nbsp; ],<o:p></o:p></p><p class=3D"MsoNormal" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-f=
amily: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" sty=
le=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-fam=
ily: Calibri, sans-serif;">&nbsp; "chassis": [<o:p></o:p></p><p class=3D"Mso=
Normal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11p=
t; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp; {<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; fon=
t-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; "comments": [ "Chassis number 1 containing CPUs and memory" ],<o:p></o:p=
></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin:=
 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; "number": 1,<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-web=
kit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calib=
ri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "inventory_path": "system/ch=
assis",<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adju=
st: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "devices": [<o:p></o:p></p><p class=3D"MsoNorm=
al" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 {<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: a=
uto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "comments": [ "LTC3888 regu=
lator producing the Vdd rail" ],<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "=
id": "vdd_regulator",<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-=
text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, s=
ans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "is_regul=
ator": true,<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size=
-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-seri=
f;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "fru": "system/ch=
assis/motherboard/regulator1",<o:p></o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "=
i2c_interface": {<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text=
-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans=
-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "=
bus": 11,<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-ad=
just: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "address=
": "0x4f"<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-ad=
just: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p><p c=
lass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; fon=
t-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; "rails": [<o:p></o:p></p><p class=3D"MsoNormal" s=
tyle=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-f=
amily: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-=
text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, s=
ans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; "comments": [ "Vdd rail" ],<o:p></o:p></p><p class=3D"MsoNorm=
al" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "id": "vdd",<o:p></o:p></p><p class=3D"=
MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 1=
1pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "configuration": {<o:p></o:p></p>=
<p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in;=
 font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "volts":=
 1.10,<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjus=
t: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; "rule_id": "set_voltage_rule"<o:p></o:p></p><p class=3D"MsoNorm=
al" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; f=
ont-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p><p class=3D"MsoNormal"=
 style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font=
-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "sensor_monitoring": {<o:p></o:p></p><p cl=
ass=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font=
-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "rule_id": "r=
ead_sensors_rule"<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text=
-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans=
-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;}<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-siz=
e-adjust: auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-ser=
if;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:=
p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto; m=
argin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<o:p></o:p></p><p class=3D"MsoNo=
rmal" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt;=
 font-family: Calibri, sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; }<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust:=
 auto; margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; ]<o:p></o:p></p><p class=3D"MsoNormal" style=3D"-=
webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: Ca=
libri, sans-serif;">&nbsp;&nbsp;&nbsp; }<o:p></o:p></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; fon=
t-family: Calibri, sans-serif;">&nbsp; ]<o:p></o:p></p><p class=3D"MsoNormal=
" style=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; fon=
t-family: Calibri, sans-serif;">}<o:p></o:p></p><p class=3D"MsoNormal" style=
=3D"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-famil=
y: Calibri, sans-serif;"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D=
"-webkit-text-size-adjust: auto; margin: 0in; font-size: 11pt; font-family: C=
alibri, sans-serif;"><o:p>Mike</o:p></p><br><div dir=3D"ltr">Sent from my iP=
ad</div></body></html>=

--Apple-Mail-E61133CC-DDF2-4AE9-A810-5D039A5BC2D2--
