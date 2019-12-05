Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1BA113BF3
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 07:52:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T5xT68lpzDqZD
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 17:52:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.220.124;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="KPzqt6/s"; dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2124.outbound.protection.outlook.com [40.107.220.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T5wd2CbjzDqXC
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 17:51:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKA3vjFQJHR3YEAUhpOUTNIOM0CWwAJYlBXNoyoVs3VnSbK7HYCl7ue9LW7nCVefhgIoFnDbbV6S3wtYgJaSE7/+8lRX7ac6VV9S9YDWneoA2ch45m5dIdERQkK7C9GSZW2g6OYQxcYr+BW2EfoLEHjDXUdcryT73yKCDBbX1vrlIp9t0niKY6y04vYpWRnbkzfz5ZltAtL8A1HUZhH/KG1ve3T0bxroAbqcKf377uubvVrEkZV/29tsiDOBQ08Y6jl9W/tB05sJ+zRuPZ9z6//dPvhg1TUwKcvULToA7NembFf0pijNF3gPyQVA9mRxLvplRM7EoYGFEf/men02kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKIjMo3N8B1I+HqVfZFbplnhn8qRvHv1WC5b0NxN/Gc=;
 b=YfIMp+PejuyiNx+VV1Q4c+4pWXo7kVo+OsIDiecexUpHFgRMtRAu1EbhPmqXFpeaW8f+1KvDGi8Trws9lUiC3sXY043W67u8d+9FIL2ul2d/yLPFqfOZKZX+DCyNeuziH30zie+hzYeAOZUOtYL+KSiuQqDp+EAoVN7qQ6HEIB2xUKR/ugujwT4l+p8Ryg8qhFbqD1bJTjtk3LXbWMAfCgMM9dGqu9QlHualHbpQ56eGqaHrGLyq9Wv3531xxFraRas95+upY2i1/W8wykEhyFYILnhBZY/X/tzcXWg67OFp+xM1/JGo9bv1k3LjEmr1s5CWdWp+UVYoopa2l+KIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKIjMo3N8B1I+HqVfZFbplnhn8qRvHv1WC5b0NxN/Gc=;
 b=KPzqt6/syA+ngCVUr9lcAfmhkO/LY/Wgf8pljNVxPvelebbDdsFeZX1EGJixRUJaGRe4ky9TCP7igYn4lUJtMqVmjkSo5TXQ2p3NWZHBrEKfxe2RnaNedUEktz40XKaGT+AAIIw2a2rAaPp997p3QamyALBlyrAoHWFhhxJA33I=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1515.namprd21.prod.outlook.com (20.180.23.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.2; Thu, 5 Dec 2019 06:51:21 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d%3]) with mapi id 15.20.2538.005; Thu, 5 Dec 2019
 06:51:21 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: openbmc-test-automation
Thread-Topic: openbmc-test-automation
Thread-Index: AdWrOCo+1CTWGOjJR+6BZacKk/lKow==
Date: Thu, 5 Dec 2019 06:51:20 +0000
Message-ID: <DM6PR21MB1388C6C8108C54E31FE17527C85C0@DM6PR21MB1388.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-05T06:51:19.7871894Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=1202e154-6a93-4ed7-b614-ab110d365bc3;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 071cde80-7822-46be-8e08-08d7794f896e
x-ms-traffictypediagnostic: DM6PR21MB1515:
x-microsoft-antispam-prvs: <DM6PR21MB1515CC1904AF25F59AE40894C85C0@DM6PR21MB1515.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(366004)(39860400002)(396003)(346002)(199004)(189003)(8676002)(81156014)(10090500001)(81166006)(52536014)(1730700003)(99286004)(8990500004)(558084003)(8936002)(10290500003)(86362001)(7696005)(6916009)(22452003)(478600001)(316002)(6306002)(54896002)(6506007)(5660300002)(55016002)(3480700005)(6116002)(3846002)(102836004)(2501003)(9686003)(790700001)(26005)(186003)(2351001)(14454004)(25786009)(66476007)(66556008)(2906002)(5640700003)(74316002)(64756008)(71190400001)(6436002)(71200400001)(66446008)(76116006)(7736002)(33656002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1515;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DUioArHP6tEwV7kgnkmbiyaeTQd827AVw2H3k5YMt1oLiTKXb2QbKpCCHQl18PGSOAUjjonjJTaMSvS7QekVqT8Ca+hFQ7H7yGU3+3O3pMjCWGnr3y9eEx2FY6WTmOWiEabO2loxah20zP20iHA1wxuAF/DIWpu76ykiCTJ7EOhH3nMFCVwTjw69wTm49d6jfy7NvaYt17hRUiKUT3PIPIOYz9Elwg4MHbdQLZu206s4BP0NL8TM9ztmAdesm43GT2fFhiLRd2Tifx5GfUdK81dEM+Vvf1pKZWe277hmUI+wq5+Ixus1obiTrPCmezxqAzbKS6S/zD5IRgQMKSpbkOiuIbLO49g6o/lfBFuQfVJK/ccGKrgaC4Il0XQrsHL56c1wgYQHG5ZFYYa1Cpo+eIlfhPa/en6I1LrxOK81JHpvH9mv+NL13RU5RGgON8bC
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR21MB1388C6C8108C54E31FE17527C85C0DM6PR21MB1388namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071cde80-7822-46be-8e08-08d7794f896e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 06:51:20.9623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: we1AkcDShyVptPnuia0jICqeLUSoCKLZSwlgO9KKTaXvsBtPlUIDvxRTqFG09qS7vCuGBctWYINTQZtXsyOVYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1515
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

--_000_DM6PR21MB1388C6C8108C54E31FE17527C85C0DM6PR21MB1388namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there any IPMI and redfish compliance test suits in the "openbmc-test-au=
tomation"?  can anyone point me to the suite?

Neeraj


--_000_DM6PR21MB1388C6C8108C54E31FE17527C85C0DM6PR21MB1388namp_
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
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">Is there any IPMI and redfish compliance test suits =
in the &#8220;openbmc-test-automation&#8221;? &nbsp;can anyone point me to =
the suite?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Neeraj<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR21MB1388C6C8108C54E31FE17527C85C0DM6PR21MB1388namp_--
