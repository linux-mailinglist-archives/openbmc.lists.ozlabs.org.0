Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C214E97C7F3
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 12:26:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ws808h2z30WT
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 20:26:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c409::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726741591;
	cv=pass; b=VF+ZqJWAHePJWn4SPxUEv1iE0xPiQv4LQXVmVTfQU2idQGzyxESzgK2WSwR08EXOBOAQFyzhxGlsEmbEG738hksIbujXGPvU+pHeaLJXZIZkXVVGA7VVTKiKOxYvQbeoTlY0f1MHOlDReEO092lv8uMjvjGgwqzEF+sKRq72zrTVcefZuOP1pFn+OzX/Eg5PyMEf8svS75aE/ejmOikSR7EiyFMofbCLWV33dPYfqQwvitMuIAUcfA+Al8TpUK6Ah3/goYSZZxvnxPi+AhIlCx9in5U8GjQASkySv4qO2MzPID2HIdGdHhUzSZP9f/pMeiN2/D3ee33nboye1R/9bw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726741591; c=relaxed/relaxed;
	bh=BGuRj0klRIw5W3PKQJMnhgR8+CRDygLZRnFQXpvB46I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MKJzURv2fmzMyWRqhMPBucx+Pbnvxxqa2iw4Yz5fIN6rFlUKY+gGF2n2DNHKGrzQDChUEGRNLPM9N822YuExN23v/OTvXd/Me0g/l6hUWa7x/EmLMsIqloyx+dKwej56T5JiClQ//lbdra6dmDLARchBbXia89davQwU/KqpdVkvmBScxwbwSi3TVmJWafoQyG2VIjwbVGGuTvaoMx0uR9OQtqwicoEffS4DcESfa5G6BJx6r7llklaQDL0card+HIuLbTuGZ0ZvSA1UWuKQHEO9I7UYHIxYJXuC2ZrVC4yYBd0tHXnKZR0tp2xOYqmqb0i/tIPcnGzMksF6hz7K+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ltts.com; dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=UjljIJFw; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c409::1; helo=ma0pr01cu009.outbound.protection.outlook.com; envelope-from=gundu.babasikandar@ltts.com; receiver=lists.ozlabs.org) smtp.mailfrom=ltts.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=UjljIJFw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:c409::1; helo=ma0pr01cu009.outbound.protection.outlook.com; envelope-from=gundu.babasikandar@ltts.com; receiver=lists.ozlabs.org)
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c409::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ws26XRBz2xtp
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 20:26:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RH8ns7kBaFF1KwX9i+qJFe9kGAvFWzo8G9Cxj6o7fA05/RmySJbf7icciT+glASqm4P6JCttHsuasIM+WdKHC5HqQOrPR2e11e/h9uNv84ZxL7t8gb/GDnQhvdZsS/SqE2xpf3ajK37oRR0OIWxDwgUHECgHdffFnPMH51rPS1/z/waPZfchtb+WElhpV7/HfQPGKAmqathA4wsnsDsOH1NX0BPmdb7d5vkpN7LMp4cYbIlgzVDSHFtY6pnB1oSJmp2vMyixuU++AF4XSzmkQnuUciR1muFLLhJN2ysCic24C5Sf4tFa9GRiM604VfyqJy0wfSVu1NLQ3kwAV49Qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGuRj0klRIw5W3PKQJMnhgR8+CRDygLZRnFQXpvB46I=;
 b=TSe8Q2mSA/z2w/8SXuRojTdy+42mo4x1rVc0r4YtLYLo1Rrv4k3etPDS09+rce0FOKJ/nRNUk+Nau6PaUzn2XWtSJGnSgt44DNJ9h3yqLVAiqGlp1Bun65guYG0QMUIha7wUMd4CMx/4YROJwos0K4Xhog/9vw2v6yTyiy6uloAxP7J+Ym9N2IujsGEXhCH2VlRjn2N0vsm5C+E/Jk8PruO74nRnc2q8jzbO53ToEStFyG53tzbxyu9e120AroFRKMBqpicQ4JlmrYzG1iSWPLywQ3Q/LHsIfrgC59t5s0gJUrilkrGXnSINbKlFVYaoat3/DoLxtmT17R9WwMJ/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGuRj0klRIw5W3PKQJMnhgR8+CRDygLZRnFQXpvB46I=;
 b=UjljIJFwe5hUmKesSMUDGfhukAyW5te9wF1TSiJyc8IPUVnLajtwsROb4Fvplmmsc/nCa1kN3skUUS2i+P0uAm7DngpNxQfM0LHeC5kRNfYGyWYBekoEoVp16aajaKhYM5cItWE6mi5dLSKv+FGPN+lgrEpgdsL0ap3HCqW43mCVCPEg2j8SfdrCPQgwJ/whZKNsPUMjqdYKJUUojNpzwhMN8CtUG8vp5x04cr3RjWuyuJdj62ZPXUco7160FClvlt4tuRY0n5HGQgAfO9tyKkLBp23WBdHF6XAkJWI/EjABAjrBvFIEgGvN0ED2HNEtL7ai2On5zxLMELIGF9bZ+Q==
Received: from MA0PR01MB5725.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::7)
 by PNXPR01MB7155.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Thu, 19 Sep
 2024 10:26:05 +0000
Received: from MA0PR01MB5725.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e4b3:a43e:9a36:3bb4]) by MA0PR01MB5725.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e4b3:a43e:9a36:3bb4%4]) with mapi id 15.20.8005.006; Thu, 19 Sep 2024
 10:26:05 +0000
From: Gundu Baba Sikandar <gundu.babasikandar@ltts.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Help with "ipmitool chassis power on"
Thread-Topic: Help with "ipmitool chassis power on"
Thread-Index: AQHbBFZiO80FP0MlAUy6RHfVDe6T1bJV2EoAgAkai7M=
Date: Thu, 19 Sep 2024 10:26:05 +0000
Message-ID:  <MA0PR01MB5725973B24BC49B524964180E0632@MA0PR01MB5725.INDPRD01.PROD.OUTLOOK.COM>
References:  <PN0PR01MB9336C133AE2B5EC1C3415336E09B2@PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM>
 <ZuRYREE7yKY-u4wK@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZuRYREE7yKY-u4wK@heinlein.vulture-banana.ts.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB5725:EE_|PNXPR01MB7155:EE_
x-ms-office365-filtering-correlation-id: 26576b1d-2573-44a4-2de1-08dcd8957811
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?0SW27KClDLpCKtV5dtWZzZtm3/8vdXqF9Ku8C2+fJvNhp31KgtYAeFJI+q1u?=
 =?us-ascii?Q?V2+wKgalyPiFDTz0dkb07Y8yS3031Tgc9BnJEBTZaHxvbJsCY7og1D7ZP/iv?=
 =?us-ascii?Q?+gUPPh7DpkYlqf0jhQvLT68mPXx3ZWtWu4O4EsHgGZflETj9jROJpDUCE303?=
 =?us-ascii?Q?MXaKbYMvikdGd0s1YH49087u2+2E72Q9DpeyKI6bNktoLT+E/9RdJoYFKDnV?=
 =?us-ascii?Q?gBTBn9yXRkx01/yAIvXZI/soByJwVN4Gtj1OeyR3UfLCCKcPvRLEvjL6dYkx?=
 =?us-ascii?Q?ghwOs923IoWoHTDJ5pwYbKTydRMn96dzPe7ciI0DTTYDINmYY9WlsJ8V50zw?=
 =?us-ascii?Q?i7kz9P09DFhXbaRo6r6HCuYm04gRbgXEksHolaebuTRbFYEl8nX23B35SlPZ?=
 =?us-ascii?Q?KOYXfFLGxOZraMlC+5vBEsYZopXzkwBA1Jeid5rXgsYU6U8Mgu3USymjfejM?=
 =?us-ascii?Q?99n17PgjD8Zd+JJUP1c+Qju+rAN2U+xHRU1DdCCcBmi80zPiJ+VfQUnqIS4b?=
 =?us-ascii?Q?k0bVJ3DOzCM9gXlEeZK6sYHLenP4m+b4MMIsKKslNrOiUhdpJiBkoiFYOraf?=
 =?us-ascii?Q?R5/9XGroBsYY7ckYNTfhGt/vckDkT7KZ5gwOLxNeDladQRBuDd4SN4hY6NW3?=
 =?us-ascii?Q?n6Q40kzogVyiiuN4Y42sFTiIWrHnIRrvozGLrWwRGf5CLWv78zZn+5LNpTF+?=
 =?us-ascii?Q?l5MPmDDsqwrW8y9nlNKDXOHnO4/MhEkYg4l18tKML+9R8RCUIhbfLiNEp1pa?=
 =?us-ascii?Q?wnBwnqc7O5p2t4/+1bntq4b72WRC/qxIKtaZz4uzeGxlTZ9zz3uNRs9Xk/RO?=
 =?us-ascii?Q?RbtJYGTnPLFOs9ZebMDPatL7ic+D+gdNt2DFXIpkUSi0wTadoBHBc3Ar6Cb1?=
 =?us-ascii?Q?B2w4sGGcGN7JThv9ngW4tIgqd1maml0yC200Scq31kBYtsA+Y1Wa/KCCXmmD?=
 =?us-ascii?Q?QYmNEgOFt9JlyZKWedHLuOhq5jCQ+QAdhyB4nRNriKgX1JNr5ObClSZ2FNi7?=
 =?us-ascii?Q?sZcjt8+kOiAi36eJKoJwJp+uS9sKhhUVoNomp1dnKbwe7tbkY1kREIm8Gkyg?=
 =?us-ascii?Q?DKpOVhZpP2mkPe15LgcGRdCz50prdxeeKN1yB91Akf1Uyv/uIToLVX8Ys9QK?=
 =?us-ascii?Q?ksXCnHQJGD0G1RXaB/JlQxpMcwVVI7KxM06Jd21XUSc6ILNh/+44a4dgMMR9?=
 =?us-ascii?Q?xaYbuT4+xXH58mI7lAaMOy8HqlYPzVHats7Pm2xdEJkm5T8eub98EwWuTqnM?=
 =?us-ascii?Q?I9tNEh7UraEPKAgUdK9rSZjQgxkEr2PlgDLiohC3uhdre4VFFRQmwNxmtb+r?=
 =?us-ascii?Q?aSAnClTtjNesmoBmHchWqEl6Y26iwGsCpzSjmYi7RXyqcw=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB5725.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?HXQsGksD2OKRxtyfb0tGNSbep98fE4JqpdMOUvWtT/Z5QOU2p1+BDI5uoQo4?=
 =?us-ascii?Q?vRz7qbvCMeSz6O2Wb+ck2m5SQj8IrOQvJXbl5yKZVEdJdHnRoceShD9anLwk?=
 =?us-ascii?Q?kAioMQhbSqj9wckI8cHcYgbRO8qYxNoWsuNE442b6aZx/hBXJFkNYlfvWuwX?=
 =?us-ascii?Q?mhscGnjva/u9jci4nwNh00ahRgQGz79AD07BD38wM9CrN26sVvVtac7+zPaR?=
 =?us-ascii?Q?nZbax/0iKsSO+3a7aSKU/jDU41MjbJQln9aGg84mV/mzCBIIMMmMEHNOEvQm?=
 =?us-ascii?Q?CAU807o4rlVNrbebn5aUGSU56BiVtFgTWUj7ZeRykedWmldynvq/h4jh/XNe?=
 =?us-ascii?Q?3IRDlSPISbdWIWGZqAsNppSHNHreyR4Pzyh/BaYDJFsBV6WiD9r2koeYegT0?=
 =?us-ascii?Q?ikaHtIpLHt5fHNIFQQECgzRFvaS7sjF4svbP0unO277b5x9kcTas1JlrNFHN?=
 =?us-ascii?Q?N8XVMLu+v8+6rmCny3BBgxAM4Z8Ce+6IKVGz0bg1KnJ9H+2aZ07T8UNdmHdZ?=
 =?us-ascii?Q?jwOEcB6fEUWld6nF3smdoKZmBJezq6JcEhEW3nzBObGA6fC9SqvhXid74Lj/?=
 =?us-ascii?Q?f/kIDLzm3JCrYhT8VscK+4P5rol8OETQ6FWX+WESluLG725dbUOM5soXaZqu?=
 =?us-ascii?Q?vdeY6u7lnJlgHK3TFJARgYaWM/Jg31z7GWK9vm3NVzNjyifGGtUUQUl5Y2/5?=
 =?us-ascii?Q?DFtFs8xUvAy1YX48RNjlrWDCtsmXeqsaM8txaPqhQX6a1QmaZteiT1BFMfGp?=
 =?us-ascii?Q?O3PVbCYYFPCfwBmzJUT1348Qv72IG+QTAPonwJa+wKK2C29ClYRxFRv2Unn3?=
 =?us-ascii?Q?9wVTsPiSy/WwWjmdZ9axCh9S2oVqOx0/UbjFIB9r+MsySZPEYBm72LBXmnf7?=
 =?us-ascii?Q?JA/08LMLl9PYXhoRHCqJ9yfrxI3GRpziKeZQx0PcbKVRdJ8kuerAzeQe7WMH?=
 =?us-ascii?Q?ExYksuExXs+dt+/UTGA22crU+RQolnBwP8MfRY0j2g2YGC1LL1U+yUzAK/b5?=
 =?us-ascii?Q?x63merLnl0Q8KjCNgsUQYS6MmLDUyJ/H+98HIqQQcODOHy5TZCnLYGruUcRq?=
 =?us-ascii?Q?hQ02z4SnX+QiYjGPJPZGpcf9DOxQgH+iE/NOS55RT5CJjtEJ0GHwZEovuhK7?=
 =?us-ascii?Q?c+Ey/UVqIIWZUpkj+1OYrviqvW0XOzgAnD6A4ETbdFIgPbUtt576YrUEkIVi?=
 =?us-ascii?Q?9oP3xJahZp6eFn0p9BqMLmXaiQua3hu3G1dsThrgzCxS/Z0sOeDSnKcG51Zy?=
 =?us-ascii?Q?lxVlD4+6t8xgNN6AnFqwD/EVj4+mhnTvSH09bWUuYEVCqfT6Gqkqc0olPk2Q?=
 =?us-ascii?Q?zZGgeHqeT2zjxJ+8t7r6Jck3wS6NiafBuIU+KXZMIYOR9p2BywLCItfvXFjP?=
 =?us-ascii?Q?nnRrkT0llINx5ZKlkNrWWINopjfHnka2ickBJ5rZLUZcD401K1rquukX5zaq?=
 =?us-ascii?Q?Sp/OSaDuAzoSKdgz2sGWk60g7RAytbSJTKqr8hTGg3A17gtac/Qhfzr61CHN?=
 =?us-ascii?Q?sLSAIG5GRypo22oCgWn2MW0z6nKwNsIBF6aCpiAfFrSDaoyBlyqvjL0DOXKD?=
 =?us-ascii?Q?YB6dPzv6gT/qwgag5bCDDGSag4Lr0BwxJIOo4C+X?=
Content-Type: multipart/mixed;
	boundary="_004_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB5725.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26576b1d-2573-44a4-2de1-08dcd8957811
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 10:26:05.5670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kiyupZq2mO2/4w55PWXPPYZXBjUSZNPsSa/reZixy9ETg+pa3RtxWj1QxBDB6s9vtFUHP64a3GEcMQKocB2+LqcG1veayrC+nI1DhfuGob8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7155
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
Cc: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_"

--_000_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

Sorry for the delay, I was on the leave.

1. What commit are you building from?
Ans: origin/aspeed-master
2. What hardware is this that you're targeting?  Do you have
   un-upstreamed configuration for this machine?
Ans: We are using ast2600 BMC with our custom board

3. Have you checked the underlying dbus objects for state-management,
   rather than going right to `ipmitool`?
Ans: I'll included the "busctl tree" output with this mail.
4. Are you using `phosphor-state-manager` or `x86-power-control`?
Ans: We are using x86-power-control

Thanks,
Gundu Baba Sikandar
________________________________
From: Patrick Williams <patrick@stwcx.xyz>
Sent: 13 September 2024 20:50
To: Gundu Baba Sikandar <gundu.babasikandar@ltts.com>
Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Bala Subramaniyan =
<Bala.Subramaniyan@Ltts.com>
Subject: Re: Help with "ipmitool chassis power on"

CAUTION: This email is from an external source. Please do not open attachme=
nts or click links from an unknown or suspicious origin. Phishing attempts =
can be reported by using the report message button in Outlook or sending th=
em as an attachment to phishing@Ltts.com. Thank you

L&T Technology Services Ltd

www.LTTS.com

L&T Technology Services Limited (LTTS) is committed to safeguard your priva=
cy. Read the appropriate privacy notice<https://www.ltts.com/privacy-polici=
es-notices> applicable to you to know more about how LTTS collects, uses an=
d stores your personal data. Please visit our privacy policy<https://www.lt=
ts.com/data-privacy-policy> available on our website www.Ltts.com for more =
information about our commitment towards data privacy under applicable data=
 protection laws. This email may contain confidential or privileged informa=
tion for the intended recipient(s). If you are not the intended recipient, =
please do not use or disseminate the information, notify the sender and del=
ete it from your system.

--_000_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Patrick,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sorry for the delay, I was on the leave.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
1. What commit are you building from?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(237, 92, 87);">
Ans: origin/aspeed-master</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt;">
<span style=3D"color: rgb(0, 0, 0);">2. What hardware is this that you're t=
argeting?&nbsp; Do you have<br>
&nbsp;&nbsp; un-upstreamed configuration for this machine?<br>
</span><span style=3D"color: rgb(237, 92, 87);">Ans: We are using ast2600 B=
MC with our custom board</span><span style=3D"color: rgb(0, 0, 0);"><br>
<br>
3. Have you checked the underlying dbus objects for state-management,<br>
&nbsp;&nbsp; rather than going right to `ipmitool`?</span></div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(237, 92, 87);">
Ans: I'll included the &quot;busctl tree&quot; output with this mail.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
4. Are you using `phosphor-state-manager` or `x86-power-control`?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(237, 92, 87);">
Ans: We are using x86-power-control</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
Thanks,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Gundu Baba Sikandar</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Patrick Williams &lt;=
patrick@stwcx.xyz&gt;<br>
<b>Sent:</b> 13 September 2024 20:50<br>
<b>To:</b> Gundu Baba Sikandar &lt;gundu.babasikandar@ltts.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; Bala =
Subramaniyan &lt;Bala.Subramaniyan@Ltts.com&gt;<br>
<b>Subject:</b> Re: Help with &quot;ipmitool chassis power on&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email is from an external source. Pl=
ease do not open attachments or click links from an unknown or suspicious o=
rigin. Phishing attempts can be reported by using the report message button=
 in Outlook or sending them as an
 attachment to phishing@Ltts.com. Thank you<br>
</div>
</span></font></div>
<p><strong>L&amp;T Technology Services Ltd</strong></p>
<p><a href=3D"" http:=3D"" www.LTTS.com=3D"" ??=3D"" target=3D"" _blank??=
=3D"">www.LTTS.com</a></p>
<p>L&amp;T Technology Services Limited (LTTS) is committed to safeguard you=
r privacy. Read the appropriate
<a href=3D"https://www.ltts.com/privacy-policies-notices" target=3D"_blank"=
>privacy notice</a> applicable to you to know more about how LTTS collects,=
 uses and stores your personal data. Please visit our
<a href=3D"https://www.ltts.com/data-privacy-policy" target=3D"_blank">priv=
acy policy</a> available on our website www.Ltts.com for more information a=
bout our commitment towards data privacy under applicable data protection l=
aws. This email may contain confidential
 or privileged information for the intended recipient(s). If you are not th=
e intended recipient, please do not use or disseminate the information, not=
ify the sender and delete it from your system.</p>
</body>
</html>

--_000_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_--

--_004_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_
Content-Type: text/plain; name="tree.txt"
Content-Description: tree.txt
Content-Disposition: attachment; filename="tree.txt"; size=47349;
	creation-date="Thu, 19 Sep 2024 10:23:49 GMT";
	modification-date="Thu, 19 Sep 2024 10:23:55 GMT"
Content-Transfer-Encoding: base64

U2VydmljZSBvcmcuZnJlZWRlc2t0b3AuREJ1czoKYC0vb3JnL2ZyZWVkZXNrdG9wL0RCdXMKClNl
cnZpY2Ugb3JnLmZyZWVkZXNrdG9wLkF2YWhpOgpPbmx5IHJvb3Qgb2JqZWN0IGRpc2NvdmVyZWQu
CgpTZXJ2aWNlIG9yZy5mcmVlZGVza3RvcC5ob3N0bmFtZTE6CmAtL29yZwogIGAtL29yZy9mcmVl
ZGVza3RvcAogICAgfC0vb3JnL2ZyZWVkZXNrdG9wL0xvZ0NvbnRyb2wxCiAgICBgLS9vcmcvZnJl
ZWRlc2t0b3AvaG9zdG5hbWUxCgpTZXJ2aWNlIG9yZy5mcmVlZGVza3RvcC5uZXR3b3JrMToKYC0v
b3JnCiAgYC0vb3JnL2ZyZWVkZXNrdG9wCiAgICB8LS9vcmcvZnJlZWRlc2t0b3AvTG9nQ29udHJv
bDEKICAgIGAtL29yZy9mcmVlZGVza3RvcC9uZXR3b3JrMQogICAgICB8LS9vcmcvZnJlZWRlc2t0
b3AvbmV0d29yazEvbGluawogICAgICB8IHwtL29yZy9mcmVlZGVza3RvcC9uZXR3b3JrMS9saW5r
L18zMQogICAgICB8IHwtL29yZy9mcmVlZGVza3RvcC9uZXR3b3JrMS9saW5rL18zMgogICAgICB8
IHwtL29yZy9mcmVlZGVza3RvcC9uZXR3b3JrMS9saW5rL18zMwogICAgICB8IGAtL29yZy9mcmVl
ZGVza3RvcC9uZXR3b3JrMS9saW5rL18zNAogICAgICBgLS9vcmcvZnJlZWRlc2t0b3AvbmV0d29y
azEvbmV0d29yawogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9uZXR3b3JrMS9uZXR3b3JrL18z
NjBfMmRwaG9zcGhvcl8yZG5ldHdvcmtkXzJkZGVmYXVsdAogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9uZXR3b3JrMS9uZXR3b3JrL18zODBfMmQ2cmRfMmR0dW5uZWwKICAgICAgICB8LS9vcmcv
ZnJlZWRlc2t0b3AvbmV0d29yazEvbmV0d29yay9fMzgwXzJkY29udGFpbmVyXzJkdmIKICAgICAg
ICB8LS9vcmcvZnJlZWRlc2t0b3AvbmV0d29yazEvbmV0d29yay9fMzgwXzJkY29udGFpbmVyXzJk
dmUKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3AvbmV0d29yazEvbmV0d29yay9fMzgwXzJkY29u
dGFpbmVyXzJkdnoKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3AvbmV0d29yazEvbmV0d29yay9f
MzgwXzJkdm1fMmR2dAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9uZXR3b3JrMS9uZXR3b3Jr
L18zODBfMmR3aWZpXzJkYWRob2MKICAgICAgICBgLS9vcmcvZnJlZWRlc2t0b3AvbmV0d29yazEv
bmV0d29yay9fMzgwXzJkd2lyZWQKClNlcnZpY2Ugb3JnLmZyZWVkZXNrdG9wLnJlc29sdmUxOgpg
LS9vcmcKICBgLS9vcmcvZnJlZWRlc2t0b3AKICAgIHwtL29yZy9mcmVlZGVza3RvcC9Mb2dDb250
cm9sMQogICAgYC0vb3JnL2ZyZWVkZXNrdG9wL3Jlc29sdmUxCiAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9yZXNvbHZlMS9kbnNzZAogICAgICBgLS9vcmcvZnJlZWRlc2t0b3AvcmVzb2x2ZTEvbGlu
awogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9yZXNvbHZlMS9saW5rL18zMQogICAgICAgIHwt
L29yZy9mcmVlZGVza3RvcC9yZXNvbHZlMS9saW5rL18zMgogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9yZXNvbHZlMS9saW5rL18zMwogICAgICAgIGAtL29yZy9mcmVlZGVza3RvcC9yZXNvbHZl
MS9saW5rL18zNAoKU2VydmljZSBvcmcuZnJlZWRlc2t0b3Auc3lzdGVtZDE6CmAtL29yZwogIGAt
L29yZy9mcmVlZGVza3RvcAogICAgfC0vb3JnL2ZyZWVkZXNrdG9wL0xvZ0NvbnRyb2wxCiAgICBg
LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEKICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL2pvYgogICAgICBgLS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdAogICAgICAgIHwt
L29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L18yZF8yZW1vdW50CiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvXzJkXzJlc2xpY2UKICAgICAgICB8LS9vcmcvZnJl
ZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9hdmFoaV8yZGRhZW1vbl8yZXNlcnZpY2UKICAgICAgICB8
LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9hdmFoaV8yZGRhZW1vbl8yZXNvY2tldAog
ICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Jhc2ljXzJldGFyZ2V0CiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvYmxvY2tkZXZfNDBkZXZfMmRt
dGRibG9jazRfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC9ibG9ja2Rldl80MGRldl8yZG10ZGJsb2NrNV8yZXRhcmdldAogICAgICAgIHwtL29yZy9mcmVl
ZGVza3RvcC9zeXN0ZW1kMS91bml0L2Jsb2NrZGV2XzQwZGV2XzJkcm9vdF8yZXRhcmdldAogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2JtY3dlYl8yZXNlcnZpY2UKICAg
ICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9ibWN3ZWJfMmVzb2NrZXQKICAg
ICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9ib3RoXzJlc2VydmljZQogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2NsZWFyXzJkb25jZV8yZXNlcnZp
Y2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9jb25ubWFuXzJlc2Vy
dmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2NvbnZlcnRfMmRw
YW1fMmRjb25maWdzXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1k
MS91bml0L2NyeXB0c2V0dXBfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lz
dGVtZDEvdW5pdC9kYnVzXzJkYnJva2VyXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L2RidXNfMmVzb2NrZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0
b3Avc3lzdGVtZDEvdW5pdC9kZXZfMmRodWdlcGFnZXNfMmVtb3VudAogICAgICAgIHwtL29yZy9m
cmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rldl8yZG1xdWV1ZV8yZW1vdW50CiAgICAgICAgfC0v
b3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkbXRkYmxvY2swXzJlZGV2aWNlCiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkbXRkYmxvY2sxXzJl
ZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkbXRk
YmxvY2syXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQv
ZGV2XzJkbXRkYmxvY2szXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQvZGV2XzJkbXRkYmxvY2s0XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNr
dG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkbXRkYmxvY2s1XzJlZGV2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkbXRkYmxvY2s2XzJlZGV2aWNlCiAgICAg
ICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkcmFtMF8yZWRldmljZQog
ICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rldl8yZHJhbTEwXzJlZGV2
aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkcmFtMTFf
MmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9kZXZfMmRy
YW0xMl8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rl
dl8yZHJhbTEzXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvZGV2XzJkcmFtMTRfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVt
ZDEvdW5pdC9kZXZfMmRyYW0xNV8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L2Rldl8yZHJhbTFfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0
b3Avc3lzdGVtZDEvdW5pdC9kZXZfMmRyYW0yXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVk
ZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkcmFtM18yZWRldmljZQogICAgICAgIHwtL29yZy9m
cmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rldl8yZHJhbTRfMmVkZXZpY2UKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9kZXZfMmRyYW01XzJlZGV2aWNlCiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkcmFtNl8yZWRldmljZQogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rldl8yZHJhbTdfMmVkZXZpY2UK
ICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9kZXZfMmRyYW04XzJlZGV2
aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkcmFtOV8y
ZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rldl8yZHR0
eVMwXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2
XzJkdHR5UzEwXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvZGV2XzJkdHR5UzExXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQvZGV2XzJkdHR5UzEyXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9w
L3N5c3RlbWQxL3VuaXQvZGV2XzJkdHR5UzEzXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVk
ZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkdHR5UzE0XzJlZGV2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkdHR5UzE1XzJlZGV2aWNlCiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkdHR5UzE2XzJlZGV2aWNlCiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2XzJkdHR5UzFfMmVkZXZp
Y2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9kZXZfMmR0dHlTMl8y
ZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rldl8yZHR0
eVMzXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGV2
XzJkdHR5UzRfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC9kZXZfMmR0dHlTNV8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1k
MS91bml0L2Rldl8yZHR0eVM2XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5
c3RlbWQxL3VuaXQvZGV2XzJkdHR5UzdfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0
b3Avc3lzdGVtZDEvdW5pdC9kZXZfMmR0dHlTOF8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVl
ZGVza3RvcC9zeXN0ZW1kMS91bml0L2Rldl8yZHR0eVM5XzJlZGV2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZGlhZ3Rlc3RfMmVzZXJ2aWNlCiAgICAgICAgfC0v
b3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZHJvcGJlYXJfMmRtaWdyYXRlXzJka2V5XzJk
bG9jYXRpb25fMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvZHJvcGJlYXJfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQx
L3VuaXQvZHJvcGJlYXJfMmVzb2NrZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVt
ZDEvdW5pdC9kcm9wYmVhcl80MDBfMmQxOTJfMmUxNjhfMmUwXzJlMTEwXzNhMjJfMmQxOTJfMmUx
NjhfMmUwXzJlMzZfM2E0NzE5Ml8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9kcm9wYmVhcmtleV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC9lbWVyZ2VuY3lfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZW1lcmdlbmN5XzJldGFyZ2V0CiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZmFuc2VydmljZV8yZXNlcnZpY2UKICAgICAgICB8
LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9maW5kbWVsZWRfMmVzZXJ2aWNlCiAgICAg
ICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvZmlyc3RfMmRib290XzJkY29tcGxl
dGVfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9nZXR0
eV8yZHByZV8yZXRhcmdldAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0
L2dldHR5XzJldGFyZ2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQv
Z2V0dHlfNDB0dHkxXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1k
MS91bml0L2dwaW9kXzVmbW9uaXRvcl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0
b3Avc3lzdGVtZDEvdW5pdC9ob21lXzJlbW91bnQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9ob3N0bG9nZ2VyXzQwdHR5UzJfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvaW5pdF8yZXNjb3BlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvaW5pdHJkXzJkY2xlYW51cF8yZXNlcnZpY2UKICAgICAg
ICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9pbml0cmRfMmRmc18yZXRhcmdldAog
ICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2luaXRyZF8yZHBhcnNlXzJk
ZXRjXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2lu
aXRyZF8yZHJvb3RfMmRkZXZpY2VfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9pbml0cmRfMmRyb290XzJkZnNfMmV0YXJnZXQKICAgICAgICB8LS9vcmcv
ZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9pbml0cmRfMmRzd2l0Y2hfMmRyb290XzJlc2Vydmlj
ZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2luaXRyZF8yZHN3aXRj
aF8yZHJvb3RfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC9pbml0cmRfMmR1ZGV2YWRtXzJkY2xlYW51cF8yZGRiXzJlc2VydmljZQogICAgICAgIHwtL29y
Zy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2luaXRyZF8yZHVzcl8yZGZzXzJldGFyZ2V0CiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvaW5pdHJkXzJldGFyZ2V0CiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvbGRjb25maWdfMmVzZXJ2aWNl
CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvbG9jYWxfMmRmc18yZHBy
ZV8yZXRhcmdldAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L2xvY2Fs
XzJkZnNfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9s
b2dyb3RhdGVfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvbG9ncm90YXRlXzJldGltZXIKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC9scGNzbm9vcF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVt
ZDEvdW5pdC9tYXBwZXJfMmR3YWl0XzQwXzJkeHl6XzJkb3BlbmJtY181ZnByb2plY3RfMmRjb250
cm9sXzJkaG9zdDBfMmRib290XzJkb25lXzVmdGltZV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcv
ZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9tYXBwZXJfMmR3YWl0XzQwXzJkeHl6XzJkb3BlbmJt
Y181ZnByb2plY3RfMmRjb250cm9sXzJkaG9zdDBfMmRib290XzJlc2VydmljZQogICAgICAgIHwt
L29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L21hcHBlcl8yZHdhaXRfNDBfMmR4eXpfMmRv
cGVuYm1jXzVmcHJvamVjdF8yZGNvbnRyb2xfMmRob3N0MF8yZHBvd2VyXzVmcmVzdG9yZV81ZnBv
bGljeV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9t
YXBwZXJfMmR3YWl0XzQwXzJkeHl6XzJkb3BlbmJtY181ZnByb2plY3RfMmRjb250cm9sXzJkaG9z
dDBfMmRyZXN0cmljdGlvbl81Zm1vZGVfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNr
dG9wL3N5c3RlbWQxL3VuaXQvbWFwcGVyXzJkd2FpdF80MF8yZHh5el8yZG9wZW5ibWNfNWZwcm9q
ZWN0XzJkaW52ZW50b3J5XzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0
ZW1kMS91bml0L21hcHBlcl8yZHdhaXRfNDBfMmR4eXpfMmRvcGVuYm1jXzVmcHJvamVjdF8yZGxl
ZF8yZGdyb3Vwc18yZGJtY181ZmJvb3RlZF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC9tYXBwZXJfMmR3YWl0XzQwXzJkeHl6XzJkb3BlbmJtY181ZnBy
b2plY3RfMmRsZWRfMmRncm91cHNfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9w
L3N5c3RlbWQxL3VuaXQvbWFwcGVyXzJkd2FpdF80MF8yZHh5el8yZG9wZW5ibWNfNWZwcm9qZWN0
XzJkc3RhdGVfMmRibWNfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQvbWFwcGVyXzJkd2FpdF80MF8yZHh5el8yZG9wZW5ibWNfNWZwcm9qZWN0XzJkdGlt
ZV8yZHN5bmNfNWZtZXRob2RfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5
c3RlbWQxL3VuaXQvbWN0cF8yZGRlbXV4XzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L21jdHBfMmRkZW11eF8yZXNvY2tldAogICAgICAgIHwtL29yZy9m
cmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L21jdHBfMmRsb2NhbF8yZXRhcmdldAogICAgICAgIHwt
L29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L21jdHBfMmV0YXJnZXQKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9tY3RwZF8yZXNlcnZpY2UKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9tb2Rwcm9iZV80MGNvbmZpZ2ZzXzJlc2Vydmlj
ZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L21vZHByb2JlXzQwZWZp
XzVmcHN0b3JlXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91
bml0L21vZHByb2JlXzQwZnVzZV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9tdWx0aV8yZHVzZXJfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC9uZXR3b3JrXzJkb25saW5lXzJldGFyZ2V0CiAgICAgICAgfC0v
b3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvbmV0d29ya18yZHByZV8yZXRhcmdldAogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L25ldHdvcmtfMmV0YXJnZXQKICAg
ICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9uZnNfMmRzdGF0ZF8yZXNlcnZp
Y2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9uc2NkXzJlc2Vydmlj
ZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L25zbGNkXzJlc2Vydmlj
ZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L25zc18yZGxvb2t1cF8y
ZXRhcmdldAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L25zc18yZHVz
ZXJfMmRsb29rdXBfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC9vYm1jXzJkY29uc29sZV8yZHNzaF80MDIyMDBfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvb2JtY18yZGNvbnNvbGVfNDB0dHlTMl8yZXNlcnZp
Y2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJkZHVtcF8y
ZG1vbml0b3JfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvb2JtY18yZGZydV8yZGZhdWx0XzJkbW9uaXRvcl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcv
ZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJkbGVkXzJkZ3JvdXBfMmRzdGFydF80MGJt
Y181ZmJvb3RlZF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC9vYm1jXzJkbGVkXzJkZ3JvdXBfMmRzdG9wXzQwYm1jXzVmYm9vdGVkXzJlc2VydmljZQog
ICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L29yZ18yZW9wZW5ibWNfMmVI
b3N0SXBtaV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC9wYXRoc18yZXRhcmdldAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0
L3Bob3NwaG9yXzJkY2VydGlmaWNhdGVfMmRtYW5hZ2VyXzQwYXV0aG9yaXR5XzJlc2VydmljZQog
ICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3Bob3NwaG9yXzJkY2VydGlm
aWNhdGVfMmRtYW5hZ2VyXzQwYm1jd2ViXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L3Bob3NwaG9yXzJkY2VydGlmaWNhdGVfMmRtYW5hZ2VyXzQwbnNs
Y2RfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvcGhv
c3Bob3JfMmRpcG1pXzJkaG9zdF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9waG9zcGhvcl8yZGlwbWlfMmRrY3NfNDBpcG1pXzJka2NzMV8yZXNlcnZp
Y2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9waG9zcGhvcl8yZGlw
bWlfMmRrY3NfNDBpcG1pXzJka2NzMl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0
b3Avc3lzdGVtZDEvdW5pdC9waG9zcGhvcl8yZGlwbWlfMmRrY3NfNDBpcG1pXzJka2NzM18yZXNl
cnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9waG9zcGhvcl8y
ZGlwbWlfMmRrY3NfNDBpcG1pXzJka2NzNF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC9waG9zcGhvcl8yZGlwbWlfMmRrY3NfNDBpcG1pXzJka2NzNV8y
ZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9waG9zcGhv
cl8yZGlwbWlfMmRrY3NfNDBpcG1pXzJka2NzNl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJl
ZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9waG9zcGhvcl8yZGlwbWlfMmRrY3NfNDBpcG1pXzJka2Nz
N18yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9waG9z
cGhvcl8yZGlwbWlfMmRrY3NfNDBpcG1pXzJka2NzOF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcv
ZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9waG9zcGhvcl8yZGlwbWlfMmRuZXRfNDBldGgwXzJl
c2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3Bob3NwaG9y
XzJkaXBtaV8yZG5ldF80MGV0aDBfMmVzb2NrZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9waG9zcGhvcl8yZGlwbWlfMmRuZXRfNDBldGgxXzJlc2VydmljZQogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3Bob3NwaG9yXzJkaXBtaV8yZG5l
dF80MGV0aDFfMmVzb2NrZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC9waG9zcGhvcl8yZHBpZF8yZGNvbnRyb2xfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVk
ZXNrdG9wL3N5c3RlbWQxL3VuaXQvcGhvc3Bob3JfMmRzeXN0ZW1kXzJkdGFyZ2V0XzJkbW9uaXRv
cl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9wbHlt
b3V0aF8yZHF1aXRfMmR3YWl0XzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3BseW1vdXRoXzJkc3RhcnRfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvcG1idXNfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvcG93ZXJvbnN0YXRlbWFjaGluZV8yZXNlcnZpY2UKICAg
ICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9yYW1vb3BzXzJkbW9uaXRvcl8y
ZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9yY18yZGxv
Y2FsXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3Jl
bW90ZV8yZGZzXzJkcHJlXzJldGFyZ2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQvcmVtb3RlXzJkZnNfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9yZXNjdWVfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9w
L3N5c3RlbWQxL3VuaXQvcmVzY3VlXzJldGFyZ2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9w
L3N5c3RlbWQxL3VuaXQvcm90YXRlXzJkZXZlbnRfMmRsb2dzXzJlc2VydmljZQogICAgICAgIHwt
L29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3JwY2JpbmRfMmVzZXJ2aWNlCiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvcnBjYmluZF8yZXNvY2tldAogICAgICAg
IHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3JwY2JpbmRfMmV0YXJnZXQKICAgICAg
ICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9yc3lzbG9nXzJlc2VydmljZQogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3J1bl8yZGNyZWRlbnRpYWxzXzJk
c3lzdGVtZF81Y3gyZHJlc29sdmVkXzJlc2VydmljZV8yZW1vdW50CiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvcnVuXzJkY3JlZGVudGlhbHNfMmRzeXN0ZW1kXzVjeDJk
c3lzY3RsXzJlc2VydmljZV8yZW1vdW50CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQvcnVuXzJkY3JlZGVudGlhbHNfMmRzeXN0ZW1kXzVjeDJkc3lzdXNlcnNfMmVzZXJ2
aWNlXzJlbW91bnQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9ydW5f
MmRjcmVkZW50aWFsc18yZHN5c3RlbWRfNWN4MmR0bXBmaWxlc181Y3gyZHNldHVwXzJlc2Vydmlj
ZV8yZW1vdW50CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvcnVuXzJk
Y3JlZGVudGlhbHNfMmRzeXN0ZW1kXzVjeDJkdG1wZmlsZXNfNWN4MmRzZXR1cF81Y3gyZGRldl8y
ZXNlcnZpY2VfMmVtb3VudAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0
L3J1bl8yZGluaXRyYW1mc18yZHJvXzJlbW91bnQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9ydW5fMmRpbml0cmFtZnNfMmRyd18yZW1vdW50CiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvcnVuXzJkcG9zdGluc3RzXzJlc2VydmljZQogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3NlcmlhbF8yZGdldHR5XzQwdHR5
UzRfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc2h1
dGRvd25fMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9z
bGljZXNfMmV0YXJnZXQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9z
bHBkXzJkbGl0ZV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC9zb2NrZXRzXzJldGFyZ2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQx
L3VuaXQvc3NpZmJyaWRnZV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lz
dGVtZDEvdW5pdC9zdGFydF8yZGlwa3ZtXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L3N0YXR1c2xlZF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJl
ZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zdG9wXzVmd2F0Y2hkb2dfMmVzZXJ2aWNlCiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3dhcF8yZXRhcmdldAogICAgICAgIHwt
L29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmljZXNfMmRwbGF0Zm9ybV8y
ZGFoYl8yZDFlNjIwMDAwXzJlc3BpXzJkc3BpXzVmbWFzdGVyXzJkc3BpMF8yZHNwaTBfMmUwXzJk
bXRkXzJkbXRkMF8yZG10ZDFfMmRtdGRibG9jazFfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJl
ZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkcGxhdGZvcm1fMmRhaGJfMmQx
ZTYyMDAwMF8yZXNwaV8yZHNwaV81Zm1hc3Rlcl8yZHNwaTBfMmRzcGkwXzJlMF8yZG10ZF8yZG10
ZDBfMmRtdGQyXzJkbXRkYmxvY2syXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9w
L3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkYWhiXzJkMWU2MjAwMDBf
MmVzcGlfMmRzcGlfNWZtYXN0ZXJfMmRzcGkwXzJkc3BpMF8yZTBfMmRtdGRfMmRtdGQwXzJkbXRk
M18yZG10ZGJsb2NrM18yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1k
MS91bml0L3N5c18yZGRldmljZXNfMmRwbGF0Zm9ybV8yZGFoYl8yZDFlNjIwMDAwXzJlc3BpXzJk
c3BpXzVmbWFzdGVyXzJkc3BpMF8yZHNwaTBfMmUwXzJkbXRkXzJkbXRkMF8yZG10ZDRfMmRtdGRi
bG9jazRfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9z
eXNfMmRkZXZpY2VzXzJkcGxhdGZvcm1fMmRhaGJfMmQxZTYyMDAwMF8yZXNwaV8yZHNwaV81Zm1h
c3Rlcl8yZHNwaTBfMmRzcGkwXzJlMF8yZG10ZF8yZG10ZDBfMmRtdGQ1XzJkbXRkYmxvY2s1XzJl
ZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2
aWNlc18yZHBsYXRmb3JtXzJkYWhiXzJkMWU2MjAwMDBfMmVzcGlfMmRzcGlfNWZtYXN0ZXJfMmRz
cGkwXzJkc3BpMF8yZTBfMmRtdGRfMmRtdGQwXzJkbXRkYmxvY2swXzJlZGV2aWNlCiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3Jt
XzJkYWhiXzJkMWU2MjAwMDBfMmVzcGlfMmRzcGlfNWZtYXN0ZXJfMmRzcGkwXzJkc3BpMF8yZTFf
MmRtdGRfMmRtdGQ2XzJkbXRkYmxvY2s2XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNr
dG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkYWhiXzJkMWU2NzAw
MDBfMmVmdGdtYWNfMmRuZXRfMmRldGgwXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNr
dG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkYWhiXzJkMWU2YTAw
MDBfMmV1c2JfNWN4MmR2aHViXzJkMWU2YTAwMDBfMmV1c2JfNWN4MmR2aHViXzNhcDFfMmR1ZGNf
MmQxZTZhMDAwMF8yZXVzYl81Y3gyZHZodWJfM2FwMV8yZWRldmljZQogICAgICAgIHwtL29yZy9m
cmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmljZXNfMmRwbGF0Zm9ybV8yZGFoYl8y
ZDFlNmEwMDAwXzJldXNiXzVjeDJkdmh1Yl8yZDFlNmEwMDAwXzJldXNiXzVjeDJkdmh1Yl8zYXAy
XzJkdWRjXzJkMWU2YTAwMDBfMmV1c2JfNWN4MmR2aHViXzNhcDJfMmVkZXZpY2UKICAgICAgICB8
LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkcGxhdGZvcm1f
MmRhaGJfMmQxZTZhMDAwMF8yZXVzYl81Y3gyZHZodWJfMmQxZTZhMDAwMF8yZXVzYl81Y3gyZHZo
dWJfM2FwM18yZHVkY18yZDFlNmEwMDAwXzJldXNiXzVjeDJkdmh1Yl8zYXAzXzJlZGV2aWNlCiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBs
YXRmb3JtXzJkYWhiXzJkMWU2YTAwMDBfMmV1c2JfNWN4MmR2aHViXzJkMWU2YTAwMDBfMmV1c2Jf
NWN4MmR2aHViXzNhcDRfMmR1ZGNfMmQxZTZhMDAwMF8yZXVzYl81Y3gyZHZodWJfM2FwNF8yZWRl
dmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmlj
ZXNfMmRwbGF0Zm9ybV8yZGFoYl8yZDFlNmEwMDAwXzJldXNiXzVjeDJkdmh1Yl8yZDFlNmEwMDAw
XzJldXNiXzVjeDJkdmh1Yl8zYXA1XzJkdWRjXzJkMWU2YTAwMDBfMmV1c2JfNWN4MmR2aHViXzNh
cDVfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNf
MmRkZXZpY2VzXzJkcGxhdGZvcm1fMmRhaGJfMmQxZTZhMDAwMF8yZXVzYl81Y3gyZHZodWJfMmQx
ZTZhMDAwMF8yZXVzYl81Y3gyZHZodWJfM2FwNl8yZHVkY18yZDFlNmEwMDAwXzJldXNiXzVjeDJk
dmh1Yl8zYXA2XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkYWhiXzJkMWU2YTAwMDBfMmV1c2JfNWN4MmR2
aHViXzJkMWU2YTAwMDBfMmV1c2JfNWN4MmR2aHViXzNhcDdfMmR1ZGNfMmQxZTZhMDAwMF8yZXVz
Yl81Y3gyZHZodWJfM2FwN18yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0
ZW1kMS91bml0L3N5c18yZGRldmljZXNfMmRwbGF0Zm9ybV8yZGFoYl8yZGFoYl8zYWFwYl8yZDFl
NzQwMDAwXzJlc2RjXzJkMWU3NDAxMDBfMmVzZGhjaV8yZGxlZHNfMmRtbWMxXzNhXzNhXzJlZGV2
aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNl
c18yZHBsYXRmb3JtXzJkYWhiXzJkYWhiXzNhYXBiXzJkMWU3NDAwMDBfMmVzZGNfMmQxZTc0MDIw
MF8yZXNkaGNpXzJkbGVkc18yZG1tYzJfM2FfM2FfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJl
ZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkcGxhdGZvcm1fMmRhaGJfMmRh
aGJfM2FhcGJfMmQxZTc1MDAwMF8yZXNkY18yZDFlNzUwMTAwXzJlc2RoY2lfMmRsZWRzXzJkbW1j
MF8zYV8zYV8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0
L3N5c18yZGRldmljZXNfMmRwbGF0Zm9ybV8yZGFoYl8yZGFoYl8zYWFwYl8yZDFlNzg0MDAwXzJl
c2VyaWFsXzJkdHR5XzJkdHR5UzRfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkcGxhdGZvcm1fMmRhaGJfMmRhaGJfM2FhcGJf
MmQxZTc4ZTAwMF8yZXNlcmlhbF8yZHR0eV8yZHR0eVMyXzJlZGV2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkYWhi
XzJkYWhiXzNhYXBiXzJkMWU3OTA1MDBfMmVzZXJpYWxfMmR0dHlfMmR0dHlTMTBfMmVkZXZpY2UK
ICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJk
cGxhdGZvcm1fMmRsZWRzXzJkbGVkc18yZGJtY181ZmlkZW50aWZ5XzJlZGV2aWNlCiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3Jt
XzJkbGVkc18yZGxlZHNfMmRibWNfNWZ2YmF0XzVmcmVhZHlfNWZlbl8yZWRldmljZQogICAgICAg
IHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmljZXNfMmRwbGF0Zm9y
bV8yZGxlZHNfMmRsZWRzXzJkY2hhc3Npc181ZnN0YXR1c181ZnJlZF81Zm9uXzJlZGV2aWNlCiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBs
YXRmb3JtXzJkbGVkc18yZGxlZHNfMmRjcHVfNWZib290XzVmaGVhcnRiZWF0XzJlZGV2aWNlCiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBs
YXRmb3JtXzJkbGVkc18yZGxlZHNfMmRjcHVfNWZvcGVyYXRpb25hbF81ZmhlYXJ0YmVhdF8yZWRl
dmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmlj
ZXNfMmRwbGF0Zm9ybV8yZGxlZHNfMmRsZWRzXzJkcG93ZXJfNWZncGlvXzJlZGV2aWNlCiAgICAg
ICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRm
b3JtXzJkc2VyaWFsODI1MF8yZHR0eV8yZHR0eVMwXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFs
ODI1MF8yZHR0eV8yZHR0eVMxMV8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3N5c18yZGRldmljZXNfMmRwbGF0Zm9ybV8yZHNlcmlhbDgyNTBfMmR0dHlf
MmR0dHlTMTJfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC9zeXNfMmRkZXZpY2VzXzJkcGxhdGZvcm1fMmRzZXJpYWw4MjUwXzJkdHR5XzJkdHR5UzEzXzJl
ZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2
aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFsODI1MF8yZHR0eV8yZHR0eVMxNF8yZWRldmljZQogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmljZXNfMmRwbGF0
Zm9ybV8yZHNlcmlhbDgyNTBfMmR0dHlfMmR0dHlTMTVfMmVkZXZpY2UKICAgICAgICB8LS9vcmcv
ZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkcGxhdGZvcm1fMmRzZXJp
YWw4MjUwXzJkdHR5XzJkdHR5UzE2XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9w
L3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFsODI1MF8yZHR0
eV8yZHR0eVMxXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFsODI1MF8yZHR0eV8yZHR0eVMzXzJl
ZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2
aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFsODI1MF8yZHR0eV8yZHR0eVM1XzJlZGV2aWNlCiAgICAg
ICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRm
b3JtXzJkc2VyaWFsODI1MF8yZHR0eV8yZHR0eVM2XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFs
ODI1MF8yZHR0eV8yZHR0eVM3XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5
c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFsODI1MF8yZHR0eV8y
ZHR0eVM4XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQv
c3lzXzJkZGV2aWNlc18yZHBsYXRmb3JtXzJkc2VyaWFsODI1MF8yZHR0eV8yZHR0eVM5XzJlZGV2
aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNl
c18yZHZpcnR1YWxfMmRibG9ja18yZHJhbTBfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkdmlydHVhbF8yZGJsb2NrXzJkcmFt
MTBfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNf
MmRkZXZpY2VzXzJkdmlydHVhbF8yZGJsb2NrXzJkcmFtMTFfMmVkZXZpY2UKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkdmlydHVhbF8yZGJs
b2NrXzJkcmFtMTJfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC9zeXNfMmRkZXZpY2VzXzJkdmlydHVhbF8yZGJsb2NrXzJkcmFtMTNfMmVkZXZpY2UKICAg
ICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkdmly
dHVhbF8yZGJsb2NrXzJkcmFtMTRfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkdmlydHVhbF8yZGJsb2NrXzJkcmFtMTVfMmVk
ZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZp
Y2VzXzJkdmlydHVhbF8yZGJsb2NrXzJkcmFtMV8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVl
ZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmljZXNfMmR2aXJ0dWFsXzJkYmxvY2tfMmRy
YW0yXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lz
XzJkZGV2aWNlc18yZHZpcnR1YWxfMmRibG9ja18yZHJhbTNfMmVkZXZpY2UKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkdmlydHVhbF8yZGJs
b2NrXzJkcmFtNF8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91
bml0L3N5c18yZGRldmljZXNfMmR2aXJ0dWFsXzJkYmxvY2tfMmRyYW01XzJlZGV2aWNlCiAgICAg
ICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHZpcnR1
YWxfMmRibG9ja18yZHJhbTZfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lz
dGVtZDEvdW5pdC9zeXNfMmRkZXZpY2VzXzJkdmlydHVhbF8yZGJsb2NrXzJkcmFtN18yZWRldmlj
ZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGRldmljZXNf
MmR2aXJ0dWFsXzJkYmxvY2tfMmRyYW04XzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNr
dG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHZpcnR1YWxfMmRibG9ja18yZHJhbTlf
MmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRk
ZXZpY2VzXzJkdmlydHVhbF8yZG5ldF8yZGJvbmQwXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkZGV2aWNlc18yZHZpcnR1YWxfMmRuZXRfMmRz
aXQwXzJlZGV2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lz
XzJkZnNfMmRmdXNlXzJkY29ubmVjdGlvbnNfMmVtb3VudAogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L3N5c18yZGtlcm5lbF8yZGNvbmZpZ18yZW1vdW50CiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJka2VybmVsXzJkZGVidWdfMmR0
cmFjaW5nXzJlbW91bnQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9z
eXNfMmRrZXJuZWxfMmRkZWJ1Z18yZW1vdW50CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5
c3RlbWQxL3VuaXQvc3lzXzJka2VybmVsXzJkdHJhY2luZ18yZW1vdW50CiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkbW9kdWxlXzJkY29uZmlnZnNfMmVkZXZp
Y2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRzdWJzeXN0
ZW1fMmRuZXRfMmRkZXZpY2VzXzJkYm9uZDBfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC9zeXNfMmRzdWJzeXN0ZW1fMmRuZXRfMmRkZXZpY2VzXzJkZXRo
MF8yZWRldmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c18y
ZHN1YnN5c3RlbV8yZG5ldF8yZGRldmljZXNfMmRldGgxXzJlZGV2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzXzJkc3Vic3lzdGVtXzJkbmV0XzJkZGV2aWNl
c18yZHNpdDBfMmVkZXZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC9zeXNpbml0XzJldGFyZ2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvc3lzbG9nXzJlc29ja2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvc3lzbG9nXzJldGFyZ2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvc3lzdGVtXzJkZHJvcGJlYXJfMmVzbGljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3N5c3RlbV8yZGdldHR5XzJlc2xpY2UKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1fMmRob3N0bG9nZ2VyXzJlc2xpY2UKICAgICAgICB8
LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1fMmRtYXBwZXJfNWN4MmR3YWl0
XzJlc2xpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1f
MmRtb2Rwcm9iZV8yZXNsaWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQvc3lzdGVtXzJkb2JtY181Y3gyZGNvbnNvbGVfMmVzbGljZQogICAgICAgIHwtL29yZy9mcmVl
ZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbV8yZG9ibWNfNWN4MmRjb25zb2xlXzVjeDJkc3No
XzJlc2xpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1f
MmRvYm1jXzVjeDJkbGVkXzVjeDJkZ3JvdXBfNWN4MmRzdGFydF8yZXNsaWNlCiAgICAgICAgfC0v
b3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtXzJkb2JtY181Y3gyZGxlZF81Y3gy
ZGdyb3VwXzVjeDJkc3RvcF8yZXNsaWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQvc3lzdGVtXzJkcGhvc3Bob3JfNWN4MmRjZXJ0aWZpY2F0ZV81Y3gyZG1hbmFnZXJf
MmVzbGljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbV8y
ZHBob3NwaG9yXzVjeDJkaXBtaV81Y3gyZGtjc18yZXNsaWNlCiAgICAgICAgfC0vb3JnL2ZyZWVk
ZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtXzJkcGhvc3Bob3JfNWN4MmRpcG1pXzVjeDJkbmV0
XzJlc2xpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1f
MmRzZXJpYWxfNWN4MmRnZXR0eV8yZXNsaWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5
c3RlbWQxL3VuaXQvc3lzdGVtXzJkc3lzdGVtZF81Y3gyZGNvcmVkdW1wXzJlc2xpY2UKICAgICAg
ICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1fMmR4eXpfMmVvcGVuYm1j
XzVmcHJvamVjdF8yZUNoYXNzaXNfMmVDb250cm9sXzJlUG93ZXJfMmVzbGljZQogICAgICAgIHwt
L29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbV8yZHh5el8yZW9wZW5ibWNfNWZw
cm9qZWN0XzJlSHdtb25fMmVzbGljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1k
MS91bml0L3N5c3RlbV8yZHh5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlU3RhdGVfMmVCb290XzJl
UG9zdENvZGVfMmVzbGljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0
L3N5c3RlbV8yZHh5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlbGVkXzJlY29udHJvbGxlcl8yZXNs
aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtXzJlc2xp
Y2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkYXNr
XzJkcGFzc3dvcmRfMmRjb25zb2xlXzJlcGF0aAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3N5c3RlbWRfMmRhc2tfMmRwYXNzd29yZF8yZGNvbnNvbGVfMmVzZXJ2aWNl
CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtZF8yZGFza18y
ZHBhc3N3b3JkXzJkd2FsbF8yZXBhdGgKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVt
ZDEvdW5pdC9zeXN0ZW1kXzJkYXNrXzJkcGFzc3dvcmRfMmR3YWxsXzJlc2VydmljZQogICAgICAg
IHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmRjb3JlZHVtcF8yZXNv
Y2tldAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmRj
b3JlZHVtcF80MDEzXzJkMTk5MjNfMmQwXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmRmc2NrXzJkcm9vdF8yZXNlcnZpY2UKICAgICAg
ICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkaG9zdG5hbWVkXzJl
c2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRf
MmRod2RiXzJkdXBkYXRlXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0
ZW1kMS91bml0L3N5c3RlbWRfMmRqb3VybmFsXzJkY2F0YWxvZ18yZHVwZGF0ZV8yZXNlcnZpY2UK
ICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkam91cm5h
bF8yZGZsdXNoXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91
bml0L3N5c3RlbWRfMmRqb3VybmFsZF8yZGF1ZGl0XzJlc29ja2V0CiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtZF8yZGpvdXJuYWxkXzJkZGV2XzJkbG9nXzJl
c29ja2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtZF8y
ZGpvdXJuYWxkXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91
bml0L3N5c3RlbWRfMmRqb3VybmFsZF8yZXNvY2tldAogICAgICAgIHwtL29yZy9mcmVlZGVza3Rv
cC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmRtYWNoaW5lXzJkaWRfMmRjb21taXRfMmVzZXJ2aWNl
CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtZF8yZG1vZHVs
ZXNfMmRsb2FkXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91
bml0L3N5c3RlbWRfMmRuZXR3b3JrXzJkZ2VuZXJhdG9yXzJlc2VydmljZQogICAgICAgIHwtL29y
Zy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmRuZXR3b3JrZF8yZHdhaXRfMmRv
bmxpbmVfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQv
c3lzdGVtZF8yZG5ldHdvcmtkXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3N5c3RlbWRfMmRuZXR3b3JrZF8yZXNvY2tldAogICAgICAgIHwtL29yZy9m
cmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmRwc3RvcmVfMmVzZXJ2aWNlCiAgICAg
ICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtZF8yZHJhbmRvbV8yZHNl
ZWRfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lz
dGVtZF8yZHJlbW91bnRfMmRmc18yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkcmVzb2x2ZWRfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtZF8yZHN5c2N0bF8yZXNlcnZpY2UKICAg
ICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkc3lzdXNlcnNf
MmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVt
ZF8yZHRpbWVkYXRlZF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVt
ZDEvdW5pdC9zeXN0ZW1kXzJkdGltZXN5bmNkXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVl
ZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmR0bXBmaWxlc18yZGNsZWFuXzJlc2Vydmlj
ZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3RlbWRfMmR0bXBm
aWxlc18yZGNsZWFuXzJldGltZXIKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC9zeXN0ZW1kXzJkdG1wZmlsZXNfMmRzZXR1cF8yZGRldl8yZXNlcnZpY2UKICAgICAgICB8
LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkdG1wZmlsZXNfMmRzZXR1
cF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0
ZW1kXzJkdWRldl8yZHNldHRsZV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkdWRldl8yZHRyaWdnZXJfMmVzZXJ2aWNlCiAgICAgICAg
fC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvc3lzdGVtZF8yZHVkZXZkXzJkY29udHJv
bF8yZXNvY2tldAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3N5c3Rl
bWRfMmR1ZGV2ZF8yZGtlcm5lbF8yZXNvY2tldAogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3N5c3RlbWRfMmR1ZGV2ZF8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJl
ZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkdXBkYXRlXzJkZG9uZV8yZXNlcnZpY2UK
ICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9zeXN0ZW1kXzJkdXNlcl8y
ZHNlc3Npb25zXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91
bml0L3N5c3RlbWRfMmR2Y29uc29sZV8yZHNldHVwXzJlc2VydmljZQogICAgICAgIHwtL29yZy9m
cmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3RpbWVfMmRzZXRfMmV0YXJnZXQKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC90aW1lXzJkc3luY18yZXRhcmdldAogICAgICAg
IHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3RpbWVyc18yZXRhcmdldAogICAgICAg
IHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3RtcF8yZW1vdW50CiAgICAgICAgfC0v
b3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvdHJhY2VfMmRlbmFibGVfMmVzZXJ2aWNlCiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvdW1vdW50XzJldGFyZ2V0CiAg
ICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvdXNiXzJkZ2FkZ2V0XzJldGFy
Z2V0CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQvdmFyXzJkdm9sYXRp
bGVfMmRjYWNoZV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC92YXJfMmR2b2xhdGlsZV8yZGxpYl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC92YXJfMmR2b2xhdGlsZV8yZHNwb29sXzJlc2VydmljZQogICAg
ICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3Zhcl8yZHZvbGF0aWxlXzJkc3J2
XzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3Zhcl8y
ZHZvbGF0aWxlXzJlbW91bnQKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5p
dC92YmF0XzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0
L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlQ2hhc3Npc18yZUNvbnRyb2xfMmVQb3dlcl80MDBf
MmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJl
b3BlbmJtY181ZnByb2plY3RfMmVEdW1wXzJlTWFuYWdlcl8yZXNlcnZpY2UKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVmcHJvamVjdF8yZUVu
dGl0eU1hbmFnZXJfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQx
L3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVGcnVEZXZpY2VfMmVzZXJ2aWNlCiAgICAg
ICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2pl
Y3RfMmVJbnZlbnRvcnlfMmVNYW5hZ2VyXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlTEVEXzJlR3JvdXBN
YW5hZ2VyXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0
L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlTGRhcF8yZUNvbmZpZ18yZXNlcnZpY2UKICAgICAg
ICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVmcHJvamVj
dF8yZUxvZ2dpbmdfMmVJUE1JXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlTG9nZ2luZ18yZXNlcnZpY2UK
ICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVm
cHJvamVjdF8yZU5ldHdvcmtfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5
c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVPYmplY3RNYXBwZXJfMmVzZXJ2
aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJt
Y181ZnByb2plY3RfMmVTZXR0aW5nc18yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0
b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVmcHJvamVjdF8yZVNvZnR3YXJlXzJlQk1D
XzJlVXBkYXRlcl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEv
dW5pdC94eXpfMmVvcGVuYm1jXzVmcHJvamVjdF8yZVNvZnR3YXJlXzJlRG93bmxvYWRfMmVzZXJ2
aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJt
Y181ZnByb2plY3RfMmVTb2Z0d2FyZV8yZVN5bmNfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2Zy
ZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVTb2Z0d2Fy
ZV8yZVZlcnNpb25fMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQx
L3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVTdGF0ZV8yZUJNQ18yZXNlcnZpY2UKICAg
ICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVmcHJv
amVjdF8yZVN0YXRlXzJlQm9vdF8yZVBvc3RDb2RlXzQwMF8yZXNlcnZpY2UKICAgICAgICB8LS9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVmcHJvamVjdF8yZVN0
YXRlXzJlQ2hhc3Npc180MDBfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5
c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVTeXNsb2dfMmVDb25maWdfMmVz
ZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3Bl
bmJtY181ZnByb2plY3RfMmVUZWxlbWV0cnlfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVk
ZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVUaW1lXzJlTWFu
YWdlcl8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94
eXpfMmVvcGVuYm1jXzVmcHJvamVjdF8yZVVzZXJfMmVNYW5hZ2VyXzJlc2VydmljZQogICAgICAg
IHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0
XzJlYWRjc2Vuc29yXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1k
MS91bml0L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlZXhpdGFpcnNlbnNvcl8yZXNlcnZpY2UK
ICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVm
cHJvamVjdF8yZWV4dGVybmFsc2Vuc29yXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVz
a3RvcC9zeXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlZmFuc2Vuc29yXzJl
c2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3h5el8yZW9w
ZW5ibWNfNWZwcm9qZWN0XzJlaHdtb250ZW1wc2Vuc29yXzJlc2VydmljZQogICAgICAgIHwtL29y
Zy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlaW50
ZWxjcHVzZW5zb3JfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQx
L3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVpbnRydXNpb25zZW5zb3JfMmVzZXJ2aWNl
CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181
ZnByb2plY3RfMmVsZWRfMmVjb250cm9sbGVyXzQwc3lzXzJkY2xhc3NfMmRsZWRzXzJkYm1jXzVm
aWRlbnRpZnlfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3Vu
aXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVsZWRfMmVjb250cm9sbGVyXzQwc3lzXzJkY2xh
c3NfMmRsZWRzXzJkYm1jXzVmdmJhdF81ZnJlYWR5XzVmZW5fMmVzZXJ2aWNlCiAgICAgICAgfC0v
b3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVs
ZWRfMmVjb250cm9sbGVyXzQwc3lzXzJkY2xhc3NfMmRsZWRzXzJkY2hhc3Npc181ZnN0YXR1c181
ZmdyZWVuXzVmYmxpbmtfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVsZWRfMmVjb250cm9sbGVyXzQwc3lz
XzJkY2xhc3NfMmRsZWRzXzJkY2hhc3Npc181ZnN0YXR1c181ZnJlZF81Zm9uXzJlc2VydmljZQog
ICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNfNWZw
cm9qZWN0XzJlbGVkXzJlY29udHJvbGxlcl80MHN5c18yZGNsYXNzXzJkbGVkc18yZGNwdV81ZmJv
b3RfNWZoZWFydGJlYXRfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3Rl
bWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVsZWRfMmVjb250cm9sbGVyXzQwc3lz
XzJkY2xhc3NfMmRsZWRzXzJkY3B1XzVmb3BlcmF0aW9uYWxfNWZoZWFydGJlYXRfMmVzZXJ2aWNl
CiAgICAgICAgfC0vb3JnL2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181
ZnByb2plY3RfMmVsZWRfMmVjb250cm9sbGVyXzQwc3lzXzJkY2xhc3NfMmRsZWRzXzJkbW1jMF8z
YV8zYV8yZXNlcnZpY2UKICAgICAgICB8LS9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC94
eXpfMmVvcGVuYm1jXzVmcHJvamVjdF8yZWxlZF8yZWNvbnRyb2xsZXJfNDBzeXNfMmRjbGFzc18y
ZGxlZHNfMmRtbWMxXzNhXzNhXzJlc2VydmljZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9z
eXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNfNWZwcm9qZWN0XzJlbGVkXzJlY29udHJvbGxlcl80
MHN5c18yZGNsYXNzXzJkbGVkc18yZG1tYzJfM2FfM2FfMmVzZXJ2aWNlCiAgICAgICAgfC0vb3Jn
L2ZyZWVkZXNrdG9wL3N5c3RlbWQxL3VuaXQveHl6XzJlb3BlbmJtY181ZnByb2plY3RfMmVsZWRf
MmVjb250cm9sbGVyXzQwc3lzXzJkY2xhc3NfMmRsZWRzXzJkcG93ZXJfNWZncGlvXzJlc2Vydmlj
ZQogICAgICAgIHwtL29yZy9mcmVlZGVza3RvcC9zeXN0ZW1kMS91bml0L3h5el8yZW9wZW5ibWNf
NWZwcm9qZWN0XzJlbWN1dGVtcHNlbnNvcl8yZXNlcnZpY2UKICAgICAgICBgLS9vcmcvZnJlZWRl
c2t0b3Avc3lzdGVtZDEvdW5pdC94eXpfMmVvcGVuYm1jXzVmcHJvamVjdF8yZXBzdXNlbnNvcl8y
ZXNlcnZpY2UKClNlcnZpY2Ugb3JnLmZyZWVkZXNrdG9wLnRpbWVkYXRlMToKYC0vb3JnCiAgYC0v
b3JnL2ZyZWVkZXNrdG9wCiAgICB8LS9vcmcvZnJlZWRlc2t0b3AvTG9nQ29udHJvbDEKICAgIGAt
L29yZy9mcmVlZGVza3RvcC90aW1lZGF0ZTEKClNlcnZpY2Ugb3JnLmZyZWVkZXNrdG9wLnRpbWVz
eW5jMToKYC0vb3JnCiAgYC0vb3JnL2ZyZWVkZXNrdG9wCiAgICB8LS9vcmcvZnJlZWRlc2t0b3Av
TG9nQ29udHJvbDEKICAgIGAtL29yZy9mcmVlZGVza3RvcC90aW1lc3luYzEKClNlcnZpY2Ugb3Jn
Lm9wZW5ibWMuSG9zdElwbWk6CmAtL29yZwogIGAtL29yZy9vcGVuYm1jCiAgICBgLS9vcmcvb3Bl
bmJtYy9Ib3N0SXBtaQogICAgICBgLS9vcmcvb3BlbmJtYy9Ib3N0SXBtaS8xCgpTZXJ2aWNlIHh5
ei5vcGVuYm1jX3Byb2plY3QuQURDU2Vuc29yOgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9q
ZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMKClNlcnZpY2UgeHl6Lm9wZW5i
bWNfcHJvamVjdC5DZXJ0cy5NYW5hZ2VyLkF1dGhvcml0eS5MZGFwOgpgLS94eXoKICBgLS94eXov
b3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2NlcnRzCiAgICAgIGAt
L3h5ei9vcGVuYm1jX3Byb2plY3QvY2VydHMvYXV0aG9yaXR5CiAgICAgICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9jZXJ0cy9hdXRob3JpdHkvbGRhcAoKU2VydmljZSB4eXoub3BlbmJtY19wcm9q
ZWN0LkNlcnRzLk1hbmFnZXIuQ2xpZW50LkxkYXA6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3By
b2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvY2VydHMKICAgICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9jZXJ0cy9jbGllbnQKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2Nl
cnRzL2NsaWVudC9sZGFwCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuQ2VydHMuTWFuYWdl
ci5TZXJ2ZXIuSHR0cHM6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5
ei9vcGVuYm1jX3Byb2plY3QvY2VydHMKICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9jZXJ0
cy9zZXJ2ZXIKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2NlcnRzL3NlcnZlci9odHRw
cwogICAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9jZXJ0cy9zZXJ2ZXIvaHR0cHMvMQoK
U2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnNvbGUuZGVmYXVsdDoKYC0veHl6CiAgYC0v
eHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9jb25zb2xlCiAg
ICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvY29uc29sZS9kZWZhdWx0CgpTZXJ2aWNlIHh5ei5v
cGVuYm1jX3Byb2plY3QuQ29udHJvbC5Ib3N0OgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9q
ZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2NvbnRyb2wKICAgICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9jb250cm9sL2hvc3QwCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuRHVt
cC5NYW5hZ2VyOgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3Bl
bmJtY19wcm9qZWN0L2R1bXAKICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYwog
ICAgICB8IGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9ibWMvZW50cnkKICAgICAgfCAgIHwt
L3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9ibWMvZW50cnkvMQogICAgICB8ICAgfC0veHl6L29w
ZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS8xMAogICAgICB8ICAgfC0veHl6L29wZW5ibWNf
cHJvamVjdC9kdW1wL2JtYy9lbnRyeS8xMQogICAgICB8ICAgfC0veHl6L29wZW5ibWNfcHJvamVj
dC9kdW1wL2JtYy9lbnRyeS8xMgogICAgICB8ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1w
L2JtYy9lbnRyeS8xMwogICAgICB8ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9l
bnRyeS8xNAogICAgICB8ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS8x
NQogICAgICB8ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS8xNgogICAg
ICB8ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS8xNwogICAgICB8ICAg
fC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS8xOAogICAgICB8ICAgfC0veHl6
L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS8xOQogICAgICB8ICAgfC0veHl6L29wZW5i
bWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS8yCiAgICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9q
ZWN0L2R1bXAvYm1jL2VudHJ5LzIwCiAgICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2R1
bXAvYm1jL2VudHJ5LzIxCiAgICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvYm1j
L2VudHJ5LzIyCiAgICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvYm1jL2VudHJ5
LzIzCiAgICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvYm1jL2VudHJ5LzI0CiAg
ICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvYm1jL2VudHJ5LzI1CiAgICAgIHwg
ICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvYm1jL2VudHJ5LzMKICAgICAgfCAgIHwtL3h5
ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9ibWMvZW50cnkvNAogICAgICB8ICAgfC0veHl6L29wZW5i
bWNfcHJvamVjdC9kdW1wL2JtYy9lbnRyeS81CiAgICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9q
ZWN0L2R1bXAvYm1jL2VudHJ5LzYKICAgICAgfCAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvZHVt
cC9ibWMvZW50cnkvNwogICAgICB8ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2JtYy9l
bnRyeS84CiAgICAgIHwgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvYm1jL2VudHJ5LzkK
ICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2ZhdWx0bG9nCiAgICAgIGAtL3h5ei9v
cGVuYm1jX3Byb2plY3QvZHVtcC9pbnRlcm5hbAogICAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvZHVtcC9pbnRlcm5hbC9tYW5hZ2VyCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuRW50
aXR5TWFuYWdlcjoKRmFpbGVkIHRvIGludHJvc3BlY3Qgb2JqZWN0IC8gb2Ygc2VydmljZSB4eXou
b3BlbmJtY19wcm9qZWN0LkVudGl0eU1hbmFnZXI6IFJlbW90ZSBwZWVyIGRpc2Nvbm5lY3RlZApO
byBvYmplY3RzIGRpc2NvdmVyZWQuCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuRXhpdEFp
clRlbXBTZW5zb3I6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5ei9v
cGVuYm1jX3Byb2plY3Qvc2Vuc29ycwoKU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0LkV4dGVy
bmFsU2Vuc29yOgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3Bl
bmJtY19wcm9qZWN0L3NlbnNvcnMKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5GYW5TZW5z
b3I6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIHwtL3h5ei9vcGVuYm1jX3By
b2plY3QvY29udHJvbAogICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkKICAgIGAt
L3h5ei9vcGVuYm1jX3Byb2plY3Qvc2Vuc29ycwoKU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0
LkZydURldmljZToKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29w
ZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UKICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVE
ZXZpY2UvMTJfODAKICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvMTJfODEK
ICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvMTJfODYKICAgICAgfC0veHl6
L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvMTJfODkKICAgICAgfC0veHl6L29wZW5ibWNfcHJv
amVjdC9GcnVEZXZpY2UvVklDU1I0NTFBTQogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L0Zy
dURldmljZS9WSUNTUjQ1MUFNXzAKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5Id21vbi5l
eHRlcm5hbDoKRmFpbGVkIHRvIGludHJvc3BlY3Qgb2JqZWN0IC8gb2Ygc2VydmljZSB4eXoub3Bl
bmJtY19wcm9qZWN0Lkh3bW9uLmV4dGVybmFsOiBVbmtub3duIG9iamVjdCAnLycuCk5vIG9iamVj
dHMgZGlzY292ZXJlZC4KClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5Id21vblRlbXBTZW5z
b3I6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3By
b2plY3Qvc2Vuc29ycwoKU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0LkludGVsQ1BVU2Vuc29y
OgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9q
ZWN0L3NlbnNvcnMKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5JbnRydXNpb25TZW5zb3I6
CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvQ2hhc3NpcwoKU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5NYW5hZ2Vy
OgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9q
ZWN0L2ludmVudG9yeQogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0
ZW0KClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5JcG1pLkNoYW5uZWwuZXRoMDoKYC0veHl6
CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9pcG1p
CiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvaXBtaS9zZXNzaW9uCiAgICAgICAgYC0veHl6
L29wZW5ibWNfcHJvamVjdC9pcG1pL3Nlc3Npb24vZXRoMAogICAgICAgICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9pcG1pL3Nlc3Npb24vZXRoMC8wCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2pl
Y3QuSXBtaS5DaGFubmVsLmlwbWlfa2NzMToKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVj
dAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pCiAgICAgIGAtL3h5ei9vcGVuYm1jX3By
b2plY3QvSXBtaS9DaGFubmVsCiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pL0No
YW5uZWwvaXBtaV9rY3MxCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuSXBtaS5DaGFubmVs
LmlwbWlfa2NzMjoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29w
ZW5ibWNfcHJvamVjdC9JcG1pCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvSXBtaS9DaGFu
bmVsCiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pL0NoYW5uZWwvaXBtaV9rY3My
CgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuSXBtaS5DaGFubmVsLmlwbWlfa2NzMzoKYC0v
eHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9J
cG1pCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvSXBtaS9DaGFubmVsCiAgICAgICAgYC0v
eHl6L29wZW5ibWNfcHJvamVjdC9JcG1pL0NoYW5uZWwvaXBtaV9rY3MzCgpTZXJ2aWNlIHh5ei5v
cGVuYm1jX3Byb2plY3QuSXBtaS5DaGFubmVsLmlwbWlfa2NzNDoKYC0veHl6CiAgYC0veHl6L29w
ZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pCiAgICAgIGAtL3h5
ei9vcGVuYm1jX3Byb2plY3QvSXBtaS9DaGFubmVsCiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJv
amVjdC9JcG1pL0NoYW5uZWwvaXBtaV9rY3M0CgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3Qu
SXBtaS5DaGFubmVsLmlwbWlfa2NzNToKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAog
ICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvSXBtaS9DaGFubmVsCiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pL0NoYW5u
ZWwvaXBtaV9rY3M1CgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuSXBtaS5DaGFubmVsLmlw
bWlfa2NzNjoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9JcG1pCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvSXBtaS9DaGFubmVs
CiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pL0NoYW5uZWwvaXBtaV9rY3M2CgpT
ZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuSXBtaS5DaGFubmVsLmlwbWlfa2NzNzoKYC0veHl6
CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1p
CiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvSXBtaS9DaGFubmVsCiAgICAgICAgYC0veHl6
L29wZW5ibWNfcHJvamVjdC9JcG1pL0NoYW5uZWwvaXBtaV9rY3M3CgpTZXJ2aWNlIHh5ei5vcGVu
Ym1jX3Byb2plY3QuSXBtaS5DaGFubmVsLmlwbWlfa2NzODoKYC0veHl6CiAgYC0veHl6L29wZW5i
bWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pCiAgICAgIGAtL3h5ei9v
cGVuYm1jX3Byb2plY3QvSXBtaS9DaGFubmVsCiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVj
dC9JcG1pL0NoYW5uZWwvaXBtaV9rY3M4CgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuSXBt
aS5DaGFubmVsLmlwbWlfc3NpZjoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAg
YC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3Qv
SXBtaS9DaGFubmVsCiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9JcG1pL0NoYW5uZWwv
aXBtaV9zc2lmCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuSXBtaS5Ib3N0OgpgLS94eXoK
ICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L0lwbWkK
ClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5MRUQuQ29udHJvbGxlci5ibWNfaWRlbnRpZnk6
CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvbGVkCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVkL3BoeXNpY2FsCiAgICAgICAg
YC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvcGh5c2ljYWwvYm1jX2lkZW50aWZ5CgpTZXJ2aWNl
IHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkNvbnRyb2xsZXIuYm1jX3ZiYXRfcmVhZHlfZW46CmAt
L3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3Qv
bGVkCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVkL3BoeXNpY2FsCiAgICAgICAgYC0v
eHl6L29wZW5ibWNfcHJvamVjdC9sZWQvcGh5c2ljYWwvYm1jX3ZiYXRfcmVhZHlfZW4KClNlcnZp
Y2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5MRUQuQ29udHJvbGxlci5jaGFzc2lzX3N0YXR1c19ncmVl
bl9ibGluazoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9sZWQKICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvcGh5c2ljYWwK
ICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9waHlzaWNhbC9jaGFzc2lzX3N0YXR1
c19ncmVlbl9ibGluawoKU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Db250cm9sbGVy
LmNoYXNzaXNfc3RhdHVzX3JlZF9vbjoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAog
ICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQKICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVj
dC9sZWQvcGh5c2ljYWwKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9waHlzaWNh
bC9jaGFzc2lzX3N0YXR1c19yZWRfb24KClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5MRUQu
Q29udHJvbGxlci5jcHVfYm9vdF9oZWFydGJlYXQ6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3By
b2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVkCiAgICAgIGAtL3h5ei9vcGVuYm1j
X3Byb2plY3QvbGVkL3BoeXNpY2FsCiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQv
cGh5c2ljYWwvY3B1X2Jvb3RfaGVhcnRiZWF0CgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3Qu
TEVELkNvbnRyb2xsZXIuY3B1X29wZXJhdGlvbmFsX2hlYXJ0YmVhdDoKYC0veHl6CiAgYC0veHl6
L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQKICAgICAgYC0v
eHl6L29wZW5ibWNfcHJvamVjdC9sZWQvcGh5c2ljYWwKICAgICAgICBgLS94eXovb3BlbmJtY19w
cm9qZWN0L2xlZC9waHlzaWNhbC9jcHVfb3BlcmF0aW9uYWxfaGVhcnRiZWF0CgpTZXJ2aWNlIHh5
ei5vcGVuYm1jX3Byb2plY3QuTEVELkNvbnRyb2xsZXIubW1jMDoKYC0veHl6CiAgYC0veHl6L29w
ZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQKICAgICAgYC0veHl6
L29wZW5ibWNfcHJvamVjdC9sZWQvcGh5c2ljYWwKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9q
ZWN0L2xlZC9waHlzaWNhbC9tbWMwCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkNv
bnRyb2xsZXIubW1jMToKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6
L29wZW5ibWNfcHJvamVjdC9sZWQKICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvcGh5
c2ljYWwKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9waHlzaWNhbC9tbWMxCgpT
ZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkNvbnRyb2xsZXIubW1jMjoKYC0veHl6CiAg
YC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQKICAg
ICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvcGh5c2ljYWwKICAgICAgICBgLS94eXovb3Bl
bmJtY19wcm9qZWN0L2xlZC9waHlzaWNhbC9tbWMyCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2pl
Y3QuTEVELkNvbnRyb2xsZXIucG93ZXJfZ3BpbzoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJv
amVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQKICAgICAgYC0veHl6L29wZW5ibWNf
cHJvamVjdC9sZWQvcGh5c2ljYWwKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9w
aHlzaWNhbC9wb3dlcl9ncGlvCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuTEVELkdyb3Vw
TWFuYWdlcjoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9sZWQKICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzCiAg
ICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL2JtY19ib290ZWQKICAgICAg
ICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9ncm91cHMvZW5jbG9zdXJlX2ZhdWx0CiAgICAg
ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL2VuY2xvc3VyZV9pZGVudGlmeQog
ICAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvbGVkL2dyb3Vwcy9mYW5fZmF1bHQKICAgICAg
ICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2xlZC9ncm91cHMvZmFuX2lkZW50aWZ5CiAgICAgICAg
fC0veHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL2xhbXBfdGVzdAogICAgICAgIGAtL3h5
ei9vcGVuYm1jX3Byb2plY3QvbGVkL2dyb3Vwcy9wb3dlcl9vbgoKU2VydmljZSB4eXoub3BlbmJt
Y19wcm9qZWN0LkxkYXAuQ29uZmlnOgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAg
ICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3VzZXIKICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVj
dC91c2VyL2xkYXAKICAgICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L3VzZXIvbGRhcC9hY3Rp
dmVfZGlyZWN0b3J5CiAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC91c2VyL2xkYXAvb3Bl
bmxkYXAKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5Mb2dnaW5nOgpgLS94eXoKICBgLS94
eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xvZ2dpbmcKICAg
ICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9sb2dnaW5nL2VudHJ5CiAgICAgIHwgfC0veHl6L29w
ZW5ibWNfcHJvamVjdC9sb2dnaW5nL2VudHJ5LzEKICAgICAgfCBgLS94eXovb3BlbmJtY19wcm9q
ZWN0L2xvZ2dpbmcvZW50cnkvMgogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xvZ2dpbmcv
aW50ZXJuYWwKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xvZ2dpbmcvaW50ZXJuYWwv
bWFuYWdlcgoKU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0LkxvZ2dpbmcuSVBNSToKYC0veHl6
CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9Mb2dn
aW5nCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvTG9nZ2luZy9JUE1JCgpTZXJ2aWNlIHh5
ei5vcGVuYm1jX3Byb2plY3QuTUNVVGVtcFNlbnNvcjoKRmFpbGVkIHRvIGludHJvc3BlY3Qgb2Jq
ZWN0IC8gb2Ygc2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0Lk1DVVRlbXBTZW5zb3I6IFRoZSBu
YW1lIGlzIG5vdCBhY3RpdmF0YWJsZQpObyBvYmplY3RzIGRpc2NvdmVyZWQuCgpTZXJ2aWNlIHh5
ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yazoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVj
dAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrCiAgICAgIHwtL3h5ei9vcGVuYm1j
X3Byb2plY3QvbmV0d29yay9ib25kMAogICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L25ldHdv
cmsvY29uZmlnCiAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9kaGNwCiAgICAg
IGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgwCiAgICAgICAgfC0veHl6L29wZW5i
bWNfcHJvamVjdC9uZXR3b3JrL2V0aDAvXzMxOTJfMmUxNjhfMmUwXzJlMTEwXzJmMjQKICAgICAg
ICBgLS94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMC9fNjZlODBfM2FfM2E0ODllXzNh
NTRmZl8zYWZlMWVfM2E3ZjE1XzJmNjQKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5PYmpl
Y3RNYXBwZXI6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIHwtL3h5ei9vcGVu
Ym1jX3Byb2plY3Qvb2JqZWN0X21hcHBlcgogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0
d2FyZQogICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlLzMyZjRkMmE2CiAgICAg
IHwgYC0veHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0d2FyZS8zMmY0ZDJhNi9zb2Z0d2FyZV92ZXJz
aW9uCiAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUvYWN0aXZlCiAgICAgIHwt
L3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUvZnVuY3Rpb25hbAogICAgICBgLS94eXovb3Bl
bmJtY19wcm9qZWN0L3NvZnR3YXJlL3VwZGF0ZWFibGUKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJv
amVjdC5QU1VTZW5zb3I6CkZhaWxlZCB0byBpbnRyb3NwZWN0IG9iamVjdCAvIG9mIHNlcnZpY2Ug
eHl6Lm9wZW5ibWNfcHJvamVjdC5QU1VTZW5zb3I6IFRoZSBuYW1lIGlzIG5vdCBhY3RpdmF0YWJs
ZQpObyBvYmplY3RzIGRpc2NvdmVyZWQuCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuU2V0
dGluZ3M6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIHwtL3h5ei9vcGVuYm1j
X3Byb2plY3QvY29udHJvbAogICAgfCB8LS94eXovb3BlbmJtY19wcm9qZWN0L2NvbnRyb2wvaG9z
dDAKICAgIHwgfCB8LS94eXovb3BlbmJtY19wcm9qZWN0L2NvbnRyb2wvaG9zdDAvVFBNRW5hYmxl
CiAgICB8IHwgfC0veHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sL2hvc3QwL2F1dG9fcmVib290
CiAgICB8IHwgfCBgLS94eXovb3BlbmJtY19wcm9qZWN0L2NvbnRyb2wvaG9zdDAvYXV0b19yZWJv
b3Qvb25lX3RpbWUKICAgIHwgfCB8LS94eXovb3BlbmJtY19wcm9qZWN0L2NvbnRyb2wvaG9zdDAv
Ym9vdAogICAgfCB8IHwgYC0veHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sL2hvc3QwL2Jvb3Qv
b25lX3RpbWUKICAgIHwgfCB8LS94eXovb3BlbmJtY19wcm9qZWN0L2NvbnRyb2wvaG9zdDAvcG93
ZXJfY2FwCiAgICB8IHwgfC0veHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sL2hvc3QwL3Bvd2Vy
X3Jlc3RvcmVfcG9saWN5CiAgICB8IHwgfCBgLS94eXovb3BlbmJtY19wcm9qZWN0L2NvbnRyb2wv
aG9zdDAvcG93ZXJfcmVzdG9yZV9wb2xpY3kvb25lX3RpbWUKICAgIHwgfCB8LS94eXovb3BlbmJt
Y19wcm9qZWN0L2NvbnRyb2wvaG9zdDAvcmVzdHJpY3Rpb25fbW9kZQogICAgfCB8IGAtL3h5ei9v
cGVuYm1jX3Byb2plY3QvY29udHJvbC9ob3N0MC90dXJib19hbGxvd2VkCiAgICB8IHwtL3h5ei9v
cGVuYm1jX3Byb2plY3QvY29udHJvbC9taW5pbXVtX3NoaXBfbGV2ZWxfcmVxdWlyZWQKICAgIHwg
fC0veHl6L29wZW5ibWNfcHJvamVjdC9jb250cm9sL3Bvd2VyX3N1cHBseV9hdHRyaWJ1dGVzCiAg
ICB8IGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvY29udHJvbC9wb3dlcl9zdXBwbHlfcmVkdW5kYW5j
eQogICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9pcG1pCiAgICB8IGAtL3h5ei9vcGVuYm1jX3By
b2plY3QvaXBtaS9zb2wKICAgIHwgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L2lwbWkvc29sL2V0
aDAKICAgIHwgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2lwbWkvc29sL2V0aDEKICAgIHwtL3h5
ei9vcGVuYm1jX3Byb2plY3QvbG9nZ2luZwogICAgfCB8LS94eXovb3BlbmJtY19wcm9qZWN0L2xv
Z2dpbmcvcmVzdF9hcGlfbG9ncwogICAgfCBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xvZ2dpbmcv
c2V0dGluZ3MKICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yawogICAgfCBgLS94eXov
b3BlbmJtY19wcm9qZWN0L25ldHdvcmsvaG9zdDAKICAgIHwgICBgLS94eXovb3BlbmJtY19wcm9q
ZWN0L25ldHdvcmsvaG9zdDAvaW50ZgogICAgfCAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9u
ZXR3b3JrL2hvc3QwL2ludGYvYWRkcgogICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0d2Fy
ZQogICAgfCBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlL2FwcGx5X3RpbWUKICAgIGAt
L3h5ei9vcGVuYm1jX3Byb2plY3QvdGltZQogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3Rp
bWUvc3luY19tZXRob2QKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5CTUMu
VXBkYXRlcjoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5i
bWNfcHJvamVjdC9zb2Z0d2FyZQogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJl
LzMyZjRkMmE2CgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuRG93bmxvYWQ6
CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3Byb2pl
Y3Qvc29mdHdhcmUKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5WZXJzaW9u
OgpgLS94eXoKICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9q
ZWN0L3NvZnR3YXJlCgpTZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuQk1DOgpgLS94
eXoKICBgLS94eXovb3BlbmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3N0
YXRlCiAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3Qvc3RhdGUvYm1jMAoKU2VydmljZSB4eXou
b3BlbmJtY19wcm9qZWN0LlN0YXRlLkJvb3QuUG9zdENvZGUwOgpgLS94eXoKICBgLS94eXovb3Bl
bmJtY19wcm9qZWN0CiAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L1N0YXRlCiAgICAgIGAtL3h5
ei9vcGVuYm1jX3Byb2plY3QvU3RhdGUvQm9vdAogICAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvU3RhdGUvQm9vdC9Qb3N0Q29kZTAKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0
ZS5Cb290LlJhdzoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29w
ZW5ibWNfcHJvamVjdC9zdGF0ZQogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3N0YXRlL2Jv
b3QKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L3N0YXRlL2Jvb3QvcmF3MAoKU2Vydmlj
ZSB4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkZhbkN0cmw6CmAtL3h5egogIGAtL3h5ei9vcGVu
Ym1jX3Byb2plY3QKICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3Qvc2V0dGluZ3MKICAgICAgYC0v
eHl6L29wZW5ibWNfcHJvamVjdC9zZXR0aW5ncy9mYW5jdHJsCgpTZXJ2aWNlIHh5ei5vcGVuYm1j
X3Byb2plY3QuU3lzbG9nLkNvbmZpZzoKYC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAog
ICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9sb2dnaW5nCiAgICAgIGAtL3h5ei9vcGVuYm1jX3By
b2plY3QvbG9nZ2luZy9jb25maWcKICAgICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L2xvZ2dp
bmcvY29uZmlnL3JlbW90ZQoKU2VydmljZSB4eXoub3BlbmJtY19wcm9qZWN0LlRlbGVtZXRyeToK
YC0veHl6CiAgYC0veHl6L29wZW5ibWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVj
dC9UZWxlbWV0cnkKICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9UZWxlbWV0cnkvUmVwb3J0
cwogICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L1RlbGVtZXRyeS9UcmlnZ2VycwoKU2Vydmlj
ZSB4eXoub3BlbmJtY19wcm9qZWN0LlRpbWUuTWFuYWdlcjoKYC0veHl6CiAgYC0veHl6L29wZW5i
bWNfcHJvamVjdAogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC90aW1lCiAgICAgIGAtL3h5ei9v
cGVuYm1jX3Byb2plY3QvdGltZS9ibWMKClNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5Vc2Vy
Lk1hbmFnZXI6CmAtL3h5egogIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QKICAgIGAtL3h5ei9vcGVu
Ym1jX3Byb2plY3QvdXNlcgogICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L3VzZXIvYXNkYmcK
ICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC91c2VyL3Jvb3QK

--_004_MA0PR01MB5725973B24BC49B524964180E0632MA0PR01MB5725INDP_--
