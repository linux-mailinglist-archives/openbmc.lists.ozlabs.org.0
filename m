Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901D792F2A2
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2024 01:33:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=jBzIouf4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKrdL243pz3dLW
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2024 09:33:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ami.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=jBzIouf4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=ami.com (client-ip=2a01:111:f403:200a::72d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=kirankumarb@ami.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072d.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKMbN1dmBz30Tp
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2024 14:45:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDF8SLFHmvvdjM8xt9PPxDi7Rv4T9AfhD9RSM1N327LFRREGHwhO0CPzxBb8Lotpw084bbWUF2CUs2bMVIOahhbDZNw7rbwcP7XI4v8vTCqlmjDkNb0Yv7y9hsdgRlzrYRvzhK9ex15oyUqJjai1sGk5yHIiug5whaM0EK0mxc86L4MnueYUc0YYZKtL4EF6ob30NSjPlTQrq3EvCQg+FOiIJ5W5Z/dCtN/b82cS90ZST1R4t8f/XlQ/g2aKi84uRMe88DgNI8O3OL1xjAvoPYG5x4GfITxtsYomUD6xpufvQ4jgGcY3KE46PL4PI0/XwTeYDaUlLk0FzcEGxzSSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvxQlQwJX6/VKIC7KSZkKLiEOUfeWTYwGaAiLbHl8QI=;
 b=Uc0EACUKvdAFkPdufMLY55dUxir5a+0CPKmUbpfHokfot0ioVn87NxvGEZ1uDbeOHZrjIvkYzDVBYnwIxnRumAcPttFNc9bCbvmmDj5VdrQ3SzrSwtlCagslERbCURmSrMZTdYRdocLJDLvdJ/5PjReKwp8e5FxrFELjFSowgWYEwmWsEbtc2lojk0WcD23j9IS0W+hb6qRBHzzT9NHVM5yS9EbzyQQpfrU9B2Dfagg0F+5nRDuvdKgjwWVQe4GjDlIbUQQwEB19Xq/JUEZ72MralmackUkx528j7egclI743U8ooT+Qjwn7TwVqetwcbAZ2sbenwupQAsOeJ+SEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvxQlQwJX6/VKIC7KSZkKLiEOUfeWTYwGaAiLbHl8QI=;
 b=jBzIouf4EHW64akq0vMukLeskMHjZLzeRiPC8VJ1R0/EBtWu5CNgZFD+UkXyzlh4j8HULksQLOuNkM6AeGhDO6VEgcje8VJ7RMWP5QtUinTSr5uKCqIS/hMhScY1iuYrRErCUzjxItIED4XOLS1fiKX718FY1zLg11XcW599Ax4=
Received: from BLAPR10MB5249.namprd10.prod.outlook.com (2603:10b6:208:327::24)
 by IA0PR10MB7624.namprd10.prod.outlook.com (2603:10b6:208:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Thu, 11 Jul
 2024 04:44:37 +0000
Received: from BLAPR10MB5249.namprd10.prod.outlook.com
 ([fe80::cfb9:8238:3489:5c3d]) by BLAPR10MB5249.namprd10.prod.outlook.com
 ([fe80::cfb9:8238:3489:5c3d%2]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 04:44:37 +0000
From: Kiran Kumar B <kirankumarb@ami.com>
To: Gunnar M <gunnar@gmills.xyz>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Ed Tanous <ed@tanous.net>, Patrick Williams
	<patrick@stwcx.xyz>
Subject: RE: [EXTERNAL] Re: Request for a new vue3 branch in webui-vue
Thread-Topic: [EXTERNAL] Re: Request for a new vue3 branch in webui-vue
Thread-Index:  AQHayBFZcga3haiUm0ue63a8gKtudbHal4WAgAADuoCAAAPDgIAALXiAgAqz/4CAC4efUA==
Date: Thu, 11 Jul 2024 04:44:37 +0000
Message-ID:  <BLAPR10MB52498B9570E76F33291FEC88ADA52@BLAPR10MB5249.namprd10.prod.outlook.com>
References: <1403524602.354586.1719434789488@privateemail.com>
 <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net>
 <CACWQX80A_TqXZ5QFyJcEqZZHhRf6ckAnLJJ74guz=SYV3+4gAA@mail.gmail.com>
 <ZnyR5Rw2Zx5I5elg@heinlein.vulture-banana.ts.net>
 <CACWQX81ThWsrObQ1Ob5WV_BX0i3MwtrvAMe2ocrRuOiLmpHeqw@mail.gmail.com>
 <71b057e4f5584cb3e7cc8a256a3019000a5c10af.camel@codeconstruct.com.au>
 <407562382.874833.1720038827793@privateemail.com>
In-Reply-To: <407562382.874833.1720038827793@privateemail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: gunnar@gmills.xyz
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BLAPR10MB5249:EE_|IA0PR10MB7624:EE_
x-ms-office365-filtering-correlation-id: 4fc43ce6-5739-49f5-c876-08dca1642b41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?OXQrMnhIODlxWUpWNVdHS3R5WmM4c1Q5Rnl0SEVOTE5GS20zVUdEbkNjRWtv?=
 =?utf-8?B?cmkyb2wyVVVJRGp1OHNjdEhuR2Z2V0RSaDZXTGgyUk1sdGxqWnQvNFUxYWt6?=
 =?utf-8?B?RVppSGh6S05UcDZMcDNZcERIN3ViaHVSZ2pJWHBRbTErWW12NFl1QVlHblo0?=
 =?utf-8?B?UlhqajNGOHNTOCs5WVZodmd4a3F3OC8xdDRLNEtZOUxrRjRsMlk2VWkzZU5K?=
 =?utf-8?B?MkNpL05PdEZPaEpkSTFUM2loYjVmKzNITnVEV2xxSXphKzR0UDRYWWsydjRJ?=
 =?utf-8?B?ZkQ4M1d2Uy9oQklDQWZpeGtoem92dUYwdDRrd3hqcjNNakV5RndBVEFQT25n?=
 =?utf-8?B?MjB2TFlVRDdLSWxiYnpaUm1NZExxcktyd1d3bERpQU10ZXROU0luSXVSMWFY?=
 =?utf-8?B?aVlFOFN2cmNyWHgvMVRMN1prb0dEcFRLd2ZWTlZuYjI2aE9jZUFxNzdBdW9S?=
 =?utf-8?B?V1dycTkwSFhWM1l1S1R2Ym5oUmRRYkRCVDU0RGdEWENpOGN3M1F0SVMyS1Zw?=
 =?utf-8?B?RGlTOTRJMUVUeEJ5Q1Y0aUpjNnVpQWVaNUp4SjB3Q3E4S2dnenRDT29jVkhx?=
 =?utf-8?B?SUh1dVVWR21NNDBFNkpjWGpjbUZSUkJJSHYxbkhlamYzYXlZRThzRURqRGg0?=
 =?utf-8?B?b2dUZWJBazU2aERaTEhrMWZNMS9NdGk4emRpUzc5YkVERnVjQThDdysrVDJI?=
 =?utf-8?B?QkFLMUhVejJtdW1oUmhzeFR5djR6MGJhSFdYZlR1QkR6aGp0TDNRQXNET2hh?=
 =?utf-8?B?SUR5cnNLdnFhR1dwcmhRMVlCcjgwcVB5a2xlV1h5b284YU5GMkRHbHFxYlM4?=
 =?utf-8?B?YW1iQVlvY3BQMEFqTHkzRWZoNSt0WlRtaWdpMTl4aWFDNHM5YTVBYjBYLzEx?=
 =?utf-8?B?NktwMXU0ZVppWXFpcFg3ZUU0UElqWjJzV2E3R1hGS3F6Y01BZXkzcUZzci9y?=
 =?utf-8?B?N1UreHRFa2tFS3R0SFVjYU5GU1FWdGhRUFpNRDBrb0ZsWE51WnRVR3NkRm5t?=
 =?utf-8?B?TkxPTzZkQndLQ1l6NGV1aTRHbERTZHUvZXMzTGN0dWNmTG02U0YyT1hZazhx?=
 =?utf-8?B?K3ZWMkUweWMvR29GczVnVFJLSUR1YitncVFoMTNua0VHcllSRE1yMGJWelhE?=
 =?utf-8?B?TGtxYUF5RW1CRUYyTjFpNXVUOGNhUWNvM1FCS3kvUyttQU96UGVxZmpNUW5Q?=
 =?utf-8?B?bVpZZk5PUGZ1S0VYcCtvUjlsTW1NUy9uYWNXTlRuSVE3bk9KdTJmY2ptT01F?=
 =?utf-8?B?UVA2bVZEQ28wcG9KbkR2Q0NnenQxempaUUxIa2JaeVcyWFh1V1FaQjE5UGY5?=
 =?utf-8?B?RE5rQjh1T3c0S0hoc1pRaXE0TFFicmZ2VklUeUFHQUtvYU45WmUyaGEvd09M?=
 =?utf-8?B?OFdjMGZVeno5M1ZHVHNDTDk5Nm9kWVBjRXdrQmZIaVo0TmtiOForMGlLaTdW?=
 =?utf-8?B?Q3ovbXZ6a3prVEd5VjBiVThucFNlMExwYWYxdWhjOGh4dXBYV3Z2T0ZGVDBw?=
 =?utf-8?B?L2J2K2pTdjlEak5EVytDMldPOW4zZ1UxWllBUkVXUldteHg1dzJsbU9FUHJJ?=
 =?utf-8?B?WVpIQkRETzh4OC9zMk9NOFNBY3d4WmtRTEQ4MkN5cmt5bHYyQVIrYll1ZWJM?=
 =?utf-8?B?dCtuWno3VnFXYXlPZ2NPNzRENWZiLzRvbDVLMytIM0pTVThQR05OandQZXRV?=
 =?utf-8?B?M0s5N1dtNUg4MmNBUWZ1YklwWTVFSWoxbFlEamo1czVha0pxeFliVGV2Ym93?=
 =?utf-8?B?aC91SVpKWkxZSThnKzZUOStMMEVSZk9YSVh5VkFBc3hEMkxnSnJUZW9wL1Vy?=
 =?utf-8?B?NDJpR080SUJzN25xdUhlN3lYTGxrMWd4d0N6NzRyUFRBQ2YyQklvMEd1Y2hM?=
 =?utf-8?B?WDlKRVNQcHBaVU1SRGFEc2VMcUUwR0lvOERqem5kK25uc3c9PQ==?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5249.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bVRnd00xU1dGR1F4TVAyd2hDVVpMTXVLL1ZXU09WL0swRVBGVVU1UzFlTU50?=
 =?utf-8?B?T1htWmpsN0VKVnhQTVNOZ09rT3Q0ZUJpQlAxREpQUXF0ekhuWlo5ZFJsZW5z?=
 =?utf-8?B?eHZpVVpCcWdEUE5KZjRPZU03aHRCL1Uvc2MrVjh2NEwvMklERWRYTElHMUlH?=
 =?utf-8?B?dnM5WGJqSmlYckxjRmJRV2lWMFZjdFZlcVprbjc3VEdUWUorQm1wcEZxRzZ0?=
 =?utf-8?B?b2xjT0dtYUdqMWpjcHpZZXVqZlEwZll0MExRdGpteTIrbU4vZU9ONnp6N0lW?=
 =?utf-8?B?UDlBNTQweDI3Mit2bzJibkR5NGxKRENVTzFjWkRBdng0emdPbnVVVkxCYXNw?=
 =?utf-8?B?cFEwKzlneTYrSFlUdisrM2pQcm1LZ3RNZGhkd1VNT0tVSnN6TmdWNFdadnBL?=
 =?utf-8?B?b3F5NUFSZXA5WVFOYzM1UVlXZitib2lGMnJJVStqc3hOeFd6R2VIdyttYlQ0?=
 =?utf-8?B?TWJuc1k3SXlDWjFkNFdaVUlETzY3R1BvKzlKeFQ5Y0dmZUVNU08va2prYnZi?=
 =?utf-8?B?RWJoTTQwZ3grNzQ5ZHI5Tk1PN2VzZ3lwWm0yRHBmbDZhcG84NGV2ank2Q0Nt?=
 =?utf-8?B?Zk9kRUJveVU0ckhXWFdqQ0FTbisvSkVyZXBNVWszbkk4WnpZWjlPa3c2cERV?=
 =?utf-8?B?VHYvNHMvS2trYXJaSTlGaWxhdGVNd0QveGNPMmZ2ZUp1S0dXQ1czS2t2c3dX?=
 =?utf-8?B?TEYrMXY4OFY4N1hCYkhSOTk2Zlkvb1FCamRUTW50YjgvYVlXbWV6K2NtRCtL?=
 =?utf-8?B?anc1Y2ZSK1pMYWhEK3RFeEdtbUQvUW4zb01wbXJRZ2NVYnFPSzJyUzlhS2kw?=
 =?utf-8?B?MHByQjZSTU1pS0FzQUp4RWdOQ2Q1SVQ4a1A1ODZ6ZUpyTFF1QTFkRW0wQkc0?=
 =?utf-8?B?RkRXU3lSYTlDNFZiRzQ0OFUwb0NoVUNwOTEremVPYkV6VkdJT0lhVFFIYkxB?=
 =?utf-8?B?cmVZUFptb0FpSzcwdWRGamxFWEZHSUoxendneFVMYWJMaWI3NUtXc25qRWZa?=
 =?utf-8?B?WEtjUWpTcWpPbEM0anc4WEM2a2xhMGRhUlRYRzhwWksrRmtLdE9mRXMyZnVn?=
 =?utf-8?B?U3R0MmhyUU8wdkVEazN5aE1VR1ZPbTVWMWZ3d2NzU05uSjc1OVo0bjVpWFJY?=
 =?utf-8?B?dGsrZDVwWEdENDFKMjRXZXdYbGFmaEJna0UxaWRvQmlPWmFITjRQT3lQV2w4?=
 =?utf-8?B?V29BYWhRTGs2RzBiN28remI1ZW9ZeThGTWdOSmlxWlBEMGtJNFk5QnhVdTJK?=
 =?utf-8?B?YzVtaWdRYW9hMEFHV1BYcHROVkp1amE1cFFhSmhuL3ViKzdEZ090T3pRbEtQ?=
 =?utf-8?B?TkdRbG5Kcm9PYUZGM0VTVXpXYTJ1MkdQSFp3RTRqWmcvSGJvMk44RGxBdU51?=
 =?utf-8?B?YTRZQUI5MUlwUnFiR0RhYVpTUXgvU0pnbGc3WUZpdHpVY3pvR25ibTFHYnJJ?=
 =?utf-8?B?ZDFkVXA2K3NxUys4WTBiMHN5cnVpcXdUaWFCT2lEeElFWXA4dHZnbGN0b3Q5?=
 =?utf-8?B?bWZwZkJqalpHTEVpSWFvVC9mMkdCajZORit6eDM5VXZ1R2JjeUJWK1R5ZDJS?=
 =?utf-8?B?b1JNSEF0aXMrdlNlSmNDTSs3bWlrdERPWHIyd1hCN1prcXRMZ3plUjRwODlY?=
 =?utf-8?B?RFRSbTBEbGE2VkwweGE4SjV2eTJZWlViWUh5ZUxna2I2ZG9nVlduZGxTSzh3?=
 =?utf-8?B?V1dCTHhIZEhJYmhzSFNMeGtPdmFBRGlCa0czVjhOOHZhd21NM01wVG8wVjl6?=
 =?utf-8?B?WGhWNmU2ZVF3b0p6Tmp0OHUyTW5GNlFsMEw4OHVOSXhmQ3kvMFVXcWhBRnRs?=
 =?utf-8?B?czhuQldsZWU3WGtPVWhzVFN5eDEzeWdDZUlsem0vaDBSKzlkQ0kvRG9aTDhJ?=
 =?utf-8?B?SmtxcjlVQ3pLU3dGV2R5SHNaeWJHTk5ZSGpxMnhuUzBKbno3YWNGVmlJMGNK?=
 =?utf-8?B?K2ZOU0JtTzIwNHV4ZHhqclBIRGlkcHMvdXMvV3drMWQvNGpLRU9ySEM0TEsx?=
 =?utf-8?B?TjhFYkdadksvejg2clFKMDhmd095MnVacnR1RFQ3SEw4K09oTVdrUHk2TTM5?=
 =?utf-8?B?aENkSnFhME55ZXZzMVBiTW5WQ0FtckdpaEtqYzBUR3RLbDVuSlhzUVRvUHQw?=
 =?utf-8?Q?KMIU23AfPEcHaICosJoc3OpPs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5249.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc43ce6-5739-49f5-c876-08dca1642b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 04:44:37.3961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0aNZmM/hDosRr48Tz0JICkM3+AXTPb0d7pezviVoPv0f5zVI7txjv4vQ61fTlz/pvPaCsTSae6LTt9jsZRMjjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7624
X-Mailman-Approved-At: Fri, 12 Jul 2024 09:32:59 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, Sivaprabu G <sivaprabug@ami.com>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KDQpBZ3JlZSBvbiBsYXRlc3QgQEd1bm5hciBNIGNvbW1lbnRzLiBTbyBzaGFsbCB3
ZSBwcm9jZXNzIHZ1ZTMgYnJhbmNoIGNyZWF0aW9uIGZ1cnRoZXIgaWYgbm8gb3RoZXIgY29uY2Vy
bnMuDQoNClJlZ2FyZHMsDQpLaXJhbi4NCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBHdW5uYXIgTSA8Z3VubmFyQGdtaWxscy54eXo+DQpTZW50OiBUaHVyc2RheSwgSnVseSA0LCAy
MDI0IDI6MDQgQU0NClRvOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29t
LmF1PjsgRWQgVGFub3VzIDxlZEB0YW5vdXMubmV0PjsgUGF0cmljayBXaWxsaWFtcyA8cGF0cmlj
a0BzdHdjeC54eXo+DQpDYzogS2lyYW4gS3VtYXIgQiA8a2lyYW5rdW1hcmJAYW1pLmNvbT47IG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgYS5uaWtoaWxAaWJtLmNvbTsgUmVudWthLlNoYXJhbnlh
LlB1bmRsYUBpYm0uY29tOyBTaXZhcHJhYnUgRyA8c2l2YXByYWJ1Z0BhbWkuY29tPg0KU3ViamVj
dDogW0VYVEVSTkFMXSBSZTogUmVxdWVzdCBmb3IgYSBuZXcgdnVlMyBicmFuY2ggaW4gd2VidWkt
dnVlDQoNCg0KKipDQVVUSU9OOiBUaGUgZS1tYWlsIGJlbG93IGlzIGZyb20gYW4gZXh0ZXJuYWwg
c291cmNlLiBQbGVhc2UgZXhlcmNpc2UgY2F1dGlvbiBiZWZvcmUgb3BlbmluZyBhdHRhY2htZW50
cywgY2xpY2tpbmcgbGlua3MsIG9yIGZvbGxvd2luZyBndWlkYW5jZS4qKg0KDQo+IE9uIDA2LzI2
LzIwMjQgNzowNiBQTSBNRFQgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bjb2RlY29uc3RydWN0LmNv
bS5hdT4gd3JvdGU6DQo+DQo+DQo+IE9uIFdlZCwgMjAyNC0wNi0yNiBhdCAxNToyNCAtMDcwMCwg
RWQgVGFub3VzIHdyb3RlOg0KPiA+IE9uIFdlZCwgSnVuIDI2LCAyMDI0IGF0IDM6MTDigK9QTSBQ
YXRyaWNrIFdpbGxpYW1zIDxwYXRyaWNrQHN0d2N4Lnh5ej4gd3JvdGU6DQo+ID4gPg0KPiA+ID4g
T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgMDI6NTc6MjVQTSAtMDcwMCwgRWQgVGFub3VzIHdyb3Rl
Og0KPiA+ID4gPiBPbiBXZWQsIEp1biAyNiwgMjAyNCBhdCAyOjQw4oCvUE0gUGF0cmljayBXaWxs
aWFtcyA8cGF0cmlja0BzdHdjeC54eXo+IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24g
V2VkLCBKdW4gMjYsIDIwMjQgYXQgMDI6NDY6MjlQTSAtMDYwMCwgR3VubmFyIE0gd3JvdGU6DQo+
ID4gPiA+ID4gPiBLaXJhbiBhbmQgaGlzIHRlYW0gaGF2ZSB2b2x1bnRlZXJlZCB0byBzeW5jIHBh
dGNoZXMgbWVyZ2VkIHRvIG1hc3RlciB0byB0aGlzIG5ldyAndnVlMycgYnJhbmNoIGJpLXdlZWts
eS4gVGhhbmsgeW91LCBLaXJhbiEgV2hlbiB0aGUgbWlncmF0aW9uIHRvIFZ1ZSAzIGlzIGNvbXBs
ZXRlLCBhbmQgYWxsIGNvbW1pdHMgYXJlIHN5bmNlZCBvdmVyLCB0aGlzICd2dWUzJyBicmFuY2gg
d2lsbCBiZWNvbWUgdGhlICdtYXN0ZXInIGJyYW5jaC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdl
IG5lZWQgdG8gYmUgY2FyZWZ1bCBhYm91dCBob3cgd2UgZG8gdGhpcy4gIFlvdSBkb24ndCB3YW50
IGl0DQo+ID4gPiA+ID4gdG8gYXBwZWFyIG9uIGdpdGh1YiBhcyBhIHJld3JpdGUgb2YgdGhlICJt
YXN0ZXIiIGJyYW5jaCBhbmQgd2UNCj4gPiA+ID4gPiBhYnNvbHV0ZWx5IG5lZWQgdG8gYXQgbGVh
c3Qga2VlcCB0aGUgdnVlMiBjb2RlIGluIHNvbWUgYnJhbmNoDQo+ID4gPiA+ID4gc28gdGhhdCBp
dCBkb2Vzbid0IGdldCBwcnVuZWQgZnJvbSB0aGUgZ2l0aHViIGhpc3RvcnkuICBJZiB3ZQ0KPiA+
ID4gPiA+IGRvbid0IGRvIHRoaXMsIGl0IHdpbGwgYmVjb21lIGltcG9zc2libGUgZm9yIHBlb3Bs
ZSB0byBidWlsZCBvbGRlciBPcGVuQk1DIHJlbGVhc2VzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
SSB3b3VsZCBzdWdnZXN0IGVpdGhlcjoNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAgICBhLiBXZSBk
byB0aGUgb3Bwb3NpdGU6IGNyZWF0ZSBhICd2dWUyJyBicmFuY2ggYW5kIHVwZGF0ZSB0aGUgcmVj
aXBlDQo+ID4gPiA+ID4gICAgICAgIHRvIHBvaW50IGF0IGl0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gICAgIGIuIFdlIHVzZSB0aGlzIGFzIGFuIG9wcG9ydHVuaXR5IHRvIG1pZ3JhdGUgZnJvbSAn
bWFzdGVyJyB0byAnbWFpbicNCj4gPiA+ID4gPiAgICAgICAgYW5kIHVzZSAnbWFpbicgYXMgdGhl
IHZ1ZTMgYnJhbmNoLg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBNeSBleHBlY3RhdGlvbiB3
YXMgdGhhdCB0aGlzIGJyYW5jaCBjb250aW51ZXMgdG8gcmViYXNlIGluDQo+ID4gPiA+IHBhdGNo
ZXMsIGFuZCBvbmNlIHJlYWR5IHRvIG1lcmdlLCB3ZSB3b3VsZCBqdXN0IHJlYmFzZSB0aGUNCj4g
PiA+ID4gc2VyaWVzIG9uIHRvcCBvZiBtYXN0ZXIgYmVmb3JlIHB1c2hpbmcgaXQgc28gdGhlcmUn
cyBubw0KPiA+ID4gPiBkaXNjb250aW51aXR5LCBubyBtZXJnZSBjb21taXQsIGFuZCBhdXRvYnVt
cCB3b3VsZCBqdXN0IHBpY2sgaXQgdXAuDQo+ID4gPg0KPiA+ID4gV2Ugd291bGQgaGF2ZSB0byBn
aXZlICJLaXJhbiBhbmQgaGlzIHRlYW0iIHBlcm1pc3Npb25zIGluIEdlcnJpdA0KPiA+ID4gdG8g
Zm9yY2UtcHVzaCB0byB0aGUgInZ1ZTMiIGJyYW5jaCBpbiBvcmRlciB0byBmYWNpbGl0YXRlIHRo
ZXNlIHJlYmFzZXMuDQo+ID4NCj4gPiBTb3JyeSwgSSBzaG91bGQndmUgc2FpZCAiTXkgZXhwZWN0
YXRpb24gd2FzIHRoYXQgdGhpcyBicmFuY2gNCj4gPiBjb250aW51ZXMgdG8gY2hlcnJ5LXBpY2sg
aW4gcGF0Y2hlcyINCj4gPg0KPiA+IFRoZXJlJ2Qgb25seSBiZSBvbmUgcmViYXNlIGFuZCBwdXNo
IChub3QgZm9yY2UgSSB0aGluaz8pLCByaWdodCBhdA0KPiA+IHRoZSBlbmQsDQo+DQo+IFlvdSBk
b24ndCBoYXZlIHRvIHJlYmFzZSBlaXRoZXIuIEFub3RoZXIgb3B0aW9uIGlzIHRvIHVzZSBgZ2l0
IG1lcmdlDQo+IC1zIG91cnNgIHRvIGpvaW4gdGhlIGJyYW5jaCBoaXN0b3JpZXMgYnV0IHNldCB0
aGUgdHJlZSBzdGF0ZSBpbiBmYXZvdXINCj4gb2Ygb25lIHNpZGUuDQo+DQoNCkRvZXMgYGdpdCBt
ZXJnZSAtcyBvdXJzYCB3b3JrPyBBbmQgdGhlbiBnbyB3aXRoIGEgbmV3IGB2dWUzYCBicmFuY2g/
DQoNCklmIG5vdCwgSSBhbSBva2F5IHdpdGggdXNpbmcgdGhpcyBhcyBhbiBvcHBvcnR1bml0eSB0
byBtaWdyYXRlIGZyb20gJ21hc3RlcicgdG8gJ21haW4nLiBJdCBpcyBqdXN0IGEgYml0IHVuZXhw
ZWN0ZWQuIElmIHdlIGdvIHRoYXQgcm91dGUsIHdlIGNhbiBhZGQgc29tZSB0ZW1wb3JhcnkgZG9j
dW1lbnRhdGlvbi4NCg0KSSB3YXMgdGhpbmtpbmcgS2lyYW4gYW5kIHRlYW0gd291bGQgY2hlcnJ5
LXBpY2sgcGF0Y2hlcyBtZXJnZWQgdG8gJ21hc3RlcicgYW5kIHB1c2ggdGhlbSB0byB0aGUgJ3Z1
ZTMnIGJyYW5jaCwgbGVhdmluZyB0aGUgb3JpZ2luYWwgYXV0aG9yJ3Mgc2lnbmVkLW9mZiwgZXRj
LiBJIHdhc24ndCB0aGlua2luZyBhbnkgc3BlY2lhbCBwZXJtaXNzaW9ucyB3b3VsZCBiZSBuZWVk
ZWQgdW50aWwgIm1lcmdpbmciIHRoZSBicmFuY2hlcyBhdCB0aGUgZW5kLg0KDQpUaGFua3MsDQpH
dW5uYXINCi1UaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUg
Y29uZmlkZW50aWFsIGFuZCBwcm9wcmlldGFyeSB0byBBbWVyaWNhbiBNZWdhdHJlbmRzIChBTUkp
LiBUaGlzIGNvbW11bmljYXRpb24gaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBp
bmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCBvciBieSB0aGVpciBk
ZXNpZ25lZS4gSWYgdGhlIHJlYWRlciBvZiB0aGlzIG1lc3NhZ2UgaXMgbm90IHRoZSBpbnRlbmRl
ZCByZWNpcGllbnQsIHlvdSBhcmUgb24gbm90aWNlIHRoYXQgYW55IGRpc3RyaWJ1dGlvbiBvZiB0
aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBQbGVhc2Ug
cHJvbXB0bHkgbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHkgZS1tYWlsIG9yIGJ5IHRlbGVwaG9u
ZSBhdCA3NzAtMjQ2LTg2MDAsIGFuZCB0aGVuIGRlbGV0ZSBvciBkZXN0cm95IGFsbCBjb3BpZXMg
b2YgdGhlIHRyYW5zbWlzc2lvbi4NCg==
