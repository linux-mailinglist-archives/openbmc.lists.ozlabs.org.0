Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3FD41D600
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 11:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKnT62gw6z2ypb
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 19:07:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MM0DzzPE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=wh800805@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MM0DzzPE; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKnSd25m8z2yn1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 19:07:27 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id h3so5547370pgb.7
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:message-id:date:to;
 bh=gi9rQivMMbBOguQy0spIf0TEjHErSpxWqSrDmA4T9Dk=;
 b=MM0DzzPE6vB2yABgMJZo/ut/9tIyOCLhlKIeoTEKpQ3tO3Bjg1jm0UnNIJwMB+Y8/A
 GayB9XUKzeCtGxL4D4mFgaO5zQ3petkrwJxqaaJSJuAxqrDcenT8qjFY5Nf1mMSYs2/n
 wH+LOBbxwxcfpkG0QzTHD48X2vbjux402wk+7n7/dw3LCSyOD4xch10l5x9DTuRtXePe
 +0+1CqI5UlSMMV4kY/m/wF99tuNI/oVlY+uzuWIPCojXq7Srn2pA4SEqg/1VfMjVjVvD
 UkVPm48yNkbi7j9tdPfeXwDwSDmsTXD3qvLMn/W40Se9+fhIeponOUaOkVp6J/S0RyvB
 wMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=gi9rQivMMbBOguQy0spIf0TEjHErSpxWqSrDmA4T9Dk=;
 b=ipDynp6zQjGxWU5nW1L239/+zVNvBLDbv54NxniKa6mshG26r+FoDWF4/LoOnPz1+U
 5spV/i/PsLZg9vRl9iWIS9W7rC5qod7YHxjYvY4DgJKMA5azDDLfkRjt1JapmVfPh5tb
 k3MGpCY8nqd6cqO67W8yvBCzFuXx0BKFm5/wFCiwTyEB0fz3cv96VZJyIU/x8EK4DgJI
 vMHJIIw0H8B8og4HCvDJ1EcL0gs9T1c0iLzzP4c/L587SjVXrFd7kLNieKt7XAPVqd2/
 6YVru3ZHQwA+LhrwwA7ZkXBb6lHQ6Fi7Gq3TjAWQ4qnj+wfi9JG4ZRvPYcZ7a9B4dysV
 Cmdg==
X-Gm-Message-State: AOAM531kRyUO73ml26RiAuSCRSZ0eZ/ngVUkZbLHo8FaclYYrxI4A9eU
 /rx1JuD6zGpZQ9hb0N4Xdzga6QvzEQ==
X-Google-Smtp-Source: ABdhPJzRxnrsufg2exM5Uzx/aC+EcWCroujkbiELSi7yuFddRf/8eXsAoAUf1FywN9wE03eCmwZwZg==
X-Received: by 2002:a62:27c7:0:b0:44b:ba28:4c9 with SMTP id
 n190-20020a6227c7000000b0044bba2804c9mr3338071pfn.35.1632992843170; 
 Thu, 30 Sep 2021 02:07:23 -0700 (PDT)
Received: from smtpclient.apple (220-128-110-82.hinet-ip.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id e20sm2313192pfc.11.2021.09.30.02.07.21
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Sep 2021 02:07:22 -0700 (PDT)
From: =?utf-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D5A82F16-A59F-4719-BE44-A77414EECB2B"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Ipmitool command & entity-manager question
Message-Id: <42F9352C-E5A9-4A02-B877-95E8419EB3BE@gmail.com>
Date: Thu, 30 Sep 2021 17:07:20 +0800
To: openbmc@lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_D5A82F16-A59F-4719-BE44-A77414EECB2B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi all

I add the sensor in entity-manager config like below
{
            "Index": 2,
            "Name": "MB_VMEM",
            "PowerState": "On",
            "ScaleFactor": 1,
            "Thresholds": [
                {
                    "Direction": "greater than",
                    "Name": "upper critical",
                    "Severity": 1,
                    "Value": 1.32
                },
                {
                    "Direction": "greater than",
                    "Name": "upper non critical",
                    "Severity": 0,
                    "Value": 1.26
                },
                {
                    "Direction": "less than",
                    "Name": "lower non critical",
                    "Severity": 0,
                    "Value": 1.14
                },
                {
                    "Direction": "less than",
                    "Name": "lower critical",
                    "Severity": 1,
                    "Value": 1.08
                }
            ],
            "Type": "ADC"
        },
        {
            "Index": 3,
            "Name": "MB_P12V",
            "PowerState": "On",
            "ScaleFactor": 0.23,
            "Thresholds": [
                {
                    "Direction": "greater than",
                    "Name": "upper critical",
                    "Severity": 1,
                    "Value": 13.23
                },
                {
                    "Direction": "greater than",
                    "Name": "upper non critical",
                    "Severity": 0,
                    "Value": 12.6
                },
                {
                    "Direction": "less than",
                    "Name": "lower non critical",
                    "Severity": 0,
                    "Value": 11.4
                },
                {
                    "Direction": "less than",
                    "Name": "lower critical",
                    "Severity": 1,
                    "Value": 10.77
                }
            ],
            "Type": "ADC"
        },
        {
            "Index": 4,
            "Name": "MB_P5V",
            "PowerState": "On",
            "ScaleFactor": 0.55,
            "Thresholds": [
                {
                    "Direction": "greater than",
                    "Name": "upper critical",
                    "Severity": 1,
                    "Value": 5.48
                },
                {
                    "Direction": "greater than",
                    "Name": "upper non critical",
                    "Severity": 0,
                    "Value": 5.24
                },
                {
                    "Direction": "less than",
                    "Name": "lower non critical",
                    "Severity": 0,
                    "Value": 4.76
                },
                {
                    "Direction": "less than",
                    "Name": "lower critical",
                    "Severity": 1,
                    "Value": 4.48
                }
            ],
            "Type": "ADC"
        },
        {
            "Index": 5,
            "Name": "MB_P5V_SB",
            "PowerState": "On",
            "ScaleFactor": 0.25,
            "Thresholds": [
                {
                    "Direction": "greater than",
                    "Name": "upper critical",
                    "Severity": 1,
                    "Value": 5.48
                },
                {
                    "Direction": "greater than",
                    "Name": "upper non critical",
                    "Severity": 0,
                    "Value": 5.24
                },
                {
                    "Direction": "less than",
                    "Name": "lower non critical",
                    "Severity": 0,
                    "Value": 4.76
                },
                {
                    "Direction": "less than",
                    "Name": "lower critical",
                    "Severity": 1,
                    "Value": 4.48
                }
            ],
            "Type": "ADC"
        },


I use the busctrl command to see MB_P5V_SB information, it is normal.
root@fws7830bmc:~# busctl introspect --no-pager =
xyz.openbmc_project.EntityManager =
/xyz/openbmc_project/inventory/system/board/FWS7830_
Baseboard/MB_P5V
NAME                                              TYPE      SIGNATURE =
RESULT/VALUE         FLAGS
org.freedesktop.DBus.Introspectable               interface -         -  =
                  -
.Introspect                                       method    -         s  =
                  -
org.freedesktop.DBus.Peer                         interface -         -  =
                  -
.GetMachineId                                     method    -         s  =
                  -
.Ping                                             method    -         -  =
                  -
org.freedesktop.DBus.Properties                   interface -         -  =
                  -
.Get                                              method    ss        v  =
                  -
.GetAll                                           method    s         =
a{sv}                -
.Set                                              method    ssv       -  =
                  -
.PropertiesChanged                                signal    sa{sv}as  -  =
                  -
xyz.openbmc_project.Configuration.ADC             interface -         -  =
                  -
.Index                                            property  t         4  =
                  emits-change
.Name                                             property  s         =
"MB_P5V"             emits-change
.PowerState                                       property  s         =
"On"                 emits-change
.ScaleFactor                                      property  d         =
0.55                 emits-change
.Type                                             property  s         =
"ADC"                emits-change
xyz.openbmc_project.Configuration.ADC.Thresholds0 interface -         -  =
                  -
.Delete                                           method    -         -  =
                  -
.Direction                                        property  s         =
"greater than"       emits-change writable
.Name                                             property  s         =
"upper critical"     emits-change writable
.Severity                                         property  d         1  =
                  emits-change writable
.Value                                            property  d         =
5.48                 emits-change writable
xyz.openbmc_project.Configuration.ADC.Thresholds1 interface -         -  =
                  -
.Delete                                           method    -         -  =
                  -
.Direction                                        property  s         =
"greater than"       emits-change writable
.Name                                             property  s         =
"upper non critical" emits-change writable
.Severity                                         property  d         0  =
                  emits-change writable
.Value                                            property  d         =
5.24                 emits-change writable
xyz.openbmc_project.Configuration.ADC.Thresholds2 interface -         -  =
                  -
.Delete                                           method    -         -  =
                  -
.Direction                                        property  s         =
"less than"          emits-change writable
.Name                                             property  s         =
"lower non critical" emits-change writable
.Severity                                         property  d         0  =
                  emits-change writable
.Value                                            property  d         =
4.76                 emits-change writable
xyz.openbmc_project.Configuration.ADC.Thresholds3 interface -         -  =
                  -
.Delete                                           method    -         -  =
                  -
.Direction                                        property  s         =
"less than"          emits-change writable
.Name                                             property  s         =
"lower critical"     emits-change writable
.Severity                                         property  d         1  =
                  emits-change writable
.Value                                            property  d         =
4.48                 emits-change writable

But I use "ipmitoo sensor=E2=80=9D command, it return the error =
information below as
MB P3V3          | 3.271      | Volts      | ok    | na        | 2.947   =
  | 3.046     | 3.511     | 3.596     | na       =20
MB P5V           | 2.982      | Volts      | ok    | na        | 2.662   =
  | 2.829     | 3.123     | 3.264     | na       =20
MB P5V SB        | 5.048      | Volts      | ok    | na        | 4.484   =
  | 4.766     | 5.245     | 5.471     | na       =20
MB P12V          | 7.215      | Volts      | ok    | na        | 6.386   =
  | 6.723     | 7.429     | 7.829     | na=20

Please give me some advise.

Many thanks
Paul=20


--Apple-Mail=_D5A82F16-A59F-4719-BE44-A77414EECB2B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
all<div class=3D""><br class=3D""></div><div class=3D"">I add the sensor =
in entity-manager config like below</div><div class=3D""><div =
class=3D"">{</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; "Index": 2,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "MB_VMEM",</div><div class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "PowerState": "On",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "ScaleFactor": =
1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Thresholds": [</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater =
than",</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Name": "upper critical",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 1.32</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "upper non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 1.26</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 1.14</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 1.08</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
}</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
],</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Type": "ADC"</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; {</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Index": =
3,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Name": "MB_P12V",</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "PowerState": "On",</div><div class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "ScaleFactor": 0.23,</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Thresholds": =
[</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "upper critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 13.23</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "upper non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 12.6</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 11.4</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 10.77</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
}</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
],</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Type": "ADC"</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; {</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Index": =
4,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Name": "MB_P5V",</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "PowerState": "On",</div><div class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "ScaleFactor": 0.55,</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Thresholds": =
[</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "upper critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 5.48</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "upper non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 5.24</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 4.76</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 4.48</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
}</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
],</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Type": "ADC"</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; {</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Index": =
5,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Name": "MB_P5V_SB",</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "PowerState": "On",</div><div class=3D"">&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "ScaleFactor": 0.25,</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Thresholds": =
[</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "upper critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 5.48</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "greater than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "upper non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 5.24</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower non critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 0,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 4.76</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; {</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; "Direction": "less than",</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; "Name": "lower critical",</div><div class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Severity": 1,</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Value": 4.48</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
}</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
],</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"Type": "ADC"</div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
},</div><div class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D"">I use the busctrl command to see =
MB_P5V_SB information, it is normal.</div><div =
class=3D"">root@fws7830bmc:~# busctl introspect --no-pager =
xyz.openbmc_project.EntityManager =
/xyz/openbmc_project/inventory/system/board/FWS7830_<br =
class=3D"">Baseboard/MB_P5V<br class=3D"">NAME&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;TYPE&nbsp; &nbsp; &nbsp;&nbsp;SIGNATURE =
RESULT/VALUE&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;FLAGS<br =
class=3D"">org.freedesktop.DBus.Introspectable&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;interface -&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;-<br class=3D"">.Introspect&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;method&nbsp; =
&nbsp;&nbsp;-&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;s&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br =
class=3D"">org.freedesktop.DBus.Peer&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;interface =
-&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br =
class=3D"">.GetMachineId&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;-&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;s&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;-<br class=3D"">.Ping&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;-&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;-<br =
class=3D"">org.freedesktop.DBus.Properties&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;interface -&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br class=3D"">.Get&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;ss&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;v&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;-<br class=3D"">.GetAll&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;a{sv}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;-<br class=3D"">.Set&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;ssv&nbsp;&nbsp; &nbsp; =
&nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;-<br class=3D"">.PropertiesChanged&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;signal&nbsp; =
&nbsp;&nbsp;sa{sv}as&nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br =
class=3D"">xyz.openbmc_project.Configuration.ADC&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;interface -&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;-<br class=3D"">.Index&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;t&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;emits-change<br class=3D"">.Name&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"MB_P5V"&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change<br class=3D"">.PowerState&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"On"&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change<br class=3D"">.ScaleFactor&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;0.55&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change<br class=3D"">.Type&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"ADC"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds0&nbsp;interfac=
e -&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br =
class=3D"">.Delete&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;-&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br class=3D"">.Direction&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"greater than"&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;emits-change =
writable<br class=3D"">.Name&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"upper critical"&nbsp;&nbsp; &nbsp;&nbsp;emits-change =
writable<br class=3D"">.Severity&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;emits-change writable<br class=3D"">.Value&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;5.48&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change writable<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds1&nbsp;interfac=
e -&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br =
class=3D"">.Delete&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;-&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br class=3D"">.Direction&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"greater than"&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;emits-change =
writable<br class=3D"">.Name&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"upper non critical" emits-change writable<br =
class=3D"">.Severity&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;emits-change writable<br =
class=3D"">.Value&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;5.24&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;emits-change writable<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds2&nbsp;interfac=
e -&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br =
class=3D"">.Delete&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;-&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br class=3D"">.Direction&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"less than"&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change writable<br class=3D"">.Name&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"lower non critical" emits-change writable<br =
class=3D"">.Severity&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;emits-change writable<br =
class=3D"">.Value&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;4.76&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;emits-change writable<br =
class=3D"">xyz.openbmc_project.Configuration.ADC.Thresholds3&nbsp;interfac=
e -&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br =
class=3D"">.Delete&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;method&nbsp; &nbsp;&nbsp;-&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;-<br class=3D"">.Direction&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"less than"&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change writable<br class=3D"">.Name&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;s&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;"lower critical"&nbsp;&nbsp; &nbsp;&nbsp;emits-change =
writable<br class=3D"">.Severity&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;emits-change writable<br class=3D"">.Value&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;property&nbsp;&nbsp;d&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;4.48&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;emits-change writable</div><div class=3D""><br =
class=3D""></div><div class=3D"">But I use "ipmitoo sensor=E2=80=9D =
command, it return the error information below as</div>
MB P3V3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;| 3.271&nbsp; &nbsp; =
&nbsp;&nbsp;| Volts&nbsp; &nbsp; &nbsp;&nbsp;| ok&nbsp; &nbsp;&nbsp;| =
na&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;| 2.947&nbsp;&nbsp; &nbsp;&nbsp;| =
3.046&nbsp;&nbsp; &nbsp;&nbsp;| 3.511&nbsp;&nbsp; &nbsp;&nbsp;| =
3.596&nbsp;&nbsp; &nbsp;&nbsp;| na&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br =
class=3D""><font color=3D"#ffaa00" class=3D"">MB P5V&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;| 2.982&nbsp; &nbsp; &nbsp;&nbsp;| Volts&nbsp; =
&nbsp; &nbsp;&nbsp;| ok&nbsp; &nbsp;&nbsp;| na&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;| 2.662&nbsp;&nbsp; &nbsp;&nbsp;| 2.829&nbsp;&nbsp; =
&nbsp;&nbsp;| 3.123&nbsp;&nbsp; &nbsp;&nbsp;| 3.264&nbsp;&nbsp; =
&nbsp;&nbsp;| na&nbsp;&nbsp; &nbsp; &nbsp; </font>&nbsp;<br class=3D"">MB =
P5V SB&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;| 5.048&nbsp; &nbsp; =
&nbsp;&nbsp;| Volts&nbsp; &nbsp; &nbsp;&nbsp;| ok&nbsp; &nbsp;&nbsp;| =
na&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;| 4.484&nbsp;&nbsp; &nbsp;&nbsp;| =
4.766&nbsp;&nbsp; &nbsp;&nbsp;| 5.245&nbsp;&nbsp; &nbsp;&nbsp;| =
5.471&nbsp;&nbsp; &nbsp;&nbsp;| na&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br =
class=3D""><font color=3D"#ffaa00" class=3D"">MB P12V&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;&nbsp;| 7.215&nbsp; &nbsp; &nbsp;&nbsp;| Volts&nbsp; =
&nbsp; &nbsp;&nbsp;| ok&nbsp; &nbsp;&nbsp;| na&nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;| 6.386&nbsp;&nbsp; &nbsp;&nbsp;| 6.723&nbsp;&nbsp; =
&nbsp;&nbsp;| 7.429&nbsp;&nbsp; &nbsp;&nbsp;| 7.829&nbsp;&nbsp; =
&nbsp;&nbsp;| na&nbsp;</font></div><div class=3D""><font color=3D"#ffaa00"=
 class=3D""><br class=3D""></font></div><div class=3D"">Please give me =
some advise.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Many thanks</div><div class=3D"">Paul<font color=3D"#ffaa00" =
class=3D"">&nbsp;</font></div><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_D5A82F16-A59F-4719-BE44-A77414EECB2B--
