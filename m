Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170B2DFD9B
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 16:33:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D03Qj5xCwzDqQS
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 02:33:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.132; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=fuuI8R+4; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=fuuI8R+4; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310132.outbound.protection.outlook.com [40.107.131.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D03Pt1c3XzDqPj
 for <openbmc@lists.ozlabs.org>; Tue, 22 Dec 2020 02:32:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXgbnpTBDIzqOdWlG1JhFwrvKTs39RjVb3oXRIircOs=;
 b=fuuI8R+4ylodvRRZS8Xn/A1goeeoh3g2LA0u37A3/5K/eA1P/NjFwM0UaRLrnQo7HHCjHsIlfKacNXWEd87CIyDnxWEciY1hRAqmfOgJR1IhtIs5QHwIO4G+ZDaDAALl7IBUI/08wniBx7MfjEzDDMVWTnFO+b27w7Z5IjjVJ5w=
Received: from HK2PR03CA0060.apcprd03.prod.outlook.com (2603:1096:202:17::30)
 by KL1PR0401MB4356.apcprd04.prod.outlook.com (2603:1096:820:29::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Mon, 21 Dec
 2020 15:32:33 +0000
Received: from HK2APC01FT024.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:17:cafe::29) by HK2PR03CA0060.outlook.office365.com
 (2603:1096:202:17::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.21 via Frontend
 Transport; Mon, 21 Dec 2020 15:32:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.51) by
 HK2APC01FT024.mail.protection.outlook.com (10.152.248.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Mon, 21 Dec 2020 15:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyzvA34zVb29aT9DCZh3U5ifYrSoXY5nbF39iRLJ1/nVtOBuCZPhRsWhNcUPL6Jal75lxR9s2e+rfe96p+aB89NtwC8Z4bjjjBsxnEFLnPagHa1rwsZMosu/7y6sHZByprXbGTzuksMjBCiPLHGHkPRUqRU34RetCYFQIBN6ofGsTayQVlxspCT0eztBMb+yzTqRnJ5E871q7QkbW6ckswVO2RRJwFlMc9Grv2TmI0GguTrWsclDekOKXE6A2I24QMS007FmOjf/I1VjwR3icz/nnvkSuj1RwA8cEKC0VR/EMqPyID8jQtnTAXylji6hL4G1prEyLolXMv292kJEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXgbnpTBDIzqOdWlG1JhFwrvKTs39RjVb3oXRIircOs=;
 b=kN1HwY1gNLtIS02+8567w4tKvgNytKqdpyTnnR3pEuiwOj5pEqzcaKZHILq+gh3RkmX0SaqNSTJyaWLQJliEGDhRgITi2An7Jd1+LUCWSpdDxP/n8B8vmSGRAQ5yxbBkKVw9oKXGc5L03jayX9ShXDAk7pZnGuAw7BDtoXA7iIijv8w7FCuzeMPsvpGLY3Bl73LN5JPlyx2i47mrpq/QqIApS1BT9tlOY7cm/35sxTU9nRZmUFSIrsbQKOlfpD4j/RSwWb8fOvnZ3/qmsnRDecMB7tO0oc12EGrGHrC53TD1dRwvMhZ92niDRrs4c9r8rHnuZMlqFcE9Jt0hCcvpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXgbnpTBDIzqOdWlG1JhFwrvKTs39RjVb3oXRIircOs=;
 b=fuuI8R+4ylodvRRZS8Xn/A1goeeoh3g2LA0u37A3/5K/eA1P/NjFwM0UaRLrnQo7HHCjHsIlfKacNXWEd87CIyDnxWEciY1hRAqmfOgJR1IhtIs5QHwIO4G+ZDaDAALl7IBUI/08wniBx7MfjEzDDMVWTnFO+b27w7Z5IjjVJ5w=
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com (2603:1096:803:2d::14)
 by PSBPR04MB4039.apcprd04.prod.outlook.com (2603:1096:301:10::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 15:32:30 +0000
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::d872:8da1:f83c:947e]) by PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::d872:8da1:f83c:947e%7]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 15:32:30 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: CI build for yosemitev2
Thread-Topic: CI build for yosemitev2
Thread-Index: AdbXrZNZbSyzw1j/SGC/V1p6jAc/hA==
Date: Mon, 21 Dec 2020 15:32:30 +0000
Message-ID: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjc2OTA4YzQtMDMwYy00NDdlLTg4MGUtZDIyZGYxOWMwYjlhIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImU4VHpoenBQS01qMFQzUHVyWHBPdXJuTDdRb0xcL0loK1wvZzIwZmhqTFlaYmRaMGxVK0lLY0lSNVRsd2pVTUVQYiJ9
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [182.65.212.4]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b99fbeb2-813a-4a7d-b2c4-08d8a5c5a28d
x-ms-traffictypediagnostic: PSBPR04MB4039:|KL1PR0401MB4356:
X-Microsoft-Antispam-PRVS: <KL1PR0401MB4356C569F39DAD586CE58A2FA7C00@KL1PR0401MB4356.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QZFe45PbXdYD6R9SUW0hVyi7yt9Ju9AccTqo3o++kZ2AohYqb3z6nS1CZei7aXutjGWlj8ktY/LXITWIz6pQURN3TvNr7KIp8tT9XXcRv4VZ10YGXoj/T6f2CKJz747VP1ZSWXsFQht6/btpX7eJjXzx6MIvWNiEAqty+ALIWVvBeWW350IR/MdcY9wi4S6V0f3j7xyS90FyCpqsBqZ+0nnKkAt2QE+8Cn3cu6xxlfwAMQMT3oWBql6XOVVBGeYELZACqg67GsTLUengFlTnh6E+dfWNbUAAN1v01i+rrxUtRB+eFk0Uydjk17xqmqr0ny2FNUaFIoEWBmD8K1/2p9GcZ+CL2Uz0/SyaJqChaNAVsJ//U9Gjxc1Wf6d4ywncHsBqSiZ7mkaAbvt6JPpmCA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PU1PR04MB2248.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(33656002)(6916009)(5660300002)(316002)(66556008)(54906003)(66446008)(4326008)(66946007)(66476007)(83380400001)(64756008)(86362001)(76116006)(52536014)(55236004)(71200400001)(8936002)(478600001)(2906002)(6506007)(8676002)(9686003)(7696005)(186003)(55016002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?f6GsE4z0vFp6Bfl/ky2tH8mfgKmtHJtH2HZUe0u5xiN61pYGVofohGTY4Yo4?=
 =?us-ascii?Q?MuDyENZ/YnPL7boL5jbWqzsvD9BgxsnPRDbEQXyau84yrjrSc6NsC4JlyrVI?=
 =?us-ascii?Q?ZykdgfBekYxq39dirTzmyTRHdA4KKDXPDKs/HTzpWZlbKAB7tiZHUnfIDyze?=
 =?us-ascii?Q?oa5TNKHgppMCDTYHlUyJwJmRqbbOfQU+HJbgzLLtrrB207ZR0J2NfXLqCH/D?=
 =?us-ascii?Q?DbbdoadGMf+LSOe0xs5b6c7R0U4lMWrQyXsI6HdNFp1oSgornUCrbpvLJLAw?=
 =?us-ascii?Q?hAS18MaSxeEryoh3VwdGOsiePNf4aL35wMvb4i9Fl4MAz96gLcEnc3LGZnjA?=
 =?us-ascii?Q?kmKqggr7mzCDfnBI0jp1nCfE0l0g0L4oreQK6VD0DnbrESBU9l/AKkLd8kMe?=
 =?us-ascii?Q?LP/z7pzXAyYIPmYCXD6jDf7rDqzscKGNUNWOM26Hj2/74XNyfpTCf5jOVosV?=
 =?us-ascii?Q?eLk471E46HSDvgQajUP9RckriqK0R2JbfoDBR/P1eNCy8z9V11HJI21jOTF1?=
 =?us-ascii?Q?C9DclAimhZitEtXYoyHqeBDCTAgbhVWz1YTWl80y3dbX57cpTR6FguX6YdyE?=
 =?us-ascii?Q?DpLP13TvU/vVkMalBrdaQywWsyH1Ao0tzaVZPjLC/a9ssw96F9KMUqqDAloR?=
 =?us-ascii?Q?6/LX09joXJTZUPVvQcZArv2AWmtLcCcfYFVVEJ+o2g5+td0jL3DzTOK5K0t2?=
 =?us-ascii?Q?VqAdfltC7+f7am1q+RdlzlrYeYPIEPP35uaD1zKRPV3pgopcrltEsxaUmyxT?=
 =?us-ascii?Q?UjJjMicCKBGXh0SHxR8up6XsUxSqBtlxHpPSOX8/SGd7geaFUQiLwl/YEWon?=
 =?us-ascii?Q?AKul24OR5m/j9HxIagwWvczbakX+o/C7XFPm+6WRxgGYvdBXM3JveHOdcEaX?=
 =?us-ascii?Q?8lsY4ezuXNV8jnsll0Z/S0pbtA6R8NXZ4HLmvoA7u2KhA8wcFktJfPxkPd5w?=
 =?us-ascii?Q?hWgs1WwUSIta/lxJt1w/kC2Y9tKnEvtPpd2Olx1rQ8A=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB4039
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 81fd3a9f-346f-44e3-aff5-08d8a5c5a11e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SU/S+xzdFiPburM18dGDzaOeNb1jMXJdAAyYiBbQbCAhynIUhW1WnU2Qw+qZ4gfahpL1yQtZ1poqEYbp79nunHR0WJTEhyEYmIrhqExNqUbRN3NbbananR9f13p2T6OZhPxdQxwBjL4//TdUksO5RmFCHU9QyN2dVv7l0E5O4F3mhECzOr9t3vo1AruUM49FTS2qihTxVlMRGNnH6ZmO1PGrQHbmy/3k/1/ZHBg4EtHe2oBJLaE5cHn1C7nlMWRSi11obZ5fZMMzmEAO/+/cXJZTxpIWC9hyIVOuhMZy268vxkQaFZn/Bto9KqhL1WqHRlKZTlWVv6EO6p0cFcvNUgJCrphn/F6eNwYWTs6bEDMfLjHGKtrrJ18lItRhVILf0R6ZxbRcU1D1uxg0nZG2qgvily4i26TfeFhVYn1VqHohR3dNLJNWcAlOndwudAzUS0CUGbC5KYAt8e8VQ3WkYgJXjphFlxGneZtrn2//72uHnlG3mx6VMA3GDqe0DDlE
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(55236004)(7696005)(316002)(8676002)(9686003)(54906003)(34020700004)(83380400001)(2906002)(5660300002)(478600001)(8936002)(6506007)(82310400003)(47076004)(86362001)(81166007)(356005)(6916009)(336012)(70586007)(26005)(82740400003)(33656002)(70206006)(36906005)(4326008)(186003)(55016002)(52536014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 15:32:32.0643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b99fbeb2-813a-4a7d-b2c4-08d8a5c5a28d
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4356
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
Cc: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Public

Hi Andrew Geissler,

We have ported many features of openbmc to facebook/yosemitev2 machine and =
the build is verified from the openbmc/master working fine. Could you pleas=
e help us to add the Yosemitev2 machine in the CI build verification. This =
will help us to ensure there are no build break during new patch push.

Regards,
Velu

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
