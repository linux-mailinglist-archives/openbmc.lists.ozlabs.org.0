Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9392E27FA
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 16:54:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1vlp3GSdzDqJW
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 02:54:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.91; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=LweKJrmB; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=LweKJrmB; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320091.outbound.protection.outlook.com [40.107.132.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1vl53sZZzDqMp
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 02:54:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpA6FWuPmWQ33AoUNF49omIUikNPKPvg3XPs2lgVYwo=;
 b=LweKJrmBpB4zf1jC/ExvAoPqNf7BS380UxC2V0fl2JsOW7xJSyQclPzfTvja0GhYb8DB1kPNeYrODZgzbVeBBPSyw95q1wqBK1QmwpgYwTASRhFuJJwGVuYfKylqhw56CYv4YRFNjH6wVQ66kOR4cQzNm6byfkmL9aOkdteYWYI=
Received: from SG2PR03CA0155.apcprd03.prod.outlook.com (2603:1096:4:c9::10) by
 KL1PR0401MB4258.apcprd04.prod.outlook.com (2603:1096:820:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 15:54:01 +0000
Received: from SG2APC01FT051.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c9:cafe::48) by SG2PR03CA0155.outlook.office365.com
 (2603:1096:4:c9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.12 via Frontend
 Transport; Thu, 24 Dec 2020 15:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT051.mail.protection.outlook.com (10.152.251.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Thu, 24 Dec 2020 15:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXaS8iPZFf0b+AQkhmno/12yexFrztdl+r8WGRZky7tm1hM4G2dyJ1zFfu+Y5fkJ2TR4rLNy5UljBZdIj+kws1XDyGXgQQcsM2ra5192xemkHAsjJBjDLT+M4T0GGLqWb6f1I5TgMaa42r8C9fGbhNPhSliDEOK838UUPrTNBwZN2ZSesZ94bjj1Xn/1zmQR2YrWcOaM8bOL99RTGyfU0iOF8c9QFK+pICpJW5VruVZStjqi5lz+8sp97668/xKgRuEOLULcdo5XC2s9LN4QMTdAQ4nkUePLxZTcz0W92oFeWALRjVidtImKjv3ifUTo3uEqjTTZAJQWGbk60VpcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpA6FWuPmWQ33AoUNF49omIUikNPKPvg3XPs2lgVYwo=;
 b=c5pCTHFRwcAiQnhgsOvUOAEin9hiGZ2d6kk7FExI33+VQSIllEsIgpABI3XEn6Yq8KF4qnUpvVYyMW+xg9gAfyukZTVjyTTj/g3oqe+4a/CYatXhk9qsNWD8QKPt/Yup4izKBar2njL4vHc15JcAuw1HCH2rkSBlg3V8hJYbq+u7Lkj8nXrP392bDbdEOEnsTiHlQalf3VZayFm+98UA7PM+9SG6nBLzQf6hu9zd/eaaal0C+gYOlG24x4Ia3goK+LngCRXRY1ltAjD3ekhfZkMVqs05EagDAcrJKdSnMWyk2Htp0aU+dfKSK3jUWzn+FNRlalH3twt5Lp8+FPwE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpA6FWuPmWQ33AoUNF49omIUikNPKPvg3XPs2lgVYwo=;
 b=LweKJrmBpB4zf1jC/ExvAoPqNf7BS380UxC2V0fl2JsOW7xJSyQclPzfTvja0GhYb8DB1kPNeYrODZgzbVeBBPSyw95q1wqBK1QmwpgYwTASRhFuJJwGVuYfKylqhw56CYv4YRFNjH6wVQ66kOR4cQzNm6byfkmL9aOkdteYWYI=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2891.apcprd04.prod.outlook.com (2603:1096:4:24::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.25; Thu, 24 Dec 2020 15:53:57 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7%6]) with mapi id 15.20.3676.025; Thu, 24 Dec 2020
 15:53:57 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Sensor Details
Thread-Topic: Sensor Details
Thread-Index: AdbaDHxph6EtzkcRRh2+d9Mr6fB5HA==
Date: Thu, 24 Dec 2020 15:53:56 +0000
Message-ID: <SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMTRiNmVjOTAtMjk4Yi00ODhiLWJiMDAtMmRhNjA5NjM0Yjc0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlMyamxuMHIxOUlGcE5tYlhGcFIra3gxTEZJRmJGWVRXWlh1d0luYlVKTURydVNZMkZ6ak5hWW9WTEx6dUFsZ0kifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.51.96.97]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 35c80308-3950-42bb-5994-08d8a8242167
x-ms-traffictypediagnostic: SG2PR04MB2891:|KL1PR0401MB4258:
X-Microsoft-Antispam-PRVS: <KL1PR0401MB425877B0CF1D0DF0A6155943E1DD0@KL1PR0401MB4258.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: W6ThDSF1WNVlQTLMvNLlSbBV/O2b/3cF1+kVNjqFkku2Tp8It+J1+pDRz+VUtSTA7M/qc3LEOfxoXgiKH6uHuTS14yF/EpfaISrXjS5IqL3zfRBwbpK0YlxRVLunkEZyvFZJRD4/w9UnqBgrn7vZWDMesJcWNSXQUx2tpz27/njSD/5+rpTeHJl0PTgy194akFyREJWHvEQ1lggXlxfjChQNb2rRkW0d+/1NqH8m9kiX8ldIQF8FMGnVap8TQL0vZypilKxFrtVQFDJ/W/UFqw0E2IivCbjrL96AB3J5Q7VXRMpUfoHNrOKNiIiq1QVeU1zcrTLbc92ekMD3ItP8qbuUm+R7fAhNrjV+or3c6u1K7NfB1WTfpqCCBM/PQ85ycYwwRXzEA1/ShEtqac4xNA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(76116006)(6916009)(66946007)(64756008)(7696005)(66556008)(66476007)(66446008)(55016002)(8936002)(478600001)(7116003)(71200400001)(5660300002)(9686003)(83380400001)(3480700007)(52536014)(26005)(6506007)(316002)(33656002)(86362001)(8676002)(186003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yudxS9E2O3+Jl2bER3td3BPJxOLBdfvpu1lovyGMpoxDKTnB9WwW9In7k/Lz?=
 =?us-ascii?Q?ysCcK1lMxhiEq9xWpbgYwal1C4lH+iljzNc+dBFN9IypPOeBYm9IMiBWC8c1?=
 =?us-ascii?Q?VKfw5w+iZgBNs+2ZPa9+kaDDCk07UrdAXBX9oEFohAYS46+Zr1QKYQpLQKSZ?=
 =?us-ascii?Q?4umQkgQYnYjpV9V+v4BwY/6vX0cYk5C+ft5QaL7HylissdV9oX2fkYemHm6g?=
 =?us-ascii?Q?fJZ+PH11+ErmoWDrf/I0IcleQsLfrDBAFi8Xch82nLVzmiFHpunK/nOWs2BR?=
 =?us-ascii?Q?x5Pkz5UY7o+OttFRnSe93b3TFNNrQAxSe8Vi2ITVsokOiEzrfv2MoJVuMEg6?=
 =?us-ascii?Q?4xE/IHsg1xjO1Q4z+zh0vcRGHGHFQwYqOkwPFy3LtQSfEExCgX0cuoE1ECUl?=
 =?us-ascii?Q?aOQC8e3pwMjLsDvEzEBofJXkHxvqMULe/nG1MeJ3uEW4H2ZsPuphMb5+uSP2?=
 =?us-ascii?Q?Q5wLVzPfkEjWw2XNnDuhrUAg7XE1wy/lXiosM+wQuBsx3sPFmJbPK0pB14Oi?=
 =?us-ascii?Q?++SRU3xeNlT2ZbIfMiCVwzEJjN6pXI3z+JTWaxIieFpN2DGftEIOCGDv6U+Q?=
 =?us-ascii?Q?egqquFSnuZQ+d8pnkGoENVrsd5vWkh93OZjd0jdFovJfs4Tb8EiWPsYJNA9r?=
 =?us-ascii?Q?5RI/vaMC/k8zniDA+gk9poPuSOs3cKYi9iFT/y4cRN6D3k8h6sr8S+zSbNiX?=
 =?us-ascii?Q?2TnpjkwE1icdy5wy1quJ+vugZBHIKF+3oRiPSQsYYdkbA+6WUsalzsklUAyL?=
 =?us-ascii?Q?qgYLLQSnTeVDUS2BRR8Hy5t8M9fDAy5QZJFdlwvHR+Tf5f8UoIxRXRc9MXK2?=
 =?us-ascii?Q?Z2sS5duTp5jM62zHPCFA+sup+EfACUoYnlRn59xGzNz8s1N0HKOMkjkLQvzn?=
 =?us-ascii?Q?Nr2GBbzPYCvkdmLBijWz/YoBlUj3owlIWViAzJdWWcbWg9qbxwwpZHo0uDGP?=
 =?us-ascii?Q?3VpnMGSC2p2ZzK3C3POtk2HqxVQVI1TpZqKJwCtW8RM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2891
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT051.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: de7e496a-38f1-4b76-9b35-08d8a8241f51
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wIRCG41nsM0Jwoayn0Pzn8rnJuQbNKEUbKSMRAuGAVJxk/gwUe98BE9IPz5XaNPnziRKqeUJxvF5cpdwrw8mhUX4PhHoiL4Re6oRVg+t6a19F4Tgq7S1dn13d9y17yhzoVaSGb91v3kYP2HvBRjIwo7MdnF8nIyDczLK3VIOFeuHQO3BJJqt9H9kOetVzLZq2+gj77DgjJtgy5S4P13WCJXkAN/1RxaJ3i4kMZ7eEMjT1cWnYx8upxgmE04Gi6LiEoHaRIfV3HWz3fCQOuAT15rNUwlish4ki2ONx8WEmHSjtG9BTEH6U3YJuefuaDPp92Wk9qek3UNbAvp5jP87FCGrToWr3kbZD2N01cN1zeSeChsZ6bhwSceGergWtR/rD99qSCXS0tujTOtr5S9iWs3tIiqR6Np1hR6cxgu7DqcbPbpUOy1QKNjf0hvKYVylPrU+tg7/Rr5UBn3TMyA5SO2RC8MlyZ3tKYZewGXCsGMtCsksCRtymUGNs8LnGptx
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(6506007)(316002)(52536014)(7696005)(86362001)(26005)(356005)(336012)(8936002)(47076005)(6916009)(186003)(7116003)(81166007)(36906005)(8676002)(70586007)(82740400003)(3480700007)(9686003)(70206006)(2906002)(33656002)(82310400003)(478600001)(83380400001)(55016002)(34020700004)(5660300002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 15:53:59.7949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c80308-3950-42bb-5994-08d8a8242167
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT051.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4258
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

--_000_SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Team,

Is there a way to get the details of sensor events like crossed threshold/f=
ault etc from any other service running on bmc (ex. phosphor-led-manager).

Please provide your inputs/suggestions on this.

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

--_000_SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0SG2PR04MB3093apcp_
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
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Is there a way to get the details of sensor events=
 like crossed threshold/fault etc from any other service running on bmc (ex=
. phosphor-led-manager).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Please provide your inputs/suggestions on this.<o:=
p></o:p></span></p>
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

--_000_SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0SG2PR04MB3093apcp_--
