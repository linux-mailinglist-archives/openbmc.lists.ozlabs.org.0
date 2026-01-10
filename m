Return-Path: <openbmc+bounces-1145-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F42D0CF24
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 05:36:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp5SN4bqJz2xRv;
	Sat, 10 Jan 2026 15:36:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.61.92 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768019780;
	cv=pass; b=Adp4uFRjAwrKX91wx1UC1OHgJezT9+2jaO4wqII3c18oPcMRktAHB1h0QiY0SpmvyT/o6dNCCq6IhmVupPFU92wMiU4aeov1imXEYozzo90ScRsAqBKqTbB5TjEwzN2Jdt75mim4B7o/Gmfk9SDD5wYC63gllPml0EGFq7dMet1ffPC1NRb2LNzn/a15iNY2sWYQ3KUngD+uRuWOSiCbgItKH+wy5whBHeDhQFH2qOBvvYW25beQUP1x15TWVMDEkQj77ne8qW27je5tXVQNDxbjTQbQxSIqVf/DwizjKZCPjrFuxQh3NkP2EMbfeKSqbmnaSgkwAlq+UrpLTSkCzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768019780; c=relaxed/relaxed;
	bh=yPbFR4ItqwAhXoZBLo2Vo9XoTRj/qJY/2kBiOFcTQZg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DGc3tPdm7ig5ge87/GQIQ4jXpkGuQB8YMpWiI2npjqY5sM0/HEkjlGVlOlDSSR523dFBtgBIIToVjEHRJbGcRh/TKqiVJJx9+vVJGMcPtnBaCMdDAu4NgC8h1+WEF4XBgXOH+La8YuRY5tOYeR/k/3gCPH0pjpXURovDvgKIKRWCRBcl/+KsG/ZLLMFCU8ZE/AGipkXxMjZdE4CgX5VLhbndLyaqM/NmlH0fubf+pxun7nEEU602poFiVFhH7O0Q5vdDvnMbKBBPg+a8CJjeUW7UAIArGBUUY2EWB0+W+KCWH1K0mK8exzYCcDethB3fTDAbtX4HPNB8O1qfnn33fQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ami.com; dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=cEHWF4Jw; dkim-atps=neutral; spf=pass (client-ip=52.101.61.92; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=hariharanr@ami.com; receiver=lists.ozlabs.org) smtp.mailfrom=ami.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ami.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=cEHWF4Jw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ami.com (client-ip=52.101.61.92; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=hariharanr@ami.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020092.outbound.protection.outlook.com [52.101.61.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dp5SL5Xgdz2x9W
	for <openbmc@lists.ozlabs.org>; Sat, 10 Jan 2026 15:36:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6vE9MTCArLL2uKJdTzWeDkJ5Tccwru4lVElAJFiAy5xKOh6xOdO2eFrjmlEOde+s0SRgrmUpWmgYiKrrRKSfrUSOcKWsIJTNl9V0MAr97p9u1jSNJbfTp41UlPK/+UOoOno7alIqsc2k9tUUGO5rFMUh4OZnpTBstLkzyfvzd3avhCHMrIBUHXXQEN2hbvh4/z8Klcy3P5ihJSFQkVwvd3uw+seNPkvsKZbmccs6JXscNMRVYS1xNOy25tQ/2IrXo+LSZDn5TGBtS5/xqQwkpFBHgXx+iA1VnipUD88cEn00a6VB8qviBMvrdPFz5AcIDlcREXtzTthVV3062sIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPbFR4ItqwAhXoZBLo2Vo9XoTRj/qJY/2kBiOFcTQZg=;
 b=ykoxmUUONtNWB8XEgDkhp8IOqAaxbb8OpimD8m8Ut+OgEiOgU/5Ow8Sn5yzkraDGlqGvjxClXMWIhcIwnNvUsXvzlIBV2VR8WyJ+hlDCsGIk+LC9XcigK6peEAlgGrgvVGGZGQI/SAclVDJaAIfCpE608NYDqxh9x//ePxUzifzzFj5rGaKh0XLTiMWkgVRJPHAy0tTko9DNQqYb757+0BXapfwoSvka2ddtmGy+YlKkoYPat8WgIrn6T3aEwnpBNpVqW+vL5+GCT2WqsDxdzN9N1DM7Wz9IHXMu3OgMwBqX2YMfyEkAUh+QzWZtfTRMRy8zu5SJ48gCeKKwEf+V2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPbFR4ItqwAhXoZBLo2Vo9XoTRj/qJY/2kBiOFcTQZg=;
 b=cEHWF4JwkLbILz1TjStoBE3dAb/zQghZMP9n/eQoXNbwxPqFC2CQLBkxrXRi4gQ/I1qtCyPJZ3Fz4zchwD7xYdnMl+YLAIKeA7fx/pf0yFu4+hF35fQaL4YZsnTrM71B0U5cXO4Eg+c5K/1VMzdm3tSq1FgcIiakLogle/WI70g=
Received: from DS7PR10MB5198.namprd10.prod.outlook.com (2603:10b6:5:3a5::24)
 by DM4PR10MB6013.namprd10.prod.outlook.com (2603:10b6:8:ae::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Sat, 10 Jan 2026 04:35:34 +0000
Received: from DS7PR10MB5198.namprd10.prod.outlook.com
 ([fe80::3611:9138:7bdf:d295]) by DS7PR10MB5198.namprd10.prod.outlook.com
 ([fe80::3611:9138:7bdf:d295%2]) with mapi id 15.20.9499.002; Sat, 10 Jan 2026
 04:35:34 +0000
From: Hariharan R <hariharanr@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Support for Asus IPMI Card
Thread-Topic: Re: Support for Asus IPMI Card
Thread-Index: AdyB6luZbYZ6Ky6ATmqB3bHLoUVEgw==
Date: Sat, 10 Jan 2026 04:35:33 +0000
Message-ID:
 <DS7PR10MB51981EA949466CDD198C03A0C483A@DS7PR10MB5198.namprd10.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5198:EE_|DM4PR10MB6013:EE_
x-ms-office365-filtering-correlation-id: 3bd9bae6-9a34-4f49-1847-08de5001b1c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|13003099007|8096899003|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VOjuvgttE/8zwB7vs/bo01aSwcihYcT8uft5XOXkNWIQjgwT2BIUHjOe90tT?=
 =?us-ascii?Q?/Gl33HLv1FHlgqjrBplsKNCwxgRiAREbApaYAssFKmCO8exIJ7caZ3+JFaR7?=
 =?us-ascii?Q?ryZCWnzqVG/4TmWKK0ytTgW9Xj+BPnXJdRJHMZg3ngSDdTRR6xJ1JXu6fxK2?=
 =?us-ascii?Q?WXtav9aEloAkcCQ19vkbti78CP69WA1jeMD5Sh2o1/HveWu/XrqwB8z6t9Fb?=
 =?us-ascii?Q?fiZN6dRwkq38fBxwByfjwZywCxnduKNuogyooy0XXwOQ6cNKQtAsyqSNBfWv?=
 =?us-ascii?Q?g3kYbRfiU6+4rNEfhzVhmFwYOfSMKMZbVYxw7/+OoUNdTo8FFyd7vMkHM2y0?=
 =?us-ascii?Q?lEOeYm3fRRnRlh9BLyD09bM1ocs2GZ/RPzc1eOTQHBxj1R/fFYv49yYyW/hJ?=
 =?us-ascii?Q?DYwA7f1qDtLIAmew37BwH6OotkSAtb53CUDEsOzogrAq/aPVpTdPjgpOA/Io?=
 =?us-ascii?Q?f6WJs4PvF2RMTJ2cQjtQJAFuMtY2mgiNrAIPOGx30vU3Tr4X8Tg8CoO0Diu2?=
 =?us-ascii?Q?k0S9Z+sfKoWDygwaV5Pn2VtJu//WVBTDKzwMpbEmOauzmIf1eFhCcI2smUYF?=
 =?us-ascii?Q?5akYGyoe/YX60ZtIIV77/UtR1kfdmFQAxadaP26GDXVn7pL/Fn7Opx2AZAMJ?=
 =?us-ascii?Q?m8UVdEh0Rxq/0oZA3vgSnTazHjwN2htje9hieji6N4m6bY90rQ/psN7NwBNG?=
 =?us-ascii?Q?iYC0NyoZC09zBKaDlbqc/Z/Lqx+5wHm2X95uhmIZwTkU/NYD0MqRmbTCVjB6?=
 =?us-ascii?Q?ToMjP+q2ktGFvpMV/PVshOrfRseaq2+eYn+bTVlTOduZkV3Fpu8YvNlzao4h?=
 =?us-ascii?Q?uNEG2djraTfF4dM6Y0nOr9TaQwDvD47sCCoJTD8Xhib1mhjMYJVjXGNF7boN?=
 =?us-ascii?Q?EQWMZLtF2K1mam93cQqYw4trPrPSVEgl7PWT5kDWtE/m+mSL3FzEXThNwbEe?=
 =?us-ascii?Q?5GknqtGuXGxYt7iex6WzrUBeCS1XOii+IWHewqYXurJ5cJBzV28WZGvtqx3L?=
 =?us-ascii?Q?0hlXXgyJ1uxl5JTrhQqFBbkel1dIcf5rW+j6GYFXhpzARkWUuP1goeToHLtp?=
 =?us-ascii?Q?hwC+625ylVBCai7U2JN3zSZENe0XIueL8IRzcoKo65LmUg7DT8xvEuXfasLz?=
 =?us-ascii?Q?CB2ryBD687oE1anC5gteeEaboMQCV3B2ghem1RvFeRo2GCNSNpe1wbuYzuXB?=
 =?us-ascii?Q?uVknwAqBWoshBx0amSyt6yxTu9Wl11qQMoR3fQufoWJgnis3r4g7KBa2Q5dn?=
 =?us-ascii?Q?PQP5F0RMwpARASJ0sKQStj4YackyHdmsK4oeC+i8YAkfxkLY+lPiQk7NQ4z6?=
 =?us-ascii?Q?oat3/+GmJFS0j1sgKhJhAh9Wt6V67mJK8SxwQG+3AVmCMZ+zw4IOEBzgqqtk?=
 =?us-ascii?Q?wxJjdHZjTjcLAu5hMZL0omRpDR7I2cETswBI1lWcC6sjLjszolrGg7J5sjB+?=
 =?us-ascii?Q?wI7nT1MUMBqdODp8GnwX9rSPE/yZeXhYy3wxMczs0guF/Vj3bfpcK1gYGbjG?=
 =?us-ascii?Q?p3n7layO7Q4UDJTJE1a8vLlY1EsjmRN/0vLo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5198.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(13003099007)(8096899003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J/rO0mtBsoOsZcjUVA0wC5QjJnaGurSeBO/mjvCO7lguZbwp9JIHeCHDnaXE?=
 =?us-ascii?Q?dxI7Fvm237xQafWVdo4RdfPvPplOApHY2oUcuUQy1SnTIA0Bc2OIjrqkKpJE?=
 =?us-ascii?Q?FM06a+p0WZLcVnbRUxsb4YIUPcLB8Y4xMcbZ+U7kOqUWBXv7B6h/PZhPWssT?=
 =?us-ascii?Q?y9OeQBF3dRSl0xHUXgU/3emrEHrIDNhThyaa8OKalC64vTH7LoiR1N8E2iHo?=
 =?us-ascii?Q?LZ+cu7HWiuIM/WhcDq5iDySvkVtJOcfh521qehlK8nMZ8iehV7XYoqGzdP7C?=
 =?us-ascii?Q?f0wAhhUcdhz2tKhegZ2+yubfXZ5Lg0Rqw86a91wy6RxiNybM5XzotNXdO4cL?=
 =?us-ascii?Q?3K5iA/K9jcfpybDhmKS4oNIGi/c8lD1S8Omv+9BN6UjZkR59TqcyvulOPvuP?=
 =?us-ascii?Q?ZOfCETOJ4zRLdDUpOMRSxbV9KLUU8UIXsfvxEZ82cgthindeIDyNXUp2Euy9?=
 =?us-ascii?Q?iVt2q8n8+Kymq7bOwXEQzCyEd3GiLojw05SBgZp0PN0XNIDsjeW7ktx542T6?=
 =?us-ascii?Q?kyJeYJictSlr+9cIwXsACeh3vCcNXG65lilMWAhGRyFvHw6Ll6uQ1UjtKrxY?=
 =?us-ascii?Q?8h8EX6Vqwo1JtAA7Q35HIt96kym4OwZ6V6CR3PAa8wu5aMc7G5yTdqz1P9QI?=
 =?us-ascii?Q?M50I73V14xJ5kwl+elm8N0sLpjMHlrPmv4zK6oFMsC5nMAa+7EXORuvHpQ8e?=
 =?us-ascii?Q?ph8y0R7mVjjCI/hXTa8EfOedWBoSWYzokREFzDGwDWCkRJKvbBVB5Dt/bjQV?=
 =?us-ascii?Q?5SdFr+rRwQaLTMX2w2UuAAaVN75Q6CNbBvFpajJhU63frS+JJRxPBO7wl6De?=
 =?us-ascii?Q?u4G6GfBT7QxR+VPe0MCOXc4cdw2Av8DOviaUXdEq2myeu9m3R7m+xtqNQ21H?=
 =?us-ascii?Q?gZp/32JmJy4KT1ah9Jr75GC99W+Vlk7HXALbCO5BGKvYWrue6EoLgxRajaqu?=
 =?us-ascii?Q?K9OmzTYJZnAAHAEVIPe14FBGVUo2kYChOYt+mFojA6OgYHWCwm6FEGQrJSpn?=
 =?us-ascii?Q?5PnTD7b63/VSMv8HxYeTwUMultCkHjBiNCuO4BVSEW6501keTKCrF/oZhIEf?=
 =?us-ascii?Q?iBFVHGSJ15F/ewmjHjhNo3RLR9krp4j4Mzq+9w1tg8k47w9xoaCxDuxWW9Qp?=
 =?us-ascii?Q?3PuF3LEGFLRSBdjIR4ezZrO+SVn/limkBxyLX86TP3Ka2t4lA9YWo1Bf9Qx+?=
 =?us-ascii?Q?tCYn1W/YEmV6IBhqMWjoiI9qBRyxapVSXZDxm5HRrbG6jnFpmoVQYAT3Pw4N?=
 =?us-ascii?Q?JIneZ0+/4cUhAO+8cI43ItnHARnYul5ZopEi+FRDS4zae4O17jl/AfKwBD1q?=
 =?us-ascii?Q?0K3TH+mgr3FONLEV1O9EptydJtEqxMInZbbxS1IFuMlGQO4GaLGcgDDZDGEu?=
 =?us-ascii?Q?1pSq1EgV2b5NvArF6yp6eCZyhzh2tRiY0wr4TUy/W42H/6GiSl42aglPt/97?=
 =?us-ascii?Q?1OC3G70CuTXGbNzmEPLcp7sqaqLjpiY1++p6Ml50wsNPu/M9jkdffcVCPf29?=
 =?us-ascii?Q?1EvemA2N2uEYmQIX1UfBwMLI1P5L8R57TQY9MNhxucv5AgYcj1tUPx2ObzHP?=
 =?us-ascii?Q?eW6gQEf3lxatKEZK3b2FaOXTB+C0grzCDoGM0ZDKcIMTl8naAWzGHFHAT7Zr?=
 =?us-ascii?Q?b3vX6S9FprC5fDxJWlFA89vPGhhuqtWfU3l5nks/8biWl3JmE4TueDIkLb8T?=
 =?us-ascii?Q?wMoZ2/KWSgRUV+ipWDfIZQ2ys9HRG3oUhx/FERXat3n8k5CvEQ8Fj6F6vF4g?=
 =?us-ascii?Q?35iANDLXSEBc6mTS92uGv58vfo0xY6RzUqWRia9fPTInOdHRF7+X?=
Content-Type: multipart/alternative;
	boundary="_000_DS7PR10MB51981EA949466CDD198C03A0C483ADS7PR10MB5198namp_"
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5198.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd9bae6-9a34-4f49-1847-08de5001b1c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2026 04:35:34.0653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCuQabOR71eNhvCtgGQcqnibBxDcpbZ9S6bpsTPCDCt6Jugc+FVI2L7KUiDRbYuK87b7RruXjNVdTJeqpqPBrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6013
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_DS7PR10MB51981EA949466CDD198C03A0C483ADS7PR10MB5198namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The following issue with virtual media is fixed by https://gerrit.openbmc.o=
rg/c/openbmc/webui-vue/+/86436

Jan 06 04:05:29 ipmi-card nbd_client[726]: Exported device is too big
for me. Get 64-bit machine :-(


Regards,
Hariharan R


--_000_DS7PR10MB51981EA949466CDD198C03A0C483ADS7PR10MB5198namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">The following issue with virtual media is fixed by
<a href=3D"https://gerrit.openbmc.org/c/openbmc/webui-vue/+/86436">https://=
gerrit.openbmc.org/c/openbmc/webui-vue/+/86436</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Jan 06 04:05:29 ipmi-card nbd_client[726]: Exported=
 device is too big<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">for me. Get 64-bit machine :-(<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none">Regards,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none">Hariharan R<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DS7PR10MB51981EA949466CDD198C03A0C483ADS7PR10MB5198namp_--

