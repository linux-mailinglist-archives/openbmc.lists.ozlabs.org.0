Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58144117877
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 22:27:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wx9X5RG1zDqS1
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 08:27:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.94.91;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="T6KOly2K"; dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2091.outbound.protection.outlook.com [40.107.94.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wx8C6zgwzDqQh
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 08:26:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVNS3GWPRDNmWdxSQt4tDUocjVvGPsZf2+BoWJrKYKy3xq+hZ6pNVhI4ACWHUNw8Kb71VuYntJG4eT3KwdpRPOM5z2lIeoBeDqDyO1A2hW+TX1i5wAYxiu+hZKLxbe+1N04mUueApUY22OkeMQCkyGm5fyx0DvYoy91/LS7Az4uRRqMhv2loNWk6DK37JwSkggOga9efcZnOZA5+lY8HMXSqP8lLd9JVkr1Mwtkp1xC6g3wl0riVlSHrPvnZNK1nEFspfpXbJJaQ/F4PA3Zahivn1zy1Rt561X6Neo07ir+eacM9xDgqMLDfIgZdp2LUOdM2UYP+6oOj+RaTYYe9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzjvvAGs2WxZNwZxJpvVsiCjWS4QC1RUPgV+I3owf7A=;
 b=jHlTgO4pFV1yVsfIw4Rbyl22BPLrYSIxCERPcZPWzPiq1QR3pC4J938kvE9SpfoNdZ0OFgVoCxP8n/27P0/gVFCk5IUzsgKEG9UnnqSiNYnq2MJM6QY8uVYucwR5ucBfNyeVkkDMqexssKzhzKWqGujGgeIfevcS8r2Fc131U5o62AcxCWxuzu342LthrpPtcNMsOTx0JsUpte87HtJ5W3FDUsXKYKz/DesBCxrHpmdgU0nJub345YKNRXimz8WBNjgl4xnIGdZVhBLgjQTTcQNokPBwcxe4uNwzQ2wgp5YuOOK46Oqbi1duP37/1aAuRVYnftR5MZ2Pr/EKtikK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzjvvAGs2WxZNwZxJpvVsiCjWS4QC1RUPgV+I3owf7A=;
 b=T6KOly2KIp7BpxEwzs7F4Qaf9WgC4aRm35CBd9nNzPWHCQd/CcrngD8p4flr+L+eYMgX/mGIpGX7jvZcIxyxWpsjWcgn5lZ9wtRALsl88nPJk5GdBj6m8M8DBb7Lz5YfF/OhJGNxPs+VY+2O31NGSXLXnzV7RCzjkjrxcNe/V2A=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1386.namprd21.prod.outlook.com (20.180.20.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.3; Mon, 9 Dec 2019 21:26:14 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d%3]) with mapi id 15.20.2538.012; Mon, 9 Dec 2019
 21:26:14 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Managing heterogeneous systems
Thread-Topic: Managing heterogeneous systems
Thread-Index: AdWu1yhmGvdHkOccSv+RAjUNtxHNjw==
Date: Mon, 9 Dec 2019 21:26:14 +0000
Message-ID: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-09T21:26:12.8905423Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=68d6c29c-bc7d-4880-8928-ea67db74e985;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:1:199a:3531:c00f:e252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e7846be-a86c-40ac-429f-08d77cee6b7c
x-ms-traffictypediagnostic: DM6PR21MB1386:
x-microsoft-antispam-prvs: <DM6PR21MB13869EE901726CF40F30FEEBC8580@DM6PR21MB1386.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(199004)(6916009)(86362001)(71190400001)(7116003)(66556008)(71200400001)(478600001)(8990500004)(66476007)(3480700005)(66946007)(7696005)(66446008)(76116006)(52536014)(5660300002)(64756008)(316002)(10090500001)(33656002)(9686003)(10290500003)(558084003)(186003)(1730700003)(8936002)(8676002)(5640700003)(81166006)(81156014)(2906002)(790700001)(6506007)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1386;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t1N3LoM4qtVs0SRPPg188+OVl6fG+5qgCId0yOcshlFaZVIrnqeCaIojDqJ+G9TliBdhxt2HOk3+MZxgsLs1fEn5CxPz9FdAtKr4QENvqSnaXIKB1epbN1D/SSuwFdHEB0Wco8HFucNIJbdA7AUQRL1akalsF2VWEsfpU92ce5iIovtDSWExzcu9KgvFVS94jfEz04Dvdq76FAkpX43vo4U/xVrWog+tLm+OZGcZD6xtCJbmSqtswdTStB3wFoIsKuSGu1LeRHfD2jces/BQ/Z9dYYF5RYNSIw51K2o2zGSchYrMmt7iFlxi9WduK37eFnBT6Bh2ICStVwXCra9Q899W3lFA9p0EFOWRAd7862KnDCxUgRKHHT+vHQ8Ji/NcLxlyja8kafV95C8TWsbenybKE9hfnEZyNq8a6640DPHrzmMVM1LROsYXLWbqSzSM
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR21MB13889A7DE46B9DEF6D97959BC8580DM6PR21MB1388namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7846be-a86c-40ac-429f-08d77cee6b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 21:26:14.2425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nzf49GgCFhiCEJ1EmiPTkh0JALaHybtxr4rO+gL9udFEwWjf387AEW6ey5CkfrqRQRno1TJNoe8fG2ZkyBHODw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1386
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

--_000_DM6PR21MB13889A7DE46B9DEF6D97959BC8580DM6PR21MB1388namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are there any standards in managing heterogeneous systems? For example in a=
 rack if there is a compute node( with its own BMC) and storage node( with =
its own BMC) connected using a PCIe switch.  How these two BMC represented =
as one system ?  are there any standards for BMC - BMC communication?


Neeraj


--_000_DM6PR21MB13889A7DE46B9DEF6D97959BC8580DM6PR21MB1388namp_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Are there any standards in managing heterogeneous sy=
stems? For example in a rack if there is a compute node( with its own BMC) =
and storage node( with its own BMC) connected using a PCIe switch.&nbsp; Ho=
w these two BMC represented as one system
 ? &nbsp;are there any standards for BMC &#8211; BMC communication? <o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Neeraj<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR21MB13889A7DE46B9DEF6D97959BC8580DM6PR21MB1388namp_--
