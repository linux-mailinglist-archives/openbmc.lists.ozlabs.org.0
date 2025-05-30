Return-Path: <openbmc+bounces-101-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564AAC8732
	for <lists+openbmc@lfdr.de>; Fri, 30 May 2025 06:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7qRY1YqFz2xfB;
	Fri, 30 May 2025 14:06:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.153.30 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748570857;
	cv=pass; b=lYbtsAeEieEN9LHSGCz/IC5aLlFBPhp6BLCpCcV7cqO/EIjiNOSmtC2itinUI7fyCsVp1qH31NmEcwhX5CXizGER/T1EHCrjxzCSZBNhsVY+9/wvEywHudqXCQuRPLzQVpGHGaNd6fJiwN1/NIby6Fec9Zvwk3ThomoFpQV7Zfv4ATLu6OoljhmIXUzCJ/Ju2zrYfxtZJSE/dOj/yIab0QqzqQgkiyAhVtvrgJgFRrOk/DtdCGP3YgAUBV4uUXRoaN30krHizTRuGDu9Y/I66TIwRqorXXcMJZsLeo/inK1TzAv5nuNnjKXkxbPwDE2X3yx+LJ5vAVY7EtB3ho86VA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748570857; c=relaxed/relaxed;
	bh=m1nbbSd4jMQL949Qz8xY/NE1wkOpHPXd978ehJQs1OE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P5TURBtcmPe4mGqHr1iVwgpz7Iz9Pre/pUnuexwE4Lyq3p+d8NZ62eB18iAfTGeRX9ttz0eArF6bu7cNv0/dEoBhI2r6C42B4qUM1usIIWIwoZVvmKF5LcGk+716adZxR5j+6Fx6m2de8miAkAEnt7f9+ot3po3/VjNTi3JYvD0SWgBULXGylcVbc/GwBqSTsDZEkJyOoA8b9DeiwUa0bvUCfu0/D6/m42OGwunQzR/7RZM4Q/ILcnok3byrg/PgH9YMQqaLKpUiY3BPB5Yg4gCd3vfk6cSKLC/8+AmvUuDOuJ3WIYSLnNgBBv/+MJ7WBLCdY6hiAGAC6LcQ88352w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=aIECjW+J; dkim-atps=neutral; spf=pass (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com; envelope-from=prvs=2245f8c747=amithash@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=aIECjW+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com; envelope-from=prvs=2245f8c747=amithash@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 300 seconds by postgrey-1.37 at boromir; Fri, 30 May 2025 12:07:36 AEST
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7mpc2P5fz2xJ1
	for <openbmc@lists.ozlabs.org>; Fri, 30 May 2025 12:07:35 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1tPPI025357;
	Thu, 29 May 2025 19:02:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	s2048-2021-q4; bh=m1nbbSd4jMQL949Qz8xY/NE1wkOpHPXd978ehJQs1OE=; b=
	aIECjW+J9JYg0KvijLMIzhDV30xTqnOlKEOr0P2mnDffa4ki3NfITvFYVzLIs2by
	a0ZJIa+xdzJV0kFA38ApRMiGxoe0YuY608LRMcnoCXWQgDdAqu/GFarVwlWzGrks
	BCxN9uvb3Fk7lWPjypNsckmBvELDKcmlFuExHQaxPug6s0BGWRQxpydrd/3zV34k
	OngcB/Mb3WeeH3G07pm+eogb9eSEFAvpniGqXMQ5f4vMD/jmBw2MUBK/N7vC6qfg
	jS2fB5FmHfULNDk2VO4oYvEtMWe7hb3Ys15YvvZOq+vwbuST8UHdx7BRl35VFrjF
	u1v4b/FEWRyGkS0+TjYo0A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46xhm4y6tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 19:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXrkv/sP1yalpTbXiwuSUSrdlvE695KyIWK77Oy5TU5eAZ1kskGdBBEv1V2A9EV4YnPy2SiESsLHQE+Xh7lDcgJuc+MDieR0bJNpJbncworvhhWNk3/lmZ9PNTUDcL9vIy2I+19ZeTVtSay2CNNS3w1sKHeQU9UnhCqc0RltZBn/7O5s5AlZeb6JCR10z9bMEjbuGsCl8m+nyzUBv+RtwUQcGuqQ63R3cqEhVGALt/bJcAzpQvzqnL8iLgokjRLYNTNbl6tPPmrzC9RR+wk1ukLNefmS4hVyU5AlTTqnpmhDa8l+BI02NZCY0kuFiUahzHWaMJj/OWa7bZd8IQ4hvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1nbbSd4jMQL949Qz8xY/NE1wkOpHPXd978ehJQs1OE=;
 b=cQerIoY2v1xabiqKmGDd21RQ17gcl7T+fQTbxN8ogVhGxux5unlboRP7IWq2g+n52ojSyyDXdShdiakABUb3btOWk2xcr6sXB70aXZw+oDV1gBKV6HG0j9KY22jw2JoH59fisedVJhO1yx93nwSdbsPIax3/xnl8FHhqf8m6diAd0n18xMXkHmx0IiP17Cs3a7zTeHcmZFK+5JuBf4Vn65qwp/x/mThQNCbNhQ+g2xjYyVhF/w70HaN+drrtbc+u3hQYwuYAeaoZ0RFP5fDxSdQ9/Z3a6EjciTfdRHtWSS/3GB+lZza/0QuL153jY7K6jUbSdragDbN+o71sgNK+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com (2603:10b6:a03:4f7::19)
 by DM3PPF51C5FE0BA.namprd15.prod.outlook.com (2603:10b6:f:fc00::416) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 02:02:20 +0000
Received: from SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277]) by SJ2PR15MB5801.namprd15.prod.outlook.com
 ([fe80::349c:882f:cf5d:277%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 02:02:20 +0000
From: Amithash Prasad <amithash@meta.com>
To: LF/OpenBMC Mailing List <openbmc@lists.ozlabs.org>
CC: "wangkuiying.wky@alibaba-inc.com" <wangkuiying.wky@alibaba-inc.com>,
        "zhikui.ren@intel.com" <zhikui.ren@intel.com>,
        "wangkuiying.wky@alibaba-inc.com" <wangkuiying.wky@alibaba-inc.com>,
        "zhikui.ren@intel.com" <zhikui.ren@intel.com>
Subject: [RFC] Special handlers for post-codes
Thread-Topic: [RFC] Special handlers for post-codes
Thread-Index: AQHb0QSfVVHXBd5MHUOspWVkytX9sw==
Date: Fri, 30 May 2025 02:02:20 +0000
Message-ID:
 <SJ2PR15MB5801C8B07E960251A53DDF98AB61A@SJ2PR15MB5801.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR15MB5801:EE_|DM3PPF51C5FE0BA:EE_
x-ms-office365-filtering-correlation-id: e598c72c-e998-4164-269b-08dd9f1e0337
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?P+daG124//HgrdAFLirtyf1y/N9Y6sgfxL1rauDUFGPe2ZrJvp+LEjYK?=
 =?Windows-1252?Q?s7/Xr25zN2SSzDq6YuCYjK5x/2LhgroGHOgoJtH0wKYArhjHZQlfd6T+?=
 =?Windows-1252?Q?OmlYZVgK1IWXNhC/lJZ8UhwWBLqNEK/Vti7BkPqpit96PxDnB4oHN2tX?=
 =?Windows-1252?Q?ddZ1s3o27MZcmERNNOeufyoE6KoeobLPieqwO3hrwFdscBVRsh9fCKEY?=
 =?Windows-1252?Q?AFlwFp3RiXrW7M7YRr2M9D9UCmSxnw5/jzhF3SXQ9me3A8g5hyIlQIkB?=
 =?Windows-1252?Q?vF+16cd+ByEiCXSR3PH6pEOApSe5SqXCNh1JT5DlsBNAvtgDW/9S77gi?=
 =?Windows-1252?Q?G1WT/XwycTuGej/RnJXGczM58URSjwp32W1gxvg37v6LW4MrOqTq5jeF?=
 =?Windows-1252?Q?0qA/7NcLd78GWj1s053EI+VAX+iWrxdY92hD1ERBqVmxC7Ss2grzVG+C?=
 =?Windows-1252?Q?SQDpt3xEtwuTnvPLH9yFHBmT3Uj5NnzAwjrH4Aejbm5DlAD0cpTWSNUO?=
 =?Windows-1252?Q?y/OnElV703Pe1YK7VBbcVuUM1vlQJjBKJpcDurdosAsm79ilvHmnUy81?=
 =?Windows-1252?Q?3zwBOwblDI5DrnjfTJC4+TX7i6z/0qzr1I1hok/Y5iodiMWoJCY6wIbJ?=
 =?Windows-1252?Q?r+9kJRAteSu2YvCeGKeqZ6vKvCDeCaK4aetpZwy1irTlpDcQAt78RKIx?=
 =?Windows-1252?Q?q95tJhyTh/bEd5K2Tk2fUZOTxycJaZahdmOBuhOu+T058J7xPAIZ1Ibs?=
 =?Windows-1252?Q?NCe0IXOyPe/mgjzJlBKiw8EwfB5nsTYu6qyyXdcdhTo+6hQ5VIvFcnH6?=
 =?Windows-1252?Q?EetdhMYTQrGyvsalX4e7a+WVhfXJ6bkqcSl40cL0Q/rY7TwqlcBakcy5?=
 =?Windows-1252?Q?/5tBuGHak20/47PhRllwNaLRplz80xBKsWE5EJPjWktyc07Ka27dk8qN?=
 =?Windows-1252?Q?Kf5EjIbUe8gp4RnTc8MQDXw2UwIs58fHE+qCkHQTsX0vGiOpUOUdNNcZ?=
 =?Windows-1252?Q?vaKv2vvnyPoxQhn6hylzHDau32P1BI435V74t9H7nOtPX6XHYbHMwRGN?=
 =?Windows-1252?Q?r6KOHM0LCUj6j+/XSGziJ7ftN5NNKFwFl5m+lSzWmCd1sNevBPU/gKHC?=
 =?Windows-1252?Q?a8gN4efS2Dz11L6OWDOX9UYPQdExAH/PupsKeu7VvpQbAKG9lbn3/zDC?=
 =?Windows-1252?Q?Go/upyp0mLIc1oPIHPIwu02vB4gqgts1rgYdjDJ2UWpWIkIhjWVOBwvK?=
 =?Windows-1252?Q?WP35koneDGt+dVr5PxcKvEuuZG/P29tPzSgKVbe5P0WINsbAMw2XO73A?=
 =?Windows-1252?Q?94T9DA7xN6y9LyIuWgtWhYDTeNPQB4r21uh7GpCMH4ly1ao1ZL9qLKpM?=
 =?Windows-1252?Q?HcZ9CPk7B8wd+Tmz4Uj4vF366tXjZkggSXDnkTJXY/7jBo3erWQdLmjx?=
 =?Windows-1252?Q?+3zoXEk9chLxiDdEBlC6HvQUQkNMTGOn6L7uXts6BfVoQsvmKvfivxaX?=
 =?Windows-1252?Q?bRhXnQNb033ELxmeHLehpK16auwU4+0cL20Opt29zlNPA++kKtc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR15MB5801.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?2DhFOVAmNnPzvy6vVnyQtdqcdPPMJftAAx52/i0N51LHkPZn7Rjdp9nM?=
 =?Windows-1252?Q?Xaoa7vB1ODCsvdIzgz2YZEV6dsa19PJbjZeFKxTZR5+8fQtqomGs0cNE?=
 =?Windows-1252?Q?hHRcshiS8+c5Yxz8LRMlW5h3DJLkBxtYumMBxAuxrn8L6Tz6gSuucNzf?=
 =?Windows-1252?Q?2sHdLsZshFB7Q1cTsfie6zJYYBHezVQfKlS10X10PlA4ebrU5tWmkoOn?=
 =?Windows-1252?Q?E/rnaL3pcfR4bQAlCRpqISa79+H+HFIO38yhufa50bXCeAs5ph1tys5f?=
 =?Windows-1252?Q?i17T9gXwwCnZxDDP2A69W1FBEWc+vq/c3mBnXfMXFXLEnV3sElZvH2Bb?=
 =?Windows-1252?Q?3+wGHrZJeCKzkkPWVYomiPrOoQuOc19ctZ861CaLZBSjBfiqdd2cim6W?=
 =?Windows-1252?Q?6vOrueZ40MAfvO3KWIF7PiXsHOSCkkeEcF0xFwW37S6lWnYyOJOR/DQp?=
 =?Windows-1252?Q?vNDHzmiEdopqLj3dsGcXOZGJyfneUk+CkjTzpYZnSnULHFatac5dm+GG?=
 =?Windows-1252?Q?fJqfjvL17JC5Dr2agvdXo6TZ8ZL1HVtiYO+q9YViHZuLVUOR3BQUDIDv?=
 =?Windows-1252?Q?c4P5uSLpLwz950bokGEknxfOwLcnsYgjZh9GfbFnnbsiTLqnMCNtEhrO?=
 =?Windows-1252?Q?ZrzIj3tGLLNETOp1l7YQD7HmMDT7m6YcNXcPMYd9q3K+XFRmuybXKpoz?=
 =?Windows-1252?Q?fdyRaSDgSDc+LmkNDg1KBEDKFEsb6S9Zou9aV+YuugKgQ/37tHY2EreD?=
 =?Windows-1252?Q?aN1I8ViVNaS8PVJAPTZN67mZjg53zvViMuuIwngafnW40s2HLexCSuab?=
 =?Windows-1252?Q?HB+N34Jt5KoYYyBVYM8CWuCBEOOWEVc7EWfC1t5y/91mfTvWlPwDHJjv?=
 =?Windows-1252?Q?Ter8Qjb18d2MLjnRPPQoRW3LZ59VKNrROErQP/mXHwoxxJHpvDjDlSGV?=
 =?Windows-1252?Q?uWhgxRXHSTO7IISHK9SwCyszgNqNNjvFLeoZAIEX9cgYGy16TqPjthq6?=
 =?Windows-1252?Q?VUQwmZMOqNv/3NT5Opjf1voAxAQO/z0aLRoOGx1FD1a8OGL25ro/y+AR?=
 =?Windows-1252?Q?zr+D+5eNxCShhtQQxDhTPdrJM+/z0hSMuElpIr0nBIBYJkMv0UQNgY8A?=
 =?Windows-1252?Q?dvA+jJB30vwXDfm/c/qyW8xcj3h86++DfqFK3xitmzl0IeyhSxup55m1?=
 =?Windows-1252?Q?q3tyZfpQWhF2zY5o1AzI/ViNTwkNAvhRaDQLdCf+fFdRBQ3U5AJL5aQz?=
 =?Windows-1252?Q?aATpSUmmLFn5ybIlsupM54J6lpHC+fqL+6ptP4GRw5WVGw7kuqyZSW1D?=
 =?Windows-1252?Q?0LKm5bpF52aGKdwEg5choSV8RY1bbZbb5eNnWKdedkepPmwLmS5fIEEM?=
 =?Windows-1252?Q?6L0sKKkVMNb5E9mw8d3gprxF5CipceEKWDQEzbb9hzB5iJaRdTYqJ8kA?=
 =?Windows-1252?Q?TjrhgmMvHjYHA9nHjnKzEIGhgfndvSc0rZQkUNE0t9dTMPXjBBeo8Gr3?=
 =?Windows-1252?Q?91ZHnu1WSSA93eUahvglW8lvlg7pOru8ZOI7EU4bLvS3XtJfu831fKqv?=
 =?Windows-1252?Q?CwB1PS/z0iO3nzt9YMcgmblKoSCSdEncgWPnwjXTh4S7GcNlErcWj7sX?=
 =?Windows-1252?Q?on7VNHbfocK+EM5SKqkXXek2gGA9OREEdQMnUWKZlH7GBSIi5FERfxlU?=
 =?Windows-1252?Q?l2D9olhAzz0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ2PR15MB5801C8B07E960251A53DDF98AB61ASJ2PR15MB5801namp_"
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
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR15MB5801.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e598c72c-e998-4164-269b-08dd9f1e0337
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 02:02:20.7890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JEXcMvj0XA0XAcr0JEwY+OmHrJV6gqsAL4dgfv9kIZX6JqIGYG4yHLb2OKp2ZrJF4g8hB2He7SJH8beeQ1nvpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF51C5FE0BA
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=683911ae cx=c_pps a=YqU5DhmqHHlC280H9UYkew==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=e-GSelqVAAAA:8 a=aXRAIEppEdEfU-gHYacA:9 a=pILNOxqGKmIA:10 a=SPVNc8zm76ap-NqF6mEA:9 a=1Fuz_aZiAdIJCloj:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=VTQqQez33RekakbJVocy:22
X-Proofpoint-ORIG-GUID: fO3Y8OI9cUZ3k7LyVPToQQf82vmP_688
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAxNiBTYWx0ZWRfX5Fih/NWdfsVX JmjvChdqvz3BMXPCDQ8CumY5tRPaVyjzymjoBRkw2rHXq78r4HOZbWa4UQ6yyti06UtmTuw0eL1 esBLve+Gy6sFXDIXrMcu0Nf+WPAvRN3aUYvQ93IYsFfG0eX8LTk4dva0I5wcPXpvJ344vB+C0Ml
 7sFW/AnAyGyD1BgmBHV0BM9MWbdAS9q1ScHCKPC0H1M7CO+XSxvjcSjhbHOsmPg59yAmjU4oGdF 81dxp3JxhPH1oV4PA/ZqNzj31cTYZ3xnwjtzvl3znuSO0PfSISEB/xEA8fH8OiG8CtndNH4FyZj XVmDZ3VEfugq75KIz7hjyHEgKgIH9q84icgqyLn+89jqmUsSuFRlTlWtmCuFUI7fsOBwEw+9qWP
 CmiUtwOw192VEw8E8GhcLg6Esh1iL0pPUURqP8V3oBUHGeEUGwjCmjjo0Pg8RQa9DX6yFYTn
X-Proofpoint-GUID: fO3Y8OI9cUZ3k7LyVPToQQf82vmP_688
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_SJ2PR15MB5801C8B07E960251A53DDF98AB61ASJ2PR15MB5801namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

There are many occasions when a post code from a server actually means some=
thing is wrong =97 especially crucial if a boot failure occurs before the p=
art of the system firmware capable of sending a SEL to the BMC is loaded. T=
o support this, I am proposing enhancing phosphor-post-code-mfg to support =
configurable special handling of post codes.

Example configuration:
[
  {
    "primary": [123],
    "secondary": [234, 123],
    "targets": ["my_special.service"]
  },
  {
    "primary": [999],
    "targets": ["power_failure.service"],
    "event": {
      "name": "xyz.openbmc_project.State.Power.PowerRailFault",
      "arguments": {
          "POWER_RAIL": "MyDevice",
          "FAILURE_DATA": ""
      }
    }
  }
]

The first config will start my_special.service if we receive a postcode: {{=
123}, {234, 123}}. The second will start power_failure.service and also cre=
ate a phosphor-logging event xyz.openbmc_project.State.Power.PowerRailFault=
 with arguments {"POWER_FAIL": "MyDevice", "FAILURE_DATA": ""} when we rece=
ive a post code {{999}, {anything}}.

Any feedback is appreciated. Especially pertaining to the secondary post-co=
de (since I don't have experience with machines which have a secondary post=
-code and my proposal is just a guess).

I have a untested proof of concept I am working on: https://gerrit.openbmc.=
org/c/openbmc/phosphor-post-code-manager/+/80646
I would love to get feedback before I continue down this path.


Thanks,

Amithash

--_000_SJ2PR15MB5801C8B07E960251A53DDF98AB61ASJ2PR15MB5801namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
There are many occasions when a post code from a server actually means some=
thing is wrong =97 especially crucial if a boot failure occurs before the p=
art of the system firmware capable of sending a SEL to the BMC is loaded. T=
o support this, I am proposing enhancing
 phosphor-post-code-mfg to support configurable special handling of post co=
des.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Example configuration:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
[</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; {</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &quot;primary&quot;: [123],</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &quot;secondary&quot;: [234, 123],</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &quot;targets&quot;: [&quot;my_special.service&quot;]</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; },</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; {</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &quot;primary&quot;: [999],</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &quot;targets&quot;: [&quot;power_failure.service&quot;],</di=
v>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &quot;event&quot;: {</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &quot;name&quot;: &quot;xyz.openbmc_project.State.Powe=
r.PowerRailFault&quot;,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &quot;arguments&quot;: {</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;POWER_RAIL&quot;: &quot;MyDevice&q=
uot;,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;FAILURE_DATA&quot;: &quot;&quot;</=
div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; }</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; }</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; }</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Courier New&quot;=
, monospace; font-size: 12pt; color: rgb(0, 0, 0);">
]</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The first config will start my_special.service if we receive a postcode: {{=
123}, {234, 123}}. The second will start power_failure.service and also cre=
ate a phosphor-logging event xyz.openbmc_project.State.Power.PowerRailFault=
 with arguments {&quot;POWER_FAIL&quot;: &quot;MyDevice&quot;,
 &quot;FAILURE_DATA&quot;: &quot;&quot;} when we receive a post code {{999}=
, {anything}}.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Any feedback is appreciated. Especially pertaining to the secondary post-co=
de (since I don't have experience with machines which have a secondary post=
-code and my proposal is just a guess).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I have a untested proof of concept I am working on: <a href=3D"https://gerr=
it.openbmc.org/c/openbmc/phosphor-post-code-manager/+/80646">
https://gerrit.openbmc.org/c/openbmc/phosphor-post-code-manager/+/80646</a>=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I would love to get feedback before I continue down this path.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sa=
ns-serif" dir=3D"ltr" id=3D"divtagdefaultwrapper">
<p style=3D"margin-top: 0px; margin-bottom: 0px;">Thanks,</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;">Amithash</p>
</div>
</div>
</body>
</html>

--_000_SJ2PR15MB5801C8B07E960251A53DDF98AB61ASJ2PR15MB5801namp_--

