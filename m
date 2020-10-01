Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E3628027D
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 17:22:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2H1F6xWwzDqZq
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 01:22:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.112; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=M3qnbncR; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=M3qnbncR; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300112.outbound.protection.outlook.com [40.107.130.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2GyZ2025zDqXt;
 Fri,  2 Oct 2020 01:20:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dF6gpj6walDBQoYBHincEZAjZ1AmhLYfKxFVm4Y4ac=;
 b=M3qnbncRGBRV3p9+Id2tznxsCSmmyQS2EpjTI5aUCIMdRJLmbBlEaumN5JaWLhYIOc5Za2xtByC+7mT7HXVfcNb0vHrcOWoq3idGZ2r/9IzsiHkjeEgQvwBnYMKrdH10CwajHpSP8I87hlxNXJT5xyNUk0hNfd1ADFKSu2NqWqM=
Received: from PS1PR0601CA0101.apcprd06.prod.outlook.com (2603:1096:803:1::27)
 by KL1PR0401MB2024.apcprd04.prod.outlook.com (2603:1096:802:e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 15:19:47 +0000
Received: from PU1APC01FT056.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:1:cafe::56) by PS1PR0601CA0101.outlook.office365.com
 (2603:1096:803:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Thu, 1 Oct 2020 15:19:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT056.mail.protection.outlook.com (10.152.253.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 15:19:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqdJCnRnxb2XEh6tFbuJXbo9/gS9DLUva+bl43WTlDmYj/0hGt7d3U3SAYD2ZXcLRn09xxpSkQByywP8VcK9rU0hohO7/GnjBcWvYatVJFOzFwLiO34AEWk3kMFF3ZCVGFacWYFwvh/TapE51n3jx++T3ocP/5thhm1KZSZGm8amMtLHrUkjSoGuEK9XO89/0hSCNgwDn7ad2GDPpvQJ1trydydjHcwn42Hzsbjtt2jmveHhALtbZZ391IG2hN8y43WduCQ8ra9aQtOICCY+LE3jlVugxp/i6OsPp7Q+uH+tMsmh/Ds7WpcrJ6FPpv5SLYqwB//4Aa1Cb6I+L4vjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dF6gpj6walDBQoYBHincEZAjZ1AmhLYfKxFVm4Y4ac=;
 b=CTPofaVvm99O+xpb2ftzUolQzqDoBb/soQEN/M9dOXxhep5QNpL4Y+D7/KMsw9f5O/gOfx/YvL6X+S67jte2uEm78+MeRCRLq/2atTpRRMU4jfdYCHvEFqEO1n5KJ7DWz2/VIQHp2GJe+rpK44nuCgBsabzoCmm9Jtf0JJ0sQabwXcL+WAD6PUUl/XMpNGHUCOZyFL+OzShCwLYGeqTvFqAxm4ivi9HrWbGH+/1NiL95kWC6BguJF6ejXdfBs4EafAignruPJCbQWx42XmfsAe3EPsGSddMf9oWiy3toc8HHMn+L0a5MFMjKBk5PDpCpw8o68KymJ6Q/fxCfEExYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dF6gpj6walDBQoYBHincEZAjZ1AmhLYfKxFVm4Y4ac=;
 b=M3qnbncRGBRV3p9+Id2tznxsCSmmyQS2EpjTI5aUCIMdRJLmbBlEaumN5JaWLhYIOc5Za2xtByC+7mT7HXVfcNb0vHrcOWoq3idGZ2r/9IzsiHkjeEgQvwBnYMKrdH10CwajHpSP8I87hlxNXJT5xyNUk0hNfd1ADFKSu2NqWqM=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB4092.apcprd04.prod.outlook.com (2603:1096:0:11::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Thu, 1 Oct 2020 15:19:40 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 15:19:40 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Read Firmware Versions
Thread-Topic: Read Firmware Versions
Thread-Index: AdaQIMU5ljsiRzlYTUW3d3oi6MD/gwACmf2AAC39YUAANv8YAAAJ2/UA///kioCAAIVoAP/97TAQ//Ih+HA=
Date: Thu, 1 Oct 2020 15:19:40 +0000
Message-ID: <SG2PR04MB30936F1769ABD503C232E6BEE1300@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200923153510.GP6152@heinlein>
 <974e9c2abdf54c96038585730403d5b9@linux.vnet.ibm.com>
 <5FEF272B-706E-4C48-978D-1C3CEB137CFD@fb.com>
 <CAGm54UHW=ZdCOAVskjt8PiAn7FRcpAM7dL3J4UvB8g0bP+Qbaw@mail.gmail.com>
 <SL2PR04MB3097964C3083440779871FC9E1360@SL2PR04MB3097.apcprd04.prod.outlook.com>
In-Reply-To: <SL2PR04MB3097964C3083440779871FC9E1360@SL2PR04MB3097.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjM1MGI1NWEtMDRmYy00YmEzLWI5ZDAtMzhhNzQyNTY2NmIxIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoidkQ3UHZxdDVnVWwzckZlUFlLSG9aaDFWcHVrU0ErbDFKSTRIVEVJbmlndEZcL1g4OXJJcVQwTHRDVHBvSnB3Z3QifQ==
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:c0ab:68f6:71b7:1f2a]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 88f91f53-abba-46a2-47e5-08d8661d6da3
x-ms-traffictypediagnostic: SG2PR04MB4092:|KL1PR0401MB2024:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB20247FFF2F34A54BEB2DC850E1300@KL1PR0401MB2024.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: H5/g0k+pDWjCAw594/cihGGNBu9YS8cfycfKXmxfRy8DgomqsZwy4Hyt5beKFr8oR0oVYVDhNNw8BMRh2JD9tOnSd1wv+BwPwFNZQNvTsRxYusxAnsuuKpau3ZNzBhW6FK2zIVp49zyD3KA1GiFoMU7elREGo0WFCDQfbvSW3NAK4XRNrc+E0mrnS9m73JMTDDTFnHik1sn4Lt0cdPGeEIz/IKz6BZgZ4qSLLNtVqd8YL4YwFpQ1Uo45344F+d9ya69M7SlMjNu3yWMtudy25lw2SO4htkepEatBwCG1/KjyUxokIwXYEiSsE72wdQnyLfCXSbpHsnaElMGC2Kqb/7l8ISz2jRUFOiqFSE+tetOIjBwndY97ysxWLoxbhLgZ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(6506007)(53546011)(55016002)(8676002)(71200400001)(3480700007)(52536014)(66556008)(8936002)(33656002)(6916009)(316002)(66946007)(66446008)(66476007)(76116006)(86362001)(186003)(54906003)(2906002)(7116003)(478600001)(83380400001)(7696005)(9686003)(5660300002)(64756008)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: QpAXkUiWncefpFfFzv+NtOq8PREO1jirFtOr8/nrzzBXRDKqe3LDeYjXjyO6pwzFGRONa9sGt9di4w3RMPzj5NkXiCTXeBIIj51IyRZRyfAfp82Dy/AjXUe/O9z6Een/L9rLGV1Zq6pD21MVFFPr/+o4hdD8GiuGZEV6kR29v+Fn+wnSWBKsZtN01+iJ3jB+Wr5pLYgD++C8cKxc4i4YkHgjbswAaUFyl5jxIXRmYN3EjsGrrqhAa/MJLTl1z7HHfmJN4sEaTce0ugz715cd2cABqxRY8w4I+pNlmGLDsQdgYx1CCEKiIm7WnEwC7Aa9ewgfCvMqpUDSxGBrpySuE6YytxjLCVV2rMEhRYv9JjdM03VN1bCA6duV/i10QtwB+qLckfPOUek+GNVwx9Jry8VT8l9e9DLBEPzHL5k74YwJ9kbBJZ0aDTA76tHVeSZ30zBgwEnzW17/SFwtncRBs/ZZ8dECax9F7BVcim7no1cZ3slyei1i4d97VKvrcJTf74JDxnFFA8jSExXVKXExGjBOhLGc/7xkLpve4S712aTsGXLjB3kmWF/B6AhGAqjrcYDYXAPkdogumv8zWnRwIKOww8vKNUB3NkwU6bnlBTOMMAu/aHiRjsgMwxTQS8d7MXWkKpAGuDjef6Bisrpsz2oZPE1I7/P3FJr3cjKrqZhmrBH27rbxRakZm/8Ju8iYHsJCeRWB1orCiVV0PuwgGA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB4092
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT056.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 599998e8-2427-47c2-37e8-08d8661d6aef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aayZ3Ah6ANjJYxKCTYpjEeUXD/9VMCDWQ8py8p+yElhOJkKSFe0gZCHSkRzAE63xsQFWPAM/HunlVnbFlna25/kOGBgihp1ujdF+8D24E8R3HbKhHB+doLvalrmZx5WWEOAl+lFuvd/WY6lUCTaOqo+tGDJVD28lw217i8c0QFAVQNFRUJhtZE4We9ghadiR92hM4ulmgKsbyjPb/NZcBrygjZk6ZCz7ffphqj2o+kou3oxyzvz/Buee3zBAt/30UTbnvkztKN94su0WPqxdfinzxP5ffJSz/vB/JylHZ7aan+aF31j9eu4Wy2IdzhbgbQPgTd4Pp6tL3L2D69ucGDTHwZFf53+dxMeNgCjEQyvX2VYyWbpapM53LqOy0UDnX3Wk31NzoPGziIqK9myJZZetcHweR1TI76U5PZfkHXvggtzfzW1Fn78Z/Fdhpl4C
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966005)(86362001)(55016002)(47076004)(9686003)(52536014)(70206006)(70586007)(3480700007)(336012)(33656002)(8676002)(5660300002)(6916009)(8936002)(478600001)(4326008)(34070700002)(7116003)(82310400003)(53546011)(81166007)(356005)(54906003)(2906002)(6506007)(82740400003)(36906005)(316002)(186003)(26005)(83380400001)(7696005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 15:19:44.3391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f91f53-abba-46a2-47e5-08d8661d6da3
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT056.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB2024
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
Cc: Lei Yu <yulei.sh@bytedance.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KDQpIaSBUZWFtLA0KDQpDdXJyZW50bHkgdGhl
cmUgaXMgbm8gcGxhY2UgaG9sZGVyIHRvIGhhdmUgYWxsIHByb2dyYW1tYWJsZSBlbGVtZW50cyB2
ZXJzaW9ucy4gV2hldGhlciBhbnkgbmV3IHJlcG8gY2FuIGJlIGNyZWF0ZWQgdG8gbWFpbnRhaW4g
YWxsIHRoZSBwcm9ncmFtbWFibGUgdmVyc2lvbnMgaW4gb3BlbmJtYy4NCktpbmRseSBwcm92aWRl
IHlvdXIgc3VnZ2VzdGlvbnMgdG8gcmVhZCBhbGwgdGhlIGZpcm13YXJlIHZlcnNpb25zIHVzaW5n
IE9FTSBjb21tYW5kcy4NCg0KUmVnYXJkcywNCkpheWFzaHJlZQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogSmF5YXNocmVlIEQNClNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI1
LCAyMDIwIDU6MjAgUE0NClRvOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCkNjOiBBZHJpYW5h
IEtvYnlsYWsgPGFub29AbGludXguaWJtLmNvbT47IFBhdHJpY2sgV2lsbGlhbXMgPHBhdHJpY2tA
c3R3Y3gueHl6PjsgVmVsdW1hbmkgVC1FUlMsSENMVGVjaCA8dmVsdW1hbml0QGhjbC5jb20+OyBv
cGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrYW5vbz1saW51eC5pYm0uY29tQGxpc3RzLm96bGFicy5v
cmc+OyBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT47IExlaSBZdSA8eXVsZWkuc2hA
Ynl0ZWRhbmNlLmNvbT4NClN1YmplY3Q6IFJFOiBSZWFkIEZpcm13YXJlIFZlcnNpb25zDQoNCkNs
YXNzaWZpY2F0aW9uOiBIQ0wgSW50ZXJuYWwNCg0KDQpPbiBUaHUsIFNlcCAyNCwgMjAyMCBhdCA5
OjQwIEFNIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCj4NCj4NCj4N
Cj4g77u/T24gOS8yMy8yMCwgMToxOSBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEFkcmlhbmEg
S29ieWxhayIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2YgYW5vb0BsaW51eC5pYm0uY29tPiB3cm90ZToNCj4NCj4gICAgIE9u
IDIwMjAtMDktMjMgMTA6MzUsIFBhdHJpY2sgV2lsbGlhbXMgd3JvdGU6DQo+ICAgICA+IE9uIFR1
ZSwgU2VwIDIyLCAyMDIwIGF0IDAxOjM0OjUwUE0gKzAwMDAsIEpheWFzaHJlZSBEIHdyb3RlOg0K
PiAgICAgPj4gQ2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KPiAgICAgPj4NCj4gICAgID4+
IFRoYW5rcyBQYXRyaWNrIGZvciB5b3VyIHJlc3BvbnNlLg0KPiAgICAgPj4NCj4gICAgID4+IElu
IHBob3NwaG9yLWJtYy1jb2RlLW1nbXQsIEkgYW0gc2VlaW5nIHRoZSBzb2Z0d2FyZSBpbWFnZSBp
cyB1cGdyYWRlZA0KPiAgICAgPj4gYW5kIGJhc2VkIG9uIHRoZSBpbWFnZSB1cGRhdGUsIHZlcnNp
b24gaXMgdXBkYXRlZC4NCj4gICAgID4+IEJ1dCBpbiBteSBwbGF0Zm9ybSwgSSBoYXZlIHRvIHJl
YWQgZmlybXdhcmUgdmVyc2lvbnMgdXNpbmcgb2VtDQo+ICAgICA+PiBjb21tYW5kcyBhbmQgdGhh
dCB2ZXJzaW9uIHNob3VsZCBiZSBkaXNwbGF5ZWQgdW5kZXIgZGJ1cyBvYmplY3RzLg0KPiAgICAg
Pj4gV2hldGhlciBwaG9zcGhvci1ibWMtY29kZS1tZ210IHJlcG8gd2lsbCBiZSBzdWl0YWJsZSB0
byBkaXNwbGF5IHRoZQ0KPiAgICAgPj4gZmlybXdhcmUgdmVyc2lvbiB1c2luZyBkYnVzIG9iamVj
dHM/DQo+ICAgICA+DQo+ICAgICA+IFZpamF5IHJlY2VudGx5IGFkZGVkIGEgc2ltcGxlIEJJT1Mg
Zmxhc2ggbWFuYWdlbWVudCB0bw0KPiAgICAgPiBwaG9zcGhvci1ibWMtY29kZS1tZ210LCBidXQg
dGhlcmUgaXMgYWxzbyBhIG9wZW5wb3dlci1wbm9yLWNvZGUtbWdtdA0KPiAgICAgPiBmb3INCj4g
ICAgID4gdGhlIGVxdWl2YWxlbnQgb2YgQklPUyBtYW5hZ2VtZW50IG9uIG9wZW5wb3dlciBzeXN0
ZW1zLiAgU2luY2UgeW91cg0KPiAgICAgPiBjb2RlDQo+ICAgICA+IHVwZGF0ZSBzY2hlbWUgaXMg
bGlrZWx5IHRvIGJlIHNwZWNpZmljIHRvIHlvdXIgSVBNQiBjb21tYW5kcywgSSBkb24ndA0KPiAg
ICAgPiBrbm93IGlmIHRoYXQgd291bGQgYmUgYmVzdCBpbiBhIHNlcGFyYXRlIHJlcG9zaXRvcnkg
b3IgYW4gZXh0ZW5zaW9uDQo+ICAgICA+IG9udG8NCj4gICAgID4gcGhvc3Bob3ItYm1jLWNvZGUt
bWdtdC4NCj4gICAgID4NCj4gICAgID4gQWRyaWFuYSwgYW55IG9waW5pb25zPw0KPg0KPiAgICAg
SXQgY291bGQgZml0IGluIHBob3NwaG9yLWJtYy1jb2RlLW1nbXQsIHNvbWUgdGhvdWdodHM6DQo+
DQo+ICAgICBUaGUgZC1idXMgb2JqZWN0cyBnZXQgY3JlYXRlZCBhdCAyIGRpZmZlcmVudCB0aW1l
czoNCj4NCj4gICAgIDEuIE9uZSBzY2VuYXJpbyBpcyB3aGVuIGFuIGltYWdlIGlzIHVwbG9hZGVk
IHRvIGJlIHVwZGF0ZWQsIHRoaXMgaXMgdGhlDQo+ICAgICBzdXBwb3J0IHRoYXQgVmlqYXkgYWRk
ZWQgd2hpY2ggYWxsb3dzIGEgY3VzdG9tIHNjcmlwdCB0byBiZSBydW4gdG8NCj4gICAgIHVwZGF0
ZSB0aGUgQklPUyBpbWFnZS4gSWYgeW91J3JlIGludGVyZXN0ZWQgaW4gdGhpcyBtZXRob2QgZm9y
IHVwZGF0aW5nDQo+ICAgICB5b3VyIEJJT1MsIHlvdSBjb3VsZCBwb3RlbnRpYWxseSBhZGQgeW91
ciBJUE1CIGNvbW1hbmRzIGluIHRoYXQgc2VydmljZQ0KPiAgICAgYW5kIHVzZSB0aGUgQWN0aXZh
dGlvbiBpbnRlcmZhY2VzIHRvIGRyaXZlIHRoZSB1cGRhdGUuDQo+DQo+ICAgICAyLiBUaGUgc2Vj
b25kIHNjZW5hcmlvIGlzIHdoZW4gdGhlIEJNQyByZWJvb3RzIGFuZCBpdCByZWNyZWF0ZXMgdGhl
DQo+ICAgICBkLWJ1cyBvYmplY3RzLiBGb3IgdGhpcyBzY2VuYXJpbywgdGhlcmUncyBubyBjdXJy
ZW50bHkgc3VwcG9ydCBmb3IgQklPUywNCj4gICAgIHNvIGZvciBleGFtcGxlIHRoZSBzdXBwb3J0
IHRoYXQgVmlqYXkgYWRkZWQgZG9lcyBub3QgY3JlYXRlIGEgZC1idXMNCj4gICAgIGludGVyZmFj
ZSBpZiB0aGUgQk1DIHJlYm9vdHMsIHdoaWNoIGlzIG9rIGlmIHlvdSBvbmx5IHdhbnQgdG8gdXNl
IHRoZQ0KPiAgICAgQWN0aXZhdGlvbiBpbnRlcmZhY2UgdG8gdHJpZ2dlciB0aGUgdXBkYXRlLiBC
dXQgc291bmRzIGxpa2UgeW91IHdhbnQgdG8NCj4gICAgIGFsd2F5cyBoYXZlIHRoZSB2ZXJzaW9u
IGluZm9ybWF0aW9uIGFzIGEgZC1idXMgb2JqZWN0LCBzbyBzdXBwb3J0IGZvcg0KPiAgICAgQklP
UyBjb3VsZCBiZSBhZGRlZC4gRm9yIGV4YW1wbGUsIHRvIGdldCB0aGUgQk1DIGxldmVscywgdGhl
IGNvZGUgbG9va3MNCj4gICAgIGZvciB2ZXJzaW9uIGluZm9ybWF0aW9uIGluIHRoZSBCTUMgaW4g
dGhlIG1lZGlhIGRpcmVjdG9yeS4gSWYgeW91IGdldA0KPiAgICAgeW91ciBhcHAgdG8gZ2V0IHRo
ZSB2ZXJzaW9uIGluZm9ybWF0aW9uIHZpYSB0aGUgb2VtIGNvbW1hbmRzIHlvdQ0KPiAgICAgbWVu
dGlvbmVkIGFuZCBjcmVhdGUgYSBmaWxlIGluIHRoZSBibWMgaW4gdGhlIG1lZGlhIGRpcmVjdG9y
eSB3ZSBjb3VsZA0KPiAgICAgZXh0ZW5kIHRoZSBsb2dpYyB0byBjcmVhdGUgdGhlIFZlcnNpb24g
ZC1idXMgb2JqZWN0cyBmb3IgZWFjaCBCSU9TDQo+ICAgICB2ZXJzaW9uIHdoZW4gdGhlIEJNQyBy
ZWJvb3RzLiBXZSdkIGp1c3QgbmVlZCB0byB3b3JrIG91dCB0aGUgZGV0YWlscyBmb3INCj4gICAg
IHRoZSBmb3JtYXQgZm9yIHRoZSBmaWxlcyB0aGF0IHdvdWxkIGhvc3QgdGhlIHZlcnNpb24gaW5m
b3JtYXRpb24sIGFuZA0KPiAgICAgaG93IHRvIGlkZW50aWZ5IHRoZXkncmUgQklPUyB2ZXJzaW9u
cyB2cyBCTUMuDQo+DQo+IEkgYWxyZWFkeSBjcmVhdGUgYSBmaWxlIGFmdGVyIHJlYWRpbmcgYmlv
cyB2ZXJzaW9uIHZpYSBvZW0gY29tbWFuZHMsDQo+IElzIHRoZXJlIGEgcGF0dGVybiB3aGVyZSBz
aG91bGQgd2Uga2VlcCB0aGlzIGZpbGUgYW5kIHdoYXQgaXMgdGhlIG5hbWUNCj4gb2YgZmlsZS4g
QWxzbyBJIHRob3VnaHQgdGhlcmUgaXMgYSBkYnVzIGludGVyZmFjZSBmb3IgYmlvcyBtYW5hZ2Vt
ZW50DQo+IGFscmVhZHkgY3JlYXRlZCBieSBzb21lIGRhZW1vbiBuZXdseSBhZGRlZCB3aGljaCBj
YW4ga2VlcCBiaW9zIHZlcnNpb24uDQo+DQoNCj5XZSBwbGFuIHRvIGRvIHNvbWV0aGluZyBsaWtl
IHRoaXM6DQo+MS4gVGhlIEJJT1MgdmVyc2lvbiBpcyBzdG9yZWQgaW4gYW4gZWVwcm9tOyAyLiBP
biBCTUMgYm9vdCwgcGhvc3Bob3ItYm1jLWNvZGUtbWdtdCBjcmVhdGVzIHRoZSBiaW9zIG9iamVj
dCwgYW5kIGZpbGwgdGhlIHZlcnNpb24gcmVhZCA+ZnJvbSB0aGUgZWVwcm9tOyAzLiBXaGVuIHRo
ZSBob3N0IGlzIHN0YXJ0ZWQsIEJJT1Mgc2VuZHMgaXRzIHZlcnNpb24gdmlhIE9FTSBpcG1pIGNv
bW1hbmQ7IDQuIEJNQyB3aWxsIHVwZGF0ZSBhbmQgd3JpdGUgdGhlIHZlcnNpb24gdG8gPnRoZSBl
ZXByb20gaWYgdGhlIHZlcnNpb24gaXMgZGlmZmVyZW50Lg0KDQpJIHVuZGVyc3RhbmQgdGhhdCBj
dXJyZW50bHkgdGhlcmUgaXMgbm8gc2VwYXJhdGUgcmVwbyB0byBkZWFsIHdpdGggYWxsIHRoZSBm
aXJtd2FyZSB2ZXJzaW9ucyAoTUUsIENQTEQsIFZSLCBCcmlkZ2UgSUMsIEJJT1MpLiBXaGV0aGVy
IGFueSBuZXcgcmVwbyBjYW4gYmUgY3JlYXRlZCB0byBwbGFjZSBhbGwgcHJvZ3JhbW1hYmxlIHZl
cnNpb25zIGluIG9wZW5ibWMuDQpPciBpcyB0aGVyZSBhbnkgd2F5IHRvIHJlYWQgYWxsIHRoZSBm
aXJtd2FyZSB2ZXJzaW9ucyBmcm9tIGFueSBvdGhlciByZXBvIHVzaW5nIG9lbSBjb21tYW5kcyBL
aW5kbHkgcHJvdmlkZSB5b3VyIGNvbW1lbnRzIG9uIHRoaXMuDQoNClJlZ2FyZHMsDQpKYXlhc2hy
ZWUNCjo6RElTQ0xBSU1FUjo6DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KVGhl
IGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlk
ZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1h
aWwgdHJhbnNtaXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1m
cmVlIGFzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3Qs
IGRlc3Ryb3llZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmly
dXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBv
ciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55
IGxpYWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZp
ZXdzIG9yIG9waW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xl
bHkgdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRo
ZSB2aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9m
IHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZp
Y2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdl
IHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2Vu
dGF0aXZlIG9mIEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGVtYWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2Vu
ZGVyIGltbWVkaWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1l
bnRzLCBwbGVhc2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo=
