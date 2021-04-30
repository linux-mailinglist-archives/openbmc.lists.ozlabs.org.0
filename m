Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DB136FC5E
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWvqL6kZ6z2yxT
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:28:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=bOkirizv;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=bOkirizv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.95; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=bOkirizv; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=bOkirizv; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320095.outbound.protection.outlook.com [40.107.132.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWvq34mqkz2xb2
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:27:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xepSPu6cJmZOGaz8jICUH22/ctNJL+CYYNWpgDwqqN4=;
 b=bOkirizvVqPRrwLFZSUQm3fndLbiMf+mb6ORmG950hqpVScvtcUtrKRW8LCK4QYGNRpERMdF4RosPIMEmhqHMgz718u653UlDpLznlzo5CRgdZPRFFDLdGMg+D//b7kFpaWfVlR9E2Ikidwg+hE9JyPmf9B7YM0U+v8antgWs5d47oBBqwl1viQ1Xsensl3oas3IGMJeSMcfeZmHrNzQawP/ajb4lpX+s3ofV0B5fuHaFWJKqoa7OJKaiZd4vuzUetpQDwHTSfOAJFroDzspoFYGiOT0Gvfx/7kWdgopN70CGPCESLkq9hV3U8HDo61w3hfjJGN6JO9Vc4SBJrhQJg==
Received: from SLXP216CA0017.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::27) by
 KL1PR0401MB4498.apcprd04.prod.outlook.com (2603:1096:820:56::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 14:27:52 +0000
Received: from PU1APC01FT047.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:6:cafe::a3) by SLXP216CA0017.outlook.office365.com
 (2603:1096:100:6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Fri, 30 Apr 2021 14:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.59) by
 PU1APC01FT047.mail.protection.outlook.com (10.152.253.23) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 14:27:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYfeWjZXHuCJ6Dz6+YKnuZrhaizThhzSZi3WPhDtofnaniAXRWNUFG6mWDDWh8vOuxI4wwrmRKUdC5i6cg/QyNOcIi0ujDAwM+rtvu4gC9O7xqO6v2n7bxEs+OKmD+Ow9Vkk2HGFFkOeEPp/Udk4owr5N7W4tzcatDIQhdfI4G1qR1xeSg7Z24TNFfHGNXPHwT5P3aztZpUb0xL5PAKh/YqxsL+49Ad3jqdY7+vJA16uvp1qCii38hk8KFeutqKPB+2jJXEwLNafKmeoGh+oEBvFluyHupWpgpzhQbOJR/pIAJFFltLVSyf3o/V1nEhWH+USpjEZ4/mwZ2nxhF2VMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xepSPu6cJmZOGaz8jICUH22/ctNJL+CYYNWpgDwqqN4=;
 b=Bhzn7UJiBHzFCPkyxBdUWi2F0ChSEF2l6xX+w4kVTrt3+t3TBsch6sWCi9dMB3FrgG+vPGyCNSvEXQTHMhG8WMvZ5ZIU+7aVJcD0ys1TQi26lpcLB2/HpSaTFIz2z1re+OFFENAr7rqf2VVGjzTMaadvSo36UlB66oMnYnjY/6TGvsbVopjzgDFfdrWzEAANRvDJ3cvP886oEwQZKuWkmfUOEamRKH40f/tt4Y2Cjgdl2j0CIg0MmVoU4UP47iLzjL0GJpbJrN3Z34e3KF2UftqefrppAzFITx9jn/Fl0xfUzfKkWJpzCygmkq9pm7gtvyvQzEA48Ua/EgYUzGtbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xepSPu6cJmZOGaz8jICUH22/ctNJL+CYYNWpgDwqqN4=;
 b=bOkirizvVqPRrwLFZSUQm3fndLbiMf+mb6ORmG950hqpVScvtcUtrKRW8LCK4QYGNRpERMdF4RosPIMEmhqHMgz718u653UlDpLznlzo5CRgdZPRFFDLdGMg+D//b7kFpaWfVlR9E2Ikidwg+hE9JyPmf9B7YM0U+v8antgWs5d47oBBqwl1viQ1Xsensl3oas3IGMJeSMcfeZmHrNzQawP/ajb4lpX+s3ofV0B5fuHaFWJKqoa7OJKaiZd4vuzUetpQDwHTSfOAJFroDzspoFYGiOT0Gvfx/7kWdgopN70CGPCESLkq9hV3U8HDo61w3hfjJGN6JO9Vc4SBJrhQJg==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR0401MB2161.apcprd04.prod.outlook.com (2603:1096:202:d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Fri, 30 Apr
 2021 14:27:49 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4065.033; Fri, 30 Apr 2021
 14:27:48 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>, Matthew Barth
 <msbarth@linux.ibm.com>, "M:  Matt Spinler" <spinler@us.ibm.com>
Subject: RE: Include sensor monitor for our platform
Thread-Topic: Include sensor monitor for our platform
Thread-Index: Adc9o96EIrVJD470RVytXsEFBmz39gAJntKAAACqSHA=
Date: Fri, 30 Apr 2021 14:27:48 +0000
Message-ID: <HK0PR04MB2964606A0C823C9601754AF4FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964D4D925F6883DF2342D48FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <YIwPdXmVD5CCJWzX@heinlein>
In-Reply-To: <YIwPdXmVD5CCJWzX@heinlein>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_C0nf1dent1al
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZDcyZDg3ZDgtYzcwYi00MDE2LTk3ZGUtMDA1ZmQzZDM0MWUwIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ik1SaW1SMXF2dGQzU0pmc3JJMjZ1eU55XC9lVTZnMmwwMnRWQldLNkRKbTVTWk5HNFErR2JxYytTVnR6N0JtTU9OIn0=
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [106.211.243.210]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 26bb4ecf-8d00-4dc1-e710-08d90be42365
x-ms-traffictypediagnostic: HK2PR0401MB2161:|KL1PR0401MB4498:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB449898FE1ECAAD31E1E7FB0EFD5E9@KL1PR0401MB4498.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JDy6cRx6LqvtMfYj9qSvlvfwN9NcL5x0tDvaO5tOnzgVgiHp1KS7MJm1vr9ITDCDDl4IdD+VmDrhWSXVEg+Lz8e80NW7M5e00c84aC1AvWO/eIwZw4HJbUivJ5itOAgnTfrGjckPLQsntDvtoEe12Jg/i57NPH6jTmydspXAOzC1w0QvC/gghv3hNbHPaYqyKdOXS4xjg/RolCf06zTvLxJEsI1bCGCkaqCl+yj7bZIKJPOjGieyDfC1UbDt0oapTnfFswqNtuD3Ocsqy6lC9aW7x9prdJfG8PJ52TLhtMjC8PKHQ/0X+iJL7cXWHQ97RHls+TNgZa/8VC1Rfkkz7E5+o/QnuMsV+faAnhwfiOFosokfgAlQYQn+/ozQbCHu/KwnyqtdMYUnI0HbsoT0bCiYSE+P6L+ZHlDMtMG2Xu/r0QjbKoLvt1SrEy5pAWqky0zxvExDGR4IdR8qVeUep9BjmvKB3/ENTtOm/p1OrRck6pRsyzV+VR4oMKqN/Nbst4QOddCbpmBZfi48oEyz30ZjJUuWYXQCElu+iXUIe5BML//442B/5EKWSS3NdN43w4dfUONntDxAO+ruFQDzm0qMcCuwQvEpdmRAHTwWm1c=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(8936002)(71200400001)(8676002)(38100700002)(6506007)(4326008)(186003)(54906003)(86362001)(316002)(26005)(122000001)(53546011)(33656002)(55236004)(66446008)(52536014)(2906002)(9686003)(76116006)(110136005)(66556008)(64756008)(55016002)(83380400001)(66476007)(7696005)(5660300002)(478600001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?27Ew6F0AADfQbYKxdFFYqVuOc3AZo5FtIDh40Gt79BBD0wmHfjPi1/5hWMqu?=
 =?us-ascii?Q?5W//6yFk1WwSfHFc5TpMBKC9Purm4IJYmm1V/MiR4akbbshPXBNMGIVu84Kx?=
 =?us-ascii?Q?NWkZUyzsURAg/rNKG5zV5gOdqKV+7NKpCN6xU631/OmggJUSZ1SNCebdhQn4?=
 =?us-ascii?Q?/gr6Mg4/Dk53c00h5kcxx0VfTVBnCEIBcavFbnNDNmd1Ez2TS2UaZZgbTJjg?=
 =?us-ascii?Q?LqmWyO9qGQmPiIwFQB7KEszWjAfnSF+c3zm2yTZ9NHBbTff9AzedqFMuCP2x?=
 =?us-ascii?Q?tRnEVyv9OVdluAvSPxq5uZ3iLADHQTK5JIylJ12S2oZ7yXRL1bwrteiT44Q9?=
 =?us-ascii?Q?V/cNicgoqHW6PzZMRC9Cgw5cbHJLu5XGLBkeOV+BAzZnDk2FWxsAz9rh9YBK?=
 =?us-ascii?Q?hQV3mOcjLlj/AggfVpYGbXjZfg1O3qWX35whcQ3UZHflYC9FsuFpJa5ao25o?=
 =?us-ascii?Q?f2aDFjoHVqFyNjs02DaS5lANEnXtXejAcSwlrblcbOX0Os/Hr6zir/EuF9+N?=
 =?us-ascii?Q?DR94UHMGdNjEVi43OAAal1YNFQ2HGnRB7ei4SbEWa+ydoSpuUxpNscZAdInq?=
 =?us-ascii?Q?zTjCrKzdnqewHl8OuPn9E4WqoH7m3kYFxjXnB6k39qYf372HNQDr4Ht8+Ams?=
 =?us-ascii?Q?Xy0+vYXPOF68k5QDBiC47XVor3aDP7ntm4i1InWMSxwez4kGfTTPwYpmuC1v?=
 =?us-ascii?Q?C1e2KrA/WEsnW3BtyO0y+pOoJ8WYrM7rvoTUzQlmndCzCZnNA24Ef2ONvVHZ?=
 =?us-ascii?Q?80k4gb7ORmILupOLpzrRj4A6BQevxv+mnj3g6D1luAMSKoHE2naBUCoL3oe9?=
 =?us-ascii?Q?ekQRiSZDzz+8irU5wnZTYQSll15jyGeYB/oYeGawnJyKagVUDycbB+KM5hTc?=
 =?us-ascii?Q?P7q9GS9jnxgYa2QsdAqDnfWcm5iWcrdsK662UpIHjGVA7ypBexeObMi6qknI?=
 =?us-ascii?Q?/bIwwNLU+SzLMyzCB4psBstMimCsfP6Wxijm0ES2+tNd66s0IhkB1e6gOnwf?=
 =?us-ascii?Q?Lw4UV5c+6GVWJ5Ksis8ADepBhAdLKXTFVk1cwWRV7lMYwzPVtlVXjChhi4GF?=
 =?us-ascii?Q?1xtFillc5wZ/af45eiaBjsm++jcw03Rpby/7WY4f7AFNV+HxeUDx8Xa9ecQF?=
 =?us-ascii?Q?NmsmOX9x4UXV1qmUl9rhgSXwyEuuKmMqg+J97YEI7GOHO0QBS3Dp9Qw/njLC?=
 =?us-ascii?Q?4ippAPCJLUt2J3ABUtEgzSXfAT7m4vu0tnSubO+c6di7AyhoXtZ+8gqp4SWA?=
 =?us-ascii?Q?KGptjn1E/7eW3cwqLBfIbqiaHvff8H+tFTOvULCCgB+DFQfGNaUzlWpsi1kQ?=
 =?us-ascii?Q?dPo3OfM23n8fdtK5xFOiS87v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2161
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c043b0a1-8e14-4017-f3ec-08d90be4214d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jh/+a9WDUL4vQNI4CvGC93/xZ9/DKkIB08w3VbwYHBSTpk2h83RSgsJt2vlb161kSvnT8Kk49MinNCGdzfmZUkvoj/2G2r6pqT+l7n5rkm+GM3IkphI/zyvz8tamH3lwAbk9ZkGIUXH5XAgnoptOP+asYROlrkqq7xFYW4e69IkfBu+UCrRZD8petDpP7FQYxFomagg1BhmfWB2mmKraDIlCOTtR7tzKcQ2ZRRA4UF4myC40iF/DL49dHYX1ML8vXzawekb8zRofZopTxUOrk2gJdvtTkn/iUditLyxDDbvQ50fjh3Ez+FShP/fdlMFGgPtuHu2pL3+LY5LLJOQoan5r54az4df2ktDymQ9J4EUf3MoHhOJPkdBYWxFZbU408TQ5UvmLpzJNcxfhbGJdrmZOvvm04dYu3tnC/hIlEW4DGmqN4mWRwKjnZjPh/f7AjrjrGAFSpm4pPzJg2YMWt0P8KwEqaO/zLKxsQ21AOfCpQLF9Yif2/ObvZQowmkWiUnsi1GDONwpN3ArJvZhErJUHQR1LiOZJ7+TuoTlQgDQPIu+4jczoT6KlyMf19Pn8yKOvJ33LThPsrh5NqL8r2HpPjVvNNk2npS/P9Xw+/WAulRNrpjTvvSG9d06ru04bbSsmBbRdN2XU/OqnWwqTTAHW+EtlcCOAKvw0BPsstcfKTzeMero5aC6LeLvCc0yhtvDqeymf9IZaIQ73ZN0xJfKrbmhg71g8Y4TwER7Bz2U=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(53546011)(110136005)(36906005)(70206006)(55236004)(316002)(6506007)(82310400003)(7696005)(336012)(55016002)(54906003)(36860700001)(86362001)(34020700004)(70586007)(83380400001)(5660300002)(2906002)(9686003)(52536014)(82740400003)(8936002)(4326008)(356005)(478600001)(33656002)(81166007)(8676002)(26005)(186003)(47076005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 14:27:51.5049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bb4ecf-8d00-4dc1-e710-08d90be42365
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4498
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Amithash Prasad <amithash@fb.com>,
 Manish Kumar Thakur <manishkumar-thakur@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Confidential

Thanks Patrick.

Added MAINTAINERS.

Thanks,
Kumar.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Friday, April 30, 2021 7:39 PM
To: Kumar Thangavel <thangavel.k@hcl.com>
Cc: openbmc@lists.ozlabs.org; Manish Kumar Thakur <manishkumar-thakur@hcl.c=
om>; Velumani T-ERS,HCLTech <velumanit@hcl.com>; Amithash Prasad <amithash@=
fb.com>; sdasari@fb.com
Subject: Re: Include sensor monitor for our platform

On Fri, Apr 30, 2021 at 09:37:17AM +0000, Kumar Thangavel wrote:
>           We wanted to enable the sensor monitors like "ShutdownAlaramMon=
itor" and "ThesholdAlaramLogger" to our system to monitor the sensor values=
 of our fan.
>            These monitors were created under phosphor-fan-presence.

I don't think there is anyone using the monitoring of phosphor-fan-presence=
 with the control of phosphor-pid-control, but that doesn't mean it can't b=
e done.

If you look at the phosphor-fan recipe you'll see that the default PACKAGEC=
ONFIG is "presence control monitor".  I think you'll want to bbappend this =
to only enable "monitor" (and not control/presence).  This should configure=
 the package so only the monitoring parts are enabled at compile time.

You may want to cc the MAINTAINERS of phosphor-fan-presence for any detaile=
d questions you run into when giving this a try (and copy the list).

```
M:  Matthew Barth <msbarth@linux.ibm.com> <msbarth!>
M:  Matt Spinler <spinler@us.ibm.com> <mspinler[m]!> ```

--
Patrick Williams
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
