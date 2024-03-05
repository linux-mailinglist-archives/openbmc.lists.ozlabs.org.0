Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F9872CB3
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 03:23:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=j6b8RdOZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqGSZ51Tzz3vYL
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 13:23:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=j6b8RdOZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=78716d20e=kelly_hung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tplzq6TBRz3dXS
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 17:30:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1709620216; x=1741156216;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hGahheCvjBwflqiQSLhxq3X4E4kioovtUC6TP/o+Kyc=;
  b=j6b8RdOZuGrVeUpvAu183QHIlhONaMswH58gq+SoPEwJdFbXNeHkojlL
   yhkTTK3XrkLRQZiLTO77HqQBwOq+YttsFs9Fcw2R4HdG5xo8zsmjGQCgS
   di7F6G4qK22t/PvuVB7KQmZq5eM4tc/YNXJA76HOqbCjZDZk4NdouP1RI
   U=;
X-IPAS-Result: =?us-ascii?q?A2EfAABMu+Zl/w0GFqxaHAEBAQEBAQcBARIBAQQEAQFAC?=
 =?us-ascii?q?YEyBwEBCwGCOHoCgV+EVYgdiUoDiiGBP5BRKoEsFIEsNQkPAQEBAQEBAQEBB?=
 =?us-ascii?q?wEBLgsLBAEBAwSEfwIWh14nNAkOAQIEAQEBAQMCAwEBAQEBAQgBAQEFAQEBA?=
 =?us-ascii?q?QEBBgQBAQECgRmFLz0NglwBEIEOgSYBAQEBAQEBAQEBAQEBAQEBAQEXAg16A?=
 =?us-ascii?q?QEBAQMBIhFFDAQCAQYCDQEDBAEBAQICJgICAh4HChUICAIEAQ0FCIJ5gisDM?=
 =?us-ascii?q?RQGlT2bOnqBMhpnghYEgVBBrg4NgSyBIwYJAYEQLgGBaIYfHgGBVoFsgjODQ?=
 =?us-ascii?q?XuCTyZvQoFmgQI+gh9CAoErARIBIwUQFQwCgyE5gi8EgRQjXIMSKYIrA4ECg?=
 =?us-ascii?q?SiMTYESLIMYRSWFbglLfxwDgQUEWg0FFhAeNxEQEw0DCG4dAjE6AwUDBDIKE?=
 =?us-ascii?q?gwLHwVUA0MGSQsDAhoFAwMEgS4FDRoCEBoGDCYDAxJJAhAUAzgDAwYDCjEwV?=
 =?us-ascii?q?UEMUANkHxYcCTwPDBoCGxQNJCMCLD4DCQoQAhYDHRYEMBEJCyYDKgY2AhIMB?=
 =?us-ascii?q?gYGXSAWCQQlAwgEA1QDIHQRAwQaBwsHeIIJgT0EE0YBDQOBNAaKHgyDDwIFI?=
 =?us-ascii?q?wQmgVsDRB1AAwttPTUGDhsFBB8BHXwFoFcBgVkTNDVAEBABAhEVBQgMGAQsK?=
 =?us-ascii?q?BsQFTUNDhEaFAxEj3WCQIQImWyTRUpwDYMMgQOMCY0rgX2GKxeEBYx6hlwDk?=
 =?us-ascii?q?kmYWyCNUIQAlmICBAIEBQIOCIFBI4EmcDM9UIJnUhmSKY95eDsCBwEKAQEDC?=
 =?us-ascii?q?YZIgiYFL2dfAQE?=
IronPort-PHdr: A9a23:0U8PPRV7V6br+pUX4BBhc3m2R+jV8KwdUzF92vMcY1JmTK2v8tzYM
 VDF4r011RmVB9SdtqIP2rCe8/i5HzBasdDZ6DFKWacPfiFGoP1VpTBoONSCB0z/IayiRA0BN
 +MGamVY+WqmO1NeAsf0ag6aiHSz6TkPBke3blItdaz6FYHIksu4yf259YHNbAVUnjq9Zq55I
 AmroQnLucQan49vJrwxxxbKrXdFf/pazn5sKV6Pghrw/Mi98IBg/ihKp/4t68tMWrjmcqolS
 rBVEDspP2cp6cPxshXNURWB7WYGXGUMlRpIDQnF7BXkUZr0ryD3qOlz1jSEMMPvVbw7Viis4
 KltSB/zlScILCU5/33Nisxxl61UvhSsrAFizoHOYYGVMP1+fr7Bfd4fWGFMUNpdWzBHD4ihd
 IYEEfYPMvhEoIn8v1sOrAWxBQ+wBOP01zREgmb60bAm3+g9FA3L2hErEdATv3TOtNj7NLkcX
 P6owqnUwzvNbP1W1jXh54bHfR8suu2MUqlsfcbN1UUjCwHIg1ONooLlJTOV0eENvnCe4eV+U
 eKvj24moBxzrDiywMcshY3FhIQTyFLC8Cly3YE4K9imR05/Zd6lEINfuSOHN4twTcMvWHtnu
 D0nyr0do5K0YC8KyJE+yhPZdveIfJSG7Aj5W+aNPTd3mmhleLSnihi97UWs1u3xWMe03lhKs
 ydIj8fBu3IJ2hHd5MaKROdx81q/1DuLygzf9P1JL0A3mKfVNZMvzaA9mJoNvUrNHyL7nlj9g
 qGRdkUh4Oeo6uLnb63ppp+dK490ihz+Pb80lsOjBuQ4NxACX2uF9uSm0r3s40n5TKxXgfIoj
 KnWrpTaJcMDpq68HQBV1Joj5wy6Dzi71tkTgHoJLEpddR6ajYXlJUvCLO7mAfulglmgiipny
 v7eMrH/A5jBMnbOnbL8cbph70NRyQ8+wN9D655ID7wNPvH+VVL0udHdExM0PQq5yPv5BdV5y
 4MeQn6PDbGDMK3PsF+J5/wgLvGQaIITpT3zMeIq5+T0gn88gVIdeK6p0oYJZ32gBfRmJlmZY
 WLrgtccDWcGpgo+Q/LuiF2FSTNee2y8UKEg6z0nFI6qEIjNSYGwjbCbwCi7GYdWZnhACl+SD
 XfkbZ+LW+wRaCKJOsNhkzoEWqa9S4I5yB2jthH2x6B5IubK4CEVtIjv2MV76uHLkBE97z10D
 8CT02GXSGF0m3sFSToo06B7pUx8yk+M36plg/xeGtxe/OlGUhwnNZ7H1eB1F9fyWgfZctePU
 1mpWs+mDi0pTtIt398OZF5wFtu6ghDZwyWqG6MVl6CMBJEs8aLcxXnwJ8VmxnbFyqYhlV8mT
 dVLNWG8ga5/7QfTC5bTk0qFj6aqabgc3CnV+Web1WqOvU5YUA53UaXYRnAQeFDbrdv85kzYT
 r+uDa4rPRdGyc6HMqdKcMHmjU1aRPf/P9TTe2Wxm3+uChaO3byMaZbldn4Z3CXcE0gEjxsT8
 WyBNQk/AieuuXnRDCd0GVLoeUPs/ro2lHTubVUm3hqYc0pvn5my6BoSmuefSrtH3agWuw8ip
 i9yEVL72MjZXZ7IhAdleLQUQc477x8TzXrYuAx6I4etB69nj18aNQ9wuhWqn19wEohGm80hh
 Hcr1xZpb6WK1FpLbHWfx5+6cunQMmT09hWkQ6rXwU3FltGE/q4F87I/sVq17y+zEU930Hhj1
 8gd82aa6dUy9PJTGcbSX0Iz5i9aurfVSiAm+piS3nppZ/rn+gTe0s4kUbN2gi2reM1SZebdT
 Fea+4UyC8uvLbksnF6kJlIBMftJ/aE5d8Wha7Od2aGtMeoh+VDujWlO7I1nlE7Z8S16R73E2
 p8fyKSe2Q2KHz73kFamtJXxnoZJLTEfF2ay027qHolUM6RpYJ1NAmCrcKWK
IronPort-Data: A9a23:FJbiMqu+Hqi6YhGROtSP+v9SPefnVBNfMUV32f8akzHdYApBsoF/q
 tZmKWjTaKuIZ2unfYt+a4zk900EsMXQz9djTAtlryhhQ3lE9ZOVVN+UB3mrMnLJJKUvbmo+t
 JxGNYOowOPY7JP4jk3wWlQ0hSQkvU2wbuOgTrSCYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj7yyHlEAbNNwNcawr41YrS8HuDg9yv4Fv0jnRmDdhXsVnXkWUiDZ53Dcld+FOjGuG4tsbjL
 wry5OnRElHxpn/BOfv8+lrPSXDmd5aJVeS4Ztq6bID56vRKjnRaPq/Wr5PwY28P49mCt4gZJ
 NmgKfVc4OrmV0HBsL11bvVWL81xFYZP1LD/IlSnjemK0XftU3npn85ODU5jaOX0+s4vaY1P3
 dUgGhlVNkmut8jwy7WhUu9hmoIqN9TwVG8dkig/l3eDV7B4B8mYK0nJzYYwMDMYpc1KGefpR
 9cfZhJmdwnbJRZIPz/7Dbpkxr7w3iKmKGQwRFS9u7gUvGLS7D1I++KwCPGEXIakYu9qtxPNz
 o7B1yGjav0AD/Sc0yiG2nGhnOnCmWX8Qo16PKWg9/Fqh0CIy0QcDRQXUR2wpvzRokmmVtRVL
 kc8/is1sbN0816vR9PmGRqirxa5UgU0AoUKVbdgrl/Lk/G8DxulO1XohwVpMLQO3PLajxR6v
 rNVt7sF3QBSjYA=
IronPort-HdrOrdr: A9a23:CeHn0qzK9vGv95A+7TaxKrPxYugkLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBcpTiBUJPwJE80hqQFnbX5Wo3SETUO2VHYZr2KgrGSugEIdxeOldK1kJ
 0QCZSWa+eAQWSS7/yKmDVQeuxIqLLsncHJuQ6d9QYXcegDUdAn0+4TMHf+LqQCfnghOXNPLu
 v62iMonUvDRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1gjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3vRY0eTFcVcso+5zXMISdKUmRQXeR
 730lId1vFImjPsl6eO0F/QMkfboXETAjTZuCClaDPY0LLErXQBept8bUgwSGqB16Li1OsMiJ
 6ipQiixsBq5UirplWh2zCNPCsayHZdZBIZ4LUuZ7g2a/pDVFeXxbZvo3+9Wa1wbR7S+cQpFv
 JjA9rb4+sTeVSGb2rBtm0q29C0WG8vdy32C3Tql/blpAS+pkoJuXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAiiVKCi8e166MBDiDuUKKnjNo5n47PE84/yrYoUByN83lI
 7aWF1VuGYucwblCNGI3pdM7hfRKV/NFQjF24Vb/dx0q7f8TL3kPWmKT00vidKpp7EFDsjSS5
 +ISeZr6j/YXB7T8Kpyrn/DssNpWAkjueUuy6UGZ24=
X-Talos-CUID: =?us-ascii?q?9a23=3AmMg+MGpt3J7ZT+dEhAy1SqbmUessXnLlz1vIH2q?=
 =?us-ascii?q?hF1xCaL+QFWSw+awxxg=3D=3D?=
X-Talos-MUID: 9a23:oK19tgq1XUvnqFiORiYezy9wF5hi4oSfMWtXzK0t6u/eGwtaBB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO APZA001EXB.corpnet.asus) ([172.22.6.13])
  by ms.asus.com with ESMTP; 05 Mar 2024 14:30:11 +0800
Received: from APZA002TMD.corpnet.asus (172.22.47.62) by
 APZA001EXB.corpnet.asus (172.22.6.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 5 Mar 2024 14:30:09 +0800
Received: from APZA003EXB.corpnet.asus (172.22.6.15) by
 APZA002TMD.corpnet.asus (172.22.47.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 14:30:08 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.26.107)
 by APZA003EXB.corpnet.asus (172.22.6.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Tue, 5 Mar 2024 14:30:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHbncfGEKkVRLhzyqGI8/WhPcCV4JnbA+is/B8ccj4C/bEK2xSsLgATE995W1vdzMzZP024noJdqFjmBAuR+NyB7XlOl8loy29ZqBXUQ/LgRzudyOBatf0tfrM/EqMc1811I1ydmwHxpFos3mcHf/BCAYsA39wsdUgomdWdhWRldo1kTve1MCdBL7Ab13oAh3wVrpMcpTasuar2I6k0A7o6ON7rFUVjC9P1/oyHUpOnNWh+JkzrPYfJzDI6d3LkxZVtpMemKomWjntrGoXk5ufwDuuGVKTAM0xyxd13IbaE8gVj/cYEspJtqu4FkcUze+Ej/odfK7rF2iZ3hMvM2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGMTPGMot8zbVWsbbj+qRF1Ery2e4gwOddR8FMF72QQ=;
 b=iN/3ba1wsOB92Yf7wM+41GpzO/BqCEXflHomtGK8l1RG+jae67mon7r6Z8yq96FUzPP9s1FmDt7WO/0+v5E2Xv2x8a2P82TkFMOyg8hiYx3DwJkPRbHuHVAPcOhPx/lmBmE0iG04R2KN9ZfHK9JGZzILHRkLwfqh97xgGmaMgbAbG9Oe0Xg6epWxc8emqvfbXMvl45W337ncUySV3DBABSQhJ5kUEb7p4diVw8vi2g2Byh+Ro84J0fieWWPaP3zTV8ChCI/LYlrcLxcsArubbbB1CEywtHKy/r9eWIwLYTxS9G1JQzBze4VWeEd1mx2KA+3I5ZnpfV+B3nsCIyQe+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com (2603:1096:400:28d::13)
 by TYZPR04MB5757.apcprd04.prod.outlook.com (2603:1096:400:1fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 06:30:07 +0000
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6]) by TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6%3]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 06:30:07 +0000
From: =?utf-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Kelly Hung <ppighouse@gmail.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
Thread-Index: AQHaU1tmXKt4Bs16f0enSF1ARi3vRbD1OiSAgDOLYuA=
Date: Tue, 5 Mar 2024 06:30:06 +0000
Message-ID: <TYZPR04MB6596BB61B2D1B9216F06A18E9D222@TYZPR04MB6596.apcprd04.prod.outlook.com>
References: <20240130090447.198103-1-Kelly_Hung@asus.com>
 <acd6f49b-b476-4364-8263-06e20a0c599d@kernel.org>
In-Reply-To: <acd6f49b-b476-4364-8263-06e20a0c599d@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB6596:EE_|TYZPR04MB5757:EE_
x-ms-office365-filtering-correlation-id: 912efa3b-3191-46f7-985a-08dc3cddb31f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cZGmV1u+qgcazSTJjX3wO6wpRIKI2IOUwvb62xtW3yoN03hzc3VSjb/KuW0/IhLl2uTVN9oRc/h02QbE9SGOW3nqKWbgFF91fCrwVNVLnbDvEqOlyMrWfxfk1ap+/rVysJ9cTDIQfq3Fjq6acbsWFdCsWHuf/xbypgzNEYKEiadw/MxkmNlRrHc7fyG4J1S5LlTDHPXSU7zKwaSmedrhdaqdm1XSjc8ITnd7ITQBvi8jmALfYv2bpwIa52WyVsWE0kTHxsfyzcUpD/9cwhlFqqTTHBrpwcaSe+P8fBoIcncLTA9CDR9LTekQaDVdi+io8afYHRk4DI3ZVlLc/Yp3QNa3saIyWtp2WrxlCycQtA5biTw/9yOTkAo8QYki9v2DbfKmg8A1sp+3Vb2bDJ4E0gax74mN7sV8yMVKBcjQoVPcX81hijY3q/z7J1T5O57y3Y/D9DXh9PTv6CbZpUtXtEkkFNWT/5H3eRTU2Xlg2d3UyZDsceugvl/Tsz15mY4oFo/qeRwb9KkPB90xBy2p5N2CLaopwptrMWMWfuhkajm7IkQlKLhJKc6fOxQfHHiLigs9hxToVT5VFpUeXxBb8I3DrW29LHy5841GlD603Dm60m/xTJGf1/Tgu/b1F1ScqhTTmt/riXazH2hAc7tcgHJwY5Cie4/0iUcxaf06NrU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB6596.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWNLb2c2NGdTYU5BTVlucHc2dmlqNzFQYXh5VjZycG1RYzBMemlxRWpGelVR?=
 =?utf-8?B?OVVpOTJrc2Q5akhibjRCcVozWlNzRTlDbUVDN1VpOHl5cFhIdWxIOHM1VU5r?=
 =?utf-8?B?bVc5ZGc2dzZjR1NHMDVYblZ4RTZpYWF4eWhJelZCTDlrWUM3a1cwdHlvYUIr?=
 =?utf-8?B?T281a0JoMmd4Y2hDVXNnT0JYaFhRN3lUWEMxTEN6YUxLOU1ZSGU1UEVqczB6?=
 =?utf-8?B?cDdQeHFzbUg3QTJtaGszOHkzQnRMc3h6cFBoc212VjlLVTdkT0FqakV4a2lR?=
 =?utf-8?B?WWxqeUdvbkhPbkJ6ZHg2bW9wZGhib2NOYlV0NTZrcDlqOTZITXlzYnJHQ2FH?=
 =?utf-8?B?aVVLY1pqQldUbmZXTUU1aFN2SmtQNXp1ZVlPellpa0FkZUFNNGNqVXhBM1BF?=
 =?utf-8?B?YUJXRDQyVnllRXJsYTBQMmVUaFl5aHp3Mm5KRlQ4bzFpQjE4UUJoQWhWNE5p?=
 =?utf-8?B?UXliaFJ3QkFndGN6cHBHbGsvSU5PdVYwc1FNbE1jcTRvQkloMFJCczNESGtM?=
 =?utf-8?B?Vm1odldWQ1orTUVoUVlrY3VGN2t2cWdUM3pXcVo2R0hmRXBzWnE2RzRxV1FD?=
 =?utf-8?B?dFJPNWJDbFZ4Z1lkQ3FWdmEvQk9aSGp0SmZINFlsTUhYaTBScTF6bDRjTkpj?=
 =?utf-8?B?eG5tUFpqM2ZSaURYZ1pzYXhad2ZMencyNGQzZkxMNFlFbDZKMm9GWGJCdytK?=
 =?utf-8?B?b0VobTlvRXZDa0tpMnFOMjY3ZUh0QkdTVFMwVUVWSTUvV3VHaVVpRXk2akZk?=
 =?utf-8?B?Rnk0TUtNSVVYTkxOVjBaUXN3cjNWZld6czFMZlVCcTN3UEU2K3RBOU1QUGhi?=
 =?utf-8?B?MDI4ei8rU2lvMk1EY1lpUVdya1VIOGxPZVVUZnlmZGJwQmxYb3J2bkQxQkxB?=
 =?utf-8?B?MzIyWUMvL2Naa0Zvemx0RzZWQTh2cjBMTE1XbVc5dVBFaFFvd2lnRWZjcjZD?=
 =?utf-8?B?dzNlUGV5d0swM2tSL2lpTkdQR2xENlhWQ1ZlOE5vN1dmQWtRcmZ3RzloTXk5?=
 =?utf-8?B?N25CYzg5STVOcU9WRXpsVGdBUHZqdnFiK1FkMnVSSUJZc0NrWFdkR3VucjBx?=
 =?utf-8?B?bXNNU01yMUp4WjZzaTJJOFFiRXJaYUpvSGZZSUd0NFZvMnZDaE1kdkE1Wmdy?=
 =?utf-8?B?Q3l6MEhPcGxrWUwvUkRCNTJyMzV1ZzROTzFpdmp1Z3Q4NHo3eHdKR1U0STdC?=
 =?utf-8?B?Y09tYTZaNER0cXU1aTZLRmN0N1J0MnZwSDY2U1BlVUl3cTlacWxnRVlRbXZq?=
 =?utf-8?B?Qjd6cGFkckdQS3ZlUElBTllJR0FPbThWTDdXTUU3bWtNd0d3Z2I3ZWdxNDNO?=
 =?utf-8?B?VnYwK3hWc0QzSFFUOEtVczNTS3VqazB0MWtjZWJVODNQbTdscnYzYXZWemx0?=
 =?utf-8?B?OStybVpXL0NWcU9OV0d4MU55WjQraktmWkMySEl1UE13MmMya01kcXF5NDR5?=
 =?utf-8?B?YlJhQ25LeDdMcDJNRTVRVWsvZHVUYUJSdVpsK1ZPVGIzZW5nOGlCWTQ2TVNp?=
 =?utf-8?B?QnF1M3pxcUZoemRrOG91S0cwbHJoRG0rS1E0TGVLZHdUWExVMFh2Szhwdk5N?=
 =?utf-8?B?Y1l1NzFYbzFuM0Z4cXNmQjIwaVRaZlBCVURDOGFRTXkwMXFsbDlDNFdPZTZW?=
 =?utf-8?B?UzZSbThpdDd3OTZEaGFQUEpTSnlndk1veEpQU1V5WDJMSm4ybG1WL1JORWRT?=
 =?utf-8?B?UmhPT3VxeU0zWE11OUV2U2Y3ejlBazB1dm9zQkpJNDJYbWZRQ1FmN3oycWxQ?=
 =?utf-8?B?RG5hWmNMT2wvMmNIR3ljRFNSODEwYW9QOG96QzkxbWVhNmVEd3dINWZhZERP?=
 =?utf-8?B?bWMvOG41S2xGUEd6WUV6eTNFNnhndFlhd2U3VDMxN1ZpSjVLMDA1STltRnRk?=
 =?utf-8?B?bG1HeDFjbThGaXpwVWFHK3R3SDJRdHEyYzZQYWdJUDJobTRqZTBKbFVLUzVK?=
 =?utf-8?B?OFNoWWJoVGc5M1Bnek5oWFdrdFZGNE9MTUtQeC9UWTRmbVhDaWFnSCtTM1pN?=
 =?utf-8?B?cXBWdGNDZUQ5WTB6N21KcTB1OFhmRkNsMU9pS3BqRXlMTk5nT2NpZktDMGVV?=
 =?utf-8?B?WnRxMnA4TU9rbUQxZzhUdXRNb3hrNjlicG5WMW9zMm1rZ1g0MjJodTBWRHpR?=
 =?utf-8?Q?9++WrzfeKsju//KE4iRhuLU2V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB6596.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912efa3b-3191-46f7-985a-08dc3cddb31f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 06:30:06.9934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CZ/JAjQBE/CsDYlbjyCa5w6RxV+NVJltucDbQbGsRCGKVxB7isM4RHoq8Pt62k+vcEx8FPKCWovHw8blhiyzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5757
X-TM-AS-Product-Ver: SMEX-14.0.0.3197-9.1.2019-28232.001
X-TM-AS-Result: No-10--21.308200-8.000000
X-TMASE-MatchedRID: rYpa/RC+czH5ETspAEX/nk9jfX+0GeEdX/TIfElMGdQyJF124HtUeCC4
	f3FcrbWd9rHJ3YuprKIhTNhDSeukfYyjL6bKUmxdBzUoVrWHSOmJnltxZVUTwIRNexATNUui7Kt
	xDB+BA6nWrytXa/KYvUOoINXdCYonNXEtX9MPcIX6KF0S1zktZ7RCxp4o76RSK8Ly83vNygKdIg
	JJy+kP2UQWPp3x4wy2TVzat/9RbhMH/6C80lNK+o/LriVzPuf5u86I0octj5L6ItcnVxhDOLuBv
	FCPGLKKFda01+7oiCgKT0IlFQaIN8eVpsjSiioaHE2izCIy+zsNi5sB0+4vpwsPNAkPeS3QJ5ms
	2z7cIZh+bfno4KpyJMYR5SDOw+TfS98N8MeG8696ab/VNpF13Y8tzSG2ZPrfnH2XnP+tEESTB+8
	IMXWYGAPvKd0ZHhOUR15lS7jFBPhKGvLxFigsCiQ+nXi4KOlBeh8Ix+31S9DiNsdFBcakX8lnyb
	2p0pX1aaRC7zopueFXoQfguvM5UpnzZAu7Xu9tJPlTeUnhPwpTWTszr4TIglo7GmCOJYd1O50T9
	A74HCvgKP76fIb9PJRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.308200-8.000000
X-TMASE-Version: SMEX-14.0.0.3197-9.1.2019-28232.001
X-TM-SNTS-SMTP: E6E5CDC8CD6BC5DB1AD1F58FE19CBCF6EEF527A1545BC7ED11CEAA111F7B9C9C2000:8
X-OriginatorOrg: ASUS.com
X-Mailman-Approved-At: Wed, 06 Mar 2024 13:23:00 +1100
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
Cc: =?utf-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIEtyenlzenRvZiwNCg0KSSBoYXZlIGFscmVhZHkgZXhlY3V0ZWQNCiAtIGBnaXQgbG9nIC0t
b25lbGluZSAtLSBESVJFQ1RPUllfT1JfRklMRWANCiAtIGRvIHNjcmlwdHMvZ2V0X21haW50YWlu
ZXJzLnBsDQpJIHRyaWVkIGNvcnJlY3Rpbmcgc3ViamVjdCBwcmVmaXggYW5kIHJlc2VudCBvbiAy
LzIyLg0KQWNjb3JkaW5nIHRoaXMgZG9jdW1lbnQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L2RvY3MvYmxvYi9tYXN0ZXIva2VybmVsLWRldmVsb3BtZW50Lm1kLg0KIllvdSBzaG91bGQgZmVl
bCB3ZWxjb21lIHRvIGNjIHRoZSBPcGVuQk1DIGxpc3Qgd2hlbiBzZW5kaW5nIHVwc3RyZWFtLCBz
byBvdGhlciBrZXJuZWwgZGV2ZWxvcGVycyBjYW4gcHJvdmlkZSBpbnB1dCB3aGVyZSBhcHByb3By
aWF0ZS4iDQpTbywgSSBhbHNvIC1jYyB0byBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcuDQoNClRo
YW5rcyBmb3IgcmV2aWV3Lg0KDQpCZXN0IFJlZ2FyZHMNCktlbGx5DQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0K
U2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDEsIDIwMjQgNToyNCBQTQ0KVG86IEtlbGx5IEh1bmcg
PHBwaWdob3VzZUBnbWFpbC5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCkNjOiBLZWxs
eSBIdW5nKOa0quWYieiOiSkgPEtlbGx5X0h1bmdAYXN1cy5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIXSBBUk06IGR0czogYXNwZWVkOiBhc3VzOiBBZGQgQVNVUyBYNFRGIEJNQw0KDQpFeHRlcm5h
bCBlbWFpbCA6IEVuc3VyZSB5b3VyIGVtYWlsIGlzIHNlY3VyZSBiZWZvcmUgb3BlbmluZyBsaW5r
cyBhbmQgYXR0YWNobWVudHMuDQoNCk9uIDMwLzAxLzIwMjQgMTA6MDQsIEtlbGx5IEh1bmcgd3Jv
dGU6DQo+IFRoaXMgaW5pdGlhbCBkZXZpY2UtdHJlZSBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5IGNv
bmZpZ3VyYXRpb24gZm9yDQo+IGJhc2ljIEJNQyBmdW5jdGlvbmFsaXR5IGFuZCB3b3JrIG9uIEFT
VVMgWDRURiBwcm9kdWN0aW9uLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBLZWxseSBIdW5nIDxLZWxs
eV9IdW5nQGFzdXMuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCg0KSSBhc3N1bWUgdGhpcyBpcyBub3QgYSBzdWJtaXNzaW9uIHRvIG1haW5s
aW5lIExpbnV4IGtlcm5lbCB0aHVzIGl0IGlzIGZpbmUuDQoNCkhvd2V2ZXIgaWYgYnkgYW55IGNo
YW5jZSBpdCBpcyBzdWJtaXNzaW9uIHRvIG1haW5saW5lIExpbnV4IGtlcm5lbCwgdGhlbjoNCg0K
UGxlYXNlIHVzZSBzdWJqZWN0IHByZWZpeGVzIG1hdGNoaW5nIHRoZSBzdWJzeXN0ZW0uIFlvdSBj
YW4gZ2V0IHRoZW0gZm9yIGV4YW1wbGUgd2l0aCBgZ2l0IGxvZyAtLW9uZWxpbmUgLS0gRElSRUNU
T1JZX09SX0ZJTEVgIG9uIHRoZSBkaXJlY3RvcnkgeW91ciBwYXRjaCBpcyB0b3VjaGluZy4NCg0K
DQpQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIHRvIGdldCBhIGxpc3Qgb2Yg
bmVjZXNzYXJ5IHBlb3BsZSBhbmQgbGlzdHMgdG8gQ0MuIEl0IG1pZ2h0IGhhcHBlbiwgdGhhdCBj
b21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyIGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRhdGVkIGVu
dHJpZXMuIFRoZXJlZm9yZSBwbGVhc2UgYmUgc3VyZSB5b3UgYmFzZSB5b3VyIHBhdGNoZXMgb24g
cmVjZW50IExpbnV4IGtlcm5lbC4NCg0KVG9vbHMgbGlrZSBiNCBvciBzY3JpcHRzX2dldG1haW50
YWluZXIucGwgcHJvdmlkZSB5b3UgcHJvcGVyIGxpc3Qgb2YgcGVvcGxlLCBzbyBmaXggeW91ciB3
b3JrZmxvdy4gVG9vbHMgbWlnaHQgYWxzbyBmYWlsIGlmIHlvdSB3b3JrIG9uIHNvbWUgYW5jaWVu
dCB0cmVlIChkb24ndCwgdXNlIG1haW5saW5lKSwgd29yayBvbiBmb3JrIG9mIGtlcm5lbCAoZG9u
J3QsIHVzZQ0KbWFpbmxpbmUpIG9yIHlvdSBpZ25vcmUgc29tZSBtYWludGFpbmVycyAocmVhbGx5
IGRvbid0KS4gSnVzdCB1c2UgYjQgYW5kIGV2ZXJ5dGhpbmcgc2hvdWxkIGJlIGZpbmUsIGFsdGhv
dWdoIHJlbWVtYmVyIGFib3V0IGBiNCBwcmVwIC0tYXV0by10by1jY2AgaWYgeW91IGFkZGVkIG5l
dyBwYXRjaGVzIHRvIHRoZSBwYXRjaHNldC4NCg0KWW91IG1pc3NlZCBhdCBsZWFzdCBkZXZpY2V0
cmVlIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlzIHdvbid0IGJlIHRlc3RlZCBieSBhdXRvbWF0
ZWQgdG9vbGluZy4gUGVyZm9ybWluZyByZXZpZXcgb24gdW50ZXN0ZWQgY29kZSBtaWdodCBiZSBh
IHdhc3RlIG9mIHRpbWUsIHRodXMgSSB3aWxsIHNraXAgdGhpcyBwYXRjaCBlbnRpcmVseSB0aWxs
IHlvdSBmb2xsb3cgdGhlIHByb2Nlc3MgYWxsb3dpbmcgdGhlIHBhdGNoIHRvIGJlIHRlc3RlZC4N
Cg0KUGxlYXNlIGtpbmRseSByZXNlbmQgYW5kIGluY2x1ZGUgYWxsIG5lY2Vzc2FyeSBUby9DYyBl
bnRyaWVzLg0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YNCg0KDQo8cD48L3A+DQo9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIHRvIGl0IGNvbnRhaW4g
Y29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGFuZCBhcmUgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUg
dXNlIG9mIHRoZSBpbmRpdmlkdWFsIHRvIHdob20gaXQgaXMgYWRkcmVzc2VkLiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9yIHJlY2VpdmUgaXQgYWNjaWRlbnRhbGx5LCBw
bGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYnkgZS1tYWlsIGFuZCBkZWxldGUg
dGhlIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBmcm9tIHlvdXIgY29tcHV0ZXIgc3lzdGVt
LCBhbmQgZGVzdHJveSBhbGwgaGFyZCBjb3BpZXMuIFBsZWFzZSBiZSBhZHZpc2VkIHRoYXQgYW55
IHVuYXV0aG9yaXplZCBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmlidXRpb24gb3IgYW55IGFj
dGlvbiB0YWtlbiBvciBvbWl0dGVkIGluIHJlbGlhbmNlIG9uIHRoaXMsIGlzIGlsbGVnYWwgYW5k
IHByb2hpYml0ZWQuIEFueSB2aWV3cyBvciBvcGluaW9ucyBleHByZXNzZWQgYXJlIHNvbGVseSB0
aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBkbyBub3QgcmVwcmVzZW50IHRob3NlIG9mIEFTVVNUZUsu
DQoNCkZvciBwcmljaW5nIGluZm9ybWF0aW9uLCBBU1VTIGlzIG9ubHkgZW50aXRsZWQgdG8gc2V0
IGEgcmVjb21tZW5kYXRpb24gcmVzYWxlIHByaWNlLiBBbGwgY3VzdG9tZXJzIGFyZSBmcmVlIHRv
IHNldCB0aGVpciBvd24gcHJpY2UgYXMgdGhleSB3aXNoLg0KPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg==
