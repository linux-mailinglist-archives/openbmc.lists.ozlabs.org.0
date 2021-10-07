Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F21424D4D
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 08:32:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ1h91SnTz2ywD
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 17:32:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=VFh2Xqvg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.254.42;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=naveen.moses@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=VFh2Xqvg; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254042.outbound.protection.outlook.com [40.92.254.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ1G72ldNz2ypn
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 17:13:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W18mtDs9IWq+3wwXQYjOCznmxIo0zT7NQc48UbWBT4oa4sk9w0V/Q6o7NothyoWGiwIrPDMU89uW98uHRm1NkMy/M4nkAA5uaKH5dD32+Vq7jdAqeTOCVbXqH1tVvInUIVLnzICQk131wJdFi7buohfsfyIYjbaF9vjAZm/DhjUvVcb1+d924nGPRnh1YnVOsspnbCoD1L42iCKUef9KzibRUiEOLPT6ZgzLC2DfCqM4FxQR+Bp+xZzlWPU6p1uA2AhH7hg3wklkR5sPBbacLpI+M7Ispi3nuCtqRnaAqumWB993axnbjb4EjoGMv3N96Ve8jCuTAkoTKwBJitDXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NVwqCV+6r9NsQOdSxEGV8wSYqzhWkCnxKV4hfXtmIg=;
 b=iwKT7XAtexTo+FqQVIcgQX0W6ZR60HKQpFsoMvLdFp4+W5DTENH6fHjRhBX74KJ7rMINH0wF1N1eVE9HVfrYDHt/6nlv/9xNiv/SbxmSQ1u+jp/uFzCfVQVW8YOeXyUptfG5GahqZtRkkvAP5Aad+nM6UQeB2K/RnPQBcCG0ZWq1jY56tSvuZ3doStM2uG8hwcLrTUB6XzaLwIowYF77ccV5LMwEUznTrj5qQwftdIahEg3CHh283PQFjSqd9TXcvNYsEpZbXTDAYHt2JVWQquFd6RPPhj2IyMuC0DQU8EEBODo/SIPzJISwur2hgjGO/ECAJjxzXxTcFndvuP4haQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NVwqCV+6r9NsQOdSxEGV8wSYqzhWkCnxKV4hfXtmIg=;
 b=VFh2XqvgiPGbrcg6G3QAAROEt14KJLIRZhWZePh+qGAf7I8XmSMN/vWHFeGyp4Op2Qd2dRuimNvdNHr/AbEOAgAbsSTQhtLkLguiVmVVY6w8i0iUDaHXSdQKznAIjgO9E9iIV1v5b/BXq9Y6m2Vr/j0lDMjbgEZy7Kj9d0P1mM02uyBUevPV5QUwp6mRVFlJQEe+t+pD+RX+0zBOS3VPYI+Ms7DlTcaql7ZfTF7hviPNv9Jpj6un1cK+8iw2NmqJWicymSIUTcTB4g5xRPqChib/910sQ2wo1172CE+SxGLD+5y056YEmDRVl6Jb3o81HvbSO5cmioZr3VHKufqbcw==
Received: from PS2PR02MB2695.apcprd02.prod.outlook.com (2603:1096:300:49::20)
 by PS2PR02MB4056.apcprd02.prod.outlook.com (2603:1096:300:5e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 06:12:55 +0000
Received: from PS2PR02MB2695.apcprd02.prod.outlook.com
 ([fe80::df6:eb23:2b3f:8548]) by PS2PR02MB2695.apcprd02.prod.outlook.com
 ([fe80::df6:eb23:2b3f:8548%3]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 06:12:55 +0000
From: naveen moses <naveen.moses@hotmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: support for gpio  as ipmb sensor 
Thread-Topic: support for gpio  as ipmb sensor 
Thread-Index: AQHXubK5qcPh3V4zuk+6NBNR0ABXM6vFG3gAgAHx460=
Date: Thu, 7 Oct 2021 06:12:55 +0000
Message-ID: <PS2PR02MB2695DA8CBF0598991A64D7B691B19@PS2PR02MB2695.apcprd02.prod.outlook.com>
References: <PS2PR02MB26959672C7002D26EB5F4A4691AF9@PS2PR02MB2695.apcprd02.prod.outlook.com>
 <ef4d5ac6-49e8-40d6-9e6b-1fe030f3909a@www.fastmail.com>
In-Reply-To: <ef4d5ac6-49e8-40d6-9e6b-1fe030f3909a@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8a722fd9-9af1-7190-05be-95c15303b103
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [7Lhibg7E20K5fB6gfxUZG3UTlnoQPBpcchDSJX3qwlUVTDHd1vDoJA==]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20beb616-c589-473c-1f33-08d9895980cb
x-ms-exchange-slblob-mailprops: IABc8NJKQC6atDqFPwRFl1r0UPoteFv2f8oAmJJ/mhnZo9xUCnNlhYFnOBghjGVUKpplDLGocmNOjKjXSl87D1tmbuCYN5j1TGOCS1QEKEJw5p6ACuusApMo3HidklKRFtxZGxERcFW8hfcqBNhQ2pviFNGgUBKsYys0e+zngu/JqjpzH36CfXfAsGQBpEQFjqSYF+xH6jCrF+tacRTbx5eAiZEZtzJZ9E6Jm37YaOwuZwCgLavtIJ1Ut2x+KHTKFcJMNTFeERlRavoe2wjWHgx4nDHU7eS2YeyyKSX92r8r0ddbEiauxBevG+/+VFmePXiLBmQaaSXYw6LKAT/NteHlSDQgU+d17vcFMuM+VLED9/T7gzMWlN1xNhmk5RcOjdlUoiBbFNua5oDls5/Zwnb91fPC99vInhi5m26YWFWGju0/XdJgvpKWKPutlbvLrSn9sqDv1G0sPCtW04DCQU5pa32a9flOtmk8G3OXrVWQqjLTnOUX8LoGztSgWDB87dKAzYBBznsf+r5D7BUEPBu5rcM8Ff0DXRP+OOcuSg2IqMAK6Fnt4bMWJx2117wXtDnToGV++s1jKixRFwkxiEZx9tO7NyB++HHrrGEu81daHI4dq4ICzHRdKtfM0cx+NLGFBo7WEuVQuQ5eHO9DtI0N0scIE6884/vFkTgJFsf18+oPgHTLBi5BKw10/V4mhr6nfJ/VA9UD4kPh3OKEfkOjO/+UytLI
x-ms-traffictypediagnostic: PS2PR02MB4056:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZkXuvlY8HRbqkQ2ZcmJtw0+fTHB7jaUW2Y0MS2wDH9EZK8YlfA1JmLE1/zCmx9DBr8DwX4ZevSDg3DZ80xg3vrJpu4WZ8JCY7IJa0qvBPU1DWSPASp1SWq9DPsEzBVXG3izEUyduqRf7l+CfUBscreX3w4BJ43bxxdUA0/VTpVsM2nyr1MvDOz5Gkngjpye/7zCy5XKkQt4e/eng6jymOVAyeaZkD3tF1w0au7ZAmJyJUqPGsH4vy2bGZ6HjArJT6gumgX1o97AjxP+PMzG0t2gjdN9fZpEPpBrqCK3NU70Mxr7iUcQNzVkkqHnFIBT6hDMdRVtpTb1WBauVk31H7w/xArPL0iQZA+qr7FycFqjMnqZHB7OrOajwWOGuERCvmkHAfaEusuyRHZFjiPdFzy6/aFO6SbexUkzr3WT1YLIzgAzKDOtYvBMppfVKWhQp
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: r91uWuoXtZ4WWDsOSApjh8m41N0yIxSBPNsfiHwSoyX1PxvuVbxkv2Oru2ejuKGqq+s0YvpvRqg4ah9dJA8buktO+jBgHfrVH+f5ZMhJBIdhQyLVlJxNfvjzgMrTvxzix+InC0NUMhEc60ycPrxpEuLSe5IHd8x6FfKsvqf/KfMqSmPYT7QBHweKNg3XmimF
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR02MB2695DA8CBF0598991A64D7B691B19PS2PR02MB2695apcp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-0bb73.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB2695.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 20beb616-c589-473c-1f33-08d9895980cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 06:12:55.5086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR02MB4056
X-Mailman-Approved-At: Thu, 07 Oct 2021 17:31:45 +1100
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 naveen moses <naveen.moses@outlook.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PS2PR02MB2695DA8CBF0598991A64D7B691B19PS2PR02MB2695apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for the suggestions. please find my comments below:

What do you mean when you say "cannot be directly monitored using gpio
monitor"?

Naveen : The gpio is connected via ipmb bridge interface so to read its sta=
te it should be done via ipmb call.
so, it cannot be specified as direct gpio config to be read by gpio-monitor=
 process.

What about modelling the behaviour the GPIO state represents rather
than just providing a DBus interface to the GPIO values?

Naveen : The gpio behavior is done in separate process and there is a separ=
ate process which is depends on the gpio state.
Here the implementation is not for a specific gpio. there are 10 to 30 simi=
liar gpios
which can be only accessed via ipmb bridge interface.  The ipmb gpio sensor=
 we are proposing
could be for multiple number ipmb based gpios. The states of the individual=
 ipmb gpios are monitored if they are configured in entity manager as gpio =
sensors.
their state is updated as sensor state property which can be read by other =
dependent properties.

Thanks,
Naveen
________________________________
From: Andrew Jeffery <andrew@aj.id.au>
Sent: Wednesday, October 6, 2021 5:46 AM
To: naveen moses <naveen.moses@hotmail.com>; openbmc@lists.ozlabs.org <open=
bmc@lists.ozlabs.org>
Cc: Zhikui Ren <zhikui.ren@intel.com>; Jae Hyun Yoo <jae.hyun.yoo@linux.int=
el.com>; Vernon Mauery <vernon.mauery@linux.intel.com>; Ed Tanous <ed@tanou=
s.net>; naveen moses <naveen.moses@outlook.com>
Subject: Re: support for gpio as ipmb sensor

Hi Naveen,

On Tue, 5 Oct 2021, at 23:46, naveen moses wrote:
> Hi All,
>
> we have a couple of gpios ( input ) accessed via ipmb commands in our pla=
tform.
> which cannot be directly monitored using gpio monitor.

What do you mean when you say "cannot be directly monitored using gpio
monitor"?

>
> our idea is to expose them as ipmb sensors which has gpio state as
> property which is updated based
> on the current state of the gpio.
>
> at present there is no compatible interface under
> xyz/openbmc_project/sensors for gpio as sensor.
>
> So is this acceptable to create a new interface for gpio state under
> xyz/openbmc_project/sensors :
> interface name : gpioState
> which has a property named value whose possible values are boolean
> (true or false).

What about modelling the behaviour the GPIO state represents rather
than just providing a DBus interface to the GPIO values?

Andrew

--_000_PS2PR02MB2695DA8CBF0598991A64D7B691B19PS2PR02MB2695apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi Andrew,</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Thanks for the suggestions. please find my comments below:</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">What do you mean when you say
 &quot;cannot be directly monitored using gpio</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">monitor&quot;?</span><br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &q=
uot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-colo=
r: rgb(255, 255, 255); display: inline !important;">&nbsp;</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &q=
uot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-colo=
r: rgb(255, 255, 255); display: inline !important;">Naveen : The gpio is co=
nnected
 via ipmb bridge interface so to read its state it should be done via ipmb =
call.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &q=
uot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-colo=
r: rgb(255, 255, 255); display: inline !important;">so, it cannot be specif=
ied
 as direct gpio config to be read by gpio-monitor process.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important"><span style=3D"background-color=
:rgb(255, 255, 255);display:inline !important">What
 about modelling the behaviour the GPIO state represents rather</span><br>
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t">than just providing a DBus interface to the GPIO values?</span><br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important"><br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">Naveen : The gpio behavior is
 done in separate process and there is a separate process which is depends =
on the gpio state.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">Here the implementation is not
 for a specific gpio. there are 10 to 30 similiar gpios</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">which can be only accessed via
 ipmb bridge interface.&nbsp; The ipmb gpio sensor we are proposing</span><=
/div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">could be for multiple number ip=
mb
 based gpios. The states of the individual ipmb gpios are monitored if they=
 are configured in entity manager as gpio sensors.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">their state is updated as senso=
r
 state property which can be read&nbsp;</span><span style=3D"font-family: &=
quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe =
UI&quot;, -apple-system, system-ui, Roboto, &quot;Helvetica Neue&quot;, san=
s-serif; font-size: 14.6667px;">by other dependent properties.</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">&nbsp;&nbsp;</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, system-ui, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255);display:inline !important">Thanks,
<div>Naveen</div>
</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Andrew Jeffery &lt;an=
drew@aj.id.au&gt;<br>
<b>Sent:</b> Wednesday, October 6, 2021 5:46 AM<br>
<b>To:</b> naveen moses &lt;naveen.moses@hotmail.com&gt;; openbmc@lists.ozl=
abs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Cc:</b> Zhikui Ren &lt;zhikui.ren@intel.com&gt;; Jae Hyun Yoo &lt;jae.hy=
un.yoo@linux.intel.com&gt;; Vernon Mauery &lt;vernon.mauery@linux.intel.com=
&gt;; Ed Tanous &lt;ed@tanous.net&gt;; naveen moses &lt;naveen.moses@outloo=
k.com&gt;<br>
<b>Subject:</b> Re: support for gpio as ipmb sensor </font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Naveen,<br>
<br>
On Tue, 5 Oct 2021, at 23:46, naveen moses wrote:<br>
&gt; Hi All,<br>
&gt;<br>
&gt; we have a couple of gpios ( input ) accessed via ipmb commands in our =
platform.<br>
&gt; which cannot be directly monitored using gpio monitor.<br>
<br>
What do you mean when you say &quot;cannot be directly monitored using gpio=
 <br>
monitor&quot;?<br>
<br>
&gt;<br>
&gt; our idea is to expose them as ipmb sensors which has gpio state as <br=
>
&gt; property which is updated based<br>
&gt; on the current state of the gpio.<br>
&gt;<br>
&gt; at present there is no compatible interface under <br>
&gt; xyz/openbmc_project/sensors for gpio as sensor.<br>
&gt;<br>
&gt; So is this acceptable to create a new interface for gpio state under <=
br>
&gt; xyz/openbmc_project/sensors :<br>
&gt; interface name : gpioState<br>
&gt; which has a property named value whose possible values are boolean <br=
>
&gt; (true or false).<br>
<br>
What about modelling the behaviour the GPIO state represents rather <br>
than just providing a DBus interface to the GPIO values?<br>
<br>
Andrew<br>
</div>
</span></font></div>
</body>
</html>

--_000_PS2PR02MB2695DA8CBF0598991A64D7B691B19PS2PR02MB2695apcp_--
