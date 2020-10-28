Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358929CD90
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 03:31:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLXd66YPxzDqMX
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 13:31:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.220.124;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=rahulkapoor@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=Z2JG8pju; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2124.outbound.protection.outlook.com [40.107.220.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLXc41Z7jzDqLr
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 13:30:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S27nBVThe4rWyV+PSnl2CUgT28UYER0KOz0lYcQG1/Njh+ebEFP97DKob1NhDNQnKA7djAW9Hs5yFM+HyhveC9MOCLZ2y1hVcWq+lNcBwd76Qgg8JkZZokKVRDRzNStR69N7simMovKxAtHHOnhhaJ6s/k23sXD2XB9T41H5p13LYvRtFP1Vt7lHNNcowVqOaxyIU4sBHdV/PHMZHFfpeDJ9Y36MACrS5mxIzm7rimpU/6d+HDJKtrkHhVfSw6D5pPcT0YUYDm9l3eRZ4vSt7uJAxu8WZ57ZA5sbgDNOjpnLzWf7SUOxQm5vnOpQWVwk5GHSb0k59JUXfeeR0xVMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXCrbBVxb/LRDieeXFueSiF0yBEtB63Db/swyoixG/U=;
 b=bBCJDHHYKYWrpCSIK78yDqYKoaWTX9kV7rU3nsdK7BPbBmZgEdULUobEdbdkyHlMQX1qdAyYqsvhENanEZx51BurgU3jAE1X5m9V9HRBf6LtTBAofj4+hScwa8Y6Z9nL+LfVhJgyvsNaAuPBT0M6pIQ0Y/0typ7VABf0UXybQKAmFMqaxXl2Wt3SI76PWJhdjdwm93B74969ENepuBRx8QISa57iiysvgXKvutf5yAYE4BGVKTMqs9UJ4yD31/6Rcoahx8fvRYRaiKeB1yoQZRRo98tO8NPg9Q+fA1cQdEVPFa56YLLVMsZZs9zN8TwLYf+7DlqJPXEFYicjdQSVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXCrbBVxb/LRDieeXFueSiF0yBEtB63Db/swyoixG/U=;
 b=Z2JG8pjuQv8a08X6DbaCgSHY2tObmTZkFuiUBs32EtTKAq0bvuM1jtksvW6TC6Tei3w/1JGY4TzHnGUntsj62Qg35WPaSa2hflONPyaSDHRSICY3tHZBGu3bvjr/JaNek8Ez6h3ajifwHSoUmAq0N7SzJ9ip7+GXqYPo8QOe+74=
Received: from BN7PR21MB1681.namprd21.prod.outlook.com (2603:10b6:406:aa::27)
 by BN6PR21MB0276.namprd21.prod.outlook.com (2603:10b6:404:9b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.15; Wed, 28 Oct
 2020 02:30:20 +0000
Received: from BN7PR21MB1681.namprd21.prod.outlook.com
 ([fe80::3033:7727:4aff:6278]) by BN7PR21MB1681.namprd21.prod.outlook.com
 ([fe80::3033:7727:4aff:6278%9]) with mapi id 15.20.3499.022; Wed, 28 Oct 2020
 02:30:20 +0000
From: Rahul Kapoor <rahulkapoor@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Entity Manager ReScan Functionality 
Thread-Topic: Entity Manager ReScan Functionality 
Thread-Index: Adasz33Rg2K7Puz5S/edboSEtgmf+g==
Date: Wed, 28 Oct 2020 02:30:20 +0000
Message-ID: <BN7PR21MB1681B468C469920E5E65F383AB170@BN7PR21MB1681.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=0f8178d8-a264-4858-87c5-8f954a9d222d;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-10-28T02:05:38Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [2601:600:8181:c90:e52a:6715:be61:138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c27efb75-5888-4596-d245-08d87ae96aa3
x-ms-traffictypediagnostic: BN6PR21MB0276:
x-microsoft-antispam-prvs: <BN6PR21MB027626FC3AD1E790B90C1578AB170@BN6PR21MB0276.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6W3QZz4g5Hv77cZ9PrWUB5Uqyp3eRD3Zc0xWHDo88grOhiU/iUWSjCovqRH2oZNU45YfqJ0R9TtztQQydtsAy5OqqgzN99lXbHMKI/Rk/B06Dzpuq3X2gARPcU9BPDuc88PdVNPSp6SjIzYIqjvv/1LQdS4XZremww3TDndjyyqnvk7m77u9vbOWra6qGrgVLb834jxNFBCnXkBwySSb9655PAbDOe54mur9iZ1CNzWQ4Le8Ff5W7f0yVroTNrqoYujVNhedVI+TJhm6mNmWfectuSKOPCd9FeVvf7pfiTlL2Yb/L0HfY9/ho6CtYOroLvMJ1X8zXDILy5ybWQOa0coNgwBU4JdsKixV+eLoTiDse6KTedi0TIU2R/8rcEov
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR21MB1681.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(8676002)(7696005)(8990500004)(6506007)(8936002)(86362001)(3480700007)(4743002)(82960400001)(82950400001)(71200400001)(5660300002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(10290500003)(316002)(2906002)(33656002)(4744005)(83380400001)(478600001)(9326002)(6916009)(186003)(55016002)(52536014)(9686003)(554374003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ls42Nbxnpklg0P0EXp/zb6OMCoEWBuD0kCpHApNXbAKeVqN+QtY5on5/Y5PTd0Sex8P9ZPOk4jTvqxJpgmjhUkFA2xUz1GLnCYUgdLtJwz8d4VhG5ElmHpXulTuth/H1k6q2rc2lXomPQzrIqjMotqmQjVu7/VHJwQANP8asv4l7CJ3EW0CEAzvwuwZTMWXIeYfCiUp/2GBG3e7K01bwXYk/ZveO3Prurvn+uF852EZKwYduQpHkqhUBOGAYai/dplq+nNMvc0wHn3jj2YYsvcfo/5EpsJsKZSc+z0geYGigNqWBW+DR9JHLeWkk+SiiJUnm06eci4gHd+kUJwG0g0KyjJ/7dkvNpJDKzwMGKU7xp9qmzTanw1dYoLAyc0nPXmiFXDsBkihSCuO3PCZaPCRc/b1KFt4I0cwesF+7gmN2lv2lmvhLowGUaQ+k3uFQADsIhL0vkwz1MrHBpq3GvK7UyFaHV+bTIXiTy/wsJ0+bbnDTOFlthzk1KykFS0pMJgjedPWejiX9ISaKhoJjnbV0NqVyYiozTfsiwPiyiDDlMddaXZGxJ68AZyvgYaJV2RRZtkHY9YcALyUhlAvmRMRFRhtcc4gMprycy5TK6BpuAvSJ+VsCx6RbxqMBEvsirMF+kuKrhLY/B1djUBtRfw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BN7PR21MB1681B468C469920E5E65F383AB170BN7PR21MB1681namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR21MB1681.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27efb75-5888-4596-d245-08d87ae96aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 02:30:20.6288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OHbx/D8Ckor4KOCVSxlPEQAca7JHDrQNTgGyOD33srrIHq7TUYVTC/FtTjVzFfUiFnAsWvg3X4nzwVudPcFlScgaFP03h7N82gXjliCdQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR21MB0276
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

--_000_BN7PR21MB1681B468C469920E5E65F383AB170BN7PR21MB1681namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have noticed that in its current state the entity manager ReScan function=
 does not detect changes in the exposed configuration data unless the confi=
guration name property in the JSON is changed. Is my understanding correct?
I am currently working around this by updating the Name property along with=
 each object within the exposed data since Redfish bmcweb interface only re=
ports objects associated with latest configuration. But I am sure there is =
a better way

-Rahul

--_000_BN7PR21MB1681B468C469920E5E65F383AB170BN7PR21MB1681namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
/* List Definitions */
@list l0
	{mso-list-id:92828885;
	mso-list-type:hybrid;
	mso-list-template-ids:-672476224 1521222122 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:103231006;
	mso-list-type:hybrid;
	mso-list-template-ids:-1183409604 495327122 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
<p class=3D"MsoNormal">Hi, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have noticed that in its current state the entity =
manager ReScan function does not detect changes in the exposed configuratio=
n data unless the configuration name property in the JSON is changed. Is my=
 understanding correct?
<o:p></o:p></p>
<p class=3D"MsoNormal">I am currently working around this by updating the N=
ame property along with each object within the exposed data since Redfish b=
mcweb interface only reports objects associated with latest configuration. =
But I am sure there is a better way<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Rahul<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN7PR21MB1681B468C469920E5E65F383AB170BN7PR21MB1681namp_--
