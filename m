Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919102ADA7E
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 16:36:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVsR66xhSzDqPm
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 02:36:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.112; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org;
 dkim=temperror header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=LxisFDuU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=LxisFDuU; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300112.outbound.protection.outlook.com [40.107.130.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVsPp0tLmzDqLl
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 02:35:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4/Yu0gymXJ8QmhLY7HzTrvJKMVHgNO8PGM41oelKGc=;
 b=LxisFDuUJqjf9yZTOI38h1gLtkin9Jjoln2hbPU6331CwFazelM7fqJQPRc6Znuc/yZr6GHfoZ9b7YygqbFtPV5L9BwYg/vml7mK4iUji8CQmOtXubbuhtf3opPV29QV/qGY8i6koUd+h/CkrX3Y+gt0otn11BoAe21vxhgaTdY=
Received: from HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15)
 by KL1PR0401MB2152.apcprd04.prod.outlook.com (2603:1096:802:b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 15:35:12 +0000
Received: from HK2APC01FT042.eop-APC01.prod.protection.outlook.com
 (2603:1096:203:c8:cafe::9d) by HKAPR03CA0010.outlook.office365.com
 (2603:1096:203:c8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend
 Transport; Tue, 10 Nov 2020 15:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.57) by
 HK2APC01FT042.mail.protection.outlook.com (10.152.249.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.18 via Frontend Transport; Tue, 10 Nov 2020 15:35:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAGSB6XU+dR2KMPX6IvVe4C7g7yoyeB8j14o40oLmsuz0pNCNhC+LrZ1DkXzppQp68oCoewHRviqvyJwaS+BdOtkcCekibzIIByPXL+cPGUL6+ewYiXY8U2pnEZAuogN0GKcFKT2xdfFIxn9/p7kllYXlP64D443mnXGfvYF6A9fejRme1W95bwokIkUMZIr28i/bZ/hxGBI/CnPP5Kn04WIjthBBL9n6GiRnFOYMWxnyz3XL7H4vdPW3GP5nzg8O6r3LA4zOq/yDSHtR16IhU0laK4EoJNoGQNJKuh6pPxmTqz1VmqfCM3s3/b3tLo4HeaXOGpSK7MR7lTv0KUwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4/Yu0gymXJ8QmhLY7HzTrvJKMVHgNO8PGM41oelKGc=;
 b=KLFPatCWUebvl92bJ6ENxtmv0ATJyUrZDF3qLZyxc28yxYWZhxaIKqt2DunQUzom4igzAp91oCgE2dXBM/NScoFYv2+DPcPolVSdLOXsKT+IaS2dokxc2DvxmfUMnXthIKv+LlbxTxw2EpFhPZYAr+oOaSaY224R80juzg63vH+gtVRmqslTULSYBpfw07YwM0yhgJ8CKxgIhcxmYVtlV9U2TB23YZhOu5d3FNrltnXJXKjJRTvSV0r/9fPuTvduAeqWJOz/BoF0VW0R7MiRwkIZMIrwuHqNwnKIinuulBciJJDnTKgYfvSPM9W45gEpkKureL2YX6cqfAS2RMRApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4/Yu0gymXJ8QmhLY7HzTrvJKMVHgNO8PGM41oelKGc=;
 b=LxisFDuUJqjf9yZTOI38h1gLtkin9Jjoln2hbPU6331CwFazelM7fqJQPRc6Znuc/yZr6GHfoZ9b7YygqbFtPV5L9BwYg/vml7mK4iUji8CQmOtXubbuhtf3opPV29QV/qGY8i6koUd+h/CkrX3Y+gt0otn11BoAe21vxhgaTdY=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR04MB3842.apcprd04.prod.outlook.com (2603:1096:202:31::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Tue, 10 Nov
 2020 15:35:06 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 15:35:06 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Queries in dbus-sensors/ExitAirTempSensor  
Thread-Topic: Queries in dbus-sensors/ExitAirTempSensor  
Thread-Index: Ada3a3cSkkyw+oM6Tj2CFnAZHlf1sw==
Date: Tue, 10 Nov 2020 15:35:06 +0000
Message-ID: <HK0PR04MB29642B5FB82CDC01A46E05E5FDE90@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZjdjYzE1NDAtYjkxYy00YzIxLWE3YjQtNzc4ZTcwMDg2ZjEwIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT2lERmgxZ05GRmlaSFhoODdRa1wvNE81ajZqZjU5ODZWQ3BOOGtwaW5FUVJKclhUTVRZRWlPajFyTlFGVDJIM1AifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.209]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4913d4e1-a132-4aff-f692-08d8858e35d0
x-ms-traffictypediagnostic: HK2PR04MB3842:|KL1PR0401MB2152:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB2152AA631E7F6B7F088B1DA2FDE90@KL1PR0401MB2152.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jlavGQR3SPO0hzcEuz+7OShKNniN+SlE4b5UwZAuDVY9i6ZdlEK+vHZxwxG1T3N7V58JJotUGcl/O2oW9+zTeM9diVUG2h2v8o9GDoHCop4yKAt+Aoad0QDAWx+yqXmtBdVCfbUfUYACrYN4YSBmRQWC5/n/6IdUwCu9a0HhkvuGWzwviRBDRQceotXDRlGOr0zgqVrcGQFFosM8CjI6aglQmITtVpcC3uOEqIGHFWYrpfV2Fz5tVqix70kcyehlCIRYpE44jaFgF7gHj9mwAC/eEKrbjpjz9rQY083xmR3Fqvg7A0VsBLFJYmoAuKKB
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(83380400001)(6506007)(8936002)(71200400001)(33656002)(86362001)(316002)(66476007)(76116006)(55236004)(7696005)(66446008)(66946007)(5660300002)(66556008)(64756008)(52536014)(2906002)(186003)(55016002)(4326008)(9686003)(26005)(8676002)(54906003)(478600001)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: RYQVSZlDzJ2UjN7YyaujATeMMcPm8XKCv2VMYqF/kUyOQAF4PKcBjB0Q0Y64MSWx/RlcVVeqrpWraJ1+l/6CYoBb7e6nWaZwzfIrVk/rIXyyGNZbjzvtYhsur6i9uyhqVqV2oFMTjI6MsSypRnLH0o8j28XKL2tyMzqibH6uzpAUGDHng6j7ttD9vJGVJF7Nf5JehjKnek6S2O9t2cZkYrnJI6UycPCqNEMEma6uXtmFOZtu5Vb+TUSHsn7w87elbsakUM53o4ZBjqJeSqvkCdOVe5o/oVJo15E82L2g97FWN2UQQ6vprY0S7l8lF3hwFAKoEMAklZPOpIFsbbBJqcUXKlW44SFyka4YzifTxaGtgw/NgnTHaFkTV2tmBhvVy80YPJ1e/9ZztiMxYWWrGLGUUlqmLVpd06mW+5eURH8om9T1W2jgh8UcA9XcgA4bA6aslyPaYg9YL0++d8U5QErw18N89Up3T0oPYVnABP/CDC9nYD85eCzq0S1aVxr0H0W8hCGFn9CwhoxuouDzrMe6yZ32IuFtcmIXL4mUbVSv2jB8uZG9PpTX+Fa/Wdy28GO6i2YJzG/Ct+GhxNfEiWvthDjyPzSfHBOEKmJC2sTgauw6ZYHVpkpRr1/YgQ9lRnbOpMrRqMoLl/MVz2SCAw==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB29642B5FB82CDC01A46E05E5FDE90HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3842
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT042.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: fab96d50-7ed6-45c8-ecde-08d8858e3352
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1J17gg9mGYidumb9UogWAKu3S+tg/VrZ6fnTPW2mvOt826VMrFQb/EgkxzjPHbe6U5R3XcwqnJpuVSeq7SqoCTo4mxkinbNvmE65GhNCv7hK1Xiq1TTa73fAfCkiStB3+x/VEIRidWK8bqWJpbRGoTTQYkgaGjb996XdmCuU3GudjYyWA4jnYkCHWLP5Dq587Kd222aTO/rr/IxpkimhK/wjbgzeeQXHVpGLT096k9Q/D3g56otUEBQX8tcYNFdOlkDud2hf9oAxOkISwj2fvqg0Fb3CYd3izcZbtO6TWWES3XRWzjt+igqg7NHSpnQvLsv5Vu+LEMDGsGLh2e6gTL/bVezEIprw8b0HNkfI/ltzkVwlNL/0uJrgrkAJvBwv3MLwXpUO83L1B7nwDVUnw==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39850400004)(46966005)(336012)(478600001)(6506007)(55236004)(5660300002)(26005)(70586007)(36906005)(6916009)(54906003)(82310400003)(47076004)(8676002)(70206006)(186003)(316002)(81166007)(86362001)(82740400003)(2906002)(83380400001)(4326008)(52536014)(7696005)(33656002)(9686003)(8936002)(356005)(55016002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 15:35:10.0795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4913d4e1-a132-4aff-f692-08d8858e35d0
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT042.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB2152
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
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 Patrick Williams <patrickw3@fb.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB29642B5FB82CDC01A46E05E5FDE90HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi All,

         I am trying to add support Airflow sensor to our system. Started a=
nalyzing on this feature.

         Also tried with adding some sample ExitAirTempSensor and CFMSensor=
 in the entity-manager json configurations.
         Dbus objects was created for ExitAirTempSensor and CFMSensors.

         From the source code analysis, I am not understanding the C1, C2 v=
alues in CFMSensor and AlphaF, AlphaS values in the ExitAirTempSensor.

         Could you please point me some related documents to clarify about =
this.

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

--_000_HK0PR04MB29642B5FB82CDC01A46E05E5FDE90HK0PR04MB2964apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I a=
m trying to add support Airflow sensor to our system. Started analyzing on =
this feature.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Als=
o tried with adding some sample ExitAirTempSensor and CFMSensor in the enti=
ty-manager json configurations.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;Dbus objects was created for ExitAirTempSensor and CFMSensors.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fro=
m the source code analysis, I am not understanding the C1, C2 values in CFM=
Sensor and AlphaF, AlphaS values in the ExitAirTempSensor.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cou=
ld you please point me some related documents to clarify about this.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
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

--_000_HK0PR04MB29642B5FB82CDC01A46E05E5FDE90HK0PR04MB2964apcp_--
