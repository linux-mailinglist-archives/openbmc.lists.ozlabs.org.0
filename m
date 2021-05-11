Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468137A9AC
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 16:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfgXs4d3Kz301m
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 00:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=BEr4chjw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.243.50;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=brandon.ong@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=BEr4chjw; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfgXV54nSz2yRy
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 00:38:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAXvkMwpnNfbcV0F+M65jWVU1ErN74l8Q2XnaIVnRu7VYZBTd1G01+xlfqaDLMynWHhxSMaCOIDC0sZLhyFUlMDMk0BisLF7jZnNbKJybGSFKmfTCiezYqo2icFZoeslIcVs6TnX+9LZn5MX+T/7vkgryWhvYpXjNaL17W1ipFSI17K8nglGseMxNdN1YlEq/P7mKYaxnj3NW11ME5nMjuI/ai1hZuDOyLnj9LvF0F1iYemqzvW6yyz8CCUNQSuQbMcMw55haq7IHRHfiqO/6zIzRoILx2GUBHcWYYjtA7J7Cf21AbjJ4Uw3N/KrLi1eMh7zhRcqTN8hIN+uQr4kYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfdczbSFCHqE4SRUjIPiM5TeaXLWgPdtKY7jTYYYXkA=;
 b=R0ge7OIuSi2RV6DKw0Es3KZaECC6lRYvdONC2wpP4n9Xb/qndMS+R2zxGbooltDETPwK4C9RtonvJ/vVF5Pcs4clmDD1+mP6uunyByJs77+URQ7MeWtucoX0r/3QE6J+ravj1C/H9KSZ9y4YvFcb21DKh67v3+hXFR6lvV00VSv1KF8YD52t79TUAd3qFmuRzaefTtyHx/1vn04UAE6EYmRkOCDb67FhYupExitr09ShMSzeyfOWr7rC+oJF5tU9IxEODspH2fIPLWIW+ZpLjC+TmYkpm3tFF54gz7tHyPQceOYsl1EYQ1Kq7KCGzaqlxHidlq/pKS6CEpjiLmfLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfdczbSFCHqE4SRUjIPiM5TeaXLWgPdtKY7jTYYYXkA=;
 b=BEr4chjwG5ZQKMpUchH/LExOCk4AF2RbPLzMI/LVi1VvBuhnwG8MlhzMZqoSJwBVio13NuDeihqfjVWi/lB6cMfk15qu9lzCaHbjDIf8602t4U126K87LKmFxmBJDEQl6rmqn/yepVeEyKy6GbZXW6Vbx3woIvFpNixvaJMZkRlvtATc2wf79VrR11sAdMwHKYjCDbdZXCXMh1dnPANxozUBMWX2ZMKj9Pr8HPh+0q9x93E9IAQXlO2+P6ewzRSDxrmfq+aODjgMgVdWiV38Cxq4FqSVxT9RN1FsiRisg1Qs2tNiTgnj7G/WriEsrdqebSH5zUr8/wuOOow8VWgwKw==
Received: from SN6PR08MB4399.namprd08.prod.outlook.com (2603:10b6:805:34::10)
 by SN2PR0801MB2302.namprd08.prod.outlook.com (2603:10b6:804:13::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 11 May
 2021 14:38:43 +0000
Received: from SN6PR08MB4399.namprd08.prod.outlook.com
 ([fe80::7069:84a1:f3ec:451c]) by SN6PR08MB4399.namprd08.prod.outlook.com
 ([fe80::7069:84a1:f3ec:451c%6]) with mapi id 15.20.4108.032; Tue, 11 May 2021
 14:38:43 +0000
From: Brandon Ong <Brandon.Ong@fii-na.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Phosphor-host-check failing when running sdbus commands
Thread-Topic: Phosphor-host-check failing when running sdbus commands
Thread-Index: AddFzpLg3zMxYwjlRAioEUe9Q0qW/QApDdeg
Date: Tue, 11 May 2021 14:38:43 +0000
Message-ID: <SN6PR08MB4399AB4C2EA5000B74F995EAC3539@SN6PR08MB4399.namprd08.prod.outlook.com>
References: <SN6PR08MB439915516EDE54C56D38AB86C3549@SN6PR08MB4399.namprd08.prod.outlook.com>
In-Reply-To: <SN6PR08MB439915516EDE54C56D38AB86C3549@SN6PR08MB4399.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02d46cd5-f450-499d-102c-08d9148a79e8
x-ms-traffictypediagnostic: SN2PR0801MB2302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN2PR0801MB2302765798DAAC136573528BC3539@SN2PR0801MB2302.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H5AH6VBs+Qh3I8W93pO23pmwU74368dGCC2/mZOVZjq42yidkTyPheeSnZLM6uHhialZbuIHeGuDvAaZ5N6PnMZVtH3yNXq4WUqa0fL7iubY/fbeIyqLUXZ92NuSvLdMV9i4aN4vfEumh0+QYZLxpIAnaaVhujI/W12aKkB/JpzBYPyB7ydWUhFAcF57cRcZnu2hr+a3LEgE70zPwrqXL248HrECenOX7y4LSlfjrPmDwgD+E7B57dB2dtxbZWSf9qvC0p+oQT8eFtD8ZTJHyXu0IHCYutY9yQ/cBv/ZioevyWShgUaPKrcfEhl93hlYEmDJakUEpqXzaujqg1zPgWA3RFjE8BhznpyzFzuFT2nAbQsUiJSVD6e016jeGc1AkBiC2iFHd7q3yU+Fr+XHnIDs7D67spPTsskEIJlwAfDuT88a2+S8v9BC17Xc3LxpHNvfAj6RhCo9xd7TOP3/ZWU8NnmRLqy58eNO4YRBh3DNCy8iF3VseHL63yiZecyleQxF3xTslIhMes8NZKkU0l3Xvatd2wxlfv08Zpg6EGobsfx0UK1V1YKTHjGyvzbougBAi1u7wkOfZf6xTpfNyc5Vnhv7AbK8CVMcOkh9izBHJF1jbkhpuEKUKeRhNv737EjZevrtsUW3oOPdBaVg1smZ4tYSyKFMaOgF14d7b3YD+m1SjbD8gySya61kgZbE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB4399.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39850400004)(136003)(396003)(376002)(186003)(2906002)(5660300002)(9326002)(26005)(478600001)(4326008)(64756008)(9686003)(8936002)(38100700002)(122000001)(66556008)(66946007)(66476007)(66446008)(55016002)(8676002)(7696005)(966005)(76116006)(71200400001)(107886003)(6506007)(316002)(54906003)(52536014)(166002)(86362001)(6916009)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Wy5t5cDy9kofBUXRCEN2G+S/4XJ8aoaOf8kBClH42NUKnUG8zlrbYQyuc9yW?=
 =?us-ascii?Q?PI8beRuzR8UKoWfYsijs+IdjqEcA4kIB7mHYPp2ouzx1R64h/9piMw4ET6aG?=
 =?us-ascii?Q?1eSe6m9VWddwuby8RfNVdI9VYRQo7pAlsPr//uLRl5lrko663uz7VAad1ake?=
 =?us-ascii?Q?GddD9piOtIVe4PSt5wzEWGs106YZtQ0yOeQ6ZOKDv1mJwt8TbbOoXKpMdf8b?=
 =?us-ascii?Q?Chart6fP5DX/qWKkPQ74r2RPKO+lhUh3ZsCam7oG/8fR9W8AyShSs7uGz3bo?=
 =?us-ascii?Q?G68X4zImlGQVkgYFk2K3QfeXxNLcqBkZAeg8GYBqx8zTEsGHlfeVTyaIfhM+?=
 =?us-ascii?Q?YX6eKcDZ/oML5mz/Qdkewzx6rkHER7BuhQRPFdRX0MY7CuQLTsmCkNckwdWQ?=
 =?us-ascii?Q?UocKAZmKkebRFrx7c6C8YSODBYQmWKx4XLYSORwueAhIQ653S/zqyztKzdBm?=
 =?us-ascii?Q?l2fErzSsDPMdUDhXd0thK65MTcmEOur2ioHRRbvyF+b0tb0i5fEs9FCptZMv?=
 =?us-ascii?Q?E+dubrNzxM+zRVITIMRlq7TPLjuA2TXs5W6lG/5ZJ9LpyutefzglXTH1OZPe?=
 =?us-ascii?Q?fzNYYBMHls4JdqG3WQ1o5YG4mqb9jnUuu1nuljMqhRhFrdiIc4Efo3gwLCrd?=
 =?us-ascii?Q?/WyBJ9njHIT+C/lH5mWGy2IO0+LKhLmYwoz69Qy7onNWu524nFuS4VQHb6y/?=
 =?us-ascii?Q?Ii8QiywWbjpIGU4xH21+yeZJhnyHsWFZ6EDXC6jbXEt4hdD7ZmXvKZP6tHvT?=
 =?us-ascii?Q?QqVo+wjuSs1kC+KXjrfdap9qjSogP8I7As7LkmK08HBG3rGrj8jQ6iSNH5Ag?=
 =?us-ascii?Q?4qCUEqGg6JO+VBSQbN7A9ui8LKFa65vL3oi9kmdc1u/A9iZvD34kzlLHkyRj?=
 =?us-ascii?Q?NzBvJpjnKyM81XjK54JZ04aI+FBMxz3g4e1hHRqGBNSJdXUJWKJKragI8Bvi?=
 =?us-ascii?Q?FqTZktbIEOLw3QIG57nfZpmINBG4Sjkocx2VzR/7L+zIx8Wpn6n2tPATb+ki?=
 =?us-ascii?Q?I5rL99C9FD+x42CGZcHtmkO67Ez+L82mGGJLVI5sLGi/fx+tiM+YLDCFSW24?=
 =?us-ascii?Q?vsNXmYmp8hmhWra1c9T8anaEW4Skao6g+h1pjmtq46AbihYpFoWzYatFjepS?=
 =?us-ascii?Q?NXFUGQBl2dwD10JgP2+Uo6Y4vjo8g49djZ3oQ4rbeVHhDxmYGKtqOd0yjZKE?=
 =?us-ascii?Q?SC0T+iWAk1Grt3s+fAQ3zMWFGmnOGyRmSpP/E3ElpzOh8PBDNJp+xvFbOUyK?=
 =?us-ascii?Q?qi3GizNAw9TM2XcSGTrrM9u1X09uveUm62eSXPGei5fd2Z6CMqQv+RSsKS65?=
 =?us-ascii?Q?W9+nnfTE1zmzt3OJygsz2YC8?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR08MB4399AB4C2EA5000B74F995EAC3539SN6PR08MB4399namp_"
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB4399.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d46cd5-f450-499d-102c-08d9148a79e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 14:38:43.1970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4rSzSlrbkGCFOjHJD+ZyubhcGsD+Z38VQbW9yJuTWwp+WgKBKaH2KaY9R5KTfgM2fLz/D1Tytj8tC0ZeBT1FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR0801MB2302
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
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SN6PR08MB4399AB4C2EA5000B74F995EAC3539SN6PR08MB4399namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

This is the issue I encountered and I'm still stuck on..

Using journalctl -u phosphor-reset-host-check@0.service<mailto:phosphor-res=
et-host-check@0.service>

Apr 28 23:28:18 kudo systemd[1]: Starting Check Host0 status on BMC reset..=
.
Apr 28 23:28:20 kudo phosphor-host-check[973]: Check if host is running
Apr 28 23:28:20 kudo phosphor-host-check[973]: Error in mapper call for con=
trol host, use default service
Apr 28 23:28:25 kudo phosphor-host-check[973]: Error in call to control hos=
t Execute
Apr 28 23:28:25 kudo phosphor-host-check[973]: terminate called after throw=
ing an instance of 'sdbusplus::exception::SdBusError'
Apr 28 23:28:25 kudo phosphor-host-check[973]:   what():  sd_bus_call: org.=
freedesktop.DBus.Error.ServiceUnknown: The name is not activatable
Apr 28 23:28:33 kudo systemd[1]: phosphor-reset-host-check@0.service<mailto=
:phosphor-reset-host-check@0.service>: Main process exited, code=3Ddumped, =
status=3D6/ABRT
Apr 28 23:28:33 kudo systemd[1]: phosphor-reset-host-check@0.service<mailto=
:phosphor-reset-host-check@0.service>: Failed with result 'core-dump'.
Apr 28 23:28:33 kudo systemd[1]: Failed to start Check Host0 status on BMC =
reset.

phosphor-host-check[973]: Error in mapper call for control host, use defaul=
t service

We tried to run the command manually:
busctl call xyz.openbmc_project.ObjectMapper /xyz/openbmc_project/object_ma=
pper xyz.openbmc_project.ObjectMapper GetObject sas "/xyz/openbmc_project/c=
ontrol/host0" 1 "xyz.openbmc_project.Control.Host"

The response was the correct response.
a{sas} 1 "xyz.openbmc_project.Control.Host" 4 "org.freedesktop.DBus.Introsp=
ectable" "org.freedesktop.DBus.Peer" "org.freedesktop.DBus.Properties" "xyz=
.openbmc_project.Control.Host"

Next, we tried to run the phosphor-host-check

root@kudo:~# phosphor-host-check
xyz.openbmc_project.Control.Host.Command.Heartbeat
Test
terminate called after throwing an instance of 'sdbusplus::exception::SdBus=
Error'
  what():  sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name=
 is not activatable
Aborted (core dumped)

The issue still is that when phosphor-host-check fails when it is running t=
he sdbus command
https://github.com/openbmc/phosphor-state-manager/blob/master/host_check_ma=
in.cpp#L74-L84

Thanks,
Brandon





--_000_SN6PR08MB4399AB4C2EA5000B74F995EAC3539SN6PR08MB4399namp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<span style=3D"color:#1F497D"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><br>
This is the issue I encountered and I&#8217;m still stuck on..<br>
<br>
Using journalctl -u <a href=3D"mailto:phosphor-reset-host-check@0.service">=
phosphor-reset-host-check@0.service</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:18 kudo systemd[1]: Starting Check Host=
0 status on BMC reset...<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:20 kudo phosphor-host-check[973]: Check=
 if host is running<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:20 kudo phosphor-host-check[973]: Error=
 in mapper call for control host, use default service<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:25 kudo phosphor-host-check[973]: Error=
 in call to control host Execute<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:25 kudo phosphor-host-check[973]: termi=
nate called after throwing an instance of 'sdbusplus::exception::SdBusError=
'<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:25 kudo phosphor-host-check[973]:&nbsp;=
&nbsp; what():&nbsp; sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown=
: The name is not activatable<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:33 kudo systemd[1]: <a href=3D"mailto:p=
hosphor-reset-host-check@0.service">
phosphor-reset-host-check@0.service</a>: Main process exited, code=3Ddumped=
, status=3D6/ABRT<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:33 kudo systemd[1]: <a href=3D"mailto:p=
hosphor-reset-host-check@0.service">
phosphor-reset-host-check@0.service</a>: Failed with result 'core-dump'.<o:=
p></o:p></p>
<p class=3D"MsoNormal">Apr 28 23:28:33 kudo systemd[1]: Failed to start Che=
ck Host0 status on BMC reset.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">phosphor-host-check[973]: Error in mapper call for c=
ontrol host, use default service<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
We tried to run the command manually:<o:p></o:p></p>
<p class=3D"MsoNormal">busctl call xyz.openbmc_project.ObjectMapper /xyz/op=
enbmc_project/object_mapper xyz.openbmc_project.ObjectMapper GetObject sas =
&quot;/xyz/openbmc_project/control/host0&quot; 1 &quot;xyz.openbmc_project.=
Control.Host&quot;<br>
<br>
The response was the correct response.<br>
a{sas} 1 &quot;xyz.openbmc_project.Control.Host&quot; 4 &quot;org.freedeskt=
op.DBus.Introspectable&quot; &quot;org.freedesktop.DBus.Peer&quot; &quot;or=
g.freedesktop.DBus.Properties&quot; &quot;xyz.openbmc_project.Control.Host&=
quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Next, we tried to run the phosphor-host-check<span s=
tyle=3D"color:#1F497D">
</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@kudo:~# phosphor-host-check<o:p></o:p></p>
<p class=3D"MsoNormal">xyz.openbmc_project.Control.Host.Command.Heartbeat<o=
:p></o:p></p>
<p class=3D"MsoNormal">Test<o:p></o:p></p>
<p class=3D"MsoNormal">terminate called after throwing an instance of 'sdbu=
splus::exception::SdBusError'<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; what():&nbsp; sd_bus_call: org.freedesktop.DB=
us.Error.ServiceUnknown: The name is not activatable<o:p></o:p></p>
<p class=3D"MsoNormal">Aborted (core dumped)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The issue still is that when phosphor-host-check fai=
ls when it is running the sdbus command<br>
<a href=3D"https://github.com/openbmc/phosphor-state-manager/blob/master/ho=
st_check_main.cpp#L74-L84">https://github.com/openbmc/phosphor-state-manage=
r/blob/master/host_check_main.cpp#L74-L84</a><br>
<br>
Thanks,<br>
Brandon<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR08MB4399AB4C2EA5000B74F995EAC3539SN6PR08MB4399namp_--
