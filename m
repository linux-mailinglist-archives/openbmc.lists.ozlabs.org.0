Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8D139945
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 19:49:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xN1S4pfxzDqNw
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 05:49:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.93.104;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=jxTY8OXH; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2104.outbound.protection.outlook.com [40.107.93.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xN0p0Fw4zDqGJ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 05:49:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beyWQHaf/aO/e9r0krwVxT4wMA4gKTm5gf2zK0ILGO1rUqzrDiirwCvo7h4C4zyegXtrvzxLs3eEJr5TLexpAxvDxfWiSgmzjWKsPsVKnroD+ZOL18KL8PlmPEBOjIBRByjYY+atrpFxZbqOIreglpdGphY0L+qdllu04d6MdGFRc75E+lCbnciL2DEnVhOHTrniOIY2YFOi8z8u11sJhxoCp3Y5QGflMaOQqyzLJY3+2VviuFAWdNrxSbEhRveyq/udy1ur1FkjFJBBvan+nnTFjk5EuotCF+QvcPAdAKu+1PFxaGB+uhP2T1CpApyb8FoYLu/BibFyRxUGDgPtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AClBLzRQUiqi2WDwlAABktebH8JOUNX5m5zvQLAStXI=;
 b=akcWXBMOHTRV+ttLGY2uhNaC+5BaJa4k5WbgRa7qtpBQsxRKm+dyHvm45PFERy3RSctPJEGo4XK1IbLE5ADwA1j2G3LeMxmliFAiqviLoimFn+Ek55RHR9bX+sEykTQ7a5nB5DDq0owYlgxFfJSe6a5xs5ty/l87F8TI8vOEgJwAWYiZHajPTqRANO40uB32Eoi0lBtTpLRSKsUXG98N3zyszAXgoTUNGL5WgC8gP/OhuLNad58cRnoqqezTphEsISDfzKVrAdgCy3eJi2ZGAGep4xaK9YM71Z8NMCsLlVvvVV7aZGxiDNhHAFBHlCSXnD26SFnMzlironh8nKik/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AClBLzRQUiqi2WDwlAABktebH8JOUNX5m5zvQLAStXI=;
 b=jxTY8OXHNnOBGD4535pbuRWIaMqlBhgXD3Lu5EgPMz4gT2VOyWsFPxzb7zhKS0oLAQ7IfHAzjq4xFoKITHzi/8OqXSlNYw/PwNQI3rA+SPEm+ebccsRAWped5Wb6yh3Oic88IELTgAIgqoFzofjB9B+N/WX2n/fJq1qi2t9/txA=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (20.180.12.7) by
 CH2PR21MB1430.namprd21.prod.outlook.com (20.180.8.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.3; Mon, 13 Jan 2020 18:48:58 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::3479:604d:610:e546]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::3479:604d:610:e546%10]) with mapi id 15.20.2665.003; Mon, 13 Jan 2020
 18:48:58 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak, Piotr"
 <piotr.matuszczak@intel.com>, "kunyi@google.com" <kunyi@google.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Subject: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Topic: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Index: AdXKQcbfGBfhoAISS+WO4z/Ia3YwmQAAFTmg
Date: Mon, 13 Jan 2020 18:48:58 +0000
Message-ID: <CH2PR21MB1510B37E56DCA881F8A0D4F0C8350@CH2PR21MB1510.namprd21.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 5c35f34e-f7bc-4dc4-f600-08d798593fc5
x-ms-traffictypediagnostic: CH2PR21MB1430:MeetingMessage
x-microsoft-antispam-prvs: <CH2PR21MB1430D14870DEFAC9EB21464AC8350@CH2PR21MB1430.namprd21.prod.outlook.com>
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
x-microsoft-antispam-message-info: RFFXD4fQWWJzwYlOuZ0B6k+kdlRXD1okREtGeW5EqXgRhky2qKsvSUdsrW7smG94NlSD4m2eitugCYG7ul8pfs424N2KqoLRPra3amGJ8g77J/yDabNiqHYho2vgqDv5ws3p9O16wSVPlNJtPVQO6LLITzLMDb6k7+92EVrudIifmObOQIHRMqOtrfq0eHXzlzjSWFmXJGVvibLV0jye0HkTYNUAqpsTB9/OXhXOSOV/OLWfmawPfCDhVTGoF8Qg8znp4Fh2MtkfrFW7BT6mb0c2l1QB+53b/uF1en3txw6q6Plyd6hsy3012iqxp/NqE9hxeWqRAPF+89q4E++uItavaguT1hLLeJs3TFO6N9PkH1sUbNlmQ7sXF5t4HHC5PTBUXtBrdE9yuwr/JAtBfo8MEWpizyVEsMMKOmgOjPKTMWjfkQbxJbwYFTlurOLs2zHTOpfsqbNEXBI91fSDznyDfdr3c+G4dtLPN406DBg=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CH2PR21MB1510B37E56DCA881F8A0D4F0C8350CH2PR21MB1510namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c35f34e-f7bc-4dc4-f600-08d798593fc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 18:48:58.4728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OZQvCaKo3eOiwgVYwUU5LwDO8Eds3rkypTVYSL4arTyy8DWQAAjwGCy7L0SHOJDplgFGmKR+iz/5urgktgQXA==
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

--_000_CH2PR21MB1510B37E56DCA881F8A0D4F0C8350CH2PR21MB1510namp_
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


--_000_CH2PR21MB1510B37E56DCA881F8A0D4F0C8350CH2PR21MB1510namp_
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

--_000_CH2PR21MB1510B37E56DCA881F8A0D4F0C8350CH2PR21MB1510namp_
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
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXG5cbg0KVUlEOjA0MDAwMDAw
ODIwMEUwMDA3NEM1QjcxMDFBODJFMDA4MDAwMDAwMDA4MENDNzFCRkZFQzlENTAxMDAwMDAwMDAw
MDAwMDAwDQogMDEwMDAwMDAwREVEMDNGRjdCQzAzMTM0NEI0REYzREY2OEZCRDc2NzMNClNVTU1B
Ulk7TEFOR1VBR0U9ZW4tVVM6T3BlbkJNQyBQbGF0Zm9ybSB0ZWxlbWV0cnkgYW5kIGhlYWx0aCBt
b25pdG9yaW5nIFdvcg0KIGsgR3JvdXANCkRUU1RBUlQ7VFpJRD1QYWNpZmljIFN0YW5kYXJkIFRp
bWU6MjAyMDAxMTRUMTIzMDAwDQpEVEVORDtUWklEPVBhY2lmaWMgU3RhbmRhcmQgVGltZToyMDIw
MDExNFQxMzAwMDANCkNMQVNTOlBVQkxJQw0KUFJJT1JJVFk6NQ0KRFRTVEFNUDoyMDIwMDExM1Qx
ODQ4NTVaDQpUUkFOU1A6T1BBUVVFDQpTVEFUVVM6Q09ORklSTUVEDQpTRVFVRU5DRTowDQpMT0NB
VElPTjtMQU5HVUFHRT1lbi1VUzpNaWNyb3NvZnQgVGVhbXMgTWVldGluZw0KWC1NSUNST1NPRlQt
Q0RPLUFQUFQtU0VRVUVOQ0U6MA0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOjgyMjk0MTY2
OA0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFUVVM6VEVOVEFUSVZFDQpYLU1JQ1JPU09GVC1DRE8t
SU5URU5ERURTVEFUVVM6QlVTWQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZBTFNFDQpY
LU1JQ1JPU09GVC1DRE8tSU1QT1JUQU5DRToxDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZUEU6MA0K
WC1NSUNST1NPRlQtU0tZUEVURUFNU01FRVRJTkdVUkw6aHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQu
Y29tL2wvbWVldHVwLWpvaW4vDQogMTklM2FtZWV0aW5nX01qRmpaVEU1WmpNdE16VXhOeTAwWm1R
NUxXRTFNREl0WVdNMk1UUmhaVEV5T0RobCU0MHRocmVhZC52Mi8NCiAwP2NvbnRleHQ9JTdiJTIy
VGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIyJTJjJTIy
Tw0KIGlkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JTIyJTdk
DQpYLU1JQ1JPU09GVC1TQ0hFRFVMSU5HU0VSVklDRVVQREFURVVSTDpodHRwczovL3NjaGVkLnNl
cnZpY2VzLnNreXBlLm5ldC90ZWENCiBtcy83MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAx
MWRiNDcvMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYw0KIDY1LzE5X21lZXRpbmdf
TWpGalpURTVaak10TXpVeE55MDBabVE1TFdFMU1ESXRZV00yTVRSaFpURXlPRGhsQHRocmVhZC52
Mi8wDQpYLU1JQ1JPU09GVC1TS1lQRVRFQU1TUFJPUEVSVElFUzp7ImNpZCI6IjE5Om1lZXRpbmdf
TWpGalpURTVaak10TXpVeE55MDBabVENCiA1TFdFMU1ESXRZV00yTVRSaFpURXlPRGhsQHRocmVh
ZC52MiJcLCJwcml2YXRlIjp0cnVlXCwidHlwZSI6MFwsIm1pZCI6MFwsIg0KIHJpZCI6MFwsInVp
ZCI6bnVsbH0NClgtTUlDUk9TT0ZULU9OTElORU1FRVRJTkdFWFRFUk5BTExJTks6DQpYLU1JQ1JP
U09GVC1PTkxJTkVNRUVUSU5HQ09ORkxJTks6Y29uZjpzaXA6bmVsYWRrQG1pY3Jvc29mdC5jb21c
O2dydXVcO29wYXENCiB1ZT1hcHA6Y29uZjpmb2N1czppZDp0ZWFtczoyOjAhMTk6bWVldGluZ19N
akZqWlRFNVpqTXRNelV4TnkwMFptUTVMV0UxTURJdA0KIFlXTTJNVFJoWlRFeU9EaGwtdGhyZWFk
LnYyITFjMjljMmY3ZDM4NjRjNWFhM2JjMGVlMTNiNDhiYzY1ITcyZjk4OGJmODZmMTQxDQogYWY5
MWFiMmQ3Y2QwMTFkYjQ3DQpYLU1JQ1JPU09GVC1ET05PVEZPUldBUkRNRUVUSU5HOkZBTFNFDQpY
LU1JQ1JPU09GVC1ESVNBTExPVy1DT1VOVEVSOkZBTFNFDQpYLU1JQ1JPU09GVC1MT0NBVElPTlM6
WyB7ICJEaXNwbGF5TmFtZSIgOiAiTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmciXCwgIkxvY2ENCiB0
aW9uQW5ub3RhdGlvbiIgOiAiIlwsICJMb2NhdGlvblNvdXJjZSIgOiAwXCwgIlVucmVzb2x2ZWQi
IDogZmFsc2VcLCAiTG9jYQ0KIHRpb25VcmkiIDogIiIgfSBdDQpCRUdJTjpWQUxBUk0NCkRFU0NS
SVBUSU9OOlJFTUlOREVSDQpUUklHR0VSO1JFTEFURUQ9U1RBUlQ6LVBUMTVNDQpBQ1RJT046RElT
UExBWQ0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_000_CH2PR21MB1510B37E56DCA881F8A0D4F0C8350CH2PR21MB1510namp_--
