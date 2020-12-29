Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B302E6DD7
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 06:04:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4j5T5fdrzDqGp
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 16:04:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.120; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=cvyAs4BQ; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=cvyAs4BQ; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310120.outbound.protection.outlook.com [40.107.131.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4j4Q4701zDqFt
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 16:03:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiDHqWMRC4OrXQtPOz/+sasaTaYt14Xcw+pBtSwL1V4=;
 b=cvyAs4BQr6OjunJUhLs9R1/IPplRNz2vP4oaZe8QRxF6tsOnfi3TgFcYzY8z5ZbEdFlVoaHM/2756zChj38eGIYGaSuFXMAxPR3wQmtbVfFxrPmoooBuyl5dizScwvvllarIJjmXdyGbn6La03ABwE/cdWzA+KOvOi/uSwCxFe0=
Received: from SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) by TYZPR04MB4735.apcprd04.prod.outlook.com
 (2603:1096:400:d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Tue, 29 Dec
 2020 05:03:36 +0000
Received: from HK2APC01FT057.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:28:cafe::cc) by SG2PR01CA0165.outlook.office365.com
 (2603:1096:4:28::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 05:03:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; amperemail.onmicrosoft.com; dkim=pass (signature was
 verified) header.d=HCL.COM; amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.52) by
 HK2APC01FT057.mail.protection.outlook.com (10.152.249.93) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 05:03:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYY0JK6TSHZg3EqyJaJF25OFooPvqNFLVknhgCWeN2PT3MDKGvfvoRkDbakWBdr+H5Cwkib3Xt+yNOmNdeQU0h+jf9prs2gaNjxZRRGjme2/MjXRjML6RZRrLcbnw3kFyo/rurXkXWHRQ5WVUY+weuvOgrltuIqe+v6o401uSCvpW0NmWF//n915eHjEXDAnoPUKL7IG//O6L2sDEq6XYBVNM1SERATdmGck//OADP4/uv8+tVc9tIKp2QufqtssZCG9HixO1xXqFkF2vf22D3TLSqIXKGZ4dcu/cPEJQMzMqC4Oxi3lZaGTx7cjqtJlUvmMJdbmOf/0MM7vaxQ/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiDHqWMRC4OrXQtPOz/+sasaTaYt14Xcw+pBtSwL1V4=;
 b=GqgbVDWwKn4DHSFbHrwOEsik+6DdsJUdKpEAlKH4jdCBOJRyhJh1FjtbfQA0w2cjuqTVZ17sOEhs3t9IEXvX+kbRbcHFq8rMT9/BtGiALBRCJmtWtIQtiC5hvmLdmIx4EiIjhJO+++4nWFuzeE8Pn5IEogaKsgh5DV6HITaEzxWr1esCaodU2VXQmgr+2x25mJV/Kesbk/WJr0bdnTzYWhVT831UqQ+DKdHzzhzx8YSxkuXGmfDjaDb90Vd7eOngwv91VgQnKEKDaicVRskvQSEia6fTZCSp7HFvuiFb8S2fEohz5dd4yF+4lZ3L9PtIzkIozsE1+EYAVq1lTOObsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiDHqWMRC4OrXQtPOz/+sasaTaYt14Xcw+pBtSwL1V4=;
 b=cvyAs4BQr6OjunJUhLs9R1/IPplRNz2vP4oaZe8QRxF6tsOnfi3TgFcYzY8z5ZbEdFlVoaHM/2756zChj38eGIYGaSuFXMAxPR3wQmtbVfFxrPmoooBuyl5dizScwvvllarIJjmXdyGbn6La03ABwE/cdWzA+KOvOi/uSwCxFe0=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2380.apcprd04.prod.outlook.com (2603:1096:4:9::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.29; Tue, 29 Dec 2020 05:03:31 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7%6]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 05:03:30 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Sensor Details
Thread-Topic: Sensor Details
Thread-Index: AdbaDHxph6EtzkcRRh2+d9Mr6fB5HAASFIOAANK2HIA=
Date: Tue, 29 Dec 2020 05:03:30 +0000
Message-ID: <SG2PR04MB3093C283277D0E22A69316DEE1D80@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <21370afc-0894-a53d-cc30-0351f507ed13@amperemail.onmicrosoft.com>
In-Reply-To: <21370afc-0894-a53d-cc30-0351f507ed13@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYzdiM2NhY2QtM2M2MS00NGUyLTk1OTgtM2MxNTJkZjBjZGZlIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVk12T1pZMm5hZmFqeFp6OHVRblBHQ21BUWZ1TEZFZGRcL0NKRkRvOURqT240WmRnQUtrM0VXQ3ZOZDRuWnRvUUgifQ==
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: amperemail.onmicrosoft.com; dkim=none
 (message not signed) header.d=none;amperemail.onmicrosoft.com; dmarc=none
 action=none header.from=hcl.com;
x-originating-ip: [2409:4072:490:e706:500d:52ce:3eed:7ffe]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6412a47b-52cf-4745-ce04-08d8abb71866
x-ms-traffictypediagnostic: SG2PR04MB2380:|TYZPR04MB4735:
X-Microsoft-Antispam-PRVS: <TYZPR04MB47350A355F6E82EF26C784F1E1D80@TYZPR04MB4735.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2Va3WBJoII/DqYCZpxsFmWxVTNMweMk20hCEou/cK2FYvLwv+HmtO4ucnv66BlhNmBkaBpKYQew64VNR/ykFpmeyI6TOUvhIlVrqQYMYkOBOitWDjfb6E9/nM3WE8Ih1oGKSWJmTldWm+H5F2qJFBz3FOxSw51A29IV0wMu+77v6Yrzd+HJTJLjRvyopQWaQ/PYRVwN+3k0s490/RqKv7ysvt3YLXOzl28G5/LJA5ImZ1iXiX1j4Nro3WWfEhKq28nNzPFWLoKdvZl+GcgqcIsTCuFPOcSokpzgL18+L2hSCYNQnPaPNNfupFNWga3PVYca6UEwLEou6RiALpx9JSMLqZFqfdWzeZIxOrPRfOBCF1cqfA00fLXCa91bDQ816Nw3nMOlP3VvwDKbnv1WHOg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(6506007)(478600001)(7696005)(9686003)(3480700007)(7116003)(66946007)(76116006)(5660300002)(52536014)(66446008)(8676002)(110136005)(186003)(86362001)(66556008)(66476007)(8936002)(83380400001)(64756008)(53546011)(2906002)(33656002)(55016002)(71200400001)(296002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?V13bkolRGWfk4Oeg0ILtfwtpuSMablWmQE9R4TQ+BxHQbh7/J/6DVs7fv93e?=
 =?us-ascii?Q?XIUl/pJmB3x5uh7rHGo33Vvj72kvueuCRmkqM4MNeZoBTqgHy7jtP9/foNCt?=
 =?us-ascii?Q?0lx8xtZojEIcz5C8KEXjplUuuvZTbqJYfVTnjBuh1gJB17mQMRiVMwxj8J/t?=
 =?us-ascii?Q?tkKb+jjjbCU9Huszfi0lMY4f1AqbIXghTBETmDhqYuciL/ZM9Agz2/6KIyXj?=
 =?us-ascii?Q?snKpVbhJwx5tYnQM62wpTKJ0Gip4s/srka+n870mmbE0r+zHf2ai/mketIHS?=
 =?us-ascii?Q?66mDbx/s0oGNs9guJDQIj3IutKkWH6TPLDp/NZCjgW4r1gQlwo1uwfY7nuet?=
 =?us-ascii?Q?Fk5AXeT0q4v8ivsAhg4rBcTcFMbhv9E3ZSpArCbzI9osbr0bkfRrJQp2QN+1?=
 =?us-ascii?Q?hMAQqUCwUqJ8bYIeQRs2J0/2WBWSiyaAPR9PFn/KLwX7bVAIFUfy6RhryW6O?=
 =?us-ascii?Q?qNpXLQHxv09tUgTW8PAGHzXQ67ueQbvHnn8WlPfVMlV9wEmXW8YT/VkS+dA1?=
 =?us-ascii?Q?xSoEvgigxhDdiYI4ZcmlVCqtt30BRgG4f529p2G5bXseUySNrfd5ujk+t633?=
 =?us-ascii?Q?+DKujlhDGP28DdIdePwzDXSzzFgItoV7cHm+4x1WtYR0+DlSMvhCSydeWu1T?=
 =?us-ascii?Q?6PbKTg0Nsid6tzKQ6rikKPLTkvDxa020otqkPXja1He+PEa9ojur7Y7/XFej?=
 =?us-ascii?Q?LdAgJa+LaFqTEq0WVFyfO0yULzzFHaZHVRhM1qGvBr04k2Q/SreLb2r3LV/v?=
 =?us-ascii?Q?aLTtytzaX7J8PLbdVYjavCOyKwpXk5E6PCEbi7c/wxiCdKTvzIjjNzr3f5JN?=
 =?us-ascii?Q?keXETKA/MKefiDzBlrZSGg2t7VPU4xrIx8fWf1NLsg4AD34pr5Zd7ptJH0Nl?=
 =?us-ascii?Q?+fXfLMdx8YIhOI9HNSTI05p42J5lJ9gZ/2wiN0H2Jd6ICbQXhWhecA/f3L8A?=
 =?us-ascii?Q?LwtegXOfankjQydG8YZ2wi+Dir8rSevWOArMAjxpVHHMPsk4ge94N1hD8Cq3?=
 =?us-ascii?Q?PTTvjo8ZYfBvLOuOPIsII+YFH4BIBVcd/99TGfanIlsFeTI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093C283277D0E22A69316DEE1D80SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2380
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT057.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d054251b-905c-4854-8a2c-08d8abb715f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRDR2rb/z7XMvu540RqjLvL0zQlc9eljXZeKmwIT+H/EZMSNjzpEWhc5ApVJmBBz8JVIxvV3pDY9kPjnXF1tQio1Ul43ynb0jrACbMZc2eP9DYMc0RkS3vqJWNxqyZxQyhRNiSZP1V5maJGR2EODIdBul6B6sujv2e586unnPIhmSkz8KaCxea1SSe5njcy23DOl2gMFLF0j6mRqkcRp/m1TjeLPDVwYBQXc4XFtY2xRpKRtWzVvhAiHpd42Xc5VuH0jy9PT3MWXrtfpx1Ujit3V4BgB+HjCC8S35BTFXP5Jz6i290XVHZF5nGdpiqPDk91QbzBhn1Y/gNdR20VNEtgNnSvC30msQHSvoNZp+bYUj5fZ1Zig7pLjhl+KTn7ueNouIXfbjJg4gOaumr6HHwgT9YY13pK+mR/+kA6Z2dn2EC6cfWJFjUkQQxtIBaJ4p6rQbP2meJ3O56z7d1B3xA==
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966006)(86362001)(47076005)(53546011)(52536014)(8936002)(2906002)(9686003)(70586007)(81166007)(336012)(26005)(33656002)(8676002)(186003)(3480700007)(70206006)(5660300002)(478600001)(82740400003)(7696005)(7116003)(55016002)(82310400003)(356005)(83380400001)(36906005)(296002)(6506007)(316002)(110136005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 05:03:33.8026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6412a47b-52cf-4745-ce04-08d8abb71866
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT057.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4735
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

--_000_SG2PR04MB3093C283277D0E22A69316DEE1D80SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Thanks Thu Nguyen for your response.

From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Sent: Friday, December 25, 2020 5:58 AM
To: Jayashree D <jayashree-d@hcl.com>; openbmc@lists.ozlabs.org
Subject: Re: Sensor Details

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]
On 12/24/20 22:53, Jayashree D wrote:
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

You can create the signal to monitor the properties of the sensor DBus obje=
ct such as the threshold warning/errors.

When there is any event in signal properties the call back function will be=
 called.

Then you can get the detail of sensor event.



Regards,

Thu Nguyen.

--_000_SG2PR04MB3093C283277D0E22A69316DEE1D80SG2PR04MB3093apcp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI \,sans-serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
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
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks Thu Nguyen</spa=
n> <span style=3D"color:#1F497D">
for your response.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Thu=
 Nguyen &lt;thu@amperemail.onmicrosoft.com&gt;
<br>
<b>Sent:</b> Friday, December 25, 2020 5:58 AM<br>
<b>To:</b> Jayashree D &lt;jayashree-d@hcl.com&gt;; openbmc@lists.ozlabs.or=
g<br>
<b>Subject:</b> Re: Sensor Details<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;line-height:12.0pt;background:#FFEB9C">
<span style=3D"font-size:10.0pt;color:red">[CAUTION: This Email is from out=
side the Organization. Unless you trust the sender, Don&#8217;t click links=
 or open attachments as it may be a Phishing email, which can steal your In=
formation and compromise your Computer.]</span><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal">On 12/24/20 22:53, Jayashree D wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><o:p></o:p></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI ,sans-serif&quot;,serif">Is there a way to get the details of sensor=
 events like crossed threshold/fault etc from any other service running on =
bmc (ex. phosphor-led-manager).</span><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI ,sans-serif&quot;,serif">Please provide your inputs/suggestions on t=
his.</span><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:gray">::DISCLAIMER::<o:p></o:p></span></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-serif;color:gr=
ay">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:gray">The contents of this e-mail and any attachm=
ent(s) are confidential and intended for the named recipient(s) only. E-mai=
l transmission is not guaranteed to be secure
 or error-free as information could be intercepted, corrupted, lost, destro=
yed, arrive late or incomplete, or may contain viruses in transmission. The=
 e mail and its contents (with or without referred errors) shall therefore =
not attach any liability on the
 originator or HCL or its affiliates. Views or opinions, if any, presented =
in this email are solely those of the author and may not necessarily reflec=
t the views or opinions of HCL or its affiliates. Any form of reproduction,=
 dissemination, copying, disclosure,
 modification, distribution and / or publication of this message without th=
e prior written consent of authorized representative of HCL is strictly pro=
hibited. If you have received this email in error please delete it and noti=
fy the sender immediately. Before
 opening any email and/or attachments, please check them for viruses and ot=
her defects.<o:p></o:p></span></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-serif;color:gr=
ay">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
</blockquote>
<p>You can create the signal to monitor the properties of the sensor DBus o=
bject such as the threshold warning/errors.<o:p></o:p></p>
<p>When there is any event in signal properties the call back function will=
 be called.<o:p></o:p></p>
<p>Then you can get the detail of sensor event.<o:p></o:p></p>
<p><o:p>&nbsp;</o:p></p>
<p>Regards,<o:p></o:p></p>
<p>Thu Nguyen.<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_SG2PR04MB3093C283277D0E22A69316DEE1D80SG2PR04MB3093apcp_--
