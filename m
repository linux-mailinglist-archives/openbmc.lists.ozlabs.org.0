Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DE72D87A
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 06:23:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=Selector header.b=VBkZI7Yr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgFmF6WJDz30Kg
	for <lists+openbmc@lfdr.de>; Tue, 13 Jun 2023 14:23:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=Selector header.b=VBkZI7Yr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lenovo.com (client-ip=67.219.247.3; helo=mail1.bemta33.messagelabs.com; envelope-from=zhangxf13@lenovo.com; receiver=lists.ozlabs.org)
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qfm4d4ycBz303W
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jun 2023 19:05:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
	s=Selector; t=1686560747; i=@lenovo.com;
	bh=1rNa4MIsSIteV3cOG60cWjz69sGk4dDmCmY/oVUCHZ4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=VBkZI7Yra82gOHMUt4kDc99TuZFltgBlA54TCRjIFnIHJARKcdruiliioJo4uUMpM
	 Z8IQsmaysey0dOV+4imqQInPwHfMTQ4y/nbEtfKBgmKErhuCgCvX/EymfLenl8Ts5h
	 iy4R5JYlAhcCbmDnLCWk8NL9882A1TIbYP/3Szr1c/fHxcGWi/JJ4shJs+wSPK8RBN
	 ZDbO/Ap6q3GcnnLxRedwRWNxcU5Ac/7fuJrYgSERAbl2RjJSCfeHT/QavU15+6QqPD
	 wM0G1VofR4ZGUtDOXXdY7wp8JdHzetpj7frWLW2jP4Ix68r6m3VM1X6BjXYhTtYi/F
	 rm/yuUxTQEX0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDJsWRWlGSWpSXmKPExsWSoS9VoPvqflu
  KwYn5YhanWl6wODB6nJ+xkDGAMYo1My8pvyKBNWPxyR72gqvSFT8Wb2FtYLwj2cXIxcEosJRZ
  YsaEUywQziJWic8LDkA5Gxglun99ZgRxhAQWMEks2XiZDcK5yyix4Pcdpi5GTg42AXWJpXu2M
  oPYIgKWEksetLOB2MIC7hIP5n1kg4j7SJxZcQWqRk/i5cWNQL0cHCwCqhLL3+aBmLwCsRILHm
  SCVDAKyEpMe3QfbDqzgLjErSfzwWwJAQGJJXvOM0PYohIvH/9jhagvkbj1cj0bRFxW4tL8bkY
  I217iw9nPYJskBHwlej+kQITlJFb1PmSBsOUlpi16zw5hy0g8uLEd7EMJgSWsEnPu9zJCOOtY
  JCbtWA811EBi3rcjUFV9ohK7X12BujRP4sTm2WCjeAUEJU7OfAK1QlpiwvxVULaWxLb3d6G+8
  ZV49nYC8wRG9VlIHp2FZNQsJKMg4loS8xp+Q9UoSkzpfsgOYWtKXJl8CMrWlli28DXzAkb2VY
  ymxalFZalFukZ6SUWZ6RkluYmZOXqJVbqJeqXFuqmJxSVAmcTyYr3U4mK94src5JwUvbzUkk2
  MwASVUuR4egfj4Z1/9Q4xSnIwKYnySt5qSxHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwSt4CSgn
  WJSanlqRlpkDTJYwaQkOHiURXrOFQGne4oLE3OLMdIjUKUZXjivb9u5l5lh5+AqQ3A0mr61fs
  I+ZY8WSqQeZhVjy8vNSpcR5p90DahYAac4ozYMbDUv0lxhlpYR5GRkYGIR4ClKLcjNLUOVfMY
  pzMCoJ87oD84YQT2ZeCdwFr4COYwI6ri68GeS4kkSElFQDU+9Ztpxzv1KnTfOdcLdS4n5g8gG
  dA2LmjPuX7a5b6ntWr9dh8V+HwFZ9jR8fp3k+bm6sEt84fYX7aebV9wV7JG43namP4pY+nx7d
  e7x56805WVsfWZ0R5KoRe6h5brrXg1WvjulU/vi6e27QJo/sJ5E11ba/8t19dnjbLomS3rZVU
  +z5T/WSq69KTS+t3Kh4/bzmlNyea42NPtbBJnJ8YUtCv1s++/rf6V/oTeuMFDPx70kiK51eTL
  a2W+osKzbBPPqf3eekVYaT87KiJUy+/3ix7c3ZSsunh1ZfU65OKnmeuLW/eU96c6GQ4Ll759a
  YNdWGe6vdO8u4a8mzZ3Mnzcn+Y/DF/OtyJpFPK7Z8maHEUpyRaKjFXFScCABcb/g+bwQAAA==
X-Env-Sender: zhangxf13@lenovo.com
X-Msg-Ref: server-16.tower-635.messagelabs.com!1686560744!289030!1
X-Originating-IP: [104.47.26.112]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14398 invoked from network); 12 Jun 2023 09:05:46 -0000
Received: from mail-sgaapc01lp2112.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.112)
  by server-16.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Jun 2023 09:05:46 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnNkyYVMnb/g17akpkwLijwGedBCgA3OkZcJSB9HUsMXaIPLE+hMivxwjzsuKP+QznNUXa7m9vJblaZEqYkDFDSVQcveRCfseLu8d3YaA3hBuvn4a8G3mzKBsl0m6FEJSt+cCrigOZwG0vaq7kGUJgy3oSNvybHdGbrFC71LII1Z+Lk/eNyzJQ5h/7K5qhXeCNl5OkOMiVBMjn9ZeHSrTYsuZkPW+n8XejBnN1AtxNTZ91YAqiS7XLJ7GlAY/qOkti5uhXi97sN2NLyzlyf1ldfd6wkpKJZ//KrE5ZCV5wMf8JbPU89J5DZmfL9ms2tRxGNq0Z/kwXzlKMJhdj2oZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rNa4MIsSIteV3cOG60cWjz69sGk4dDmCmY/oVUCHZ4=;
 b=LSmOyX6yw0my3WLQuBXhugT9TTF6HrWyJnIKVlco8Hc/Mhbgwho4QCf0e07n+rVb2bNdyl4TckKK7i8dzLrEfPbJlEf9IU6ZtPwJqm3sHMATKtfKspDayQHWHy0drExGyS8O7jCJD/2Lau25xNwHUcvQQYobX7nLXPC4DIoVeNg/EJusZuo4zmluhNJqj1nv8LIpGJDRgR2n981NQQ0Z8phyF9ou+OVBKVJL92yzBTdDaMmzAVWR5G7SfAU1xbzMn28ti7NiBho130O57s1t0MjfjbU9k47yVz3lAv16jmFUpHVEvDRaTcxhlj6PzMNm51VV01redyNMr87O4CdBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from TYZPR03MB7964.apcprd03.prod.outlook.com (2603:1096:400:44d::10)
 by SEYPR03MB6650.apcprd03.prod.outlook.com (2603:1096:101:82::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Mon, 12 Jun
 2023 09:05:42 +0000
Received: from TYZPR03MB7964.apcprd03.prod.outlook.com
 ([fe80::10b2:1407:23fc:62f]) by TYZPR03MB7964.apcprd03.prod.outlook.com
 ([fe80::10b2:1407:23fc:62f%7]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 09:05:42 +0000
From: Faye Zhang <zhangxf13@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [OpenBMC] would you shed some light for  RBC&bios-settings-mgr
Thread-Topic: [OpenBMC] would you shed some light for  RBC&bios-settings-mgr
Thread-Index: AdmdDAi2G32LFHYRS9KsEpNKFGebgw==
Date: Mon, 12 Jun 2023 09:05:42 +0000
Message-ID:  <TYZPR03MB7964C2D30164F5E24A33A5EAC254A@TYZPR03MB7964.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7964:EE_|SEYPR03MB6650:EE_
x-ms-office365-filtering-correlation-id: 422f5ad2-7246-40ab-501c-08db6b243333
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yzggAoEDkhFCLdaOoHEvWA7s/fpHC9bieM1Nmkn7MBqCX9QYIisYyRHkzUzqiFe94DKImEZZA9SVjv/NhxqZLOTcOXJzsmz9Z7w7XmZSckGTmHqC3j9Oey2lXLU0slzVJ15DNWKGe5FVXYgyJ2vCnPkLvlwJpORzxPkhpTcmKdHbIH8hO3HtKFerSwrKbmzALJplZ+7pt0/KQR8pwygJjdk7JivTv6LsdCSu/2Tvy29ieDqQq2UiwbPEOoD+JWeznAqVKWD6cLO9AAIkMJoS5RTN1fZwXzVYz1VnNyqBSpdIHXWI2MgrP8CbdorNDTis9b4pfDW+DJ/LF6hE6LxPScZbfQoJisV6MIIY0wp3xgfc42/9EDP3uNTW4hlTI3uxG5iX4Hf3nCLVtWPymEpMQHUq4vUnBECG9PsjzFyo3IJqwaChjwF+CE0VgtKM19CbkK2wUOKLYTnu/UChnDTMjD4tOiHgXS3iow60EcLnWHW8zGOHKqobALGbM9uj5Em5IlCah4vFzbqqAmsVlqkG4MbDuzKbrbnyNVs/U9Vxo8YprPNG+xwpZY22S0ZV7jN8kv+Egfx79IIVkBI93sKJ33caffTS+lqWiUY1tpdwQbLWdwV4SmP/+Xa4Zvermhue
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7964.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(7696005)(38100700002)(86362001)(38070700005)(82960400001)(558084003)(122000001)(33656002)(6506007)(9686003)(26005)(55016003)(186003)(66446008)(2906002)(5660300002)(52536014)(8676002)(8936002)(316002)(41300700001)(6916009)(66946007)(66556008)(9326002)(76116006)(66476007)(71200400001)(478600001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?gb2312?B?eGpETlBQckd6dTEwRlpxK1kxY0tEUytYakcwcERpYmE1b3BwUnJFdmMxL1Rv?=
 =?gb2312?B?MmplQ2V1TVUrZmMyQVQwWExBTy9KREJqTGJjSzdkSkMxVjNZdGx3Yk8rbS9i?=
 =?gb2312?B?aEdCajNxQWdrc3lFK3ovSzVGMmIwbWhRbmlVRnZVQ1VPRWxjVXlhRmJReC8r?=
 =?gb2312?B?UmdDZHRsRVNDSUdrb3VEZjZ0RCtQbnB1NDQvVnQ4bnR3NjB2NGRtNXpieDJC?=
 =?gb2312?B?V0hVeTBiYkFHcEF6bkJaVUp1M09WazY0TTN6WE9YbVJpc0h5UmMxK3N2NXU0?=
 =?gb2312?B?RWo0cmd1SVBra3VCTWUyS20yYmJNTTVvRVN1OVZhMTVMdWpDNzJhZk5WeGJG?=
 =?gb2312?B?OXFOWm8ycHlyelNoeGU4SU5DVzk5Wkw3OWNkcHZpQS9teTEwSzJjbnN1UEdu?=
 =?gb2312?B?MUk2RWZ6YitMTitDZStDR2JVUjRkMy9DY1BXcSszK1hweXlBRzcrS25CK2JW?=
 =?gb2312?B?bDNJT2VhSTB1dmlxOXh6RHFBeUZPR25lbnpENXNOeTJMMGdmMkdpNm9rekR6?=
 =?gb2312?B?SXVacCsxclplUEZHaHl4WXJIZVBlM0l4cU80cGpiTXZTZ0ZHVjQxaEJFWWc0?=
 =?gb2312?B?REhBSk1FcWswUGwycVUwQkhsZlBuZjl5bnZpNTlJaWQya0RtM3VQa3lHUWl5?=
 =?gb2312?B?QnNvaC9GdXdCVXlnK3gwYXdMV2taMUxydTBKbVc1SGlObG51bGdNbnVlZnJn?=
 =?gb2312?B?VlZVWFFibWZjMXEraXFZTW5zNlFxRmY1Q1RvNlZKMnIxZEhLYWN6b0Qxd2s2?=
 =?gb2312?B?RkduVm1ibURXN0RJNmgxWkd3NkEwMitQNDdkRTZ4Ymx3ZVNEa1hSSFN6VXQ5?=
 =?gb2312?B?dSs0VnFFeFVML2VhMHRQaXNMV0FUaGxUSHBzcW1Tbk95SHdPQ21IS2o3MUs1?=
 =?gb2312?B?SEVzeHU1ZHZ6cHBoMHRqNU8zL0JFMkU0akh2WU1Idmt6Y2E2YVVONEdWc21w?=
 =?gb2312?B?b0cwZlhsclpSSFpNVWNRYVQ1RWRzWWNuT1NnTC9hVFdmQlNvaDlING4zZGZ2?=
 =?gb2312?B?K3I2V3RFMDhlVmxYZW5EU3IxdVdvbEVKemRKZHRrdmUrbDBDdnBvOGo5YnAz?=
 =?gb2312?B?L1FzZFhpT0EzNHdMdXlMblYrd3Q2dG9xalZuQ2dXNUpQSWM3bGhQR3Bmb0tm?=
 =?gb2312?B?QmZ3NElHeTN2N202K3IzRTBnSEFzNTZwTkJrUXd0dmlySHArS0U1TXhob1NS?=
 =?gb2312?B?ajdsVkxBL09qTzZ0OUcwUWl2aTVFeUJTLzM4d0JQNVJkOG1MaTk5OFRGaExI?=
 =?gb2312?B?Qy83ZC92SWRoL2tXUk9xUVBPSmdDZFBPZzFkck1vdGI3Y3U1MEJuc1JRcDZ2?=
 =?gb2312?B?MkVUMzdPZzVqQXdhNXZ3SHNCbWZ5ZzZhZmRWZDR1Ty9Xb2FxVUFPZng5VkxD?=
 =?gb2312?B?OGlDQ2lER0I5QjhyeXEybEV0aFduNlpOUEpQdHYwZllVWHlEbjdOMUFrcEZk?=
 =?gb2312?B?MkF4amtrRGM1ZmVYOTdwbngyL0F2R3RiQjhHaVNad3dqWUJGRTNpM2IyR1gr?=
 =?gb2312?B?UmZiVTI5QXc3WlVJODRtOTVXNUN1VFNVdnplWmRZcnFOMGp4U2pmM2pVRVh6?=
 =?gb2312?B?TkJwSGhtQ1RpVGh1RTdBQ1JNdVhPTDFwR1RuNWtRYkx5dzhOQWlEVHZKYkJM?=
 =?gb2312?B?emFsNWxST25ITGlETy82bzJQOFFHN3k1MW5McEI4YjRYWWVzTVVxVWc0NFRy?=
 =?gb2312?B?ZTVZZW9SYXhraFlPS0hWY2FZdUhUMmsvdCsycmpRYW40Y1VFRy9odFg0eGhQ?=
 =?gb2312?B?MGxsMFBUVUdOYTRIeTRzWGxGaHhpR1dlWWE2TE1keVc3R1hwUGhWUDhYK0Vq?=
 =?gb2312?B?T0hlbDhGMHRpVThMRytKUmprV0x2SndYdWZVdUxac2JONHA5ekRFN09oVkli?=
 =?gb2312?B?TCtKSWlQQjRmd0NHMTN0LzJhKy8rSEw2MHJ6ZFhoMnJKcmdkamRBR0pyY2hB?=
 =?gb2312?B?YWVIakRaOVliOXlIOHlDdXlaSXBaWTNrQ3N2ODlWZmcvSlZLRXVlU2IyZDIr?=
 =?gb2312?B?NDBENVV6Q1JCdHRrTmMwUG94eWpMK0pTdWZWNS9xME9hVTY3b21ER1lMTlpD?=
 =?gb2312?B?NWRwZUNLVE8zcGRDOEJmbmFYYzBkUWQ5MVo1REpwU3AyKzNoSUcySjNIMTBG?=
 =?gb2312?Q?vARr2k3x+KsKZaNoiKym2hC89?=
Content-Type: multipart/alternative;
	boundary="_000_TYZPR03MB7964C2D30164F5E24A33A5EAC254ATYZPR03MB7964apcp_"
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7964.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422f5ad2-7246-40ab-501c-08db6b243333
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 09:05:42.4527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpuoSQQ+0dQuwYJFSMYthE6CET/WsMwTFQWvLHRi/uXC2a10GmAHyODTsDBQIg14lMsOSSOlshJOcCYmAfUNUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6650
X-Mailman-Approved-At: Tue, 13 Jun 2023 14:20:08 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYZPR03MB7964C2D30164F5E24A33A5EAC254ATYZPR03MB7964apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQogSSBhbSBsb29raW5nQCByZW1vdGUgYmlvcyBjb25maWd1cmF0aW9uIGFuZCBiaW9zLXNl
dHRpbmdzLW1nciwgd291bGQgeW91IG1pbmQgc2hhcmluZyBhbiBleGFtcGxlIG9mIHRoZSBmaWxl
IG9mIGJpb3NEYXRhLCBwbGVhc2U/IEkgZ3Vlc3MgaXQgd2lsbCBoZWxwIG1lIHVuZGVyc3RhbmQg
dGhpcyBwYXJ0IGVhc2llci4NCg0KVGhhbmtzLg0KDQpGYXllIFpoYW5nICjVxdDx7LOjqQ0KWEND
IEZpcm13YXJlIEVuZ2luZWVyDQpEQ0csIFNoYW5naGFpDQp6aGFuZ3hmMTNAbGVub3ZvLmNvbTxt
YWlsdG86emhhbmd4ZjEzQGxlbm92by5jb20+DQoNCg==

--_000_TYZPR03MB7964C2D30164F5E24A33A5EAC254ATYZPR03MB7964apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;I am looking@ remote bios configuration and bi=
os-settings-mgr, would you mind sharing an example of the file of biosData,=
 please? I guess it will help me understand this part easier.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;color:#44546A">Fa=
ye Zhang (</span></b><b><span lang=3D"ZH-CN" style=3D"font-size:10.0pt;font=
-family:=B5=C8=CF=DF;color:#44546A">=D5=C5=D0=F1=EC=B3=A3=A9</span></b><b><=
span style=3D"font-size:10.0pt;color:#44546A"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#44546A">XCC F=
irmware Engineer<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#44546A">DCG, =
Shanghai<o:p></o:p></span></p>
<p class=3D"MsoNormal"><u><span style=3D"font-size:10.0pt;color:#44546A"><a=
 href=3D"mailto:zhangxf13@lenovo.com"><span style=3D"color:#0563C1">zhangxf=
13@lenovo.com</span></a></span></u><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_TYZPR03MB7964C2D30164F5E24A33A5EAC254ATYZPR03MB7964apcp_--
