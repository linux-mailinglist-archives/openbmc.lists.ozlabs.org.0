Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F11726E7
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:48:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjY051CQzDq9l
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:48:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.76.132; helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="IK9S0qco"; dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760132.outbound.protection.outlook.com [40.107.76.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45thZ41pKxzDqQ6
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 14:04:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7xk+79Hd3R/mC14WFfcu/eYg9Ve4go/MkgIfhESq8mJd+ZDccati5ycBZVZSzHk/1wmfIW2LDDt0Gejay0Be7tIfIYULqce0QGWVz0X1AvSXUxQrdRDHn6ii4nHazKNU9v8KVnsP3UhzUebgazpdm1eMOMnE7Kz0ZhfnFXDDYOPRZWFTEmRkFQexULQA4ElUQku/lqwHKVf9IGbJM3fvyYFNM+a2PjRfLQlHlZK7td+PWNf3UAT8B2OxhHLk8aqNeiMExNo1zJqqVMmbJSn267lSrJ7YfGqFgibeG7TQjnUydFRzpWGWhmNeSga/x5DSbo1mH5iljLLcmeTnFlEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWMLqHvbsfbYwZZbg3X4siKSfj3DjzjltuZbMe1oZwI=;
 b=UHPu9tqPTuwBdadGmdNSgSJxp9LieixY+JHdm6ifafrd1SxFJDHkHl5c0bYZ4Vx9WuDqQmVDto+JNNFjT7aIdu6/9vf5camlN92HHhYcLY4WO1jTX7c3Gb7ePU7z6g5Q/3XrWJ8CnnNHCuKs6vQ/g9FY0S4omJxdkXQYLufPGWMXRisVj82+E0taFRl45upc4TAu61i8LDBOaG4eVyRPBgZQ2T5mf+lrZLUSlWOuw/ovjmD+O3mEbY8fFarQu/ceEFEYvq+DHh1mXFppoR1+ZyiF9uLrj8XiU4yJ6knXg8STNhFNqDatJuF03eGhn4xWBfqXPQ4d75RjxiQ0T9bGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microsoft.com;dmarc=pass action=none
 header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWMLqHvbsfbYwZZbg3X4siKSfj3DjzjltuZbMe1oZwI=;
 b=IK9S0qcoWRub3IceV63nflUbTRqcwERtQWSPGwIOW98zhAm6zvk9oriq5/s2qHBS5bIkBBiuRrnkfJAyNVj2dqCUc8J8fGXzLx8WeMbbEOtG2K5TipTjlH2ygneSXxqgEE/B0mx3kaMrUirZdDgK5ekuQgZRc7yodmYLIuA0fqc=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1367.namprd21.prod.outlook.com (20.179.59.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.2; Wed, 24 Jul 2019 04:04:37 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4%2]) with mapi id 15.20.2136.000; Wed, 24 Jul 2019
 04:04:37 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Kun Yi
 <kunyi@google.com>
Subject: RE: Platform telemetry and health monitoring - PST PM
Thread-Topic: Platform telemetry and health monitoring - PST PM
Thread-Index: AQHVQdTo528SSQ0eF02UKmzeAgOrRA==
Date: Wed, 24 Jul 2019 04:04:37 +0000
Message-ID: <BYAPR21MB1191D66BDE28D50B93D95716C8C60@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <BL0PR2101MB09326910EA2573BDD2B97C84C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
In-Reply-To: <BL0PR2101MB09326910EA2573BDD2B97C84C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-05-20T20:24:51.7634725Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7ad7e3a0-0fda-4efe-b5af-bd9df99a438a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.87.135]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c62d755a-3a1a-4179-0ce2-08d70fec0b66
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR21MB1367; 
x-ms-traffictypediagnostic: BYAPR21MB1367:
x-ms-exchange-purlcount: 9
x-microsoft-antispam-prvs: <BYAPR21MB13678968C7708814B5277421C8C60@BYAPR21MB1367.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(23433003)(199004)(189003)(229853002)(2906002)(236005)(55016002)(66066001)(14444005)(22452003)(54896002)(6306002)(99286004)(6246003)(110136005)(316002)(76116006)(4744005)(66946007)(5660300002)(64756008)(66446008)(6436002)(53936002)(66476007)(74316002)(256004)(7736002)(86362001)(66556008)(26005)(68736007)(478600001)(25786009)(966005)(8676002)(11346002)(81156014)(76176011)(9686003)(186003)(53546011)(6506007)(8936002)(10290500003)(476003)(7696005)(102836004)(81166006)(10090500001)(8990500004)(52536014)(33656002)(2501003)(3846002)(6116002)(790700001)(71190400001)(606006)(486006)(14454004)(446003)(71200400001)(11634003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1367;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /8OTi+nSl5ZasBu6ugkCF9N5sBag/MdfYddDyEcld/SAB+UjvidvV98OINT4t4YJRa0GqvtDoy/qF/0SLqqv0+/Qr9Bt5AE8jdRRCeDRbxFeaaX/z+76cDzHg37t8I3q6EWcczux0ui6DN6iHoMcl16oSPFE4BvJ+dO80JRl4i4wAmkry9ueyWpdfeNr+zO37Tx9f3VkGeLTMDyt5C2vVX3IuNX0hB4lMb/vjnyWvUAE/0s9OqjR7Yl2jbEum7r4qw/Pfb5WolGaQFGyUpCG6dQ8eKya13DZVHAN9w4L0tulNAHUgZdjlIs0O1EtKdQRu3pmk95ePEWT5IqXnQnwAQOQddt8P7sI73c1aBcZmHOIntm7O2zcNFG68cPzTlWZNKWKOETkJRyOUpVVmY7f2aUtd7rLANcJ9uPr3JD5wIQ=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191D66BDE28D50B93D95716C8C60BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62d755a-3a1a-4179-0ce2-08d70fec0b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 04:04:37.2309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1367
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

--_000_BYAPR21MB1191D66BDE28D50B93D95716C8C60BYAPR21MB1191namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just a quick reminder that this meeting is on going right now. Feel free to=
 join.


Neeraj

-----Original Appointment-----
From: Neeraj Ladkani
Sent: Tuesday, June 4, 2019 12:09 AM
To: Neeraj Ladkani; openbmc@lists.ozlabs.org; Kun Yi
Cc: Alan Mimms
Subject: Platform telemetry and health monitoring - PST PM
When: Tuesday, July 23, 2019 9:00 PM-10:00 PM (UTC-08:00) Pacific Time (US =
& Canada).
Where: Microsoft Teams Meeting


https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monit=
oring-Work-Group


Join Microsoft Teams Meeting<https://teams.microsoft.com/l/meetup-join/19%3=
ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0?con=
text=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%2=
2%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d>
+1 323-849-4874<tel:+1%20323-849-4874,,73572842#>   United States, Los Ange=
les (Toll)
(866) 679-9995<tel:(866)%20679-9995,,73572842#>   (Toll-free)
Conference ID: 735 728 42#
Local numbers<https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69=
aa517a91c5?id=3D73572842> | Reset PIN<https://mysettings.lync.com/pstnconfe=
rencing> | Learn more about Teams<https://go.microsoft.com/fwlink/?linkid=
=3D857250> | Meeting options<https://teams.microsoft.com/meetingOptions/?or=
ganizerId=3D1c29c2f7-d386-4c5a-a3bc-0ee13b48bc65&tenantId=3D72f988bf-86f1-4=
1af-91ab-2d7cd011db47&threadId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDc=
tMjMxZDYyNzlhNjQy@thread.v2&messageId=3D0&language=3Den-US>
Join with a video conferencing device
813878896@t.plcm.vc<mailto:813878896@t.plcm.vc> VTC Conference ID: 01792068=
4
Alternate VTC dialing instructions<https://dialin.plcm.vc/teams/?key=3D8138=
78896&conf=3D017920684>


--_000_BYAPR21MB1191D66BDE28D50B93D95716C8C60BYAPR21MB1191namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Segoe UI Semibold";
	panose-1:2 11 7 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
span.EmailStyle19
	{mso-style-type:personal;
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Just a qu=
ick reminder that this meeting is on going right now. Feel free to join.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Neeraj<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div>
<p class=3D"MsoNormal">-----Original Appointment-----<br>
<b>From:</b> Neeraj Ladkani <br>
<b>Sent:</b> Tuesday, June 4, 2019 12:09 AM<br>
<b>To:</b> Neeraj Ladkani; openbmc@lists.ozlabs.org; Kun Yi<br>
<b>Cc:</b> Alan Mimms<br>
<b>Subject:</b> Platform telemetry and health monitoring - PST PM<br>
<b>When:</b> Tuesday, July 23, 2019 9:00 PM-10:00 PM (UTC-08:00) Pacific Ti=
me (US &amp; Canada).<br>
<b>Where:</b> Microsoft Teams Meeting<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/wiki/P=
latform-telemetry-and-health-monitoring-Work-Group">https://github.com/open=
bmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group</a><o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,73572842# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,73572842# " target=
=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoration:n=
one">(866) 679-9995</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; (Toll-free)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
</div>
<div style=3D"margin-top:7.5pt;margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424">Conference ID:
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#252424">735 728 42#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D73572842" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Local
 numbers</span></a> | <a href=3D"https://mysettings.lync.com/pstnconferenci=
ng" target=3D"_blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Reset PI=
N</span></a> |
<a href=3D"https://go.microsoft.com/fwlink/?linkid=3D857250" target=3D"_bla=
nk"><span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Lear=
n more about Teams</span></a> |
<a href=3D"https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2=
f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=3D72f988bf-86f1-41af-91ab-2d7cd=
011db47&amp;threadId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyN=
zlhNjQy@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
>
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Meeting =
options</span></a>
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#252424">Join with a video conferencing devic=
e
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span class=3D"MsoHyperlink"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#6264A7;text-deco=
ration:none"><a href=3D"mailto:813878896@t.plcm.vc">813878896@t.plcm.vc</a>=
</span></span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quo=
t;,sans-serif;color:#252424">
 VTC Conference ID: 017920684 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D017920684"><span style=3D"color:#6264A7;text=
-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR21MB1191D66BDE28D50B93D95716C8C60BYAPR21MB1191namp_--
