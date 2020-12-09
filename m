Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7512D4638
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 17:01:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crhcc5NL2zDqfH
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 03:01:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.120; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=fJnTI0s7; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=fJnTI0s7; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320120.outbound.protection.outlook.com [40.107.132.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crhbg5441zDqCX
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 03:00:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcEsAIkIQMPwoG75jiskjyui4DwkSQYOI8hFEmbhlbo=;
 b=fJnTI0s7G7hloYrTSgaNwKbrgEEpbQ6aq7XA6PWjxGz3i6S54UPIn/uCJHPMFiKkQzg+Aaj539v9J7J26+9IYaxVtZCZ3C4pXmfbFubzxqYxnnR8omi5fl8pXHodQqApzW27B/paixuAw3GsgqQSi6yzGahKjhJFdY6R2R9p/Hw=
Received: from SG2PR0601CA0003.apcprd06.prod.outlook.com (2603:1096:3::13) by
 SG2PR04MB2522.apcprd04.prod.outlook.com (2603:1096:4:6::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Wed, 9 Dec 2020 16:00:39 +0000
Received: from SG2APC01FT064.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:0:cafe::2d) by SG2PR0601CA0003.outlook.office365.com
 (2603:1096:3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 16:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT064.mail.protection.outlook.com (10.152.251.229) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 16:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfqISF8ATz2ucwUGKctCvsv4ssYqirNhhinxyp/+bk3BlR5NfTqBxJ0hG4nu8uRVlG/diWQw516g2pH7O/QBf1Nbzkilce8rHgpA89i1JLMBsgmtVYsIcl6s/bhRC8y1WfmmHRmAZuAbuvSX5m0yzc06q+Eao7eSSMMnMbHgXH607Nue2igEPbSA3ZtIKgRnOxOV5wJISWJfgBZT3sWlcBGtS4gXa9FjOwu6K7zdanEbAZ7JY3vLGLcbHxLWVQNAasxI0rIH0G8yr///DTQNXQmNvnJxYSMjYuhjp4+s8pPk3/csIt4sGvRe6AEiQbPpXtVsc3pG2WUHVzr/Je22nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcEsAIkIQMPwoG75jiskjyui4DwkSQYOI8hFEmbhlbo=;
 b=l2SstiJyCZpzPnhTdRwzO/0rPZ1imwR3VjbzyvdYRIvR9H318N3YhIygRDonb9p0iHWNenS8nqEYtJKBGwkkLdZa8t5ebxATZqOHjasNKnDk7Y8CaaDYQXxsMSf9SLKS3sWq0TWdX887BZsKRdpPPLipBdqxYq3M1uQJg9LJ+lX2tZ8ftV5+dR5JxbBjyCdtuIhsP2tPfiLTj0TooZYHz7BZei6JbeM3H/715QiQtxFt7atiUEeNY5DL6Lz7jUbj8OED0nbwDVM0vdsvQpdrwvmCNJVoOb/s+12AiPxjJ7oxMWfEF24ts9kVWWkdDN0utr0Gtja5ozq1JBG/vR4MRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcEsAIkIQMPwoG75jiskjyui4DwkSQYOI8hFEmbhlbo=;
 b=fJnTI0s7G7hloYrTSgaNwKbrgEEpbQ6aq7XA6PWjxGz3i6S54UPIn/uCJHPMFiKkQzg+Aaj539v9J7J26+9IYaxVtZCZ3C4pXmfbFubzxqYxnnR8omi5fl8pXHodQqApzW27B/paixuAw3GsgqQSi6yzGahKjhJFdY6R2R9p/Hw=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3272.apcprd04.prod.outlook.com (2603:1096:4:78::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.19; Wed, 9 Dec 2020 16:00:35 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::48c:6edc:45ad:ebe7%6]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 16:00:35 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC CI issue
Thread-Topic: OpenBMC CI issue
Thread-Index: AdbORDpRs9vGkIo8RZG4Z9F8b+GSWQ==
Date: Wed, 9 Dec 2020 16:00:35 +0000
Message-ID: <SG2PR04MB3093F18D320A5361E75D7EC5E1CC0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMDgwYzY3OTUtNmRhMC00NGZkLWI1NjctNTkwNDQ2NDczZmU2IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlVKMVMyOWtOUWZIRzIrWERvR1ZOVDF6QlUySGpOXC9LTFI2Vlk2XC9KbnVtcmFSZnNwR3EzWXlNWXpFVjF4VHpLZCJ9
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.46.114.86]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 53165be3-f17e-4d12-50eb-08d89c5b929c
x-ms-traffictypediagnostic: SG2PR04MB3272:|SG2PR04MB2522:
X-Microsoft-Antispam-PRVS: <SG2PR04MB25227B18D7292AE304A4A93DE1CC0@SG2PR04MB2522.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: usscc9SPmlLIn+IQa1e7In4nDgqD0hbQ92/r1TnQaRmworjxnxDzHKmd8vM1/qdVx++lkAy13T37z1cdYAhXNFliZkJCZAB9AIDtPvq4hBlLcIPVAgxEJGuVFw36IIgHg4fBRDi3ye5sFHnjrwe2+nL0Wh7xHoxyFhtQKOx84zsmMogE9IQAk7G+1fPFraCXPihBWQmjbnXrG9K0fFfMzJaMmjPdSZrRCPKQQPyqvIoGSX7iJaKTRPDOIsrhnpN9304lrLBerW4SfHoMD5YjIE8HnCZu5PCSpnMdy4j4w0jDntZwmlMhwiimD1C7JlQDNnlyuYdnJyXFFAsxOhGQyQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(52536014)(66476007)(66556008)(55016002)(508600001)(8676002)(8936002)(9686003)(186003)(71200400001)(76116006)(7696005)(66946007)(6916009)(5660300002)(64756008)(7116003)(86362001)(66446008)(26005)(6506007)(33656002)(3480700007)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?S2FCOEFBckJTQ3k3TmNQTXJUa1U4OFlxUHN2SW1PaVJsaVJQaDN3a0k5Vzh6?=
 =?utf-8?B?VVIvbFBaaU90aHJPWFZMQ01Qc3dEK29TK01oUEhVOCsxbW1iYmNKTGVncm9N?=
 =?utf-8?B?VEdXbTVtVEVtMVRjYmNPaStVNFdQSXc5ajZBUmNHL1dQQzB2Mlh4TEt3em9T?=
 =?utf-8?B?eTc5Wjc0SGlNT2o1MFd1QXZrOWROZWQ5N0ZmQ1Rza045SVlWZDFhUk5GdGZV?=
 =?utf-8?B?TmhKbW51TUxyTUQ2aTRNMjFVd2QraEZRTWlyeXN3ZDdnNjNqblZ4bTZKMjNP?=
 =?utf-8?B?NzVYaXA5M3kxNzM3aEpzbjdHRHMycHFnWFB4Tjhka0tkaWd4a3FEcTJnV0x3?=
 =?utf-8?B?SXg5RFRMaUlGYll2N1pMbkp3dFFsTkhUNXpuV080OUNIUm1ZcTRRYjE5QlBm?=
 =?utf-8?B?NU5qY3BSd2YzL3U2Q2pRZ0ZXT2JOQ3dkVGJTd2JSZ3hxM2tGb3NBaFFneWRY?=
 =?utf-8?B?WGNGdXNSS2tjai8zT2h6a3VrNzVDWU9yNU9xalZLK3p3cUova3RXZWtyalZG?=
 =?utf-8?B?VENSci9sYjBzSXI5VUhmcUxPRkpZdXZxdi8wcjByQlhkdTNaZmxDc2RGV3ZU?=
 =?utf-8?B?dlFYWEJHUS9NT3NuZTE1cUJsZ0JaZGticm9sbEtNWmFuVk80dmg1aEpxaFEy?=
 =?utf-8?B?MUxOb2E4UWt5UFRMcE85NmQrYTJyaG8rTFo3NzJXRUxISTRsR0dudTNZOWIy?=
 =?utf-8?B?RFY0d1MvVWNqZEtYd2FVU05CRkZrM3Zhb3BreDJkK2w2cFZEaGI1S2RiQ2Nz?=
 =?utf-8?B?UGFHUm5SbWIrR3dNdUlvbmhFVVdHdnBPUFpRV1czS0Rtb0ZhaTlFU1FGTzht?=
 =?utf-8?B?M05idlZZSkFFT1dlUHRPNUhHeDBWZkI2T2FSWVhuZDN3Wms0eDh1WmhrMkhY?=
 =?utf-8?B?M2hWdmRBNFFHQjErL3dCYXVrSGFldTNXSlQyUzdYeThjNmhBSXVYYXl1RTJO?=
 =?utf-8?B?Ri9VdnUzUzA5UVZHOFhaRXd0NUVEV2N2RnI4VlBpeFV5TUtCdWJ0QTlkWkJ4?=
 =?utf-8?B?eS9hUFREYk9pazNFMERxMW9heWZRY1lGb3FabWdsbkZ2WlRCUjB2ZEtZQmQv?=
 =?utf-8?B?Q1pXOXZXWk9BUWIzbW5udGlFbUNzMVBXRWI5MjVYRTE0ZmdnYW9NRkdSdUFQ?=
 =?utf-8?B?L0hXZlg5RlVlTlQ3S0ZtRDIweE9jSVRGSnNzSk5uK1dSSjBOUVN1NXMvM0lP?=
 =?utf-8?B?MVJwQ0hQYzVRN1gxQlFvaUFISmNOR3BxVzA0OXFmS0Z6elJ1aGtIOU05Kysr?=
 =?utf-8?B?Y2oycDdiMk9ialM0L1BvUHN5bHBZN2NMRW5wOFo3Wk9CcnBvdUkyY2lNdjgv?=
 =?utf-8?Q?iOBh7jYCsgDYs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093F18D320A5361E75D7EC5E1CC0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3272
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT064.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 87e9ecab-2cbd-49e0-7b21-08d89c5b90b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9KzvQHxx1ollBwdlnVGm+LabO17EBLkME1NF0a62xKeg3oirKqoD1LXLzYhE/xGFmtOHlNsgdnID7+nM8NIqn87zDERu5Hu2QhyQagreZmRwXzR6Mj6YsCZScRK23JM3wRk37jCrJcwA+YL8TVjhzpupAcrdEWRljOKLRxiHXnjBbxW0JziteadDbZ5ZVAVl1gVAbiadTkmZ3RkkZLpR4uyf1FIO2S8917D7ZzK7UPC1hJxg6IJHjZ/x4XPN1vf4DFsTasbwq6ArCdcpa6xWmpp7ki2i+ffGZd+ciVUCWfgAuUw+DJFCu3gJv+mmJ6YfZ69Q848ptoavJeTj/IsbTtB69CD5Vv8X6bK/4qAJT/WO/ApW089rOPKw1GkeMMuftHkCjpJQLj8OKu7e1PIZXg==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(46966005)(70586007)(33964004)(81166007)(508600001)(82310400003)(55016002)(186003)(70206006)(9686003)(7116003)(336012)(8676002)(356005)(3480700007)(7696005)(6916009)(52536014)(8936002)(47076004)(2906002)(5660300002)(26005)(36906005)(6506007)(86362001)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 16:00:38.2862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53165be3-f17e-4d12-50eb-08d89c5b929c
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT064.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2522
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

--_000_SG2PR04MB3093F18D320A5361E75D7EC5E1CC0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2xhc3NpZmljYXRpb246IFB1YmxpYw0KSGkgVGVhbSwNCg0KSSBhbSBnZXR0aW5nIHRoZSBmb2xs
b3dpbmcgZXJyb3IgaW4gR2Vycml0IE9wZW5CTUMgQ0kgaXNzdWVzLiBQbGVhc2UgcHJvdmlkZSBz
b21lIGlucHV0cy9zdWdnZXN0aW9ucyBvbiB0aGlzLg0KDQovdXNyL2xvY2FsL2luY2x1ZGUvYm9v
c3QvYXNpby9leGVjdXRpb24vYW55X2V4ZWN1dG9yLmhwcDogSW4gc3RhdGljIG1lbWJlciBmdW5j
dGlvbiDDouKCrMucc3RhdGljIGNvbnN0IHN0ZDo6dHlwZV9pbmZvJiBib29zdDo6YXNpbzo6ZXhl
Y3V0aW9uOjpkZXRhaWw6OmFueV9leGVjdXRvcl9iYXNlOjp0YXJnZXRfdHlwZV92b2lkKCnDouKC
rOKEojoNCi91c3IvbG9jYWwvaW5jbHVkZS9ib29zdC9hc2lvL2V4ZWN1dGlvbi9hbnlfZXhlY3V0
b3IuaHBwOjgxMToyMzogZXJyb3I6IGNhbm5vdCB1c2Ugw6LigqzLnHR5cGVpZMOi4oKs4oSiIHdp
dGggw6LigqzLnC1mbm8tcnR0acOi4oKs4oSiDQogIDgxMSB8ICAgICByZXR1cm4gdHlwZWlkKHZv
aWQpOw0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXg0KL3Vzci9sb2NhbC9pbmNsdWRl
L2Jvb3N0L2FzaW8vZXhlY3V0aW9uL2FueV9leGVjdXRvci5ocHA6IEluIHN0YXRpYyBtZW1iZXIg
ZnVuY3Rpb24gw6LigqzLnHN0YXRpYyBjb25zdCBzdGQ6OnR5cGVfaW5mbyYgYm9vc3Q6OmFzaW86
OmV4ZWN1dGlvbjo6ZGV0YWlsOjphbnlfZXhlY3V0b3JfYmFzZTo6dGFyZ2V0X3R5cGVfZXgoKcOi
4oKs4oSiOg0KL3Vzci9sb2NhbC9pbmNsdWRlL2Jvb3N0L2FzaW8vZXhlY3V0aW9uL2FueV9leGVj
dXRvci5ocHA6ODUxOjIxOiBlcnJvcjogY2Fubm90IHVzZSDDouKCrMucdHlwZWlkw6LigqzihKIg
d2l0aCDDouKCrMucLWZuby1ydHRpw6LigqzihKINCiAgODUxIHwgICAgIHJldHVybiB0eXBlaWQo
RXgpOw0KDQpSZWdhcmRzLA0KSmF5YXNocmVlDQoNCg0KOjpESVNDTEFJTUVSOjoNCl9fX19fX19f
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

--_000_SG2PR04MB3093F18D320A5361E75D7EC5E1CC0SG2PR04MB3093apcp_
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
PjxzcGFuIHN0eWxlPSJjb2xvcjpncmVlbiI+UHVibGljPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjBwdCI+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+SGkgVGVhbSwgPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgYW0gZ2V0dGluZyB0aGUg
Zm9sbG93aW5nIGVycm9yIGluIEdlcnJpdCBPcGVuQk1DIENJIGlzc3Vlcy4gUGxlYXNlIHByb3Zp
ZGUgc29tZSBpbnB1dHMvc3VnZ2VzdGlvbnMgb24gdGhpcy48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+L3Vzci9sb2NhbC9pbmNsdWRlL2Jvb3N0L2FzaW8vZXhlY3V0aW9uL2FueV9leGVjdXRvci5o
cHA6IEluIHN0YXRpYyBtZW1iZXIgZnVuY3Rpb24gw6LigqzLnHN0YXRpYyBjb25zdCBzdGQ6OnR5
cGVfaW5mbyZhbXA7IGJvb3N0Ojphc2lvOjpleGVjdXRpb246OmRldGFpbDo6YW55X2V4ZWN1dG9y
X2Jhc2U6OnRhcmdldF90eXBlX3ZvaWQoKcOi4oKs4oSiOjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+L3Vzci9sb2NhbC9pbmNsdWRlL2Jvb3N0L2FzaW8vZXhlY3V0aW9uL2Fu
eV9leGVjdXRvci5ocHA6ODExOjIzOiBlcnJvcjogY2Fubm90IHVzZSDDouKCrMucdHlwZWlkw6Li
gqzihKIgd2l0aCDDouKCrMucLWZuby1ydHRpw6LigqzihKI8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZuYnNwOyA4MTEgfCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1
cm4gdHlwZWlkKHZvaWQpOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgXjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+L3Vzci9sb2NhbC9pbmNsdWRlL2Jvb3N0L2Fz
aW8vZXhlY3V0aW9uL2FueV9leGVjdXRvci5ocHA6IEluIHN0YXRpYyBtZW1iZXIgZnVuY3Rpb24g
w6LigqzLnHN0YXRpYyBjb25zdCBzdGQ6OnR5cGVfaW5mbyZhbXA7IGJvb3N0Ojphc2lvOjpleGVj
dXRpb246OmRldGFpbDo6YW55X2V4ZWN1dG9yX2Jhc2U6OnRhcmdldF90eXBlX2V4KCnDouKCrOKE
ojo8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi91c3IvbG9jYWwvaW5jbHVk
ZS9ib29zdC9hc2lvL2V4ZWN1dGlvbi9hbnlfZXhlY3V0b3IuaHBwOjg1MToyMTogZXJyb3I6IGNh
bm5vdCB1c2Ugw6LigqzLnHR5cGVpZMOi4oKs4oSiIHdpdGggw6LigqzLnC1mbm8tcnR0acOi4oKs
4oSiPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsgODUxIHwmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIHR5cGVpZChFeCk7PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPlJlZ2FyZHMsPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5KYXlh
c2hyZWU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rp
dj4NCjxmb250IGZhY2U9IkFyaWFsIiBjb2xvcj0iR3JheSIgc2l6ZT0iMSI+OjpESVNDTEFJTUVS
Ojo8YnI+DQo8aHI+DQpUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2ht
ZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQgcmVjaXBp
ZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUg
c2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJjZXB0ZWQs
IGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvcg0KIGluY29tcGxldGUs
IG9yIG1heSBjb250YWluIHZpcnVzZXMgaW4gdHJhbnNtaXNzaW9uLiBUaGUgZSBtYWlsIGFuZCBp
dHMgY29udGVudHMgKHdpdGggb3Igd2l0aG91dCByZWZlcnJlZCBlcnJvcnMpIHNoYWxsIHRoZXJl
Zm9yZSBub3QgYXR0YWNoIGFueSBsaWFiaWxpdHkgb24gdGhlIG9yaWdpbmF0b3Igb3IgSENMIG9y
IGl0cyBhZmZpbGlhdGVzLiBWaWV3cyBvciBvcGluaW9ucywgaWYgYW55LCBwcmVzZW50ZWQgaW4g
dGhpcyBlbWFpbCBhcmUgc29sZWx5DQogdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBu
ZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFm
ZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWlu
ZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGlj
YXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudA0K
IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0
ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFu
eSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2Vz
IGFuZCBvdGhlciBkZWZlY3RzLjxicj4NCjxocj4NCjwvZm9udD4NCjwvYm9keT4NCjwvaHRtbD4N
Cg==

--_000_SG2PR04MB3093F18D320A5361E75D7EC5E1CC0SG2PR04MB3093apcp_--
