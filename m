Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38250269240
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 18:57:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqswH0tpdzDqQF
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 02:57:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.122; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=lNrGkigx; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=lNrGkigx; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320122.outbound.protection.outlook.com [40.107.132.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bqsty0GlXzDqML
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 02:55:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5YmMGMjiVNqlBLzf9c+Gv/yfczy1PkMfKERmsRu3Xw=;
 b=lNrGkigxHfkNcyKafuUee/m8/rc9DP+RrfvTF5iJmrTnh/jddeGFUrk+lFS4BgnWTbfi1wRIb63NiJ8MlestolSPIEO9DePnzIXtAN056KygsAdex97TdRLL4kRSomUtbgF4SwdB43F/D7JgQ0J3JwTKDzfCEvU0F6HoLPsDK30=
Received: from SG2PR03CA0127.apcprd03.prod.outlook.com (2603:1096:4:91::31) by
 PU1PR04MB2520.apcprd04.prod.outlook.com (2603:1096:803:2f::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Mon, 14 Sep 2020 16:55:44 +0000
Received: from SG2APC01FT058.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:91:cafe::bc) by SG2PR03CA0127.outlook.office365.com
 (2603:1096:4:91::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5 via Frontend
 Transport; Mon, 14 Sep 2020 16:55:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT058.mail.protection.outlook.com (10.152.251.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Mon, 14 Sep 2020 16:55:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+/qFUts6mQofOvHkYLhrgHhM5gJpKRFMK2VphViRCAVsDztkuElZMusztBizon1VUhTbWKS5N0mjCPKTazk8rkBab503Tg07bz26PVtKedXHbbP8HI9pyJMf6zfukYoDUDqDB7x5SZeX3xKBX1C12IovEYGGljh/VhK+/TnwYstiLfPMnpSeW3ycRZ80iPDjktOeebLoASJxuF9OtPrTDAvaJeNKYEOAWsHwsI7AKuSV4b4tgwYdoA9l9PQftCMsIpwJV2veUYeqmvApl1uWfjjhWrox56lGPnu0quuZ1PfN/CxyWqyL0P9eel0OvP5/OicfIU+Hi0pAi6NXFZMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5YmMGMjiVNqlBLzf9c+Gv/yfczy1PkMfKERmsRu3Xw=;
 b=k5rMpwGm0hK5LuF23cZV4XKqbCOjxKnjOlLbu4n6GRnntTST9H0uNikQxs9I12fSOp8v3m9zImkwF0diaKLndAQWQ7cUEyYJC4m/uptlYPEFMzQHcYXUEMpF6rOe+EFaXmg+R3e17TE3pSFLyirORKZPLw+rmCr99NiXxdokKSRw1SwDOBkLj3GR3+jxAnUo2fuEhiDPGqqkhEtBVf62G396ZjCGK1fhdMUlSjbfaenHtv1TAjDH1G10RO+5fcW13OKVy00kWzdpHbErdoIbv6vS2/6skVAlu4LTD27iXUe0hpVd2LP2ppFQ78OkLqmPfOHVwVXiAB6YwZlLZ6zl0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5YmMGMjiVNqlBLzf9c+Gv/yfczy1PkMfKERmsRu3Xw=;
 b=lNrGkigxHfkNcyKafuUee/m8/rc9DP+RrfvTF5iJmrTnh/jddeGFUrk+lFS4BgnWTbfi1wRIb63NiJ8MlestolSPIEO9DePnzIXtAN056KygsAdex97TdRLL4kRSomUtbgF4SwdB43F/D7JgQ0J3JwTKDzfCEvU0F6HoLPsDK30=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB2690.apcprd04.prod.outlook.com (2603:1096:203:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 16:55:39 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0%3]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 16:55:39 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Read FRU of host through ipmi in Entity manager. 
Thread-Topic: Read FRU of host through ipmi in Entity manager. 
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQ==
Date: Mon, 14 Sep 2020 16:55:39 +0000
Message-ID: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNDc2ZGVhZWItMDVhNy00ZGNkLWE4MTAtZjQzMGZhYmM1ZTYyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoicHYrMGI4S0RaY294bXBpdEZjTmFcL3I0U2h5K0c2TGNacnlsU00yTFJtTk13eXpXNnRMZzZ4eDhnbmxRYjc4Z08ifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.249.116]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 20c22801-1a88-423f-c6c6-08d858cf04c3
x-ms-traffictypediagnostic: HK0PR04MB2690:|PU1PR04MB2520:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PU1PR04MB2520E3686D66F51081D1E200FD230@PU1PR04MB2520.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4mOIuSWyYEclqJy3U/XjJXouaBW9grK5VO88X1cQzv5NdMm0xHbN5Rm8G7wFIg1VYHzoBpeX6Q63H63hdjnch2BSwdp9lPNqITs8d+zvYaxZW+p9LV5F70Pg0Qj7hwGfO37+1m67i1mcjN6EejwxOhoL1J2Vt9bzOzk9xU2yV9ZZjQHtDeCM4IATqwNiQ86ZffgouL/GjneU5v+7HEy03lQ0UQzWwR2GnUNkO3pYDcgV5zBfcewGY3nXFglbZ9cl9Cp/6XCGncHyFasMgVXBA2qMe2VJptXqscCzTirGnVLM0EL2XzqEmsXsdqLlzbQY
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(83380400001)(6916009)(9686003)(4326008)(66476007)(55236004)(66946007)(52536014)(8676002)(8936002)(54906003)(55016002)(76116006)(66446008)(7696005)(66556008)(64756008)(6506007)(4743002)(33656002)(5660300002)(2906002)(86362001)(508600001)(26005)(186003)(71200400001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SJ5eZBJfwRCq6xEv55WoGWBTWz1Rh+KfUD6Y/MyAcDPplV+qdZTasyh5l7KTgPiY0g0FfggQ75f97OubxlLtqnt1w/FUm3CgT1Rco+v5IsqPuvwbtb2dEBx/+cGw+kDo+PtRbZ67xI+FGDtQkHhp8vi0mDz9FqGmmQxymo7CKNTUK4w2fShxJSI3wAYyknPDLHGKmAPx7tDGt/Adcaz8ImZQht639Va2QtCl/WcmbtmvfvUEldDuLgiUp/DxxWppp/93++A/fKUen/GaTkb49iP/+aPLmYFPbPYBwJjNLpfq2BxYwlTj416GvYP3/WhnLenYxsk4Hi3woWIPVjEM3yp0uLMNIhSLEjEwjjptwTUdO1gJTaFlFDptyyyma2yZFtZaoCaIg87t24KWD97ZaMdIEjWc0iZ1ToXnTbob84NlhOMds+7B4z6mWh1eiltMEXY+6txJB4wjt6nSnM/mxHQAb/qwzUbVlxN1vOFbx8id55a95MUTvwqDmcCLYiHXP2DKF+6HnYDnTh8SCZAeMqFVOKzw57FVYaqSmD//u2vWI9O9hHGnxHazcS13yeWthkf8z/O5Xi3CPLemkRcDfGhUtxwhAkYP3g9xIrw8AVhnkiuoq5dHJw6k29AfJIbASUceymSsmM5MgLDIWIa2vw==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964FFC6D5EF008F106FFC13FD230HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2690
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8325bb50-24d6-43ad-0c92-08d858cf023e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c45KgC6BVaa4gmOud9vsW3jGVI6tvWJiGh0zzfwmq/QW4r+L2dbPkuYnQMQXkT4EwizxF7KYRPpueLN9ZxsyV9DrbpWKynhcQ+M1U7LXRwY3V9PWdDC7V4ChHbB458lGGxwTqepgouYVTuAz1CEQUxbwJqh5S236er91CQFHxF8Vo993E2LIbp3GMd1rfmS9PntAmR99ga2Vrm8vrmxQ3gUzWk6Q2cyFkt9FPWruQ43HNtFMbnf19nt6ofC7mmm8nQXbf/FQf0DDW3OE2OSxnyDG353uUOK0JWyxc9VZBfbbw6CgW8nInuzhaDgp/vkOPo5Oe9m5dJN1nMozB92fmOCPDArzlSlouVfSbxJZDYy6eX5F+UMVj6a9wfilHDuU2Si9aJha1XvOT9oalcrWtCdGr5CqfJlj1nls0E13nXm2JsOl6R6KihwmlnPNCkFP
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(8936002)(8676002)(4326008)(82310400003)(26005)(186003)(81166007)(356005)(6916009)(55016002)(9686003)(54906003)(83380400001)(82740400003)(47076004)(2906002)(33656002)(7696005)(4743002)(5660300002)(336012)(86362001)(316002)(52536014)(70586007)(55236004)(6506007)(70206006)(36906005)(508600001)(34070700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 16:55:42.6922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c22801-1a88-423f-c6c6-08d858cf04c3
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR04MB2520
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964FFC6D5EF008F106FFC13FD230HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: HCL Internal
Hi All,

         We are working on the Platform which has multi host and the host a=
re FRUs.  The host and BMC communication is based on IPMB. We have each hos=
t is connected in separate ipmb bus.
         Existing Entity manager has the FRU read info from EEPROM (I2C)in =
the form of bin file.
         We understand that entity manager does not support ipmb based host=
 fru.

         So, we are proposing the design to support ipmb based FRU in entit=
y manager.
         From Entity manager, we will send the generic "read host fru" comm=
and request to ipmbbrige to read the host FRU.
         Then, store the host fru info in the bin file to process and creat=
ing dbus objects in the entity manager.

         Please let us know your comments on this.

Thanks,
Kumar.



::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_HK0PR04MB2964FFC6D5EF008F106FFC13FD230HK0PR04MB2964apcp_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">HCL Internal</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; W=
e are working on the Platform which has multi host and the host are FRUs. &=
nbsp;The host and BMC communication is based on IPMB. We have each host is&=
nbsp;connected in separate
 ipmb bus.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E=
xisting Entity manager has the FRU read info from EEPROM (I2C)in the form o=
f bin file.<br>
&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; We understand that entity manager do=
es not support ipmb&nbsp;based host fru.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S=
o, we are proposing the design to support ipmb&nbsp;based FRU in entity man=
ager.<br>
&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From Entity manager, we will se=
nd the generic &quot;read host fru&quot; command request to ipmbbrige to re=
ad the host FRU.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T=
hen, store the host fru info in the bin file to process and creating dbus o=
bjects in the entity manager.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P=
lease let us know your comments on this.&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Kumar.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_HK0PR04MB2964FFC6D5EF008F106FFC13FD230HK0PR04MB2964apcp_--
