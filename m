Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E53341CF5
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 13:32:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F23Dc4mgYz3bsc
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 23:32:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=R/njDPDw;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=R/njDPDw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.102; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=R/njDPDw; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=R/njDPDw; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320102.outbound.protection.outlook.com [40.107.132.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F23DJ6l4Wz30NB
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 23:31:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbJ8Yb1B4KvCLWvEYaJjuRSOMjaUmOGiD/9DoLCy8yU=;
 b=R/njDPDwfhKpGziaL0ZxikCSbYKwNB0/tSH7J7+cBekYxXzVTt13ioGyiDnV0kGpLhGWR0zzL7nimeeJcwr/RWZocj+TGeYRz/yPBWvyn/ZqU1liiQwWqcPPocVCDoACAPEE1OEDGCAmINErWSUl+zHI3ijJrag+YRN6OM8bxzEQhG9TvDQhnssjSkdIsb5giiTm/tc0gn4MY1li6mTp302qbmNGm1Wig7K6XtR+WqfyTxUufrzegAl6fEGhtwMGY+JmiKQ8qe2+C5yWizNXZhUcPO/p1T4ouZ54V3sdiKN7l8ggZ+pd3z//GDUYnMNRv1dCY9j02Jy2sagCyacnZQ==
Received: from SL2PR03CA0004.apcprd03.prod.outlook.com (2603:1096:100:55::16)
 by PS1PR0401MB1964.apcprd04.prod.outlook.com (2603:1096:803:11::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 12:31:24 +0000
Received: from PU1APC01FT054.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:55:cafe::1f) by SL2PR03CA0004.outlook.office365.com
 (2603:1096:100:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Fri, 19 Mar 2021 12:31:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.59) by
 PU1APC01FT054.mail.protection.outlook.com (10.152.253.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 12:31:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naHdIX07J+1E4mFq8VGe1U+4oZVuxCyIl9+9z1Q+A8G855NCidccuN8EqSvkYwGdGA8rX/9L0Vzhpe7KzJnGYnbDTIFXrBMPt15g+gzwzZpH6zmAeLHMsQICGStbW+XLP+ijsaZ0CFIbmghJ9ChkQJE2Gh6SxYU8jSkFa4IDE8eQVUVltDGHNPMhW4isFEgEX0T4Bh6V2QR5sGIEsBBo+/d1euOuMl6mOSB4Pr65qPn3QKZ1qm7PNFxPnMsAxePO6oLH7zG2vBGvu7ZbzM+468BJ53lUOz/vRKRIUTjAdgnbxGOFDGXaESxZhBtT8tjQfe7tnvbVZfDM5IGrUw3SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbJ8Yb1B4KvCLWvEYaJjuRSOMjaUmOGiD/9DoLCy8yU=;
 b=Im30jiKy6vCprRkdr+KaQtJeBErxqHHHUmyPbBSNaNPmWnwCSc6xbN6V03XXIlEpN8mmf1aPT9Ddt50ENhpJl3WVpoVygP4/qqtDoT89FzTFRuCsCdCcNGhYh1XTtr5ur2dNjDQzyh7WdCGRQhXNkw+wyCF5tanU7ZGbJxQjiSW918wNA6UxK4+zv1JUny2iPrCots24SMXMxK0+IbApLRBthAADapVbv3+3ordhGd4eklsmPOxCvFAIO8R//9UBjz8hE79yVhd/ZsDM42ycE+0SdOGI/oBpVRHTWIvJVmtX7jjRXtvECni/aRys8Dl+2LwnSykdjziqDRnCk3qqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbJ8Yb1B4KvCLWvEYaJjuRSOMjaUmOGiD/9DoLCy8yU=;
 b=R/njDPDwfhKpGziaL0ZxikCSbYKwNB0/tSH7J7+cBekYxXzVTt13ioGyiDnV0kGpLhGWR0zzL7nimeeJcwr/RWZocj+TGeYRz/yPBWvyn/ZqU1liiQwWqcPPocVCDoACAPEE1OEDGCAmINErWSUl+zHI3ijJrag+YRN6OM8bxzEQhG9TvDQhnssjSkdIsb5giiTm/tc0gn4MY1li6mTp302qbmNGm1Wig7K6XtR+WqfyTxUufrzegAl6fEGhtwMGY+JmiKQ8qe2+C5yWizNXZhUcPO/p1T4ouZ54V3sdiKN7l8ggZ+pd3z//GDUYnMNRv1dCY9j02Jy2sagCyacnZQ==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3897.apcprd04.prod.outlook.com (2603:1096:4:9f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Fri, 19 Mar 2021 12:31:19 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed%5]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 12:31:19 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Ed Tanous <edtanous@google.com>, "Ren, Zhikui" <zhikui.ren@intel.com>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAAeFPK8AAFO7oAAAoI65QAYo5M+AAFhb5oAAuk68AAAH/PTAAANMGgAAnoj+Q
Date: Fri, 19 Mar 2021 12:31:19 +0000
Message-ID: <SG2PR04MB309386FC63C254434AF0882FE1689@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
 <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <CAH2-KxAva6Sz6Q7GN-B8Tat+K855M1LZ2FiTcqxx7Smui=MqNA@mail.gmail.com>
 <DM6PR11MB441073C8A728B64BAA84733D94699@DM6PR11MB4410.namprd11.prod.outlook.com>
 <CAH2-KxBu_Feznt8_J2y3FVcYZmVat+rFfoWX1_B-dqSA+AQ0xA@mail.gmail.com>
In-Reply-To: <CAH2-KxBu_Feznt8_J2y3FVcYZmVat+rFfoWX1_B-dqSA+AQ0xA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNGMwYTg2YjUtMTNiOC00MTdlLThiNWYtYzNkYzIwMjcyOWJhIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImZhTWMrZkR1am1cL2V2c3NnSzVYajc2OW1uNFV6SDZ2YU00UUNcLzdQUFN6cHV4N2lxS2ZrQ0dkb3pSXC9zM2ZuZjUifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.51.27.66]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: dbf24e4b-5d4f-42ee-f55e-08d8ead2e8f1
x-ms-traffictypediagnostic: SG2PR04MB3897:|PS1PR0401MB1964:
X-Microsoft-Antispam-PRVS: <PS1PR0401MB1964DB4EBEFE0C2A2808EDA9E1689@PS1PR0401MB1964.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xEL5V07WHPz56RG12Ze/Qv+5BAAXdboRWmHmlnn+qYBDNVTjM953haaUAQ+qU6BUJQ7xkNt/aEmIbBPGI0D4eqWlSrRtuUZlDNq+Y19wTsp0sEXLPVyRSV4I3pJzZbUMhqDGhq7fWrRFic5w3d6nLyrVGBL5i0vKbqszbFndiLn3N5HjNReaMzQ/Cl6jrgaKcgrt/zlpi8eQb1euCJNMrVoaFVi6uq94Z3/TAJDQmuPxa5GlbJJOaRVI7n+U/l6RyndxYGksMpkdyar1UjLwGWxf850dFDGEynKxgJPZbxcOmEu85lceG05uxCGcmy9U7wQEHl/QUnYZBaMjHCE+Py5c52tnI/GVkMG8r95wyq+xzzPQ97LiV/a1e9mswWfSlMhhueJ2wK4Jmp+8duosk6s9DlxcU2dRjgIiFRqSfPVTdwoNnyAiJ09nWtGzgdWZEYq2mhTXH380GVbeFZbzhtgNN0wmLGZA3ZTIgO8hrKGDKSuHXcbkXZQpxfe6TJGKPbfmSW4EfCg9HbJ9nZYXOugDzm7yMGML2X/O5h+M5RFU6uiW6bL/dCkX0lIrUViYDO+nwbJ8mOXOg+l54JZk/jaqmSY+s2V6g/PUFPtZPULXiY6OEwLxLkBCybOAN5bApvHA17u8ggdQSIFXKGfOO8EJP8U+VibXckn5MuDEV3YkAQGOAa32rXRKAvHMv2t7voKAzgJhjEVHNlTBWrFDF7Cju/VZFt/6cEs9WZTSJR8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(186003)(5660300002)(110136005)(45080400002)(4326008)(52536014)(7696005)(2906002)(478600001)(66556008)(83380400001)(966005)(71200400001)(8676002)(66946007)(9686003)(6506007)(8936002)(26005)(66446008)(64756008)(55016002)(76116006)(86362001)(66476007)(33656002)(53546011)(316002)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?92J21jtuGRkSl2hXoWRXXrT4N2/RYIedCEgYBAcZHyhHed/zOX4JNQa5qgW/?=
 =?us-ascii?Q?54rfi0lEvKB6WWP6jJ6/KN1f7XRy1mVzi2bS5DaHCrx8UuI4RS9l2snjkOu/?=
 =?us-ascii?Q?yRGX/auheYmDK2OXep1H7tZ1CNpjNAIiWUncB3jkRPeiivnD2InXJ9vt8Ni7?=
 =?us-ascii?Q?JADhiCGCov4/z4hJ5bmUE/ule7AYtocmNcA7Dhab43YBiRtWCAfbsp3E8VTk?=
 =?us-ascii?Q?QUycSQnXBZywC/U8n8qJuCFiZe23PQtx+NyOVToby8A42tXHOdfMTwb6/lcY?=
 =?us-ascii?Q?fLAbAQ4JNkiVYI/WVcboNizo0szLWir/f/sUf57sedN/JXIvnByX7d9zrjEE?=
 =?us-ascii?Q?oEhsFg6H9vGBjrU1f5H/yEoC8iBaENqlSNqK1CnymUwmt5HAuJsnBuTbFmsl?=
 =?us-ascii?Q?Z26iAD9ef7XWMnU6iVDYpRuGTs7BJNrqM05cWC7JSOwScuRCxSYSgVXz7Zv0?=
 =?us-ascii?Q?tpmP/6PVZyffvdWgi4N/tAb1uJBw3xw/L/vY07gSdigT7yzW2E7rSoBXWyfF?=
 =?us-ascii?Q?QZD4fN8nrdhCxQDzygNTCMVb4NYJ8aoOCAJYLYtO1Z//Wcf06MDA06NMepV0?=
 =?us-ascii?Q?mftETuC0jJISCoI4KpyYwzcuOWknW6johNkGm+HQra6f4Z+csWaLmi+5x2xc?=
 =?us-ascii?Q?CeTDglTZaY3WqKw7tQbjRzs3yHawnwaGLtcGlK3v2eAYrR5pQDSL/KBVrIlA?=
 =?us-ascii?Q?XDqxdV/ARnaQSF/YMWe4SECrYoyJmOX5lLLQ/5DCk/DfKscGMhMRyHo3g34v?=
 =?us-ascii?Q?9n+tws8be6Uqb4exS6VZq1onP9Hgi1rK7MH3uenbfrnWGXljiFrpNZ3hP+T/?=
 =?us-ascii?Q?nsLNFwnpn98Y+acsnWRELTCnTo9P1JEbfHTuPo5U6WuSCFwT2iEaHWkcBBMO?=
 =?us-ascii?Q?2/iZKRImogjVl6ePCZAwtXpqVndBUrGLPIX0V0kE5LJQKRST6vz8HCetyNIn?=
 =?us-ascii?Q?+EzgZlq4djbMuy9QQy76zjBs5TMew6Tu6OznNeq7ggIud2jcbV+5o29mt957?=
 =?us-ascii?Q?G4r2UTGoWQQuoMnjxInm9gfcdtcaVJA4PvwLnDl36JZVvQzOcOfaxvsG9V1B?=
 =?us-ascii?Q?KBJd25QdonKTmPSYwy9Ucv+CFPJWODWq3WFZKEF/SQK/1m61kdn9WAZNOrca?=
 =?us-ascii?Q?CZ7wdGi8mb+bJ3G40juH5p4XmJLwtOMi6K7tcawdsPSJRalJz1zdpcbgS3HB?=
 =?us-ascii?Q?TwT2U/YanCrgHBp/6eEEzTVWXDUQttUR+/lhdCSDjeRC7xtUY/0nWJSFJpkd?=
 =?us-ascii?Q?haY0o4nmgJaqCsNSJ0tOK/OC+8JSMeeC6/4z5Vjfi6qJYWREZUSth1FK1A+Z?=
 =?us-ascii?Q?8ds=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3897
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 901f9be6-f224-45ed-20a7-08d8ead2e5ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KahehVT2BnIKhTmBwODkv5IlvvLS3z+4aR9xN2rytb1SJxjtQsAFY/hSvYerqUSUFg9xMKud7GXpcAGmwMGWkeVHyNX2pj5/ktYTUbqvRXju3nMQH4/SIlfYW+RcRXCYj3yA3lSW3hSmb4SnpSlJRN5MVvNeELqa6L3cSdmDubz4ifrQHFocsP4VdIuaMIDTQYUPl41KH5iwwLh5Cpra4SWIzlWDR+PtGYvAHBeL+29UI3YRNvK72bPU5hVao9R0X0pa6m/ynIH4WgaPTKw+JM+qrFdUOrutORE98DRH09b0pGzpG+Pc0Mxqe7bYTv+qIdGJRKy0XZlSA/oDgudzNLlA/y4VR9K+V3E1xvYNLUoJsSxef4+S/FqFA5qMlnohsjcaKuwNCvBuOLXaxSA3Z/jJAeK4AKHXSPLCe8xWz45pZSXZJqF8TmxvS248j9moAjnyRqMDC9aP+nBhCXcOB/XCWbgldCrAOJlp3TVBp/CkgZT4RY5AJSdXCNuHv0JMSm6gOr9hcUxgHqzcrIyz+4ivOF98UwI0U5XJU2XDJDCOOP3O5ZQ5Uq/DZDCeJhMEqqHl6BVqMyKUFTctmnEOhY6uSxh6rYZhDBQrS6uOpnVBpAa8sFbt0ebaGd96sc3yRAWcaYKbl1cSNYzTkm7bvT+aaC3J29S8/A9eZfrmmDabsyVd0mP3pjEVisbJFZXq+bQHuelhVwATVi6J/7LbA0WSMZkuesq+maeUOZGeNGUtQFTh0lbDP9HumwF60xWeXJioSaYaEF2HhqGqhPdyzesTQ9pY0vSbtcHDNRmZJ0s=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(36840700001)(46966006)(356005)(33656002)(45080400002)(52536014)(26005)(55016002)(9686003)(36860700001)(7696005)(5660300002)(81166007)(70586007)(83380400001)(316002)(966005)(34020700004)(70206006)(110136005)(82310400003)(53546011)(478600001)(6506007)(36906005)(2906002)(86362001)(8676002)(47076005)(336012)(4326008)(8936002)(186003)(82740400003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 12:31:23.8371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf24e4b-5d4f-42ee-f55e-08d8ead2e8f1
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB1964
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Public


> >> -----Original Message-----
> >> From: openbmc=20
> >> <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org>
> >> On Behalf Of Jayashree D
> >> Sent: Wednesday, March 17, 2021 12:39 AM
> >> To: Ed Tanous <edtanous@google.com>
> >> Cc: openbmc@lists.ozlabs.org
> >> Subject: RE: Negative value returns for sensor in tiogapass
> >>
> >> Classification: Public
> >>
> >> Hi Ed,
> >>
> >> PMBus spec only have read and write format. In the below link, PXE=20
> >> VR uses
> >11 bit format. Also sign extend the 11bit reading so that negatives=20
> >show correctly.
> >>
> >> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg
> >> ithub.com%2Fopenbmc%2Fdbus-&amp;data=3D04%7C01%7Cjayashree-d%40hcl.co
> >> m%7C1b6d7a1501e44b43ee9908d8ea33afb0%7C189de737c93a4f5a8b686f4ca994
> >> 1912%7C0%7C0%7C637516854997063723%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> >> C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> >> p;sdata=3D5kyigWCboGaq2b2IEfJ1LNWEzB9arVYz3GgF5o0JxMA%3D&amp;reserved
> >> =3D0
> >sensors/commit/e4a970d9aea97c7c1a11c63
> >> 215e7d3cda2124e54#diff-
> >135678dd2046935c5dd0be8e5a5a529d33231203149e786
> >> d57b15a3cc0cc1240
> >>
> >>             constexpr const size_t shift =3D 16 - 11; // 11bit into 16=
bit
> >>             value <<=3D shift;
> >>             value >>=3D shift;
> >>
> >> Could anyone from the intel team can clarify the need of above=20
> >> logic used in
> >IpmbSensor.
> >>
> >> [Ren, Zhikui]  This change was made to allow negative numbers be=20
> >> reported
> >correctly.  This can happen during test. Without the change,=20
> >255degree will be reported and trip threshold event incorrectly.
> >
> >Can you walk through what your test was?  It's sounding like=20
> >Jayashree was seeing incorrect values in a real world application. =20
> >Is it possible we fixed something in a test by breaking something in=20
> >the real world?  Can you think of any other reasons why others would be =
seeing different behavior?
> >
> [Ren, Zhikui] The issue here is the two device's temperatures are not of =
the same format.
> PXE1410 uses PMBus LINEAR11 format, where the mantissa  is a signed 11-bi=
t 2's complement integer.
> ADM1278 temperature is 11 bit, but not with LINEAR11 format.
> We should rename the current elevenBit to  linearElevenBit and add eleven=
Bit without the sign extension for ADM1278.

I'll leave it between you and Jayashree to figure out who will push the pat=
ch, but that approach sounds reasonable to me.

[Jayashree]
I have pushed the changed in gerrit, Please review the patch and provide yo=
ur comments.
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/41433


>
> >> Exponent data is not used because it is always 0.
> >>
> >> Regards,
> >> Jayashree
> >>
> >> -----Original Message-----
> >> From: Jayashree D
> >> Sent: Tuesday, March 9, 2021 4:48 PM
> >> To: Ed Tanous <ed@tanous.net>
> >> Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
> >> Subject: RE: Negative value returns for sensor in tiogapass
> >>
> >> Classification: Public
> >>
> >> Thanks Ed, I'll check it out.
> >>
> >> -----Original Message-----
> >> From: Ed Tanous <ed@tanous.net>
> >> Sent: Monday, March 8, 2021 9:37 PM
> >> To: Jayashree D <jayashree-d@hcl.com>
> >> Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
> >> Subject: Re: Negative value returns for sensor in tiogapass
> >>
> >> [CAUTION: This Email is from outside the Organization. Unless you=20
> >> trust the sender, Don't click links or open attachments as it may=20
> >> be a Phishing email, which can steal your Information and=20
> >> compromise your Computer.]
> >>
> >> On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrot=
e:
> >> >
> >> > Classification: Public
> >> >
> >> > Hi Ed,
> >> >
> >> > In the below link, PXE1410CVR and ADM1278HSC are using the same
> >reading format.
> >> > I am not able to find any information on PXE1410CVR. If there is=20
> >> > any spec
> >available, could you please share it.
> >> > It will be helpful to analyze both the specs and fix the problem.
> >>
> >> I don't have any specs available for those.  I would assume they=20
> >> follow the
> >pmbus spec though, you might start there.
> >>
> >> >
> >> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2
> >> > Fgi
> >> > th
> >> > ub.com%2Fopenbmc%2Fdbus-
> >sensors%2Fblob%2Fmaster%2Fsrc%2FIpmbSensor.c
> >> > pp
> >> > %23L144&amp;data=3D04%7C01%7Cjayashree-
> >d%40hcl.com%7C8676d30f4d3a4dda1
> >> > e0
> >> >
> >e08d8e24c4957%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637508
> >164
> >> > 56
> >> >
> >8775248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> >luMzIi
> >> > LC
> >> >
> >JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5lhuUdfI%2BG75C8I1
> >HDAa
> >> > EH
> >> > VP46%2Bz1r3nJV0ek3CiiR4%3D&amp;reserved=3D0
> >> >
> >> > Regards,
> >> > Jayashree
> >> >
> >> >
> >> > -----Original Message-----
> >> > From: Ed Tanous <edtanous@google.com>
> >> > Sent: Friday, February 26, 2021 9:57 PM
> >> > To: Jayashree D <jayashree-d@hcl.com>
> >> > Cc: openbmc@lists.ozlabs.org
> >> > Subject: Re: Negative value returns for sensor in tiogapass
> >> >
> >> > [CAUTION: This Email is from outside the Organization. Unless you=20
> >> > trust the sender, Don't click links or open attachments as it may=20
> >> > be a Phishing email, which can steal your Information and=20
> >> > compromise your Computer.]
> >> >
> >> > On Fri, Feb 26, 2021 at 12:55 AM Jayashree D=20
> >> > <jayashree-d@hcl.com>
> >wrote:
> >> > >
> >> > > Classification: Public
> >> > >
> >> > > Hi Team,
> >> > >
> >> > >
> >> > >
> >> > > Recently, I have tested sensors for tiogapass, in which one=20
> >> > > sensor
> >returns negative value.
> >> > >
> >> > > After analysing the code in the dbus-sensors repo, I found the=20
> >> > > following
> >issue.
> >> > >
> >> > >
> >> > >
> >> > > dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors
> >> > > (github.com)
> >> > >
> >> > >
> >> > >
> >> > > From the above link, We need only below line in the code to=20
> >> > > process the
> >HSC sensors value for tiogapass.
> >> > >
> >> > >
> >> > >
> >> > > int16_t value =3D ((data[4] << 8) | data[3]);
> >> > >
> >> > >
> >> > >
> >> > > Since the below logic is added, the values get shifted and=20
> >> > > getting
> >negative values as output.
> >> > >
> >> > >
> >> > >
> >> > > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> >> > >
> >> > > value <<=3D shift;
> >> > >
> >> > > value >>=3D shift;
> >> > >
> >> > >
> >> > >
> >> > > Could you please suggest any idea to resolve this issue.
> >> >
> >> > I haven't looked at this in detail, but we should follow whatever=20
> >> > the spec
> >says here.  If whomever wrote this originally put in the wrong math=20
> >(which seems likely, given they were implementing 4 types and=20
> >probably only using
> >one) then we should just get it fixed and do what the spec says.
> >> >
> >> > >
> >> > >
> >> > >
> >> > > Regards,
> >> > >
> >> > > Jayashree
> >> > >
> >> > >
> >> > >
> >> > > ::DISCLAIMER::
> >> > > ________________________________ The contents of this e-mail=20
> >> > > and any attachment(s) are confidential and
> >intended for the named recipient(s) only. E-mail transmission is not=20
> >guaranteed to be secure or error-free as information could be=20
> >intercepted, corrupted, lost, destroyed, arrive late or incomplete,=20
> >or may contain viruses in transmission. The e mail and its contents=20
> >(with or without referred errors) shall therefore not attach any liabili=
ty on the originator or HCL or its affiliates.
> >Views or opinions, if any, presented in this email are solely those=20
> >of the author and may not necessarily reflect the views or opinions=20
> >of HCL or its affiliates. Any form of reproduction, dissemination,=20
> >copying, disclosure, modification, distribution and / or publication=20
> >of this message without the prior written consent of authorized represen=
tative of HCL is strictly prohibited.
> >If you have received this email in error please delete it and notify=20
> >the sender immediately. Before opening any email and/or attachments,=20
> >please check them for viruses and other defects.
> >> > > ________________________________
