Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C16325F81
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 09:55:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn3Qb0gQpz3ccJ
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 19:55:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=NeGTH6FC;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=NeGTH6FC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febd::711;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector1 header.b=NeGTH6FC; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector1 header.b=NeGTH6FC; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on0711.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::711])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn3QG5jctz3cXv
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 19:55:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl3DszHZZrhHqWbwAycEH7KMVdff6Z0cDyKrGTCs09A=;
 b=NeGTH6FCIcYwwnC8Znb7wl3q046YSl24LeUmUJPrJDveuMrSz7lMgoSZ8CmuJaF6bzosNGTDb0u4Adqg+3L7bcHz5kSIJxkXgv0GCi36HoVB/CqFgfkHfjVFKVEr2f3Ch1dPBYF78LhAEW/yU2iAOITb7a8W5DqS/lKwjYvxphlzvZ2AaVFFWNe+LSI9xgqe+l5g3oNlobFU6DtgdfhhSDDNqDEwA/5nAR4B+JdyLFjujhemFWbXiyxg14EQujMusCUcS0NcAib0fljCN5BMmhHg/ibGqu4aA1NIPDgQ2ZxWo4mTydn+eizjDqO26i2nUN6zxWSRnNu4ODMzXyLJLw==
Received: from SG2P153CA0021.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::8) by
 PSAPR04MB4311.apcprd04.prod.outlook.com (2603:1096:301:2b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20; Fri, 26 Feb 2021 08:55:09 +0000
Received: from SG2APC01FT050.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c7:cafe::b4) by SG2P153CA0021.outlook.office365.com
 (2603:1096:4:c7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2 via Frontend
 Transport; Fri, 26 Feb 2021 08:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.51) by
 SG2APC01FT050.mail.protection.outlook.com (10.152.251.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 08:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcmLzcdDVWnTcSbdzR4I5e4FCi4ztwejrBPwGUSUKl8PBsArpAeR0/w2E+cU0PT+emJGMLIqeHooSiZ3T6JjWX/b08EkLQM7w8wZpPzHqSpYzNs72oi0LCY/3sMNadMWG9eRCM4yt0gXc6eqor34JFbmm2plHzIvgw5vANcRmJTxf7HO17mOQSZnrFB0YR7jCCTL6OpllLGEj9306hNPJXGLuZXGCA+bo2P+MBJESVb1TtnneUURJW0FXqN0Od0/AH83pJNt+k4ABsBQ2MgJmB2c0sjbpbKE/zqj+tMwcEyKOQFDil2I30gr7lxH+Rxbzb/ayQZOSZtyynQHq7QBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl3DszHZZrhHqWbwAycEH7KMVdff6Z0cDyKrGTCs09A=;
 b=JsEzs4U+AKR2FlE6+nwiTee2iGpeSZFdzJ+CwDeNwzeiFDj4Q3VR0yJRNYX/XJ5Og9qbfjDc+R/AjhmlGuUCMpTJOriLsfIebOyxV9JyaaBb4KGd2BNSdNGRNtvAjZ//CZTYMSt51RrfgEgSE3t+axs86vB5lu11TD6HFBPBRnlscYEjpQfzm/Ik5pmaJxVU6O+3ol0x7FizXQYwNEvyWTELMQPY2wIt9M6pg5TS/kUyHg5mo8NTRs9oBMGyqA9xOJreHQ2Kpm9Y4BsJyDr/6t/TdjW1rdGA8sO7rLK4rBzYx9LaeDKmC855OxpLJDMMDgQ5wH+kWz19/Zo9qWYYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl3DszHZZrhHqWbwAycEH7KMVdff6Z0cDyKrGTCs09A=;
 b=NeGTH6FCIcYwwnC8Znb7wl3q046YSl24LeUmUJPrJDveuMrSz7lMgoSZ8CmuJaF6bzosNGTDb0u4Adqg+3L7bcHz5kSIJxkXgv0GCi36HoVB/CqFgfkHfjVFKVEr2f3Ch1dPBYF78LhAEW/yU2iAOITb7a8W5DqS/lKwjYvxphlzvZ2AaVFFWNe+LSI9xgqe+l5g3oNlobFU6DtgdfhhSDDNqDEwA/5nAR4B+JdyLFjujhemFWbXiyxg14EQujMusCUcS0NcAib0fljCN5BMmhHg/ibGqu4aA1NIPDgQ2ZxWo4mTydn+eizjDqO26i2nUN6zxWSRnNu4ODMzXyLJLw==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2490.apcprd04.prod.outlook.com (2603:1096:4:b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28; Fri, 26 Feb 2021 08:55:05 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049%3]) with mapi id 15.20.3890.021; Fri, 26 Feb 2021
 08:55:05 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATg==
Date: Fri, 26 Feb 2021 08:55:05 +0000
Message-ID: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMmM1Mzc4MjYtYjU3MC00NWQyLWExMzMtMmY3Y2M1OTlkMjczIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InpFXC9BaG1XZ01cL2dyZ3M4RFQ1dmtMMnNPRmJFb3Y4QzRLdFBzeFRRcDVhXC8yT0NySWEyOXpSQlN0d0tWSmVxeEYifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.46.97.197]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 70d12c28-3a0c-4051-5900-08d8da343801
x-ms-traffictypediagnostic: SG2PR04MB2490:|PSAPR04MB4311:
X-Microsoft-Antispam-PRVS: <PSAPR04MB4311109B307DF945509D4C45E19D9@PSAPR04MB4311.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ew/wGvSlSrbEVYBnONcV1v7hhQmIamtxKOrt3bHuUz3XtdMMLWE7X9hWrbykUUY4vPWe3Pr5oE1ZPohh9xPDUJD48w4OngsbPl881iNMEAMfARclWvXu2/kr/kAvn/3MKwFjH9KkFhuOPEtcXibLHqnLdD4/4YabYPd3WNJ2HcosvK8on6I9WdS2qLOYB5DaeWBFbD+lukSD0qviPbyyIEw/e37UMblLjtj8irdMi/eLXTWwHVlncFaBb1xlF01+uaaqgOlyzDmI08PcQD7nBMDkmiNVoUyxvmiGMwmLu52dU+5s+bOcpFhmAr07dm+WahtrvelePvCmGLLHRJmXYwI6GSvUvoBqz2ZGnA0GGcEI/OI9JpQTloX9Y3lqyooTH/E+NSw71eICX3Z3a/gXvO/X54gqyKsCsDxifwS1e1yzZBgHcxPn/iycw1g9IkaFBOiRFSqtFtcJplOxgnmXo61dO7Bi2y9ZxrS1MRb88w1kgjvK1xWeth0hGXIudwqZvbPk0Bit2seasUQoOKEfqXnS1rcBlrf/NggUah360RBEDjtvI8OyvviWU5bKa6t3SMybF+PHcju1L9rYzdUQqlvZ+Tysot3C9aAo0dOO5e0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(316002)(7696005)(83380400001)(66556008)(86362001)(66946007)(8936002)(64756008)(66476007)(6916009)(9686003)(166002)(478600001)(76116006)(66446008)(8676002)(6506007)(71200400001)(26005)(5660300002)(55016002)(186003)(33656002)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?RDAV2I+l7UFo8jDh88GRBBRlZhI+Jeg9AQKIWnbYys2qNhmKaigDin72w/Od?=
 =?us-ascii?Q?hHngccEY5Rzf/9QrqIwowA+wp2UuC5T0xogVYkr84X51BXMWetMP0nxdeLYs?=
 =?us-ascii?Q?rwiC1VW6Jjt+2Rtbk2EK3iQ93Qc3meIpbKcCmGF71nTGwj4aUbnmiNNZKrIi?=
 =?us-ascii?Q?oPCL9GoO4tkxnKNcRoNp/mfhSv4LQ2BSV+lD4qoIw06ZKPVH5G8SMhYQBjgy?=
 =?us-ascii?Q?3l55JepeXZSGvxi94nhF2YFPrzLrqmG5yWvMAZ+OhwEuXQy/qIUjoDygjmvd?=
 =?us-ascii?Q?JdiZHmxMzDPceEiQxYhdBi15QPn5C9Fj4IUYZNM/4RGN9kU3bjaDI7qoU+wU?=
 =?us-ascii?Q?C8zo7OiAK3Bx1yKDJVNH31cy5hpDcRQEqYTwDr3f7IqkfzkD35fzwCXIW/EM?=
 =?us-ascii?Q?TZnSaQmAeJ1ngPSZjmNR4bS+nAyGFm+kROKnY6QsOwlOgIpXTsihq3WHoffb?=
 =?us-ascii?Q?MgLfe4NuqJFMDGpdrvY9Ni2TkisjJ14a25YlCKojy3n2RRHxHd2H1NTyfGXD?=
 =?us-ascii?Q?Kr277amIXSMStubuduX8QZmqtNSvgzAhF2KAkwlDFZ+F35ECdsOxvmvINy+T?=
 =?us-ascii?Q?ikq+YauthoXCH6HVlD/4GR+G/tNRV2o+BeE/iyIrEOvbdSoZv92xp2QLucRB?=
 =?us-ascii?Q?t5pNauPnl6Hyo60C43CAWOuO4bu4sBluEQOtjwScIf7DPKQS/UeMKEp0TTgi?=
 =?us-ascii?Q?S7ju+9tdRYOI8Nz2vXkIQ9AqgZ0U6/8C7GAIKfmwNI46jmTCGqkZRbgRcPQW?=
 =?us-ascii?Q?25V+4sU4zQFFhCoDv+1sIdP4jIC8V0Xv1VK8ZU6fkQpQuD8IFyrf0ajSe6+q?=
 =?us-ascii?Q?cGg5coilGkQPxVVb304qYtOk+RbPDASSxPOYsu2a0WEx4NH/izaPULgpy9of?=
 =?us-ascii?Q?unDjY1G1Hj5gxvww1RxBXuzPZNTxcCamwtshOujGd/fa5PsDe6kkpJLjcwxf?=
 =?us-ascii?Q?Ln8z/uX+YnNbh9j0OZBMb1KdnYKYaJtwsSOLRZS039paRTKbb4ghu6E+6FgW?=
 =?us-ascii?Q?V3nZkK+zBOcM43XgQoOdl5egdJ6Ngxy09FjnNFkJzjhkTbTWRT0i7w/ts/O9?=
 =?us-ascii?Q?yX7KmRrPHp7wR4LV+FgPPPAcvMcoqr5VGwLbIxf7qc6Q3dXtHDSf1krbX7GI?=
 =?us-ascii?Q?ECQOFUuZ8uBZ170cjTYi0xDqaNApOQqjxy9UMbSK+nZ0Pm61H0h8SCCaxLZ7?=
 =?us-ascii?Q?tLXKIeuCeqPAzhBgWW73EC88wJ2Rl6IFEaf8KSM6mpR+vYTg2252mwy6IDLh?=
 =?us-ascii?Q?EfgnyyqIlNDFXi9jBg7LXQPanDhwxoAd7qD4b4uugtMZQJRs+rcCHO8VPDNg?=
 =?us-ascii?Q?Njg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30939CC20F08C50A7031DBA5E19D9SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2490
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ddec50df-314d-49df-1b17-08d8da343668
X-MS-Exchange-MinimumUrlDomainAge: github.com#4889
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBBb7iatSUpISVj2j1cxA3LmeUgTjhSiJ1QOjSwYX/V74xd0wBRxVjmz3tB5NAO0VhUytvwNgn4veq+Ya3i04EW/7sg5vFZbpcjqFfFxJ+KoK2kErZxotzSrKy1jLL//moGNrCCjMYrMHc1WBU+kESTBUVjg6UM8WmgsCtP4woLGzma/WbomC2+2f6SgUSZIo8ry0VorhcfOwnGnKH3fmGaUlH8kliX8Le7W/lJyJPjkMUE0JXdCl3jJ63+LD2P+tRiAUOHlC6HNDtgVkVc2nC01WfFoRZmU15+t45H+jZG7aVCJKGLcPLcWnNnc92Gh6haAvM2Zs4Lwrs4+aVCAPwtsXMH5D0Lz7qVO9GuZ5LxyqQsf72mZ8/WYaltjxr0M/DLVIF3f57H+KhIcEohA1Dqhh7BJnfWlBpfXnlkF82WlG2EL3OVdmPBMAG9waaWuD6t2U8Gm+6MluH4d2REiHUaKpl2Ww6vdsT6hMIaqDmsxiWEIMxevtoQOJNmUqkh5PdXnI8lBmn9mpia6WoVDZ/L31hQzJQBy180nXc0CV6PRoYWTMidaErLjZiLTxlbSz/+iiG1ccdzmANxAuCpOVGKzk52R6+kYvysZjNGpi3QI7daDp+zD4yYVJ0QSRJlKWT3KFYL3R42P4U8HGHU7XjHHlsqP3L0GflY5lbt7OWxu3AP1wnncHVuQqCyJME9T+tb+vfob5HnN295YXGVWVNVAOwSK0htCTvCI+xXJTcjFV8EnBp7VXu9zrOpEz/5K1xlxHTaxVDwcTu9fsgcOKDZdXA4CaRP14zVITsSLRqM=
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(55016002)(356005)(6916009)(316002)(81166007)(6506007)(9686003)(82310400003)(83380400001)(34020700004)(47076005)(478600001)(7696005)(36906005)(86362001)(186003)(26005)(166002)(8676002)(82740400003)(2906002)(33656002)(52536014)(70206006)(70586007)(336012)(36860700001)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 08:55:07.9664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d12c28-3a0c-4051-5900-08d8da343801
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4311
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

--_000_SG2PR04MB30939CC20F08C50A7031DBA5E19D9SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi Team,

Recently, I have tested sensors for tiogapass, in which one sensor returns =
negative value.
After analysing the code in the dbus-sensors repo, I found the following is=
sue.

dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors (github.com)<h=
ttps://github.com/openbmc/dbus-sensors/blob/master/src/IpmbSensor.cpp#L267>

From the above link, We need only below line in the code to process the HSC=
 sensors value for tiogapass.

int16_t value =3D ((data[4] << 8) | data[3]);

Since the below logic is added, the values get shifted and getting negative=
 values as output.

constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
value <<=3D shift;
value >>=3D shift;

Could you please suggest any idea to resolve this issue.

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

--_000_SG2PR04MB30939CC20F08C50A7031DBA5E19D9SG2PR04MB3093apcp_
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
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Recently, I have tested sensors for tiogapass, in wh=
ich one sensor returns negative value.<o:p></o:p></p>
<p class=3D"MsoNormal">After analysing the code in the dbus-sensors repo, I=
 found the following issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/dbus-sensors/b=
lob/master/src/IpmbSensor.cpp#L267">dbus-sensors/IpmbSensor.cpp at master &=
middot; openbmc/dbus-sensors (github.com)</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From the above link, We need only below line in the =
code to process the HSC sensors value for tiogapass.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">int16_t value =3D ((data[4] &lt;&lt; 8) | data[3]);<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since the below logic is added, the values get shift=
ed and getting negative values as output.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">constexpr const size_t shift =3D 16 - 11; // 11bit i=
nto 16bit<o:p></o:p></p>
<p class=3D"MsoNormal">value &lt;&lt;=3D shift;<o:p></o:p></p>
<p class=3D"MsoNormal">value &gt;&gt;=3D shift;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you please suggest any idea to resolve this is=
sue.<o:p></o:p></p>
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

--_000_SG2PR04MB30939CC20F08C50A7031DBA5E19D9SG2PR04MB3093apcp_--
