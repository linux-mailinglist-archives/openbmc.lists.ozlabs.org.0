Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45673C2AE5
	for <lists+openbmc@lfdr.de>; Fri,  9 Jul 2021 23:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GM60L3J31z3bW2
	for <lists+openbmc@lfdr.de>; Sat, 10 Jul 2021 07:35:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=bLTqmBpz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.92.139;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=rahulkapoor@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=bLTqmBpz; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2139.outbound.protection.outlook.com [40.107.92.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GM6004Pjkz303f
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jul 2021 07:35:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS2vYgodGzUt1SzVyUGEaVzLkHMu2PzJyD3z20EiFHqy4YqVelQVW1gWv0Trqd3rtlQ9Gzm8t1q+Fdht4MkV2K4rMNDRNXBc6F5JS6F3iXB6ngy/4xhMtjnHwE1RxDtpcYi6f24/FNYKvFZcQVMDyAlm1DLr0yumL5iOMgXbwC759hcaOt8TRWW9oa8y+HJa12r1EqiCBy7sekFQsBTlXfGtCQBwqhNhzVeEf71xl6nJcUqVJG2XuvRLDWGBKIIgAcE3u+OucBCErfykQq2151v2gaD26sSKs0cyUGTKSlfrhbype+ejtsfG1A39ePfql3khxGzrOaUIwY9BwG5BPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NddxmqJgx6UyJfy7F+D/MDh71cVaDA3bLqVM6oOiz8s=;
 b=TlRo1LAfaXvy+nMTjJqS6Iy03ZHecr3YklNz+zecAkn1yQmQJDJ2k1VbxMDNMrAsBdHL/Hsv/otri7k8xfutIc/+b2pKXyILy/IVdxppPzKDo+I4nPXXPI4VPukULKy+wD7l8mNYBBVFMdkQYDRbXoPKcuk4LwyIx0v1r3q+FfWjOdhrQHaWWZ0K7jfKiKPlujP7UvVu+cLgsHi+g6ZaxSQCGDiOC9RtcM+79l3Hf8U+EYOBGEqqVm93MOIR6cldBtn4Y0BxjXZEDA7V//SUV/ckOAYU8AcSwnxhdLnFnr39mqPKDOQl8T1k8y6g6rAmVniNu4Q1Ehr9B0APV2t35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NddxmqJgx6UyJfy7F+D/MDh71cVaDA3bLqVM6oOiz8s=;
 b=bLTqmBpzQeH9+qDzb+VuRQS/1znuGUcIZEM59YA0V+pyE+ZTwRMsrSF+e25KpUh5N4FL5J6+lnxiJV/bGpqh1R52TG2CJG4BU5m96fUrIC9Nl488SP5D0kW/iCUgqiexYhVGyio0zYmrLDRx6MLBhqKWNM9GtXigRiW8UiZm4xM=
Received: from MWHPR2101MB0730.namprd21.prod.outlook.com
 (2603:10b6:301:7f::39) by MWHPR21MB0176.namprd21.prod.outlook.com
 (2603:10b6:300:78::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.7; Fri, 9 Jul
 2021 21:35:06 +0000
Received: from MWHPR2101MB0730.namprd21.prod.outlook.com
 ([fe80::745a:4199:5e03:49dd]) by MWHPR2101MB0730.namprd21.prod.outlook.com
 ([fe80::745a:4199:5e03:49dd%6]) with mapi id 15.20.4331.014; Fri, 9 Jul 2021
 21:35:06 +0000
From: Rahul Kapoor <rahulkapoor@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OriginOfCondition in Redfish Log Entry
Thread-Topic: OriginOfCondition in Redfish Log Entry
Thread-Index: Add1Aj1W98bbZEzaRz6mTIYv+2XMCg==
Date: Fri, 9 Jul 2021 21:35:06 +0000
Message-ID: <MWHPR2101MB07300A6B60156F4913C3177EAB189@MWHPR2101MB0730.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=316d4d88-2805-41dc-841c-6bf839931b86;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-07-09T20:27:32Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ec22d24-0149-4736-4db4-08d943216b79
x-ms-traffictypediagnostic: MWHPR21MB0176:
x-microsoft-antispam-prvs: <MWHPR21MB0176D73445A603EB596862EAAB189@MWHPR21MB0176.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mWysP0HXYvJZBL3Wd+ByImyGtrLMSmbub0gS0vz8Vu0HljVqEv/+Dp+UoCyPoJTevcQGdQR8eefiRpPLlAIqxJoMsg0Isdi62pFn+0sjLCyh+jF2JAZbsfk98lwgCq8SI+7X+ntRgvyLbJU4A2R6jXA4eFQkrQHtfAAITczjBldPXbgleGR/KLGc7DGoTfYlKc8uAAJCHE8J7d32gFzVIKN9sAW976mcYzILM5ROePEzumQ5rFPdTzOzFpKuXWqvDriL/oVkEKEaTHEA9EpBPom6TZoAKNV/Wf8vPKVVFiLyzJ1VWP8Jm0EXrgxbwVByoevtX3693fyBLJeQrBGfP9X47x3Zuw2nPOXRTaxRPnS0yeEzkmchxmhqFRvori+likkJHL7pnj4hGdLhIy3Vfmev7w32De3393hVYYckirf3xlT9A8SMcvu5J06nG4Db+unh0ncOBbs36FCyBYNRc2te8HbiE8Hs2lTEcCflsA6ayVj6Yrsx5oZPuGjYxBBlJLrqY6zIGj10ImtPkUzuf4apYXK1WSdz2tPQGUdM22VbInjCZYaf9mXia+2PIUrTXHvDUmnkBAeEgy431D75x/sWxbK+KhboAtKXQUQZXIPZgpJI2b5Dza6oWPt4aE8uIRYnBEd9aZSjQ5ffBVFNCpbdOaUjGIKZRt3iXfdihQzZKXlfzqeDAVlNH/gOzr031QUyJjxtN4LGzuv68rUtkWS2ZMrBzDAsubfaCpdPLhw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR2101MB0730.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(38100700002)(122000001)(316002)(8936002)(76116006)(478600001)(7696005)(166002)(2906002)(5660300002)(52536014)(86362001)(9686003)(9326002)(55016002)(6506007)(6916009)(82960400001)(10290500003)(71200400001)(82950400001)(66476007)(66556008)(83380400001)(64756008)(66446008)(66946007)(966005)(33656002)(8990500004)(186003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lVW7N/evFkC7Wist8IH7+XclvvaOJ7DeR7q6OgMpTmXTSgQ54jgzYR9vqSyI?=
 =?us-ascii?Q?kFDzKAjlTr4ix137uRjbOsHtTJ//jT59Gae1ZJ9ALnzdzdXQMTR+jhKyXkoF?=
 =?us-ascii?Q?JRy6RA6mf/daGQDpZ1+BfCw18BxdgmgBssfr/zD6Oj/E63NDi/qTsYBRSZIB?=
 =?us-ascii?Q?O6jAENe4YACuwnDdXtAEnNRAekNGARMJZOTG9EEIcgQrIGYndphzVkkHjc7F?=
 =?us-ascii?Q?79kAS15tEUx0UQ0rmUzNJQ5CmDo/FXiSmYvHcF5lsj0tb4mnPywHrBQMnhmM?=
 =?us-ascii?Q?0zfK3W+Qc4NJpPVAit3LH5Yd4OI2aVjOqC3Y3NzZC+U1koqJBy+THMMiMocp?=
 =?us-ascii?Q?/CR+dLhiFWB3y9Q7FfPqWqS22Gogvz6yE8Ki1mYpNn/p41bLBA9krwRdBAzK?=
 =?us-ascii?Q?qEbO5E9RLGbhAfoHzD61U13/c0gCAeHWaHNsil/QKbMNQMzGEWV/Dp+5y5DO?=
 =?us-ascii?Q?h1DoNKFg0wHJdyNGnrEcP7BypT4E7382eJ7shYNzitpS4eo1lbu2GVDgRgWJ?=
 =?us-ascii?Q?MPrykzyqSIyI992YG3G+DX8aeGwkrOArAA9y4dDhpbuFjdWyPKm/AEflA3sV?=
 =?us-ascii?Q?W6s39PCWQaO17qjB/Dk18BgN/eft0JFsg6mRYLXo/Wlnt5qoFQ9CEgmqHymq?=
 =?us-ascii?Q?CshuZ1YqsE/cfTIaKsq5oxrTGyUmL3cdbcS2aSCJED4HOUR1PjCS2y+E7awb?=
 =?us-ascii?Q?JfeFnfVAO1/BMY9ev776fTMRDySFLjnlUUfWLCkBBByg1gEHe4plQ+irML8s?=
 =?us-ascii?Q?GZFAsiLvuyPULhBFn46gW8Od7yujbGRcWyiw0sRbxpJHiGvd4dy5ZcY+Luz4?=
 =?us-ascii?Q?9q8dshALa9Ly//LVHAieJ6856AK1QpHbqs2TR5PFLz62Tll3lvhQxkccEhPQ?=
 =?us-ascii?Q?P2DPoV9nCXeoAQtsVBooEWr0uLzG4zi8o3LZ4z4qbGI9GmypqI3pfowzAEyw?=
 =?us-ascii?Q?yPFdhpX/pNgta+PTQm2uQalukGsB3stgzdKF0OWFRY4sOMst2/EKEPXWsFFM?=
 =?us-ascii?Q?jfixI5c2ie3jxsWFO0FkSbau6lizFbXFEhkwN21YvXpdIA9Wh3kEgmMWnKfa?=
 =?us-ascii?Q?5f+xayR5M8XE1QuYz8pgm+F5xfQl6A9UUH5TFASD5S9ndyK2Emdu1ow7I/4r?=
 =?us-ascii?Q?2OuVuLMfATmcTouIYTgLHiVdPBlfQaj61zUH54TuiNo/KBsRxOByq8j0/Rlg?=
 =?us-ascii?Q?4Tg33ecijHybX0sq4QmA7iw+uLkjoj5lBstUvJ46WKVbQUb2b8GYxM1SK1sX?=
 =?us-ascii?Q?hu/99OfTP6D+ibfkwdI4SEtanHhvi4rYyeVaDtGZrVUYjTSxA8N5Px3Ws3gu?=
 =?us-ascii?Q?xBY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MWHPR2101MB07300A6B60156F4913C3177EAB189MWHPR2101MB0730_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR2101MB0730.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec22d24-0149-4736-4db4-08d943216b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 21:35:06.4610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUpNDxWRG2SWiNn2T7IkerGRnrQdhkS71zjqdIAtEVOx/6M6eNHcG8ufrY43AuRLxay8F+ZdxkR9jqQKQwgVyijK7kXMsm5obEVSL6W10bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0176
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

--_000_MWHPR2101MB07300A6B60156F4913C3177EAB189MWHPR2101MB0730_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I wanted to get some context on the current design of Redfish Log Entry. I =
see that the existing implementation of LogEntry in log_services.hpp does n=
ot populate the property OriginOfCondition as described in https://redfish.=
dmtf.org/schemas/v1/LogEntry.v1_9_0.json within Links object.
I understand this is not a required property but I think it's essential to =
establish context of the event source should the implementation use DMTF Re=
sourceEvent Registry (https://redfish.dmtf.org/registries/ResourceEvent.1.0=
.3.json) for logging events in Redfish LogService. I see some implementatio=
n in Event Service Manager module  but I am interested in having this prope=
rty available in redfish log entry for redfish clients that only pull event=
s and don't subscribe.
The entries in OpenBMC Message Registry are quite descriptive about the sou=
rce but my use case is based on ResourceEvent registry which is not as desc=
riptive and entries would need a link to the associated resource.
Any feedback on the assessment above would be really helpful.

-Rahul

--_000_MWHPR2101MB07300A6B60156F4913C3177EAB189MWHPR2101MB0730_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
<p class=3D"MsoNormal">I wanted to get some context on the current design o=
f Redfish Log Entry. I see that the existing implementation of LogEntry in =
log_services.hpp does not populate the property OriginOfCondition as descri=
bed in
<a href=3D"https://redfish.dmtf.org/schemas/v1/LogEntry.v1_9_0.json">https:=
//redfish.dmtf.org/schemas/v1/LogEntry.v1_9_0.json</a> within Links object.
<o:p></o:p></p>
<p class=3D"MsoNormal">I understand this is not a required property but I t=
hink it&#8217;s essential to establish context of the event source should t=
he implementation use DMTF ResourceEvent Registry (<a href=3D"https://redfi=
sh.dmtf.org/registries/ResourceEvent.1.0.3.json">https://redfish.dmtf.org/r=
egistries/ResourceEvent.1.0.3.json</a>)
 for logging events in Redfish LogService. I see some implementation in Eve=
nt Service Manager module &nbsp;but I am interested in having this property=
 available in redfish log entry for redfish clients that only pull events a=
nd don&#8217;t subscribe.
<o:p></o:p></p>
<p class=3D"MsoNormal">The entries in OpenBMC Message Registry are quite de=
scriptive about the source but my use case is based on ResourceEvent regist=
ry which is not as descriptive and entries would need a link to the associa=
ted resource.<o:p></o:p></p>
<p class=3D"MsoNormal">Any feedback on the assessment above would be really=
 helpful.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Rahul<o:p></o:p></p>
</div>
</body>
</html>

--_000_MWHPR2101MB07300A6B60156F4913C3177EAB189MWHPR2101MB0730_--
