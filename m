Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553E423452
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 01:12:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPCzQ6S3mz2yg6
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 10:12:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Jot/pdjB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.253.76;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=naveen.moses@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=Jot/pdjB; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253076.outbound.protection.outlook.com [40.92.253.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNym75Jvdz2xtH
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 00:16:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdMezedQAKOYNCMJacmK7drxgHB+5ObN7e7Ns917THyenfbl96eZbpl5HGK0FFELknk0hJFqshJLEmoDAGlDpc57FyfVC/F1kq4httNOxp7YzDn0AagGretv2gcxX7fNMyQTqzRrjOk7J51zUeJWrNgmeZaOrZX6hl8dzBSbXBOzTBkG4nGe67ysd/hapvC/0wyaVxJezRUkKLCWegyZx1vDABNWkZTX2cdO7iP2LVCJtTADd9fHEjyTx/gC4w6CaFzctyyEF86EUsv6/X85B4wkWQdYJ6aW4lfl8B8ojUsGKmvcEPBRfh8gLDa8DkWSjlokzAtlkrC1XUJDnHxYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgb7MBl2xBrGgvRZW+zBt/o/TPTvaS+53xhWj1YJUd0=;
 b=StUHLqD2M6fk0tOyHeVnBxgIXRTbYLJBpMNN6N0PnAkMcKZXkRXXqkLXNBKExuylhI7MU9p/fht9u4WuI/OamJy79TV8MbJsz9/M3Z8HgdV7/0EDuZujIiFmUgMkKjyB2U0g43FwCc3X56FfUWe4338SISWFJ0yd6uT1x7IHlkFhAo88UsyBwT6WuY7zqVtz8rSS+VBbezjNq9pxry207+FDKfsYucSbMybwhjIWZHZdmP6u/d+lF1Dwb9Wt34yF+Hmg2h3NEraix4dpy3T4eiJIBlWJWPXzM2nHnkVUdACbfAZl5OJPL8/TFIjejkj1aM8hMI+zTH6owyZTAYxn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgb7MBl2xBrGgvRZW+zBt/o/TPTvaS+53xhWj1YJUd0=;
 b=Jot/pdjBTrzF6XEFOVZdtmizWFFh87+vLeJUGe3u93bklqTteE0VzlZcOUBGA3NP8OhWB+F9orajD4a8A6/r8BehxzxJAVA35sgFfmvsjJJD+bxnHUtLVYBGtxZViVY05QE2JELJ9YJpAOouEF8zhg9G93VvIpgRWQbHGGbQXzL1ZB6exbCTIg9iVtNwsKQjwuH6wJ6tJhBfd/ZLAS3o1TPocPbFZflo+YLL35qbnbY46od7Wly9xlf8KQxdSWGwEF/Z19bZw7D7twRKasLWpsH4/0IEywPi3d1GyJKpt+KBHGHAShe0IixknCtZ0LndLNW39BaMncimo0YmPRNNmg==
Received: from PS2PR02MB2695.apcprd02.prod.outlook.com (2603:1096:300:49::20)
 by PS2PR02MB3334.apcprd02.prod.outlook.com (2603:1096:300:39::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Tue, 5 Oct
 2021 13:16:34 +0000
Received: from PS2PR02MB2695.apcprd02.prod.outlook.com
 ([fe80::df6:eb23:2b3f:8548]) by PS2PR02MB2695.apcprd02.prod.outlook.com
 ([fe80::df6:eb23:2b3f:8548%3]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 13:16:34 +0000
From: naveen moses <naveen.moses@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: support for gpio  as ipmb sensor 
Thread-Topic: support for gpio  as ipmb sensor 
Thread-Index: AQHXubK5qcPh3V4zuk+6NBNR0ABXMw==
Date: Tue, 5 Oct 2021 13:16:34 +0000
Message-ID: <PS2PR02MB26959672C7002D26EB5F4A4691AF9@PS2PR02MB2695.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a4754a12-d5c7-1677-ecff-67f996f76739
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [GkKKNV//xapbDLmIsIvUNxYdkqTvUgQIDV9Tg8mCi0QCeHbV71PHKA==]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 950dfc01-bf60-4578-a911-08d988025acb
x-ms-exchange-slblob-mailprops: CjO2us0gQYBBflgMvgBqEnDrBEd7ee/uBOJmzrWnWnbUqJliI4SGtLzXjJ8MRvJRWhpkhAd7l+REwJQPy1ii2StwiWctq+7GwMFxY25SGDFrFmMf2qJf4BNltFb5E9yX3biURu0bE6/UFkk3nP70Fr2IZtZctRf63wUkeL79xDY4Fwj5HHUbI95jucIzfFEDR4q4F3UOeiBqqykQxdid0ZMS5dxIRfALplrD/v195AcBN6wDyrJYaQnfNK0eitunkWDVHWyvcorLt4JT+3LN0D4JDdiO+E9kinCuHP1/JWvLVfYw3mb8s5KujMezPT2VtDt2ke8gGtNxmlpCtN2UF9uhxYYt3heVN6Jw56/eM3IIXcUUQgKW+jktV+Et8yaTpwHXv9pIsk2/4SZh4h6bOrD71IK+7XU1gRKLjZBtIpzIGTsBhz0mimwbe+SPOmanA9PMt92udmyh+Yk4zGO0fCpg7TLDZcIHzYENn0uYQ8OVu+cCbyMJIVP1mp+WRRvSEMiBpGuEAAmzz3xa2oy4Z3O5zjPwjWRo7AwSgBmk0B5s+KsH/twTFOMvYO5wPZ62QcSs662eS151mK3dGszBX6KUsGxzq64RzWnS9Jjf8XxqyzdC/9p5pzANquMWDlNCLRHy3LAuJtF0E6M5gPWbd/c1C54MVdK8K9C8xD+RAGTCDLVdvWSsrLc9r+cG9Qfr
x-ms-traffictypediagnostic: PS2PR02MB3334:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PwQ+PYi5nb5D0rEai///QpO/3ifKHTpchOOnD7PDjixupk7u+xXNs6ab5LMZgrJ1MKJCCZzK69Y10tY4N1u9h1ENAijdXK7P3u+OIC3XItD/Gqqobsh6c/v6LW5ky6UDYH8G4Q6U+FN7kIawNCT3UOp3Zw+nfnj8FklcWZj8EsCjilDT6Wmq1TX8RqercytOXYM/5N2R4axDuQqGyaasNKycG4afRObJ0F18iGcOe26dpXQVrifAmUPA8PEbQCXm6Rg0Q1BpsTSo6dRbaZWdwUrqRHxeL9bPM41J2z13/UOGbSjANK5hpbRmKXGCE5EmN3L7RDev60QAl+kUaqT6zzPzrX8VGM/yTanPAFfy4Lu5DqfuKqwKTwZvwyn0iKk2MdwQWE0DZGGRo+PPy8t1LjFvKVo13gAe3wkJ6LWsYb4=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: vft3AftImSE7WQmO1C6pYKLcL5PI+/ttR+pP4CpUe4sM3WPVPVw7j8LMA5dghq+yi5HIJefVeU3yr4eV1zZvzJ9yAUKkEPG6x1LYzBDBEg2EOcIW/gOQlv5sYy6YUEXYJUg2icV7xNEYu5yyZ27BxpZAT4piO0ULVUlf2T3WBgaGc0nXWVKhF8c5SHNrXfIx
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR02MB26959672C7002D26EB5F4A4691AF9PS2PR02MB2695apcp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-0bb73.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB2695.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 950dfc01-bf60-4578-a911-08d988025acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 13:16:34.3315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR02MB3334
X-Mailman-Approved-At: Wed, 06 Oct 2021 10:12:12 +1100
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
Cc: "zhikui.ren@intel.com" <zhikui.ren@intel.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "ed@tanous.net" <ed@tanous.net>, naveen moses <naveen.moses@outlook.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PS2PR02MB26959672C7002D26EB5F4A4691AF9PS2PR02MB2695apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

we have a couple of gpios ( input ) accessed via ipmb commands in our platf=
orm.
which cannot be directly monitored using gpio monitor.

our idea is to expose them as ipmb sensors which has gpio state as property=
 which is updated based
on the current state of the gpio.

at present there is no compatible interface under xyz/openbmc_project/senso=
rs for gpio as sensor.

So is this acceptable to create a new interface for gpio state under xyz/op=
enbmc_project/sensors :
interface name : gpioState
which has a property named value whose possible values are boolean (true or=
 false).

any alternate implementation suggestions or corrections are welcome.

Thanks,
Naveen.


--_000_PS2PR02MB26959672C7002D26EB5F4A4691AF9PS2PR02MB2695apcp_
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
Hi All,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
we have a couple of gpios ( input ) accessed via ipmb commands in our platf=
orm.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
which cannot be directly monitored using gpio monitor.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
our idea is to expose them as ipmb sensors which has gpio state as property=
 which is updated based</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
on the current state of the gpio.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
at present there is no compatible interface under xyz/openbmc_project/senso=
rs for gpio as sensor.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
So is this acceptable to create a new interface for gpio state under <span =
style=3D"background-color:rgb(255, 255, 255);display:inline !important">
xyz/openbmc_project/sensors :</span>&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
interface name : gpioState<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
which has a property named value whose possible values are boolean (true or=
 false).</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
any alternate implementation suggestions or corrections are welcome.&nbsp;&=
nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Naveen.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_PS2PR02MB26959672C7002D26EB5F4A4691AF9PS2PR02MB2695apcp_--
