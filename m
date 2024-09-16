Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4D97A503
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 17:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6pNS4wSwz3cCC
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2024 01:14:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726499652;
	cv=pass; b=bBnBXz6O6htaQiI4pjJZtGPEX+lfX0jK8dEQb8T5hkgr3V/6iCHeoEN3e5AXq73RVi1atcLOvmRI6cPSpeIwaPkcdentYGbTfI4zFCzs25g3eKsOyPCah4WZ/CLyu2CNQYghCmQM627BhtNsrLZbWdQA9IS41H/LRvsaTskn1OuSp4uDb5w3oxVT0p2064bEj0WjXSW6qFz8hWorSOxcDByit4mi/N8RI+ohk9VNBZ5C7GMNT1vJHeT+pKXmEcG8aZ2GTW8kRcxGsDu/hNCxh0c+6th8ET8aieYrPgFUWkgIinx79tv6BBc8J2jVFNS1Lc/dItM5+K78B7PFQp5WuA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726499652; c=relaxed/relaxed;
	bh=pdgiYYzQ/27/5gSGBNU1moXKrk3Scq/KiJ4Ql7NrkCk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bzHSSBYqIevKejLrx9dtUpZ6j9tA22h9V+9uAwNc6iRoAAN2ZT3lOm0P1AW/WtfDIO+Px8rSyF77CrlgPI7ofQOb0sYWI8Xxe9xXoD+6RQEc2gjmrS42Bt0Yezc+o2XqtT0eyZPm8C1dRZrezVpHtKmhkzt9eAozQrbShPv2bgDu1IpI+K1G/a4pJzW1/w734e4kB07QZD3Uot5GYpiKsul2vOpqfzoKYbQc7Chax6jLWccuUuJUk9QjGHWpxB73A8xzAYOkUSLl9AT/mTSKnzofsFISgaqataOnvSk+ahA1D9Cl80UaTedPmJlniPNeVppoyWc8T0S6VCLY5/6v8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com; dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=RT2UFYTR; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2009::60b; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org) smtp.mailfrom=smartm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=RT2UFYTR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=smartm.com (client-ip=2a01:111:f403:2009::60b; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6pNM19p0z2xyG
	for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2024 01:14:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUJiWsDhB5XvIZA2E5I4GSJxpnalEa2uHKLwWmyOIllFiTlMsC2jXlYZ78w66OPyqishR3osK9uEEn76KMpqDFJ1KghxfCXN9ljtn3gdCFrL8xdwpg0WBqpzIvYB7DeYCi8TL/BZF7zs88uMl9b2/XanTQmeVMToLrgw4ytwlqsHmDFsXukgwU7dnJHx1lKoEUZKXKBV+TlNLsjzI56yz9tve3uBTWP/IuWeRkL69+qutKoC4CNTpKD4WICTNe9enM408VGg/PBpZhUeqdkKitRMxoEe9KC+MHpr2UkhyL6HvFKGqyduoJCR5ro2mTeSKFEhRg7OUF/xnhMLPPBqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdgiYYzQ/27/5gSGBNU1moXKrk3Scq/KiJ4Ql7NrkCk=;
 b=gUqGVFP47JY2VFB74f0JxBIwZEkO9wxdKUuKZyzVTRBAWiBQ+M9OXMpwKXlAb3prDeYrnS1HHLLi7AWI+tKQa43ttplos0n7c0PsOX4VbRDbvICG/1JUQWa3stumvQt45mCOKYxz8JfwFUQOLVH2DUcbDvhKRSe/KXev32W80NFkdyewEURM+zEJPdynamlAasJN849azH0+4dxTMJ1fKlmc2LkfOdpgsUtveXMcu/W1yAqwrR/Ck4yyhI7jVe7nwRUF7e0kR4dVmupOBkAqIIuDV8WPpw/LHH9/k7ViYF5n0ZS5mNne1gpW7rEmgGmoYRdxXzalmR1aAIA3CIUDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartm.com; dmarc=pass action=none header.from=smartm.com;
 dkim=pass header.d=smartm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartm.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdgiYYzQ/27/5gSGBNU1moXKrk3Scq/KiJ4Ql7NrkCk=;
 b=RT2UFYTR96MrnwpN844eriDa0+WfG1XCFKGyzcz9rjiY4Kbf7s0zd+C99i08rVS7Aax2c3mFY2qV5LxJGS9RhFJun1349qNWP75tc+LKXYtDszuXVP2cJU851tj4+N1rysjvcgijZ7UWLxjh5aktPi9BhJD8IDnYm76k+0Cg6Rd9eFFniUoKpcw1J+eZv7Cgx2JEO8tY3YQlP/1eAX0WNuyf669kI9+Kdlf9MRxkGjB+K359odupuZrLUYfQkwQY9u7TQAVkzb/J4PhW7rkd2GHlNcCI7z4IzLhUl8NuA5ewcOu3hb4STshMh7/feYrhwHhTe5RsnkXBBosbs+QM4w==
Received: from BN8PR04MB5906.namprd04.prod.outlook.com (2603:10b6:408:a7::27)
 by CH2PR04MB6887.namprd04.prod.outlook.com (2603:10b6:610:97::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 15:13:43 +0000
Received: from BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3]) by BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3%3]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 15:13:43 +0000
From: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: libmctp / libpldm / pldmtool
Thread-Topic: libmctp / libpldm / pldmtool
Thread-Index: AdsFS8qWaHZKEAyUTKGVWSgWTAHXLQAMFC6AALNToJA=
Date: Mon, 16 Sep 2024 15:13:42 +0000
Message-ID:  <BN8PR04MB59061FDDDFB2CA9E6276A7CA94602@BN8PR04MB5906.namprd04.prod.outlook.com>
References:  <BN8PR04MB5906A2433F59E7470A2E939794642@BN8PR04MB5906.namprd04.prod.outlook.com>
 <5605d69863356355297b370efacdff44cc8ed7dd.camel@codeconstruct.com.au>
In-Reply-To:  <5605d69863356355297b370efacdff44cc8ed7dd.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR04MB5906:EE_|CH2PR04MB6887:EE_
x-ms-office365-filtering-correlation-id: 929efbb3-c934-40c5-ae17-08dcd662270f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?dDJpi9xi9CHH/e5TGlEFlE4jNeYeSBYquTBJNd4bbheUdCirG2ew3RSWMCc2?=
 =?us-ascii?Q?JIpyFF2RDD8xoYmJJR7wffCStEO8s2mDGbINcK16trmGyaQ8P8WZ8OwMbin+?=
 =?us-ascii?Q?udz06WyLYP75Zf8SLBGsvr5pVXDa7rNF2EUVKfifBFkXNQdVxZ0E7S3uEtob?=
 =?us-ascii?Q?64YcygrOM4IhxIEuegd3ndJzAfQ5UIfzyTNcp6FGwHLb/1WgeJvMN0jdCVUb?=
 =?us-ascii?Q?Nrt+aGf9MpzsNUMkifycpB0NoqoL0nJ3JyPF1mtF710D3+qfvSMcOW+/XLJO?=
 =?us-ascii?Q?G8njfRg4ouy7QxtznmoxPpX4tw/ivYuEaWXTCiPLwnOxx8kIf+yUa50iSTsy?=
 =?us-ascii?Q?BMnYGD/LcPxNhoYv2hxXrdtbZYl0wrnJpOmPvA2T53Lt9/WGGRsFeRAqKxDl?=
 =?us-ascii?Q?DfXaMYxkI8T1bu1NywPp+9azqxHVV99a+BTOPKGI4WyNtfpksUeEIdPAHfgw?=
 =?us-ascii?Q?KE8Ej8fsL9RDydXmjUSwRKpj8E3xhVwEI3CJbtcvDiMNvmPbru5pmokSDoh7?=
 =?us-ascii?Q?Em/vDO7WXBJZg5czvoeA4jh0yiVtGxgljsJvaBHWSgLAX817A1tshPNEnb+q?=
 =?us-ascii?Q?RedcPQ3VSe8tbqkzrq+7uKP1+pkLPD54HTsyKeERLJ/+sF+4dDgxMpUtxli+?=
 =?us-ascii?Q?Wv0+WvLV+TkdDHTeZb/Dkz1nsKnfJ2P3mEFSnDG+8yVz3QmdabwziuzJUDBR?=
 =?us-ascii?Q?Ux2LhTssELQ2y4uhN5HXWRU6RtqCaE88t6IKY/6SOEEUK4JMsaSpITDnl4YW?=
 =?us-ascii?Q?sizF/cpiG6WV45fy1nB6ld9KComys8Fot7iQ+pM7cFwQsA4g8VV0ttGsSMlZ?=
 =?us-ascii?Q?Ay7WoRduKYjvJWEPa6EjOKenQz4lRer7znfr0w2E7xc9lJvtwtAGl66O+Ft/?=
 =?us-ascii?Q?MfqQ3ynZJ50CP9i44HmHDNtbNdD6lhUX1rIgyf3MhxDHodYmNYm4TnAR4UzF?=
 =?us-ascii?Q?sLNtZDtoxiqp7MK9LwzMj++ob/yhv5xL1nf1gf61UPac+4PLOdYopROBQ02f?=
 =?us-ascii?Q?JMLTPLL8FGqupvd/2W483KLrzWAMTNeWiQdiiFQbs5p6wnqaL9WlkZ1PacLM?=
 =?us-ascii?Q?4TudAOQMxz3uGoYhgEZG8mwyeFdur0TBASpbDQv6atWDEUB/nI63AUF8n+IN?=
 =?us-ascii?Q?CU5P7VdvxK9EwG41O0NuKc+i+GUXSJhZRU83Of/cNOqDtq3GCArMKtEmD0QH?=
 =?us-ascii?Q?cgkQ2Y7gLxDYvAaXssJeciQeM0q6FbKxaii8Ln+JkfUO5dobff2Vj7G8tsH8?=
 =?us-ascii?Q?XdHOoLnYKYeFXOU35Ugr+lTixcOI/B6ceWC/cfF9jb2WSkcvUQTH/5RkG/x1?=
 =?us-ascii?Q?0pBub0qvym/paW8j/0y2K0qdHVtLaJ5COZkGBvr2BBDipzwt6QupQU/+KEd6?=
 =?us-ascii?Q?NHWwiLk=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR04MB5906.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?/dZ4lnuNo3IkgkOhguz8I9ZVGviS+6NTD5/fE8M1GybuA83nW2pNPBMlxbDA?=
 =?us-ascii?Q?TvMmKjD228eH7sHLMXPWXeSu1O7BKxsCYedhMdvX8//fT1AifpHbR2zZL983?=
 =?us-ascii?Q?NIwnUKPyAzVpqgLquVITf9hYoLbkqo+4ZNqr8m7Spp3RIyWBo861vJww49og?=
 =?us-ascii?Q?3nq2LEW53MPNd8YiTkP0kOQ44PHl/PmRwJ08J0ShlMwss4IhqN7m82Hnl6GC?=
 =?us-ascii?Q?jtbfbrT5zF+56DPnTHbb71MUAoJSZ6IJoy0WDEe7BQemYRWWfiVvFBc2QO2t?=
 =?us-ascii?Q?8O/4DOkRyCc35T1Uggb9yJDHRkl7gsWB+tA7lCZDr5QqrJ0TaeM4GR0ygur1?=
 =?us-ascii?Q?C9jmWWhYoVUyz4cA2o04Mpg/Aol5CRtuiKIX/Zm0en47W/iRZH86C9T5G1z8?=
 =?us-ascii?Q?negNUMm5ZF4qhHLL5qWp2ho2UxKArkixidVlCKJ7uamaUCEiOtI2sX+FTuNH?=
 =?us-ascii?Q?vhaymqHjryLxceY3LIECcBCjmcOGZXjMVi5dRU1o2GPAwCqEWrxLUaTfA0zm?=
 =?us-ascii?Q?nVQNks5zrUf2ElHk/KDReLB4bGxkbZWh65vXSDw/D4ZGJSRJp2Ruq7oTnxdl?=
 =?us-ascii?Q?9TxXuE4+DHRcra9pBF3iXt1CPrUBM1/1JOgoQkjtFzPodz7XZ7SOgJz8HuMP?=
 =?us-ascii?Q?dg55IWkUFnq/6Y4oyYSmhu4CYlYBTQgrSXcrHCc7HFZpnuV2Vx5WMovxOsZi?=
 =?us-ascii?Q?tmkScE4HrHC+vU5aGY0V1G8CMcomscHfE/XvrPoRQ1FvJMq6ATQ1b+1iyeXs?=
 =?us-ascii?Q?R6SBcMlce8T+v3VoIGO2JrvX+Q5gRvNpBpsUhI2sRwg1OlnwjorENLThEhTR?=
 =?us-ascii?Q?hdEi3X+AVsgiqXxyFZlMlvHuIfzitK0ZEZ9uxQvSKQNEa/ZtPAoB61U3q0Kc?=
 =?us-ascii?Q?oi7Y0Fy6K9JxkD5DRaL+Tb4gJiyF5N4XbfZ85WtRQrsYZcwxxZBujC85MNjZ?=
 =?us-ascii?Q?dCMsMcPj3/06bhPHBNn+n+bdKNxhcBJsKh8P+7r+gomQZ+VK2q0F3X8NJ0s6?=
 =?us-ascii?Q?3WfnXFyQ4EeuWxsSHhpadEqZM2XIcf9aCs+Y+XZd29LbvkhyWAC2wwWSeCsD?=
 =?us-ascii?Q?6G+C5anb6aKNulI5PXggYCenEmYG9ALIuMnLLoIGPepf60SHiBz24FpRSdjM?=
 =?us-ascii?Q?E1JS7jEV5TsuSNFMDV4pFH9xDI/70RlecJTD6pf6UeIKSbO6lNcaH1doM3oR?=
 =?us-ascii?Q?zog171vUwmKZvdh3fEL8Y9LSoXTRoTQhhrtT8APXUCw9/f9wWa2GBD2Azp7s?=
 =?us-ascii?Q?oKnfl+0AHKyLx9Hsoll++jOB66UnUMZjVglnFr7MHHhd0WHKfdJ48NAAsvzu?=
 =?us-ascii?Q?gL6xi9stqgALr3AlFFnNcv6n98azS2QugiWFHJjql7emL1EZ4eILu5+ucex4?=
 =?us-ascii?Q?iPg6hmEhr86wth0R3MQCrb67d/GzTYhgXnDQBEjK99dMyCY0IDA2B+URXHjD?=
 =?us-ascii?Q?1weHakazBpl+YthrrbtRmE6/4WxmpDNlqw1EK1mGNHH363Qx1n/7r0Hhxcvz?=
 =?us-ascii?Q?JkgYv1ed+cexkzyO/8zg5whVGOUt5khQuKbek9IoL11dcWz61eZrLE5RuGWK?=
 =?us-ascii?Q?Airmy4X0oBDK3WofS0JzWhI7e5HHrCor+IzOWdHy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: smartm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR04MB5906.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929efbb3-c934-40c5-ae17-08dcd662270f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 15:13:42.9986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0fd7909-cd13-4779-b0f9-5ced6b7a2c68
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LrxO3aMe6JD3feslQgHr92DP+u6CF5mP33TouZXuqzIpueydUO4LUx0dbGwwdaTRpPIGgfin2zANtX525FsfU71p2ubL4Fjy3Z88l6OW1JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6887
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

Andrew,

Thank you so much. For people like us who are totally new to this developme=
nt environment, the "siloed" aspect of information availability has been ve=
ry difficult to navigate through.

The objective of ours is to use the PLDM and SPDM software tools with the M=
CTP support in the OpenBMC environment. We are totally new to this developm=
ent, and hence based on our own research we went with Portwell's PCOMC660 b=
oard (for a charge) that came up with their own BB layer added to the OpenB=
MC source. This source is not in the OpenBMC github but in their own privat=
e tree that is forked downstream by them. Our thought was to have somebody =
who could help us directly, instead of going to a big forum like yours. We =
had so many new things to navigate through.

We make CXL controller cards, and for them PLDM Type-5 based Firmware updat=
e is very critical for our customers. Also, our customers need SPDM support=
 for device authenticity. We want to have a development environment to vali=
date what we build. Without a ready to run stack of MCTP, PLDM (libpldm, pl=
dmtool, pldmresponder), and SPDM, for people like ours to put them all toge=
ther  is becoming a huge project on its own.

In the downstream Portwell source we have:
1. xys.openbmc_project.mcptd.service is there, but is not discovering any e=
ndpoints. We tried over smbus as well as Pcie, as their board as well as ou=
r CXL firmware supports MCTP over both the interfaces.
2. Utilities such as  mctp-ast,  mctp-astpcie-test etc., are present.  No P=
LDM tools are present.

We have been asking the Portwell team to provide them. But we thought, we c=
ould do on our own with the delay that was really frustrating.
The documentation for OpenBMC support for PLDM, MCTP and SPDM, all refer to=
 the full stack that is based on Linux  (the one you explained in your earl=
ier email) and we went with integrating them in our source. That was a disa=
ster as we just couldn't bake the recipe files properly (running in circle =
reference). The AF_MCTP reference that you mentioned was something we didn'=
t know that existed at all.



Thanks,
Rajesh

Hi Rajesh,

In the future can you please make sure to reply-all? This way the list cont=
inues to be included on the conversation. It's important that the conversat=
ion remain public, as other people might have problems similar to yours, an=
d having the conversation visible means they too can resolve their issues.

On Fri, 2024-09-13 at 14:31 +0000, Ananth, Rajesh wrote:
> Andrew,
>
> Thanks for the pointers.
>
> I was running around in circles trying to figure out ways to integrate
> the pldm tool chain. It has been a learning process by looking at
> different kinds of documentation. :-)

Can you elaborate on this? What documentation did you read and in what ways=
 was it unhelpful? These are things we can fix, so it's important to identi=
fy where you got stuck.

Andrew


-----Original Message-----
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Sent: Thursday, September 12, 2024 6:28 PM
To: Ananth, Rajesh <rajesh.ananth@smartm.com>; openbmc@lists.ozlabs.org
Subject: Re: libmctp / libpldm / pldmtool

SMART Modular Security Checkpoint: External email. Please make sure you tru=
st this source before clicking links or opening attachments.

Hello,

On Thu, 2024-09-12 at 19:48 +0000, Ananth, Rajesh wrote:
> Hi,
>
> After I do the "bitbake obmc-phosphor-image"  I am not able to see "libmc=
tp / libpldm / pldmtool" getting installed.
>
> I do see that these are present under "meta-phosphor/recipes-phosphor".

Unfortunately, just because the recipes exist, does not mean that the libra=
ries/tools will appear in your rootfs. Some work is required to have them i=
ncluded in your build.

>
> In my build environment, I see these:
>
> rajesh@bld-ub20s-openbmc:~/openbmc-portwell/openbmc-pcomc660-v2.2.0/bu
> ild/pcomc660-ast2600$ find . -name pldmtool

This platform doesn't appear to be upstream so we don't really have any inf=
ormation on how it's configured and whether the artefacts should be include=
d.

> ./tmp/deploy/licenses/pldmtool
> ./tmp/deploy/licenses/armv7ahf-vfpv4d16/pldmtool
> ./tmp/log/cleanlogs/pldmtool
> ./tmp/stamps/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool
> ./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool
> ./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool/1.0/licens
> e-destdir/pldmtool
> ./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool/1.0/licens
> e-destdir/armv7ahf-vfpv4d16/pldmtool
>
> In my build environment, I expected something under ".../bin/". The bb fi=
les are as is from the openbmc git.
> In the package generated, I am not seeing the pldmtool and the other asso=
ciated libraries installed. Am I doing something wrong?

Likely :)

A further point is that libmctp is very likely not what you need. It's an i=
mplementation of a full MCTP stack, which can either run in hosted
(userspace) or freestanding software (firmware, operating systems, etc). Wh=
ile OpenBMC has historically used libmctp, it is considered legacy for Open=
BMC purposes, and you should use the AF_MCTP sockets provided by Linux inst=
ead.

You can find more information on the Linux MCTP stack here:

https://codeconstruct.com.au/docs/mctp-on-linux-introduction/

libpldm and OpenBMC's PLDM daemon together use the AF_MCTP socket transport=
 for Linux, and this is the supported way to implement MCTP and PLDM in Ope=
nBMC.

You can integrate the supported MCTP and PLDM stack into your image by addi=
ng `require conf/distro/include/pldm.inc` to your platform's bitbake config=
uration.

Andrew
