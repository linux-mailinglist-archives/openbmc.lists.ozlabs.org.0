Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CD42BB1A
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 11:06:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTmqV576vz2yms
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 20:06:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KcrDcV+Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=wh800805@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KcrDcV+Z; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTmq16Rzmz2yHJ
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 20:06:05 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id f5so1672730pgc.12
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 02:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=zk52p6Rw6nFkV0bpvb/jVf0R5FkNRmlkAVZcEsL4Xns=;
 b=KcrDcV+ZQ2rqHO8RNdDUaD/TnllrgzcT2eEqXbL325A+0L/OVRCcLjl0jYn4t1Qtjt
 ovs74mdmQ1ZJdRiWJN8uQ23FJ8NZox8JU8j16N/1mWmIbCdzAxJkCF88u0IqWfHpsB14
 5v3R4YYbc5A6g0BX+bLL6tDQxf7wK8OZiXeBeTuf2M/emClr/ktmvZN+izgttNMUzFxg
 lKbGYLj/C6Nxe0GNImA3yfFNakyMJjlsKTB5LWI3ikwpdOYpYIUs4+cIOTf6IsU7n63S
 FtOo23L+RP7Ye643eX1AXXW9/xWQq4b5MRX3As2Tt6qVULq1RvHfItR5oGtkALm3v/QW
 B3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=zk52p6Rw6nFkV0bpvb/jVf0R5FkNRmlkAVZcEsL4Xns=;
 b=zuGkfPg6UGfEnIHVbJWDAtsPC+VPjkEa4YYGuLcCprrxPH462sFYhamwSZ65YD2WWL
 KeRmqextZjj4gzrCZ/i+JG+0c9SXXVt00xNuJb6RjdD8z7Anr+37uqSdetLBNvRu8Gg6
 G7drik6F8in/nlMqkNcwFuu2cJkXR7bYrydhbJMyIk6GxNcaH+W3yA1rMa88bc27rCi6
 x6LdXeJ8xCAo9+iKYD0eQK7r1yfJdcUvZ35WMFACslqY3Nj6utm6SoBt8U/1jSQHo1Yj
 nZY0iQCbTgcRutxLHTNEGJkJRl68nOV9hbUIBojdh7MeGXWsBPXLVmCMzh97kp4v7XxQ
 tIyg==
X-Gm-Message-State: AOAM532YPtkYZrHd9pCIrKtGws3ykKU2hk2FMz/AtLh6IaeHR4tSNFKV
 UPX2WULAgf35vibNzmIODw==
X-Google-Smtp-Source: ABdhPJwQko4cyTftCoOPMZEGVPCXLqPK7Sb8ESnF7kXCeeosMItyq/me3OtKSiavsfDRlW8TGiIIdw==
X-Received: by 2002:a63:3c5c:: with SMTP id i28mr24160085pgn.442.1634115961738; 
 Wed, 13 Oct 2021 02:06:01 -0700 (PDT)
Received: from smtpclient.apple (220-128-110-82.hinet-ip.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id t3sm13568391pfb.100.2021.10.13.02.06.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 02:06:01 -0700 (PDT)
From: =?utf-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>
Message-Id: <A93AF288-7A59-4D57-993E-5C96AF8723BC@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_76BD4B77-CF72-4B53-8A11-0699EF8A01A7"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Ipmitool command & entity-manager question
Date: Wed, 13 Oct 2021 17:05:58 +0800
In-Reply-To: <99511633084704@mail.yandex-team.ru>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
References: <42F9352C-E5A9-4A02-B877-95E8419EB3BE@gmail.com>
 <27ffb02323b8be39e1e92b37fc3cdc35857312b8.camel@yadro.com>
 <2BD99E33-F582-46C5-855F-942532F79FCC@gmail.com>
 <5072b23d-8165-19a4-f0e8-946a31e22285@intel.com>
 <030C0FA0-812D-4D8D-8C41-5DBD64629523@gmail.com>
 <99511633084704@mail.yandex-team.ru>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Andrei Kartashev <a.kartashev@yadro.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_76BD4B77-CF72-4B53-8A11-0699EF8A01A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Konstantin

I already fixed. I install module rsyslog and the SEL log will show when =
I run ipmitool.

Thanks for your help!

BR
Paul

> Konstantin Klubnichkin <kitsok@yandex-team.ru> =E6=96=BC =
2021=E5=B9=B410=E6=9C=881=E6=97=A5 =E4=B8=8B=E5=8D=886:41 =E5=AF=AB=E9=81=93=
=EF=BC=9A
>=20
> Hello Paul
> =20
> We don't have this in our config files.
> =20
> Instead we use phosphor-sel-logger  (included using =
IMAGE_INSTALL_append variable in machine config).
> =20
> In my bbappend file for phosphor-sel-logger there are following =
features enabled:
> #Enable threshold monitoring
> EXTRA_OECMAKE +=3D "-DSEL_LOGGER_MONITOR_THRESHOLD_EVENTS=3DON"
> EXTRA_OECMAKE +=3D "-DREDFISH_LOG_MONITOR_PULSE_EVENTS=3DON"
> =20
> =20
> 01.10.2021, 10:52, "=E5=90=B3=E7=A7=89=E6=98=8C" <wh800805@gmail.com>:
> Hi Johnathan & Konstantin
> =20
> Thanks for your explanation. It is very helpful to me.
> I adjust the json file to fix this issue.
> =20
> And I have one more question need help.
> I try to enable the SEL, I add below setting=20
> PACKAGECONFIG:append =3D " log-threshold log-pulse send-to-logger=E2=80=9D=

> =20
> When event occurred, but SEL still empty.
> =20
> event occurred log:=20
> Jan 01 00:04:25 fws7830bmc adcsensor[283]: Sensor MB_P3V3 high =
threshold 3.531 assert: value 3.588 raw data 1794
> Jan 01 00:06:08 fws7830bmc adcsensor[283]: Sensor MB_P3V3 high =
threshold 3.531 assert: value 3.54 raw data 1770
> =20
> Ipmitoo sel log:
> SEL Information
> Version          : 1.5 (v1.5, v2 compliant)
> Entries          : 0
> Free Space       : 65535 bytes or more
> Percent Used     : unknown
> Last Add Time    : Not Available
> Last Del Time    : Not Available
> Overflow         : false
> Supported Cmds   : 'Reserve=E2=80=99=20
> =20
> Please give me some advice. Thanks
> =20
> BR
> Paul
> =20
> =20
> Johnathan Mantey <johnathanx.mantey@intel.com =
<mailto:johnathanx.mantey@intel.com>> =E6=96=BC 2021=E5=B9=B49=E6=9C=8830=E6=
=97=A5 =E4=B8=8B=E5=8D=8811:00 =E5=AF=AB=E9=81=93=EF=BC=9A
> =20
>=20
>=20
> On 9/30/21 3:13 AM, =E5=90=B3=E7=A7=89=E6=98=8C wrote:
> Hi Andrei
> My question is that I set MB_P12V "upper critical" is 13.23, "upper =
non critical" is 12.6, etc .
> When I login web page, I can see the setting what I want.
> But when I use =E2=80=9CIpmitool sensor=E2=80=9D command, the response =
is wrong. Like below
> MB P12V          | 7.215      | Volts      | ok    | na        |6.386  =
   | 6.723     | 7.429     | 7.829     | na
> I am not sure am I miss something.
> Thanks
> Paul
>=20
> ipmitool uses SDR records to calculate how to translate the 8-bit =
sensor reading into a value in range.
>=20
> For intel-ipmi-oem the SDRs are generated on the fly, with most being =
Type 1. The Type 1 has a M, M(B), R, and R(B) value that is calculated =
from the values in the JSON. The code inside this section uses several =
of the entries in the JSON to generate the M and R values.
>=20
> We were recently bit by this calculation, because the calculation used =
the "worst case" values of reading(min), reading(max), UC, and UNC, and =
combined them for the M and R.
>=20
> Somehow the UNC and UC values were outside the reading range, and the =
M and R values were calculated in a way that made the sensor output =
incorrect as displayed by ipmitool.
>=20
> You may want to investigate if the SDRs are correct. Use 'impitool sdr =
dump sdrs.bin' and find the SDR for the sensors of interest and see if =
the M and R values are sensible.
>=20
> If they aren't find the code generating those values and identify how =
the values are created. Adjust your JSON as necessary.
> =20
> Andrei Kartashev <a.kartashev@yadro.com =
<mailto:a.kartashev@yadro.com>> =E6=96=BC 2021=E5=B9=B49=E6=9C=8830=E6=97=A5=
 =E4=B8=8B=E5=8D=886:03 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
> Hello,
>=20
> What is your question exactly?
> If it is about precision, then you should take in account that IPMI =
use
> 8-bit variables to represent values and some coefficients which
> calculated based on MinValue/MaxValue parameters of corresponding
> Sensor interface.
> You will never get exact values in IPMI, unless you values can fit to
> 8-bit integer.
>=20
> On Thu, 2021-09-30 at 17:07 +0800, =E5=90=B3=E7=A7=89=E6=98=8C wrote:
> Hi all
>=20
> I add the sensor in entity-manager config like below
> {
>             "Index": 2,
>             "Name": "MB_VMEM",
>             "PowerState": "On",
>             "ScaleFactor": 1,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 1.32
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 1.26
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 1.14
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 1.08
>                 }
>             ],
>             "Type": "ADC"
>         },
>         {
>             "Index": 3,
>             "Name": "MB_P12V",
>             "PowerState": "On",
>             "ScaleFactor": 0.23,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 13.23
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 12.6
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 11.4
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 10.77
>                 }
>             ],
>             "Type": "ADC"
>         },
>         {
>             "Index": 4,
>             "Name": "MB_P5V",
>             "PowerState": "On",
>             "ScaleFactor": 0.55,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 5.48
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 5.24
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 4.76
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 4.48
>                 }
>             ],
>             "Type": "ADC"
>         },
>         {
>             "Index": 5,
>             "Name": "MB_P5V_SB",
>             "PowerState": "On",
>             "ScaleFactor": 0.25,
>             "Thresholds": [
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper critical",
>                     "Severity": 1,
>                     "Value": 5.48
>                 },
>                 {
>                     "Direction": "greater than",
>                     "Name": "upper non critical",
>                     "Severity": 0,
>                     "Value": 5.24
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower non critical",
>                     "Severity": 0,
>                     "Value": 4.76
>                 },
>                 {
>                     "Direction": "less than",
>                     "Name": "lower critical",
>                     "Severity": 1,
>                     "Value": 4.48
>                 }
>             ],
>             "Type": "ADC"
>         },
>=20
>=20
> I use the busctrl command to see MB_P5V_SB information, it is normal.
> root@fws7830bmc <mailto:root@fws7830bmc>:~# busctl introspect =
--no-pager
> xyz.openbmc_project.EntityManager
> /xyz/openbmc_project/inventory/system/board/FWS7830_
> Baseboard/MB_P5V
> NAME                                              TYPE      SIGNATURE
> RESULT/VALUE         FLAGS
> org.freedesktop.DBus.Introspectable               interface -
>   -                    -
> .Introspect                                       method    -
>   s                    -
> org.freedesktop.DBus.Peer                         interface -
>   -                    -
> .GetMachineId                                     method    -
>   s                    -
> .Ping                                             method    -
>   -                    -
> org.freedesktop.DBus.Properties                   interface -
>   -                    -
> .Get                                              method    ss
>   v                    -
> .GetAll                                           method    s
>   a{sv}                -
> .Set                                              method    ssv
>   -                    -
> .PropertiesChanged                                signal
>   sa{sv}as  -                    -
> xyz.openbmc_project.Configuration.ADC             interface -
>   -                    -
> .Index                                            property  t
>   4                    emits-change
> .Name                                             property  s
>   "MB_P5V"             emits-change
> .PowerState                                       property  s
>   "On"                 emits-change
> .ScaleFactor                                      property  d
>   0.55                 emits-change
> .Type                                             property  s
>   "ADC"                emits-change
> xyz.openbmc_project.Configuration.ADC.Thresholds0 interface -
>   -                    -
> .Delete                                           method    -
>   -                    -
> .Direction                                        property  s
>   "greater than"       emits-change writable
> .Name                                             property  s
>   "upper critical"     emits-change writable
> .Severity                                         property  d
>   1                    emits-change writable
> .Value                                            property  d
>   5.48                 emits-change writable
> xyz.openbmc_project.Configuration.ADC.Thresholds1 interface -
>   -                    -
> .Delete                                           method    -
>   -                    -
> .Direction                                        property  s
>   "greater than"       emits-change writable
> .Name                                             property  s
>   "upper non critical" emits-change writable
> .Severity                                         property  d
>   0                    emits-change writable
> .Value                                            property  d
>   5.24                 emits-change writable
> xyz.openbmc_project.Configuration.ADC.Thresholds2 interface -
>   -                    -
> .Delete                                           method    -
>   -                    -
> .Direction                                        property  s
>   "less than"          emits-change writable
> .Name                                             property  s
>   "lower non critical" emits-change writable
> .Severity                                         property  d
>   0                    emits-change writable
> .Value                                            property  d
>   4.76                 emits-change writable
> xyz.openbmc_project.Configuration.ADC.Thresholds3 interface -
>   -                    -
> .Delete                                           method    -
>   -                    -
> .Direction                                        property  s
>   "less than"          emits-change writable
> .Name                                             property  s
>   "lower critical"     emits-change writable
> .Severity                                         property  d
>   1                    emits-change writable
> .Value                                            property  d
>   4.48                 emits-change writable
>=20
> But I use "ipmitoo sensor=E2=80=9D command, it return the error =
information
> below as
> MB P3V3          | 3.271      | Volts      | ok    | na        |
> 2.947     | 3.046     | 3.511     | 3.596     | na
> MB P5V           | 2.982      | Volts      | ok    | na        |
> 2.662     | 2.829     | 3.123     | 3.264     | na
> MB P5V SB        | 5.048      | Volts      | ok    | na        |
> 4.484     | 4.766     | 5.245     | 5.471     | na
> MB P12V          | 7.215      | Volts      | ok    | na        |
> 6.386     | 6.723     | 7.429     | 7.829     | na
>=20
> Please give me some advise.
>=20
> Many thanks
> Paul
>=20
>=20
> --=20
> Best regards,
> Andrei Kartashev
>=20
> =20
>=20
> --=20
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com =
<mailto:johnathanx.mantey@intel.com> <mailto:johnathanx.mantey@intel.com =
<mailto:johnathanx.mantey@intel.com>>
> =20
> =20
> --=20
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
> =20


--Apple-Mail=_76BD4B77-CF72-4B53-8A11-0699EF8A01A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hi&nbsp;Konstantin<div class=3D""><br class=3D""></div><div =
class=3D"">I already fixed. I install module rsyslog and the SEL log =
will show when I run ipmitool.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks for your help!</div><div =
class=3D""><br class=3D""></div><div class=3D"">BR</div><div =
class=3D"">Paul</div><div class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">Konstantin Klubnichkin &lt;<a =
href=3D"mailto:kitsok@yandex-team.ru" =
class=3D"">kitsok@yandex-team.ru</a>&gt; =E6=96=BC 2021=E5=B9=B410=E6=9C=88=
1=E6=97=A5 =E4=B8=8B=E5=8D=886:41 =E5=AF=AB=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hello =
Paul</div><div class=3D"">&nbsp;</div><div class=3D"">We don't have this =
in our config files.</div><div class=3D"">&nbsp;</div><div =
class=3D"">Instead we use phosphor-sel-logger &nbsp;(included using =
IMAGE_INSTALL_append variable in machine config).</div><div =
class=3D"">&nbsp;</div><div class=3D"">In my bbappend file for =
phosphor-sel-logger there are following features enabled:</div><div =
class=3D""><div class=3D"">#Enable threshold monitoring</div><div =
class=3D"">EXTRA_OECMAKE +=3D =
"-DSEL_LOGGER_MONITOR_THRESHOLD_EVENTS=3DON"</div><div =
class=3D"">EXTRA_OECMAKE +=3D =
"-DREDFISH_LOG_MONITOR_PULSE_EVENTS=3DON"</div></div><div =
class=3D"">&nbsp;</div><div class=3D"">&nbsp;</div><div =
class=3D"">01.10.2021, 10:52, "=E5=90=B3=E7=A7=89=E6=98=8C" &lt;<a =
href=3D"mailto:wh800805@gmail.com" =
class=3D"">wh800805@gmail.com</a>&gt;:</div><blockquote class=3D""><div =
style=3D"word-wrap:break-word" class=3D"">Hi Johnathan =
&amp;&nbsp;Konstantin<div class=3D"">&nbsp;</div><div class=3D"">Thanks =
for your explanation. It is very helpful to me.</div><div class=3D"">I =
adjust the json file to fix this issue.</div><div =
class=3D"">&nbsp;</div><div class=3D"">And I have one more question need =
help.</div><div class=3D"">I try to enable the SEL, I add below =
setting&nbsp;</div><div class=3D""><div class=3D""><font color=3D"#ff9300"=
 class=3D"">PACKAGECONFIG:append =3D " log-threshold log-pulse =
send-to-logger=E2=80=9D</font></div></div><div class=3D"">&nbsp;</div><div=
 class=3D"">When event occurred, but SEL still empty.</div><div =
class=3D"">&nbsp;</div><div class=3D"">event occurred =
log:&nbsp;</div><div class=3D""><div class=3D"">Jan 01 00:04:25 =
fws7830bmc adcsensor[283]: Sensor MB_P3V3 high threshold 3.531 assert: =
value 3.588 raw data 1794</div><div class=3D"">Jan 01 00:06:08 =
fws7830bmc adcsensor[283]: Sensor MB_P3V3 high threshold 3.531 assert: =
value 3.54 raw data 1770</div></div><div class=3D"">&nbsp;</div><div =
class=3D"">Ipmitoo sel log:</div><div class=3D""><div class=3D"">SEL =
Information</div><div class=3D"">Version &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;: 1.5 (v1.5, v2 compliant)</div><div class=3D"">Entries &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;: 0</div><div class=3D"">Free Space &nbsp; =
&nbsp; &nbsp; : 65535 bytes or more</div><div class=3D"">Percent Used =
&nbsp; &nbsp; : unknown</div><div class=3D"">Last Add Time &nbsp; =
&nbsp;: Not Available</div><div class=3D"">Last Del Time &nbsp; &nbsp;: =
Not Available</div><div class=3D"">Overflow &nbsp; &nbsp; &nbsp; &nbsp; =
: false</div><div class=3D"">Supported Cmds &nbsp; : =
'Reserve=E2=80=99&nbsp;</div></div><div class=3D"">&nbsp;</div><div =
class=3D"">Please give me some advice. Thanks</div><div =
class=3D"">&nbsp;</div><div class=3D"">BR</div><div =
class=3D"">Paul</div><div class=3D"">&nbsp;</div><div class=3D""><div =
class=3D"">&nbsp;<blockquote class=3D""><div class=3D"">Johnathan Mantey =
&lt;<a href=3D"mailto:johnathanx.mantey@intel.com" rel=3D"noopener =
noreferrer" class=3D"">johnathanx.mantey@intel.com</a>&gt; =E6=96=BC =
2021=E5=B9=B49=E6=9C=8830=E6=97=A5 =E4=B8=8B=E5=8D=8811:00 =
=E5=AF=AB=E9=81=93=EF=BC=9A</div>&nbsp;<div class=3D""><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">On 9/30/21 3:13 AM, =
=E5=90=B3=E7=A7=89=E6=98=8C wrote:</span><blockquote =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D"">Hi Andrei<br class=3D"">My =
question is that I set MB_P12V "upper critical" is 13.23, "upper non =
critical" is 12.6, etc .<br class=3D"">When I login web page, I can see =
the setting what I want.<br class=3D"">But when I use =E2=80=9CIpmitool =
sensor=E2=80=9D command, the response is wrong. Like below<br =
class=3D"">MB P12V =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 7.215 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Volts &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| ok =
&nbsp;&nbsp;&nbsp;| na &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|6.386 =
&nbsp;&nbsp;&nbsp;&nbsp;| 6.723 &nbsp;&nbsp;&nbsp;&nbsp;| 7.429 =
&nbsp;&nbsp;&nbsp;&nbsp;| 7.829 &nbsp;&nbsp;&nbsp;&nbsp;| na<br =
class=3D"">I am not sure am I miss something.<br class=3D"">Thanks<br =
class=3D"">Paul</blockquote><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">ipmitool uses SDR =
records to calculate how to translate the 8-bit sensor reading into a =
value in range.</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">For intel-ipmi-oem =
the SDRs are generated on the fly, with most being Type 1. The Type 1 =
has a M, M(B), R, and R(B) value that is calculated from the values in =
the JSON. The code inside this section uses several of the entries in =
the JSON to generate the M and R values.</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">We were recently =
bit by this calculation, because the calculation used the "worst case" =
values of reading(min), reading(max), UC, and UNC, and combined them for =
the M and R.</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">Somehow the UNC and =
UC values were outside the reading range, and the M and R values were =
calculated in a way that made the sensor output incorrect as displayed =
by ipmitool.</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">You may want to =
investigate if the SDRs are correct. Use 'impitool sdr dump sdrs.bin' =
and find the SDR for the sensors of interest and see if the M and R =
values are sensible.</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">If they aren't find =
the code generating those values and identify how the values are =
created. Adjust your JSON as necessary.</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D"">&nbsp;<blockquote =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><blockquote class=3D"">Andrei =
Kartashev &lt;<a href=3D"mailto:a.kartashev@yadro.com" rel=3D"noopener =
noreferrer" class=3D"">a.kartashev@yadro.com</a>&gt; =E6=96=BC =
2021=E5=B9=B49=E6=9C=8830=E6=97=A5 =E4=B8=8B=E5=8D=886:03 =E5=AF=AB=E9=81=93=
=EF=BC=9A<br class=3D""><br class=3D"">Hello,<br class=3D""><br =
class=3D"">What is your question exactly?<br class=3D"">If it is about =
precision, then you should take in account that IPMI use<br =
class=3D"">8-bit variables to represent values and some coefficients =
which<br class=3D"">calculated based on MinValue/MaxValue parameters of =
corresponding<br class=3D"">Sensor interface.<br class=3D"">You will =
never get exact values in IPMI, unless you values can fit to<br =
class=3D"">8-bit integer.<br class=3D""><br class=3D"">On Thu, =
2021-09-30 at 17:07 +0800, =E5=90=B3=E7=A7=89=E6=98=8C wrote:<blockquote =
class=3D"">Hi all<br class=3D""><br class=3D"">I add the sensor in =
entity-manager config like below<br class=3D"">{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Index": 2,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Name": "MB_VMEM",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"PowerState": "On",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"ScaleFactor": 1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Thresholds": [<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
1.32<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
1.26<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
1.14<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
1.08<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;],<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Type": "ADC"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Index": 3,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Name": "MB_P12V",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"PowerState": "On",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"ScaleFactor": 0.23,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Thresholds": [<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
13.23<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
12.6<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
11.4<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
10.77<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;],<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Type": "ADC"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Index": 4,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Name": "MB_P5V",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"PowerState": "On",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"ScaleFactor": 0.55,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Thresholds": [<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
5.48<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
5.24<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
4.76<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
4.48<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;],<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Type": "ADC"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Index": 5,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Name": "MB_P5V_SB",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"PowerState": "On",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"ScaleFactor": 0.25,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Thresholds": [<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
5.48<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"greater than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "upper =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
5.24<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
non critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
0,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
4.76<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<!-- --><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Direction": =
"less than",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Name": "lower =
critical",<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Severity": =
1,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Value": =
4.48<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;],<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;"Type": "ADC"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<br =
class=3D""><br class=3D""><br class=3D"">I use the busctrl command to =
see MB_P5V_SB information, it is normal.<br class=3D""><a =
href=3D"mailto:root@fws7830bmc" class=3D"">root@fws7830bmc</a>:~# busctl =
introspect --no-pager<br class=3D"">xyz.openbmc_project.EntityManager<br =
class=3D"">/xyz/openbmc_project/inventory/system/board/FWS7830_<br =
class=3D"">Baseboard/MB_P5V<br class=3D"">NAME =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TYPE =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SIGNATURE<br class=3D"">RESULT/VALUE =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FLAGS<br =
class=3D"">org.freedesktop.DBus.Introspectable =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;interface -<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Introspect =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;method &nbsp;&nbsp;&nbsp;-<br class=3D"">&nbsp;&nbsp;s =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br =
class=3D"">org.freedesktop.DBus.Peer =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inte=
rface -<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.GetMachineId =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method=
 &nbsp;&nbsp;&nbsp;-<br class=3D"">&nbsp;&nbsp;s =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Ping =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method &nbsp;&nbsp;&nbsp;-<br =
class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br =
class=3D"">org.freedesktop.DBus.Properties =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;interface -<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Get =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method =
&nbsp;&nbsp;&nbsp;ss<br class=3D"">&nbsp;&nbsp;v =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.GetAll =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method &nbsp;&nbsp;&nbsp;s<br =
class=3D"">&nbsp;&nbsp;a{sv} =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;-<br class=3D"">.Set =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method =
&nbsp;&nbsp;&nbsp;ssv<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.PropertiesChanged=
 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;signal<br =
class=3D"">&nbsp;&nbsp;sa{sv}as &nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br =
class=3D"">xyz.openbmc_project.Configuration.ADC =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;in=
terface -<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Index =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;t<br =
class=3D"">&nbsp;&nbsp;4 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change<br class=3D"">.Name =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;s<br =
class=3D"">&nbsp;&nbsp;"MB_P5V" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;em=
its-change<br class=3D"">.PowerState =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;property &nbsp;s<br class=3D"">&nbsp;&nbsp;"On" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;emits-change<br class=3D"">.ScaleFactor =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
property &nbsp;d<br class=3D"">&nbsp;&nbsp;0.55 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;emits-change<br class=3D"">.Type =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;s<br =
class=3D"">&nbsp;&nbsp;"ADC" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;emits-change<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds0 interface =
-<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Delete =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method &nbsp;&nbsp;&nbsp;-<br =
class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Direction =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;property &nbsp;s<br class=3D"">&nbsp;&nbsp;"greater than" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">.Name =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;s<br =
class=3D"">&nbsp;&nbsp;"upper critical" =
&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br class=3D"">.Severity =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;property &nbsp;d<br class=3D"">&nbsp;&nbsp;1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">.Value =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;d<br =
class=3D"">&nbsp;&nbsp;5.48 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds1 interface =
-<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Delete =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method &nbsp;&nbsp;&nbsp;-<br =
class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Direction =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;property &nbsp;s<br class=3D"">&nbsp;&nbsp;"greater than" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">.Name =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;s<br =
class=3D"">&nbsp;&nbsp;"upper non critical" emits-change writable<br =
class=3D"">.Severity =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;property &nbsp;d<br class=3D"">&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">.Value =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;d<br =
class=3D"">&nbsp;&nbsp;5.24 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds2 interface =
-<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Delete =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method &nbsp;&nbsp;&nbsp;-<br =
class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Direction =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;property &nbsp;s<br class=3D"">&nbsp;&nbsp;"less than" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change =
writable<br class=3D"">.Name =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;s<br =
class=3D"">&nbsp;&nbsp;"lower non critical" emits-change writable<br =
class=3D"">.Severity =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;property &nbsp;d<br class=3D"">&nbsp;&nbsp;0 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">.Value =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;d<br =
class=3D"">&nbsp;&nbsp;4.76 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds3 interface =
-<br class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Delete =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method &nbsp;&nbsp;&nbsp;-<br =
class=3D"">&nbsp;&nbsp;- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-<br class=3D"">.Direction =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;property &nbsp;s<br class=3D"">&nbsp;&nbsp;"less than" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change =
writable<br class=3D"">.Name =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;s<br =
class=3D"">&nbsp;&nbsp;"lower critical" =
&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br class=3D"">.Severity =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;property &nbsp;d<br class=3D"">&nbsp;&nbsp;1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;emits-change writable<br =
class=3D"">.Value =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;property &nbsp;d<br =
class=3D"">&nbsp;&nbsp;4.48 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;emits-change writable<br class=3D""><br =
class=3D"">But I use "ipmitoo sensor=E2=80=9D command, it return the =
error information<br class=3D"">below as<br class=3D"">MB P3V3 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 3.271 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Volts &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| ok =
&nbsp;&nbsp;&nbsp;| na &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br =
class=3D"">2.947 &nbsp;&nbsp;&nbsp;&nbsp;| 3.046 =
&nbsp;&nbsp;&nbsp;&nbsp;| 3.511 &nbsp;&nbsp;&nbsp;&nbsp;| 3.596 =
&nbsp;&nbsp;&nbsp;&nbsp;| na<br class=3D"">MB P5V =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2.982 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Volts &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| ok =
&nbsp;&nbsp;&nbsp;| na &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br =
class=3D"">2.662 &nbsp;&nbsp;&nbsp;&nbsp;| 2.829 =
&nbsp;&nbsp;&nbsp;&nbsp;| 3.123 &nbsp;&nbsp;&nbsp;&nbsp;| 3.264 =
&nbsp;&nbsp;&nbsp;&nbsp;| na<br class=3D"">MB P5V SB =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 5.048 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Volts &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| ok =
&nbsp;&nbsp;&nbsp;| na &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br =
class=3D"">4.484 &nbsp;&nbsp;&nbsp;&nbsp;| 4.766 =
&nbsp;&nbsp;&nbsp;&nbsp;| 5.245 &nbsp;&nbsp;&nbsp;&nbsp;| 5.471 =
&nbsp;&nbsp;&nbsp;&nbsp;| na<br class=3D"">MB P12V =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 7.215 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Volts &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| ok =
&nbsp;&nbsp;&nbsp;| na &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br =
class=3D"">6.386 &nbsp;&nbsp;&nbsp;&nbsp;| 6.723 =
&nbsp;&nbsp;&nbsp;&nbsp;| 7.429 &nbsp;&nbsp;&nbsp;&nbsp;| 7.829 =
&nbsp;&nbsp;&nbsp;&nbsp;| na<br class=3D""><br class=3D"">Please give me =
some advise.<br class=3D""><br class=3D"">Many thanks<br =
class=3D"">Paul<br class=3D""><br class=3D""></blockquote><br =
class=3D"">--&nbsp;<br class=3D"">Best regards,<br class=3D"">Andrei =
Kartashev<br class=3D""><br class=3D"">&nbsp;</blockquote></blockquote><br=
 =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">--&nbsp;</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">Johnathan =
Mantey</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">Senior Software =
Engineer</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">*azad te**chnology =
partners*</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">Contributing to =
Technology Innovation since 1992</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">Phone: (503) =
712-6764</span><br =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-decoration:none;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px" class=3D""><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">Email:&nbsp;</span><a=
 href=3D"mailto:johnathanx.mantey@intel.com" rel=3D"noopener noreferrer" =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px" class=3D"">johnathanx.mantey@intel.com</a><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" class=3D"">&nbsp;&lt;</span><a =
href=3D"mailto:johnathanx.mantey@intel.com" rel=3D"noopener noreferrer" =
style=3D"font-family:'helvetica';font-size:14px;font-style:normal;font-wei=
ght:normal;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px" class=3D"">mailto:johnathanx.mantey@intel.com</a><span =
style=3D"float:none;font-family:'helvetica';font-size:14px;font-style:norm=
al;font-weight:normal;text-decoration:none;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" =
class=3D"">&gt;</span></div></blockquote></div></div></div></blockquote><d=
iv class=3D"">&nbsp;</div><div class=3D"">&nbsp;</div><div =
class=3D"">--&nbsp;</div><div class=3D"">Best regards,</div><div =
class=3D"">Konstantin Klubnichkin,</div><div class=3D"">lead firmware =
engineer,</div><div class=3D"">server hardware R&amp;D group,</div><div =
class=3D"">Yandex Moscow office.</div><div class=3D"">tel: =
+7-903-510-33-33</div><div =
class=3D"">&nbsp;</div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_76BD4B77-CF72-4B53-8A11-0699EF8A01A7--
