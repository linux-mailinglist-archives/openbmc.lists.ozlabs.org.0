Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD593B1CF9
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 16:59:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G95y64XkTz3091
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 00:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=DkoywTLF;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=DkoywTLF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.133; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=DkoywTLF; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=DkoywTLF; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320133.outbound.protection.outlook.com [40.107.132.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G95xk5h0Nz302W
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 00:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3odUVQy/Ci914srSfM5GHFl2eR3bcW0xA+nYb7N5/cI=;
 b=DkoywTLFI+Uo47EFUKcX3A6vXSVR6utLd3LpZW3Cja3BCHKCGoxJUSvdcpHvPlsn4++i/b4gW4Cl/3ToQkIrj/LRZw7Gw6xXYMW///yKWqKW25VEpKQ6y7/0FL6Zai2eRTEb70/eW5ECE2CqPCSOTtwNtuUADVceE+OS6NTj97/edqdQXogvK21mUEpXLiz//zX0hTK4Rzbh26XzEDsdhgOE80xBPTmCxa25opq2sK21iuZUPjqz7S/A00tsPubS2N7/m4Z/loo18BFtsW1P0CU26RPC15Rt4oKH0lFHdBoSLsn4/rxVCc2ZofxmGlNEbubeb6vNc+IymSje47Hltw==
Received: from HK2PR04CA0083.apcprd04.prod.outlook.com (2603:1096:202:15::27)
 by HK2PR0401MB2132.apcprd04.prod.outlook.com (2603:1096:202:5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 14:58:39 +0000
Received: from HK2APC01FT017.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:15:cafe::85) by HK2PR04CA0083.outlook.office365.com
 (2603:1096:202:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Wed, 23 Jun 2021 14:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.53) by
 HK2APC01FT017.mail.protection.outlook.com (10.152.248.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 23 Jun 2021 14:58:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asMdzhpmcSDI8qlcdINhG0s8gXj0EyKjAY5u9/nsDdtO1sHwDXD5WmLyCYGYWecv7QChhocv7RwHuuspnzkRMEb5ulS+KdDPQMbGbDr+2B9LKufLLRvne86D+PjwiesHUyu9r134kYVSvkC6oeU//WOGfSOdA/FIOC/z00GcoKqzjAUePTySGMgHvFfJFo7J1gksZy0UBoHDuozWMfo0kdygbdHJQOroKxMdpfU54cxs38CeGVJX3ZrG3GvI/y8ILLu6QkBZPzl+JSnV1WWCx3wdggOE3xh1gW6+BjVF0o0tcUIYzEQRPOKrdfdNJDYWYBKEJn8h7acZQ+LVY6eeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3odUVQy/Ci914srSfM5GHFl2eR3bcW0xA+nYb7N5/cI=;
 b=dmdvddvkpdifrlF0krPJ+eiZDItu6XeeOjJAClqeFGTpQiDX9HkOFZrRHbnHZxl8UkKaPl3nkX3sU+JammfUjyqF6WR4jB8iOGJ0dTmMtVgWzA5dEQG52C/OjoSgiCPKuf2sfZ7s8NIF+pitlCoX5nAbrIVM++VGo5Sx9FLA7trbE9kDWKfXEQVS/ITtKvmk/D9RmVTkP36jFTp3EVB7pa1wUmus+lh4lgXzPCuiyB1DSsImJ343AB9OHFuIGxtYrtnaM1RAKYWUGOy/OQB5lKgyw6oopC9OWM4+5j2jPnjCXUB1lrtZ+sjih/Sjc0KegY7I4H6tm+yvN6UAeg4Azw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3odUVQy/Ci914srSfM5GHFl2eR3bcW0xA+nYb7N5/cI=;
 b=DkoywTLFI+Uo47EFUKcX3A6vXSVR6utLd3LpZW3Cja3BCHKCGoxJUSvdcpHvPlsn4++i/b4gW4Cl/3ToQkIrj/LRZw7Gw6xXYMW///yKWqKW25VEpKQ6y7/0FL6Zai2eRTEb70/eW5ECE2CqPCSOTtwNtuUADVceE+OS6NTj97/edqdQXogvK21mUEpXLiz//zX0hTK4Rzbh26XzEDsdhgOE80xBPTmCxa25opq2sK21iuZUPjqz7S/A00tsPubS2N7/m4Z/loo18BFtsW1P0CU26RPC15Rt4oKH0lFHdBoSLsn4/rxVCc2ZofxmGlNEbubeb6vNc+IymSje47Hltw==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB2449.apcprd04.prod.outlook.com (2603:1096:203:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 14:58:34 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4150.035; Wed, 23 Jun 2021
 14:58:34 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Firmware update for bios/CPLD 
Thread-Topic: Firmware update for bios/CPLD 
Thread-Index: AddMsF4+pmxbXL8zQj+LrCWzLOGm3gbj6iCA
Date: Wed, 23 Jun 2021 14:58:34 +0000
Message-ID: <HK0PR04MB29643D1E4C034D9EFDB4E4C5FD089@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964615B56B0CBB56E27B41FFD2B9@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2964615B56B0CBB56E27B41FFD2B9@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMDE4YzhlOWQtMGQ2Yi00Yjc0LWE3MDItOTI2NGY3NTNkZWZkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImNoelNjNk13cjlpS2pLOVJiRHFSOEVoNTJWTXZ0djF4WFNvcjJmOEdiamFYYXJvaHFUbjh5Q2tiQW9ab3RkcDkifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d2087295-e1bb-4cf7-082a-08d9365761d6
x-ms-traffictypediagnostic: HK0PR04MB2449:|HK2PR0401MB2132:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK2PR0401MB21322D41963DB6A58F0D3C62FD089@HK2PR0401MB2132.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: enR8cr84fNOWetWn8D9mC744aCFmBwWYv4XJBOgIWlNiLvdeJTeSYt1Z9J7vVOogD6tjHgbCxWZ4qdArYGcXoyT+ikjZ+ke+GkqzzXaxB5tMK23i/H+c4mjsOoeVR06s/TZQvI7Hn650qH/rMgjm1wfgELmWB8jMJBydzBjJJ9yPw6U00J4ppCKqJkbQxmJ1FygIYVQ2SyWEhC4zOc+pBspvjpWFb0I4nYRTwysyDSEoaRy9l8o4Koz7dtNiJiq8lv6+CZx7etpuSUFxoK7BQ1p1QOj05kasw6tfkSdv466zBf0wLd1C4DpSH05fl3BH1c1IdGeMx1NXhj4uy4J/bvOG0PYSzfo63QFKyNME71XTXEU4tJDEJZ4H8f5OlLnLKrJsm/X0792zCKz0kqeFKNeNKUmwjMrPKQhTP7lf+v/wHcX7yYNEFaZTM05U3jQ83rCyO7Zd3QDJW8EOllMG+FZlQNqBhuWpXh0QGOcRVHi1/7A8sS3LulkfCthbntz0VBNo57p7cET6DTzPUGaA0PGZg0nGKCH1mBbxkZ308Pz6yz3YOmIuZzlYzKsjWZtr9M4nPmLF/euGXQi94zv0nroyo8xeXa2biSMOVkINNszNMMkT0k62rnlYB8y3c1jz0uB8/Tvi3hlzc+HDPOWuoSTqVh1el8w/oaxLBx37SA9hRjQdpXKbl9rGUx4ddEQ2YlKWOubVtiQxSJt8q70qJQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(83380400001)(8676002)(7696005)(53546011)(26005)(86362001)(55236004)(76116006)(166002)(6506007)(186003)(15650500001)(54906003)(4743002)(71200400001)(6916009)(4326008)(9686003)(55016002)(52536014)(64756008)(66556008)(66946007)(66476007)(66446008)(5660300002)(2906002)(33656002)(498600001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PY+wTzrR74/bBw1VdhaatqIpp/ZHE+boJf6l976FmByVAo1+0LYQsWyntDnq?=
 =?us-ascii?Q?XF0RuSRnP24Elu8k2NEwvyQtlbZloAKUMYoHDsEt+Put/pNQI1QUYpUG80li?=
 =?us-ascii?Q?hgD+myvjpbLx5hkk8hBY7yppNJuhRwq5qV8eS5DVTiLMkUQPNRHA8P5BAAx7?=
 =?us-ascii?Q?0UJTMFLG3OHjf2Nvfku7m8z/57cKl72ewDjXwHbMrejZSoCAmzgsv0GL4RVT?=
 =?us-ascii?Q?Ca+ednUmL2Be0CSlusRnEx0/b5IiKmcMLtAPog0Rkz1peoRUq2XPhFyZPIAv?=
 =?us-ascii?Q?qfLJ6LhM4oeToXLEPlE0l+j2FULiCFx0Hg/GV5kDC1m+3lrHL8w0Ptr5dGtl?=
 =?us-ascii?Q?1kPZsOV2F5K6mvtLLwZZEYKBeCa57SPeaQu0dDt4V6tZT/VW5NhjM2WbbDiK?=
 =?us-ascii?Q?SVqO+sWJrr1xwx4F1loArk8xb5jbjqzcbRztJeafHO+vXjeuPd3ufPKvBPU3?=
 =?us-ascii?Q?MvFBYQumS0jCylLiXnFKmuP3rH19AS5aBMaG/b2WIuS4FcK8uiFDYGCAnauo?=
 =?us-ascii?Q?pwIO2nl5gaYR5hP4QWdA+/vsA7uFj+K7S/BhFH2pq3ZdKKCLq29fKwRfICpu?=
 =?us-ascii?Q?+ZaPdp50RyLWMan/P2dsVzh2pIa0D8dQzEn4CK4jGBXNm62Y02Yd1vqiOLWw?=
 =?us-ascii?Q?8if7IaWQt8gSmv0yqJhHaNp4OHtacizTq8/rzKx6OzTShm7SRnxkS81Kwd4R?=
 =?us-ascii?Q?wHRN9zrhUVan5cfyVdOL8tgp1jzU9rl2YHIcIt0H8OgIq+XKHcCHtgtLKfx9?=
 =?us-ascii?Q?Qq7GrDyQlNaRtpRup2xFuPE3cUAvnVasVJerUZpes2NbjSMpBYHHeJhWfuQW?=
 =?us-ascii?Q?f1QTPIopjybwhrujHz3hDwFtVoEcUwwluAiFvtvR7fsSpI2JyWbZ1uul3NlX?=
 =?us-ascii?Q?3V9m1Cfpe51OAQRI0EtPtvwLV3pGIRBq4LAVij+7bWhoxeCT439hHpaFVNRs?=
 =?us-ascii?Q?gVnzI34sKd0D5MFkED5rhM76srseE86P4mCm4GM+KEN3W673u9O1RXgzNfHq?=
 =?us-ascii?Q?/boJaXwpTQhiG3AQQJv4ODtYc7iB7badiIPxuxGtexYg6HYtGVnSt3QGXKaa?=
 =?us-ascii?Q?8ABjhVVcLtFwzQQs4vAN57C9DsFsWJ9lFzpZokCb5E+9Thv7yAu5x5zfKoOW?=
 =?us-ascii?Q?V4OPyxGxBNco5wFTZB2g2cdjxn9w+4kNOL1B+Hp3WdzWLUX8cXLKRr+NBmZd?=
 =?us-ascii?Q?AClA5GUAWWVpnZNvFesW3p/kbWo6FXukboX8bVls5jcF7tfxcYMhN7mLqOax?=
 =?us-ascii?Q?k58bpsJJ2psrKVZdC4Aplm4jPB5WlR/EPUz3FAXj7DnlFemOUKO0RGSWKv+8?=
 =?us-ascii?Q?rExirZ5AyWswqNz631pdl4NB?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB29643D1E4C034D9EFDB4E4C5FD089HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2449
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT017.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a870debf-799b-4f7b-fac1-08d936575ff5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: puAFqNtaLxXFdOLpDY0ypIFlYj1r+nshfhFmYupZJmMunME1xRFluf8FCx30LYU5Y4hs9fJV2aulXx9autS7SObDdtzWqiVEM+Ye0hieziK9DqSDviCNy378F7DURc93wmEtowV9vYy39wiyB1wadfFpnjcxo5C0R7W77BLfcP32UaU79oguzXPz8fky1R3zGeJTzGz+m0cxamyGkqB5zuOkZJppKWh4Y6Qmu9NQ4vPJ9alzAXUzZj47EQLywD3AmAVZywKSXNcI1qLAqFK7ayjKq7ezHReQyT6uBtIF9AurlO/jSWAR+/Nqm/0nUIqfpMAZofb2c8ZtunOO+v1qFUDnZnsaJZ+iKK6x9eUYseKJNNTF1A7Aamy8czfS6b759ioFw8v7T+pe4lVAeK/3OHUPIwhqqUkZWWmiXWDLgjjOVqWfUBX1+CFaLv1thE6j70lFXnZSk5G5w7qru6bazObD+TyDmHvBHo9SMJHWlvxyf9M9WO89kjovDWc0lWVIvreWfPuv24O/v4QpQsOuMXIcGWhP0AiPDQbk6u63rfx9zBNpV9F187bdwc239OFUDql0+5Ar/scGO9G24NFDv00IyBlhIvesHQp3SuLK0T/+6b/PJDgD227BsyrSb3EAixGoYxJraiuua6AcZG93MrEqOJlRalDCHZ/xf0UUJOhftPaBg3CikjVVmzzOA5WTo8cBM5JDrBM7EX4ZLjBzYhRgEzZEtqRc5J57oqDZ7tqCBHRu02E6DVczTnJK+EoOOwtSfRUjvDkWYqL8iJtwQwvF5KZqBwmSl7mhu85yPe5Bu1MGZ1P0+XX7MW9nk1nr
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966006)(36840700001)(83380400001)(81166007)(166002)(4743002)(336012)(33656002)(26005)(186003)(478600001)(9686003)(55016002)(82740400003)(2906002)(15650500001)(36860700001)(356005)(47076005)(6916009)(55236004)(70206006)(36906005)(4326008)(7696005)(82310400003)(316002)(86362001)(6506007)(8676002)(53546011)(5660300002)(52536014)(70586007)(54906003)(8936002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 14:58:37.5829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2087295-e1bb-4cf7-082a-08d9365761d6
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT017.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2132
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jayashree D <jayashree-d@hcl.com>,
 "geissonator@yahoo.com" <geissonator@yahoo.com>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB29643D1E4C034D9EFDB4E4C5FD089HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi All,

         This firmware update code is mostly ipmb based and have some oem c=
ommands.
         I think, this will not fit in the existing repository.

         Could you please create/initiate the new repository for this firmw=
are update code.

Thanks,
Kumar.

From: Kumar Thangavel
Sent: Wednesday, May 19, 2021 6:46 PM
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>; geissonator@yahoo.com; Patrick Willia=
ms <patrick@stwcx.xyz>; Velumani T-ERS,HCLTech <velumanit@hcl.com>; Jayashr=
ee D <jayashree-d@hcl.com>
Subject: Firmware update for bios/CPLD

Classification: Public
Hi All,

          We have implemented the firmware update for bios/CPLD for our sys=
tem.
          So, we have submitted patch for this. Please find the below Gerri=
t link.

         Openbmc-tools: YosemiteV2: Added firmware update support for bios/=
CPLD TESTED: Tested and verified in yosemitev2 (Ia7deaf0f) * Gerrit Code Re=
view (openbmc-project.xyz)<https://gerrit.openbmc-project.xyz/c/openbmc/ope=
nbmc-tools/+/39341>

         As of now, we have submitted the code in the openbmc-tools repo.

         As Patrick suggested, No recipes are pointing this repo.
         So, Could you please suggest where these code and scripts should b=
e added ?

Thanks,
Kumar.

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

--_000_HK0PR04MB29643D1E4C034D9EFDB4E4C5FD089HK0PR04MB2964apcp_
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
	{font-family:Latha;
	panose-1:2 0 4 0 0 0 0 0 0 0;}
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi All,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;This firmware update code is mostly ipmb based a=
nd have some oem commands.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I think, this will not fit in the existing =
repository.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Could you please create/initiate the new reposit=
ory for this firmware update code.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Kumar.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Kum=
ar Thangavel
<br>
<b>Sent:</b> Wednesday, May 19, 2021 6:46 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Andrew Jeffery &lt;andrew@aj.id.au&gt;; geissonator@yahoo.com; P=
atrick Williams &lt;patrick@stwcx.xyz&gt;; Velumani T-ERS,HCLTech &lt;velum=
anit@hcl.com&gt;; Jayashree D &lt;jayashree-d@hcl.com&gt;<br>
<b>Subject:</b> Firmware update for bios/CPLD <o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; We have implemented the firmware update for bios/CPLD for our system.&nb=
sp;
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;So, we have submitted patch for this. Please find the below Gerrit =
link.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/39341"=
>
Openbmc-tools: YosemiteV2: Added firmware update support for bios/CPLD TEST=
ED: Tested and verified in yosemitev2 (Ia7deaf0f) &middot; Gerrit Code Revi=
ew (openbmc-project.xyz)</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As =
of now, we have submitted the code in the openbmc-tools repo.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As =
Patrick suggested, No recipes are pointing this repo.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,=
 Could you please suggest where these code and scripts should be added ?<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar. &nbsp;<o:p></o:p></p>
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

--_000_HK0PR04MB29643D1E4C034D9EFDB4E4C5FD089HK0PR04MB2964apcp_--
