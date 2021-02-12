Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFC31B34B
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3HH1TZDz3cJq
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:24:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=gcwLt6vn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.132.93;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=gcwLt6vn; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320093.outbound.protection.outlook.com [40.107.132.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcJ0t3jZDzDwvZ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 13:51:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4YsqDcwhaLU+Xwj7aptdFz2/cXCZTt7YxjHPLAEmxicX8KqrYX4yp2C2ZKW2pR3h6CKxYTjgQkwIIrwOvUxXmvhUfchJXFs5Jda6iIyoQGQEG/HP3DQAaLJI+0cuC+EMSK0vtM99NbXA+tvO8+DObMKCByGdKC5cqe9kBYB/enQMcHYfkz9PqP30G4+lXHc6SNonQ//JGquclsF3MemJjYxpWL1vvh9mvhChyrq/nl+q+J+yU8mYqyn/medpIYBEoSyc7tp6RSCzYa5w/AGlaHyE0vv0c1uVgoPvqbrhVK9bK/piuH+chBWmO0xk6YXC3aB0qHsjFqYss50NXS6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpib4Sjjf6vFnkaoNrmP3jIZzweXjCWdmASmitKX7zE=;
 b=NVkvxcU+WrJBz7qWRsLIaBVTqBEzmA4ydShUWp0neNE4JNajHDUF9jWjrZcE8cqkk0gVKOLguJoqeJE9gxNJO7uwowDfTFiTOcAiRx+B8Jw60hAj4css2JhoIHMsxgJuY4pnCeDSp8Zpjh+XIrt2AqVoVJ5TL2e99q1c4L4y4H2xVC2XAQgUHJAle1AobPnmgXQ3N/tkEuQoeUlb1WwqvQg2yVMVpuuGRqCjdAwZBA53UBh3chbGCTvP5TGv+LnlH02Wq8WmbXm2cFDAdXzeNMWnUmuAj1x2MJoeYP4csBFux7F5u/kXu7J84gUte+p83Q+tml2EPOA0BS6cHsGmlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpib4Sjjf6vFnkaoNrmP3jIZzweXjCWdmASmitKX7zE=;
 b=gcwLt6vn57jpR4Syo9m0qsDD8dKuyQZG12dc2aX5NVDBxJ9WfSCACZkWpbo3M9UFHBDVm1+vE4EwNT+RUHSSRStQvk37fQhrFGidLlMuzs3HogSrBnYN8PDzWIKSAKD5tEkjmlgPjEedil3cCEV1LmTk0O5i3ZMSIOETQ7Gnuw4=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB4315.apcprd02.prod.outlook.com (2603:1096:0:1::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.29; Fri, 12 Feb 2021 02:51:10 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc%7]) with mapi id 15.20.3825.030; Fri, 12 Feb 2021
 02:51:09 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish v1/Systems/system/EthernetInterfaces
Thread-Topic: Redfish v1/Systems/system/EthernetInterfaces
Thread-Index: AdcA6cGzNFkuOxBET+q6tGgjuo9o4A==
Date: Fri, 12 Feb 2021 02:51:09 +0000
Message-ID: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [24.6.83.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5f630a9-0658-4f1f-4b59-08d8cf010d3b
x-ms-traffictypediagnostic: SG2PR02MB4315:
x-microsoft-antispam-prvs: <SG2PR02MB4315BC2F69B3FF1AACFE3234858B9@SG2PR02MB4315.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C0dZ+F0FqtU4cqPWgKcVTUKGrpqlXaf9FEFUXJtHcZuWGsFkXdds63KLsgqqIrQrgYbjlAmO9vWjmD5Nu6AiVq8x20P/lD4MsIn2A2YyD4KaEek92L+PASpzwsHaGiO2Ha0XimqiM7mvBUiAvt8/S/IQn+HVw7Sa0merKBG6PfjeMXDr9f1rvluq1NCVz2FBnChfa0cCSwvQdLZ2/SQbC3Z9/rZp9MlP8AizjLDEH2q7VLUr0UU+hFCsEyALR+hyApEzp0v7xoo1vA6sfCcAjArNkMYp/Zfm+aNOOL8i7KIy1JBDK9cqAMYbSDRVHDQE+6J0ZoKN0qt9etRGsX5t4mAKOdRUHmYHlurMx2r9l4VV9qapTLjwRSxQA+Bi1rNmsO/yM/9eix1GZr21xaUg3tyEe0dEM2iueaCNS79mjPTo+/SDL+3LpHF2OHPQvAWm3RKz4Dg2YTgkzK+5VTyrOqnBVgVcA8LIoiGjypH4HdZ/tDMv33m8Y4mFUJ8v9n0qfDeKVSnpKooL98DqGi98Mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39850400004)(2906002)(316002)(71200400001)(66476007)(66556008)(66446008)(5660300002)(64756008)(76116006)(4744005)(6916009)(66946007)(9686003)(55016002)(478600001)(26005)(186003)(33656002)(86362001)(7696005)(52536014)(9326002)(8676002)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yOlDQMF+INgbmtVds4JY98+HTJFVBGCfTAbMQUE09N5pFwMeYAsCLLtAHmFW?=
 =?us-ascii?Q?TypteqwCKPQT3V1IpD9Tr0Mkw7XoU/vLM2y0TSnaMG+1vZI5q8iUYREn+8EY?=
 =?us-ascii?Q?PsT6ZJAwrUj7Yal9ugtS+/3f3+jUOGlZcEZXdc4Q0I7ae/nVDOu29ihzPrQx?=
 =?us-ascii?Q?t1n/p1eIPJe1j+6IqQBJMKwYi7NSnOxDmpD93HuOKN/pRMQsIlbablxipSso?=
 =?us-ascii?Q?KFG/ZZikZbjxPXqqAs0x9LoKCCRfV9nu5Gmy9wVxIVTLbzRsquVgZrqjei1+?=
 =?us-ascii?Q?BHMTJzGnZV+4IuIbOLwz6f5h7ZndO0YQwAQQ5O5S4xZhkMw2Mjjlpqd0SgDT?=
 =?us-ascii?Q?1wi7tICLY0p0r7EtSC0FkVXJw20e3NyNAgHv52uwGRXxxryKawVfEjDAmVmY?=
 =?us-ascii?Q?8DAYe2osIFKvU96d8Iq2n5/Kjt9ZS0SFAGEIbeEnSzUjIAJVjBUxWNIybPeR?=
 =?us-ascii?Q?R3mYP6jpre6HW8qRNRF+U3vOX+I+u4s3jTuxCViJMRWXfgsIhaSXDfHoIGSi?=
 =?us-ascii?Q?LDNCQGDy9nvAACBZ7k0PaJnUbP43zOdjqer0/4jXwl1Jgt7pwkFW95cW3aL5?=
 =?us-ascii?Q?pTJFgUpCTcWS+jFi0pRqLPVqq+039dL/VR+iMN1KuUySrWLoJKRu+SRE54we?=
 =?us-ascii?Q?MpEHrfqeguyR6EGW3dOUrCr+RC/YcIYt75k6SXp0bf71Cz1spHjYtInlU0j4?=
 =?us-ascii?Q?FZxbmMxhrnMeP45h7tc+4X46TnExi6jbJdY1QrqCyvgD3ikaidWKoGxE60d1?=
 =?us-ascii?Q?zUR7ccYNI2KupFTwaZAoAdveMFHmsyFGAK9LvGumZu9xNsC4Li/G/H7qmamy?=
 =?us-ascii?Q?8EFf02ujlMpjCSA+sTu3zZnunutV+71P0FKzpyPHuOwgtoLO3a28x4n2p6og?=
 =?us-ascii?Q?P6F04IoHqqRGWtzjbiQCWfZnt7UMRLCbfi8Ve5W/vVG0FPoOiw/bn3+p4IuV?=
 =?us-ascii?Q?hC8MTCBepPp1REOh0ZBbl3WeG7lhQfSC3dLcvQKKuDk19jVCRnIVMrhditus?=
 =?us-ascii?Q?zOrxqNxO1ehc0nFZF/P2zMYyLk6qT2c0TnIP9fkt+G0HyKZZPbuwVX22s7BU?=
 =?us-ascii?Q?niwmBMwEWp8cPuk56vOEzpFvOfKwMNrhvACEpO2bas/oaGOzvl5AId6QGGCN?=
 =?us-ascii?Q?Eq/UD/UeWWy92ws5k4Es6cKKYHkbveZLz1kr4jTjEWMkDT5PtBcieT3Xpbat?=
 =?us-ascii?Q?7j7ITLsM0LL7of+24Us/bIOasm3dV84PjoixsSJMfQUCGH9LvTcSWijnsFX3?=
 =?us-ascii?Q?fIPkiDjAzNtF4rxzToQ+rM+IjLYHIbHUTEN6nOyrwSP5XWRgpxDryH3ZHpnK?=
 =?us-ascii?Q?Y3w=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9SG2PR02MB2796apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f630a9-0658-4f1f-4b59-08d8cf010d3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 02:51:09.3743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PkfM5MGtw1PyzzROSkHZcsVqMZMOYQhszyxTPZCs8HOFhyblOm1My8LjLuoxiE8dhGGyA/TIBNRNSWx7qJS41+Dy4cRjWejgPHPkmfzjfr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB4315
X-Mailman-Approved-At: Mon, 15 Feb 2021 10:22:39 +1100
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

--_000_SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9SG2PR02MB2796apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am new to OpenBmc and Redfish.
I saw in bmcweb/Redfish.md, that below Redfish is targeted for OpenBmc:
/redfish/v1/Systems/system/EthernetInterfaces

But, in redfish-core/lib/systems.hpp, I don't see EthernetInterfaces and I =
don't see it on my server Redfish too.
Its only present in Managers/bmc/EthernetInterfaces.

How do I add Systems/system/EthernetInterfaces Redfish support? What change=
s do I need to make?

Regards,
Ashwini


--_000_SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9SG2PR02MB2796apcp_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
h2
	{mso-style-priority:9;
	mso-style-link:"Heading 2 Char";
	margin-top:2.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:0in;
	page-break-after:avoid;
	font-size:13.0pt;
	font-family:"Calibri Light",sans-serif;
	color:#2F5496;
	font-weight:normal;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.Heading2Char
	{mso-style-name:"Heading 2 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 2";
	font-family:"Calibri Light",sans-serif;
	color:#2F5496;}
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
<p class=3D"MsoNormal">I am new to OpenBmc and Redfish.<o:p></o:p></p>
<h2 style=3D"background:white"><span style=3D"font-size:11.0pt;font-family:=
&quot;Calibri&quot;,sans-serif;color:black">I saw in bmcweb/Redfish.md, tha=
t below Redfish is targeted for OpenBmc:
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:windowtext"><o:p></o:p></span></h2>
<h2 style=3D"background:white"><span style=3D"font-size:11.0pt;font-family:=
&quot;Calibri&quot;,sans-serif;color:black">/redfish/v1/Systems/system/Ethe=
rnetInterfaces</span><span style=3D"font-size:11.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:windowtext"><o:p></o:p></span></h2>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But, in redfish-core/lib/systems.hpp, I don&#8217;t =
see EthernetInterfaces and I don&#8217;t see it on my server Redfish too.<o=
:p></o:p></p>
<p class=3D"MsoNormal">Its only present in Managers/bmc/EthernetInterfaces.=
 <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How do I add Systems/system/EthernetInterfaces Redfi=
sh support? What changes do I need to make?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ashwini<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9SG2PR02MB2796apcp_--
