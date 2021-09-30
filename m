Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFE741D769
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 12:13:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKpwx20M0z304y
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 20:13:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VhHziT4w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=wh800805@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VhHziT4w; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKpwW69DWz2yKV
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 20:13:14 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 d4-20020a17090ad98400b0019ece228690so6355106pjv.5
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 03:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YYKoj4GmFrHfSUDK5/BDAamVSmgajgpOyChP8x/8Xzc=;
 b=VhHziT4wg27YdqZR+oT1DBnFF9Jsd8oyNqM39LqUgtbnhh+LFNdlEMxW/6na24LH6h
 jEUofarfIXxmWPd5Rnc6J1uQv3/XoyEcXDxK1rX3u32QtbPmP3c1k+nMS/YGEe9zWAuS
 CwEhv0j3agm+dgJUBF2s2DStO2smhvwnxcVvpu/OpFk5YNbBSLazSzaa+uNYIVo9eIdm
 IBMiN74+zrAUnEIcxC/6kkN6/C0mOshGNGr8vUmeZu5LF9NFIxINb8TBaPY09CYnMiLG
 daXBkXtdo9zc298xhxMKyMk0PZgKYidJruB8vsELu8ubUdEygdBUwt7adSpOtDys6AHU
 NShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YYKoj4GmFrHfSUDK5/BDAamVSmgajgpOyChP8x/8Xzc=;
 b=TMXWlZ2JqfMEj8ssmPREFAqXsW0Mv0UJHfpVKnB0cut/2Yzjga68W/mwhm5rP1OJto
 eos0Vtw+ny7IFFqyGHXU0IdrtJV3pTInV901F25DImbm2UB/pxBsE7mue8sb1Vo8oz4L
 tMte+3aNdQXmDqGi0mB6wngzgrTwbikVwnYCP09/EsuBdIFkJVHZAq704U7swz6lQ6Lz
 EZS00vpf/jrwNabdRiJp3W1SQzUs7HC+8QW31YLdD/XZIwc7Hq53dt7NnBh4ibqckA34
 yIivEDZUwhW+H1m/+tXICq2TwMJerUxGuhm87iCwM7OHcNKqWfCI8NZYfMUOLKhYsSP+
 z3nQ==
X-Gm-Message-State: AOAM531R5LPN8nwPKQMuZ1yPQHNhZIEyeGIgw+Etha2dlroriQV+DS2Z
 CBh3snr9TQEHlaDFNPXc+A==
X-Google-Smtp-Source: ABdhPJwqEOT18Lnd1ysWnLN0kKAdJnVhx1onaaNmTKA3CZMGYi/TtV1C1+rjZ5GK0A1CwQ6ND8zaQA==
X-Received: by 2002:a17:90a:af92:: with SMTP id
 w18mr5541404pjq.98.1632996789868; 
 Thu, 30 Sep 2021 03:13:09 -0700 (PDT)
Received: from smtpclient.apple (220-128-110-82.hinet-ip.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id o17sm2527114pfp.126.2021.09.30.03.13.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Sep 2021 03:13:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Ipmitool command & entity-manager question
From: =?utf-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>
In-Reply-To: <27ffb02323b8be39e1e92b37fc3cdc35857312b8.camel@yadro.com>
Date: Thu, 30 Sep 2021 18:13:07 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <2BD99E33-F582-46C5-855F-942532F79FCC@gmail.com>
References: <42F9352C-E5A9-4A02-B877-95E8419EB3BE@gmail.com>
 <27ffb02323b8be39e1e92b37fc3cdc35857312b8.camel@yadro.com>
To: Andrei Kartashev <a.kartashev@yadro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrei

My question is that I set MB_P12V "upper critical" is 13.23, "upper non =
critical" is 12.6, etc .
When I login web page, I can see the setting what I want.=20
But when I use =E2=80=9CIpmitool sensor=E2=80=9D command, the response =
is wrong. Like below

MB P12V          | 7.215      | Volts      | ok    | na        |6.386    =
 | 6.723     | 7.429     | 7.829     | na=20

I am not sure am I miss something.

Thanks
Paul

> Andrei Kartashev <a.kartashev@yadro.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=88=
30=E6=97=A5 =E4=B8=8B=E5=8D=886:03 =E5=AF=AB=E9=81=93=EF=BC=9A
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
>> Hi all
>>=20
>> I add the sensor in entity-manager config like below
>> {
>>             "Index": 2,
>>             "Name": "MB_VMEM",
>>             "PowerState": "On",
>>             "ScaleFactor": 1,
>>             "Thresholds": [
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper critical",
>>                     "Severity": 1,
>>                     "Value": 1.32
>>                 },
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper non critical",
>>                     "Severity": 0,
>>                     "Value": 1.26
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower non critical",
>>                     "Severity": 0,
>>                     "Value": 1.14
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower critical",
>>                     "Severity": 1,
>>                     "Value": 1.08
>>                 }
>>             ],
>>             "Type": "ADC"
>>         },
>>         {
>>             "Index": 3,
>>             "Name": "MB_P12V",
>>             "PowerState": "On",
>>             "ScaleFactor": 0.23,
>>             "Thresholds": [
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper critical",
>>                     "Severity": 1,
>>                     "Value": 13.23
>>                 },
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper non critical",
>>                     "Severity": 0,
>>                     "Value": 12.6
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower non critical",
>>                     "Severity": 0,
>>                     "Value": 11.4
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower critical",
>>                     "Severity": 1,
>>                     "Value": 10.77
>>                 }
>>             ],
>>             "Type": "ADC"
>>         },
>>         {
>>             "Index": 4,
>>             "Name": "MB_P5V",
>>             "PowerState": "On",
>>             "ScaleFactor": 0.55,
>>             "Thresholds": [
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper critical",
>>                     "Severity": 1,
>>                     "Value": 5.48
>>                 },
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper non critical",
>>                     "Severity": 0,
>>                     "Value": 5.24
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower non critical",
>>                     "Severity": 0,
>>                     "Value": 4.76
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower critical",
>>                     "Severity": 1,
>>                     "Value": 4.48
>>                 }
>>             ],
>>             "Type": "ADC"
>>         },
>>         {
>>             "Index": 5,
>>             "Name": "MB_P5V_SB",
>>             "PowerState": "On",
>>             "ScaleFactor": 0.25,
>>             "Thresholds": [
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper critical",
>>                     "Severity": 1,
>>                     "Value": 5.48
>>                 },
>>                 {
>>                     "Direction": "greater than",
>>                     "Name": "upper non critical",
>>                     "Severity": 0,
>>                     "Value": 5.24
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower non critical",
>>                     "Severity": 0,
>>                     "Value": 4.76
>>                 },
>>                 {
>>                     "Direction": "less than",
>>                     "Name": "lower critical",
>>                     "Severity": 1,
>>                     "Value": 4.48
>>                 }
>>             ],
>>             "Type": "ADC"
>>         },
>>=20
>>=20
>> I use the busctrl command to see MB_P5V_SB information, it is normal.
>> root@fws7830bmc:~# busctl introspect --no-pager
>> xyz.openbmc_project.EntityManager
>> /xyz/openbmc_project/inventory/system/board/FWS7830_
>> Baseboard/MB_P5V
>> NAME                                              TYPE      SIGNATURE
>> RESULT/VALUE         FLAGS
>> org.freedesktop.DBus.Introspectable               interface -     =20
>>   -                    -
>> .Introspect                                       method    -     =20
>>   s                    -
>> org.freedesktop.DBus.Peer                         interface -     =20
>>   -                    -
>> .GetMachineId                                     method    -     =20
>>   s                    -
>> .Ping                                             method    -     =20
>>   -                    -
>> org.freedesktop.DBus.Properties                   interface -     =20
>>   -                    -
>> .Get                                              method    ss    =20
>>   v                    -
>> .GetAll                                           method    s     =20
>>   a{sv}                -
>> .Set                                              method    ssv   =20
>>   -                    -
>> .PropertiesChanged                                signal=20
>>   sa{sv}as  -                    -
>> xyz.openbmc_project.Configuration.ADC             interface -     =20
>>   -                    -
>> .Index                                            property  t     =20
>>   4                    emits-change
>> .Name                                             property  s     =20
>>   "MB_P5V"             emits-change
>> .PowerState                                       property  s     =20
>>   "On"                 emits-change
>> .ScaleFactor                                      property  d     =20
>>   0.55                 emits-change
>> .Type                                             property  s     =20
>>   "ADC"                emits-change
>> xyz.openbmc_project.Configuration.ADC.Thresholds0 interface -     =20
>>   -                    -
>> .Delete                                           method    -     =20
>>   -                    -
>> .Direction                                        property  s     =20
>>   "greater than"       emits-change writable
>> .Name                                             property  s     =20
>>   "upper critical"     emits-change writable
>> .Severity                                         property  d     =20
>>   1                    emits-change writable
>> .Value                                            property  d     =20
>>   5.48                 emits-change writable
>> xyz.openbmc_project.Configuration.ADC.Thresholds1 interface -     =20
>>   -                    -
>> .Delete                                           method    -     =20
>>   -                    -
>> .Direction                                        property  s     =20
>>   "greater than"       emits-change writable
>> .Name                                             property  s     =20
>>   "upper non critical" emits-change writable
>> .Severity                                         property  d     =20
>>   0                    emits-change writable
>> .Value                                            property  d     =20
>>   5.24                 emits-change writable
>> xyz.openbmc_project.Configuration.ADC.Thresholds2 interface -     =20
>>   -                    -
>> .Delete                                           method    -     =20
>>   -                    -
>> .Direction                                        property  s     =20
>>   "less than"          emits-change writable
>> .Name                                             property  s     =20
>>   "lower non critical" emits-change writable
>> .Severity                                         property  d     =20
>>   0                    emits-change writable
>> .Value                                            property  d     =20
>>   4.76                 emits-change writable
>> xyz.openbmc_project.Configuration.ADC.Thresholds3 interface -     =20
>>   -                    -
>> .Delete                                           method    -     =20
>>   -                    -
>> .Direction                                        property  s     =20
>>   "less than"          emits-change writable
>> .Name                                             property  s     =20
>>   "lower critical"     emits-change writable
>> .Severity                                         property  d     =20
>>   1                    emits-change writable
>> .Value                                            property  d     =20
>>   4.48                 emits-change writable
>>=20
>> But I use "ipmitoo sensor=E2=80=9D command, it return the error =
information
>> below as
>> MB P3V3          | 3.271      | Volts      | ok    | na        |
>> 2.947     | 3.046     | 3.511     | 3.596     | na       =20
>> MB P5V           | 2.982      | Volts      | ok    | na        |
>> 2.662     | 2.829     | 3.123     | 3.264     | na       =20
>> MB P5V SB        | 5.048      | Volts      | ok    | na        |
>> 4.484     | 4.766     | 5.245     | 5.471     | na       =20
>> MB P12V          | 7.215      | Volts      | ok    | na        |
>> 6.386     | 6.723     | 7.429     | 7.829     | na=20
>>=20
>> Please give me some advise.
>>=20
>> Many thanks
>> Paul=20
>>=20
>=20
> --=20
> Best regards,
> Andrei Kartashev
>=20
>=20

