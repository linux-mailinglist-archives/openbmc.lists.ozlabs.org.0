Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED42D4615
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 16:57:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrhWV0mBHzDqCX
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 02:57:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.127; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=QHQ5UUn1; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=QHQ5UUn1; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320127.outbound.protection.outlook.com [40.107.132.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrhV56QM9zDqQ3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 02:55:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYWL2U+qD9Hh9JamddFdI/eCSOHar7ZucdDuEpj0Q0Y=;
 b=QHQ5UUn1zlBaPTIqGFbKn1lEk0fkG1NWn5mFo+boJof3wneG3MpsRajXt1L/ZQttH5FtTuBPz6/AKbXuwwfQkTUoGfCEu6683g5BsB9HAullSp+nwI7Ts1Ncqkl7xQS9IVK0Z6w2XEW5AN9bDC6MQs18F1SIK6ywnKhc/5y/q0o=
Received: from SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) by
 PS1PR0401MB1994.apcprd04.prod.outlook.com (2603:1096:803:e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Wed, 9 Dec 2020 15:55:44 +0000
Received: from SG2APC01FT112.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:91:cafe::68) by SG2PR03CA0109.outlook.office365.com
 (2603:1096:4:91::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Wed, 9 Dec 2020 15:55:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT112.mail.protection.outlook.com (10.152.250.201) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 15:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOQdqtfGra/VCbE5R5sFNqZxfivoWmlKjwelNNEysD7Fx65t97de1eZBigwnJbP7PMJd+ggfoHJP+N5eTGrdjkg5UQITRFLexoA+m+/x9sPg1yqHRecC5X+2r8GR+/DzRbgm6TipCZtQ40vvKE9g/oos8FNtnP/xl0y7vBMCpl+gDIOOKmzHe/Sj5jsLhevs2hBMb31Jk0VoZDgTpD3leI4JjGUWGf2UjZFFClyhSYOAR2nwSDvMMA+UKpJEvvhRHL05GsuSffZqXXU0hdggSwQS9kbGvDBiynyo1sDM0KkPBBGjbiTJTBR8QZeEWpeVavwURvVsRkzJDW3HFtYsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYWL2U+qD9Hh9JamddFdI/eCSOHar7ZucdDuEpj0Q0Y=;
 b=MBVD73tYE7TIOqM43jQuilW40PkjqWxhwc+NeYk+9jBsA3QDtqTMRuRDqN19XB/paNT124hUJNk60Cf1kNUVNwgDLlaZwRpQ8YoWwkqfVy/tu3mh+HUD5MaKnY0pd2SDQZMHF59EBCrihqhX75a16orsFZls0h7sqclfUPLarqEq4GtlV+XTV1hthuSoH03QGPyabNpTpuKGL855xymS9Is8WJIuitd9tnDsV+Slz2R5kcIDH3MNpOZF5MCK6kHYgbvfoM7KkD8BqnOGMcXDV9VvDEl0bPbYz/7W7ECS0uqlaEM5QAIdfCafCZfNRJYKkeRWlpeJf5YWg7LatSGuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYWL2U+qD9Hh9JamddFdI/eCSOHar7ZucdDuEpj0Q0Y=;
 b=QHQ5UUn1zlBaPTIqGFbKn1lEk0fkG1NWn5mFo+boJof3wneG3MpsRajXt1L/ZQttH5FtTuBPz6/AKbXuwwfQkTUoGfCEu6683g5BsB9HAullSp+nwI7Ts1Ncqkl7xQS9IVK0Z6w2XEW5AN9bDC6MQs18F1SIK6ywnKhc/5y/q0o=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2282.apcprd04.prod.outlook.com (2603:1096:4:4::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.19; Wed, 9 Dec 2020 15:55:40 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7%6]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 15:55:40 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC CI issue
Thread-Topic: OpenBMC CI issue
Thread-Index: AdbOQijcgMJXhLj5TyShFF+Wii8oLQ==
Date: Wed, 9 Dec 2020 15:55:39 +0000
Message-ID: <SG2PR04MB30931460C39D06F730C2DD29E1CC0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYzM1ZTIyYTQtYmEzYS00YzBiLWI0MzMtODZlYWI4ZmFmMjYzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiM0ozUFpJbDFGbGRZUko4VFgzRlNIRlNZdHFLaDZVZGlleVNFNWQwXC9LdzZoREtrK2o1bTlzUWtBXC9uN3dlTlwvbSJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.46.114.86]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b82b0287-c334-4e0f-1369-08d89c5ae30b
x-ms-traffictypediagnostic: SG2PR04MB2282:|PS1PR0401MB1994:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS1PR0401MB19946C9C7AD4929321D348BBE1CC0@PS1PR0401MB1994.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: huj63w1YgCrOxNiFcMSNo6PBgRItKLyiHFBFkJmMEXGT0a9F16U+C5sZSf7xxwfKrjV3IVzGeOvZlfp/ofIabMb4MM0nGreJlQsofeIdMIfoI3ybW3nXKuz51tkPZu1cvGwuL65syu4Qcq8czowiXaj+jWsn7jUWLHVgBDJt5DvXJtJlJC4yYwjSowl09B0BwUP/kre38TtDxvpKftNTSuBtc3usofN+X2bPTAfu+eYj7kYStS3cftTU+3qEa6cbv59Q/676czj9ndeXpKJJ9ILrr08OjOg6Svkeb+IPTJjaWzrKKzRm0ND4XTTkP7k28fSlZaBhYATOqoL8iTpnGA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(83380400001)(186003)(5660300002)(7696005)(33656002)(71200400001)(6916009)(86362001)(52536014)(4326008)(8936002)(3480700007)(54906003)(508600001)(26005)(6506007)(66446008)(76116006)(2906002)(9686003)(55016002)(64756008)(8676002)(7116003)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UUJpWXZMMlRTQXFEODhYYTBKelFnRkdobEhZbTBNN1BPOTljKzJ3bjFKR3lB?=
 =?utf-8?B?UjdVdTFRNFNZZjZMQW1GbW05bWdYYlhLYnV0RFpBbWp3ZFVTTnJKRU9TWXhu?=
 =?utf-8?B?U0FtVDQ3cUs2eVFkcGxXTVZWZ2JPMU9BRDd3MW1vckxKMUxENWMzd2NUalZT?=
 =?utf-8?B?VmtaYzVFdUpZWWV3VjJOVmxETkNEdlUyRURlSXJSZUFpZE0zRk92NTRWRlJ1?=
 =?utf-8?B?a0E4UUlaL2JGUXpsRExOaGhOUzhrVFRueFQ1YXE0SEdVTldoMWMxb0pPWWE1?=
 =?utf-8?B?UzF1U2NDcmN0OHhrMW5YYm1rb2JtWHdHRmJVRWxkSVVNYW9Lb1ZUZDY2OXEv?=
 =?utf-8?B?WnhVTE1CTFFvOWEvYmVLRjRzcWoyMTI1dWFCMml6c0l3N1NZdXFMOUwrWGVw?=
 =?utf-8?B?bjA3RTVFOFYwY2psVlZhM3RqYi9WdzFJVWYzanc2OXNRUFRFaGV5VHd5d0Zy?=
 =?utf-8?B?S0tLTFZJdUJzVDBoWUdlQVFQUVBIbXV4SXUvUlkzYkZFN1djZ0NkMC95Mitl?=
 =?utf-8?B?VDlnMUxyZkdJMi9BMmpWY0hnWG5OM0Q4Rk1ScnI4SENRL2EvcXg4aUFoQWdz?=
 =?utf-8?B?bWN4UGQ2aTJaSUxhK05nc2ZtMzFyMlZlMHV2WlBFd3FNaUtoVEZUZHo0WTNR?=
 =?utf-8?B?UFVYaStuNFIvYUI1ZTVvdE1DeGl3dnhmNmxCNy9Jc09HK0VnamVaTFpKbXBB?=
 =?utf-8?B?NmNxdmJuTVBXc3RaWEtxNmJobUFSRW9kbmswSVlVb0RIRUpESDMraTQwbndC?=
 =?utf-8?B?VGF3alJtbkpIT2V2c0JuZVpFNzUxUXFPdzF6V3o2ekhkUVZXZ09aOHNWYmNj?=
 =?utf-8?B?Y1ZvY2JHak15R0E3amVUN0hYcEFsanVEOEhhVXhhSGN5ZEpvUGZvZjR5MHJO?=
 =?utf-8?B?OXpoSnpLSFZOR0RaUEZkOUNTVDZQc2hQaFJEYVUyQlB3ZUVvVDBvSzVmNVd6?=
 =?utf-8?B?T1I1d3EzOW5rTFM0UlUrbU9TOUE5UjJUUnRnaXpucVhCKzVNM3FZMG9lWDl4?=
 =?utf-8?B?VVN5RTNoeUdTR0NPckpoQjZwNUJUY3pFTEdVZHR4amlNTmJ0VVdiUW5uTWZs?=
 =?utf-8?B?MGFUQXpselJhT2piT1FRUmN5NEcwMlNRLzFXejZSN25RZnhEbFZVaGpzNmtT?=
 =?utf-8?B?ZjQ1aVNrTGkwc3M2eEJSb1Bra1p4cGloSXBlK1E2WFdKUS85TG1EMFZ3N2h6?=
 =?utf-8?B?N2xRdTJ1RVl0eHB3eThTNmJOOHhUK2FyTFl1RmRsci9VdlNpcTQ0Z0lIelBy?=
 =?utf-8?B?VlRINEx3azZURWJqMFUyL1N3YkZuaHdwdVBDdS9lejhaa0dIZ1FqSDNTZnNP?=
 =?utf-8?Q?ulS1Q1ZAtoS4c=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30931460C39D06F730C2DD29E1CC0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2282
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT112.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12c04e28-1a91-46c0-799b-08d89c5ae0b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: loYTm4B0gztEGheUJOBMrgfQUUTfGN0oJdBZ+qKL3vkWFJBQU1BB44cKM5SP8KMzR080pS4P8AsFJz96Tz6yC5obgcfMCcubyMQKZbFPWQGBdfW3/KaoSxds7gR5JIRQT374l0vbN48m9s/48GR/OlIzqJ6jHqhwIvqsGNowg7PhK4RbRrbkC+mpzMn8xS0sYWFd/dstb6LG/Kz6AKkZpLDAN6l2zszWs6IQANPQiwbN7PMaYmjMQEg8FrnTjwmy32AkQ1R1jQPnt18CSP5TniVfRz9G1CEGQrWajKR29B89WMLKS01/9s+78yD5z63oFDY0y3sApAUYS+ikisR3sxKL8jijce+5BSgxGTJ/YFD/PI45KeqdgKWCr0DUi1LUkh+9qkrHe0wZ7LTK6Hql7g==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(46966005)(7116003)(6916009)(508600001)(3480700007)(55016002)(6506007)(82310400003)(81166007)(8676002)(26005)(356005)(2906002)(7696005)(186003)(8936002)(33964004)(36906005)(4326008)(70586007)(54906003)(5660300002)(83380400001)(52536014)(336012)(33656002)(9686003)(86362001)(47076004)(70206006);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 15:55:43.7711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b82b0287-c334-4e0f-1369-08d89c5ae30b
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT112.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB1994
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
 Manikandan E <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB30931460C39D06F730C2DD29E1CC0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2xhc3NpZmljYXRpb246IEludGVybmFsDQoNCkhpIFRlYW0sDQoNCkkgYW0gZ2V0dGluZyB0aGUg
Zm9sbG93aW5nIGVycm9yIGluIEdlcnJpdCBPcGVuQk1DIENJIGlzc3Vlcy4gUGxlYXNlIHByb3Zp
ZGUgc29tZSBpbnB1dHMvc3VnZ2VzdGlvbnMgb24gdGhpcy4NCg0KL3Vzci9sb2NhbC9pbmNsdWRl
L2Jvb3N0L2FzaW8vZXhlY3V0aW9uL2FueV9leGVjdXRvci5ocHA6IEluIHN0YXRpYyBtZW1iZXIg
ZnVuY3Rpb24gw6LigqzLnHN0YXRpYyBjb25zdCBzdGQ6OnR5cGVfaW5mbyYgYm9vc3Q6OmFzaW86
OmV4ZWN1dGlvbjo6ZGV0YWlsOjphbnlfZXhlY3V0b3JfYmFzZTo6dGFyZ2V0X3R5cGVfdm9pZCgp
w6LigqzihKI6DQovdXNyL2xvY2FsL2luY2x1ZGUvYm9vc3QvYXNpby9leGVjdXRpb24vYW55X2V4
ZWN1dG9yLmhwcDo4MTE6MjM6IGVycm9yOiBjYW5ub3QgdXNlIMOi4oKsy5x0eXBlaWTDouKCrOKE
oiB3aXRoIMOi4oKsy5wtZm5vLXJ0dGnDouKCrOKEog0KICA4MTEgfCAgICAgcmV0dXJuIHR5cGVp
ZCh2b2lkKTsNCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF4NCi91c3IvbG9jYWwvaW5j
bHVkZS9ib29zdC9hc2lvL2V4ZWN1dGlvbi9hbnlfZXhlY3V0b3IuaHBwOiBJbiBzdGF0aWMgbWVt
YmVyIGZ1bmN0aW9uIMOi4oKsy5xzdGF0aWMgY29uc3Qgc3RkOjp0eXBlX2luZm8mIGJvb3N0Ojph
c2lvOjpleGVjdXRpb246OmRldGFpbDo6YW55X2V4ZWN1dG9yX2Jhc2U6OnRhcmdldF90eXBlX2V4
KCnDouKCrOKEojoNCi91c3IvbG9jYWwvaW5jbHVkZS9ib29zdC9hc2lvL2V4ZWN1dGlvbi9hbnlf
ZXhlY3V0b3IuaHBwOjg1MToyMTogZXJyb3I6IGNhbm5vdCB1c2Ugw6LigqzLnHR5cGVpZMOi4oKs
4oSiIHdpdGggw6LigqzLnC1mbm8tcnR0acOi4oKs4oSiDQogIDg1MSB8ICAgICByZXR1cm4gdHlw
ZWlkKEV4KTsNCg0KUmVnYXJkcywNCkpheWFzaHJlZQ0KOjpESVNDTEFJTUVSOjoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQpUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5k
IGFueSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUg
bmFtZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJh
bnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUg
aW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBp
bmNvbXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUg
bWFpbCBhbmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBz
aGFsbCB0aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9y
IG9yIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJl
c2VudGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBt
YXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBv
ciBpdHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9u
LCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBv
ciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBj
b25zZW50IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNl
IGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVu
aW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2
aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3RzLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCg==

--_000_SG2PR04MB30931460C39D06F730C2DD29E1CC0SG2PR04MB3093apcp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcN
Cgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJy
aSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21z
by1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46
MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRT
ZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVk
ZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0t
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0K
PG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+
PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIg
dmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEyLjBwdCI+Q2xhc3NpZmljYXRpb246IDxi
PjxzcGFuIHN0eWxlPSJjb2xvcjojMDgyOThBIj5JbnRlcm5hbDwvc3Bhbj48L2I+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMi4wcHQiPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkg
VGVhbSwgPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgYW0gZ2V0dGluZyB0aGUgZm9sbG93aW5n
IGVycm9yIGluIEdlcnJpdCBPcGVuQk1DIENJIGlzc3Vlcy4gUGxlYXNlIHByb3ZpZGUgc29tZSBp
bnB1dHMvc3VnZ2VzdGlvbnMgb24gdGhpcy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+L3Vzci9s
b2NhbC9pbmNsdWRlL2Jvb3N0L2FzaW8vZXhlY3V0aW9uL2FueV9leGVjdXRvci5ocHA6IEluIHN0
YXRpYyBtZW1iZXIgZnVuY3Rpb24gw6LigqzLnHN0YXRpYyBjb25zdCBzdGQ6OnR5cGVfaW5mbyZh
bXA7IGJvb3N0Ojphc2lvOjpleGVjdXRpb246OmRldGFpbDo6YW55X2V4ZWN1dG9yX2Jhc2U6OnRh
cmdldF90eXBlX3ZvaWQoKcOi4oKs4oSiOjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+L3Vzci9sb2NhbC9pbmNsdWRlL2Jvb3N0L2FzaW8vZXhlY3V0aW9uL2FueV9leGVjdXRv
ci5ocHA6ODExOjIzOiBlcnJvcjogY2Fubm90IHVzZSDDouKCrMucdHlwZWlkw6LigqzihKIgd2l0
aCDDouKCrMucLWZuby1ydHRpw6LigqzihKI8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPiZuYnNwOyA4MTEgfCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gdHlwZWlk
KHZvaWQpOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgXjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+L3Vzci9sb2NhbC9pbmNsdWRlL2Jvb3N0L2FzaW8vZXhlY3V0
aW9uL2FueV9leGVjdXRvci5ocHA6IEluIHN0YXRpYyBtZW1iZXIgZnVuY3Rpb24gw6LigqzLnHN0
YXRpYyBjb25zdCBzdGQ6OnR5cGVfaW5mbyZhbXA7IGJvb3N0Ojphc2lvOjpleGVjdXRpb246OmRl
dGFpbDo6YW55X2V4ZWN1dG9yX2Jhc2U6OnRhcmdldF90eXBlX2V4KCnDouKCrOKEojo8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi91c3IvbG9jYWwvaW5jbHVkZS9ib29zdC9h
c2lvL2V4ZWN1dGlvbi9hbnlfZXhlY3V0b3IuaHBwOjg1MToyMTogZXJyb3I6IGNhbm5vdCB1c2Ug
w6LigqzLnHR5cGVpZMOi4oKs4oSiIHdpdGggw6LigqzLnC1mbm8tcnR0acOi4oKs4oSiPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsgODUxIHwmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgcmV0dXJuIHR5cGVpZChFeCk7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlJl
Z2FyZHMsPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5KYXlhc2hyZWU8bzpw
PjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGZvbnQgZmFjZT0iQXJpYWwiIGNvbG9yPSJHcmF5IiBzaXpl
PSIxIj46OkRJU0NMQUlNRVI6Ojxicj4NCjxocj4NClRoZSBjb250ZW50cyBvZiB0aGlzIGUtbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnQocykgYXJlIGNvbmZpZGVudGlhbCBhbmQgaW50ZW5kZWQgZm9y
IHRoZSBuYW1lZCByZWNpcGllbnQocykgb25seS4gRS1tYWlsIHRyYW5zbWlzc2lvbiBpcyBub3Qg
Z3VhcmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3ItZnJlZSBhcyBpbmZvcm1hdGlvbiBjb3Vs
ZCBiZSBpbnRlcmNlcHRlZCwgY29ycnVwdGVkLCBsb3N0LCBkZXN0cm95ZWQsIGFycml2ZSBsYXRl
IG9yDQogaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24u
IFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVy
cm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3Jp
Z2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBh
bnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkNCiB0aG9zZSBvZiB0aGUgYXV0
aG9yIGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25z
IG9mIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNz
ZW1pbmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlv
biBhbmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Ig
d3JpdHRlbiBjb25zZW50DQogb2YgYXV0aG9yaXplZCByZXByZXNlbnRhdGl2ZSBvZiBIQ0wgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBl
cnJvciBwbGVhc2UgZGVsZXRlIGl0IGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseS4g
QmVmb3JlIG9wZW5pbmcgYW55IGVtYWlsIGFuZC9vciBhdHRhY2htZW50cywgcGxlYXNlIGNoZWNr
IHRoZW0gZm9yIHZpcnVzZXMgYW5kIG90aGVyIGRlZmVjdHMuPGJyPg0KPGhyPg0KPC9mb250Pg0K
PC9ib2R5Pg0KPC9odG1sPg0K

--_000_SG2PR04MB30931460C39D06F730C2DD29E1CC0SG2PR04MB3093apcp_--
