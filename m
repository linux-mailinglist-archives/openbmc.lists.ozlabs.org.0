Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C939BB2D
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 16:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxQh54mfqz307Q
	for <lists+openbmc@lfdr.de>; Sat,  5 Jun 2021 00:51:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=r7XmdVe1;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=r7XmdVe1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.124; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=r7XmdVe1; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=r7XmdVe1; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300124.outbound.protection.outlook.com [40.107.130.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxQgj4b1Wz2ym4
 for <openbmc@lists.ozlabs.org>; Sat,  5 Jun 2021 00:51:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcnR8tr7b8ATYA5oVhxX/f6qPnTZ1oVK+Y6kyuw1ojg=;
 b=r7XmdVe1myV8/D62M+tgiGahO4b8QLytvAp4yYiZsmglId/fBQs4P2rg3Our7WljwqHN67r8yp+Jmt9l6AMflkbpvbnlBzBL9YKB8e17gWdsO/UGnvjUCDqwpT5Ye/+1LgpSiLJSb4VvmcnZ78wcb65WmDH1S/Q5t/kqLXZHYna0yhGWJy/kG/XdXiryvMDQ7JLNmT6/faTvkTOA/TKO3WU87c5I8XbNyxm4Dt6pfxB8+E1I1JlNg51nCsNk6hkw19gx1+CRHE1Da55ZV0fy86T+Kz7zsd/ysIbB9N1o1KPCLjBdb1ousW8YbAbYpV8w4HL2ZXgOuCLqoNSr5yjgNg==
Received: from SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) by TY2PR04MB2573.apcprd04.prod.outlook.com
 (2603:1096:404:4d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 14:50:48 +0000
Received: from SG2APC01FT040.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:40:cafe::1a) by SG2PR01CA0128.outlook.office365.com
 (2603:1096:4:40::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend
 Transport; Fri, 4 Jun 2021 14:50:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT040.mail.protection.outlook.com (10.152.250.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.18 via Frontend Transport; Fri, 4 Jun 2021 14:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWps4HL6z/+0vb6vY3n6Mwk8b44bhXTtssTAu7Dqna/H5ZFeBNE2JRh7dvkjJwm2w5/n9481klbr93EY33jnwp9TGLmFsH4F6ljKA0Zrijp+BPHbL/JGrLaUrJO3TyShig1gPAWagNufiic9KoWR2zI3kYh63CSns7MszP5bfJKPoMTbBo2U9nAX0PuzyDdm8sQeARC+4A70Lf3VfCxHpFwdhfzWl3YFvxpLxWNQRxWTp6ZZb6MZKO83L0bRQG/PMWVKp1QqeVQhnB1tmSGjlDnpMdlJZzYLCLob6hmF1EghT68YET0kmD9nT1NenwVL1j6G7dhZT2YocMEClsWytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcnR8tr7b8ATYA5oVhxX/f6qPnTZ1oVK+Y6kyuw1ojg=;
 b=KWdu8K6VVzUgc3GMqwsiw1sKrDgELIXCAau7gTuKJ3//KljuLkVZUCV1veEzNZBztSHWM9irKBj4Qwuq7sAUFfIBd+dRyoDExpTbHXS5RWvOgEobBeln0I96+kfOwJudi4zMCWH9SIyGRQTMB2Gpaj/0kZy2RhdrrCdBF3TNeaaGZW7JtJo9CwmCE79IcJ1qhU89pN3f6cdZwjHDo1+ptms4DF5guVtsR8cddumOe7gQ58gBvxkYjd5XlTRVSj1WB4oHt4vqnExzHEys+dJJNhugVikWJmYQNuMKBXibA0U15ujcRAiV3qUEFEVeTUmVtj9xi2bLBxOBZo9hq+/G6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcnR8tr7b8ATYA5oVhxX/f6qPnTZ1oVK+Y6kyuw1ojg=;
 b=r7XmdVe1myV8/D62M+tgiGahO4b8QLytvAp4yYiZsmglId/fBQs4P2rg3Our7WljwqHN67r8yp+Jmt9l6AMflkbpvbnlBzBL9YKB8e17gWdsO/UGnvjUCDqwpT5Ye/+1LgpSiLJSb4VvmcnZ78wcb65WmDH1S/Q5t/kqLXZHYna0yhGWJy/kG/XdXiryvMDQ7JLNmT6/faTvkTOA/TKO3WU87c5I8XbNyxm4Dt6pfxB8+E1I1JlNg51nCsNk6hkw19gx1+CRHE1Da55ZV0fy86T+Kz7zsd/ysIbB9N1o1KPCLjBdb1ousW8YbAbYpV8w4HL2ZXgOuCLqoNSr5yjgNg==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB3041.apcprd04.prod.outlook.com (2603:1096:203:88::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 14:50:45 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4150.034; Fri, 4 Jun 2021
 14:50:45 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Getting "Null data Attribute" Error while sending pldm command over
 NCSI.
Thread-Topic: Getting "Null data Attribute" Error while sending pldm command
 over NCSI.
Thread-Index: AddZUQWKcJvB44UxSVazH+kkI19JPA==
Date: Fri, 4 Jun 2021 14:50:44 +0000
Message-ID: <HK0PR04MB2964BAA1D480B3976DDC7FEFFD3B9@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMzk5Mjg3NzItMGU1OC00NzI3LTkzN2ItMmM2ZWQwYzg4ZjJlIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjBKNTd5d0Z5TSszOEZ4SVFMY2owZWJUQUNEVWlsKzV6K2UwaGRnV09MN0s2bGtDWk9lSnRGOXN3RWdpYjNlSHMifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.248]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f480523e-37f4-48bd-3823-08d9276823e4
x-ms-traffictypediagnostic: HK0PR04MB3041:|TY2PR04MB2573:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB257358950E47AB5AEF94B799FD3B9@TY2PR04MB2573.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MWnAuJ1/MJGABm98xoD0m1XQ5XOk271WzCBM3T3potuKXYWH5wWpb511Capifaf0ynWA7IbJSxCsYdufcy2K1RjkXtcfLOeUzy/YX2yDVqzHVVz9b72GtcDd8Vs/1f4zeCWQ3H33/wsQHkEnfPNUh1db221HWN2YYCujELDrcy7lxiXeQ5NWeg5MQwinFJe/HqAoWlFfZokVe1KdS1EMBKrdlDTQJ2g/zdCYQWXGkfOvLwCff+dq9hVFlvUprZVr6WZU1ukPJD21xz73mzp9exM40TD7yoAVg/VA+QBKVBauTYmHQAH/oFXdH0cjMSBVIv0JwvQVuDaj0p12xki+ciAMCfDEcY+jBTqJOMES+RTRRtxVg5MxOeDR1J+Njj3Y2D4aaFlnnesdiyocv2+PBiKEdxY9/aLLu4C7+QT4fdvK4XEUScoCFpDb6O3QKqukwRMv8C4ZlEpC3B2hR5b5hX5u9icO/FG0TICLA1DhBFVUj6T9HOmBezncJJB6kpeWJNCrfKA2g+kaOOIpZL25Fa5G3LHJ4hSRj7D+AyDbuXJxY6KL49n5WjtuJkcjOBymbNUivHluvgp0BTKm8XJn4lxWb8uXJfeQ/RdAfgtLyxznOlQMr7/mtYDrCQLko3aIQ2E1ZiKEB1u6K2bYcsWFgsVD8bbOi9IBF3/NyI5yYJ60r2p//QKjqhB2McpUOdpU2CbNHT0qSoacTt2BsWWakdGMmgjgEpwZ0Ca2+3YqPj0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(4326008)(8936002)(186003)(26005)(478600001)(8676002)(55236004)(76116006)(71200400001)(7696005)(122000001)(9686003)(38100700002)(55016002)(6506007)(5660300002)(66446008)(66946007)(64756008)(66556008)(66476007)(6916009)(83380400001)(54906003)(166002)(2906002)(33656002)(316002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TZ0Y5MjXlwlWih3cf83w5pjN+v0C4gpjk8SucUOsZuyP570FF71Bl/Myztgr?=
 =?us-ascii?Q?j+ixKAa9dGAsXziymjvjVQK7pviEqdBb8RfWM2bEL9Nw3wznAaGKqJ28Qp+Y?=
 =?us-ascii?Q?E5ZaADVv2JrUlgpcr/Hd6gsoY9GM68fih/q+eRysPUuC8WszeLoOAXNi37RM?=
 =?us-ascii?Q?gFoNAvqxbBhTZNJdpyE0SIl7Y7bfhm9WBTu2UnLVCzEPmx6zJTSZd6ycw2Bc?=
 =?us-ascii?Q?p21f1GJg++CEhCKmXuIElB1RSzo3u7eW3e7zTdf2+LaNxKEyUI8ZeFtdcWJR?=
 =?us-ascii?Q?IT/JGlHCQsd4funDN/HvpviwtepZ0gMaepA8xCgdKzxbLN6NzA8ZEtgsBljq?=
 =?us-ascii?Q?x4eOzgEAziSGruXZ692DnAo4LsiH0aMykq2To4kqztb/DANJICjpOFNFBnh6?=
 =?us-ascii?Q?UPTAfgrXv3qrxhJUGBxw8IEnkNMqwTHz7eR5axqTLGwQdUOtAnKwAKmchql4?=
 =?us-ascii?Q?uamPWoAvYH8L2SI2qTyoloZtXewUKNMKi5VENMuUlYzYsj1v7QcFF2Yee//z?=
 =?us-ascii?Q?iIDieP5fWyNxSMcJekO6xKhooN8mdubbwN1sgftydJMZT67n9/nNOgBZFVbp?=
 =?us-ascii?Q?vbu8xWgAedEgeJcP5pJYSl82kYV7iLf5SVzQ6vLB6TQUngf/lF/GQEiLqP9y?=
 =?us-ascii?Q?RgmUE9QoOBXDOU9bgytK4R41mKti3jamCyQEn4lqZKn7bU2Q4j/fbuKtZ59A?=
 =?us-ascii?Q?wGlsVpLxJCIjIt+iIVNLF3PQOx2yuo9Rycpci2UHel5uTcmZaL6lXi4JyOrT?=
 =?us-ascii?Q?uJ4ObXotVr6ZI9fMQz7e2LTdxPidlqPNCDhw8IeItEIptvm5UK1JZlTOXV6v?=
 =?us-ascii?Q?VRCCX9pat28oapyhIn8wIOO2RIW/wSvk+C5pRJRWavPq0Kw8hgwulKyZHfBH?=
 =?us-ascii?Q?2wFjF0Fhf20lNe+avmVDOgLN7uN/dRzmGwia2fE4ZZ6OX0qkl2uA11ep1YY9?=
 =?us-ascii?Q?uUm4x0/mf/KoEMSDglIypqjOoZsgKNVzYcA0W7E9U01z+/2eQaMgAx1Pxtox?=
 =?us-ascii?Q?7+V4GfkWpuRTmmhRi5IwQt9iBOmmuEyzKDFFIhmte3FqKl9y19LubJ8cxZ4q?=
 =?us-ascii?Q?9sqIuRjQoVWZ00cOUs+QxbpK95nQcymAFbhpoKEer3I+Gi7ad0FPdvlvsHMI?=
 =?us-ascii?Q?FbwSveRXiMgKVMPBkmGcLK0sUmwuLGWvpaBF9nYfP0uFwH3GsIlL5AHWuChN?=
 =?us-ascii?Q?p87XRiP5XmdLqbLIW9zk4GhHmcjT5VR3fKEhjFtI49lNEhYCIWFJswzfH/PC?=
 =?us-ascii?Q?l69OoV0R69T5rbyo12LOK26NXm81Vq9msfVfpH2VqpLITfa0DYnHgKB8TCjH?=
 =?us-ascii?Q?TzLfH8Wn7IhGaxDe1XWGc8Yh?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964BAA1D480B3976DDC7FEFFD3B9HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3041
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT040.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0b43c112-997c-431f-b0e0-08d927682201
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LLL55l6t4O8lhYM3tsBXENVsl1i38XYrTsLLxaXjrtEPeUn7RJSbVfH+4zOqT828rM+gQhzankB6WSThNOIW1xB45lx6O1/utpw+SG9TallHOZLjMw9wGFVsBM9l4+LqIupbOAteJAzSLge9AXdWnGK2V9TiVRfVFvYW0R7dWJPI4ZAPifHK0yHNrvaXnd/mHsvCdJzRJRr1nyLansEbsenP1v27iVe6e9nQOGePNrB22DMpvKlk+ttteV6acc0TVx/3Qsfd3sp76nmsepuDYXYLtA9gvNme6EQGpA5+OkVwDECcsO2L66+gOZLVmH9i0UBdYcmDuI/VnRA7myv8ucSlh1Sqvld4aXnGH/upuYdtnVKbIiGLfqN8T3AolUZZzVsc9akeXkpxY1rjokr+9mc6U5iOsGSD4MUjmTmKV1rc/Z/DHxi98qBUGEdAaTpurPAzpW11OrSFupuh8cU4lLjITZB9HbJPQM4T0HUcqA/5x6PdwuTnoD04lFtVOQ6uRPAyBzdzdvUcTsQZQ2omMRifyPRp7Y5fne/RLcygByE1mt224/BcBKdTYZA1IMMmNFjZ3buBn/5cVGjHYhAIfc6ICmwZToedpah4XefqDg90Whetqw6CrCpH0OWhpyzoorJra7U5SYOTrytIajjg4qTFQl6MBVnrKNARPG7vtzcSw9MEpSP/LKAJi/etWhCQU+sI84dcJjMpJ5L2RRc4S4XuoVvCpLh1aPOvD4fG+5YJMTiogulOuLn7Fbi7nLMvXUSbo1ELGr8qe8bST8YdXyLTeyJgMkt2kpNtFX3zOCI53zvcOvLqgNGZeLXjapR0L4+3rTFNBukBXB7ETeU5Tg==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36840700001)(46966006)(166002)(9686003)(54906003)(83380400001)(70586007)(82740400003)(6916009)(81166007)(36906005)(316002)(478600001)(55016002)(356005)(6506007)(2906002)(55236004)(8676002)(47076005)(86362001)(26005)(186003)(8936002)(4326008)(33656002)(34020700004)(7696005)(36860700001)(82310400003)(5660300002)(52536014)(70206006)(336012)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 14:50:47.6949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f480523e-37f4-48bd-3823-08d9276823e4
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT040.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2573
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
Cc: "rushtotom@gmail.com" <rushtotom@gmail.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964BAA1D480B3976DDC7FEFFD3B9HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi All,

         We are working on NIC firmware update over NCSI transport for our =
platform.

        Getting the error "Null data Attribute" Error while sending pldm co=
mmand over NCSI Transport.

        I have raised the issue in the openbmc pldm issues with details and=
 logs.

        Please find the below link.

         Getting "null data attribute" error while sending pldm command ove=
r ncsi transport. * Issue #23 * openbmc/pldm (github.com)<https://github.co=
m/openbmc/pldm/issues/23>

         Please provide suggestions on this if any.

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

--_000_HK0PR04MB2964BAA1D480B3976DDC7FEFFD3B9HK0PR04MB2964apcp_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <sp=
an style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;co=
lor:#24292E;background:white">
We are working on NIC firmware update over NCSI transport for our platform.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &nbsp;Getting the error &#8220;Null data Attribute&quot; =
Error while sending pldm command over NCSI Transport.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; I have raised the issue in the openbmc pldm issues =
with details and logs.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#24292E;background:white">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Please find the below link.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a =
href=3D"https://github.com/openbmc/pldm/issues/23">
Getting &quot;null data attribute&quot; error while sending pldm command ov=
er ncsi transport. &middot; Issue #23 &middot; openbmc/pldm (github.com)</a=
><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ple=
ase provide suggestions on this if any.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
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

--_000_HK0PR04MB2964BAA1D480B3976DDC7FEFFD3B9HK0PR04MB2964apcp_--
