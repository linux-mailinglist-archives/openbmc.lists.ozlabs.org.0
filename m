Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE536D407
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 10:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVX5Z0GWlz3000
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 18:35:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=MzIUPIwW;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=MzIUPIwW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.139; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=MzIUPIwW; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=MzIUPIwW; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310139.outbound.protection.outlook.com [40.107.131.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVX5F3jy6z2yRB
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 18:35:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FryWfXjtmRUVBVckvbcg9srX2rVjrNRYGpRTPFD3es=;
 b=MzIUPIwWYB4Lc+Xf5fkjtjAQ/4QXEfJWmC+ffqShCpqNE0trzP+uUO2wIe2xaiAsbig4X+0ybvxpFK+NG2+tXUm+2xcplYatUaQGizFWjDt2g+0kBxhQ0b/CJBlGm8yOV00Nn7bF5qjjGhbLuVJYXGhIETrfKJbqoR0XgBARQFCuS109h4SAPo8hrSLqMZdNMyIRq3iiH3306W+4eozx//IzQdBlicBDCy7b8n8LQmLvWUEHAvDJDabVT+8wLmGjDkOHQbdPvlhUbDguugYTAwpdfc3qEgG/tRjRWEYyVN57ieuFIqp4iurTUViIGyi40Pabf2yTcipGHG3BdwVnYw==
Received: from SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) by TY2PR04MB2813.apcprd04.prod.outlook.com
 (2603:1096:404:3a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 08:35:15 +0000
Received: from HK2APC01FT009.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:15:cafe::23) by SG2PR01CA0101.outlook.office365.com
 (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Wed, 28 Apr 2021 08:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; intel.com; dkim=pass (signature was verified)
 header.d=HCL.COM;intel.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.59) by
 HK2APC01FT009.mail.protection.outlook.com (10.152.248.93) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 28 Apr 2021 08:35:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elf0zfYZOopfWM/9EzgxSbgogDpzAUswrDf660R6kSk7RAUZRz9a7TmHNn4wtUVSTPiAjdyoklNKtjybW7AJwYXWPcOyBZi5S+PNPIuM3Lmz4gz46VpgyEMJ6mGgkwdh/wv4hOkZMrNUhKCdeBn+jkElILOHnJix4PDHYsCbZSGIPhd/TPp0GiuGd19Madx7/lbd3h+UiebgT0Ze5KXFZt/GYzXD4pGVXanqbHa1gJ+GCRggXAyflk9AoNV3eNCBH33atEkF8MswpQgiJXFMtuBSBccB9IX0gYSw3MNaBbjUQY/Te8ZmVZShpf8Lw34jx0W55rEK0LV+uZophk/klQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FryWfXjtmRUVBVckvbcg9srX2rVjrNRYGpRTPFD3es=;
 b=FkGxH1UB9qzBcnt4IVeoG9h6Pwv9eBmadB4eH9EiOV7pxh36lrc05HnrDxhFUJ3Vigz5+dXDAedft8J4nXrWNp/5CRPlw5ec9bKaRgoNbU2rI35tfzxhyAqVDWwhZW/XJg4fPqQog3ffxJ7GW0qJLqknsPxLUNnyJ/W0Ktvr3Lzm0qrlyI7VJ8CTnlrYOlhdmiBtTqT/JFWnqM76+aaiNcqLcgGxruygOtU++YESZWpxzBanwhjn3/G/Fq/n6flCAobmI4KuuqT3+3MfYBkOdGx4B60KqiMGDfvMrSttm844nnrbigZD6SvZIvWxp9wXGLZtWHXa9r9AoknTb7rN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FryWfXjtmRUVBVckvbcg9srX2rVjrNRYGpRTPFD3es=;
 b=MzIUPIwWYB4Lc+Xf5fkjtjAQ/4QXEfJWmC+ffqShCpqNE0trzP+uUO2wIe2xaiAsbig4X+0ybvxpFK+NG2+tXUm+2xcplYatUaQGizFWjDt2g+0kBxhQ0b/CJBlGm8yOV00Nn7bF5qjjGhbLuVJYXGhIETrfKJbqoR0XgBARQFCuS109h4SAPo8hrSLqMZdNMyIRq3iiH3306W+4eozx//IzQdBlicBDCy7b8n8LQmLvWUEHAvDJDabVT+8wLmGjDkOHQbdPvlhUbDguugYTAwpdfc3qEgG/tRjRWEYyVN57ieuFIqp4iurTUViIGyi40Pabf2yTcipGHG3BdwVnYw==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3221.apcprd04.prod.outlook.com (2603:1096:4:6a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22; Wed, 28 Apr 2021 08:35:11 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9%6]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 08:35:10 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>, Ed Tanous
 <edtanous@google.com>, Lei Yu <yulei.sh@bytedance.com>
Subject: RE: Entity Manager error in tiogapass
Thread-Topic: Entity Manager error in tiogapass
Thread-Index: Adc6tGSjhLUXMjPPTwme3f9r4r0GsAABWu+AABScgIAAHnF1AAACrLWAAB3iPPA=
Date: Wed, 28 Apr 2021 08:35:10 +0000
Message-ID: <SG2PR04MB30936D8EFD5142F6BD7CE0AFE1409@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
 <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
 <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>
 <0b2957f2-dbf2-79c3-2788-b9105aef2db6@intel.com>
In-Reply-To: <0b2957f2-dbf2-79c3-2788-b9105aef2db6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOTQ1ZmIzYzEtNTE1OC00Y2U2LWIwOGUtOTk4YTU3ZjhmYWRmIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImJoSytadWVuYnZSc1I5ZXBkeGgxSW1lWDM3aGxxRXYxd2dcL28rblJGZm83UUhFU2pDamlkTnNyNHZMV0lCdnhYIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:649f:2e7d:9a1:af13:d7c5:55eb]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6861af91-e6df-47a6-4339-08d90a208b9a
x-ms-traffictypediagnostic: SG2PR04MB3221:|TY2PR04MB2813:
X-Microsoft-Antispam-PRVS: <TY2PR04MB281309E56DC66DEC59116205E1409@TY2PR04MB2813.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /BwL+q9KX+p/yCXe1NusdrMNoojnjz/kDlJmBodSmD5BJ4VUiJUMxB06N8+g9FPI/HMGqrjjoz+jXQlGv3RD6/82Rcow4nz8jdvIc6BoCBbROKmJVDYl9S37AVD8DcJ7IJ80Oh3KloJ5pKY6oaiv1/6/ruCOfPym2kzx/J9NEN9cIRSyX3VgsMB124JVdXHH/Z3zMStns6sKQmYhgL7gWN18Y3oZYatZJsS+zYpp1KstZpuNuqXkYv8FwzYct59GBreqsICgLYOTpKUZZcdm7h/4+GMCRl1vyByXyLXt/glABBg/h/nC7ycojP/0sbWVQ7D72oEVXD2KnjMyH7pDH8JKebNEWY0qVibIu4mo4z3VpiTQg36NRY5C2sCJrPWUXSXxorFWIoD6QtHhgWknNGWkGjfjX9RT1icGfiVIDf2q1dU6pMllMpPOzcCL/V30/NNOlZ3uqBkoJLnpjvou3gYyfaNw571gqiXn5jUK03hQp0NDR+UuiXf+URyomz779hM4d/ivrTQxnGH8BUajEujpUP9A3GCDpFW6CHgZFK1XLrfny2Tb/nD9pyU6O45zk3uKioyd17im7gacShduH5qQqsCcFXipDTPJqGPbM1fNmGTWVjiM5Q0yRJdNxnW1btiwcKotf/3ybsC2d0nnkJlaZ6DOFEsMEgZv22a/4Ec=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(55016002)(33656002)(9686003)(66946007)(186003)(5660300002)(8676002)(66556008)(7696005)(76116006)(64756008)(8936002)(52536014)(4326008)(66446008)(122000001)(66476007)(53546011)(966005)(6506007)(478600001)(38100700002)(83380400001)(2906002)(110136005)(71200400001)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Nmwzd20xYjB4MHRrUWdQUDJseCtLL3pIcC80RElMcUNWaDdhYmpXeHRpY1NV?=
 =?utf-8?B?VFA3OWgzWU5Hbit0TU1aMnVqcldHYTVvcmtiSHBVajR1MDA1UkN1YzkvMmtz?=
 =?utf-8?B?cEZmL1A4TmRKMmk4bUh6czFwRmd2WUFndWZUMzRHbzdhMTZnRFByYnJSek1a?=
 =?utf-8?B?TGJHeUwwTWoxVWF1YUJ1TG5mcEw3ZndZNWN6WWMySUNaSkZLMkxPQ3huSEo4?=
 =?utf-8?B?dzJTSW1ySHJKYzdDakJhMTRpVVhTVnlSL0NXZzNjOGtBT2x4cnB3UDdnelE1?=
 =?utf-8?B?M2tCdHp5UEtKelBNL29wU1FZZWhRYXBpdjhxeGw3WVJJYU5aRnllYTNqNFV0?=
 =?utf-8?B?aG9HY3VoWUZwU1VCY0N4NjQvMEZKaHVxS3Z3WlZNeGtBZEUwMFRTZzVOajBi?=
 =?utf-8?B?a2lkdi9nc25iemlqZ2EvWnpjVktjU2NIOHZXeG95MytaaWNXdzF0R3kyaW9X?=
 =?utf-8?B?V3lZVkZjdFlRZFhSL1dYdnVvY3R4QTRoTnJuS29iOGRaczZVWERWRktiVXlL?=
 =?utf-8?B?bTFaMkdLajFIZnYrMmFGbllLVFV2NHIwa0V5REtNbFp3bzRDbzh3UW9yZGxl?=
 =?utf-8?B?SmhDaEl3Sm4ydEppckFxT3cwVFU0OU1wenNRUVJTdHdIdTlVbGQxS2lZSElN?=
 =?utf-8?B?azZZVWRMYStKaVJKUWFNYjQvTzZEeDhaZmljVENMNnJiMHRzQzRvU2V4RGtw?=
 =?utf-8?B?UmRyZ2VnakZnTVpWOHFDMXpmaGpBM1BraTJteDByUTl0RjFzSmc0L0FBVUU4?=
 =?utf-8?B?eUtHNm5lZHZqcWRJWWlibEhXQ1lZZFdxcGFqN1hFa2ZoVzd5NVBVYjRGWEZT?=
 =?utf-8?B?NlBxR3l1cUFibEFQVTJJelkyRTRCT04reURlZ2dib2FJdjRWRjRFb3lCSnhB?=
 =?utf-8?B?RjVDSkh5S2NqRUxHZGNDOVVXQzBEaUV0emxEcW1aQ0FFeWl0UTRUL0l4SEty?=
 =?utf-8?B?MHp3UjBXdFBWVzA5VWpTajI2UGl3UnhKaEltZjBpMlcveStoRHRXMlhCaUta?=
 =?utf-8?B?U2l3clJvU2ZxRXA1Wk1ubnF5TGx4bEdGNU5TWDdtL1pIdDNaYzU4ZHZ2am42?=
 =?utf-8?B?bjFGcWQvNklQWDFlM0dYQ0w4cC9nMHpjbjd4a3F4M2lvZXhyRlRLM3FJbTdC?=
 =?utf-8?B?Qm5LU2dVUFNJSlpHeEowbWlHS0YrQk9xZnZ6RFFZM1BnZ1U1TnMyYnQrZzFz?=
 =?utf-8?B?b1ZPWlcvMnRZTFJIcFBOd21iMXZFZ1BkaUxKS0U4eit5enlYRUpNd1F2bVBB?=
 =?utf-8?B?L3Z6c2lKcmJIRjBCenl3dmJCUUw5c1NOb0ZWMVpaeFNBSmF2dUlmOXlRWE00?=
 =?utf-8?B?L05zQUhIdU8zclhDU3pSbk56MWRCclhFbFRScXFNV0toQ3RXZVIwRlRwWFdh?=
 =?utf-8?B?bWYxZmRROHZFY0V1clJiUkR6dU5helBMSER3NnQ4aEQzaTZxTHgrcTlDVzcr?=
 =?utf-8?B?MDdjc1NwNS9QSVVIeEpZcGxlUlhWQkEyc1NCYlVzdm9vUVdSbUdydUUzMXJY?=
 =?utf-8?B?Vmx2MlhlMGo2UTUwckpxbW5Hek1ybUxpc1hnaThlY2l6am9rR3JZaHNOVFlU?=
 =?utf-8?B?eE5JY3h2bitSZnk3cW50L1Y5dThGcFRBN3JJK3Y2YWpmaHpmK1N2OFhyTUx3?=
 =?utf-8?B?MmNUM0xJWVdQV2d0RERkazRrMkI2c3ZHSU13VUNvY0tuYkoxUS9tV0dhN085?=
 =?utf-8?B?em9tYVE0MFRXVS9tcDA0NzQzdFI1OU1LMWZFOCtZcHlyWFIvUG5qY2lsQkd0?=
 =?utf-8?B?QU5CQnVkdlZQS0NZbXd3OGhZekdIbSthdXNTNVZPY3hudTQwYVk2UWhMZmh5?=
 =?utf-8?Q?9QPc0GLTtqLjvt5hBlyh685pYoQdj4YaU2VDQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3221
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT009.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a33d8435-32b6-4613-7000-08d90a208945
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5R/viTv0JMCsUTMl19PBhsDb56XyJzRfTIN934q4thCFiTysrcT3sBIPCAspuPQ/xaoAtThl1rNoKEQKvJACqZ8yrUyFXR6pneE54U9hG1Ox3DeZSRNWtT1RO3jXN7KIWeiWz3IceAbz84z+c8CaAV3ZVnYbqxEADESUy+vxmukzBzPt3Q1Gh0wGEGHZRhgkrinh+2mER96uEJUxZKOetwhY0VBr/c00kXGmBQ0lHQ6VB+syE7Hh13Vh0vKZR9JDX9KlsqpnD2RJFt7Q9JKbPYYUbH3Gq81XBTgC7sRrR9iqoNn0lOxjdP3Jx4tgQHGvNyiEuXlWSSkxvOidGqJF2Lnlnij3l/p59/E1cbD5Uo4jsovymo5KUKr3v5lAFDOCshgTa8rBMPOV6OZzr8SZFGJWBywVnNpvcHdhPM4X3IM3FHxQ9ZSCFoXDq7m5XVSzLjRNUEKmhV/pi2xCXVWCToHIFT0SQwbc9ZpUaQNK5KeTQfetQToyn4BQz774uZ8sknS9bo/MrWqCPGPM3rKQV1eNwLr2YYkNrGCajngIHCSuTArWTsQxkAQg04z39ItpbYaRMBsEQFrc/ERCYr7WLXyp2DPfHLKc4fQtZN+iVM/ka27jg29CWoJrmuZcaE5ZFRtFL8sQqsCb8b74Fh1APhWIFepuAlzzHjWQJqHPRH9DVzx4O0zzFBvcBiHPfUVW7fpUsCaynvCSqYebDnQBsXaQIn+KeHPv0upoEC52xQi8Odq8crcvIuiJqL04NwfXH7lGztgog1fW2bhucHooosiFJsNRxSjwZgK2EZmAJo=
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(81166007)(36906005)(5660300002)(26005)(82310400003)(47076005)(2906002)(36860700001)(7696005)(83380400001)(9686003)(966005)(34020700004)(356005)(478600001)(70586007)(316002)(82740400003)(55016002)(53546011)(33656002)(86362001)(6506007)(336012)(52536014)(8936002)(186003)(70206006)(110136005)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 08:35:14.1522 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6861af91-e6df-47a6-4339-08d90a208b9a
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT009.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2813
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

Q2xhc3NpZmljYXRpb246IFB1YmxpYw0KDQpIaSBKb2huYXRoYW4sDQoNCkluIHRpb2dhcGFzcyBq
c29uIGZpbGUsIEJ1cyAxNiBpcyBwcmVzZW50LiBCdXQgZHJpdmVyIChpMmMtMTYpIGlzIG5vdCBj
cmVhdGVkIGluIG15IGhhcmR3YXJlLiBTbyB0aGUgY3Jhc2ggb2NjdXJzIGluIGVudGl0eSBtYW5h
Z2VyLg0KSWYgdGhpcyB0eXBlIG9mIGNhc2Ugb2NjdXJzLCBjYW4gZW50aXR5IG1hbmFnZXIgZGlz
cGxheSB0aGlzIGFzIGVycm9yIG1hc3NhZ2Ugbm90IGFzIGNyYXNoID8NCg0KUmVnYXJkcywNCkph
eWFzaHJlZS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEpvaG5hdGhhbiBN
YW50ZXkgPGpvaG5hdGhhbngubWFudGV5QGludGVsLmNvbT4NClNlbnQ6IFR1ZXNkYXksIEFwcmls
IDI3LCAyMDIxIDExOjQxIFBNDQpUbzogRWQgVGFub3VzIDxlZHRhbm91c0Bnb29nbGUuY29tPjsg
TGVpIFl1IDx5dWxlaS5zaEBieXRlZGFuY2UuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZzsgSmF5YXNocmVlIEQgPGpheWFzaHJlZS1kQGhjbC5jb20+DQpTdWJqZWN0OiBSZTogRW50
aXR5IE1hbmFnZXIgZXJyb3IgaW4gdGlvZ2FwYXNzDQoNCg0KDQpPbiA0LzI3LzIxIDk6NTQgQU0s
IEVkIFRhbm91cyB3cm90ZToNCj4gT24gTW9uLCBBcHIgMjYsIDIwMjEgYXQgNzoyMyBQTSBMZWkg
WXUgPHl1bGVpLnNoQGJ5dGVkYW5jZS5jb20+IHdyb3RlOg0KPj4gT24gVHVlLCBBcHIgMjcsIDIw
MjEgYXQgMTI6MzUgQU0gSm9obmF0aGFuIE1hbnRleQ0KPj4gPGpvaG5hdGhhbngubWFudGV5QGlu
dGVsLmNvbT4gd3JvdGU6DQo+Pj4gSmF5YXNocmVlLA0KPj4+DQo+Pj4gT24gNC8yNi8yMSA5OjAw
IEFNLCBKYXlhc2hyZWUgRCB3cm90ZToNCj4+Pj4gQ2xhc3NpZmljYXRpb246ICpDb25maWRlbnRp
YWwqDQo+Pj4+DQo+Pj4+IEhpIFRlYW0sDQo+Pj4+DQo+Pj4+IEluIHRoZSBsYXRlc3QgYnVpbGQs
IEkgYW0gZmFjaW5nIHRoZSBiZWxvdyBpc3N1ZSBpbiBFbnRpdHkgTWFuYWdlcg0KPj4+PiBmb3Ig
dGlvZ2FwYXNzLg0KPj4+Pg0KPj4+PiBBbHJlYWR5IGlzc3VlIGhhcyBiZWVuIGNyZWF0ZWQgaW4g
RW50aXR5IE1hbmFnZXIgUmVwbyAtDQo+Pj4+IGVudGl0eS1tYW5hZ2VyIHRlcm1pbmF0ZWQgYnkN
Cj4+Pj4gJ3N0ZDo6ZmlsZXN5c3RlbTo6X19jeHgxMTo6ZmlsZXN5c3RlbV9lcnJvcicgwrcgSXNz
dWUgIzggwrcNCj4+Pj4gb3BlbmJtYy9lbnRpdHktbWFuYWdlciAoZ2l0aHViLmNvbSkNCj4+Pj4g
PGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2VudGl0eS1tYW5hZ2VyL2lzc3Vlcy84Pg0KPj4+
Pg0KPj4+PiByb290QHRpb2dhcGFzczp+IyBzeXN0ZW1jdGwgc3RhdHVzDQo+Pj4+IHh5ei5vcGVu
Ym1jX3Byb2plY3QuRW50aXR5TWFuYWdlci5zZXJ2aWNlIC1sDQo+Pj4+DQo+Pj4+IOKXjyB4eXou
b3BlbmJtY19wcm9qZWN0LkVudGl0eU1hbmFnZXIuc2VydmljZSAtIEVudGl0eSBNYW5hZ2VyDQo+
Pj4+DQo+Pj4+ICAgICAgIExvYWRlZDogbG9hZGVkDQo+Pj4+IChdODs7ZmlsZTovL3Rpb2dhcGFz
cy9saWIvc3lzdGVtZC9zeXN0ZW0veHl6Lm9wZW5ibWNfcHJvamVjdC5FbnRpdHkNCj4+Pj4gTWFu
YWdlci5zZXJ2aWNlL2xpYi9zeXN0ZW1kL3N5c3RlbS94eXoub3BlbmJtY19wcm9qZWN0LkVudGl0
eU1hbmFnZQ0KPj4+PiByLnNlcnZpY2VdODs7Ow0KPj4+PiBlbmFibGVkOyB2ZW5kb3IgcHJlc2V0
OiBlbmFibGVkKQ0KPj4+Pg0KPj4+PiAgICAgICBBY3RpdmU6IGFjdGl2ZSAocnVubmluZykgc2lu
Y2UgVGh1IDE5NzAtMDEtMDEgMDA6MDQ6MTAgVVRDOw0KPj4+PiAyNXMgYWdvDQo+Pj4+DQo+Pj4+
ICAgICAgUHJvY2VzczogODUxIEV4ZWNTdGFydFByZT0vYmluL21rZGlyIC1wIC92YXIvY29uZmln
dXJhdGlvbg0KPj4+PiAoY29kZT1leGl0ZWQsIHN0YXR1cz0wL1NVQ0NFU1MpDQo+Pj4+DQo+Pj4+
ICAgICAgUHJvY2VzczogODUyIEV4ZWNTdGFydFByZT0vYmluL21rZGlyIC1wIC90bXAvb3Zlcmxh
eXMNCj4+Pj4gKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MC9TVUNDRVNTKQ0KPj4+Pg0KPj4+PiAgICAg
TWFpbiBQSUQ6IDg1MyAoZW50aXR5LW1hbmFnZXIpDQo+Pj4+DQo+Pj4+ICAgICAgIENHcm91cDoN
Cj4+Pj4gL3N5c3RlbS5zbGljZS94eXoub3BlbmJtY19wcm9qZWN0LkVudGl0eU1hbmFnZXIuc2Vy
dmljZQ0KPj4+Pg0KPj4+PiAgICAgICAgICAgICAgIOKUlOKUgDg1MyAvdXNyL2Jpbi9lbnRpdHkt
bWFuYWdlcg0KPj4+Pg0KPj4+PiBKYW4gMDEgMDA6MDQ6MDkgdGlvZ2FwYXNzIHN5c3RlbWRbMV06
IFN0YXJ0aW5nIEVudGl0eSBNYW5hZ2VyLi4uDQo+Pj4+DQo+Pj4+IEphbiAwMSAwMDowNDoxMCB0
aW9nYXBhc3Mgc3lzdGVtZFsxXTogU3RhcnRlZCBFbnRpdHkgTWFuYWdlci4NCj4+Pj4NCj4+Pj4g
SmFuIDAxIDAwOjA0OjI3IHRpb2dhcGFzcyBlbnRpdHktbWFuYWdlcls4NTNdOiBJbnZlbnRvcnkg
QWRkZWQNCj4+Pj4NCj4+Pj4gSmFuIDAxIDAwOjA0OjI3IHRpb2dhcGFzcyBlbnRpdHktbWFuYWdl
cls4NTNdOiB0ZXJtaW5hdGUgY2FsbGVkDQo+Pj4+IGFmdGVyIHRocm93aW5nIGFuIGluc3RhbmNl
IG9mICdzdGQ6OmZpbGVzeXN0ZW06Ol9fY3h4MTE6OmZpbGVzeXN0ZW1fZXJyb3InDQo+Pj4+DQo+
Pj4+IEphbiAwMSAwMDowNDoyNyB0aW9nYXBhc3MgZW50aXR5LW1hbmFnZXJbODUzXTogICB3aGF0
KCk6ICBmaWxlc3lzdGVtDQo+Pj4+IGVycm9yOiByZWN1cnNpdmUgZGlyZWN0b3J5IGl0ZXJhdG9y
IGNhbm5vdCBvcGVuIGRpcmVjdG9yeTogTm8gc3VjaA0KPj4+PiBmaWxlIG9yIGRpcmVjdG9yeSBb
L3N5cy9idXMvaTJjL2RldmljZXMvaTJjLTE2XQ0KPj4+Pg0KPj4+IENoZWNrIHRoaXMgcG9ydGlv
biBvZiBzcmMvT3ZlcmxheS5jcHAgc3RhdGljIGJvb2wNCj4+PiBkZXZpY2VJc0NyZWF0ZWQoY29u
c3Qgc3RkOjpzdHJpbmcmIGRldmljZVBhdGgsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RkOjpzaGFyZWRfcHRyPHVpbnQ2NF90PiBidXMsDQo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RkOjpzaGFyZWRfcHRyPHVpbnQ2NF90PiBhZGRyZXNzLA0KPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGJvb2wgcmV0cnlpbmcpDQo+Pj4NCj4+
PiBJIHBsYWNlZCBhIGNvbW1lbnQgZGVzY3JpYmluZyB0aGUgaW50ZW50IG9mIHRoZSBkaXJlY3Rv
cnkgaXRlcmF0b3IuDQo+Pj4gSSBoYXZlIG5vdCBzZWVuIHRoZSBpc3N1ZSBkZXNjcmliZWQgb24g
b3VyIHN5c3RlbXMsIG5vciBpbiBRRU1VDQo+Pj4gKHJlcG9ydGVkIGJ5IGFub3RoZXIgZGV2KSwg
c28gSSdtIG5vdCBhYmxlIHRvIGlkZW50aWZ5IHRoZSBpc3N1ZS4NCj4+IFRoZSBpc3N1ZSBpcyBy
ZXBvcnRlZCBhdA0KPj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZW50aXR5LW1hbmFnZXIv
aXNzdWVzLzgsIGFuZCB0aGUgY29tbWl0DQo+PiB0aGF0IGludHJvZHVjZXMgdGhlIGlzc3VlIGlz
DQo+PiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRpdHktbWFuYWdlci9jb21taXQvOWI4
Njc4N2FkZWEzZjhmMjlmYWMNCj4+IDJhY2JiOWZhMGY0OGZiY2YyNDRhDQo+Pg0KPj4gQ291bGQg
eW91IGtpbmRseSBpbnZlc3RpZ2F0ZSB0aGUgZXhjZXB0aW9uIGFuZCBzZWUgaG93IHRvIG1ha2Ug
aXQgbm90IGNyYXNoPw0KPiBJdCBzb3VuZHMgbGlrZSBKb25hdGhhbiBpc24ndCBhYmxlIHRvIHJl
cHJvZHVjZS4gIERvIHlvdSB0aGluayB5b3UNCj4gY291bGQgY2FwdHVyZSB0aGUgZnVsbCBzdGFj
ayB0cmFjZSBmcm9tIHRoZSBleGNlcHRpb24/ICBEbyB5b3UgaGF2ZQ0KPiBhbnl0aGluZyBvZGQg
b24geW91ciBzeXN0ZW1zIHRoYXQgd291bGQgY2F1c2UgdGhlIGRpZmZlcmluZyBiZWhhdmlvcj8N
Cj4NCj4+IC0tDQo+PiBCUnMsDQo+PiBMZWkgWVUNCg0KVGhpcyBtYXkgYmUganVzdCB3aXNoZnVs
IHRoaW5raW5nLi4uLg0KTG9va2luZyBhdCB0aGUgSlNPTiBpbnB1dCBmaWxlIGZvciBidXMgMTY6
DQoiQnVzIjogMTYsDQogICAgICAgICAgICAgIk5hbWUiOiAiTUJfQzJfQVZBX1JURU1QIiwNCg0K
V291bGQgdGhlIHJlY2VudCBzZGJ1c3BsdXMgZW5jb2RpbmcgY2hhbmdlcyBjYXVzZSBhbiBpc3N1
ZT8NClRoZSAiX0MyIiBpcyBnb2luZyB0byBiZSB0cmFuc2xhdGVkIGludG8gc29tZXRoaW5nIHRo
YXQgbWF5IGJlIHByb2JsZW1hdGljLg0KDQpEb2VzIGFwcGx5aW5nDQpodHRwczovL2dlcnJpdC5v
cGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9zZGJ1c3BsdXMvKy80MjUxMiBjaGFuZ2UgYW55
dGhpbmc/DQoNCi0tDQpKb2huYXRoYW4gTWFudGV5DQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXIN
CiphemFkIHRlKipjaG5vbG9neSBwYXJ0bmVycyoNCkNvbnRyaWJ1dGluZyB0byBUZWNobm9sb2d5
IElubm92YXRpb24gc2luY2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02NzY0DQpFbWFpbDogam9o
bmF0aGFueC5tYW50ZXlAaW50ZWwuY29tIDxtYWlsdG86am9obmF0aGFueC5tYW50ZXlAaW50ZWwu
Y29tPg0KDQoNCjo6RElTQ0xBSU1FUjo6DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KVGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUg
Y29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5
LiBFLW1haWwgdHJhbnNtaXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBl
cnJvci1mcmVlIGFzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQs
IGxvc3QsIGRlc3Ryb3llZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRh
aW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAo
d2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRh
Y2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0
ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFy
ZSBzb2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZs
ZWN0IHRoZSB2aWV3cyBvciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBm
b3JtIG9mIHJlcHJvZHVjdGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwg
bW9kaWZpY2F0aW9uLCBkaXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBt
ZXNzYWdlIHdpdGhvdXQgdGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJl
cHJlc2VudGF0aXZlIG9mIEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0
aGUgc2VuZGVyIGltbWVkaWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0
dGFjaG1lbnRzLCBwbGVhc2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0
cy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo=
