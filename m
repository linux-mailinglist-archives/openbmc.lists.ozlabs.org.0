Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 428102F278D
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 06:10:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFJYz1jTzzDqyl
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 16:10:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.107; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=To3S1rEv; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=To3S1rEv; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300107.outbound.protection.outlook.com [40.107.130.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFJXW6rTczDqvT
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 16:09:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkfkCso9sIQClDrRZiZVMPUS6AKuNN5UMdAtVwIqC8g=;
 b=To3S1rEvu34/sW8SWLuZ4zwIlMU+U3+t1PpSYtkAFiOLdv60eivY4JDLvgVVsFDhsGeyfQBXBw9duTVFSnnOBriMuE53aihAnn1GGdwCLFIVXTjzmv88evywSKtfO68LX1UlZG4ctUXh9nuJWEUc+PLHozgP/aM9RLeVTUkXJ58=
Received: from SG2PR06CA0191.apcprd06.prod.outlook.com (2603:1096:4:1::23) by
 KL1PR0401MB4436.apcprd04.prod.outlook.com (2603:1096:820:31::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 05:09:18 +0000
Received: from HK2APC01FT018.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:1:cafe::a2) by SG2PR06CA0191.outlook.office365.com
 (2603:1096:4:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 05:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; gmail.com; dkim=pass (signature was verified)
 header.d=HCL.COM;gmail.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.53) by
 HK2APC01FT018.mail.protection.outlook.com (10.152.248.183) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 05:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFAVMZXQNirxerf4eh2G+SMQh9wKOKjRWi5JznudGx/D62jiaCo8MCEVYLI49S2urxq3SQXqa4H/PEskcRdZCyer+bTJ2n+5RHguK2B5iX19MPqjmvsi0QsdS3hm17mAI5o9Ugb8kOHHKwAmbVjAFAR9M4nFSMo3rFWMv3ycK5tPmRHN3yAQU+jM5csO+zH4XmJs9Ii5PW4cuPzq2+wGbNUeoAd6xkLlBNDfbe6fFLisQ2F6/pRpgLIi5/6A08FgyQ4QXzFh3S6/CQAVTqnD6gAmiKWm1XGLeE9Pn1RW/6/De65edZ/WvbAuZiUDsCfHjWOajkjc6iQ3H+wMj6jbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkfkCso9sIQClDrRZiZVMPUS6AKuNN5UMdAtVwIqC8g=;
 b=M6MLv4swJn9lVo3EPNiCS4fxT5ZB6ZO5b0lwMUvV2LWnrfnrcTYrnP4Do9Q79O8mjOxsKYPPpo3FlzoMHfpEhy3VIRbPaeMIcsTuYYXpvKfjKwAcuitsAJ+1nYBn34nrBBAJXoFsJsnR48vhYFxWw9zjbSi8aLD4VCvYO8gTRzxDgbYPyqf1n+IgMD9JPm8Qk9IRrzyvc/qmgjvhJuPmbxFN9iHR5rEjUxWF92dRW2KGppt3r/C9fuMZq+DmDXYxD+DyS8oEQh6GvqGelH2b7S72H1vOAb36f7nOd7epgSoRbU7aaDMicaDV5ppfMpOHJmnnOkOCJhycWidg0hxegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkfkCso9sIQClDrRZiZVMPUS6AKuNN5UMdAtVwIqC8g=;
 b=To3S1rEvu34/sW8SWLuZ4zwIlMU+U3+t1PpSYtkAFiOLdv60eivY4JDLvgVVsFDhsGeyfQBXBw9duTVFSnnOBriMuE53aihAnn1GGdwCLFIVXTjzmv88evywSKtfO68LX1UlZG4ctUXh9nuJWEUc+PLHozgP/aM9RLeVTUkXJ58=
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com (2603:1096:803:2d::14)
 by PSAPR04MB4742.apcprd04.prod.outlook.com (2603:1096:301:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 05:09:15 +0000
Received: from PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::d872:8da1:f83c:947e]) by PU1PR04MB2248.apcprd04.prod.outlook.com
 ([fe80::d872:8da1:f83c:947e%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 05:09:15 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: RE: CI build for yosemitev2
Thread-Topic: CI build for yosemitev2
Thread-Index: AdbXrZNZbSyzw1j/SGC/V1p6jAc/hAKiyMIAAZnz+eA=
Date: Tue, 12 Jan 2021 05:09:15 +0000
Message-ID: <PU1PR04MB22483D0A65A9A2632000C043A7AA0@PU1PR04MB2248.apcprd04.prod.outlook.com>
References: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
In-Reply-To: <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZTY3NTlkNmUtODM0NS00NjU0LWE0MDgtYjMwOTA3MjcyOTNkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ijd2aWMwMWFCQU5HTGNnYWtSQXRLc3l2bmxFQjRcL3hUYStyVTQxdnU5THFsc0daRWJCeWxLMjFsY01ra2ZaTFVSIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2401:4900:1731:9a4c:fc49:d0f3:2146:4dad]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bab2e6fe-8b3b-4600-949c-08d8b6b83704
x-ms-traffictypediagnostic: PSAPR04MB4742:|KL1PR0401MB4436:
X-Microsoft-Antispam-PRVS: <KL1PR0401MB44367C4B0C4634C36AC4680DA7AA0@KL1PR0401MB4436.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WT8uIYpNWmg5H0vvoOqqkYnwtyde+cTepzO5mdC+1b728i8q91Ia3q+sMiATfYVd7BMJvi6umufghwKy/H9sv47H5IT+vTBuGy4em7Uxsrtx/lZIWUPPux5SF+lSWfB1R5eexn+NMqcoKjzi3c7YS45FTIuJjxS7YozXvv7VWqiZ3q9O5ce6N7w+NvjDTrl/PpNMMBShthPuqswhfJLOr7yEuoQ1nWrBxsLtJmiHccJW8URU4IzUwm4OZoND8Fo8EFLIt5mq54busQq/LFjW15lNvUq2JzJTXZKmr5hHktD406/dCXVHY57M9qzqbKwlu19MJY3AFZ7QIAwa713/o4cEj6Qopg50OkKLaCczmWZuKa9VOIPVSPNk6IXta/SBZuHC3Uook4NoxJPjkOT/YVj18FJmkyxYEZhLbXapLqQTBfT/q4p0x3NzuJZYYFrKn+O1KGlKXOEl/XS3R/14/g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PU1PR04MB2248.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(9686003)(186003)(8936002)(6506007)(53546011)(5660300002)(6916009)(8676002)(4326008)(52536014)(2906002)(316002)(66556008)(55016002)(83380400001)(33656002)(478600001)(86362001)(66446008)(76116006)(54906003)(7696005)(64756008)(66946007)(966005)(71200400001)(66476007)(166002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?AFA3uliG0FS0tt3YgUpJvKbLUiestU8vQYoekdPt2Nm2hKtzk3LC/Hb2VnY3?=
 =?us-ascii?Q?A3Z+Kmbcj197uvVNg+IVvJYq8s8GRYrv6CFrKtFqAh+simAlOSye47fRv8nX?=
 =?us-ascii?Q?HpSIIzyzw/Wju56U3ZZsnsGIO9vtoerxVjrWCgG86HWQjYXc68KSs3MAga7+?=
 =?us-ascii?Q?8nz8RAMWCHycFUoGWyP18HgZodDxbasKFMTvtvCfzn6XsDHOKorrmr1B1m5F?=
 =?us-ascii?Q?m1do3YXgCTvAOcCZ9KZwg6NpRcfrHJheu40ZRkW06N9pryilK84BrrkZ/NVg?=
 =?us-ascii?Q?L4K4eet/GyOlGsNeQFFOswdHcsy9Ye/fLYnHghilFJ+LjafWQ/kP+HYAgCbF?=
 =?us-ascii?Q?eOEDFo5Id3xf1jX13Z8kU816kdfhjO0z28jBmWnYlqpGqvYn84ye5dPiJBRI?=
 =?us-ascii?Q?PW1DQEbBSvSzHRnKofDO3chFxjZgvZA7VkuK0ZqT0QGQ0mQKEclizoBEmCRH?=
 =?us-ascii?Q?nA75NWdHnFlT0XO0pySEn0b/6x/4r76EXjInEunzOEfriNJpiA/vB8wWfs3P?=
 =?us-ascii?Q?uaN1l7YKZafu+5tZKxJGcML8RbwV8gtvZ+rAnwJWgvb6X23D+ZyRpwWW9jth?=
 =?us-ascii?Q?5XdI5hw8G1nkl5yWylIp2SsaJatPafGNNNEIQc8ZuO75Hjbkd1zCAB8AmQby?=
 =?us-ascii?Q?8QdVrzC0tTPNMofHRH5xR9exdYiioqzVdvYTZOrAl2461t8gxLaZIYovsitr?=
 =?us-ascii?Q?zG804LM34yABy5A0JMASRj/YT5xzfhq8m3nf8X1JnV1IHE7ZpuA7jIY9A41h?=
 =?us-ascii?Q?ytKkNdRC2bz2r0QZT5TD1OpRvnWYioqWz2FRDFb9bGtUrTasHW9n6+5Lg4Xg?=
 =?us-ascii?Q?plWOZ8OLLYJwx54tDvzAIa08XLYDcdZmviet2l0vJdF92kNuTDDXLbDabCdV?=
 =?us-ascii?Q?8IX3r/Vy8Jo8RGt3+XDqqBpdfgnj/iOIsnaAIj5XUDCxWwYWhIvr5gvhByAB?=
 =?us-ascii?Q?vT1TgVchozaTHoX4MllYBp8TVVYgqhGmgp6mg1eyxtBm2izWIXyyM7ubN5H+?=
 =?us-ascii?Q?cmnRM7bWxvxnVnnqWlmi8Kbw8Lv0ukaMgsn0IZICXUMuipI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PU1PR04MB22483D0A65A9A2632000C043A7AA0PU1PR04MB2248apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4742
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: be6afefd-5d62-4596-99d0-08d8b6b83528
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vX8G/wvAQayYEeAwvBR9OXvIk4OoNI6XsLh/NFQvAu7VQsPxwEb1Qd2fYMNnui0toQcWlNgs0L+R/6IW35SvtH01SLAbPCKxESq5weSzthdsM0EToCplGvAtIy85DgIKZUIJn2RVc343UQ/jiMrudgm3QEIC+hA9Wc6T+aIDpyqgQdKGdocfXkVjVjUQRDiLnXJ34Sgp4WH8nViLykxKfeLjrn+ns5GEAS1evweN9GVWyJY+oGuZobTARq/nXp7idEucpiYtrCrgSAA+yCBO3Sw9eT1o5Fsl0ZlsBx8fYhS1vUhV0gRBp37TFQ4dL4staMZuqlOZURIZsHabFWglRd4S6Ju9Igz7cEfZjQnUjLaj8k21WDCWB7g+I5QUzydFwQS6sxUJjo6CVqQ3J11QFTGpZFZoNPbz9TudVY2ld2Nh4nPzQ+KV3b4OPSDct/p7Fd3a9fIEubkFtW1d+vDV4qsr9VyIZUNAy1wk+oEuBh9aAQyGY7cidRRArESMOE02Z3hqJdpFgTBOzpEcM/HsByZcUTrFV4z64mM9gXfLsfIvvBqRBMgwVKK9uw8eJKUR
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(55016002)(54906003)(478600001)(33656002)(47076005)(5660300002)(7696005)(166002)(356005)(966005)(9686003)(83380400001)(70586007)(8676002)(70206006)(186003)(82740400003)(81166007)(82310400003)(4326008)(34020700004)(6916009)(53546011)(6506007)(36906005)(52536014)(45080400002)(26005)(336012)(2906002)(8936002)(316002)(86362001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 05:09:17.9206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab2e6fe-8b3b-4600-949c-08d8b6b83704
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4436
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PU1PR04MB22483D0A65A9A2632000C043A7AA0PU1PR04MB2248apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Andrew,

Thanks for your response. I am working on the hardware CI for yosemitev2 an=
d will keep you posted.

Can we enable build failure gating for yosemitev2 (not hardware CI) in the =
current system. Sometimes the new gerrit merges may cause build breaks to t=
he YosemiteV2 machine.

Regards,
Velu

From: Andrew Geissler <geissonator@gmail.com>
Sent: Monday, January 4, 2021 6:57 AM
To: Velumani T-ERS,HCLTech <velumanit@hcl.com>
Cc: openbmc@lists.ozlabs.org; Patrick Williams <patrickw3@fb.com>; Sai Dasa=
ri <sdasari@fb.com>; bradleyb@fuzziesquirrel.com
Subject: Re: CI build for yosemitev2

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]



On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech <velumanit@hcl.com<mail=
to:velumanit@hcl.com>> wrote:

Classification: Public

Hi Andrew Geissler,

We have ported many features of openbmc to facebook/yosemitev2 machine and =
the build is verified from the openbmc/master working fine. Could you pleas=
e help us to add the Yosemitev2 machine in the CI build verification. This =
will help us to ensure there are no build break during new patch push.

Hi Velumani, glad to see a new system added to openbmc!

Getting a new system into CI doesn't have the most defined process but
I think in general it has to fall under one of these due to our constraints
in compute power for CI[1]:

1) Propose an existing system in CI to replace (and the benefits of that)
2) Donate a jenkins compute node to openbmc CI
3) Convince the community that your system provides additional meta-*
    layer coverage (or some other critical benefit) that would be worth
    the additional hit to the existing CI infrastructure.

You could also look into hosting your own jenkins which builds
and scores the gerrit reviews. See this wiki for more info:
https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hardware-Continu=
ous-Integration<https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fwiki%2FAdding-a-System-to-Hardwar=
e-Continuous-Integration&data=3D04%7C01%7Cvelumanit%40hcl.com%7C7fe9662c2ab=
64877f21808d8b04fdbbd%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C63745320=
4330453150%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D%2Fv6lgngN6gN6YNCpwwlP9UE0U3YcXj6=
Q1t7KpYnY08M%3D&reserved=3D0>

[1]: https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgro=
up#current-infrastructure<https://apc01.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fwiki%2FOpenBMC-Infrastr=
ucture-Workgroup%23current-infrastructure&data=3D04%7C01%7Cvelumanit%40hcl.=
com%7C7fe9662c2ab64877f21808d8b04fdbbd%7C189de737c93a4f5a8b686f4ca9941912%7=
C0%7C0%7C637453204330453150%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D5xLzvnySyLNyGZzb=
1Ws1BvC0RzYF1QidXZLRngxzGys%3D&reserved=3D0>

Andrew



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

--_000_PU1PR04MB22483D0A65A9A2632000C043A7AA0PU1PR04MB2248apcp_
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
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Hi Andrew,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Thanks for your response. I am workin=
g on the hardware CI for yosemitev2 and will keep you posted.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Can we enable build failure gating fo=
r yosemitev2 (not hardware CI) in the current system. Sometimes the new ger=
rit merges may cause build breaks to the YosemiteV2
 machine.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Velu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</spa=
n></b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-=
serif"> Andrew Geissler &lt;geissonator@gmail.com&gt;
<br>
<b>Sent:</b> Monday, January 4, 2021 6:57 AM<br>
<b>To:</b> Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org; Patrick Williams &lt;patrickw3@fb.com&=
gt;; Sai Dasari &lt;sdasari@fb.com&gt;; bradleyb@fuzziesquirrel.com<br>
<b>Subject:</b> Re: CI build for yosemitev2<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;line-height:12.0pt;background:#FFEB9C">
<span style=3D"font-size:10.0pt;color:red">[CAUTION: This Email is from out=
side the Organization. Unless you trust the sender, Don&#8217;t click links=
 or open attachments as it may be a Phishing email, which can steal your In=
formation and compromise your Computer.]</span><o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech =
&lt;<a href=3D"mailto:velumanit@hcl.com">velumanit@hcl.com</a>&gt; wrote:<o=
:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Classification: Public<br>
<br>
Hi Andrew Geissler,<br>
<br>
We have ported many features of openbmc to facebook/yosemitev2 machine and =
the build is verified from the openbmc/master working fine. Could you pleas=
e help us to add the Yosemitev2 machine in the CI build verification. This =
will help us to ensure there are
 no build break during new patch push.<o:p></o:p></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Hi Velumani, glad to see a new system added to openb=
mc!<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Getting a new system into CI doesn&#8217;t have the =
most defined process but<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I think in general it has to fall under one of these=
 due to our constraints<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">in compute power for CI[1]:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">1) Propose an existing system in CI to replace (and =
the benefits of that)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">2) Donate a jenkins compute node to openbmc CI<o:p><=
/o:p></p>
</div>
<div>
<p class=3D"MsoNormal">3) Convince the community that your system provides =
additional meta-*<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp; layer coverage (or some other critical=
 benefit) that would be worth<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp; &nbsp; the additional hit to the existing CI =
infrastructure.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">You could also look into hosting your own jenkins wh=
ich builds<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">and scores the gerrit reviews. See this wiki for mor=
e info:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://apc01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fwiki%2FAdding-a=
-System-to-Hardware-Continuous-Integration&amp;data=3D04%7C01%7Cvelumanit%4=
0hcl.com%7C7fe9662c2ab64877f21808d8b04fdbbd%7C189de737c93a4f5a8b686f4ca9941=
912%7C0%7C0%7C637453204330453150%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2Fv6lg=
ngN6gN6YNCpwwlP9UE0U3YcXj6Q1t7KpYnY08M%3D&amp;reserved=3D0">https://github.=
com/openbmc/openbmc/wiki/Adding-a-System-to-Hardware-Continuous-Integration=
</a>&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">[1]:&nbsp;<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fwiki%=
2FOpenBMC-Infrastructure-Workgroup%23current-infrastructure&amp;data=3D04%7=
C01%7Cvelumanit%40hcl.com%7C7fe9662c2ab64877f21808d8b04fdbbd%7C189de737c93a=
4f5a8b686f4ca9941912%7C0%7C0%7C637453204330453150%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D5xLzvnySyLNyGZzb1Ws1BvC0RzYF1QidXZLRngxzGys%3D&amp;reserved=3D0">=
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#cu=
rrent-infrastructure</a>&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Andrew<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<div>
<p class=3D"MsoNormal"><br>
Regards,<br>
Velu<o:p></o:p></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_PU1PR04MB22483D0A65A9A2632000C043A7AA0PU1PR04MB2248apcp_--
