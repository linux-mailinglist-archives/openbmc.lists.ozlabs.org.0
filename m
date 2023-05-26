Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6BD7158D6
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 10:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVm7v51DYz3f64
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 18:40:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=dYdv7Jz1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:7e89::816; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=h-a-m-i-d@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=dYdv7Jz1;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn20816.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::816])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSWtC6ZRTz3f8b
	for <openbmc@lists.ozlabs.org>; Sat, 27 May 2023 03:21:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkhH+BEkqgHvN1xNijgIqwOy5tMeu0znhJFfwiWtp/Do2tok1b/89dlfiMOn0S018KeT7/0clvfS/D2FjlabFhrO4dXX++Geny3tJnFtUp+xdOXZDCDXhLt8nO/eTJcBs3PskvHSrEvxaiTg3smuu3OHLPZWNv77FZWTZeG8+bW7G4kWD6bkaw9KuUbD//bRvQTzJ/3ItOE0wEOzan+IDhdfYsQMA7SjojjnBln7Fvo9MrpzofFrrZifMJhPW5wQWzBliS0In3iqeklbXEHC9qVpGSOEYTHKFRjmeVsQE+da2tt+G7Y8FqjMjB+rV23pLGVU3l5f0oS420Kn26rdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck62Z6DUTU2Wc0gNfBn4JZC9Vh7dc3vXEK/TfjoedYY=;
 b=N1RIzHA6BQOrkqyweRscF1GL3FlTi2WmgZXZ/P50dcNHE5khmQB+eCY0jV38QiKVanZShOvz6lM7QjVvi2LidKJA3IanFqLUrjJ3H29UBWZOrmIdciqIrQg6winJ/wlZ6rH9Kh+CEqcCVYb7unAt9baRXqvFNGkL9t5ZJkU93hDMD843d2tn2pa15v571FcXBRKs1oJu4wWXJtOl04FPzK/JK6l9ENEh+AOq+tvEmDLhX0F6SYHzhjta4+5muhHMoYsaeCUWa4hU/vvJwjkSVhwmxQbCYVV3oUHlHm7nTk5EjKl7BAePlogZ2ACZ33aa1y1dx8g/rR4q1wOdo9hG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck62Z6DUTU2Wc0gNfBn4JZC9Vh7dc3vXEK/TfjoedYY=;
 b=dYdv7Jz1clHJ6YH8hlGtC5Ev3b/yuTjFd948naYzOKBb0EUi9MnJsY4fRzwrDR4YbN7WbfCKGVh4FRyoinMfAculcy8uYk+VhtEoISzAv1M3P2sJ5SqgR2fSyBj+fQJmaWc7tu0L8xsUGf8FW/30nITj+3J5g10uU08IZ7aikFPB4d3FrX7YUTeujhrD62eDIlZNAVALnhyDKixvlyLKeUv1z3xroPbS1ggcY5eAjP128qwu+yqondrUVlAIDKPIXGOm1Q1skUIRbr5CQaDpbY4rBmHFx+c/K2hoVGhFDmBPx2Wtv1OmX9YT29HBrLi7vgeUfcVMVvAZ+5vwNJphZg==
Received: from SA3PR15MB5728.namprd15.prod.outlook.com (2603:10b6:806:319::9)
 by PH8PR15MB6134.namprd15.prod.outlook.com (2603:10b6:510:239::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 17:21:01 +0000
Received: from SA3PR15MB5728.namprd15.prod.outlook.com
 ([fe80::f814:5736:5421:420f]) by SA3PR15MB5728.namprd15.prod.outlook.com
 ([fe80::f814:5736:5421:420f%7]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 17:21:01 +0000
From: hamid amirrad <h-a-m-i-d@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Disabling https
Thread-Topic: Disabling https
Thread-Index: AQHZj/X3S969GmrzpUWW5zf3Nw6cbQ==
Date: Fri, 26 May 2023 17:21:01 +0000
Message-ID:  <SA3PR15MB5728B4C071EDCE147FC860B1A6479@SA3PR15MB5728.namprd15.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [/wlSdXzvJsv78/xRfw1q0oj75UgxrBR/EjiTaqBVf0hDYZgiW6rTwnTLa6IOnstw]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR15MB5728:EE_|PH8PR15MB6134:EE_
x-ms-office365-filtering-correlation-id: a4bc025e-7d05-4e3c-0078-08db5e0d941a
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  O5aGnm6lHDULBFpYS/ZXXIdPzshGJ9uN8ZbjhT9HbxQ7SESt1dSG9j5SL+t6sdR3kUAhG2bHP7bGAlg/MCP5KKTot5gwyIaPtEbUD9EnUwYBvDdXbSvA/ZToZGwfvV68I9EH5MrdebvwxhUyjss3xhynyG5np4dEjQyZmhlsR5Q0UmKazcdvuwbZUaWmdzPNzbh7dQ5zyIgPuHwCymg/IrNqY8SXNvmiSNFg6P5TRHHOkpoEUNT8Y/YoOYmKpKYExvlZxs5ZxWRCQvxY5uLT2M9rgfrIoytlTWExCSg/psypziGkeSsagTkC2jS+Ai4PXI39f6TnRGBseIxsBlAViia+X2SZdyBPt0eHFWgAhrTZw1Uc6ySWnXYJ6Pz/2K/sxoOyo0bro7HqXBZIX9WaKnedyY7sZNKjVogCrKH7SkLF8TJw/QPrkxAUZTwKP3FTG0jLYHg1zqivJHT0v9//qpbjE1CBENnl2Ix1+SScr59wnXfMOwhm/tS7vFFyJrSoeArik1Q/ZmGWzPJrDhn6xImOzbLm1bCYohsWPMiz5MXxoo/T4fCWQ7qJEvEu24hBFD+4hA0XBA5Tn1C/5SFAH9C+bIoRwp3xecBCv9VCxDc=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?yaGcyJkyD00KrfHt1Eqxo4f8f4q4zXpo6gRdR2kO3+29Qe+AzxYqgVAJMb?=
 =?iso-8859-1?Q?lhfLG+DGgxEgpxS0kJ3umlo6AdBzSDNybOOrQUEudgaBrvpQTrcNcjssoX?=
 =?iso-8859-1?Q?jkRvk7YonP5Al0asCKevhiNwo9AZA+m6q02ejiEpXSiaRA6Rr5GmX51uUT?=
 =?iso-8859-1?Q?H/cvvbvfzSyk0UCYSDQUecEPetHuEbs0fno79/EmSrlsWGuKzaUtcd65bL?=
 =?iso-8859-1?Q?ST1P6P6Hhi1KcqBGztdyzfbL7N9SRl9jRPuecUqxEnDKwEdaO5LGtlGqD6?=
 =?iso-8859-1?Q?iWj7gZD01IaY/hUQf6eX4K2JHH1uNiDTSwvxJ0zCHq28c7fDqWm79tEYrT?=
 =?iso-8859-1?Q?DRco1Mg+Col4Fe8B9pxsJKddDqliU/puSXVxifVfa9XfhPpIYnlEgC8sIY?=
 =?iso-8859-1?Q?IctZXYynfW95Yh7YoXGRktHlaAV8TDgysgF+3SyhWEWYjNEGQ/NX76F5ja?=
 =?iso-8859-1?Q?/Wgi5ZFfhET/B/0j76xUh2T31vi8Yhaf4/cPlfrR5oxlvclNUzSjc+aa4X?=
 =?iso-8859-1?Q?oaJzSc0OsT7dffmTi5JQPENQdLpfdw+bTuO+UM6MgOJaYjuHcn6UKsEZrL?=
 =?iso-8859-1?Q?q9iEee1N2Fi2JI5M6F5HvQM4OR6zCzv5VI9ULMREbHuDrblMvcPBsXYcAV?=
 =?iso-8859-1?Q?xkLqAtK3UAlJIrCzPbvug7Vse5bk377ujZnrfCWxqoLS/KJT0vV1znMPaQ?=
 =?iso-8859-1?Q?7jRh0kpdAP5/8K/64LQJYnG4GzICprgp5kzTNpsPjzMVvs1Aq7xr4NcYzd?=
 =?iso-8859-1?Q?F9Pta9Z75pvYYUkAIVFlXB80XanP2rX1NgBdBRIojnmbdVM66hCXw2raMW?=
 =?iso-8859-1?Q?D8R7pb7i/7duOtQtG432ZDqAwAoiLWwUuq3tJeV8QxKXeVbr3dtO55tx96?=
 =?iso-8859-1?Q?N6GvyRygLzoMRfqm4bIU4yT/Ckg40HW8vK/1cbczs0/a+exF25FiM9E0zh?=
 =?iso-8859-1?Q?u7aV7b1oF7YJagzZvwNobXRwBmnW3CjT/EOG9buRszn9PaqkKZ/kzGlr2A?=
 =?iso-8859-1?Q?eOUXm4fOSROepuNPz0vJtq8cbRr62eWg3crmxqv/STLXQsqa28BcZ49nlJ?=
 =?iso-8859-1?Q?Ef2GSvvsGG/FRKg26l+uh9PC/0AEtYGoE75jO5njrmVanUW0OvE5HJP0oQ?=
 =?iso-8859-1?Q?hD8lB/eb++bWkY6pt9qgNh0sWomDH39mIAi9aYYD6yTaOizLWtooboPza+?=
 =?iso-8859-1?Q?IxVPhk991rilDkLWSbXWAeaQWQInXo6DTRSQnVR+r4WdrAaYuiEZ7c/a8X?=
 =?iso-8859-1?Q?vpUQ2jWgUHzHeXQ6OeuVC06XvObD2iFy2ncM87T2U3FUefr04sn9M/wxEv?=
 =?iso-8859-1?Q?kOS/KqmCXLNzznHIt8ODL2Qf5Q=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA3PR15MB5728B4C071EDCE147FC860B1A6479SA3PR15MB5728namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-4722e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR15MB5728.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bc025e-7d05-4e3c-0078-08db5e0d941a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 17:21:01.5212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR15MB6134
X-Mailman-Approved-At: Tue, 30 May 2023 18:40:31 +1000
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

--_000_SA3PR15MB5728B4C071EDCE147FC860B1A6479SA3PR15MB5728namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have built an openbmc image for ast2500 module but i am really having a h=
ard time accessing it via REST or web. Both of them fail with ssl certifica=
te even when I try to import the server.pem from the BMC module into my bro=
wser or use --insecure for my curl.

Can you guys guide me on how to disable the https so i can just access my m=
odule via REST and web?

Thanks,


Sent from Outlook<http://aka.ms/weboutlook>

--_000_SA3PR15MB5728B4C071EDCE147FC860B1A6479SA3PR15MB5728namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Hi,</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
<br>
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
I have built an openbmc image for ast2500 module but i am really having a h=
ard time accessing it via REST or web. Both of them fail with ssl certifica=
te even when I try to import the server.pem from the BMC module into my bro=
wser or use --insecure for my curl.</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
<br>
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Can you guys guide me on how to disable the https so i can just access my m=
odule via REST and web?</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
<br>
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Thanks,</div>
<div><br>
</div>
<div>
<p>Sent from <a href=3D"http://aka.ms/weboutlook">Outlook</a><br>
</p>
</div>
</body>
</html>

--_000_SA3PR15MB5728B4C071EDCE147FC860B1A6479SA3PR15MB5728namp_--
