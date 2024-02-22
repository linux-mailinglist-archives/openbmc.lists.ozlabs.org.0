Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0278608F7
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 03:46:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=LNWvijDF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgvXG2vRsz3f0P
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 13:46:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=LNWvijDF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=7759942ef=kelly_hung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgPxV1k9Zz3c1g
	for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 18:32:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1708587166; x=1740123166;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c/8VQox2CoX8zZZ31yxMyuBVCee9rTvuuhXaP2KqbhE=;
  b=LNWvijDFtdnugxM1qncgueVuW3+xDhYalj0DNXxJU6pESnFdW6LeWG44
   782MwiOax2QNXfvOM+TOGtFvk0Dzhu1Z+C9mbezHuXc3DGf2TUe8MrLwP
   Ok8gaczC3Wi6C+NMwFlSZ/13MgM8h2nwIQktrgeUcuLlZPp5Vto+fgDe2
   g=;
X-IPAS-Result: =?us-ascii?q?A2FiAAAg+NZl/xYvFqxaHQEBAQEJARIBBQUBQAmBNAYBC?=
 =?us-ascii?q?wGCOHqBYYRTkWYDi1+QUSqBLBSBYQkPAQEBAQEBAQEBBwEBLhYEAQGFBgIWh?=
 =?us-ascii?q?1cnNgcOAQIEAQEBAQMCAwEBAQEBAQgBAQEFAQEBAQEBBgQBAQECgRmFL0qCX?=
 =?us-ascii?q?AGDdgEBAQEDASIRRQwEAgEGAg0EBAEBAQICJgICAh4HChUICAIEAQ0FCIUkA?=
 =?us-ascii?q?zGTP5s6eoEyGmeCFgSwHw2BLIEpCQGBEC4BgWiGHx4BgVaBbIItg0F7gk8mb?=
 =?us-ascii?q?0KCaD6CH4FvARIBIwUxAoMhOYIvBIETf4M7gzCBKIxegRKBIYZjCUt/HAOBB?=
 =?us-ascii?q?QRcDQUWEB43ERATDQMIbh0CMToDBQMEMgoSDAsfBVQDQwZJCwMCGgUDAwSBM?=
 =?us-ascii?q?AUNGgIQGgYMJgMDEkkCEBQDOAMDBgMKMTBVQQxQA2QfFhwJPA8MGgIbGw0kI?=
 =?us-ascii?q?wIsQAMREAIWAx0WBDARCQsmAyoGNgISDAYGBl0jFgkEJQMIBANUAyF0EQMEC?=
 =?us-ascii?q?gMTBwsHeIIJgT0EE0YBDQOBNAaKIQyCIQNEHUADC209NQYOGwUEHwEdfAWgI?=
 =?us-ascii?q?BNpQBAQAxEaFHArFVARBCqPUnOCQIM/Sa16cA2DC4EDiguPJYF7hisXhAWMe?=
 =?us-ascii?q?oZcA5JGmFkgkU+WYAIEAgQFAg4IgUEqA4EccDM9gzdSGaIieDsCBwEKAQEDC?=
 =?us-ascii?q?YhuBS9nXwEB?=
IronPort-PHdr: A9a23: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
 uCJ
IronPort-Data: A9a23:CxoAi6BFclTecRVW/4biw5YqxClBgxIJ4kV8jS/XYbTApDwl0TAEn
 zNLWTrVaK7bNjH2Ko9zOo2zoUgPuMLcm94xTANkpHpgZkwRpJueD7x1DG+pZHrKcZeroGGLT
 Sk6QoOdRCzhZiKEzvuVGuG96yM6jslkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1rlV
 e7a+qUzBnf0g1aYDUpJs8pvmDs31NzutTURuEAJZPwjlDcyQFFOVPrzjYnoR5fJatE88tySH
 o4v/5nglo/txCrBP/v++lrNnu3mdZaJVeSGoiI+t6FPGXGurARqukowHKJ0hUu6F1xlNj2+o
 TlAncXYdOsnAkHDsNoCYkl9DnpbBLUc0fzCJCW/m/GykmSTJhMAw902ZK03FbEgv8tHWD8Ly
 6VCbjsKdAiFiv7wyammUYGAhOx6c5OtZtlZ5i4ml2ux4fUOGPgvR43p6NtczQAQm8ZBNf/Fe
 tFfYj1qBPjFS0cWZQ9GVs9izI9EgFH+Vx8B9A/Or5Yn6mTzlghs95f9H9z8L4niqcJ92xzwS
 nj9123/DgsXK/SUzjaI+XWqnfPVgCjnHokVEfux65ZCmEWSyWwUFQYbfVS+qPi9zEW5Xrp3M
 Use+mkisYAx+VatQ927WAe3yFaHpAwNQMhMFON86wafzq3L+AWYRWQYZjpAbtU8s4kxXzNC/
 lSOmdTzRjBzmL6YU3SQ8vGTtzzaESoSIGsqZyofCwoJpdD+yKk/gwzORdt/CqO4psP6FCu2w
 D2QqiU6wbIJgqYj06S94ECCiiip45vEVAg44i3TX3m59UV4YoC/boCl4FSd6uxPRK6dT1+cr
 D0NgNCT4ewmCZCWiDfLR/cJFbuyofGfP1X0hV9pAolk9Dm3/XOnVZ5f7Ss4J0pzNMsAPzjzb
 yf7vhtc4pVWN1OubLRreMS2GcAjx7OmEs7qPs04dfIXPcI3LlXBoH4oPxT4M33RrXXAWJoXY
 f+zGftAx15HYUi75FJan9sg7II=
IronPort-HdrOrdr: A9a23:vZSkPqmtcZ88dpeNiDkxywfjkinpDfNiiWdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdS9qXO1z+8R3WBjB8bfYOCAghrkEGgC1/qp/9SOIVyGygcw79
 YCT0E6MqyLMbEYt7e33ODbKadZ/DDvysnB7o2yrhdQpENRGtpdBm9Ce0Cm+yZNNW177O8CZf
 yhD7181l2dkBosH6aGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/josKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYKriJGofy/Qzdktvfq2rCo+
 O84SvI+P4Drk85S1vF4ScFHTOQlArGpUWSjmNwykGT3vARDAhKdfapw7gpIycwISIbzYhBOG
 Ei5RPAi3IsZymwxhgUvLLzJkxXfg7emwt9rQbX50YvCrf3rNdq3NAiFIQ8KuZeIMuy0vFXLM
 B+SM7b//pYalWccjTQuXRu2sWlWjApEg6BWVVqgL3d79F6pgEP86Ij/r1ool4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdDv6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFFdVr3Q7dU7iAdCHmJdL7hfOSmOgWimF8LAX27Fp/rnnALb7OyyKT14j18OmvvUEG8XeH+
 2+PZpHasWTWVcG2bw5qjEWd6MiW0X2CvdlyurTc2j+0f72Fg==
X-Talos-CUID: =?us-ascii?q?9a23=3ASJsiS2ob7k3X5MKZxe6rE1HmUf46Qy340Sz1Glf?=
 =?us-ascii?q?iICVsTeCVY2KxpYoxxg=3D=3D?=
X-Talos-MUID: 9a23:We6wzgaH6py3WuBTthvO3W0/b81U862iKBoJjLIpq+aCHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO TP-EX16-V12.corpnet.asus) ([172.22.47.22])
  by ms.asus.com with ESMTP; 22 Feb 2024 15:32:38 +0800
Received: from GPZA001TMD.corpnet.asus (172.22.47.63) by
 TP-EX16-V12.corpnet.asus (172.22.47.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 15:32:37 +0800
Received: from APZA002EXB.corpnet.asus (172.22.6.14) by
 GPZA001TMD.corpnet.asus (172.22.47.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 15:32:36 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (104.47.110.41)
 by APZA002EXB.corpnet.asus (172.22.6.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Thu, 22 Feb 2024 15:32:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EulY0NcBHJYbkCLRok7+aUF1DebC28zhnYAABI/M1Ed/eMYK+WRomjPWd+f1bNi2rSP1dmphna6wad0gh9icQ//Gp/FU1d1/6NOCZb/WXHQuNpfsZ/yGqi5V22WDEXcw6GWcYZmcLXt03q0rEoNTbmjjz0xtCqsZ0nOen7RAf34RS/TIJpwXdD5lHeLKcfUgwTDw9lbQsqWTkx8A/wXqYnt286WrtQDfYyMV1b/blNmwDNPG5z0M4zOsjvqNNpa69jciFBEczCGOGgY3aQ4U4t+2bDQCrd5X9yLUCicOoH1NQjDw33OJchMYffTOLJbYWp0JAZv5TSjSM8uCu8Bm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6f78ZI2dLTEf2DUpjGlnEnAewUSKvryznYaXkpZh+U=;
 b=Yc1pT7V3qBz6ewl1DZ+bIGbAVGRgbLifCB1qyqMVAsPnNFYYmvgIfI50XLW8t9EnsyzdEAliJUSjK+kBET0MlFGa4oDrzb0g60S/zZKO2Cc7QcS6k6jvDGwxkwZ5rpYUnmTbkZToYoSVeZW3/TC64xNn6/pWlOzIho9Yu9DQkdH9j2e88NkG/W/SQUTo7LzAP32k0Sggyzb2fzMVCh/TKDidotulrxiwIgE0NzrJL6e6BF9NM95wrTlrL51gCo3pdMBM7fzo6bnnxBAZJJCFJYjy63jtHkj7+J4J+/rQaEXKJOTwmasK3l/VVqnSxjj0FW5s97LrVmR+vnDuhsJ95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com (2603:1096:400:28d::13)
 by TY0PR04MB6423.apcprd04.prod.outlook.com (2603:1096:400:279::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Thu, 22 Feb
 2024 07:32:35 +0000
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6]) by TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 07:32:34 +0000
From: =?utf-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Kelly Hung
	<ppighouse@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Topic: [PATCH] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Index: AQHaZT7Fl1fNCyA/1Ui6wFnxbSKJerEV0X0AgAAmbHA=
Date: Thu, 22 Feb 2024 07:32:34 +0000
Message-ID: <TYZPR04MB6596F2EBAF65F7F53809C2259D562@TYZPR04MB6596.apcprd04.prod.outlook.com>
References: <20240222032504.1147489-1-Kelly_Hung@asus.com>
	 <20240222032504.1147489-2-Kelly_Hung@asus.com>
 <2ab9b3924dbe07039e934d4580ab7dd397a31728.camel@codeconstruct.com.au>
In-Reply-To: <2ab9b3924dbe07039e934d4580ab7dd397a31728.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB6596:EE_|TY0PR04MB6423:EE_
x-ms-office365-filtering-correlation-id: 1ef9b442-f9ef-42ea-2cd0-08dc33786fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sHsbCvo4gfHV5OvwmMkvohZoNNRy9lImgZONvtWbHvcG5UNzfM2mntksZhZ7yl2FpwY8eBbWvUD1ez4ypHjMWFouVXnqgkfyDN4tsfxbZpwZ334RhHz3877q8mnwvzQsJhQ706Au3O7JGvnYn/0VF1XuKL0phTZfdfDMFA356qoV8Mtn3Q+7GSszGutdpChCijveY/qU6ye2lgNymnXSyxViNvu2YvySHRLc4X+Irr9eeCWSy9pRAPdh3fG+qe2zVRlWQWmvj8rCv+8igLRq9U4soyW+2qOuG8Yg6G0D8JUBddowu9jh9czUE7VW/xTPgPSW1RHD4NZFU3UkYP0ITDFmMalE4Jt8L0rIegSdMNx+LUlobHbgTwYTbyM7JBgMptZZOaWWiki7DjgcP8m4+7ZsPlO0kXP2aJPH5kXsbRTQdLENHbpgAmx/yQ1/C6UwnRKfqi80ATKUZDs2cgQEsRlrob1tiS+0V1z5004nJPObrs8eKB5fZ4TFthlMDERNUBw/ESjLS0k+2yJLy+7YFDTIoWylWMJHSa83yxVa3CjSZ61uyTMOafaFCVd9/56tpbZA9xlVvQYSUWYSVRNijOor5uZFBSCrJrpLe3mke4FHSfZu2Yng5wU5Xa89qldE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB6596.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkQzM04rTk53MTFKeElrTGlHNGoyV01IR3FtdTJvWU1wS2pWeXltUFMvTmFJ?=
 =?utf-8?B?WU1ZWC9WOFd4RnVQbDJKSUdZVkRDbTM4NjRpNmdUUExySVlqOXhFbTViVGI0?=
 =?utf-8?B?ZE1pZUl6bU1OR0hRcCtBODhTdHllK0x5RC9XRys1Mk54Y3BLM0Z6V3A2aldh?=
 =?utf-8?B?RE1ic1NaQWJVbGhDQ1hwMzVWNEQ0QnR6NVRSeCtUYkw1bDRBbG5aaUhKdnFJ?=
 =?utf-8?B?cGMwa1hsK0tZcG8vR2FRVFhmZTlpT2lqK2NLSXlDVlF3SkhJY1lXSXAzVDlZ?=
 =?utf-8?B?Q1hrWEpKU3doWmFFajBUQWVKdnNrM3JhcWt5ck5JVC9vMExrWTd1TTVTcWpo?=
 =?utf-8?B?a3NVSXlENEY1R2FuTnVUMnQ4VVY0LzRTTFJBK0pEaU5kdGZNVWY1QUdEM2Fi?=
 =?utf-8?B?dU1vWVZod01sTmlXaWppYU1hWlJDVUU0TnhQZHd3M0ZQS1BKWUpuWHhVcXVs?=
 =?utf-8?B?MXVZNjFVdDdtMGgyNEpXdmZNZEovSVhkS3RwTHl1eUNMVXhTWmNVU3pjeXZ2?=
 =?utf-8?B?Z2xSaUlBdTJ0SjBaL2JFV2JiMFFRRGRGT2U5ZXlLYUdkZzFrR0NmNXUyZ1dR?=
 =?utf-8?B?b2FnRDM3NWtKTVhscWRCaHRIMmFDaUJxM3VicnRUdWlnK2ZSMjg5ZkpHNHZV?=
 =?utf-8?B?RUV4RHlQYSs0VkIwZmFNU1JsNmVBdGlhSkVaY1F4QU91ZjF6NXJhYVVuZ3FN?=
 =?utf-8?B?aEI3cVVmNkt5aWRFbUdzbkh4a2kvcEVjRDNaWHNWcnRuRUxOcjdQY1VLbUFS?=
 =?utf-8?B?V1VyODZzaXM4Q2psL0hPMHN4UDYrVWl4SEszdVZ3OXJrMFFBQ0hHdCtzbzJP?=
 =?utf-8?B?UDhZOWFpZk9ySGNqVW1JbUgySkhXc0RGZUNzZGhmNGp5bFIzeWhHZzJZNitO?=
 =?utf-8?B?aHZ4UjZnMlhLa3N3dXQzb2tXWmhmbkZVTW9DRTR6UGowOFJVS2tvdFE5bC8y?=
 =?utf-8?B?QUFUR1dOclpqUGhNRlZkSFdlNGVaOVZBTUYyQi9VOXQ5aWllUEVtMDdnaEM0?=
 =?utf-8?B?MEtSQTk4TFMwUkVQYW1pcXhQSzNHWTFDMjBkblhJTDhoa0h5VTZJRno2d3Ur?=
 =?utf-8?B?Q2h0N2twUFZMbk9PRDh3MXh1WnJQMjZjWU05aEUyRnRHV3ZxTkNsT0JkNXdX?=
 =?utf-8?B?NmsraWUrN3RURHIydmRmaDZHcTArYS8rQ1BDa25zamlEekNsNW1ETTdFSXhs?=
 =?utf-8?B?V1JjSnhWTEkxMHZGc1lFMFFLT2xBeXc4akFOdmFNdEMzYUVaSUc3cDBLZXMx?=
 =?utf-8?B?QThIUlpXTHJFckVVblNoc0dqVzB2Ni9rRndxaFR3bHNNc0Z6UzEyRjh4Uk9l?=
 =?utf-8?B?dkh1ZlZXcjZ5dlJ3VnI4OVRqb0g2ZlBFQmhiODk5UzYzR3IwaG1qcFpCekZw?=
 =?utf-8?B?Wkl0R0JuaHJWNFVzMDkwdXowN3BEZ0Y2NDJNVSt2V2NNZm5IY2k1NmRxVE03?=
 =?utf-8?B?cXJudmYyeXR0dUFEeFB0QzAxaHpNNjBGNFZqOFpsQUt4K2EwVzg2dktIaXBE?=
 =?utf-8?B?NEZZMHVFSTBOc0NqK05sN2tEM09LK1NGeUNYS0ZKUjVoaW1wbUR4cWFXS09C?=
 =?utf-8?B?MjUreHZzSnM4Y2NVa2FNTWpWUmpqcDFabk1FSkE1b2RqNVFQNjI2UC9xT011?=
 =?utf-8?B?a2hXc2wyaVNJUllkc09BUXBTQ1ErR3YzcEZlSWlYbFB0T1hnWlpPS3FVWUt5?=
 =?utf-8?B?VkFLZnlINzd5b3llTHgwZmorSmx1NTRTeGNiZjFWUE9YTXpzQS85ZXJRaGFX?=
 =?utf-8?B?RzhEQUhwTzM2ODlZOWR3ZytrZVh2NEZWamZwR0VnVHV3dERTc0JaT0dKWDkr?=
 =?utf-8?B?U2N1QWovSlYxNUtmVkFBVXUzV1I0dlozUHZnMXRNZXFCWTRrSWt3aThDTDAy?=
 =?utf-8?B?Ym41SnB0Wkh0YjVKc3hQUUd3SkJuWHJEb1dld3F1WWN6M1NrSVduZTcvUHFv?=
 =?utf-8?B?SktmTGVUa2ptUG9IYUZLaGU5TG5vaUorS2RkZFkxZWRjamF2d01iRzFMWkc1?=
 =?utf-8?B?MjRMT2daRmRzWmRMZWwycjFtODdVdFBva1owazFVNW50RUkrT2Z6eHhmM0Fy?=
 =?utf-8?B?S1QwZGJ0TlZKS3g3c2p1akNob0kyTWl3aXdzSzlYK2FWM3BieXp6dFd3WGt3?=
 =?utf-8?Q?0BE8asZnkRZXDTJbIAeUDAFay?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB6596.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef9b442-f9ef-42ea-2cd0-08dc33786fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 07:32:34.5389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldFYX3f566rqN47qghKSUtw+PS05szP5+QZtMeaF97d8g3ub6Pwv2WTF6p4CoBpV7Y2zbtjcpOsz/pCg054EjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6423
X-TM-AS-Product-Ver: SMEX-14.0.0.3197-9.1.2019-28206.005
X-TM-AS-Result: No-10--11.373300-8.000000
X-TMASE-MatchedRID: 6otD/cJAac35ETspAEX/nuPWD5i8ea8mo4iCakRRMU2TgsjBd3wN/0Op
	ABchgg1YkyCa9RBT/DblE3nSJ4xeM4kc+IJJwSKgdHgioDYGPFzUbhjJkggis0JJK1cl5xamnRA
	UCS/BBrWwfs52bWHeGIyT2UGABjrTzPvigSWE1EH3vtfEQLhtk9ZEjr6xrP/h0HI+/xkpEav00U
	qsgheBfER+jlWYYvIOUL85RQEHzu6EvtDCFHtf9VHaOEtopYQJpdDCptepXUKO46CtGFNzgNN3u
	c/e6SUg5I4TyvxIUzsSCDdzAMeX/Vl1+OPRyub+bK/csmxASVktAZ+/MnT5VdFJvI9LYcV3Imxn
	Qvgkai32/4005VJ1/9ng+lCrq9rCph48paW9zJTAFH62/izJi95nojm2qoXRVbnwQTyIZFw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.373300-8.000000
X-TMASE-Version: SMEX-14.0.0.3197-9.1.2019-28206.005
X-TM-SNTS-SMTP: 	5AB7B8991FEE162D7B7AA878D81DEF7FDC8BFACED5E32CB984DB82D821C0AF852000:9
X-OriginatorOrg: ASUS.com
X-Mailman-Approved-At: Fri, 23 Feb 2024 13:36:41 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, =?utf-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RXh0ZXJuYWwgZW1haWwgOiBFbnN1cmUgeW91ciBlbWFpbCBpcyBzZWN1cmUgYmVmb3JlIG9wZW5p
bmcgbGlua3MgYW5kIGF0dGFjaG1lbnRzLg0KDQpEb2N1bWVudCB0aGUgbmV3IGNvbXBhdGlibGVz
IHVzZWQgb24gQVNVUyBYNFRGLg0KDQpTaWduZWQtb2ZmLWJ5OiBLZWxseSBIdW5nIDxLZWxseV9I
dW5nQGFzdXMuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hc3BlZWQvYXNwZWVkLnlhbWwgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YXNwZWVkL2FzcGVlZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hc3BlZWQvYXNwZWVkLnlhbWwNCmluZGV4IDc0OWVlNTRhM2ZmOC4uNjBhNDk0YjdhYWFmIDEw
MDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQv
YXNwZWVkLnlhbWwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YXNwZWVkL2FzcGVlZC55YW1sDQpAQCAtNzQsNiArNzQsNyBAQCBwcm9wZXJ0aWVzOg0KICAgICAg
ICAgICAgICAgLSBhbXBlcmUsbXRtaXRjaGVsbC1ibWMNCiAgICAgICAgICAgICAgIC0gYXNwZWVk
LGFzdDI2MDAtZXZiDQogICAgICAgICAgICAgICAtIGFzcGVlZCxhc3QyNjAwLWV2Yi1hMQ0KKyAg
ICAgICAgICAgICAgLSBhc3VzLHg0dGYNCiAgICAgICAgICAgICAgIC0gZmFjZWJvb2ssYmxldGNo
bGV5LWJtYw0KICAgICAgICAgICAgICAgLSBmYWNlYm9vayxjbG91ZHJpcHBlci1ibWMNCiAgICAg
ICAgICAgICAgIC0gZmFjZWJvb2ssZWxiZXJ0LWJtYw0KLS0NCjIuMjUuMQ0KDQoNCjxwPjwvcD4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJldyBKZWZmZXJ5IDxhbmRy
ZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+DQpTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjIsIDIw
MjQgMToxNCBQTQ0KVG86IEtlbGx5IEh1bmcgPHBwaWdob3VzZUBnbWFpbC5jb20+OyByb2JoK2R0
QGtlcm5lbC5vcmcNCkNjOiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9y
K2R0QGtlcm5lbC5vcmc7IGpvZWxAam1zLmlkLmF1OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1hc3BlZWRAbGlz
dHMub3psYWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnOyBLZWxseSBIdW5nKOa0quWYieiOiSkgPEtlbGx5X0h1bmdAYXN1cy5jb20+
OyBBbGxlbllZIEhzdSjoqLHlubzlsrMpIDxBbGxlbllZX0hzdUBhc3VzLmNvbT4NClN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBhcm06IGFzcGVlZDogYWRkIEFTVVMgWDRURiBib2Fy
ZA0KDQpFeHRlcm5hbCBlbWFpbCA6IEVuc3VyZSB5b3VyIGVtYWlsIGlzIHNlY3VyZSBiZWZvcmUg
b3BlbmluZyBsaW5rcyBhbmQgYXR0YWNobWVudHMuDQoNCkhpIEtlbGx5LA0KDQpPbiBUaHUsIDIw
MjQtMDItMjIgYXQgMTE6MjUgKzA4MDAsIEtlbGx5IEh1bmcgd3JvdGU6DQo+IERvY3VtZW50IHRo
ZSBuZXcgY29tcGF0aWJsZXMgdXNlZCBvbiBBU1VTIFg0VEYuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IEtlbGx5IEh1bmcgPEtlbGx5X0h1bmdAYXN1cy5jb20+DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwgfCAxICsNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FzcGVlZC9hc3BlZWQueWFtbA0KPiBp
bmRleCA3NDllZTU0YTNmZjguLjYwYTQ5NGI3YWFhZiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwN
Cj4gQEAgLTc0LDYgKzc0LDcgQEAgcHJvcGVydGllczoNCj4gICAgICAgICAgICAgICAgLSBhbXBl
cmUsbXRtaXRjaGVsbC1ibWMNCj4gICAgICAgICAgICAgICAgLSBhc3BlZWQsYXN0MjYwMC1ldmIN
Cj4gICAgICAgICAgICAgICAgLSBhc3BlZWQsYXN0MjYwMC1ldmItYTENCj4gKyAgICAgICAgICAg
ICAgLSBhc3VzLCB4NHRmDQoNCllvdSBuZWVkIHRvIHJlbW92ZSB0aGUgc3BhY2UgYWZ0ZXIgdGhl
IGNvbW1hLiBUaGlzIHNob3VsZCBiZSBgYXN1cyx4NHRmYC4NCg0KQW5kcmV3DQoNCjxwPjwvcD4N
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQpUaGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgdG8gaXQg
Y29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gYW5kIGFyZSBpbnRlbmRlZCBzb2xlbHkg
Zm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQuIElm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb3IgcmVjZWl2ZSBpdCBhY2NpZGVu
dGFsbHksIHBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBieSBlLW1haWwgYW5k
IGRlbGV0ZSB0aGUgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzIGZyb20geW91ciBjb21wdXRl
ciBzeXN0ZW0sIGFuZCBkZXN0cm95IGFsbCBoYXJkIGNvcGllcy4gUGxlYXNlIGJlIGFkdmlzZWQg
dGhhdCBhbnkgdW5hdXRob3JpemVkIGRpc2Nsb3N1cmUsIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBv
ciBhbnkgYWN0aW9uIHRha2VuIG9yIG9taXR0ZWQgaW4gcmVsaWFuY2Ugb24gdGhpcywgaXMgaWxs
ZWdhbCBhbmQgcHJvaGliaXRlZC4gQW55IHZpZXdzIG9yIG9waW5pb25zIGV4cHJlc3NlZCBhcmUg
c29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3IgYW5kIGRvIG5vdCByZXByZXNlbnQgdGhvc2Ugb2Yg
QVNVU1RlSy4NCg0KRm9yIHByaWNpbmcgaW5mb3JtYXRpb24sIEFTVVMgaXMgb25seSBlbnRpdGxl
ZCB0byBzZXQgYSByZWNvbW1lbmRhdGlvbiByZXNhbGUgcHJpY2UuIEFsbCBjdXN0b21lcnMgYXJl
IGZyZWUgdG8gc2V0IHRoZWlyIG93biBwcmljZSBhcyB0aGV5IHdpc2guDQo9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0K
