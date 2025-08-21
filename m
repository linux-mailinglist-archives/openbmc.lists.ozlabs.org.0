Return-Path: <openbmc+bounces-502-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C55AB309C3
	for <lists+openbmc@lfdr.de>; Fri, 22 Aug 2025 01:01:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7Jhm4plYz30Vs;
	Fri, 22 Aug 2025 09:01:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755760966;
	cv=pass; b=JIerfmNQv3x2ZVzA7balABFAfzm7cPqUgOTxVy62mZoY56NTWt+uukoKihjuPVL35mYhUECgUO8aMNMAMoHwRIO3PN+Hsb5ssKVtVK7F2aZdMzS5uvJDQ2t/TdPK4l8vrRR05jMG8c+nDNFayHDTk8FfdjfkBBrvZH7RzTa7K3OsOorNljoTlkRN76FtxgwqzLFcZ8CiJa3BSG3pwTngzmEIZCnF5TjPqHgWlysuoTJw/yKvq/gb6nIfrsKH0hVAW6sXlGzkdMar0emI3WNRkHxzcW6BADXUdn3J/yjoJHV36iUwV//Pp82H2TTkDBe8o9zMqr70YHqB8YraDBJdFA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755760966; c=relaxed/relaxed;
	bh=/RNW+UaayiV2d/8UQWdPkt3O1nhwHBVAfemZ92BguOw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nI6sIDwiYbL3mhQxEIBYMKS4wgGv3ia4gn0GPZ2glrEgXbFOLMlLH6WOLD8VNfqqcJ8riOJKh32CCcEpLCKRMWjt+rhjtThI9JDi8bmKOUfy05THpwWp0R00vRut6mg71NhW19XKaJ302BjlhwvI39z+hsuN4tm/Yq4joBy3daLBxqRXYVrYljxOaNiazXs8fVoelMkwVL4D98hcSrNnAQJPMwhTCFFcQy2IFwwapXNnZiNQ+TfjTC4j3L+YmYfbOuQXhBFxtkAKB0xXvEIh6KfGElgtnLObFY45WmaOocIMGp83+8tWGiJWq+8z8hVRsesn3ReJ+C2085evAOFsTQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=jojcw0qo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=jojcw0qo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6vsw5JwSz2xPy;
	Thu, 21 Aug 2025 17:22:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdSPAfkZmMvZ7rWBKSemxHQnZixuc5yyV2dlwRh0UGBsiBpkm+66kFqJ3DAJm/gE+PZ5Fc9RVrXZS8huO36JDatdfzw6B8hemH7/YqQVT7Qzd8a6XuhR9YoKdQx1tqTJah+9Hs2fm3coASBEJIM4X+BNFN95V/jsDLh/PqdYVcpRums7dfw2YpBBKUGM2BCfg3ctrdV/+sohQUKgluVQNhV0k45PObMInHDj37rW9UFb0N8CJIJDsDEN8V2k6LTdQZpKUhHsTP23ZAb76dTUuo9TrAqyhFUuXrPwvlvo1SDkVLshu0HgKOzY69/LrcXgdEoS+WXJ2VDzbUZLWsrR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RNW+UaayiV2d/8UQWdPkt3O1nhwHBVAfemZ92BguOw=;
 b=YD7s8ha8Or082jh/P1HdUn17So9N42uVSxK5witkSKSYODhyp8+ISrvKRiKjtrZfNZ6XNSxfqE4H3X7ja19aEHayO9Tx7FNLas6212hqeqGO9Up7bLAhjs+rAaiLJ+Znf0L90lIlf0zmpNmDqHDCHRX/8Jibie3HkvbvJTXdLaZ3claX/fhwuh9SqeOHbbqxFLLxZXIHuWLGDZumpIxYuMO95jz6MiwNFG5HiD9QlETa9wcTa1RKkMdbKGeJNSUzaOaUTVQ+3AV/FrPxqZB39wHgqKC6bRqMO9se3UmjvpN7D93xlCnHTp1HSu2PkNxVejyu1d47yhFt7IHZatbHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RNW+UaayiV2d/8UQWdPkt3O1nhwHBVAfemZ92BguOw=;
 b=jojcw0qoo8U2+tGQ39Z3PruPR7Dzy4ZRPDNiq8k0o7j/cW6MIbWZhy20FsnNGmElmmzGtH8K3qLNtjy2E5t6ZSiUC4DLlZeOuSklCP9n5iv3z1hkIDONtItHLSI/U2jvHSxOYfgEOIG9mG9fLYsHQHHQ4dp+aX6uMI+2lLPQDiLq9h4r6PL7y1PxFhvz7pqg+yZVttTmRQgSZitBkfM7C+UH/eiLV+rwHAXnhUaesAeqXuKllsEtDIwayZUqDNPwFKBpGzsHFXCkgFcHVjUKSyb/H+sjeqcBNgamBc7TnumxLwg2N5rEAdI1HUwLrXFV1yUacInwP2KFFFxFFFJniA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR0601MB5799.apcprd06.prod.outlook.com (2603:1096:820:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 07:22:19 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 07:22:19 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Topic: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Index: AQHb9Tqmkbg3qF5lqUafax+6ueL4M7QzNMIAgDm4VnA=
Date: Thu, 21 Aug 2025 07:22:19 +0000
Message-ID:
 <SEYPR06MB51347542A7F24E14ECB2A0949D32A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
	 <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
 <e52bd959eea8a4284404f701d0519c4631a31238.camel@pengutronix.de>
In-Reply-To: <e52bd959eea8a4284404f701d0519c4631a31238.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR0601MB5799:EE_
x-ms-office365-filtering-correlation-id: 7bb8f9bd-e34e-4bfa-c732-08dde0837701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?WG5UL2dncTlSWHdRR2NDeDk4cXBMbTErbjJyTzNMQnYzL05ZTHpTUGFxbGVy?=
 =?utf-8?B?UDMrd1pCMGMveXF5QnZnZ2VOVzdxVG4rWFlXZkVLSFlZdHNHcWNWRlBPQnFX?=
 =?utf-8?B?UkVJYU1LYjlJWTZtOTdES2xmWFhLVmY4MTBFRjNCSnNBSld4UXpKUmxIdWs3?=
 =?utf-8?B?RDQvZjNMWkdydUgvMWhIZ3lGRi81WEJFdGc2UnNwcXg5akcxTmNBUU13dzNj?=
 =?utf-8?B?QVoydk5vVDB3UFU2L2RzT0VLN2NzTm1rV3ppMFByWHZhZ2RwU05YU3dZMHhE?=
 =?utf-8?B?cE13djd3a09adG5WU3MydFYwRWhOSkp4YWNLMC96K0o0aTVHU0t4Tm9pYWsw?=
 =?utf-8?B?b2ZYcVBoWFYwek45WDFuQXp5VEY3RHZYS0tyQk5JQkpKRFdtT1VKZUJXYUly?=
 =?utf-8?B?cTJpczR4OWRwbVIvTTZWSVlqU3c2ZnZpcTlLYjJ6RjdPZmxncU16dlBwVnF6?=
 =?utf-8?B?VjJGTFRmN0tKT1I0TUw4Z3NVRWJ0VkU1K3c2N2p0WUtJaWtyYXZmRldXMkx2?=
 =?utf-8?B?T2IxWkVkb29BR1RxVVQvSTdCWnBod1k5cFpwdHlPcXkrc1piMjd6RjQ3QUJm?=
 =?utf-8?B?Z091Y2xucE9yYzZaRFZnVFNhN0Z2eG1oU1daWjNyV2pNT1ZuaDFrdVRVMGRL?=
 =?utf-8?B?LzJhSGlMV3huRU1sZDFnQWFtNkpZSjgvcUkrSENPODZ3K01sTHFmNnFGUEpX?=
 =?utf-8?B?NTF0MHA3NSt6Q0M5SkdoanVFanVjbXI5N0V0MlY3TVoxblIxMFc4YTJvK3Ur?=
 =?utf-8?B?YW5KYkY1WEo1M1FBQ09wcWJuSTNEVHlBcS9pbG9wdXVJL2VrVkdJbi8rbWZo?=
 =?utf-8?B?alZJZVFKYXdFQWpGMVp1Uy9yTDZ6TWtmZzg1elhyWHQ5NXVSOVBUZjk3N1pJ?=
 =?utf-8?B?ZlQvV0Ywc2diOFg3aklrZDM5RzMwVXlwK1huTENFYkJoYVFzYnB0RmRjbUZE?=
 =?utf-8?B?cEdkWnliSXpBY2NUYTN4cThXRFREZWZjU0NLN3hlRDNxTkVRQlk0Rmp0cEFx?=
 =?utf-8?B?U1E1R1FyWTF1UnRmeDl0RWxnVlpxdk5KMGVnQ2lMZEh5RFF3MGtQMTBBVFdG?=
 =?utf-8?B?YWJMUzljT2lUTlNJWVFtbmU5YWNYUmJwMG5LS0NaZlpTOXJ5azFya3N6YWNO?=
 =?utf-8?B?NnRVZThoZjFOeGhJaVk4Y1MrOTlTWE5GNjBJK0JkQ3VoNllsOStNeG4wcGZr?=
 =?utf-8?B?UVVqVVhQZURxdm5NYlZmRzMzNlJEdlU5T29lTUNhdlpyaE5PY0NOUEdiOG92?=
 =?utf-8?B?c2F5cjJTMlhic2wzOGFEeGlFYit4RmNaaHQxSFA4eGtOT1VOMWJOcFptWE4r?=
 =?utf-8?B?bjFCMzBaMndjbTNhMEVFOW9ZTzlqQ05ZUzJTSkhIUXdNelpxV3dicGtHeGZN?=
 =?utf-8?B?QVp3YzhNb3RZajdiS3M1V2dkVDBnM0tTdUhOZEJlWEtEQVFDSlY5NlNSbnV1?=
 =?utf-8?B?N0JWV0dhRHhNOE1xMVBMQVdoTW0vc3VjQnFFSGxzMktCbDNCODVYWmJ3amZj?=
 =?utf-8?B?QTdMQStPeDBRR0l1dVNVS2xUK1NMMTBZNEUvcndRODZwdWVpSWFYRzZPM0dV?=
 =?utf-8?B?K1ZmV2h3dlRwT0UzL0F0TWpsdGJGczJVM3dwdXlRUlpYUVFQVS8wV0NBTUoz?=
 =?utf-8?B?ZG40dkFleFNDY2cvOFVNQVVMM1lsUVNFSEZMdksvNm0zY0tKZ3dueHFQcGk4?=
 =?utf-8?B?NHkvWEZJWERqZVpEQWFDWUh1UWk5Q1FldEpsS3RYdDRxeWRWeTlZU0YrcUxB?=
 =?utf-8?B?OFEyTlg4cEpPMytVZlB4L1RoWTlCM21jcWVOU2lMWWpBSEQ0bWc1akhFRmti?=
 =?utf-8?B?c1lRMzR5eFhSNlBiMWVuQkJLeStKTllCcm05b29BMUlwb28vclZWcmtVQmU4?=
 =?utf-8?B?V0l3aHR1ZkpaZDJSVUVwT1h4amY2L0xxQVkwOWZWcVBuR3h1aGo3WTRwVDB1?=
 =?utf-8?B?Nk9JQWRQdHFkaWdtVFVHTk9RTGZ1QmMyREdwcjcvS0NTN015RXNlZlZVa2tv?=
 =?utf-8?Q?QSg54pS9fb1eGI41TfUGiJ/iZpPEos=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVU0WTBObkxnTThzZExxZ0dwQzdxeTFETGtBanlYNjdwZ2xhZkw1RW1mbjB4?=
 =?utf-8?B?Z3huTmt3d1A2dXFpRWM5UjJDdEUzWkNIcFllR1FtTGhOY2Z2VDVFVWNpZWMv?=
 =?utf-8?B?NHIwS0VOVHlSMUN2WllXcEVPYzFxdTdqV3BGSkFqNkorQ1Vqc1ZoeGhQcmJT?=
 =?utf-8?B?ak1vaC9VbFc2a3dRSlU3TWl2UE84Y1Q5MW9oSXljVmxPcVcyOU9iTVIrUE11?=
 =?utf-8?B?M29vY1dHSnpyUEQ5Ym9BRFpYSHROMlI4blZOVVhUYm1TcWN0eHo2SFhpc2E1?=
 =?utf-8?B?MjVmUmczcWkzSldaeS9IL3ZYWW1xUld5ZWtqVklRMnhDV0YwOG9vV2tXWGVr?=
 =?utf-8?B?MnBoREVGRXAwaXRqREc5UkRwS2U1VzYxZkJjd0wyN0Q5ZyszMGlGemNrVXNn?=
 =?utf-8?B?WEJ4SDBTR25LNUh1NU9qS2N4VEJZVm9NOFlab2tVSzJjYVVpVE8xam9ZSFZp?=
 =?utf-8?B?dWRXTURMdUNrdzZ0SUVpLzMvd1RoVHJuL2V3bFg4VDFXcGdibFBUeG10SjdY?=
 =?utf-8?B?cFJhSjlGU2NmWXRmWHJiUnpWS1BDdENuY3lsUlIzc3Z4SU1oWTl6T1RwOVVB?=
 =?utf-8?B?RkE1c25TK2c5Y2lDL1FjOStmQ0lHNVN2dnRXSldpNkVETTYrYWxWRnV3N2Fr?=
 =?utf-8?B?RS9TN2QwTjB4MWlONjRTdG9nQWkxdWd1TjBLVkxIQ1VjeTFRR0xOeTV5eTFu?=
 =?utf-8?B?R1NORnpZN1hweGhObkR1MzEyNHZnNCtiWmpZS0E2SDVjSWhOQ2ZvMGl2TUNX?=
 =?utf-8?B?Vm5RK25ZUFZyTnlucXpqcnllNGUvL1pxcWtCRC90d1c5bmdjcXpOY1grb0xa?=
 =?utf-8?B?bkJTVFA2TVhTUDU5bVJSc1czNEVLYmtCeEJLRldSUHpXUk9EY1NTalA4Y1JF?=
 =?utf-8?B?K3oxbVVCOG9hYjlGVmE0aDR3N1NvUnFQN2wzN05sbUtUSy9QUzBrKzZMTTJ5?=
 =?utf-8?B?MWVNOU9scHhzb1RKelJGdDRmLzFNRHljNnRhZExLTzVTRUxGejFYQ0lDQ3hL?=
 =?utf-8?B?WXhPenNHQ2hGNWpTZlR5NGhEaEl1aDg3YmI2M2hoWVVqZjdSdnRoZERaMGpC?=
 =?utf-8?B?S1dPOTVxbVBFU05qNDY0cHJmejBobHQ5bXB2eEx2bEpGTWZNVEJicloxQTZv?=
 =?utf-8?B?VWxLYkFaMGJiTVFLQ1FXdlVWZG1SNEx1bWRBVkdxNldlSmdMb1Q1NWZnYTJm?=
 =?utf-8?B?d0huMkVLVFBudVk4WEJIWTJ3OVJ0YkVZZTdUMThiekM2Zy9GOU1lY0gzUWVD?=
 =?utf-8?B?M093cGpIUXgvMSs1OGpybnR1UDFHVjRCM1FUWHgyckt6UXhCYkNkbjRtOFhQ?=
 =?utf-8?B?eG0veWY4WlFHWE93WllnRkJlUFM0NVNjd2o0S0lrMytyTlZQMVJlZ0tJczcx?=
 =?utf-8?B?UnJSN0NRU0FhZTA4S0NZTDQ5ZTlsY1B5Z1ovbmNRek9pMjQ3cTI5ZkR2TXc2?=
 =?utf-8?B?K0tlbmVxZk85dW1FaXBWRWtKbkViSVFkOUhXOUI5bERWRkgzRGZldFBRMVJh?=
 =?utf-8?B?YkUzM3d3QTN2NHJxYW1HNk1BaEM4a3ZSVVhNdEptOFNmWUNEZEpqK21FbldQ?=
 =?utf-8?B?cDJLa05GVTBBdVRrYVc1dUx3Ym9XczlIMWxGUDMwVFRadkpSclF5Y3lqeW1R?=
 =?utf-8?B?NkIyajg5RlBzanY0bWQ0dTYxU1FaYmZVakgyQ0Q4ZnZJWXFYaVRJV2hkUWwz?=
 =?utf-8?B?RlBYbTNjemZYcmJYZlBiM2lybElSZ1JlUzhZUFR1YkRUdjg3R25NdW5CWW1O?=
 =?utf-8?B?czI5OTUzSjkrelQzVzUyM2piamlOcEwxZFZidzl6bTF6YW10b1dSek9nQjhp?=
 =?utf-8?B?YjJtaGJWckhPSWY2MGdkZjdUUXlLNVFtMDZlazJ0ZmRpZFprYzMydG5LWmNJ?=
 =?utf-8?B?dXZISkFQNHQzUUJJTngxeEU5TGFVcFpES1llWEQyN2EySFphN1lySjVTQSta?=
 =?utf-8?B?WmRHRWV6cjExc0ozVjBsMnRDSEcrNUJEbi9EU1QwYkpxRHFkTnd2Z0Flb2I1?=
 =?utf-8?B?WElkeFBsQ0NjazdSYi9TVzZka21jV1RIbC9PRnFDc1NnQ0JBK2c4U3JTWlVu?=
 =?utf-8?B?YVUvMmpNdUlZdVVLMzYzVVR5TXhON1VySnd4YlVPM3JxNnNUU3g3OXFKMzQ2?=
 =?utf-8?B?UUlKOWNBSlE3NzQ4NWNCa3FmbFQxbVRPUi8yV1phd1hEVzNjKzFjUTdkNGFJ?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb8f9bd-e34e-4bfa-c732-08dde0837701
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 07:22:19.7938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eHqTNojaxI18e+JR8hPcUgqDxB1IK4mveIKxu0/x6td7mJl7yWpUFd2jmUyVtJ6EhK3xPT/SIsu8SD2R/3SuG3xf1nRSsc2noQmtm5KPyKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5799
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgUGhpbGlwcA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiBJbnRyb2R1Y2Ug
UENJZSBSb290IENvbXBsZXggZHJpdmVyIGZvciBBU1BFRUQgU29Dcy4gU3VwcG9ydCBSQw0KPiA+
IGluaXRpYWxpemF0aW9uLCByZXNldCwgY2xvY2ssIElSUSBkb21haW4sIGFuZCBNU0kgZG9tYWlu
IHNldHVwLg0KPiA+IEltcGxlbWVudCBwbGF0Zm9ybS1zcGVjaWZpYyBzZXR1cCBhbmQgcmVnaXN0
ZXIgY29uZmlndXJhdGlvbiBmb3INCj4gPiBBU1BFRUQuIEFuZCBwcm92aWRlIFBDSSBjb25maWcg
c3BhY2UgcmVhZC93cml0ZSBhbmQgSU5UeC9NU0kgaW50ZXJydXB0DQo+ID4gaGFuZGxpbmcuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBDaG91IDxqYWNreV9jaG91QGFzcGVlZHRlY2gu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL0tjb25maWcgICAgICAg
fCAgIDEzICsNCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9NYWtlZmlsZSAgICAgIHwgICAg
MSArDQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1hc3BlZWQuYyB8IDExMzcNCj4g
PiArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExNTEg
aW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLWFzcGVlZC5jDQo+ID4NCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wY2llLWFzcGVlZC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BjaWUtYXNwZWVkLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uYTdlNjc5ZDVmYjQyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1hc3BlZWQuYw0KPiA+IEBAIC0wLDAgKzEsMTEzNyBA
QA0KPiBbLi4uXQ0KPiA+ICtzdGF0aWMgaW50IGFzcGVlZF9wY2llX3BhcnNlX3BvcnQoc3RydWN0
IGFzcGVlZF9wY2llICpwY2llLA0KPiA+ICsJCQkJICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUs
DQo+ID4gKwkJCQkgIGludCBzbG90KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgYXNwZWVkX3BjaWVf
cG9ydCAqcG9ydDsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHBjaWUtPmRldjsNCj4gPiAr
DQo+ID4gKwlwb3J0ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpwb3J0KSwgR0ZQX0tFUk5F
TCk7DQo+ID4gKwlpZiAoIXBvcnQpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+
ICsJcG9ydC0+cGNpZXBoeSA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUobm9kZSwN
Cj4gImFzcGVlZCxwY2llcGh5Iik7DQo+ID4gKwlpZiAoSVNfRVJSKHBvcnQtPnBjaWVwaHkpKQ0K
PiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwb3J0LT5wY2llcGh5KSwN
Cj4gPiArCQkJCSAgICAgIkZhaWxlZCB0byBtYXAgcGNpZSVkIHBjaWVwaHkgYmFzZVxuIiwgc2xv
dCk7DQo+ID4gKw0KPiA+ICsJcG9ydC0+Y2xrID0gZGV2bV9nZXRfY2xrX2Zyb21fY2hpbGQoZGV2
LCBub2RlLCBOVUxMKTsNCj4gPiArCWlmIChJU19FUlIocG9ydC0+Y2xrKSkNCj4gPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocG9ydC0+Y2xrKSwNCj4gPiArCQkJCSAgICAg
IkZhaWxlZCB0byBnZXQgcGNpZSVkIGNsb2NrXG4iLCBzbG90KTsNCj4gPiArDQo+ID4gKwlwb3J0
LT5wZXJzdCA9IG9mX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShub2RlLCAicGVyc3QiKTsN
Cj4gPiArCWlmIChJU19FUlIocG9ydC0+cGVyc3QpKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgUFRSX0VSUihwb3J0LT5wZXJzdCksDQo+ID4gKwkJCQkgICAgICJGYWlsZWQgdG8g
Z2V0IHBjaWUlZCByZXNldCBjb250cm9sXG4iLCBzbG90KTsNCj4gDQo+IEhvdyBhYm91dCByZWdp
c3RlcmluZyBhIHJlc2V0X2NvbnRyb2xfcHV0KCkgdmlhIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNl
dCgpPw0KPiBPdGhlcndpc2UgdGhlc2UgcmVzZXQgY29udHJvbHMgYXJlIG5vdCByZWxlYXNlZCBv
biAucmVtb3ZlLg0KPiANCg0KQWdyZWVkLiBJdCBpcyBnb29kIG1ldGhvZC4NClRoYW5rIHlvdSBm
b3IgeW91ciBzdWdnZXN0aW9uLg0KDQo+IFsuLi5dDQo+ID4gK3N0YXRpYyBpbnQgYXNwZWVkX3Bj
aWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+ICsJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmhv
c3Q7DQo+ID4gKwlzdHJ1Y3QgYXNwZWVkX3BjaWUgKnBjaWU7DQo+ID4gKwlzdHJ1Y3QgYXNwZWVk
X3BjaWVfcG9ydCAqcG9ydDsNCj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+
b2Zfbm9kZTsNCj4gPiArCWNvbnN0IHN0cnVjdCBhc3BlZWRfcGNpZV9yY19wbGF0Zm9ybSAqbWQg
PQ0KPiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiArCWludCBpcnEsIHJldDsN
Cj4gPiArDQo+ID4gKwlpZiAoIW1kKQ0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ICsNCj4g
PiArCWhvc3QgPSBkZXZtX3BjaV9hbGxvY19ob3N0X2JyaWRnZShkZXYsIHNpemVvZigqcGNpZSkp
Ow0KPiA+ICsJaWYgKCFob3N0KQ0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiAr
CXBjaWUgPSBwY2lfaG9zdF9icmlkZ2VfcHJpdihob3N0KTsNCj4gPiArCXBjaWUtPmRldiA9IGRl
djsNCj4gPiArCXBjaWUtPnR4X3RhZyA9IDA7DQo+ID4gKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCBwY2llKTsNCj4gPiArDQo+ID4gKwlwY2llLT5wbGF0Zm9ybSA9IG1kOw0KPiA+ICsJcGNp
ZS0+aG9zdCA9IGhvc3Q7DQo+ID4gKwlJTklUX0xJU1RfSEVBRCgmcGNpZS0+cG9ydHMpOw0KPiA+
ICsNCj4gPiArCXBjaWUtPnJlZyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2
LCAwKTsNCj4gPiArCWlmIChJU19FUlIocGNpZS0+cmVnKSkNCj4gPiArCQlyZXR1cm4gUFRSX0VS
UihwY2llLT5yZWcpOw0KPiA+ICsNCj4gPiArCW9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJs
aW51eCxwY2ktZG9tYWluIiwgJnBjaWUtPmRvbWFpbik7DQo+ID4gKw0KPiA+ICsJcGNpZS0+Y2Zn
ID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShkZXYtPm9mX25vZGUsDQo+ICJhc3Bl
ZWQscGNpZWNmZyIpOw0KPiA+ICsJaWYgKElTX0VSUihwY2llLT5jZmcpKQ0KPiA+ICsJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwY2llLT5jZmcpLCAiRmFpbGVkIHRvIG1hcA0K
PiA+ICtwY2llY2ZnIGJhc2VcbiIpOw0KPiA+ICsNCj4gPiArCXBjaWUtPmgyeHJzdCA9IGRldm1f
cmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRldiwgImgyeCIpOw0KPiA+ICsJaWYgKElTX0VS
UihwY2llLT5oMnhyc3QpKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VS
UihwY2llLT5oMnhyc3QpLCAiRmFpbGVkIHRvIGdldCBoMngNCj4gPiArcmVzZXRcbiIpOw0KPiA+
ICsNCj4gPiArCXJldCA9IGRldm1fbXV0ZXhfaW5pdChkZXYsICZwY2llLT5sb2NrKTsNCj4gPiAr
CWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQg
dG8gaW5pdCBtdXRleFxuIik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcGNpZS0+cGxhdGZvcm0tPnNl
dHVwKHBkZXYpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIHJldCwgIkZhaWxlZCB0byBzZXR1cCBQQ0llIFJDXG4iKTsNCj4gPiArDQo+ID4gKwlyZXQg
PSBhc3BlZWRfcGNpZV9wYXJzZV9kdChwY2llKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0
dXJuIHJldDsNCj4gPiArDQo+ID4gKwlyZXQgPSBhc3BlZWRfcGNpZV9pbml0X3BvcnRzKHBjaWUp
Ow0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlnb3RvIGVycl9yZW1vdmVfcmVzZXRzOw0KPiA+ICsN
Cj4gPiArCWhvc3QtPnN5c2RhdGEgPSBwY2llOw0KPiA+ICsNCj4gPiArCXJldCA9IGFzcGVlZF9w
Y2llX2luaXRfaXJxX2RvbWFpbihwY2llKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBl
cnJfaXJxX2luaXQ7DQo+ID4gKw0KPiA+ICsJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAw
KTsNCj4gPiArCWlmIChpcnEgPCAwKSB7DQo+ID4gKwkJcmV0ID0gaXJxOw0KPiA+ICsJCWdvdG8g
ZXJyX2lycTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRl
diwgaXJxLCBhc3BlZWRfcGNpZV9pbnRyX2hhbmRsZXIsIElSUUZfU0hBUkVELA0KPiBkZXZfbmFt
ZShkZXYpLA0KPiA+ICsJCQkgICAgICAgcGNpZSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdv
dG8gZXJyX2lycTsNCj4gPiArDQo+ID4gKwlyZXQgPSBwY2lfaG9zdF9wcm9iZShob3N0KTsNCj4g
PiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBlcnJfaXJxOw0KPiA+ICsNCj4gPiArCXJldHVybiAw
Ow0KPiA+ICtlcnJfaXJxOg0KPiA+ICsJYXNwZWVkX3BjaWVfaXJxX2RvbWFpbl9mcmVlKHBjaWUp
Ow0KPiANCj4gSWYgcGNpX2hvc3RfcHJvYmUoKSBmYWlscywgYXNwZWVkX3BjaWVfaXJxX2RvbWFp
bl9mcmVlKCkgd2lsbCBiZSBjYWxsZWQgYmVmb3JlDQo+IHRoZSBJUlEgcmVxdWVzdGVkIHdpdGgg
ZGV2bV9yZXF1ZXN0X2lycSgpIGFib3ZlIGlzIHJlbGVhc2VkLg0KPiBBbHNvLCB0aGlzIGlzIG5l
dmVyIGNhbGxlZCBvbiAucmVtb3ZlLiBZb3UgY2FuIGZpeCBib3RoIHdpdGgNCj4gZGV2bV9hZGRf
YWN0aW9uX29yX3Jlc2V0KCkuDQo+IA0KPiA+ICtlcnJfaXJxX2luaXQ6DQo+ID4gK2Vycl9yZW1v
dmVfcmVzZXRzOg0KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShwb3J0LCAmcGNpZS0+cG9ydHMs
IGxpc3QpDQo+ID4gKwkJcmVzZXRfY29udHJvbF9wdXQocG9ydC0+cGVyc3QpOw0KPiANCj4gSSBz
dWdnZXN0IHRvIGxldCBkZXZyZXMgaGFuZGxlIHRoaXMgKHNlZSBhYm92ZSkuDQo+IA0KDQpJIHdp
bGwgYXBwbHkgdGhlc2UgcGFydHMgd2l0aCB5b3VyIHN1Z2dlc3Rpb24gaW4gdGhpcyBkcml2ZXIu
DQoNClRoYW5rcywNCkphY2t5DQoNCg==

