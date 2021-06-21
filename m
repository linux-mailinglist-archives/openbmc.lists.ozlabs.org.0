Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59E3AE613
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 11:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7knk6QR5z2yXd
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 19:32:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=BcGzVORo;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=BcGzVORo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febd::71e;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=BcGzVORo; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=BcGzVORo; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::71e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7knP1wcdz2y6B
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 19:31:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sxw4CTwe7mwzkG0A5w8NVQ0ACH0SQhThK027ZW8nLLY=;
 b=BcGzVORo4/567eYB51vZupoubkLNd55mw8Yws8z2RANf8YOxCHhpPbVs0lpnv+f1LaScIQkS/TitHEy+0z3bCNvxn/KfqoXhgVMGQQV8PjLipjqOvIFyrVHgD22iP0V0PhqkMFaOj99EQwJlJK+e5bc1aSaXsFsJHSBDKhu6y81EyetJg2B3hABCiH1tCRnjiSlDrsOZf0HIWIANsfdFLApP2PVor92mY15623gLJUMGomuL/CL3/Bw/nKnUnG7gcThl4F6cWeQSP/QeBvrJCCL6OV2vwK+Q2sPobEjePulM2nt/sYSuVMWGAMxN5vNsaas00vNTdx1veFiWE+5E/Q==
Received: from PS2PR04CA0004.apcprd04.prod.outlook.com (2603:1096:300:55::16)
 by SI2PR04MB4601.apcprd04.prod.outlook.com (2603:1096:4:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 09:31:44 +0000
Received: from HK2APC01FT106.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:55:cafe::2a) by PS2PR04CA0004.outlook.office365.com
 (2603:1096:300:55::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Mon, 21 Jun 2021 09:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.54) by
 HK2APC01FT106.mail.protection.outlook.com (10.152.249.181) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geBbqjakfUSCGCsG5WtWiQWge6S6T/G6fEW/4l+8xaIeD1svf5zZ18lxkPSV4hfkGcMNfKkI1MWUaY2aOpDk+eQTHGCAiR8EnBJcH1Ls+fX5A0TLVUdLP5P3x59T/JZhNDlidHtltHyLv3f3BN/jSxvSrsThdQMuIvABoxkJIGrT9bpkdxWHV6zm/8+JIA2E3bo2Ze5mggRSaoZWFBiK7sdv2hI4j7bV4Oi+tCtWDqz5rFuNaq2XhLIHrw46zodUA4VCD5S1YFJsu6ab/09+BtxEiiDDpOhlvNJJTND/5uC1caVqwHvDHfchDy27VZS10MSNlKtSlHZO+B9vlhcA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sxw4CTwe7mwzkG0A5w8NVQ0ACH0SQhThK027ZW8nLLY=;
 b=dFQXwM5HzYSP0oTbMF7Wzgkcvqwx0fnbveLJut9MTyukQMibJtP/Zyzbz5S4rUPN9BbPdbCHjBSMOIBrPlbkn191SJvJJwk+IjP/9NmxPZcVzGoidhu38xxwDDyCocIpUInZxKufJyji2eV1W+rrRDY6o16LevVijzOu8xtlXtR4qz7d6y1vEgCRrqfmy0COQV8MQAZBMa0xnIO7RBaiXEChGvHmaE5eKUsgHMtKUEKfMrSmY3x0g0rsqWyV6O3jy3FPb1hSr/Tjf+m+wjeFUXKP7ynP9aqBI7SIyuK7GqucBGbh71bRlHBJT2VF/9xhVEDf+p/85brseFasnxnA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sxw4CTwe7mwzkG0A5w8NVQ0ACH0SQhThK027ZW8nLLY=;
 b=BcGzVORo4/567eYB51vZupoubkLNd55mw8Yws8z2RANf8YOxCHhpPbVs0lpnv+f1LaScIQkS/TitHEy+0z3bCNvxn/KfqoXhgVMGQQV8PjLipjqOvIFyrVHgD22iP0V0PhqkMFaOj99EQwJlJK+e5bc1aSaXsFsJHSBDKhu6y81EyetJg2B3hABCiH1tCRnjiSlDrsOZf0HIWIANsfdFLApP2PVor92mY15623gLJUMGomuL/CL3/Bw/nKnUnG7gcThl4F6cWeQSP/QeBvrJCCL6OV2vwK+Q2sPobEjePulM2nt/sYSuVMWGAMxN5vNsaas00vNTdx1veFiWE+5E/Q==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR0401MB2162.apcprd04.prod.outlook.com (2603:1096:202:7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:31:41 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::2c97:c270:68a3:2fb2%4]) with mapi id 15.20.4150.035; Mon, 21 Jun 2021
 09:31:41 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Adding dependent service as Entity-manager to Ipmb-fru-service
Thread-Topic: Adding dependent service as Entity-manager to Ipmb-fru-service
Thread-Index: Addmc/ZZ5PCR+QoITnuDoPAFw/NnXQADGpsA
Date: Mon, 21 Jun 2021 09:31:41 +0000
Message-ID: <HK0PR04MB2964EBAACD7025A165BB68C1FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMmQwMDk5NWQtOTJkYi00OTY2LTk3NDctZDBiY2VlYzg0YjhjIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjV0YVJIZTFXVnZvMVVIY1h2V0VPNWp2eUVuV2RQNlhcL0d6OEtZa21KVnF2bjMrRVNCdlE5eWtBOGZIbDFpc2VaIn0=
x-hcl_cla5s_d6: True
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.235]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 13e6f4e8-474b-4fa4-2414-08d934976241
x-ms-traffictypediagnostic: HK2PR0401MB2162:|SI2PR04MB4601:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SI2PR04MB4601452DE590F36FFA75F7D8FD0A9@SI2PR04MB4601.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 40n1tHYLYVh50p3dWlpqwR1HKQr8hscPHyoGKVIdqC9xPy/emGt7QJjJ9vm6G+EMNaXkApLn03KBKbDyxFVZj8qwM9k4j5Xeiipcb1bYXqE4b0ovvX9Tl9Qi4eSUlI2ZAIYFnEtMY6z/JFns6WJl0y6qdNjgCsZAHcg3QvkMEFlgIqorRtl6yv6M5v7Fr3fEKtMjdlwwfdjg716dHKpe0L6xVZK/Nd63EJspAylwx0R/TplBlOmuynjt9PoNuL+EZpIqFkzIEh4Ru6Bk2JZgZR1uPED6goVM6y66JwkriQswVVilvAc4Fpic93QXNnuCX54D6CCXkYBvkvtT/+M4946l8oTCtMmv8km56MGR/E69gVTmqpkXITq9D+Rh7YsBr2U1BOqkwwaXBK5rMn3u3eymUIh0EsyxyJBad4q/WhXwscSmQN2gjq5a5NtLiW9v8WexqKRIdow5Ka2MU4PLmL31i50TjXgZQ5tc9BPuMPDC8O+LzLVFULMDtcrAjKlJgu0LQyDXj/5saRkyLj5yApRStqAx1/HCT++w1fvG0kxREwHS9jiIVoK6OSvqfAmtImW6yTJPEu+HtOuUi72UleG0pWEo0K5Ao4Sls9JSVjo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(8936002)(9686003)(4326008)(76116006)(478600001)(38100700002)(186003)(53546011)(55016002)(26005)(122000001)(8676002)(6506007)(6916009)(83380400001)(71200400001)(5660300002)(33656002)(52536014)(2940100002)(86362001)(55236004)(2906002)(66556008)(66476007)(64756008)(66446008)(7696005)(54906003)(66946007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oyrsCiPJXdSYfs8483pCDFFcTpBO47iHoPJpSTb/DpirgZEnAgo4a+U41q03?=
 =?us-ascii?Q?snsLwGKHXiDNSU17UcxU06/CaRSB8FVA0qdqsMO55Uj2fm+qLvV/W4kiN/Vg?=
 =?us-ascii?Q?ugcU1YaiXFyQsGItVVYVh2T5m+qHuCi5WPKd9usw7ukBQjLUedOisR6EOfHr?=
 =?us-ascii?Q?1XQUZK3kdJ+oycEHvQYxqY5lNTxDCcNiQeUIie4fFF//6XH3U4JxAxsk5SBU?=
 =?us-ascii?Q?7l/bR+A4FWWW0h6R5gyzfwWy+R6bOf/dw2hO5Xb+r6F6WuXjC77EpEnMGvF9?=
 =?us-ascii?Q?whXXeYz5QnXy3NZxyD75l//oriMvmBFIwZIzh2Lb1Km9CIOWMqh4wPFMB5T2?=
 =?us-ascii?Q?8mie41/tMtKb/GFslKqAegzwoH7oczGPZjN7OLyW28ksP+ph6flptsko5cMF?=
 =?us-ascii?Q?cdzmK7ae5gwsWCLa7qRr5pAsM04SP5g+ZNJwKxMaszkMD2EugFTaCrYkzYuf?=
 =?us-ascii?Q?EV6qSB8OIKjEg9t5fKCMlfsNGgdOlqXGgl+jrgDvPKhdahrEnvTJ7/9yC89e?=
 =?us-ascii?Q?IZQRLxKU7qOcqsJG337wftnNbKThEwtxBavMwECXI15ub4Ge3LsgVLUrZnkB?=
 =?us-ascii?Q?qJh7v0pj15WafQw5NZZiBenpca8i2GU/WCeQi1zpdGVR++1oiPTKcSquGTcS?=
 =?us-ascii?Q?w1VX6tx3olTzXt0xoIJltZGm2kb+YsXGAohhq45+tw678TxRATRmnTjbHkio?=
 =?us-ascii?Q?lgcIzaUzot7yPlLyYIs35pgt09YZ/UJ47Vvn87Q65TNm34eFnTQzlFZn+o2u?=
 =?us-ascii?Q?YC5PscNAwDQjZzvCDUjdUsXC+pF8trJyxIsVhJFlKaXcL6DcoNTag5eYgNp2?=
 =?us-ascii?Q?X0ZXwVtZ0OjWmzQ/SliJTUI9u2EY6r9u2RfVyBQlPrI0A+2o3z8ONnr+JfLC?=
 =?us-ascii?Q?FoKoz567FoQ8nvHnHkGbwv0KMKRyfUAagYd5K9KJEvExzc063tgBAXKG6eLQ?=
 =?us-ascii?Q?4RPgK9jQFNrOwNsiG/6UonYwIiFYQXsYcGX40iwFuaVbfrVbwdCtrX9RzvFq?=
 =?us-ascii?Q?bYasPspG07AmLvU+b2op3Zj9osUQkYJQa/BWxvq0Vn0fxNf8YCcU+eDSxwwf?=
 =?us-ascii?Q?+YoG/cPsBpefs50BSwqyyR7lEfM3/DMyckn34yPlPbkrWbipnpnQheMHHMjQ?=
 =?us-ascii?Q?MJqLd3hKPjJ/mSTIq3DIVrb2tdExBz/EOCaKEPssdUTCGNuPlWPWyLDcCn1O?=
 =?us-ascii?Q?OW3SgLjJkOBESyc/6yUcy22IayPEkZpPIWT2SJ+RrtygDVZgHUZ/4BsEwGvN?=
 =?us-ascii?Q?CgHDoESmE1sDzmn4D3D/YrXI2dIsUlJhFV0hFLUEHOsqFBb+LyMGjeqhQtoL?=
 =?us-ascii?Q?pGqxt5LJ/HzcAB4MqHpCRcbg?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964EBAACD7025A165BB68C1FD0A9HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2162
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT106.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c65513e3-ff8a-4436-632a-08d934976092
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCozxjKB7gO3VCQnmg8Uwg3TRVogGgn1FvH/KEmNukmHA/QEEkA94bIj25SAXyeYp32dHQO/WDg4dcetkq8KESnwe2yYHOnaankR8j/TN/FCnOQh3m8cye19Th5dF1GwS52Nlu4J2a5ws333tzvk7INSKGH2NQ+KenxeVFEQf4nmDSuZG5X9s6VqP3AD55Kplni7yMg9D934bZ5gFpQCCDR4d9fcqikVq+oXUIbfx/KyhNfIXK+z1lhXcWwd1FJtvriO0uptYbZNEGf9XYOzV9RlaXHKQm0JeSVlFksUrTXhhHBPwpLf1Jzh8lp0NfbocmpPxdUZIkdpDdBTqs/QTdw7LmFmZel8A+/prn/j/zh6i5xkca+PML+upaTmU9UV/ZDq9WySc20sO17vriQsCj7ilbul+tstl/ur4z1f0Hd9Xm3EFeJlVqphBdNU4mdyXWmcjRsn1KyFeVW7jg6UNJXLRgb+2GFVBFb0XFsbPBOaO05qR3ir9NKuqdTOSsAmTSs2aRkqHPuQrMGxg9IYqpYJUSZU26crXYsUUJWVc6uJdAs+ggtLfCbf+qYMh8S9lsEzbkMH8NNsVwU/uSR5kWeYw25SEcDXRkEJElCxNTm3OQIzMSJuc5pznWhxVkKMwB8TMZhp/ybLtF5u6Uo2dGiubFKqrwGiLbwea+PneNKDQw6OdC2m/Uf3ytSlvuxf
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(2940100002)(336012)(82740400003)(36860700001)(82310400003)(33656002)(81166007)(54906003)(6916009)(4326008)(5660300002)(47076005)(36906005)(316002)(356005)(9686003)(70586007)(7696005)(86362001)(2906002)(8676002)(478600001)(55016002)(55236004)(186003)(6506007)(52536014)(53546011)(8936002)(83380400001)(26005)(70206006)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:31:43.7660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e6f4e8-474b-4fa4-2414-08d934976241
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT106.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4601
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
Cc: Ed Tanous <ed@tanous.net>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964EBAACD7025A165BB68C1FD0A9HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Changing classification as Public.

From: Kumar Thangavel
Sent: Monday, June 21, 2021 2:58 PM
To: openbmc@lists.ozlabs.org
Cc: Ed Tanous <ed@tanous.net>; Patrick Williams <patrick@stwcx.xyz>; Veluma=
ni T-ERS,HCLTech <velumanit@hcl.com>
Subject: Adding dependent service as Entity-manager to Ipmb-fru-service

Classification: Confidential
Hi All,

           Ipmb-fru-device deamon trying to read some dbus objects from ent=
ity-manager to get the ipmb bus details. Entity-manager daemon initially ta=
king some time to load all the dbus objects. But Ipmb-fru-device deamon sta=
rts at system startup.

           Since, Entity-manager deamon initially taking some time to load =
all the dbus objects, ipmb-fru-device getting the below error.

          Error :
          "ipmb-fru-device[345]:   what():  sd_bus_call: org.freedesktop.DB=
us.Error.UnknownObject: Unknown object '/xyz/openbmc_project/inventory/syst=
em/board/Yosemite_V2_Baseboard/IpmbBus1'."

         When we restart EM deamon once, this error got resolved.

         I tried to add EM service as dependent service to Ipmb-fru-device =
service. Added EM service in "Wants", "After" fields in Ipmb-fru-service se=
rvice.

         But, still EM deamon taking some time load all the dbus objects.

         So, Could you please let us know to how to add the EM as dependent=
 service. Or Please let us know if any other approach.

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

--_000_HK0PR04MB2964EBAACD7025A165BB68C1FD0A9HK0PR04MB2964apcp_
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Changing classificatio=
n as Public.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Kum=
ar Thangavel
<br>
<b>Sent:</b> Monday, June 21, 2021 2:58 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Ed Tanous &lt;ed@tanous.net&gt;; Patrick Williams &lt;patrick@st=
wcx.xyz&gt;; Velumani T-ERS,HCLTech &lt;velumanit@hcl.com&gt;<br>
<b>Subject:</b> Adding dependent service as Entity-manager to Ipmb-fru-serv=
ice<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#B45F04">Confidential</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; Ipmb-fru-device deamon trying to read some dbus objects from entit=
y-manager to get the ipmb bus details. Entity-manager daemon initially taki=
ng some time to load all the dbus objects. But Ipmb-fru-device deamon start=
s at system
 startup.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; Since, Entity-manager deamon initially taking some time to load al=
l the dbus objects, ipmb-fru-device getting the below error.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <b>Error</b> :<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &#8220;ipmb-fru-device[345]:&nbsp;&nbsp; what():&nbsp; sd_bus_call: org.=
freedesktop.DBus.Error.UnknownObject: Unknown object '/xyz/openbmc_project/=
inventory/system/board/Yosemite_V2_Baseboard/IpmbBus1'.&#8221;<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Whe=
n we restart EM deamon once, this error got resolved.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I t=
ried to add EM service as dependent service to Ipmb-fru-device service. Add=
ed EM service in &#8220;Wants&#8221;, &#8220;After&#8221; fields in Ipmb-fr=
u-service service.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But=
, still EM deamon taking some time load all the dbus objects.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,=
 Could you please let us know to how to add the EM as dependent service. Or=
 Please let us know if any other approach.<o:p></o:p></p>
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

--_000_HK0PR04MB2964EBAACD7025A165BB68C1FD0A9HK0PR04MB2964apcp_--
