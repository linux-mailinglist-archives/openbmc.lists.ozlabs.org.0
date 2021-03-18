Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029AE33FFD0
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 07:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1HX401XLz3bpT
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 17:42:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=iy4LpD1A;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=iy4LpD1A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.98; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=iy4LpD1A; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=iy4LpD1A; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310098.outbound.protection.outlook.com [40.107.131.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1HWl6k4Sz300Z
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 17:42:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+R7pLCHb55D/7nxA7kCNgiLDhSCIZW433HDy3rm8zg=;
 b=iy4LpD1Ap82Zm2dBgShnEXKdwaLLFHCZWmVZjjL6keq2aUUAPEbeWTcsuGTokt0bQBhKaBUDw+n+NSxkc2WP7sAG9HvnwL3dQNjA4sknYSLEbXgAOcUb6IfAFapA5OjljlVk5715JPIE1+ycn99TydU0FAyw/96b3sBN5ggBvtn/yk3kje7DNE9v3zkASWfELi9DOI6Q4esCnmFzMr5ME/rq3d8vY407NHUtsNoGyPo+F0GsGzqy4fuegvC2GbCWo8DXy25qU04B0QqIquC85t9oW4jtFQJtHkf8Y+QDsxc7rRVvuRcr3AcXtVwZcIhRE7CZst4l7UKDi3ijQV6D7w==
Received: from HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::26)
 by SI2PR04MB4569.apcprd04.prod.outlook.com (2603:1096:4:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 06:41:59 +0000
Received: from HK2APC01FT052.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:1:cafe::3f) by HK2P15301CA0016.outlook.office365.com
 (2603:1096:202:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.2 via Frontend
 Transport; Thu, 18 Mar 2021 06:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 HK2APC01FT052.mail.protection.outlook.com (10.152.248.244) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 06:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5Gh6Td43pADSS+Ki+BBFa22PVdgom1PDvzAdA0Fb9OzxB6vBF8U3dTkSc+1LVlPAVEP40fozzRNCncuBnsoh+Ob/J0rKREbVKY1DTKjwe7GI19U1O2M18taurxBdIMI5dfrJuDL1I8XlSLRBUks6bliT8jgvyaKOJxRHZYi6Z1vxBRNpUytuHrN3w+oloaMKDm076dwVTQqwHyAxNt7k8C97aNOMsUB+cKgwWAJKfHjt5n286Q9p2yfneFw/fUXpqfL+VSF22sqEmNl2uDUDKNGo5JN/ARlDSYYuxOudB5roFQWTMJlE78wKaNeBC4Y6CcykoSVM/9VbvzgbRuTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+R7pLCHb55D/7nxA7kCNgiLDhSCIZW433HDy3rm8zg=;
 b=Hr70STFlwJ8PS63pSVCrQGZUwLndGyC41WAFBnNdNfKElD8WS9LLM1uNktki/CmgNu2wmuGJ/uRmu6dyAh3SW02kQstyL2RooT+bG3F1CuY+QyVPzuxs3FQFDD5ZhQXaRJ9Xt1xYHSjnaBeFT+DVVZ99mPksJUgRg2+XPJVG1BWllEUB7AyG2nfGfsUsBKL6NYpz6Ozkkrbwkwr00chPTYygRIkKrDt0oDK1dnq+Iyk8B7H2MGesI+wZuSe0BSD4lGn9gEMrNT6A9zjj73GS3zs482UdfudsfRnFnQMOhD4GlmHVldgqa/qXL+aG8cfZ+OV/AuNhpv2bEywqekrKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+R7pLCHb55D/7nxA7kCNgiLDhSCIZW433HDy3rm8zg=;
 b=iy4LpD1Ap82Zm2dBgShnEXKdwaLLFHCZWmVZjjL6keq2aUUAPEbeWTcsuGTokt0bQBhKaBUDw+n+NSxkc2WP7sAG9HvnwL3dQNjA4sknYSLEbXgAOcUb6IfAFapA5OjljlVk5715JPIE1+ycn99TydU0FAyw/96b3sBN5ggBvtn/yk3kje7DNE9v3zkASWfELi9DOI6Q4esCnmFzMr5ME/rq3d8vY407NHUtsNoGyPo+F0GsGzqy4fuegvC2GbCWo8DXy25qU04B0QqIquC85t9oW4jtFQJtHkf8Y+QDsxc7rRVvuRcr3AcXtVwZcIhRE7CZst4l7UKDi3ijQV6D7w==
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR04MB3842.apcprd04.prod.outlook.com (2603:1096:202:31::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 06:41:48 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::ed96:9e57:6f98:7a95]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::ed96:9e57:6f98:7a95%5]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 06:41:48 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Ethernet Raw socket not sending with pldm payload size more than 24
 bytes
Thread-Topic: Ethernet Raw socket not sending with pldm payload size more than
 24 bytes
Thread-Index: AdcbutH4vnR52pGFTdWt4743PYEYtQ==
Date: Thu, 18 Mar 2021 06:41:48 +0000
Message-ID: <HK0PR04MB29642C1C3BE149B6C333F6B6FD699@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOGE1ZThiYTYtYTdhOS00N2QwLTkyMGQtZTUwM2YwZDhjN2VjIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InA4RXY0dDhcL3Z3ek9iYlo5cTJMUGp2Mm9PSTF4M1diZ1dDVm1HRjZDOXphUndvcXc5elJKNmROTHA5bHlLRTh0In0=
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d8edbff4-a704-4d14-5c70-08d8e9d8ed52
x-ms-traffictypediagnostic: HK2PR04MB3842:|SI2PR04MB4569:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SI2PR04MB45690885B3F1F13939C54988FD699@SI2PR04MB4569.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1R0YfLWzYrYQr+rPvemgUt0l5q4xceiywSYGkNmAzWk7G7ObED9i/1BBcB/88YJnVuXgmLAIOHTotxR3vZxxV3rDCIskYJi6VucwWSoLrvyFJxUYNG0mgSCYqzBCKHv7DXOD9RHLABmXPwVD4qmb+FpoX/Zjs/nNEyZP6NfSMZKsHHG89ScubmDc7Ofj5ts5ZCmN2UX77w7HUHAqkitn7mhMwU/RJ+c3vL4s4xj3SFo3kiCvfxeFy8/yoev3SgHwnOpAmfm1P72QBCU1CofZBthQeBIM/L/H7/0sWQQChU+Yevlep43a/FYc2nytXUIyk3dF3VSs0nvN2Q1FfqD+Vkp/+a/wE1Vu6yQJHxR+UkmdwrGfGhus/CR8YMDwF2QBCek66sVcFz6vmi5omNTCKXDrZPEpQgilZa/GjyIouKURUw7/D48Mmpj+HNl/xj27ueAbVzCnMnpA44zZWsGgoQg/x3YEfRewvC6E+LGFOk5aX/WnWlbkW5JAuLH2rYn7FKzU6KGwah4bF57mEUJzMY16+59+2nAxsyFDMFYKox2mH9lGYQxNqZcTKedIAcQWcjuVbftuH4bmk6btD9xEfLN0SDEp1grYfmJIXJQTy30=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(52536014)(186003)(2906002)(316002)(38100700001)(76116006)(5660300002)(4326008)(478600001)(83380400001)(86362001)(66946007)(71200400001)(6506007)(8936002)(9686003)(66556008)(64756008)(6916009)(8676002)(55016002)(33656002)(54906003)(26005)(66476007)(7696005)(66446008)(55236004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FdACcJn3YfeMbbyHC1S4yo84SID3MtdrBf7NJaZ7fauwKPdG5nk/+D5hK6X3?=
 =?us-ascii?Q?KOOqpse9mZCRXQ6PM2HNWQYzjjlwMAs0IOlCYxEgBorTS0SnG+rFQfRJG+eP?=
 =?us-ascii?Q?NYD8IJSex5HAerusA3uNOPuJ71oBhqV/X0hXNNV2SDz7NVc3DRQuSpKE+B9f?=
 =?us-ascii?Q?UGZEATAyEDql18f7FRmPcQgkhGWBS+zONdi4R75I/pW9UwSDV2wpusi5fgRO?=
 =?us-ascii?Q?3EPABOkxoKE67qLZHVFbol1rtm3mLhJOVhioO4XfWiq9bt8amAqXEfL06AuE?=
 =?us-ascii?Q?xNTuCORlib/go2xCTPmrmCxDG65gJgUOTsmXmwWriG/sJ3aEcClHn2aFBz9O?=
 =?us-ascii?Q?k7N6AnlvhqCjTQ3ncsgu1S9lG4xwvBw+bGallzzXt7XRBGiJO2tuhDwjcXWi?=
 =?us-ascii?Q?HmSxSUuOxxGG4zP0yO6gt/t67a3hkkEw/QMujEYpQDKQM43xfXRJnqvlUHK2?=
 =?us-ascii?Q?8lxEfvpH6zBfknauvnDHp6BCSXpWWno16K1cac7UoDU2BEtt8f4SsOTcozrR?=
 =?us-ascii?Q?hsw+936LKpBNmQDRIB/aZMmrUCDuL+FZYkNxdyMxN9u/DmhnVO9BmgsfoWhW?=
 =?us-ascii?Q?tIgRWydrinLyZ8WlJTwX8sJ6XrazOuvE/47tn9KslT7B3bXZTnJ+P+nkJgmS?=
 =?us-ascii?Q?VB+qck1IwNF/BPNp3Cgy/gOOye08VvOFrqrR6FvUNnQ9sabv8dVJknno9eB+?=
 =?us-ascii?Q?2jj0S5YVR3pQJS+0dMHrd+mRRRnmn0DpjEb7HWQUD0NMd3apBljcHmqkCuuQ?=
 =?us-ascii?Q?KhIlOvnb6mYbsJzQtMylhnwStBLQD3Jim73ZYNBkQqF3MA7lBDfLViwH8iem?=
 =?us-ascii?Q?XJzR07Un0wZKIJHQZsFDs7FVJ7Y19XzrLNwzBPahd2h919Jiqlh3VBV+AkVO?=
 =?us-ascii?Q?ytxJ9MoY1FmO+uh+DVkDl92ZxV0GB0GcFOchQZsoQyUXPYqDHWM24iP/wT0Z?=
 =?us-ascii?Q?bOkN/pjHFygxnLYmwQtIHxIKI1k20eZ6IGPT7Zha2+VonSIHLYpMLnW+2EXo?=
 =?us-ascii?Q?wV95N7HXYokN2cI6tEnJIJshgMZJkaX2laWkIF2hLvn991Vx5FlKiLGvQySw?=
 =?us-ascii?Q?p6zK7gCcis3bzXNOHiP83POyRCQYnmgicVANsqfmHJgqO7KFfewTsN9vA9So?=
 =?us-ascii?Q?ix+Hjy/CUO1JLYHhJ1hIsWM2Iyf2GEjPlLkok9TFzKbnAIXLm9DVjSGjSFXO?=
 =?us-ascii?Q?eXQ1LtcuKdKH2fLjnExLTU0QRgCY+aPasMNHsiWrfjcAFgj+KaxmXElZOztN?=
 =?us-ascii?Q?Xa02J/X8xfaz+Q/cnpNN7C1KC6hBvYxkqBwQtthZ+0dOvuQ4BqAGw36SRlQU?=
 =?us-ascii?Q?R2toFLFE/KbdArbaON8RJyKl?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB29642C1C3BE149B6C333F6B6FD699HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3842
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT052.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5bd23db4-5a5d-4577-606b-08d8e9d8e7c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8XHizxlvlVFPMmCIj7/tvN85ZNwiqXbrqxkcDfo4wuZcx/uH+GPPPkDNfoUMOJJaTv8HuDjIGdNRhqnGFvT/M+GYDsgEPO0WxOuSmVuN3l9fTvIglTeJuJ8kHbdSe7LQHv8d+ZG6g5ZdO5ish+ewF85fks4eKi2x+LlJcK6Qzq119oG/GWkCMupTXJ+4J3QqXlDHI3uVXLAvVlY7fD5/ncgeE8AxfNiheIWt0JscvQOQtYyzAtB51tETy/B1QTUkohFczFGfC/l/6z+RK/Nl9u+vk8YsuxMkRmg6heOL/P4yHpAmiz+rC+C4lYrkx3aRLCMcNBK1VlF2NsSjWw2UX+lUh9/5BHs9y7/RlEGc7Numzskk1oNjGTNnxBW7hV6+qg0gkP2j0GclC/Nc4wJSZDvlXXDo9o6CsP+48TZXsCJKyFA3BFopOa1L8LTSIDDpDmJ+np8ndU6kXDIISh2Gcr0PI1f+NY8hlh0cSPRvuUzIZml86vdwsOmFNio+d/jf2rE8kLtP1a+T0q6FsKCZ+2oZPIvQNSKtOra9JHZPVQEpYxm+Rx2QKes8+X0bpicpxM8wzxOTdQiYY3jDIfJJiDkQRocHtj4Sb9RNAnFOBpd3C6DGXxnrI0P56Url9ReA1OQDWHPM73zHQieKs/iMdF3ICyCTZurj8cnyCZplSK0aGh45qlOPsdMbLuEW8XMK+R6SQY+ohjslC5mjFFKYS4p8/gln382sgVad+Drg+c=
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(8676002)(4326008)(26005)(34020700004)(5660300002)(52536014)(55016002)(82310400003)(8936002)(33656002)(9686003)(186003)(2906002)(36860700001)(7696005)(70206006)(70586007)(356005)(47076005)(478600001)(82740400003)(55236004)(36906005)(336012)(6506007)(81166007)(86362001)(83380400001)(6916009)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 06:41:56.5106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8edbff4-a704-4d14-5c70-08d8e9d8ed52
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT052.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4569
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
 Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB29642C1C3BE149B6C333F6B6FD699HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi All,

         We are working on pldm over NCSI NIC firmware update feature. We a=
re using Raw socket to send the NCSI packets to NIC cards.
         This raw socket is working for the pldm over NCSI sensor commands.=
 Pldm sensor commands having pldm payload as 6 bytes length only. We could =
see it in the tcpdump.

         The same raw socket is not working for pldm over NCSI NIC firmware=
 update commands.
         We are facing issues if we send the pldm payload length more than =
24 bytes.
         The commands are not sending with the pldm payload length of more =
than 24 bytes. Not sending in the TCP stack itself. That is also not captur=
ed in tcpdump.

         In the raw socket, We framed the packet like Ethernet header - 14 =
bytes, ncsi header - 16 bytes, pldm payload - 28 bytes.
         So, The commands are not sending if we send ethernet payload size =
greater than 54 bytes.

         But if we send less than 54, the commands are sending properly and=
 got correct responses.
         We tried with ncsi netlink library also to send the commands. Ther=
e also we are facing same issue.

         Could you please point us if there is any known issues or workarou=
nd for this issue.

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

--_000_HK0PR04MB29642C1C3BE149B6C333F6B6FD699HK0PR04MB2964apcp_
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
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We =
are working on pldm over NCSI NIC firmware update feature. We are using Raw=
 socket to send the NCSI packets to NIC cards.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Thi=
s raw socket is working for the pldm over NCSI sensor commands. Pldm sensor=
 commands having pldm payload as 6 bytes length only. We could see it in th=
e tcpdump.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The=
 same raw socket is not working for pldm over NCSI NIC firmware update comm=
ands.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;We are facing issues if we send the pldm payload length more than 24 byte=
s.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;The commands are not sending with the pldm payload length of more than 24=
 bytes. Not sending in the TCP stack itself. That is also not captured in t=
cpdump.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In =
the raw socket, We framed the packet like Ethernet header &#8211; 14 bytes,=
 ncsi header &#8211; 16 bytes, pldm payload &#8211; 28 bytes.<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;So,=
 The commands are not sending if we send ethernet payload size greater than=
 54 bytes.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But=
 if we send less than 54, the commands are sending properly and got correct=
 responses.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;We tried with ncsi netlink library also to send the commands. There also =
we are facing same issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cou=
ld you please point us if there is any known issues or workaround for this =
issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:=
p></o:p></p>
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

--_000_HK0PR04MB29642C1C3BE149B6C333F6B6FD699HK0PR04MB2964apcp_--
