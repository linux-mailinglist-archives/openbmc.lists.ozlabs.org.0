Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9385977264
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 21:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4SgB1J3Kz3c9x
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 05:48:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726170530;
	cv=pass; b=buf1vZ/flQk4iEzJplEJTobyqgCD4IfDevqOh5dSfG2Cj3wMVvoKWKwF71uBbNTlBrmRdUAVirYr2njHvqAx3IwWlCOzVZw8q+KCd4I8Wt5aZ4Qe4/lh3+3ROkqF6H3JcfXCizNffupkfyAigmGj4DX1zxG3tzLV8rsnHWvpa7yHZihCfLWcx7mZz7ZYzXste7JLUECOH9hkdI9zs7eVR/iV8FaHXMtlaXYWJNVgFhA3Drlqgf0UDKU+0B6h8U7GaW1mHKzkVLp0TZRBYcPDaRCBvFQp8bUkv5l9Dsa34ZgDCPab/CIrNNYAT7m7uJPI6LQYoX29wNCnAq5gjlk8Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726170530; c=relaxed/relaxed;
	bh=UojYOrF+9kwUErKsWTUwXTb62CYh0uaytG9uY7PqP58=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G3g2R6Ubg7dPw9skqrcaBe4F2FC0RdULpBBrVKo/yJwYUJMTRexuz7jPU8EPOA2qgsFwKXLsI34YjNWg7zejJWVJlsQz3UBtInL7A5WFPOAXZvDmfzAEO4FaV+ohie3lZgtZyrENIuPsIQarHuOuR5MT8zoHFZ2ATA+vvHEDcsS0BM0KkLM1pw71wD73dOP18CrORNd/JBZLj39PbXLb+FQq15BIJUIKbCRKtjtubKP43cjhLRALmExciWxX8sZBuLuq8JcozHZ/p1rBPLo10rC/bxFg9Bz/H2d+dGMpkC2fdndg+T2ZBRne16m5FU566lKHSwYxtn88A/fVP+bUOw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com; dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=jX5Erv18; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org) smtp.mailfrom=smartm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=jX5Erv18;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=smartm.com (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Sg51X37z2yDT
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 05:48:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTWvtWERtM/xVPxWXCQMHlLXwMomZR4iOJU7cV/J4OIqRMTHHb9lCapwB69ePdfaFAa25gGy2xar4CC3afFe3DkLmQhhlilyIVTSy6tNKnCRURnW7UfEfgdWUzOvCeBTCAaOEvs8GSr9inhItY2vK3UrisAi02uEvXrDrATFI1aOcfGN0Rf/kbQvwWb1ZV1DVdwr9N3SF4oyAWwA9cmMv/nZnnkcWrpW37cy5972qhThUPSyPGH8Ze6CJde3MJ+QXxj9cXRo+MTdTIqEs1rLS1slJxEegFQmajaARn1eTnRVDqPpqoepUUbKnBb9uDMUwgWcAKjxvhK8whJkgh0MNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UojYOrF+9kwUErKsWTUwXTb62CYh0uaytG9uY7PqP58=;
 b=acSFG9CbFriHXDhG4iQWUc+96e9t3eLMwsnWE5NKbwIhcavyM2TOPp0x7RdfusvbDCm8AtfJRrua0xgWsi1dKHjpa1STixAPSj84ATSbrihDEVO1dF3jYtHKYqg8RcW+j+TC7FEk3mdH6STQisUMkYmSE0OLA4NTD59DzRsxsIrqaFZbEWA4NvwekYSSdHcYGjG6T9knBtlE18K0TJYu6aToxfu5MUpsehmye7yr9oUSd/P2u3/yUK0gSvl5/aNEv+PMm4uIrsbpPcfdnLHK2XDWAm9ePunnkotbZ1Z2pHA3mZInWj2NgTXT5GBCFhH9hnOlBGiucmraWWxelhvguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartm.com; dmarc=pass action=none header.from=smartm.com;
 dkim=pass header.d=smartm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartm.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UojYOrF+9kwUErKsWTUwXTb62CYh0uaytG9uY7PqP58=;
 b=jX5Erv18Fwk6kkgTJkjwA6eoGStwSSmaClB7efM2d8wIZ7FAO1DI3jn0GmRSdtyPkZ91iuyrJ6v6qCfWVRD/EXDioeZROxkZVTxwrwUB06WP3EoSFmLSI6LWGPWmS7GFoT2i/OOnYnO5CT80xyASRkV/Te/i6K1Dq2qb+wVCd1AwNtaquLgoEyXq57mx49KKtNaVNWVp/GRm47SvOQrXm6p9FId80i17/YU15wkn2b6lqhI591bIWIqGCVGtvHKjspeiYmQ7WWglWonCYXaujaOiJm+phXisqehgs8xwbrrLofKITQp+tRKSm/mhhRjA4HLovKq3uKCTRg76NwDQ/A==
Received: from BN8PR04MB5906.namprd04.prod.outlook.com (2603:10b6:408:a7::27)
 by MN2PR04MB6480.namprd04.prod.outlook.com (2603:10b6:208:1ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 19:48:19 +0000
Received: from BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3]) by BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3%3]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 19:48:19 +0000
From: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: libmctp / libpldm / pldmtool
Thread-Topic: libmctp / libpldm / pldmtool
Thread-Index: AdsFS8qWaHZKEAyUTKGVWSgWTAHXLQ==
Date: Thu, 12 Sep 2024 19:48:19 +0000
Message-ID:  <BN8PR04MB5906A2433F59E7470A2E939794642@BN8PR04MB5906.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR04MB5906:EE_|MN2PR04MB6480:EE_
x-ms-office365-filtering-correlation-id: d02c8cab-1cd6-4d1c-f5c4-08dcd363da00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?RrKrbRc++pSzdTuVjiWIBfqT11+4WBb5wxjP6fFmXZbrmPsQIuTkREJCoJ7S?=
 =?us-ascii?Q?djip6mzH9+cqrHizNH+L1uSZLKS89QSNSiQD5vKFfCHIzMi0ajvLEHlF9yM9?=
 =?us-ascii?Q?YZ11hv391Vp5tVPs32MSAk2ZGIdqFSNLZLTW0BT9r8ZV2I3Es+56p5/sO2+a?=
 =?us-ascii?Q?XRFwDcixrryOq3ZPMhaL4erATYrtkZQwO57rphPlbezFUXQUGVTu7pyLxRx+?=
 =?us-ascii?Q?0NMKDbOsQbcdK+E7eO/TX/fsECh7ZrbGdWi+TvCch/8GIH4cqx8LbMImPWUs?=
 =?us-ascii?Q?SW7ZPvObwsluZrvM+FJNaDV3D9vbw96s3npPu+YktRUsY4AcDLrkKHlO3pOr?=
 =?us-ascii?Q?HtqYKfhhww2Cjx7bE0My6VmTJvj7pY5lUCx3cxtFYaDJm3vxkOIT/AAVQAQC?=
 =?us-ascii?Q?pVTFQPlwQVn+MzjcyPNEoHsWPO638ZTGN6JWeQ1unIJKDeqN2eqMO4hpnikh?=
 =?us-ascii?Q?EntSXkU4hXoyKZ0k3tBj7va4inPf/TPmXwRHdZB/W9tvihBQJ5QxzCzUP8rJ?=
 =?us-ascii?Q?HPJgtMMKCbFNKwk0W0Ds6lIKSfLwpYExk/ocvZOFL4wsSP027nYPGbvPTwtU?=
 =?us-ascii?Q?MtI0EePUuGSAyYZPQsVqiL2fAZMv6/YYf4wgQehrUk+63n7lKXWRZUMozNKR?=
 =?us-ascii?Q?oe/MsKiGGU3TQltqGWm/jy7R1hvFs3HVrCG4AJTAD+q0w1ttnkyZfva2fWSD?=
 =?us-ascii?Q?eFbRBjjI/xPJqgzQzD6ya0HtEkNz3bTEvPUR3+f9zOaN/iRjwV5OWjNVVSFf?=
 =?us-ascii?Q?li+FqVSHXcB7dLKiLZOL3uXnwmnc0mnAwAsHsIf2+xyRMe1kKUKhbdUbB2TO?=
 =?us-ascii?Q?Qyxd1BiT4iF3rA11ZGVaxuIfOgp16lAGhxBCp0B+ma7Yaf5bYoZs/3qAS6pE?=
 =?us-ascii?Q?P6b+zt8EWpKHy+Lcze5A7gTefRCqlOlRYrXe0075Pq0vbMwZOUohxruArMVG?=
 =?us-ascii?Q?9wA2j/iTbRGaCF/x5DxE7kUwlWMMvneQuXIcDWWRVTu89ITBG++8yU+MKB8m?=
 =?us-ascii?Q?HjmigtFn0rv1K3xJO8bs0esW8ziZTFBr/NjxhMYzCZdBXznSebrhJyKZCULX?=
 =?us-ascii?Q?XUhs2NMzLADqArrvH8PTwhZttTkXzmQhRer7q7+h/M6Vywa7v+Uak7KHdVt0?=
 =?us-ascii?Q?iN1gT+iMVFd51IzMRPiufL11NNCPNSSTXQ8U7qev0ga2WNwGMiKFUeDHosyo?=
 =?us-ascii?Q?xrwQ6kvYNGq52Km6MolAbQLlqj+/kjpIUFkuLRLUllSyI2rQ7LxxRivmzxJt?=
 =?us-ascii?Q?7SJiT8d1z0C2mxZBXIPlDq+M/HE6YfuFk3RG94SzCxQJ8uZwH7yQptVWdqz3?=
 =?us-ascii?Q?Ja+gmF1ELDE0aiRf+n8d2QcTRxVOhWnv0CI2GX7p5SS4/qJ1sbXf+eWg0v8t?=
 =?us-ascii?Q?9prqc9Ia18m7lPD4oSISiZzfbHT1yUn7K4+EAqlIWjet+2Sm9Q=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR04MB5906.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?n4vkEXfmad/hS/IkBnlCGSaAA67jDjKlJK+zz6jObeJpo5m73ycp65joI0CG?=
 =?us-ascii?Q?kCGGgcygBAFXFMT23Lt0Zkr5aFUWK9RXHsOBSI7o2UoTeht147Nxh6w+2gP/?=
 =?us-ascii?Q?W5EIqOfHnhxHXSgXxyvECCGgMc7IqJ1vy9XQfsjolk30/3gYg3lHkTWIEqXA?=
 =?us-ascii?Q?qnC1UrqS8XZTMU13ccYF526QcBPkvALxsS8P2FAN4VtUQXwWa2+s2y0ttkJs?=
 =?us-ascii?Q?434ZDI8qNPZ36H3xlkMB1q93iuat45krKNJJXF35/Dqasl9df+bphWJ/1dE8?=
 =?us-ascii?Q?ojrzi/oaR4hllJx70vEx7jIaT5L2nLT1pI1zcwG6Lphogae3mqOpjVoIxPxP?=
 =?us-ascii?Q?Az+wrMy22jmMHBBTOQqHQvOdv4hFxktO13vJXW3D0QPRhw7ZmDj5Jj4VlKRY?=
 =?us-ascii?Q?M3PU0yADOvkRWmVxc06y6Xl3bgK7Ra6maEODpWHjPbSHuwNiR/2BoDeRIkv4?=
 =?us-ascii?Q?3Imh08RjkkTOma4cvSzo7kqqzSrsU1JkNraKN3T0wmcMhHBPF9xFwBffaaph?=
 =?us-ascii?Q?soErlLiv13SIhK1x+ACWqDRGjWpkXsn7tJ+w3n4IS+557f4o3eNOWyrJpfAn?=
 =?us-ascii?Q?j5nkrJ4uAaU/GcwtTiRtEphecBU/sATKjGOZOeRd4rVLXtOm2BlcfiyQo1Cl?=
 =?us-ascii?Q?JvDFDRlgUYOeDEyyyp3Y9vjr0+KtJgPj4sbCpzmhUzObdMhQJPRplLT35sdF?=
 =?us-ascii?Q?ZjDZZUUaq4if4okZT9q199yU4Ocf4FF5qhLapri+J9WEbVkbzquWMbFVoFSN?=
 =?us-ascii?Q?EDb2fN7UQe2ZSwEsFKnyrgVkIpyzyX+sHu0kqtWYpcGOHcwUTiCLxzXv8JfO?=
 =?us-ascii?Q?TgMH66VNQ4v9DgPm9/oejy5DPRf0/NnSi6YI1hMdGq+yQ5sRpxjwx4Vkj4iC?=
 =?us-ascii?Q?lCEsaNbR2N0XRR/5c1NsqxDAjuhanVt2t+7Q8XbE/7uIERCuxGbKuaswGKHA?=
 =?us-ascii?Q?qVe/uI3adn3J10TvuibT/+t6QdcP6rLttbpDm0NfyYiB8z/WYASRXRqSaQbN?=
 =?us-ascii?Q?KaMyZiYvkN/BNQcWk20Wrc+zhfKDq3hinyHFha9G8KCRJrzjJRuywfrvi7KP?=
 =?us-ascii?Q?aQFCEu2r7dPV5x9BLs6h20CLsEvcsWqcfIpbqbE5O8c1tOqOsBfl6EAYxomd?=
 =?us-ascii?Q?nZXjG3h5PosNuZhffMBTeON+u7pFImUCDcg43mvCR2lnPmyLyaOtbneHhdo+?=
 =?us-ascii?Q?82G8+K8uab7gRiq9t3LLGSwYpnEvZiGhNGtxNYz2dxX8L1MEEYn8IZQqcoaJ?=
 =?us-ascii?Q?KQbHUm0GDKno5BnAPSAfr0Z/pbrID1bcBonbuCLNQV7DilHaZ30ZgUMyYy5p?=
 =?us-ascii?Q?t/Eug3h25HuknxdHlr7EgkUGI4GThT5QIQ7lCs9jJWPvnTfif2nDSabeHy2I?=
 =?us-ascii?Q?+rHTKb2KCeO9+TYdfy/emr37KTRiwz1OBrteZejny3oL6XAqgYXMCj2DZGx1?=
 =?us-ascii?Q?C6y31oY+sICAQOWDms23WkqB0i9jyTpPi2H1R1tWpmqtQUB3WqaTsNRy4+LD?=
 =?us-ascii?Q?ntIUCDEDWzjYjoYahdVF2lPAxfdmQeCOcX3dkpAVJcIbkTv9WbQ9kdiwobYO?=
 =?us-ascii?Q?9bh4JhQMY7zyqx7eBSIO5cbqYMtFjfNPlNb6SU28?=
Content-Type: multipart/alternative;
	boundary="_000_BN8PR04MB5906A2433F59E7470A2E939794642BN8PR04MB5906namp_"
MIME-Version: 1.0
X-OriginatorOrg: smartm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR04MB5906.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02c8cab-1cd6-4d1c-f5c4-08dcd363da00
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 19:48:19.2257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0fd7909-cd13-4779-b0f9-5ced6b7a2c68
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKRvGBQvxhVMyzrByNh92BbZwjOXn5/H5Md9vxJmatWk+HC5f37QQY0DYLtgBjn3hXuJuEW4XR4liG4Dg8YdJ+oBjvCUwA8hcMDEKGsfINQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6480
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

--_000_BN8PR04MB5906A2433F59E7470A2E939794642BN8PR04MB5906namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

After I do the "bitbake obmc-phosphor-image"  I am not able to see "libmctp=
 / libpldm / pldmtool" getting installed.

I do see that these are present under "meta-phosphor/recipes-phosphor".

In my build environment, I see these:

rajesh@bld-ub20s-openbmc:~/openbmc-portwell/openbmc-pcomc660-v2.2.0/build/p=
comc660-ast2600$ find . -name pldmtool
./tmp/deploy/licenses/pldmtool
./tmp/deploy/licenses/armv7ahf-vfpv4d16/pldmtool
./tmp/log/cleanlogs/pldmtool
./tmp/stamps/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool
./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool
./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool/1.0/license-des=
tdir/pldmtool
./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool/1.0/license-des=
tdir/armv7ahf-vfpv4d16/pldmtool

In my build environment, I expected something under ".../bin/". The bb file=
s are as is from the openbmc git.
In the package generated, I am not seeing the pldmtool and the other associ=
ated libraries installed. Am I doing something wrong?

Thanks,
Rajesh

--_000_BN8PR04MB5906A2433F59E7470A2E939794642BN8PR04MB5906namp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After I do the &#8220;bitbake obmc-phosphor-image&#8=
221;&nbsp; I am not able to see &#8220;libmctp / libpldm / pldmtool&#8221; =
getting installed. &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I do see that these are present under &#8220;meta-ph=
osphor/recipes-phosphor&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In my build environment, I see these:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">rajesh@bld-ub20s-openbmc:~=
/openbmc-portwell/openbmc-pcomc660-v2.2.0/build/pcomc660-ast2600$ find . -n=
ame pldmtool<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">./tmp/deploy/licenses/pldm=
tool<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">./tmp/deploy/licenses/armv=
7ahf-vfpv4d16/pldmtool<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">./tmp/log/cleanlogs/pldmto=
ol<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">./tmp/stamps/armv7ahf-vfpv=
4d16-openbmc-linux-gnueabi/pldmtool<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">./tmp/work/armv7ahf-vfpv4d=
16-openbmc-linux-gnueabi/pldmtool<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">./tmp/work/armv7ahf-vfpv4d=
16-openbmc-linux-gnueabi/pldmtool/1.0/license-destdir/pldmtool<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">./tmp/work/armv7ahf-vfpv4d=
16-openbmc-linux-gnueabi/pldmtool/1.0/license-destdir/armv7ahf-vfpv4d16/pld=
mtool<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In my build environment, I expected something under =
&#8220;&#8230;/bin/&#8221;. The bb files are as is from the openbmc git.
<o:p></o:p></p>
<p class=3D"MsoNormal">In the package generated, I am not seeing the pldmto=
ol and the other associated libraries installed. Am I doing something wrong=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Rajesh <o:p></o:p></p>
</div>
</body>
</html>

--_000_BN8PR04MB5906A2433F59E7470A2E939794642BN8PR04MB5906namp_--
