Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19C32BA59
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 21:21:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrQQ93bVMz3cPF
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 07:21:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=dv27pBAO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.113;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=dv27pBAO; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310113.outbound.protection.outlook.com [40.107.131.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrQPw3T0fz3cLJ
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 07:21:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPYkbIcC4Uc+bSEYiahVfXW0zNu5qbbIbG2TkJ9U+H2lTF5JIyCecy3sTqm5x97WtpTyLuSdy1gX9M4pGHrNA+oWZ7WCcxwbKxu8CsKwf+Fw2HrkB6Z7JnWY41PT7XI1iME0iPiOXLvM9XCFcoGT5ddIls0LAIWNIeWAYNLRb/71CKXCMo1ZgQXiGGLD8uDp9krthLIfIBaTipXVXzipkbdBBBqAQyGCpQeK4i+TF9gVU106HwASgMoIVLZt1Fkuooc69dx4URobbbel5FUL8HBYxoshxaeFFE3d9ATv4ruP5tKGrY2/SQOn3ynKK4L8LreTYU00YeLLwB9TTQOVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo6DMFSWigSYi9WdffMgJFsu/UeGz3ENJeBQFq3lBtc=;
 b=k4dvwVmx7DYiJpnuMglLcd9FLg9acVnEbNA7Zu4twvK1S0Kd8qpENguLdwh+DHjg+bE6iyevtMbJFWHcZfnK497hhYOgz6aBEvB+BH+Yfo5OQiDxQjpKmrDFscf3Kthv8DFIyCxyED+TqiBNc1UrF5s1Unpp+QMV17M9mpWjPAZxLrvpmZ3GohLHUBmGokma/m6kkCSNc0i6t7IYcRe+AdkcqTkgjoBty2JhGeAQWhdy4WDIC06WNTgneAaydSgi4zOCG/QiPTfzP7abX53sjdc0j4mdRNdhRGly7XPNXvtemy9nNDjZXK8EG3+c3VzU5qDV4+j0mATm3VAlws9G0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo6DMFSWigSYi9WdffMgJFsu/UeGz3ENJeBQFq3lBtc=;
 b=dv27pBAO/Gq4GHmVPm1/mpaff4dYhw4JF6JRzsBSdfeE/FI5NEM47/aoJyP0B9LJmK9j1LNurVF3LI18muxRxOuC7jqGsX24hGe4VPVXNzfgz6CPxLwQN2IEKlWLGirjsmE4TlOqaRGSmciDlwXnlnDYv7N85pLKGtXHW6PHyTg=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB3131.apcprd02.prod.outlook.com (2603:1096:4:64::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Wed, 3 Mar 2021 20:21:20 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc%7]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 20:21:20 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC event logs in WebUI
Thread-Topic: OpenBMC event logs in WebUI
Thread-Index: AdcQZKeU6J0ZjZs4R3C6XtaP8IAClg==
Date: Wed, 3 Mar 2021 20:21:20 +0000
Message-ID: <SG2PR02MB2796361C8678E95571189C2C85989@SG2PR02MB2796.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [24.6.83.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5cf9fda2-b03b-4eca-0902-08d8de81e868
x-ms-traffictypediagnostic: SG2PR02MB3131:
x-microsoft-antispam-prvs: <SG2PR02MB31316DCD30DF0B82945D337085989@SG2PR02MB3131.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nir3JbsnIwg0pSNlWswdB39OIkdn4GQxiK/ADjB8oN1QixyNuJgY7SCo8KxQTYQ8WzbNiQ83uDPT1oil/ZsYRaURSgIloVEpZkxFi8MIISDU6rw9KJY3vcqtQ88dHcL9l3nHYEZGs60SrwfOxbtpLyN0kAlKC5jZAc7GnKjeQtHAJSDA+w8ZFUrQTzrSziqHPDbXDgTZaiq4okNtq/i7+QA7RwXmdQN2QhgKM9qFMTpgr9rTjvgzHfHmwl7IjbJvHGcDcOCKlTV8HiMCqCEBgm1MIv9V4QsSQq0rksdFqeFyoILH7AE6NK4+TpZ4KOHCK/qmNPdSY4LV8w31RKM2xVjQOF/W5zPWxL3FA6pzVESWwZkgLYqB+HYkyLQZ1bbzmWDjizITlj7hWWPVK+4ZaoLgyYk4yOlZxvhYe7Bj6TwHI+5nuYbT422BZyLIYsOZenyAfposD39EP4td4FRj3J+9V6CJkb6ALjpWjW4Bt2Mz/bBKfEAlYMWPRR2ifecIrsV5lWLDZ3h6LBkLSErIrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(33656002)(52536014)(66946007)(8936002)(186003)(76116006)(86362001)(64756008)(66446008)(478600001)(66476007)(71200400001)(55016002)(66556008)(9686003)(6506007)(316002)(7696005)(26005)(83380400001)(9326002)(8676002)(6916009)(2906002)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Avg+0z7uFnbQ4jEX3mv0l5e7UgWo5X37F1yE7lkm782AmIqGYXbS1toFnUce?=
 =?us-ascii?Q?h5+bAOc21ieWMHVHcYUDBwxZ87XuOBz/3V1Z6mGGzzlxcUYuZmftTUfBlRQa?=
 =?us-ascii?Q?64xFLFp0eP1tbM35J3bzFObJQsZL7dMOzcWbtVnt3G91hOpQYt5zGV+9kgGY?=
 =?us-ascii?Q?pWkk7+UCAUffmcPQ2/P7CroaPF86fDykQ1dwOEyNUNHjtWp7MdPY/tj5W5/U?=
 =?us-ascii?Q?w0npOM3s2064KMCtbY0ESxe93YXks0oXofqTt9i8G+egNlmpiRzOn7Njx5t2?=
 =?us-ascii?Q?87boWUAdocQoL4kYVIUKkpORJfffMH3TEFTq3935JZSz1TvwdhJonQjZtUIN?=
 =?us-ascii?Q?NLEHqQMRLq1ki4gSmRu5rY+3QPunyqIGMbYwyvrylidchsftX+JSC/K0pmED?=
 =?us-ascii?Q?ZbcM426xiWz2+SJJDTVHVzP9F9owMC6YYjNQbXjSxH7ihRJUe4gPfMwQclgV?=
 =?us-ascii?Q?794Vl5+PyGpnxwWYQ0rR9KLUEq3DQKelDkCk0VCZipyxofeITpXyCZLf2lGn?=
 =?us-ascii?Q?90zwjdAV5A8KM11gL6IlgY6jKJ25H5IpWDQcrF9l7Rtf/NJQvM95vBUlH0D/?=
 =?us-ascii?Q?vNZrTuz+8OKDdXO7QlvqxHCkJMfZk70Xtmzlvl4QidbYuDJ3jX8u8lY/Vms4?=
 =?us-ascii?Q?wQm5a8KJO7ss3oRX8NOaG/hSE4jN6WfGIhVyEVfUCJrSmiFZxSXI/kJQClR7?=
 =?us-ascii?Q?BOZkqcoXdxhhRMI1LuM53MweQ6oe2caky7zr4k7wkdf0yxDTq4PHXLup+t9o?=
 =?us-ascii?Q?w2snqLxaAMuw1F6BRLA+AMFDrnRhDJckC8hhA1l2VYQatRPMNLZiZxRQKtyE?=
 =?us-ascii?Q?nS3XDYUykuGfAtPEFDEl4YoC5itbzv7JUV/oD5+oA+Oz8SboKNBafBNbzEgG?=
 =?us-ascii?Q?Qdvr36IE0HCtEu0tnIDtfFiGeviFOGt49PHzKNBh9zaiJMJDq6GcJpPKh7ut?=
 =?us-ascii?Q?AooQAB5MO0HS4Rohml8cPaFfhTWSrJYcOGz3pEoLAyILEM1YeOo7Iv9ieWnC?=
 =?us-ascii?Q?p0iEB58qYrGostNuw+oexo7D0n0Gc+P3hMuLqYwSX5TEgc9YO83KvwuWpu1Y?=
 =?us-ascii?Q?xc7SymEn/FwHmPBl5hOv40AkcMe1DmzfF7oPcr+9GZN+m9lsZ1+u6k9Iu/Md?=
 =?us-ascii?Q?s5OafsjRVRtrAXQBq3s+n520dIwn9eL1waZZ98eAoim8u6Ca9jWbwPjUNsqG?=
 =?us-ascii?Q?2jjmvkSjjPOAl6qKm2Q3pr5VntCnu8zgwmx/Hh0Q2wTT4DS59SZs4etsIszN?=
 =?us-ascii?Q?futyHPe6RjA6Ckvdrj0YkpGr5A52j+hLmkzlMgaI5okLG1kE5rnlTGzSTLn+?=
 =?us-ascii?Q?2tE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR02MB2796361C8678E95571189C2C85989SG2PR02MB2796apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf9fda2-b03b-4eca-0902-08d8de81e868
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 20:21:20.0936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0756he1YtyJu8A7D1bslPNFSiaG5Mti9OTpaQYa1T+m6uXeYOe92FI/gQhs+0MvP9VwhoJ5WsFl+Nc7wyprTMJypoiYOsCSTiJRjDwX5P28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB3131
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

--_000_SG2PR02MB2796361C8678E95571189C2C85989SG2PR02MB2796apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

When I am using phosphor-webui in OpenBMC, I see Event Log under Health on =
left side of WebUI but on clicking it, it shows System Logs. Under System l=
ogs, I see SEL, event and OEM logs.
There is also event logs seen in path server-health/event-log.
I was trying to generate an event log in WebUI with phosphor-webui and I co=
uld generate it when I upload a OpenBMC tar image without Manifest file.

When I use webui-vue, I see only event logs under Health and no System logs=
. But, same scenario of OpenBMC tar image without manifest file did not gen=
erate any event log on WebUI.

Can you please let me know why there is System logs section in phosphor-web=
ui and not in webui-vue?
Also, what kind of events generate the System logs and event logs in phosph=
or-webui and event logs in webui-vue?

Regards,
Ashwini


--_000_SG2PR02MB2796361C8678E95571189C2C85989SG2PR02MB2796apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I am using phosphor-webui in OpenBMC, I see Eve=
nt Log under Health on left side of WebUI but on clicking it, it shows Syst=
em Logs. Under System logs, I see SEL, event and OEM logs.
<o:p></o:p></p>
<p class=3D"MsoNormal">There is also event logs seen in path server-health/=
event-log.
<o:p></o:p></p>
<p class=3D"MsoNormal">I was trying to generate an event log in WebUI with =
phosphor-webui and I could generate it when I upload a OpenBMC tar image wi=
thout Manifest file.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I use webui-vue, I see only event logs under He=
alth and no System logs. But, same scenario of OpenBMC tar image without ma=
nifest file did not generate any event log on WebUI.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please let me know why there is System logs =
section in phosphor-webui and not in webui-vue?<o:p></o:p></p>
<p class=3D"MsoNormal">Also, what kind of events generate the System logs a=
nd event logs in phosphor-webui and event logs in webui-vue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ashwini<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR02MB2796361C8678E95571189C2C85989SG2PR02MB2796apcp_--
