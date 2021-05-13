Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 436D537FFE0
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 23:44:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh4tf1XCqz3080
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 07:44:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gd-ms.com (client-ip=137.100.132.43; helo=vadc01-egs01.gd-ms.com;
 envelope-from=eric.wetterlind@gd-ms.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 14 May 2021 07:44:10 AEST
Received: from vadc01-egs01.gd-ms.com (vadc01-egs01.gd-ms.com [137.100.132.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh4tL5dYSz2xxq
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 07:44:10 +1000 (AEST)
IronPort-SDR: sUX5uDp68OwoUKGBIXicGbDhrZET5YiDEG1IZK1+sIyHVV+JlATqah20RDGopBbY8X5y7EMxKt
 bqEkWEG2RgkVVxFsG0gwuXcsjsMN8dIULM2WFWXHn0fd6sIemm0yS0SssqE5cyuzvcUmz+cATh
 1TKDoOvuSoUF4WJ5F47T0xOz0hfrrWSM7Ti60Rz71aUxJJZ6MRELg68OxEG35VDPti1u/ez/qX
 k1ZGvrb3Shedc1F8aHxHAA7LU5mwlnpOFgj9qqkgw4dbWuHu0obxJBqfhcC9fXIE5zztHsaoyF
 xF8=
X-IronPort-AV: E=Sophos;i="5.82,296,1613451600"; d="scan'208,217";a="261577"
Received: from unknown (HELO eadc-e-fmsprd01.eadc-e.gd-ais.com) ([10.96.30.97])
 by vadc01-egs01.gd-ms.com with ESMTP; 13 May 2021 17:43:00 -0400
Received: from VADC-MMB03.GD-MS.US (vadc-mmb03.gd-ms.us [10.132.100.63])
 by eadc-e-fmsprd01.eadc-e.gd-ais.com (Postfix) with ESMTP id B3D97A6803B
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 21:43:00 +0000 (UTC)
Received: from VADC-MCA02.GD-MS.US (10.132.100.43) by VADC-MMB03.GD-MS.US
 (10.132.100.63) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 May
 2021 17:42:59 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (137.100.132.86)
 by VADC-MCA02.GD-MS.US (10.132.100.79) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 13 May 2021 17:42:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=NnpwAUg4RkYZNDUd4waQ4zFGeSKv7CK1Pmx3j+oMacxGYv5ZAUDLUI6tZoKVq771xtSZ6mbiTIgLPNIefuClyFKwOlSG9xoYgqNyoURTubevQklo5RnhafefouE6/Hmwn0C8zsE+bpNNv2Rh8uEHykSlX6nCGrzdRr5zmP7Y1SCaHuPkLYXyWgDPXYSCpnJiONfeiLhxuIe3/+Cj/vXIPleQvxLQQSLQAs5nCIOw75e6h66mTkhnGkZ6eWko2Em1rzFJ1PuSIIk5tkhPRUbFTj5e0/QdFyW98Xk9jof034WZ3dR1afCU2lVjQeVHkQkPF/wyvRVBYp9Al1vA8nwfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qpiap5oWWoNr6igUxQDalPBHEVM41DtrD0dJQ3Eegws=;
 b=SoaSaMon24cjEVDfvbcuMdei5M6Jb6siT9BpnjBLvG0xjaQWG6SDAuWp94+urHx55nKz8Qsmstc5hDU4dZa6l9vuNDbFN0cGfPsnyIFjlyfoBWHXYc2YJmzIoVt1gADM1x57F0lDFvaLz8Pja6+LSxhT2lpYIfkdIU0SMqAUnnPqSt3P6nrCy0qyYMv21S7xfm8IF1+tSZHMfk8ybsYF7yrfIwpy5T5Bcxt4J3zAd4GphlHRv2LuC3dvirwXSQvNGJsctaZSVP7tDU/TQYqDh3Pk/x3Ce5og9xKevTpWhE+j3Ba/roymVmEmBlWG9aju2+BFF+QWU857BiL75rPOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gd-ms.com; dmarc=pass action=none header.from=gd-ms.com;
 dkim=pass header.d=gd-ms.com; arc=none
Received: from BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40c::13)
 by BN3P110MB0418.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:40a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.45; Thu, 13 May
 2021 21:42:59 +0000
Received: from BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM
 ([fe80::f0e3:83ff:53bf:2171]) by BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM
 ([fe80::f0e3:83ff:53bf:2171%8]) with mapi id 15.20.4087.053; Thu, 13 May 2021
 21:42:58 +0000
From: "Eric.Wetterlind@gd-ms.com" <Eric.Wetterlind@gd-ms.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Aspeed2600 EVB Hwmon problem
Thread-Topic: Aspeed2600 EVB Hwmon problem
Thread-Index: AddIPj9rn5DhNLaBRgWtFXf4x6iGZA==
Date: Thu, 13 May 2021 21:42:58 +0000
Message-ID: <BN3P110MB05467667602EC7ABA6A3C029BC519@BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=gd-ms.com; 
x-originating-ip: [137.100.137.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf0daeea-4d2b-4895-4820-08d91658137f
x-ms-traffictypediagnostic: BN3P110MB0418:
x-microsoft-antispam-prvs: <BN3P110MB04188FDF5B62C73CE4770ABFBC519@BN3P110MB0418.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6mUyM03moZoxS7FiwnPuua9e/5LTKDhj0fFin2cYR0SU4tL3Zn0cw20x+u/XwVD1OCIKt7N09D2V+SqrEU8kROa1WzXhowJDI8vKnvqCHuB0BL+bbOLWiyXJhfr9bUc75/EZVtBeIHSl0uiKHT/sBTCCUFaLxzlRwQ5iDlb50Y/dZ8Kq2WywKWf27hptOl+sWIBk5weATe7Js4VbR2uEuAnbtYoqpC8QIsx5AyDXaFvgqmh1Xp6LN9hZOmAoQjLR0beodu9PxtPsgJFnCRkQARJkramatCegXrNJ4kV7FIYhXQV796b72pCVo1FA9J7kMSWsM5xVhr80ZJNHh4xSRDPU9cVDDCUkTeBGaA62F1cMW3BIlTos8V68FAa3RG+yhtiv/R5Io1rAYxxSM8nKFXgKWonEo5RJHdHyJ6stD2+nF7l+mFA8rRknkXKSUIPcmfQ4WY2pp7Y0yUIEp5ootn/lXAiUqF9sgnde+5TXV8i6hJX0bRcCycmyJRZPXgdtrDJhNqpT88SESCY42sbOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(136003)(39860400002)(71200400001)(7696005)(2906002)(86362001)(8676002)(186003)(6916009)(33656002)(38100700002)(122000001)(8936002)(64756008)(26005)(55016002)(6506007)(76116006)(478600001)(9326002)(5660300002)(52536014)(316002)(66446008)(9686003)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YbtnOK4PFZ8GJDl0xgyH0fSP/aVbvYR0G9jwryvb9dmY9eECl0JWkdMinXMJwRtNClRCinB0QSn9GFJ4EMBwPFEZNdERJpD7ZXDe1K5mzqxy5n/4tagmOLMnqY65RU8PP4cOtV+9V57WDuSyQ2JUE6xEk/wha9T/O5zpYu7/qpMcLhv3k1/PLL14KvSN0PhuWgBpfYGSwS9L65p23tZexsrlxqrQs/ft3j7TusmyTRpv7ynTGwQ9sbMU6rXwX0BSN8CI6BSA4m6FszOiR7cZcuemagmncvfI/YtTdXaMAUuB80Jkm7WMIRZO113jKUvPeIUnd6d8jCF0jl3p9ZSgUUHRf4vG2jWTC2sbi6VgLXfi3RNEDjpsMmamPcxlwR4RKn029zJmd+eFWFst5rzes+FaRZmT5t5h+MhgDdzFlLSUPY7RYzvyANstQpvXCDqWMF+o3ugh9cfZmmBF9Yg0zEynVoHfUdn2drwbJOdEi5kTcMCDwkDtjR+9FH/ZUucn5omtGp1QrRI5n0oEkNOcS5CxFhaQD3IiX8rjAvyvR9HzQGb881Np5aVUEKBjUqtkRB4+HZ/LpUHZRbhgILjA/vR2Thm8U7WOT2e1E/n9QFgXw3qsVupBg+obs0GSpPf81fijZkfgwBbWDg0VJ84z5RLoMR8oagYcAar9X5qB0LMRTwupPBQaIQiRZQweiku40t3qiIHlnoC4zE7OI45QBlkx+USTCn32/Lm7Eh/krqU=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BN3P110MB05467667602EC7ABA6A3C029BC519BN3P110MB0546NAMP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0daeea-4d2b-4895-4820-08d91658137f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 21:42:58.8718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7c5a26cf-ddf0-400c-9703-4070b4e3a54d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3P110MB0418
X-OriginatorOrg: gd-ms.com
X-TM-SNTS-SMTP: 31223F733B7C8F1A9187DDAFFB2722D4724F9211FFF7D59F06698FFE87AA98192000:8
X-Content-Scanned: Fidelis Mail
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

--_000_BN3P110MB05467667602EC7ABA6A3C029BC519BN3P110MB0546NAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I am currently trying to add a simple temp sensor to my image, which is bas=
ed off of the evb-ast2600 image.  I have successfully been able to add this=
 sensor to a ast2500-based image, but the 2600 is not cooperating.  Any poi=
nters would be greatly appreciated (and sanity-saving), as I am near the en=
d of all paths I know of.

Project bblayers.conf.sample contains the following:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  ##OEROOT##/meta \
  ##OEROOT##/meta-poky \
  ##OEROOT##/meta-openembedded/meta-oe \
  ##OEROOT##/meta-openembedded/meta-networking \
  ##OEROOT##/meta-openembedded/meta-python \
  ##OEROOT##/meta-phosphor \
  ##OEROOT##/meta-aspeed \
  ##OEROOT##/meta-ourproject \
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The device tree has this (and using the standard aspeed_g6_dtsi):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
&i2c1 {
        status =3D "okay";

        tmp423@4c {
                compatible =3D "ti,tmp423";
                reg =3D <0x4c>;
        };
};
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Recipes-phosphor/sensors contains the directory structure phosphor-hwmon/ob=
mc/hwmon/ahb/apb/bus@1e78a000/i2c-bus@100, with tmp423.conf in it.

The phosphor-hwmon_%.bbappend file contains this:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FILESEXTRAPATHS_prepend_ourproject :=3D "${THISDIR}/${PN}:"
EXTRA_OECONF_append_ourproject =3D " --enable-negative-errno-on-fail"
CHIPS =3D " \
        bus@1e78a000/i2c-bus@100/tmp423@4c \
        "
ITEMSFMT =3D "ahb/apb/{0}.conf"
ITEMS =3D "${@compose_list(d, 'ITEMSFMT', 'CHIPS')}"
ENVS =3D "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE_${PN}_append_ourproject =3D " ${@compose_list(d, '=
ENVS', 'ITEMS')}"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

When booting up in Qemu, the device is recognized:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#cat /sys/firmware/devicetree/base/ahb/apb/bus@1e78a000/i2c-bus@100/tmp423@=
4c/compatible
ti,tmp423

# cat /sys/devices/platform/ahb/ahb\:apb/ahb\:apb\:bus\@1e78a000/1e78a100.i=
2c-bus/i2c-1/1-004c/name
tmp423
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

There is even a link in /sys/bus/i2c/devices/1-004c to /sys/devices/platfor=
m/ahb/ahb\:apb/ahb\:apb\:bus\@1e78a000/1e78a100.i2c-bus/i2c-1/1-004c.

The .conf file shows up in /etc/default/obmc/hwmon/ahb/apb/bus@1e78a000/i2c=
-bus@100.

The problem is that nothing ever gets populated into /sys/class/hwmon.  It =
is an empty directory.  On our ast2400 and ast2500 images, this same proced=
ure, stripped down to almost the exact same specs as I've mentioned above, =
produces a link as /sys/class/hwmon/hwmon0.

What am I missing?

Regards,
-Eric

--_000_BN3P110MB05467667602EC7ABA6A3C029BC519BN3P110MB0546NAMP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am currently trying to add a simple temp sensor to=
 my image, which is based off of the evb-ast2600 image.&nbsp; I have succes=
sfully been able to add this sensor to a ast2500-based image, but the 2600 =
is not cooperating.&nbsp; Any pointers would
 be greatly appreciated (and sanity-saving), as I am near the end of all pa=
ths I know of.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Project bblayers.conf.sample contains the following:=
<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta-poky \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta-openembedded/meta-oe \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta-openembedded/meta-networking =
\<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta-openembedded/meta-python \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta-phosphor \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta-aspeed \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ##OEROOT##/meta-ourproject \<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The device tree has this (and using the standard asp=
eed_g6_dtsi):<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">&amp;i2c1 {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =
=3D &quot;okay&quot;;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp423@4c=
 {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;ti,tmp423&quot;=
;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x4c&gt;;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></=
o:p></p>
<p class=3D"MsoNormal">};<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Recipes-phosphor/sensors contains the directory stru=
cture phosphor-hwmon/obmc/hwmon/ahb/apb/bus@1e78a000/i2c-bus@100, with tmp4=
23.conf in it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The phosphor-hwmon_%.bbappend file contains this:<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">FILESEXTRAPATHS_prepend_ourproject :=3D &quot;${THIS=
DIR}/${PN}:&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">EXTRA_OECONF_append_ourproject =3D &quot; --enable-n=
egative-errno-on-fail&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">CHIPS =3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus@1e78a=
000/i2c-bus@100/tmp423@4c \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:=
p></o:p></p>
<p class=3D"MsoNormal">ITEMSFMT =3D &quot;ahb/apb/{0}.conf&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">ITEMS =3D &quot;${@compose_list(d, 'ITEMSFMT', 'CHIP=
S')}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">ENVS =3D &quot;obmc/hwmon/{0}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">SYSTEMD_ENVIRONMENT_FILE_${PN}_append_ourproject =3D=
 &quot; ${@compose_list(d, 'ENVS', 'ITEMS')}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When booting up in Qemu, the device is recognized:<o=
:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">#cat /sys/firmware/devicetree/base/ahb/apb/bus@1e78a=
000/i2c-bus@100/tmp423@4c/compatible<o:p></o:p></p>
<p class=3D"MsoNormal">ti,tmp423<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># cat /sys/devices/platform/ahb/ahb\:apb/ahb\:apb\:b=
us\@1e78a000/1e78a100.i2c-bus/i2c-1/1-004c/name<o:p></o:p></p>
<p class=3D"MsoNormal">tmp423<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There is even a link in /sys/bus/i2c/devices/1-004c =
to /sys/devices/platform/ahb/ahb\:apb/ahb\:apb\:bus\@1e78a000/1e78a100.i2c-=
bus/i2c-1/1-004c.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The .conf file shows up in /etc/default/obmc/hwmon/a=
hb/apb/bus@1e78a000/i2c-bus@100.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The problem is that nothing ever gets populated into=
 /sys/class/hwmon.&nbsp; It is an empty directory.&nbsp; On our ast2400 and=
 ast2500 images, this same procedure, stripped down to almost the exact sam=
e specs as I&#8217;ve mentioned above, produces a
 link as /sys/class/hwmon/hwmon0.&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What am I missing? <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">-Eric<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN3P110MB05467667602EC7ABA6A3C029BC519BN3P110MB0546NAMP_--
