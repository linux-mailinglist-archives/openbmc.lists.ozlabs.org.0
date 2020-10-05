Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8522834FB
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 13:30:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4dgV6PtdzDqGC
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 22:30:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.120; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Ljh/WUE8; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Ljh/WUE8; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310120.outbound.protection.outlook.com [40.107.131.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4dd85bv6zDqDQ
 for <openbmc@lists.ozlabs.org>; Mon,  5 Oct 2020 22:28:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqHYwe7CxEfYXg99hvQJKM3aQ0axvgh08ydXi7Yx5ic=;
 b=Ljh/WUE8zV/6k8pVqcW9W8aL4U7S8MEk6g5BLjy7r2NDIoAbuxs0AxiY4zpdlVHHGBmz4Cw1uK9t9OwFagUY2fHtTaBGIA+GeY67laHJt/BecYeuSS4IXIaxAeNLXbOMqMe/KPDiuuwSWruw8EAy5FNqFcOkvugjdLSD5TXaa/E=
Received: from SG2PR03CA0156.apcprd03.prod.outlook.com (2603:1096:4:c9::11) by
 SG2PR04MB3627.apcprd04.prod.outlook.com (2603:1096:4:95::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.35; Mon, 5 Oct 2020 11:28:03 +0000
Received: from HK2APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c9:cafe::45) by SG2PR03CA0156.outlook.office365.com
 (2603:1096:4:c9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13 via Frontend
 Transport; Mon, 5 Oct 2020 11:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 HK2APC01FT055.mail.protection.outlook.com (10.152.249.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 11:28:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqkAbIfV10HjhS4zXYv9yYHUbzIMAc811Uls1GDeCdpynSO7YS632iyRphoH07+tRjvC7sArR6btW80QJZwJbNHuUZh/BAm/dW0hjG1Hb3h6o1WUKk+7l27Qvm0B1R3mXgCII6JoRRaiU3MhuqS91phwYU3yfrXUqantvXgtJMWkqHmIXF+uME5OZ6XZsgSxqpxPuj4hAWb2wtpKACGJvdOYFrYrV4deHYwgNI+nJYeu2oPKeBIs/eiOccXzGTmFV5aWP5WOA+EE5uiu3P593T1PGg3Acge9BbmhScEfcW5FO0xgYmLaCXdLv8EHEyZcuH2IORWKCCBNzzVfzmgwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqHYwe7CxEfYXg99hvQJKM3aQ0axvgh08ydXi7Yx5ic=;
 b=cyuQi/DQ/xS7k0tj+FvVRxp/miBHrSDAEzePVlnszpjNGsZhv5iZj7Xml7mB2wv2RtIEe+0UqNnqH4PhjRmb87e+v+hdqMZwNi7g59u6YQe8cSSBrai4TadUcN+uLpRsDlgZTETZT9eTrvFVoLrxmO9yeGe1Ptc2CaXKTOwHMv1My2SGfKNgQMuH4XK0TmhZlZ2mVxV26CfwJz1aPx0CWVGoMrebmYB+pQeDfHeAx1xKS8fjChZ0UYeEeM0dkPGmqyWMCUDuqH0fHISQqVzqjp69rRCXVU9YdYtV0WeA/iWuPYaYsvyDdSaxNuH2McjRD3ZC4jcT8nV2XoahiTBdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqHYwe7CxEfYXg99hvQJKM3aQ0axvgh08ydXi7Yx5ic=;
 b=Ljh/WUE8zV/6k8pVqcW9W8aL4U7S8MEk6g5BLjy7r2NDIoAbuxs0AxiY4zpdlVHHGBmz4Cw1uK9t9OwFagUY2fHtTaBGIA+GeY67laHJt/BecYeuSS4IXIaxAeNLXbOMqMe/KPDiuuwSWruw8EAy5FNqFcOkvugjdLSD5TXaa/E=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3897.apcprd04.prod.outlook.com (2603:1096:4:9f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.38; Mon, 5 Oct 2020 11:27:58 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3433.040; Mon, 5 Oct 2020
 11:27:58 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Firmware version under IPMB sensors
Thread-Topic: Firmware version under IPMB sensors
Thread-Index: Adaa20OW/+EXJZ2dS0eTjnxobOGmeQALotzg
Date: Mon, 5 Oct 2020 11:27:57 +0000
Message-ID: <SG2PR04MB3093FD443D836974228F6823E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZDVkMjhhNDYtZjQ2Yi00MTJlLTljYTktN2U3NGQ5OTc2NWMyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoibjNyYlhVNlNhVm5Ma1hXaXRldXdJNFRTTm16c29TSnZ4WXV5RXhESjBEWnFDTVhVZHdVRGplOGc0WWhTMkQ1USJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:381:c1a3:f972:360d:9d73:c99]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5b0085ee-e591-4b58-4eb3-08d86921b8ba
x-ms-traffictypediagnostic: SG2PR04MB3897:|SG2PR04MB3627:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB36273377E383214226565D17E10C0@SG2PR04MB3627.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UFAq1MaDtVfm4zmi6Y7OGE18NZjZFarUTFQdaozxjWUFYcAfnJPjX/sMih4qWLuIg9vOALLAhVKPRQAm6cIkuE8MFi2KLgvO9WRSWVhZ7Sp02OM7+6R0NJBQhZS8BzAqZbEGkCJqCqhGvGsxnYEsT8Yka5jK+Q0kqQKdazkB11gy/ZB4gAe7v3bm6AF+4aCaFKYHcoTMUFjlRakO/vRNXBqvWSVjUkuPxnEnwg1WWAE2Czine5IO462Qd8N3ve76K+At1Bnrsey4G1H5MAgmU1aMGNwnY4YcFU6lPupD9M/MxFzIhgbrspFCMvm5f5dDnSugbjNRpF8k6WRbBCFnQQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(6506007)(53546011)(86362001)(66446008)(64756008)(66556008)(66946007)(66476007)(4326008)(186003)(54906003)(478600001)(316002)(83730400001)(7696005)(6916009)(52536014)(33656002)(83380400001)(8936002)(76116006)(5660300002)(55016002)(2906002)(9686003)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tMKz3LsI6aDoHyTuSo1s0q3vcR3VJiI0Ccc2xc2ycSl23wv1L6bZ0A2fYLAnZiLdAFyLVrwKZS34UPfXjlmI64Zp4xqEKqM+iVEk+aleM2vw8cfrTIG5J2cqqRNXIfsrO0wrW9kEDph3a8569W5CHsAtKbwZJyw8Qo/RjPpQK05G4khuXP9ZJEF0pzv4xGtk5VPh/0AJKWPHHpxc2A8yTPzLMBfyFgGs6V70s/n8g2wAA/clwLN5A4nitP6I7sgOKbJPDENRFt9YjmChUpn7ldu+Ie+KdYhYa07SBeJ2tJtcgrEklxnXwd2syDEUPjpHVMPwqCYxxBl1AR260qtxNLLBEQYV2AtG5vOqkU1pMKsaPvxkjWQLdpyUrB8WJ1IZqEpfI627ghn+7GsDraWntMIfuIuQCc8uWjgy98Rxe06cJTy+sUA1cDGtxmNn+cbul0pJUxmeJNwWpZj7Wfot/3H1wWV+9w4TT/ZiHF7AJNI9y7yPL/Q6cFDgfQyZbf2icPsfwIkxMEnLH9kG/Ds2wzxIOdh+N9Uh2HTGH9Io/vs4xJkZmHlRSf0jqLTmOBJfdq2p/pd/USTjm3jDJC/qMdjArX+AGNnuhzrMR8Czvh3vp3nH3egiU3zRi873Ucv/61jjaz/77DlXZFVCW2qiR7c1ldRGJXVeBe1/EDM/rT1laPj/SUjkOZG8n+IlysrDPKCAnKtyKj7uCf5gcG7eSA==
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093FD443D836974228F6823E10C0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3897
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b88cd07e-dca7-4f8b-1acd-08d86921b616
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uygTCbk8XJbCq1s0sirz3GWkTNYj+bscA4bjBYI0qZA6otZsOwy6Ri77mYKkMP6mXMn0muXfSZmTmLln3lglf/zFN6HeSQtdQFqkTYDC9I8ZgY/KsXIcacNjwEJ1yGcrYwz9yLy//5JzGFY2+oB7XwmFvj7cnxz07MMkTDtVwiyM1DTwb74Cms4Wcr/LvsvUQl6sSrSHRICf2wjZq9auhOuTrrROwJK35GBRM5POzXmrwI4fA5cEQt+5pITEp3a54qIydY1f5sBJAmq/ASFudPa5j1SkvXnwss8u7xWx5j0DvpX8z4TSl+0LPzVKluEppMsVPxfzKVnyREEovvpbMyRx2bYqeDPQh2KL8Jf0kBUSh+Ys8hEKTfQHT5THlHqjG1PpDBdB/2bRNAkvDH5ZA3K5BCk8eYMoMR/sPlBeJK3g/X9ZJBVxWPzIxU4SwrH+
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966005)(336012)(33656002)(316002)(356005)(34020700004)(53546011)(86362001)(8676002)(36906005)(2906002)(7696005)(6506007)(81166007)(8936002)(83380400001)(52536014)(9686003)(83730400001)(55016002)(82310400003)(47076004)(54906003)(26005)(5660300002)(4326008)(82740400003)(6916009)(70586007)(186003)(478600001)(70206006);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 11:28:01.7224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0085ee-e591-4b58-4eb3-08d86921b8ba
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3627
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
Cc: "zhikui.ren@intel.com" <zhikui.ren@intel.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "ed@tanous.net" <ed@tanous.net>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB3093FD443D836974228F6823E10C0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: HCL Internal
Hi Team,

In my system, host is connected to IPMB and host related information is ret=
rieved using IPMB bus.
I plan to add firmware versions in the dbus-sensors. Adding this as another=
 entity as like ipmbsensor.
This will help in having all transaction in IPMB sensor.

Please provide your comments on this.

Regards,
Jayashree


From: Jayashree D
Sent: Monday, October 5, 2020 12:11 PM
To: 'openbmc@lists.ozlabs.org' <openbmc@lists.ozlabs.org>
Cc: Velumani T-ERS,HCLTech <velumanit@hcl.com>
Subject: Firmware version under IPMB sensors

Classification: HCL Internal
Hi Team,

In my system, host is connected to IPMB and host related information is ret=
rieved using IPMB bus.
I plan to add firmware versions in the dbus-sensors. Adding this as another=
 entity as like ipmbsensor.
This will help in having all transaction in IPMB sensor.

Please provide your comments on this.

Regards,
Jayashree

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

--_000_SG2PR04MB3093FD443D836974228F6823E10C0SG2PR04MB3093apcp_
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
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">HCL Internal</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In my system, host is connected to IPMB and host rel=
ated information is retrieved using IPMB bus.<br>
I plan to add firmware versions in the dbus-sensors. Adding this as another=
 entity as like ipmbsensor.<br>
This will help in having all transaction in IPMB sensor.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please provide your comments on this.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Jay=
ashree D <br>
<b>Sent:</b> Monday, October 5, 2020 12:11 PM<br>
<b>To:</b> 'openbmc@lists.ozlabs.org' &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Cc:</b> Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;<br>
<b>Subject:</b> Firmware version under IPMB sensors<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">HCL Internal</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In my system, host is connected to IPMB and host rel=
ated information is retrieved using IPMB bus.<br>
I plan to add firmware versions in the dbus-sensors. Adding this as another=
 entity as like ipmbsensor.<br>
This will help in having all transaction in IPMB sensor.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please provide your comments on this.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
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

--_000_SG2PR04MB3093FD443D836974228F6823E10C0SG2PR04MB3093apcp_--
