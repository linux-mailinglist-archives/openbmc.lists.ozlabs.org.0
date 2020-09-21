Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A1273134
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:52:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwBqJ614qzDqVq
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 03:52:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.97; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Dc+qeRyQ; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Dc+qeRyQ; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320097.outbound.protection.outlook.com [40.107.132.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwBlf6j6czDqfr
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 03:49:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJLBpY2YWsfawTcKekyWyv1pxtsfgzCNx2dVbWquCqY=;
 b=Dc+qeRyQMT2iIVICf3EfdCKS6IfDAH3abVbsNNcj7A/oryYtcDNCtSn17KiBW0HJLx8KSAImpV0VnXaTUMpeNXVkkvOokPZr+tV/5RmAaPyObdsXWC1ZFge0lsK2/T2dZi7QXqUFoWBbYP5OLpIPS6ndxvXA9oltSNizpmdq7II=
Received: from PS2P216CA0075.KORP216.PROD.OUTLOOK.COM (2603:1096:300:2c::13)
 by TY2PR04MB3549.apcprd04.prod.outlook.com (2603:1096:404:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Mon, 21 Sep
 2020 17:49:19 +0000
Received: from PU1APC01FT059.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:2c:cafe::23) by PS2P216CA0075.outlook.office365.com
 (2603:1096:300:2c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Mon, 21 Sep 2020 17:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.54) by
 PU1APC01FT059.mail.protection.outlook.com (10.152.253.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 17:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKtKr9OG8bUOkJMaN3tFSNhdLNtYXTHumzJiefe9O18vHRoj1TX10UUGEgURtfs3jbn7TZzZSTT0aH24H+nq4c2hX1RcPjKfY3ZRmnGzNCLsq1MyVuY/lGLLwDY0T+CHrn/rwHo4DJzla89N/luDfxyoqevd78AemJSJbPEcOReU9GCfisk8j+vxrWvIikQJpXm/foWyZoXjUuvPS2pX6x3p+rnWDNlH7kFx7LcWQ8ZdP4FIKjIRbs4FGd45F3WRwnp8mUu4/6TpDIC4f2XSgIbZYpFtTWXuTit2/FxgNPDtVPqAENuTGN4oj382pjMrz2cyZXxufE8XpXD4WWyGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJLBpY2YWsfawTcKekyWyv1pxtsfgzCNx2dVbWquCqY=;
 b=WjYdL0C0vWMKiSkqXxz7QDV61cBnNyk63/b90wnyThV6YIwQcUYwiOH1zcu+j1Y4HnFvPrXJChEFZNHibQ9qzbLGK4crP2bU+l5dHPIBfQ/ScEMUu2Q0EDkwpHTVWcTET9VCeUCWRQeuo1mC8S9llkyZG9AzQASETNptdlB1YewHt+XcPFZJnmZ3IskhzxZ93oILe62e+Dwp1jVqzk3qDjU+h0TUklmc0JRo5g+HPt5TCeLYYWfcTjpQ5wMDDdwEj5GhaLM6nhBDhnxsaeIMNt6DDBw6kIOHsFUwAg8gZyG+BQ2FHK487D7Lv0fNl1BfM7ukE8CJtEEPkQAmjUbABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJLBpY2YWsfawTcKekyWyv1pxtsfgzCNx2dVbWquCqY=;
 b=Dc+qeRyQMT2iIVICf3EfdCKS6IfDAH3abVbsNNcj7A/oryYtcDNCtSn17KiBW0HJLx8KSAImpV0VnXaTUMpeNXVkkvOokPZr+tV/5RmAaPyObdsXWC1ZFge0lsK2/T2dZi7QXqUFoWBbYP5OLpIPS6ndxvXA9oltSNizpmdq7II=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB3309.apcprd04.prod.outlook.com (2603:1096:404:96::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Mon, 21 Sep
 2020 17:49:14 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::70ff:f1c8:a5fd:6ef2%6]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 17:49:14 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "anoo@us.ibm.com"
 <anoo@us.ibm.com>, "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>,
 "mine260309@gmail.com" <mine260309@gmail.com>, "ratagupt@linux.vnet.ibm.com"
 <ratagupt@linux.vnet.ibm.com>, "ojayanth@in.ibm.com" <ojayanth@in.ibm.com>
Subject: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Topic: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Thread-Index: AQHWkD7TytR1qVyzD0a6ZilIwzzPvg==
Date: Mon, 21 Sep 2020 17:49:14 +0000
Message-ID: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6011:d5a1:f451:5071:43c3:defb]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c74ea771-6834-4b51-01ee-08d85e56a955
x-ms-traffictypediagnostic: TY2PR04MB3309:|TY2PR04MB3549:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB354982DC33B62F1562E60947CA3A0@TY2PR04MB3549.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: e8vtceCgwGO7YiLOWMM73T8zQtS8vP/zZznk0gYziOmggolyct08mkw/bCMqWw0p8PdRZdrn2XzFIy32I2VTRtPOpcnOF8Txi5YLfM5ETYkhTPSmCoez9g+gBlBUi6vLOWVoSw+Xz2e7aayjmi53Tm4i5mprJtyLF2T7nGXdfLYqJ0TjJ/NFJgP5AF2491t99qv1mjrW509Ei23vLW2hUXU84/+SY74uzZJYWogX5QZFgiLeqktQFe9glZuuyF9aJSnB9NXjG5COYeba8h/aD+E/BCz61lf0YPG1Qz4X1CP80BLLNY58mibOKY26NFE2/frm4cDIlT7VpkPt7qd+Dw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(316002)(8936002)(7696005)(110136005)(9686003)(2906002)(54906003)(52536014)(478600001)(66446008)(71200400001)(4326008)(76116006)(91956017)(66946007)(5660300002)(86362001)(66556008)(64756008)(8676002)(66476007)(83380400001)(19627405001)(186003)(55016002)(6506007)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 2EVSGg7T+iGG4q4xfFj0iPpMd4M5KY1/iRoiC8y1yHxb7o5y5WyH9AeXRZ6STD8e42r8W1xooVD0538YYX4jLt++f3VevlDIZpGU55k9SyRdXBgql1vgKdJb9wkJ5DEq9VnIxiBPS4geh/Z3PhaOw5MkBgi54BCqFki9Sy+RS1WRsAl7oTwf76F/Af4tASUQ0iTbrmpwVTlzNe9OczJJ7QHOs6xqqDl4shwpOk6QDPXuG1vucQehZdXT21h9AJu/+KIyPfRn/DBAMXblntgdGcwdbaJYC2nWbANF7EhXJHlF55nsXAMA/6G08hACYJ/2eqhJyouEJFZpkXYfJK9wK80EUs8qgr7gT7WrTx4ODqlw81opPMkD4tqO2J2JscsEWmskYXpxUWe2pl7WmNy/KVKg71qL0ovXFb9MRKVsCuFehL/fFkbQpKx8H0rzWPNtopPcnLj3Hlxi0aR7oPHtuNd5sV1YE8CuZ0Ztad2vS+E/Rfm5B2NlSAgI3P4Zos9dfT7BoeTrJ205raMFZrYRNj6L1EhP5SN8536SvU5B5hsp78+fMFRu4hCdvX4XINb0qGXHVf9s4NQW3ej6N4BU8TV+JSYSuJ+wXWCvt3kAR3Y5AW9XoceJE/hElu6Iy+o/psjwJcc77EnyTRdAArG4d1KtkhfyZGjfOtdIedu72cVEd0V1cH76RCTe4qU6bsbqXJkfrqPt7DqAp5iszCKqKw==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB33112E61CA54FE1A17D30B70CA3A0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3309
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3ffb45e7-71c9-473a-54c4-08d85e56a778
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6wKi3SoPbIER2JkgxzTHQ5DmOu7uCed4N0Njkctax3k6XMbd3DbJVpE+gRkHhsrkYSPJwV++ZqDSggPiwWp64NwAZnuLNc05MzYsEn9CgWz21gvsSgK9tArD1VyBTO8zSuO4KyLdIlaSE9YPG/egoER4uPyN3Fxeo2PbHKGG3w3VvqWg1wlj5EWxFe0dtn/fjrhDglwxlX9FZGlbclB1THjv2TeZDmM8SIKFlMgS2fx/RrKq4kYcnWbbLCMAYxmrZ/FIdBNJAbJB93hgpL35pXB1r/g0f6I0Ra+lICOaWHBTt9uF34+5hmS2OGuchlc6LucR4RnDhly9LB7pL43UK4ZKJExVgYJWkL27pAea0jLnuZ5bdfkruDEMJj0x8GRNw/ZbJtcUYufYxnEC+Q9Jmou9YUac0DoHs2hJ39AnyGpNYt5RiEoCW3JS+z1Q0i9
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966005)(316002)(83380400001)(356005)(81166007)(54906003)(110136005)(70206006)(33656002)(70586007)(36906005)(55016002)(8676002)(9686003)(82740400003)(47076004)(19627405001)(34020700004)(82310400003)(2906002)(86362001)(4326008)(52536014)(5660300002)(478600001)(8936002)(7696005)(336012)(186003)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 17:49:16.6587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c74ea771-6834-4b51-01ee-08d85e56a955
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3549
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Sundaramoorthy Thiyagarajan <sundaramoorthyt@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB33112E61CA54FE1A17D30B70CA3A0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi ,

Phosphor-software-manager currently supports bios upgrade for a single host=
.I would like to propose a design to add multi host bios upgrade support in=
 Phosphor-software-manager.

Kindly review the below proposal and share your valuable comments.

Design:

a) : Add Host Number

1) MANIFEST file change:

Add  host number in MANIFEST file, purpose field like below.

Ex:
For Host1,  purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose.H=
ost1
For Host2,  purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose.H=
ost2 and So on.

2) For bios upgrade, handle the same to incorporate the host number and sen=
d host number to the systemd service obmc-flash-host-bios@service like belo=
w.

  if (host.empty())
    {
        auto biosServiceFile =3D "obmc-flash-host-bios@" + versionId + ".se=
rvice";
    }
    else
    {
        auto biosServiceFile =3D
            "obmc-flash-host-bios@" + versionId + "_" + host + ".service";
    }

b) : Implement a generic IPMI based multi-host bios upgrade.

1) This generic implementation expects a json config file with the details =
like IPMI net function , command id, and etc and process the bios upgrade v=
ia ipmi commands.


Thanks,
Priyatharshan P
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

--_000_TY2PR04MB33112E61CA54FE1A17D30B70CA3A0TY2PR04MB3311apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>Hi ,</div>
<div><br>
</div>
<div>Phosphor-software-manager currently supports bios upgrade for a single=
 host.I would like to propose a design to add multi host bios upgrade suppo=
rt in Phosphor-software-manager.</div>
<div><br>
</div>
<div>Kindly review the below proposal and share your valuable comments.</di=
v>
<div><br>
</div>
<div>Design:</div>
<div><br>
</div>
<div>a) : Add Host Number</div>
<div><br>
</div>
<div>1) MANIFEST file change:</div>
<div><br>
</div>
<div>Add &nbsp;host number in MANIFEST file, purpose field like below.</div=
>
<div><br>
</div>
<div>Ex:</div>
<div>For Host1, &nbsp;purpose=3Dxyz.openbmc_project.Software.Version.Versio=
nPurpose.Host1</div>
<div>For Host2, &nbsp;purpose=3Dxyz.openbmc_project.Software.Version.Versio=
nPurpose.Host2 and So on.</div>
<div><br>
</div>
<div>2) For bios upgrade, handle the same to incorporate the host number an=
d send host number to the systemd service obmc-flash-host-bios@service like=
 below.</div>
<div><br>
</div>
<div>&nbsp; if (host.empty())</div>
<div>&nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; auto biosServiceFile =3D &quot;obmc-flash-=
host-bios@&quot; + versionId + &quot;.service&quot;;</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; else</div>
<div>&nbsp; &nbsp; {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; auto biosServiceFile =3D</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;obmc-flash-host-bios@&=
quot; + versionId + &quot;_&quot; + host + &quot;.service&quot;;</div>
<div>&nbsp; &nbsp; }</div>
<div><br>
</div>
<div>b) : Implement a generic IPMI based multi-host bios upgrade.</div>
<div><br>
</div>
<div>1) This generic implementation expects a json config file with the det=
ails like IPMI net function , command id, and etc and process the bios upgr=
ade via ipmi commands.<br>
</div>
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Priyatharshan P</div>
</div>
</div>
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

--_000_TY2PR04MB33112E61CA54FE1A17D30B70CA3A0TY2PR04MB3311apcp_--
