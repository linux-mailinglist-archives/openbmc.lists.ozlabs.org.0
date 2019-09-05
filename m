Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09870A977B
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 02:06:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P1FG1Lk9zDqsh
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 10:06:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.82.120; helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Iesu+5SE"; dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820120.outbound.protection.outlook.com [40.107.82.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P1DR35QxzDqS4
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 10:05:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni78UU23U5ZwomZFHTbcOt2RSP37j1SZ7wIaflohqwHahughktcJJj+fEN5qGHdraqqw+u0ojGJTGkr+pJE30eTNxTLbjPnZ2QseUoO0QLk+/UhEYYyASWxjtbnm1C0aMFM640pDemr5wh7Oa5a8zkVtXYRvk9kadK0P63yHqOwrivW3/OQsk00rPe7yESJ3jS6D7FlQ4VXeZmGIPSE4cguXzIIES2A+xrTrgBrxfm8nwA/IodYMnkE3WHMcn//34DjJ2gW+w/DfISMjBQbykq7IGVyyHoRrs2Kke8S6yO+OFVUYbbs8KbJP+hN70ocwm97DSl4fOe6M49tWZuA5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJMtVsDupZinBIYK8p7REHpWfNh5jIddkBPylEcOhCE=;
 b=j2pTxhJMEsvr9UyRg6LJir7V64GXKRzM7toSj1jaKoqiBov3UxZ8bwrVITm8Tpeq9bQwQqB3euntWos3+nj3W9reeBriDPMCfDJ2y8IhlhHLWRV0aIKbLQ21ZFMg89hlkxJFNm150Sl+jwhXdqdJ1xFukKMDgkbWJpoOIhu0q+yyHfFu0HC6Hy/mXY3Uf5KVja/JpHUurhzjtTTn1RSKDcLCNhPg0NFB7YVGLyo8tTOBqWpQfE7L0UPd4dFAdLVwzHaGgZ/YojWZKUw6M/n0oACxFnGb+hRLywtTESBzGDbxGdirQw4WdTxdgX+S8KHHavvQW2HqGdKARNIJmAKJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJMtVsDupZinBIYK8p7REHpWfNh5jIddkBPylEcOhCE=;
 b=Iesu+5SEG7x9lbsQcTxnWdKWcw1aTY+4RrUJYkFsgP86Wa2e5jg6R5VHN7lNqCZxFJSk5O2aY1Se/SA6YgND3yeXOb46lcIFYJI22bA14+VFqIZ9D69UpRqyu8AqAsvbveXc+niwfluIlqPtpuDEDjf8e4pzTYmqPMQhdFX2ao4=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1336.namprd21.prod.outlook.com (20.179.60.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.3; Thu, 5 Sep 2019 00:05:36 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b%9]) with mapi id 15.20.2241.012; Thu, 5 Sep 2019
 00:05:36 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Validation and CI
Thread-Topic: OpenBMC Validation and CI
Thread-Index: AdVjfTMel0Q/vAyBT3yCuLhGhdrMIw==
Date: Thu, 5 Sep 2019 00:05:36 +0000
Message-ID: <BYAPR21MB119113213476143717F0DAFBC8BB0@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-05T00:05:35.2956493Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=63c7e660-5d0a-4445-939e-ac11a566df6e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2a00:79e1:abc:123:843c:33fa:d5b6:630e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc58f831-86ba-4d6f-db56-08d73194c782
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1336; 
x-ms-traffictypediagnostic: BYAPR21MB1336:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR21MB133637185F154155518864C9C8BB0@BYAPR21MB1336.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(189003)(199004)(6506007)(2501003)(1240700005)(74316002)(7736002)(8936002)(99286004)(81156014)(81166006)(8676002)(46003)(5660300002)(4326008)(2351001)(52536014)(3480700005)(33656002)(10090500001)(476003)(316002)(6916009)(7696005)(66446008)(10290500003)(22452003)(71190400001)(71200400001)(66476007)(64756008)(14454004)(76116006)(9686003)(486006)(6436002)(66946007)(25786009)(66556008)(186003)(790700001)(86362001)(6116002)(478600001)(55016002)(8990500004)(54896002)(5640700003)(2906002)(53936002)(6306002)(1730700003)(256004)(558084003)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1336;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 80qgJnxsA3WbVdyEQg8LgiaW0hK1sJ3GJFcXqdq/UqiqYC2fqBiE7b5wtjhiKMu8/HreOgdG/OqWtIN2ONzbW4yG0RmrSQMq0bpM3pZ1sPJwS9u/Y2E9LbLefDH8BvX4R0CMtXW9G2bOt7aehGQLEqZftwOcjWTjNhIunH3RVrhJabry8pMm19xdcrIKHdEg4YYDjXPvC33U7SVC0taa0QcxblLt/rh/J2gDazqvjs+deidOpQ8dp55MTvp1WRKfksgds+Ec/xFyudkF/00DUJgPKN5oD5qUPY2521ryJiARZFne1og6rBoYx5rL16dcpaDg58oCyK9hXHyU+iFQAIbwqC81HbRm7ZsiRIKE+eV6pzxWxquUQ9AMBRG7szdXOXiXkPahNUIzSNBelmDq9xbj5x+SJ+qa0tGxsfbk/fc=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB119113213476143717F0DAFBC8BB0BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc58f831-86ba-4d6f-db56-08d73194c782
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 00:05:36.6947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+FrtcBOfrwvGnDyiomQkpKVs3iOcrVwBU0FYwfLz2dcD3gnm9ioGTEywqVVAXUIA62uVn9kLhZhtVAQMoe+iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1336
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

--_000_BYAPR21MB119113213476143717F0DAFBC8BB0BYAPR21MB1191namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What is currently used openBMC validation framework and CI?  Can we use our=
 infra to trigger CI ?



--_000_BYAPR21MB119113213476143717F0DAFBC8BB0BYAPR21MB1191namp_
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">What is currently used openBMC validation framework =
and CI? &nbsp;Can we use our infra to trigger CI ?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR21MB119113213476143717F0DAFBC8BB0BYAPR21MB1191namp_--
