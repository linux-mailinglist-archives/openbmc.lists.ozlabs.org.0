Return-Path: <openbmc+bounces-299-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714CAEC3E1
	for <lists+openbmc@lfdr.de>; Sat, 28 Jun 2025 03:46:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTZyT02zzz2ynh;
	Sat, 28 Jun 2025 11:46:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751018457;
	cv=pass; b=BTGAuHrqBoGglATZ3tn3w3AxRei5zWNjvnbBksJlRz/9JkwxwLQr1T79Nn5j1tgkmAqH9IfxHbHWNHOgV9TRkhdchsrhUWMC4RIyeyiHzWxKl4UeCJZhAg16vVB8J3QM6NChd9Dfud6kkSfPESbZb7pMgg8Ptom89uIz12bjGtYyhpPUj2Mxs2juxhhKoRrPKQSBFwqx1Fl8OU8+91+POYh5xQoaoUjqeKpr3vGtSabwwx03rNivhhdevzqXW1bb4zWUZeOsp1N/NCldnywSZuJeGCv6eWRnsHSEth6OFOhdk6omjDzbUiGmRT9TC5wA2lJeEEltgcrGf+kFKLZL1w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751018457; c=relaxed/relaxed;
	bh=np24p06CN2dGH6c8dHrozZ3e95oT9G9urCDX6gJ7Yro=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jtqQ4+bqJSzVapx/GNrIcrBR4o7j2Dt77IlYPp52bH0vfDvIUq85cgr6o/Ss52Pj0LuRYsDsxb2rtkg6uHucgG2j/FsD7jtJ0Y6Grcu3dsCJPkzdYp5sRn97Ew/Sfzr3tCQ1sVXa1BRtrOLazDKB8jIbKO5Hm0OcrRlOoBelrtlnDojbbmqJKJA6EWc4YCjZ22d32P6k9bcgVxyfgEo35RpfC/8rca9sIgPHZVVXnET2uJCC72QCGNmufDz2rt4D7rgCAubv74wRrBztJsxDCGROImGKHRvxZD8cbvC/eqQ2dBDHmTnhM5qCO3okixemt7vIfNdQeMO4NnZQl09mSg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bT9zT2Wj5z2xsW;
	Fri, 27 Jun 2025 20:00:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UongaMcW7EEbNoW9w8EMNs/ftxpiJB8zi5OBFgL+aW/7myIiTjVbNMCnK6tvTelL4ORr+f22dvmBePtJ8p7VBbSsArfmDn8qpViMVBl1+GG8bQiQH+VOIpZXkw4SKXOP41eeOd6Wanj5oVowC/A3TsR9kRtkimnFW434xiYE5NRSB9O9nxPoiCBw4NRV0lYwfdAklONPudv7ZIEIbnTSJLogYMaugqqv+1ePqEbQYwhtlkJ1vtr+4cbXoE37LvYJJPtLDpQqneRQ2ePkKHYtar3OQPlifPhzDqmX1btuguNxwU03jYoDv8GCK8vg6gS9aw3otN+genHFYBWFAWYawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np24p06CN2dGH6c8dHrozZ3e95oT9G9urCDX6gJ7Yro=;
 b=laMQ2LLJGuJpvcmmIQWu4w/iQajq8tPaVB2E7GnkJ1ZjDsiFA9bCMaerzpEaMYCWD5Yu7nhp6orNK+QT5MhsC7/vHdQt9GEX56qbPA3irH8M9WbZhwLFr4TEHEPLGImc/IUMlFkawENFGPyBBQKKVlHb3Hy+sRADVspNecxXR1YCFQWYaCXntcCXX6JWbumogeSOSbXKMTEScWxT2xkM2ckA6Pk//wYmOJhZJaG2erqRuRrve1hWeoaQn+Ck3uDWBfdjPOK4M1GBjcUmhuOsZTyRrq6xL/Viuj8cAWTI9OFdc42MLEdx2AR0Taj1jaaJs/L3dCj+L5yH3ws7Qt5GKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np24p06CN2dGH6c8dHrozZ3e95oT9G9urCDX6gJ7Yro=;
 b=XksT31/F3VDayLw2t6vZ6lwoi4ABL6OVNWVAYCoekCyveIEQO1lqbb+4VSf8bv0EW+aaYbPYarTlNZdquI6lupQzzMjjkT4r+mCVfj74YWzqfTJXE92/usTMM2bMdb7UfJ2odmm6NIQdXvli6QgB6d8SmWSItzlYPkj689IuAfY8APWV8XyOADmg9HxE9gFfKDHs7mMzvJ3GdDx/OWIv/vjTOD569HWyptq4IICcE3j4n0c4sNrNpoKmAu5jug2cgvmzTGNVgItuxDQBnE72QFYGURVawWa+Nk1fMzlfbFFCXlv+bzyx+bM9mMMBGtri3NwJ3YSVpTKN655LDVo+0w==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR06MB6760.apcprd06.prod.outlook.com (2603:1096:820:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 09:59:55 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 09:59:55 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>, "anhphan@google.com"
	<anhphan@google.com>, "wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIDMvN10gZHQtYmluZGluZ3M6IHBjaTogQWRkIGRvY3VtZW50?=
 =?big5?Q?_for_ASPEED_PCIe_RC?=
Thread-Topic: [PATCH 3/7] dt-bindings: pci: Add document for ASPEED PCIe RC
Thread-Index: AQHb3BN5FUCyyspBIEeldRXN3BMx4bQUcXQAgAJpfYA=
Date: Fri, 27 Jun 2025 09:59:55 +0000
Message-ID:
 <SEYPR06MB5134CA634C03D4BB0F73E4BD9D45A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
 <20250625210456.GA2177479-robh@kernel.org>
In-Reply-To: <20250625210456.GA2177479-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR06MB6760:EE_
x-ms-office365-filtering-correlation-id: 10c75ba6-c1b9-4d1c-c608-08ddb5615e69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?Y3JpWmJud1F0K0RsaHJRaUdyTk9LOG9PTlFEeDJhTGRSZzFMTWhLTThCQi9QU2Q3?=
 =?big5?B?bzkxVDNqdUJ4SzZ3em1Dbk5Sa1dFU0ZjMHo0UmpkNUNuY2VRMWl4R0hjeTVsdEFo?=
 =?big5?B?SlNCUEJmZDA3WjVuSFlTY0wydnlTVU5tTjR5Yi8wbHhUQjU0R0NLaStrOEx2VDJu?=
 =?big5?B?WlVmR2Vtbll2N1JzQkN0U2RvRm5OMTFCR3ZkNVg5bGhzcjdOYzVZcnVDcDBIRVF3?=
 =?big5?B?bXZoKytML0lRQ3UwRmYydDFDcHN4WHlNN08vemxJNlZKWitrK3ZRMnFLS3FXWnda?=
 =?big5?B?b2FmaXRrRC9WR08xMzZoQmFLOGRHT1U1dk0xV1RvMXA1bkpjR2RJUUluSGEzVW5j?=
 =?big5?B?dTJoemt3dFo1eVpIQ21uNXorQXBNdWppaHp2RS9aVFQ0SGJtUDNIZkNtMmV6ZUFV?=
 =?big5?B?WUZZb3p0TnRrUFR3RWJwYWQvazl6ZStFZ0o2OHdlQ3dDN2RKVU4vdWJucGo0am04?=
 =?big5?B?eVpUNTNpZ0swZS9lSE9Va0pCMThhRzhyK0NsYmxCcFArT2M1QWZVVDRMTjJ4cUJy?=
 =?big5?B?SmY2YmxINTNKMjJsd2YxaVowbUx0dEVtQnRRMmowUXhpeXlYMEUxZS9nTTlTZVlZ?=
 =?big5?B?bk5IV1VJZUVSRU5RVEVFNTZ2VCtEM2ZhYzFFdDIyYmdsWXZMdTA4clBBTUllcEwx?=
 =?big5?B?djQwRnB0Qys5WnFCSGxnbnNRVVh6Z3ZreU1mVFhiUWRLNVlrY0U2QUVGTlF3Mlk4?=
 =?big5?B?TmpUMkJMalBOdWFpcENMOG43dExLR1BwNm54V2tRMGlsSXYyc29jMWxXUll0ZGdq?=
 =?big5?B?enZuOHNYZmNVLysxbVAyT1Z6bWNNcWs0OXEveFhpSDY3a3dUOHNBVi9OU2xMVk9Z?=
 =?big5?B?ZjN5N1hObWVkNG55WlN4SkZKLzA3RHdPM1dQbnRPWDd3YVhObXdDZDBnRCtEK1Vp?=
 =?big5?B?Tm5kbzFEeE10NitqcXBpcXg5NnROQ2xCNjNCbGNOZ0ZHTnBKTDVkNURIY0ZIdUlj?=
 =?big5?B?NGJEVlZvZTZlOTBzbWE0TDY4S0dwNHVPZGM5MmlWMk9hbDN2UEIzVlVmb0xoSWEv?=
 =?big5?B?QVZUdldNUDhaSW9LSnNyWis3YVpVNDFIVklQUmk4RUtub0xGVTJYaWVqQVQrQVNT?=
 =?big5?B?Q3NVcVRjSE1XV2RET05VZTF0eFFTbnk1TlVVS1A4aGdPbWsyZ1B1azlkbVhBZURy?=
 =?big5?B?aWJUb0RTSmw3WVJoSHR1cnd0Wm1IbmgzeWplZVVDelBDZDlrdXJJU0Q1WVJNV2l2?=
 =?big5?B?dDN6VmxKS2k5Q0Q3OU9Fb2ozdXFQWGxBVHR0ZXJGQ0dKWHZvcm5KeWxkdnZyWFJ0?=
 =?big5?B?RkNOc0MzM1RoN1QreU9jQmU1M2xseGFkVEpCaER4ZjR4SlhkM1dyZG81OGZsN0dn?=
 =?big5?B?QnRjK1JTQUk1alpRUDhXY1FCbUpxMElKc1VsSElCUmJQZjE1K3Z3WS9JeHhuU2hH?=
 =?big5?B?czNGMXpIQzVFUWUwY3dFS0Q0R3ExQW0vUnF3N3JJVU50LzZQSHhuaEI2OUJvVks5?=
 =?big5?B?Q0lLTXFHeFlBT2FpOVdvbXdqaU9ocjZLNDJNQlV6K1VVY2dzWnFyRUdDWnRUam1X?=
 =?big5?B?SHF6RGtXb0Q2V2FScWgyRmpIdFQ3a2lZNFhFVWc1WXNyTUJ3Q3Ewd3J4MW43bk16?=
 =?big5?B?K2k5K1RXeUZzUGlHalZNbHE5ajYxL25xSmtxTmZhOGQ5Qm9RSzlyaURxVXB2SllF?=
 =?big5?B?QUUxTmZnNXdZM3plUnNDWmtUQXZ1UVJIVW94eUpxSW1LVVB6QS9hZVlTbFRNR0d4?=
 =?big5?B?UlJUTjE1dnlOT1dwRHZOVU9ub29KN0VFYXJFV2JVYjVTOVJITzZUazVEY214Z2dS?=
 =?big5?B?eVU4RWJyUUpIa203U0l0Z3ZNcWtodk5QVFhNL0dVTVBaZDl6SDlYMldBMi9HU3RE?=
 =?big5?B?bnZ3SFZSS3BLNnFWWnRuQk1LbHlsSmgwbjRHNVo0S0VsT2pVa3pxajFGNjFMODhQ?=
 =?big5?B?WmVRM0h3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?TXNmNE52ajBYNGdXa1l3UzVKaUxpcHJQLzhXVEtFMCs4VWNSMGIwdkxmRW42Y2ZK?=
 =?big5?B?V2tvTnYwNWU0eEt5TExnT0sya3ZBeUJQUi83ODlSejBKdTI4dG1HVjNyZTB3TDc0?=
 =?big5?B?WklidzFUMWlnelRYNHc3NE9qNkxkVHltTmNIbWlWMlVtZDB0dlNpSlVXenJ0Rm02?=
 =?big5?B?bWI1WWhRWmNsaEV0bHl1WWZHVjQyNWJtbnhIUWZCUVo2L3VKTVpJMGdYaXVIY0RH?=
 =?big5?B?L2UxMDBIOWk0dGZRMThKVE9Kc3pnaTdaVWNPa2VhZUtYa3gxVkJQczFxVDdJRDR2?=
 =?big5?B?VlhpVlVDZGRieVdESmUxRGI4azZYQ0w0UWNITWRQQnh1RGkvdEZ6RWFpU2RTK2tG?=
 =?big5?B?WEJKVHlValNFMlVmU2UvRXlpaWYyam9VUXNtYmVkdTVPeTZmYTJja0hVWVdBUkk0?=
 =?big5?B?V0s3SEJMdUl6V3ROSG4xL0EvWnVkNGdGd3l0Vlhvb3pGcXdsaXB3T1lmcW9WbjhK?=
 =?big5?B?UXhKeVI3V0owejF1YVAzdEdlOC9lcHRnaG1keVZMVHF3LzEzVFNRL0RmUHcreFFi?=
 =?big5?B?RStrc3MrWG1LUFJDT1FCa2NlL0x1ajIrckhiM1ZRQVRhODJLMGEyd0dtdWZ4NHNt?=
 =?big5?B?Y3d2bjV4S3ZONEoza0JhQ0tISWhEeWhOMitndjMrL0xWV3BOZ2xzNWpreEk2Uklh?=
 =?big5?B?cXlwRTVFaHBMNUNOQ0dtaTdQNS9XMEhPbGZFM2xxREJOS0tSYU5kR25wUUVOSTVN?=
 =?big5?B?TGdweUdwMVZkY0dnQXhad0Zrdisvckd3MnBCS2s3NXRoQjNJWGNnREViYnJ3TzJt?=
 =?big5?B?bDBzRC9KSmhIMWRMelIwWHNRS1htNVZKUjBqMENBbG4zOW1oVllscGRLYjBvc2lF?=
 =?big5?B?WVlOaFNWenVzMVAvbVdkcU4wZlphUXN1NFREQTJCUWtyQWVTV0FrMlRXV2xnMldy?=
 =?big5?B?Tmk2aThPK2g2Um1UWXFTdzdwWVNoQUFFYmdONnZuOVNiYzBJWE85NVNWaWZMQWdI?=
 =?big5?B?ckdPMmNVdGVYcEQxdmRNeU9EVWFlazErd2lldE9YemdRcHRxRTVncTFSZWpGVkdS?=
 =?big5?B?T0M4VVFTaDRmQlJmOXZNZE1EN3BEc21vZE9mMnd0eFljNW5hTFNCdUVlQU42NUU0?=
 =?big5?B?UUtTV3BidE91TUZ2WXg5eFY2c2VaRnN2cnBVajlyNWNFajhOYU9FMXhSRnJ5cGdX?=
 =?big5?B?NDhsb0NXM3BtWDlQVkd3dHJqRFc2QzhTVmtUU0tsZ3FURlgzaWVhWEV2bGYxS0kr?=
 =?big5?B?WWFTUUdFSS8xcmE4YUpoMkorbmpFc3BBb2pISVdsdVpVa1ZVVUFOS3N2SkFyNHNw?=
 =?big5?B?aS9MeVVRcHRHYnZCcG1yTGhKS3VhbFcvQi9maWtVWWI5cnJzaWR2SG5UaTZ5WERw?=
 =?big5?B?U1VSRkZjMjl4QnAyRnhzM016dEJUMDB2TFA3anZ6UkZ5RHRPSUViWGczVnVyWHNk?=
 =?big5?B?RzAwNmhWWDJMVFV3b1FsaVh3S0I5TjhQcG1SL1lQa1FoNzRlQUNGaUNnSjNhbHpN?=
 =?big5?B?UDZsaEh4YUhTSVRZcW5mLzUzYWNBSXI4VHF3YVZSK3dnWStCcjF4TStsN0x4dmRl?=
 =?big5?B?M1p0dHlmL2lzb1RsNy9JdDN1U21KeVVScjQzNjZhMVdMakQ1LzBxYVIrSGY5UkNK?=
 =?big5?B?SGdJVnVMTzlKTWtrd1g1dTE0ejhXYkdlakdWSTZhMlUxYTNNRy9iSXdMYTFyTVFV?=
 =?big5?B?ZVNEMkpNaXg4N3N0Njk0UloweHoxbUtyNHJObmxtUEZYWUQ2SCtDVjVjQTdrZ2Vm?=
 =?big5?B?aFg1Z2tmYXdvQWE1RFd1V2gvby9EQzVPdW9FM2tXM3B3dENHVUN3RXJLUWM0dlky?=
 =?big5?B?M2VzREJUcUJoRDBsZlp1MVR3MGpTTm91dWQ5dGtCUWMra3lXVVBsMDVkRENpbXVr?=
 =?big5?B?cjQva3kzb3RKNjFKVTc2bHgwWUdnZm9wNjR4QStYN1V0L3dyNERFMk42UTFoTC9q?=
 =?big5?B?eU1wbFRuRkdHQXNWMWZ3ZHhvdmFNMVVlYWMzbUVPMUVsMnN0TjRjOFRpVm0xeDNV?=
 =?big5?B?VTBsWGw3TVg0Mk8xczVrWE9vTG5FbGQ5SGtGZElkODhrVGp1YUVCTU42RDVpVzZa?=
 =?big5?Q?HFETJO6lbK6aB2U8?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
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
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c75ba6-c1b9-4d1c-c608-08ddb5615e69
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 09:59:55.6898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jRkGezq6cxi0nQa7ufpLqI/QjbdIskTs3lSXqq+0BavoD/zKN2UGN5JCkYBmiElXv1ziOfrunAfD7kEirTr5SAmEdRM26kAIhi5n/Nrn8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6760
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ICsgIHJlc2V0LW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6
IGgyeA0KPiA+ICsgICAgICAtIGNvbnN0OiBwZXJzdA0KPiA+ICsNCj4gPiArICBtc2ktcGFyZW50
OiB0cnVlDQo+ID4gKw0KPiA+ICsgIG1zaV9hZGRyZXNzOg0KPiA+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gKyAgICBkZXNjcmlwdGlvbjog
TVNJIGFkZHJlc3MNCj4gDQo+IFdoYXQncyB0aGlzIGZvcj8NCj4gDQoNClRoaXMgaXMgdXNlZCBm
b3IgdGhlIGtlcm5lbCBhc3NpZ25zIHRoZSBNU0kgYWRkcmVzcyB0byBQQ0llIGRldmljZS4NClRo
ZSBhZGRyZXNzIGlzIGZpeGVkIGluIEhXLiBJIHRoaW5rIEkgd2lsbCByZW1vdmUgdGhpcyBhbmQg
YWRkIGhhcmQNCmNvZGUgaW4gZHJpdmVyIGluIG5leHQgdmVyc2lvbi4NCg0KPiA+ICsNCj4gPiAr
ICBhc3BlZWQsYWhiYzoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3BoYW5kbGUNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBQaGFuZGxlIHRvIEFTUEVFRCBB
SEJDIHN5c2Nvbi4NCj4gPiArDQo+ID4gKyAgYXNwZWVkLHBjaWVjZmc6DQo+ID4gKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gKyAgICBkZXNj
cmlwdGlvbjogUGhhbmRsZSB0byBBU1BFRUQgUENJZSBjb25maWd1cmF0aW9uIHN5c2Nvbi4NCj4g
PiArDQo+ID4gKyAgYXNwZWVkLHBjaWVwaHk6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogUGhhbmRs
ZSB0byBBU1BFRUQgUENJZSBQSFkgc3lzY29uLg0KPiANCj4gVXNlIHRoZSBwaHkgYmluZGluZyBh
bmQgbWFrZSB0aGUgcGh5IGNvbnRyb2wgYSBzZXBhcmF0ZSBkcml2ZXIuDQo+IA0KDQpEbyB5b3Ug
bWVhbiB0byBjcmVhdGUgYSBQSFkgZHJpdmVyIHdpdGggZGV2bV9waHlfY3JlYXRlKCk/DQpUaGVu
LCB0aGUgUENJZSBSQyBkcml2ZXIgdXNlcyB0aGUgQVBJIG9mIFBIWSB0byBjYWxsIHBoeV9vcHM/
DQoNClRoYW5rcywNCkphY2t5DQoNCg==

