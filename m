Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056833EAA0
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 08:39:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0hqp1RDRz3bcf
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 18:39:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=sJbiQf9p;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=sJbiQf9p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.120; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=sJbiQf9p; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=sJbiQf9p; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300120.outbound.protection.outlook.com [40.107.130.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0hqT51gjz2y07
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 18:38:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTcA79Y7y47c0sJM6ULVULlxk62Fb5iciNWJhvpJX8g=;
 b=sJbiQf9pElgFzP70P/1iYyJ6YBM362N+GBISfUd3oTEUqDucUbIQQC/Mtkah54ghWZ6vFwBluFxdDta/1f8WpatnWe/urHeE5p5AN4eFqY3oeBLe4hzUW2lIuTMc5/B+8IIXZklJisNZp1jtvjOlKywTvgd+LX/S6T0voS3CRkitFNCoYro8bSLxM0Gs+RnK8CrtFg/kXacMkxiBDxZSPaQ1S3hQfZcI4p85vLHqjBqFKgV+2k7WuZyBJ/BOO5ScRWSVQaDIf2g0Bndz3SN4NjKxehenqM/qifjoplvK9FKxCDLF9OBDR/+0YZxeRBKwcCR5TDi4fyy1YJOEQf6u2A==
Received: from PSAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:301:19::17)
 by TY2PR04MB3677.apcprd04.prod.outlook.com (2603:1096:404:fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 07:38:39 +0000
Received: from PU1APC01FT018.eop-APC01.prod.protection.outlook.com
 (2603:1096:301:19:cafe::57) by PSAPR03CA0012.outlook.office365.com
 (2603:1096:301:19::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Wed, 17 Mar 2021 07:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT018.mail.protection.outlook.com (10.152.253.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 07:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxsZ0shqrwsxmheqRllWzFv2fDG5DyjP1P2EKcI7DZvC1PQu9aLSZup4mfHLSFSVeR0Qbh2NLoTaKxgCmNva13J+UG8tWbxmtNwy9lu5+dtcnR5NSNdHPu0dkZ3PGymeFxIyVgcDXBpWDrIkZOAnK7GVKUGfHbR/reH1/BcM5SJhKX2ztdRKlqAv27OcuvFQKN77qFh8140PF8eikMlorhalpEvrzQ0S+1oy34aunWVZ/NgAhvTP0kqGHJ5V+R4zqNpzqQNN/3FyzEDZa3mkCUk2dccglsrWWYllmBvNFrr7CIdMf18DGnPPHxXLz+8LUTLoo7YVzTZmmO/pgffjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTcA79Y7y47c0sJM6ULVULlxk62Fb5iciNWJhvpJX8g=;
 b=AM6BhDVqsaOceBQ1eVI349eTuYnkpcUQyAlGT4FYDTyQ+oLYPyUqyWwCFpKIDy39JqlIDyojFocJhJAlwdg3y/KDPzlY19dyopBK5R72I5GbmZwN3bL2q8hFs7AvnuP7QtLq5Uk6CPfKGs2Ksw4VmYyb07BN0PWBj3e+3bCztagUYETVbtCtG6yNfhHWBPAvSXGKwBTVPKm+LHFMvDVozzuG782+qCzoic/GRPqwIJkQt/COryvuLo8vsKRwPjLwP7su0ouka6obHMiUlXRW/+BBGfHshVu3e3MMJmmT4JNaZQEGVCil8eDvDb1k020b9IhyVlyodv4nKO4Pz1pnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTcA79Y7y47c0sJM6ULVULlxk62Fb5iciNWJhvpJX8g=;
 b=sJbiQf9pElgFzP70P/1iYyJ6YBM362N+GBISfUd3oTEUqDucUbIQQC/Mtkah54ghWZ6vFwBluFxdDta/1f8WpatnWe/urHeE5p5AN4eFqY3oeBLe4hzUW2lIuTMc5/B+8IIXZklJisNZp1jtvjOlKywTvgd+LX/S6T0voS3CRkitFNCoYro8bSLxM0Gs+RnK8CrtFg/kXacMkxiBDxZSPaQ1S3hQfZcI4p85vLHqjBqFKgV+2k7WuZyBJ/BOO5ScRWSVQaDIf2g0Bndz3SN4NjKxehenqM/qifjoplvK9FKxCDLF9OBDR/+0YZxeRBKwcCR5TDi4fyy1YJOEQf6u2A==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2682.apcprd04.prod.outlook.com (2603:1096:4:59::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Wed, 17 Mar 2021 07:38:31 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 07:38:31 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAAeFPK8AAFO7oAAAoI65QAYo5M+A=
Date: Wed, 17 Mar 2021 07:38:31 +0000
Message-ID: <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
 <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
In-Reply-To: <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNDBjMGNmYWUtMTI5NS00MDBmLWFmYjYtMWQwMDQzMTU2ZjEyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ilh2XC9TN3IxNndXdHloMzhaNW9oWWVFd0R4enlSdEhrc0Q4anFtS24wSlNWc1lISFh0Um1iOERNTGgwRW5Qb1pvIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.46.107.45]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8bc866b2-6fd2-4075-1523-08d8e917ae37
x-ms-traffictypediagnostic: SG2PR04MB2682:|TY2PR04MB3677:
X-Microsoft-Antispam-PRVS: <TY2PR04MB3677CFEEF05BC950AA8CCE6CE16A9@TY2PR04MB3677.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wF5mVN4wzJW4iKCZhxkGAiSKbaGU86N3ACP6ySxPV74WLdeUTfNRuSf52r57Sn+Ln6CFX4mjntwA3b5vvJDrXmNqKr7nMwyeTFk6AUfRFeEpcDNPSWhKbGe3bHe/pujgh5Rdau97ZT8ta0IptBX6HBYkvSpRpQx+AhBY+YUAs5+4DFuZmf20Tt7GuCwYAUjYOb5YAAL5O4KqpFp45rrN2bQDbbFl26E7OquT1Ec1j8wCWYnBKTzzM66Rq/77QkEetoaBoeYUkVoJVIE2JOAUv4XesyrVuMIU4ryUK30qRVuOzb5KoYg+z+TpjNEkw0T2UuIu/SGwNit8Mqw/rrN4Sn+lhLorv9arf7j77QaUU7AwxKQzX8vADt+q83l68IAs2LNj7Ea2UfkQTPkyCXPcYjYHGxeCZEUjI0yM2qrLIe4HYrb8DsViADN/FW6t/nowFoDfIUP2q9pVpDrxjpSU+9s+xRqUhEW27R0ki3vZytJ/S5ZzBl0fWbI83eCf2FV/4TXFov4wim4JeNV/+rvthzqqfWw4o660cnQKASHJ8y0LRZPPOlhuYT0TOlnCXDMoOCr2F5IvriyKeui3d7G0ThowuDuyNrPLblyupCOk+s+I8PxjfN4cS9l4rozQ8DkBSnzEprsl0SSDAd3sAzssmQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(186003)(966005)(66556008)(71200400001)(66446008)(66476007)(6506007)(53546011)(66946007)(5660300002)(2906002)(86362001)(64756008)(76116006)(45080400002)(4326008)(7696005)(316002)(55016002)(9686003)(6916009)(8676002)(26005)(33656002)(8936002)(52536014)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?aOo/lfE5Ipe1EUWQWPWm4kI3HdaYT5vJqDVK6dcNVpI/pAx+JiRyqynzY701?=
 =?us-ascii?Q?LTszLKFha7uv/dTklSg8sECZmhbpkqfmSol++/xOF67tNhqVTfLPMXtJuSU+?=
 =?us-ascii?Q?v02PI6PkJmDnFUkumQWB+/zUXFYHk3Oh+9gpi0AzfURsd0iFoUYj/LRW1l3B?=
 =?us-ascii?Q?fzNu7Fjjq2UV/wZJtfo24fB+13A51Janq1OJ0dJxEnqbEWuLE9ttzTneYAAH?=
 =?us-ascii?Q?5r+TXRLQqJfiwCAibe3eGQimg6+HYHmMGDXTcFZC0NwajEmUKw5U2V/nXTXY?=
 =?us-ascii?Q?bwDpfLz2iFzpephB2oHSjPJba52ou2pVbW3wVsBp5VHa33r15bdXhY67eGP+?=
 =?us-ascii?Q?anWCGNxpwmnWcDi9m25NIChWlhsMziPOkPZQluihs8l00DeBCRpjaHZ6OQnX?=
 =?us-ascii?Q?7Ih4UbV7ofh/njb5GHI7HyGtxx2kCZAbBE6O07BtBmkP7AdsK1R0MCvCF84+?=
 =?us-ascii?Q?370vmHhu7tG4sKuAG6lCASBOq4XRFCNbdOl+7fz7szLe3U91dT0oJUdJZll0?=
 =?us-ascii?Q?6/vkJuQkDE0xdaqBGUqnhatUETAZ20X1MdOp6lm4CXR86P/Oj1LypU3DftZ9?=
 =?us-ascii?Q?hkzI/S9oLcVPj4XVN/1obzzgfoi612ilH9iwIaaGKn2DjbsgJa5beIu3MRPv?=
 =?us-ascii?Q?U5K9Uz+c8HN3bxNh6TTKmiRIBblnwRP4cEcNICnXbzzMPeA18H3oORSsLfDK?=
 =?us-ascii?Q?Li/R65BSnZBpysgBu1RQbHBfZ2YkdbdCojNZLN1wJfIdi0SZDOyx/nl2YOUN?=
 =?us-ascii?Q?n3WUxqu3BSEWpoU2eQ3CoPoidSeX5oaNF2a2x/136X8McxUvB5jtAxLIH8TM?=
 =?us-ascii?Q?JaS4ggJHsk6xZ/7xnDAJ8G6aHBcPXW+eecFY/1k/hosmDG/g1I0ZUDbC/Gyc?=
 =?us-ascii?Q?ilv9H0zDIdekPC0lyCQl86yC7oQz1Hz18L0fLernPWXtGCV9dgjDbDJrIGho?=
 =?us-ascii?Q?VqUkr9I5vUzkMp0sx4Su/fhyCkNuMkvpyygnfVwFgSrhxuCQkGtocnSy9MUT?=
 =?us-ascii?Q?8YJsynP+8LtbmQ+k6ErUR3IaCrNrYznLlxHPuBUP9MLmV9YVSWsJvH5HWpPs?=
 =?us-ascii?Q?Ck3a1SpKOb9/ZcrSeijOKHPO8qr/1Rjk4FWBU6Isd6F3HH5BW91cb4O8Z7+q?=
 =?us-ascii?Q?AtoV9K4BWo7YoGhMN+oyDgtaznPwrva6LjG8ldG8Mw5flRfiIEcx9oT2gM3F?=
 =?us-ascii?Q?CmV8jgk+yiMhPPJGiatASiPtn8opxQtF4ry/r7zhCq3GEbjb1XqvZZlX4d8D?=
 =?us-ascii?Q?KCWL9P8D48MyxC5R7AS3Nmj25QPC+iPwjoNHTGaAdmnkmubgjltxdz1Ix0Cj?=
 =?us-ascii?Q?utc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2682
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3a2ba761-50f1-40d7-7662-08d8e917a9b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cxqA2XMBZYWQ6oURNrDLH2EIERogm9zKGJ+yOoFVz7bsVLMDVi/Z4ljAqDtC7s0HvP5E7+Qum//z99P77MMhShnjX4ujFQhln8d6HMHtA8oFUzHa2YfptMg3Kj9JdPQ4q+BvMJ1iY9fKGh9PIS7sgBjwQ8BdqP8oH63FOffqZ1DBMi62BPJ5S8dAu9UPVpKn022MAEz+RpSs7VCoYKE9OdsWEfJHa6rGUh3mWAYmz6cCN0kECbWZfZaSdQO8u47vvWCx54bmdb6UP/WUlO2VLfS018ILw2d4QvOz9oDaHZed8MDiNQ0GU81sijO/y+u3UwgTzsnKd2VM27YBIYcJu1/AqXJ2heKoCobIeCoK/FPIHZmMVWg3X8gXxZYA1NAZdFan4x2R87uRn0u0avu9/QfAwX8Svxjw9ZhUAZ/CTX4pi6GGud0T6ykr7GtVo6a6lRj8Eb5F4Nvw+/eR03OncD/MOJKwHJXofMI/fXwau95zZz8oM1Y9yaD+quqwzSjCcObYJVnwGGvhJktQS53Fk+NUP9zPOk3GJjD7/JHyOrFKT2h6eXsWojgyq5MJTMVqoOUiAloOUg+K3I73iUuz3bJXKn5MKqggZ9BOigmcujz2rbD2nFeFLq46c3GADeCbuwpwRx9AM3hpMlSJ7gjJ0Ij0b21WOXeTk2blMnLyk8tzB5ALSVhY5AWck27+L+7bZnkiKcocj8lf3QwG6DpdOcjlKEPq9ZgFMknorbnygk2Zp4jD2mnJ2Of5nf2afu/gtbPlTwPpO/rLfu9/U2hj5qfuPAXf05T5dyv2Jvb/33Y=
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(356005)(45080400002)(966005)(8936002)(478600001)(33656002)(336012)(6506007)(4326008)(6916009)(7696005)(83380400001)(52536014)(70206006)(53546011)(70586007)(316002)(36860700001)(2906002)(82740400003)(9686003)(36906005)(26005)(47076005)(81166007)(86362001)(82310400003)(34020700004)(5660300002)(8676002)(55016002)(186003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 07:38:35.7204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc866b2-6fd2-4075-1523-08d8e917ae37
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3677
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

Hi Ed,

PMBus spec only have read and write format. In the below link, PXE VR uses =
11 bit format. Also sign extend the 11bit
reading so that negatives show correctly.

https://github.com/openbmc/dbus-sensors/commit/e4a970d9aea97c7c1a11c63215e7=
d3cda2124e54#diff-135678dd2046935c5dd0be8e5a5a529d33231203149e786d57b15a3cc=
0cc1240

            constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
            value <<=3D shift;
            value >>=3D shift;

Could anyone from the intel team can clarify the need of above logic used i=
n IpmbSensor.

Regards,
Jayashree

-----Original Message-----
From: Jayashree D=20
Sent: Tuesday, March 9, 2021 4:48 PM
To: Ed Tanous <ed@tanous.net>
Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
Subject: RE: Negative value returns for sensor in tiogapass

Classification: Public

Thanks Ed, I'll check it out.

-----Original Message-----
From: Ed Tanous <ed@tanous.net>
Sent: Monday, March 8, 2021 9:37 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
Subject: Re: Negative value returns for sensor in tiogapass

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]

On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
> Hi Ed,
>
> In the below link, PXE1410CVR and ADM1278HSC are using the same reading f=
ormat.
> I am not able to find any information on PXE1410CVR. If there is any spec=
 available, could you please share it.
> It will be helpful to analyze both the specs and fix the problem.

I don't have any specs available for those.  I would assume they follow the=
 pmbus spec though, you might start there.

>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fmaster%2Fsrc%2FIpmbSensor.cpp
> %23L144&amp;data=3D04%7C01%7Cjayashree-d%40hcl.com%7C8676d30f4d3a4dda1e0
> e08d8e24c4957%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C63750816456
> 8775248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
> JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5lhuUdfI%2BG75C8I1HDAaEH
> VP46%2Bz1r3nJV0ek3CiiR4%3D&amp;reserved=3D0
>
> Regards,
> Jayashree
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Friday, February 26, 2021 9:57 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Negative value returns for sensor in tiogapass
>
> [CAUTION: This Email is from outside the Organization. Unless you=20
> trust the sender, Don't click links or open attachments as it may be a=20
> Phishing email, which can steal your Information and compromise your=20
> Computer.]
>
> On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com> wrote:
> >
> > Classification: Public
> >
> > Hi Team,
> >
> >
> >
> > Recently, I have tested sensors for tiogapass, in which one sensor retu=
rns negative value.
> >
> > After analysing the code in the dbus-sensors repo, I found the followin=
g issue.
> >
> >
> >
> > dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors
> > (github.com)
> >
> >
> >
> > From the above link, We need only below line in the code to process the=
 HSC sensors value for tiogapass.
> >
> >
> >
> > int16_t value =3D ((data[4] << 8) | data[3]);
> >
> >
> >
> > Since the below logic is added, the values get shifted and getting nega=
tive values as output.
> >
> >
> >
> > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> >
> > value <<=3D shift;
> >
> > value >>=3D shift;
> >
> >
> >
> > Could you please suggest any idea to resolve this issue.
>
> I haven't looked at this in detail, but we should follow whatever the spe=
c says here.  If whomever wrote this originally put in the wrong math (whic=
h seems likely, given they were implementing 4 types and probably only usin=
g one) then we should just get it fixed and do what the spec says.
>
> >
> >
> >
> > Regards,
> >
> > Jayashree
> >
> >
> >
> > ::DISCLAIMER::
> > ________________________________
> > The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guaran=
teed to be secure or error-free as information could be intercepted, corrup=
ted, lost, destroyed, arrive late or incomplete, or may contain viruses in =
transmission. The e mail and its contents (with or without referred errors)=
 shall therefore not attach any liability on the originator or HCL or its a=
ffiliates. Views or opinions, if any, presented in this email are solely th=
ose of the author and may not necessarily reflect the views or opinions of =
HCL or its affiliates. Any form of reproduction, dissemination, copying, di=
sclosure, modification, distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of HCL is str=
ictly prohibited. If you have received this email in error please delete it=
 and notify the sender immediately. Before opening any email and/or attachm=
ents, please check them for viruses and other defects.
> > ________________________________
