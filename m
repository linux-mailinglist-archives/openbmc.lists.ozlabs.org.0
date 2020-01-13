Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 271B8139946
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 19:51:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xN392nnwzDqNp
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 05:51:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.93.119;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=LbTtPkNt; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2119.outbound.protection.outlook.com [40.107.93.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xN2B737NzDqNt
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 05:50:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtIhnoskyuPPZc3E+nc2PIUq6CTkewbytSTZOdaUWiJZNhtEswS4TbqI+ni7GPO2MeOQ+jOk5jjK7936qWs93+kAggcPmoAopMdcfxBMjLNRUthOYxdUO9o4nWCiHATa+w4nmf/1klj1h1ZXcr/rIXjgMNIAWHqi0rOKdaktzN6w7mYZXZKWCYqV6zKI0ZiacUTdHVS0R49p4ul3jr98maVGQHojXi++Z/lYY5pVRfGSFPr8hCLij3HY5TyD4zLPCsTsENk3WqTxidiLnCtG0a9d3XFvBgPJ9bsW4nM+8CBdW7RGtdlyqTocosAfXnrLRTqzlwLVdsQoio3q1DVMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+3cjHXEFaqKDqaHRCob7rfF1BS8CE7J4ee58k13s2k=;
 b=TNDXCfrTNHHlGkNKzbbqpwu7hXUvHGKl0JCFlFyK8NMxf5Ayk34G2NGUUwEbr8h3etCL74QAeI/FhZBGfpYdEg8UkWdwXZZ94oGI0N1hlsr5EH1LiE9TGscPk+C9SXVCSGhgawv3QnK0iFvx21b8D0W8iteR1IL4qNAh63bmOik5BFw3nUfyKfo+JQfFXYm5UXB1QxVCcsSMov/SI+Js52J1IX1sBEUg0LW0D9W40TpJ/Jd1OVO7oReJqZ8IYQBQ2vRIWn8D77Zmny2Q4rRue3EWtc//4EHMnpBQxhDXzFbf4WBk+2OOctYm+RJKWJTBgGenOfUEcbN/ZkNJfMDtGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+3cjHXEFaqKDqaHRCob7rfF1BS8CE7J4ee58k13s2k=;
 b=LbTtPkNt1eYYdiC31eFPjkFVXLQfHFYvn87/y/MB6hcRgJla6J2edg5i7GH7jGXI6lOEuslFgnKiQ9QXdhSBVhv8kkulBO3+ZdY7z5dhpCceJsLHVwFTNASsP+uN9G0ZqlOmN9QY0YOcFC4iAdkzQ97TVWZ9zAR92Fjoujgwrs4=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (20.180.12.7) by
 CH2PR21MB1430.namprd21.prod.outlook.com (20.180.8.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.3; Mon, 13 Jan 2020 18:50:22 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::3479:604d:610:e546]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::3479:604d:610:e546%10]) with mapi id 15.20.2665.003; Mon, 13 Jan 2020
 18:50:22 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak, Piotr"
 <piotr.matuszczak@intel.com>, "kunyi@google.com" <kunyi@google.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Subject: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Topic: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Index: AdXKQcbfGBfhoAISS+WO4z/Ia3YwmQAAFTmg
Date: Mon, 13 Jan 2020 18:50:21 +0000
Message-ID: <CH2PR21MB15109F11F09A55363FEAB932C8350@CH2PR21MB1510.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAAAAACAzHG//snVAQAAAAAAAAAAEAAAAN7QP/e8AxNEtN899o+9dnM=
x-originating-ip: [50.35.81.9]
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c82cd243-3eaf-4ccd-1d56-08d798597189
x-ms-traffictypediagnostic: CH2PR21MB1430:MeetingMessage
x-microsoft-antispam-prvs: <CH2PR21MB1430AEB252FFBC257E148807C8350@CH2PR21MB1430.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(26005)(64756008)(66556008)(66476007)(10290500003)(186003)(66446008)(55016002)(9686003)(8676002)(71200400001)(8936002)(81156014)(81166006)(33656002)(7696005)(86362001)(8990500004)(4744005)(6506007)(478600001)(52536014)(110136005)(5660300002)(76116006)(316002)(66946007)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR21MB1430;
 H:CH2PR21MB1510.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fdQNWo6uM1OyRF+G00eNmaKFZB7rzLuMA0LsyFqGNPC7r5H9363dSwtawW+OjQfs9YpRL5gnIG+gY0y4sHRSqOpzOoJe9MLWt8gPcc0lQFKKuwWw4dGL/b6kTeZShnucytfcwHySbiiCuhimEkM2uVHqRBmEiikr5t9Hi8D4TccjOVRokJJRcCnakpzfxWgkFRvEQz3WPbKNJM+Qa0SKTowNVwq7ZOhXY02qHbwoop7hT2K1k7rUz8xV3ciiCyAorF6upt78cV/eI83u6GNa8bDqSJ/zI5dFxrhMANjqZSKSb1W+ozP+eU1lMgselkLVXHTR8K5qKUsdw+vladGHoP3cgJJT57DvNx8rlP7oZz9BJoW95TXMdV1d8wncDFPAXpkXv5fZ5l1mmAWaFG1esKPxDnERSzuP7aWOMDtMLQu/hj8/IdikVoPqS4tassW/B7Qi22lzXTbzDysSxxD9y4h9mHHs7DtjIPJI1bGfOuw=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CH2PR21MB15109F11F09A55363FEAB932C8350CH2PR21MB1510namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82cd243-3eaf-4ccd-1d56-08d798597189
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 18:50:21.9222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mft2jH8LlR6JTPbc2DmzOOq5BfVOCXEIFI9hLCuIofqWwch7mNQXJBc6k1oNBUkxd9huftMDIZBoieMFGwc+Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1430
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

--_000_CH2PR21MB15109F11F09A55363FEAB932C8350CH2PR21MB1510namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

New series for 2020.

We will continue talking about progress and addition to current telemetry d=
esign.
___________________________________________________________________________=
_____
Join Microsoft Teams Meeting<https://teams.microsoft.com/l/meetup-join/19%3=
ameeting_MjFjZTE5ZjMtMzUxNy00ZmQ5LWE1MDItYWM2MTRhZTEyODhl%40thread.v2/0?con=
text=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%2=
2%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d>
+1 323-849-4874<tel:+1%20323-849-4874,,710031433#>   United States, Los Ang=
eles (Toll)
(866) 679-9995<tel:(866)%20679-9995,,710031433#>   (Toll-free)
Conference ID: 710 031 433#
Local numbers<https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69=
aa517a91c5?id=3D710031433> | Reset PIN<https://mysettings.lync.com/pstnconf=
erencing> | Learn more about Teams<https://aka.ms/JoinTeamsMeeting> | Meeti=
ng options<https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2=
f7-d386-4c5a-a3bc-0ee13b48bc65&tenantId=3D72f988bf-86f1-41af-91ab-2d7cd011d=
b47&threadId=3D19_meeting_MjFjZTE5ZjMtMzUxNy00ZmQ5LWE1MDItYWM2MTRhZTEyODhl@=
thread.v2&messageId=3D0&language=3Den-US>
Join with a video conferencing device
813878896@t.plcm.vc<mailto:813878896@t.plcm.vc> VTC Conference ID: 01489647=
57
Alternate VTC dialing instructions<https://dialin.plcm.vc/teams/?key=3D8138=
78896&conf=3D0148964757>
___________________________________________________________________________=
_____


--_000_CH2PR21MB15109F11F09A55363FEAB932C8350CH2PR21MB1510namp_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Segoe UI Semibold";
	panose-1:2 11 7 2 4 2 4 2 2 3;}
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
span.EmailStyle18
	{mso-style-type:personal-compose;
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
<p class=3D"MsoNormal">New series for 2020.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We will continue talking about progress and addition=
 to current telemetry design.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
<div>
<div style=3D"margin-top:.25in;margin-bottom:7.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MjFjZTE5ZjMtMzUxNy00ZmQ5LWE1MDItYWM2MTRhZTEyODhl%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,710031433# " ta=
rget=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decorati=
on:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,710031433# " target=
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
s-serif;color:#252424">710 031 433#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D710031433" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Local
 numbers</span></a> | <a href=3D"https://mysettings.lync.com/pstnconferenci=
ng" target=3D"_blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Reset PI=
N</span></a> |
<a href=3D"https://aka.ms/JoinTeamsMeeting" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Learn more about Te=
ams</span></a> |
<a href=3D"https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2=
f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=3D72f988bf-86f1-41af-91ab-2d7cd=
011db47&amp;threadId=3D19_meeting_MjFjZTE5ZjMtMzUxNy00ZmQ5LWE1MDItYWM2MTRhZ=
TEyODhl@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
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
 VTC Conference ID: 0148964757 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D0148964757"><span style=3D"color:#6264A7;tex=
t-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CH2PR21MB15109F11F09A55363FEAB932C8350CH2PR21MB1510namp_
Content-Type: text/calendar; charset="utf-8"; method=REQUEST
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6UkVRVUVTVA0KUFJPRElEOk1pY3Jvc29mdCBFeGNoYW5n
ZSBTZXJ2ZXIgMjAxMA0KVkVSU0lPTjoyLjANCkJFR0lOOlZUSU1FWk9ORQ0KVFpJRDpQYWNpZmlj
IFN0YW5kYXJkIFRpbWUNCkJFR0lOOlNUQU5EQVJEDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0K
VFpPRkZTRVRGUk9NOi0wNzAwDQpUWk9GRlNFVFRPOi0wODAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJ
TlRFUlZBTD0xO0JZREFZPTFTVTtCWU1PTlRIPTExDQpFTkQ6U1RBTkRBUkQNCkJFR0lOOkRBWUxJ
R0hUDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0KVFpPRkZTRVRGUk9NOi0wODAwDQpUWk9GRlNF
VFRPOi0wNzAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJTlRFUlZBTD0xO0JZREFZPTJTVTtCWU1PTlRI
PTMNCkVORDpEQVlMSUdIVA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46VkVWRU5UDQpPUkdBTklaRVI7
Q049TmVlcmFqIExhZGthbmk6bWFpbHRvOm5lbGFka0BtaWNyb3NvZnQuY29tDQpBVFRFTkRFRTtS
T0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPW9w
ZW5ibWNAbGkNCiBzdHMub3psYWJzLm9yZzptYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
DQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD1UUlVFO0NOPSJNYXR1c3pjemFrDQogLCBQaW90ciI6bWFpbHRvOnBpb3RyLm1hdHVzemN6YWtA
aW50ZWwuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1B
Q1RJT047UlNWUD1UUlVFO0NOPWt1bnlpQGdvb2cNCiBsZS5jb206bWFpbHRvOmt1bnlpQGdvb2ds
ZS5jb20NCkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElP
TjtSU1ZQPVRSVUU7Q049UGF1bC5WYW5jaQ0KIGxAZGVsbC5jb206bWFpbHRvOlBhdWwuVmFuY2ls
QGRlbGwuY29tDQpERVNDUklQVElPTjtMQU5HVUFHRT1lbi1VUzpOZXcgc2VyaWVzIGZvciAyMDIw
LlxuXG5XZSB3aWxsIGNvbnRpbnVlIHRhbGtpbmcNCiAgYWJvdXQgcHJvZ3Jlc3MgYW5kIGFkZGl0
aW9uIHRvIGN1cnJlbnQgdGVsZW1ldHJ5IGRlc2lnbi5cbl9fX19fX19fX19fX19fXw0KIF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXG5Kb2luIE1pDQogY3Jvc29mdCBUZWFtcyBNZWV0aW5nPGh0dHBzOi8vdGVhbXMubWljcm9z
b2Z0LmNvbS9sL21lZXR1cC1qb2luLzE5JTNhbWVldGkNCiBuZ19NakZqWlRFNVpqTXRNelV4Tnkw
MFptUTVMV0UxTURJdFlXTTJNVFJoWlRFeU9EaGwlNDB0aHJlYWQudjIvMD9jb250ZXh0PQ0KICU3
YiUyMlRpZCUyMiUzYSUyMjcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDExZGI0NyUyMiUy
YyUyMk9pZCUyMiUzYSUyDQogMjFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSUy
MiU3ZD5cbisxIDMyMy04NDktNDg3NDx0ZWw6KzElMjAzMjMNCiAtODQ5LTQ4NzRcLFwsNzEwMDMx
NDMzIz4gICBVbml0ZWQgU3RhdGVzXCwgTG9zIEFuZ2VsZXMgKFRvbGwpXG4oODY2KSA2NzktOQ0K
IDk5NTx0ZWw6KDg2NiklMjA2NzktOTk5NVwsXCw3MTAwMzE0MzMjPiAgIChUb2xsLWZyZWUpXG5D
b25mZXJlbmNlIElEOiA3MTAgDQogMDMxIDQzMyNcbkxvY2FsIG51bWJlcnM8aHR0cHM6Ly9kaWFs
aW4udGVhbXMubWljcm9zb2Z0LmNvbS84NTUxZjRjMS1iZWEzLTQNCiA0MWEtODczOC02OWFhNTE3
YTkxYzU/aWQ9NzEwMDMxNDMzPiB8IFJlc2V0IFBJTjxodHRwczovL215c2V0dGluZ3MubHluYy5j
bw0KIG0vcHN0bmNvbmZlcmVuY2luZz4gfCBMZWFybiBtb3JlIGFib3V0IFRlYW1zPGh0dHBzOi8v
YWthLm1zL0pvaW5UZWFtc01lZXRpDQogbmc+IHwgTWVldGluZyBvcHRpb25zPGh0dHBzOi8vdGVh
bXMubWljcm9zb2Z0LmNvbS9tZWV0aW5nT3B0aW9ucy8/b3JnYW5pemUNCiBySWQ9MWMyOWMyZjct
ZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JnRlbmFudElkPTcyZjk4OGJmLTg2ZjEtNDFhZi05
MWFiLQ0KIDJkN2NkMDExZGI0NyZ0aHJlYWRJZD0xOV9tZWV0aW5nX01qRmpaVEU1WmpNdE16VXhO
eTAwWm1RNUxXRTFNREl0WVdNMk1UUmhaDQogVEV5T0RobEB0aHJlYWQudjImbWVzc2FnZUlkPTAm
bGFuZ3VhZ2U9ZW4tVVM+XG5Kb2luIHdpdGggYSB2aWRlbyBjb25mZXJlbmMNCiBpbmcgZGV2aWNl
XG44MTM4Nzg4OTZAdC5wbGNtLnZjPG1haWx0bzo4MTM4Nzg4OTZAdC5wbGNtLnZjPiBWVEMgQ29u
ZmVyZW5jZQ0KICBJRDogMDE0ODk2NDc1N1xuQWx0ZXJuYXRlIFZUQyBkaWFsaW5nIGluc3RydWN0
aW9uczxodHRwczovL2RpYWxpbi5wbGNtLnZjDQogL3RlYW1zLz9rZXk9ODEzODc4ODk2JmNvbmY9
MDE0ODk2NDc1Nz5cbl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXG5cbg0KUlJVTEU6RlJFUT1X
RUVLTFk7VU5USUw9MjAyMDA2MzBUMTkzMDAwWjtJTlRFUlZBTD0yO0JZREFZPVRVO1dLU1Q9U1UN
ClVJRDowNDAwMDAwMDgyMDBFMDAwNzRDNUI3MTAxQTgyRTAwODAwMDAwMDAwODBDQzcxQkZGRUM5
RDUwMTAwMDAwMDAwMDAwMDAwMA0KIDAxMDAwMDAwMERFRDAzRkY3QkMwMzEzNDRCNERGM0RGNjhG
QkQ3NjczDQpTVU1NQVJZO0xBTkdVQUdFPWVuLVVTOk9wZW5CTUMgUGxhdGZvcm0gdGVsZW1ldHJ5
IGFuZCBoZWFsdGggbW9uaXRvcmluZyBXb3INCiBrIEdyb3VwDQpEVFNUQVJUO1RaSUQ9UGFjaWZp
YyBTdGFuZGFyZCBUaW1lOjIwMjAwMTE0VDEyMzAwMA0KRFRFTkQ7VFpJRD1QYWNpZmljIFN0YW5k
YXJkIFRpbWU6MjAyMDAxMTRUMTMwMDAwDQpDTEFTUzpQVUJMSUMNClBSSU9SSVRZOjUNCkRUU1RB
TVA6MjAyMDAxMTNUMTg1MDE4Wg0KVFJBTlNQOk9QQVFVRQ0KU1RBVFVTOkNPTkZJUk1FRA0KU0VR
VUVOQ0U6MQ0KTE9DQVRJT047TEFOR1VBR0U9ZW4tVVM6TWljcm9zb2Z0IFRlYW1zIE1lZXRpbmcN
ClgtTUlDUk9TT0ZULUNETy1BUFBULVNFUVVFTkNFOjENClgtTUlDUk9TT0ZULUNETy1PV05FUkFQ
UFRJRDo4MjI5NDE2NjgNClgtTUlDUk9TT0ZULUNETy1CVVNZU1RBVFVTOlRFTlRBVElWRQ0KWC1N
SUNST1NPRlQtQ0RPLUlOVEVOREVEU1RBVFVTOkJVU1kNClgtTUlDUk9TT0ZULUNETy1BTExEQVlF
VkVOVDpGQUxTRQ0KWC1NSUNST1NPRlQtQ0RPLUlNUE9SVEFOQ0U6MQ0KWC1NSUNST1NPRlQtQ0RP
LUlOU1RUWVBFOjENClgtTUlDUk9TT0ZULVNLWVBFVEVBTVNNRUVUSU5HVVJMOmh0dHBzOi8vdGVh
bXMubWljcm9zb2Z0LmNvbS9sL21lZXR1cC1qb2luLw0KIDE5JTNhbWVldGluZ19NakZqWlRFNVpq
TXRNelV4TnkwMFptUTVMV0UxTURJdFlXTTJNVFJoWlRFeU9EaGwlNDB0aHJlYWQudjIvDQogMD9j
b250ZXh0PSU3YiUyMlRpZCUyMiUzYSUyMjcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDEx
ZGI0NyUyMiUyYyUyMk8NCiBpZCUyMiUzYSUyMjFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBlZTEz
YjQ4YmM2NSUyMiU3ZA0KWC1NSUNST1NPRlQtU0NIRURVTElOR1NFUlZJQ0VVUERBVEVVUkw6aHR0
cHM6Ly9zY2hlZC5zZXJ2aWNlcy5za3lwZS5uZXQvdGVhDQogbXMvNzJmOTg4YmYtODZmMS00MWFm
LTkxYWItMmQ3Y2QwMTFkYjQ3LzFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmMNCiA2
NS8xOV9tZWV0aW5nX01qRmpaVEU1WmpNdE16VXhOeTAwWm1RNUxXRTFNREl0WVdNMk1UUmhaVEV5
T0RobEB0aHJlYWQudjIvMA0KWC1NSUNST1NPRlQtU0tZUEVURUFNU1BST1BFUlRJRVM6eyJjaWQi
OiIxOTptZWV0aW5nX01qRmpaVEU1WmpNdE16VXhOeTAwWm1RDQogNUxXRTFNREl0WVdNMk1UUmha
VEV5T0RobEB0aHJlYWQudjIiXCwicHJpdmF0ZSI6dHJ1ZVwsInR5cGUiOjBcLCJtaWQiOjBcLCIN
CiByaWQiOjBcLCJ1aWQiOm51bGx9DQpYLU1JQ1JPU09GVC1PTkxJTkVNRUVUSU5HRVhURVJOQUxM
SU5LOg0KWC1NSUNST1NPRlQtT05MSU5FTUVFVElOR0NPTkZMSU5LOmNvbmY6c2lwOm5lbGFka0Bt
aWNyb3NvZnQuY29tXDtncnV1XDtvcGFxDQogdWU9YXBwOmNvbmY6Zm9jdXM6aWQ6dGVhbXM6Mjow
ITE5Om1lZXRpbmdfTWpGalpURTVaak10TXpVeE55MDBabVE1TFdFMU1ESXQNCiBZV00yTVRSaFpU
RXlPRGhsLXRocmVhZC52MiExYzI5YzJmN2QzODY0YzVhYTNiYzBlZTEzYjQ4YmM2NSE3MmY5ODhi
Zjg2ZjE0MQ0KIGFmOTFhYjJkN2NkMDExZGI0Nw0KWC1NSUNST1NPRlQtT05MSU5FTUVFVElOR0lO
Rk9STUFUSU9OOnsiT25saW5lTWVldGluZ1Byb3ZpZGVyIjozfQ0KWC1NSUNST1NPRlQtRE9OT1RG
T1JXQVJETUVFVElORzpGQUxTRQ0KWC1NSUNST1NPRlQtRElTQUxMT1ctQ09VTlRFUjpGQUxTRQ0K
WC1NSUNST1NPRlQtTE9DQVRJT05TOlsgeyAiRGlzcGxheU5hbWUiIDogIk1pY3Jvc29mdCBUZWFt
cyBNZWV0aW5nIlwsICJMb2NhDQogdGlvbkFubm90YXRpb24iIDogIiJcLCAiTG9jYXRpb25Tb3Vy
Y2UiIDogMFwsICJVbnJlc29sdmVkIiA6IGZhbHNlXCwgIkxvY2ENCiB0aW9uVXJpIiA6ICIiIH0g
XQ0KQkVHSU46VkFMQVJNDQpERVNDUklQVElPTjpSRU1JTkRFUg0KVFJJR0dFUjtSRUxBVEVEPVNU
QVJUOi1QVDE1TQ0KQUNUSU9OOkRJU1BMQVkNCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpW
Q0FMRU5EQVINCg==

--_000_CH2PR21MB15109F11F09A55363FEAB932C8350CH2PR21MB1510namp_--
