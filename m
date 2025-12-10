Return-Path: <openbmc+bounces-983-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53945CB1B3B
	for <lists+openbmc@lfdr.de>; Wed, 10 Dec 2025 03:18:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQzsQ74Pmz2xrk;
	Wed, 10 Dec 2025 13:18:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.127.84 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765333098;
	cv=pass; b=Ayv238cdRTrpNNCMoVwl4aNXrjmLA4b960qnIEsNOUHQqgOLixGpN+OCiZphOsHN/mDBkkImP2JIzT6U8Ww2AS9CQmvhqsmg2YpdnfSBH4o7GsGEt2XCVV0jrezxPD4CU1fQfu3Ab8J56/STuGZ6aeCqQF0B3XGrS/+ComErhs25jZoTAOwW6uI6MokuDrJNgt8YmaKwuFEaWRu8CSFPxZj33VXMzm3C41C5uyNbAVka/8CVzqQL2PRttQ7RikdWD5bGHdyKOu8F/K9j7LslnQCPOSnkD+SPmhfN16e61XFw2WAMp+UK0nPUjWUtyE1oqkKexzn8tcMVYsKXN6nmXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765333098; c=relaxed/relaxed;
	bh=76kyZTOr2fNUh/Z7Kb4mtA1jNzGaTrbt1mV2hfprjAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k+VaQJQXfXsGbcBs8Puln2OypQxzZMhz5tcwSl8kinEztDW0j5umXNWfMHN1ZB0YrAj92fT3WeswJKNRL9S1W1AmHV4klmugnfGQdtZz+LCV5GSnn5l/bUAFsKnx2vaLA3IzqXYmA2B21fP420kc3QfC5hDT3kmK5RXPBP6EsYltDigy0VdbLm9eAQy+tDw2Z7HFr9jXyiR6Fo3QwqS8nASN2V5Kre7SWhqZ4tp3wvDWooUgUDFWAJxXc8SuK1a9cR0btIVcs6xy069DJdetUuopkGos9MzH+j3YB/Qv4DWOhOJuPRCKiS9w1nIZIJ1NbzF8wZSHRaWuyAWScoFoqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=et4sO8HO; dkim-atps=neutral; spf=pass (client-ip=52.101.127.84; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=et4sO8HO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=52.101.127.84; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023084.outbound.protection.outlook.com [52.101.127.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQzsN3jTcz2xJ6;
	Wed, 10 Dec 2025 13:18:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2WJDgdG8qEARFSChT570VYmCmHYbrlQQQjTPbL78IfMmblkGRKCApW0aLgjYB3pSuK0JdE/P6nDhBUoXIioAXBbtlueAU37nscKh4jnmYNsDkc5gZ7fQB3w8XRD3OtUFxtwr/eKAJMVnqLRxC69+eyPS1zqooylg+hVbbwZ1AKmPYjG9JqgourX5zDhMWHyWKSSy/1vi54s+k0LwpKvp0yUSepqhp+Mj7QV+aRVIqb9X8VVQLdBYelXphUuy/yh1grirLUVcn1HvvPGf/yhDXfkg9cXFQp8fzXOd7a2ICzFBYqgLOvjTC7KjyVWVYemmBf5XXeCoEMbWdLyxETjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76kyZTOr2fNUh/Z7Kb4mtA1jNzGaTrbt1mV2hfprjAw=;
 b=p2XeMrQzMmr7eS4sN4JoM5UL+G4ynZncBDxciUgpyE4j9yzfU7BNC+0ujv+oxxN9E2ufmMv7nsiKG3J9jmu0MZKXVMk9mPgr4XRiDeJljGrCm8A1D9rO2oTCmvmoBikrATLPXpCWeloShXOxoorujHRVpV3IZAU5+xl9i0vFySAM5suqsdbg0WY9XXWk6E+dejt+MSOkOUWACTi4LFF+dklGfO+e45sHoV3qvv1Ij34kVBJzfOtPaJyPbSF8XGT+3o65S8Fs5w3exerWeWV8eJwvn0evnk//tsAuDySRKx6CiCoQ2M+PSPsCYtdN2CUUFb5WSN61XAelOjInVyWTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76kyZTOr2fNUh/Z7Kb4mtA1jNzGaTrbt1mV2hfprjAw=;
 b=et4sO8HOruEYiBLqh/2qWZAJ/5oCLFplzktr4LmvxvL5MTtmQ17lGAbmZw4vuKuLgF6sdfdl3i3sWdgc7qMIaueSIpjKQBe6hEg5fhqTDrbeYtwbE9UtPhJKNPxyK7xlMM9aJ6hkn0ra8k5MV5kiCLPo0HVn5Ozqu+2OP5ad6bW100Z1pgOWmDU1BeRGDVuJQvvffNu6zyiyPQn4v08p3xBEbRkjlLXNzhPziPmQuI4jZYqmgkijt/lHIDWGBtBbNDDGq/Vdbi18HMPfL1iqI98fPHWmJIq6+NygxdPBcJWHp+DkLUvKfm2LHunnMscXNNDKB73do+qCjSisciIlvA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SE1PPF158EAB38C.apcprd06.prod.outlook.com (2603:1096:108:1::40a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 10 Dec
 2025 02:17:32 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9388.009; Wed, 10 Dec 2025
 02:17:31 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v6 6/7] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Topic: [PATCH v6 6/7] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Index: AQHcYovau3E4PFuPz0uUFTRwyGlUlLUYe4mAgAG0h1A=
Date: Wed, 10 Dec 2025 02:17:31 +0000
Message-ID:
 <SEYPR06MB513497D82F1FBBFAC6B9EE309DA0A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251201-upstream_pcie_rc-v6-6-8c8800c56b16@aspeedtech.com>
 <20251209001107.GA3430423@bhelgaas>
In-Reply-To: <20251209001107.GA3430423@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SE1PPF158EAB38C:EE_
x-ms-office365-filtering-correlation-id: dfcc7df3-0376-41d9-a183-08de37924654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?M9G+IOzuSspFIPtsDXMvS89O2wCjmb27c3wNdbBXX1sBfNNdzTnYvFgwW2?=
 =?iso-8859-2?Q?bGd6Ibd2aCMPIYvQ35hgwjdL21HwmQC049n/Ghb46vznAsPVkVuJhdSRsz?=
 =?iso-8859-2?Q?fuqxUpfPwV2rqFYHoYMlq9fqaKeUey3IrP72gChvJuW0aSNbRDT2oL0Pb1?=
 =?iso-8859-2?Q?o6SKiwSlS1rIJLgMY0WeD5C0/a6KakJ2jyNoVWA02mOLved7l+ckLxZx5j?=
 =?iso-8859-2?Q?fLu0iV6uTRol3fH/3wDjqbqZiLIowy0uMwZcWNBm3kxaEOhT1G3hlWSX+2?=
 =?iso-8859-2?Q?mcanyHgiinAua918T+xNDq9IZwWEj5P3Tr0TY8kxrpVuRVZo9mpRd1FOwK?=
 =?iso-8859-2?Q?8SgHZmxXZZgwMf/em6624kerTUbRN51Ked/aHfm3HrJVwMZxVPqvkv93Zn?=
 =?iso-8859-2?Q?i4IBwlr+Lflw7o01heKYUG4n1hCS78WAWpaSv9Yq2hrI8fHV9YyNLVG4dk?=
 =?iso-8859-2?Q?+kNxeHO+EX3SSl6Scp1MMLB+njg6yyma3p+IWhMk42kGmq5jgs3ENMVIu3?=
 =?iso-8859-2?Q?xtyGuZmko/wVNx80HaLBLaKXxTg5pF8Rx05TSl6jh9m3Xr0AP9p+CRGQaa?=
 =?iso-8859-2?Q?QZ5u7kpLbOZuhop0FxOmUGaWHEUvLb/5HDhQwhhgp8L3PwNYmUH7Ji6ZE9?=
 =?iso-8859-2?Q?yiD6piiP0XHvLTwYdL8jrJJYvg8PnaVrT90VvHsL1EyLyOZsWgqDtqvdjZ?=
 =?iso-8859-2?Q?IPoDtCEWeH2IHMNaTyWFRWpvD8RdD1UulCPR72hQn5UalzMrYLIuRyQUwh?=
 =?iso-8859-2?Q?NDRnCxoAKtlmdd2+9934KREFoiNRIhuJK4jT0xBGuMazB6NO0mRw8e5afm?=
 =?iso-8859-2?Q?LF7yWKdkLFDnMtybqWQ70w8SL8Z+c+vWU8AmSj40XBk7BAosWQKOBD3PW6?=
 =?iso-8859-2?Q?BwUO/dz07awm7jE8vTSc7sz9EQzYZ9CSbHy6xB5nwe5V7FRtC/iw8XxaiQ?=
 =?iso-8859-2?Q?CYlLuaw8mZ1tFq3EyVqkNOtRYl0ny1fTAdMRy4RabYFg8yr+CaW6dUo3hg?=
 =?iso-8859-2?Q?KD7o5IQnbrsKqmYwJRAogmDt73uUBgDZZUVOuENKXiHSl2zJtu+GEIh4h1?=
 =?iso-8859-2?Q?h/e5yH/TX/kOca4lHeQOQdW3eAuQvc+R4xUcQuleng24QeVzc2XpdTC/XH?=
 =?iso-8859-2?Q?S9GG2wGNgco/y1g+yY5IcaFZ6/5e5LK0UutF8JVeo7wxn/0RdfStX+eK6s?=
 =?iso-8859-2?Q?UB+y88KKmfKcK69ITExj/E0v+71VIiUbbs6KXD3QX1O2TB3kfaSzfMu2Uj?=
 =?iso-8859-2?Q?EIqvlh5LBDp4ojg8Tvso+kPOe+Up65p+Ev4LPr+9SYEwOpx7CcPxYmZh3d?=
 =?iso-8859-2?Q?16hmz90aFVzgfyMm+eD0Spu1um8n6OkUY4bUOKPy5OrlfNJnqXnmSzvjic?=
 =?iso-8859-2?Q?A5K8ENhGhnRLMrsurQhYElBKMRcVuXxGa/4rlDm0tkF6weFkxVYhT2+wZK?=
 =?iso-8859-2?Q?P+NTvFsyhdJXnumh/rH06KSO6Ioli2PRBWPPRSSdv9fdJHKHQEE1EztNWa?=
 =?iso-8859-2?Q?SHOvLLKuDZHF9o++Xah+8dKsTDb0/su4Lmrc48LMIc177MuMQ929hYALWz?=
 =?iso-8859-2?Q?QhEWoRPa4KxOGmqswMzZ1ehXfFGf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?7sx3NoGi0me58el+EnjGllsdqg7lw7N9fzeMaQC2o3mknqEsKXTpdhhkFi?=
 =?iso-8859-2?Q?D4r9Y90+AeevF6c4pX+4BZiqp8wXQxvI5S8iPca1dDCZoS8mGijWy81wqx?=
 =?iso-8859-2?Q?6Tciqo1iYnljGHeB+6Y8frHtcE00TFaWt3Dg4QpvfhzPpw4TZ3TXiiOMkq?=
 =?iso-8859-2?Q?T0SKlrmDjCp76YRqyUsDu2jCdxf+Pdr6F5FLaxoCqxmeNh28lVZwqiVPXT?=
 =?iso-8859-2?Q?k45Kh2Rm23X0gOwi/EgQq6pcmLQ7ouJw+mhNvgv0lOW/ktQLDyqI85+0Yi?=
 =?iso-8859-2?Q?ICgymqyMq04brQjGV03+RP3ANSLFZlWzLr4dNBZYTTnGDxA2I6rffiORNf?=
 =?iso-8859-2?Q?Fljc2H0c08TFeO1P9I9m+63fEDDscmJmWUXGt7dtC4jpKXN8GMdk8A0Q8i?=
 =?iso-8859-2?Q?ejC8aEdF1uU/tGofw1w/G3Ort/ITng0lzgSjq2Xu/nyS2mlGOFv/BGireh?=
 =?iso-8859-2?Q?LKDcSvXOtfEKqwrCcG9beRGLTxwkmnIBLbSsKVy3nggtX0bIbTeSyGKDOo?=
 =?iso-8859-2?Q?2iFRzMwHcV4X2RoHlo/W2pNn+fh5i9UK58Uk2fD4FDX7GAyRNZknGBz6UI?=
 =?iso-8859-2?Q?qBHKzdVvGfGrp9Dc+pO5EIhVAGBZxzTCKXKXX0E6PBvLctLil5AznzWmRy?=
 =?iso-8859-2?Q?Ecxc4ItI58n1D8UvWoH3VkZRPnaESGJqBUnKArwvToWQBgqulyQTKjKyUh?=
 =?iso-8859-2?Q?Xicq1jSoMv8IDRkCLa6Qtir/qfyJm3uWr7CNHk0E+6EKN4PDSKCHf0ce5+?=
 =?iso-8859-2?Q?EYc9SvF2+n5kN3qofh3UE7moM62R2/pUR6bTT044aBZyLVsMlNb4O4lbsf?=
 =?iso-8859-2?Q?9yJDg+svi+Mr4/dZ93Oqpms80ywB6xMBgdok7HwVbpDT86+bNPMTcWC72+?=
 =?iso-8859-2?Q?WtsxZecdvl4hQqGB7Gr5C8/lPjMzbqDEPPGWrw7YYzPwR1n6e6ZlLVSMth?=
 =?iso-8859-2?Q?vleEFH3gRy+S8MUbBvCDPbH51/j98PbtWz9eGYHHdyjrRCf0RMtI0yq68T?=
 =?iso-8859-2?Q?dmFkwGCLuCwwKZglbtErdhtcxjgG7gBuNK2c8axhFgmHj0W0npsVZiF4KP?=
 =?iso-8859-2?Q?dSxTXOyksV2X7//aveQe3tDHsHteFSZ0CtFNZEX6gpGHoKw+xEICKajq/e?=
 =?iso-8859-2?Q?R9SGAUjYBnPlu0I43JDx1H6e4UbFMeg412WaztZFUnNg9pwuGGwSUszDUK?=
 =?iso-8859-2?Q?7gJNrn7ZmTDGqz3jJ2aNNVYB4e2Bv/HnrhGyKP7MkO53iuhEq+Ajgwpxl4?=
 =?iso-8859-2?Q?eMYxXyfqOzR0gv3W10NRGZpkUbStvsAih1wIZRCR0KQuYtpNQl4i5EEORp?=
 =?iso-8859-2?Q?sm7azs4HdFSD6rnMPjFCSqzzxekbmBDOAnUm2VqtwaQ1XhO82rLDvK7ftC?=
 =?iso-8859-2?Q?dU3rb/zirEIlIgxm4PQP+VQxneatnIMkSqlyrs1dSnF2TWjcpUTQz81C/Q?=
 =?iso-8859-2?Q?TDiAq7n3KwdP465+V2s53M7SnDAYq3q4vV1s29p6v3byVH7Qwx0R3lxiKf?=
 =?iso-8859-2?Q?Gkg7obDenfvG5ULDlGPqDXE4mX7IosTmG05bPmdTcejcMii6BXt2ZO8TWq?=
 =?iso-8859-2?Q?YUvUJiiWeEBAkELrbPU4DzNpDe0bl4vCFxoQqotRykhPPDs0OhDY92zgNP?=
 =?iso-8859-2?Q?Craf1dTDQHK7q41THOOOKJlw6WKcLevagq?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcc7df3-0376-41d9-a183-08de37924654
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 02:17:31.7665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FoQkla87/rhiG4Ei4zUQPPsqJB0pyCJNWq6aYxKNDStgnQQM7XnZI7TbbL3cUkktpu82pnhFwYeBj2bHk5//MjRT5Z4fU8+4aaIBPGNoddA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF158EAB38C
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bjorn,

Thank you for your reply.

> > +	u8 tx_tag;
> > +	int host_bus_num;
>=20
> Only needs a u8.
>=20

Agreed.

> > +static int aspeed_pcie_port_init(struct aspeed_pcie_port *port) {
> > +	struct aspeed_pcie *pcie =3D port->pcie;
> > +	struct device *dev =3D pcie->dev;
> > +	int ret;
> > +
> > +	ret =3D clk_prepare_enable(port->clk);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "failed to set clock for slot (%d)\n",
> > +				     port->slot);
> > +
> > +	ret =3D phy_init(port->phy);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "failed to init phy pcie for slot (%d)\n",
> > +				     port->slot);
> > +
> > +	ret =3D phy_set_mode_ext(port->phy, PHY_MODE_PCIE,
> PHY_MODE_PCIE_RC);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "failed to set phy mode for slot (%d)\n",
> > +				     port->slot);
> > +
> > +	reset_control_deassert(port->perst);
> > +	mdelay(PCIE_RESET_CONFIG_WAIT_MS);
>=20
> I think this should use msleep().
>=20

Agreed.

> > +static int aspeed_ast2600_setup(struct platform_device *pdev) {
> > +	struct aspeed_pcie *pcie =3D platform_get_drvdata(pdev);
> > +	struct device *dev =3D pcie->dev;
> > +
> > +	pcie->ahbc =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> > +						     "aspeed,ahbc");
> > +	if (IS_ERR(pcie->ahbc))
> > +		return dev_err_probe(dev, PTR_ERR(pcie->ahbc),
> > +				     "failed to map ahbc base\n");
> > +
> > +	aspeed_host_reset(pcie);
> > +
> > +	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY,
> ASPEED_AHBC_UNLOCK_KEY);
> > +	regmap_update_bits(pcie->ahbc, ASPEED_AHBC_ADDR_MAPPING,
> > +			   ASPEED_PCIE_RC_MEMORY_EN,
> ASPEED_PCIE_RC_MEMORY_EN);
> > +	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY, ASPEED_AHBC_UNLOCK);
> > +
> > +	/* Due to the BAR assignment is fixed mapping on 0x6000_0000.*/
> > +	writel(ASPEED_AHB_REMAP_LO_ADDR(0x600) |
> ASPEED_AHB_MASK_LO_ADDR(0xe00),
> > +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG0);
> > +	writel(ASPEED_AHB_REMAP_HI_ADDR(0),
> > +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG1);
>=20
> I assume this ASPEED_H2X_AHB_ADDR_CONFIG is doing basically the same
> thing as aspeed_ast2700_remap_pci_addr() below, so see the comments
> there.
>=20

Yes.

> > +	writel(ASPEED_AHB_MASK_HI_ADDR(~0),
> > +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG2);
> > +	writel(ASPEED_H2X_BRIDGE_EN, pcie->reg + ASPEED_H2X_CTRL);
> > +
> > +	writel(ASPEED_PCIE_RX_DMA_EN | ASPEED_PCIE_RX_LINEAR |
> > +	       ASPEED_PCIE_RX_MSI_SEL | ASPEED_PCIE_RX_MSI_EN |
> > +	       ASPEED_PCIE_WAIT_RX_TLP_CLR |
> ASPEED_PCIE_RC_RX_ENABLE |
> > +	       ASPEED_PCIE_RC_ENABLE,
> > +	       pcie->reg + ASPEED_H2X_DEV_CTRL);
> > +
> > +	writel(ASPEED_RC_TLP_TX_TAG_NUM, pcie->reg +
> ASPEED_H2X_DEV_TX_TAG);
> > +
> > +	pcie->host->ops =3D &aspeed_ast2600_pcie_ops;
> > +	pcie->host->child_ops =3D &aspeed_ast2600_pcie_child_ops;
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_ast2700_remap_pci_addr(struct aspeed_pcie *pcie) {
> > +	struct device_node *dev_node =3D pcie->dev->of_node;
> > +	struct of_pci_range range;
> > +	struct of_pci_range_parser parser;
> > +	int ret;
> > +
> > +	ret =3D of_pci_range_parser_init(&parser, dev_node);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for_each_of_pci_range(&parser, &range) {
> > +		if ((range.flags & IORESOURCE_TYPE_BITS) =3D=3D IORESOURCE_MEM) {
> > +			writel(ASPEED_REMAP_PCI_ADDR_31_12(range.pci_addr),
> > +			       pcie->reg + ASPEED_H2X_REMAP_PCI_ADDR_LO);
> > +			writel(ASPEED_REMAP_PCI_ADDR_63_32(range.pci_addr),
> > +			       pcie->reg + ASPEED_H2X_REMAP_PCI_ADDR_HI);
> > +			return 0;
>=20
> It looks like this is essentially hardcoding the offset between the
> parent-bus-address and the child-bus-address in the DT 'ranges'
> property.  Since ASPEED_REMAP_PCI_ADDR_31_12() and
> ASPEED_REMAP_PCI_ADDR_63_32() do nothing except mask out the low 12
> bits, I assume that offset is zero.
>=20
> But this should not be hard-coded at all; it should be extracted from 'ra=
nges'.
> I don't think we really have a consistent way of doing this, but you can =
take a
> look at how these other drivers program "outbound" mappings like this usi=
ng
> bridge->windows:
>=20
>   cdns_pcie_hpa_host_init_address_translation()
>   dw_pcie_iatu_setup()
>   mobiveil_host_init()
>   xgene_pcie_map_ranges()
>   iproc_pcie_map_ranges()
>   rzg3s_pcie_parse_map_ranges()
>=20

Thank you for providing the information.
We will refer to this information to integrate the PCIe mapping range.

> > +static int aspeed_pcie_parse_dt(struct aspeed_pcie *pcie) {
> > +	struct device *dev =3D pcie->dev;
> > +	struct device_node *node =3D dev->of_node;
> > +	int ret;
> > +
> > +	for_each_available_child_of_node_scoped(node, child) {
> > +		int slot;
> > +		const char *type;
> > +
> > +		ret =3D of_property_read_string(child, "device_type", &type);
> > +		if (ret || strcmp(type, "pci"))
> > +			continue;
> > +
> > +		ret =3D of_pci_get_devfn(child);
> > +		if (ret < 0)
> > +			return dev_err_probe(dev, ret,
> > +					     "failed to parse devfn\n");
> > +
> > +		slot =3D PCI_SLOT(ret);
> > +
> > +		ret =3D aspeed_pcie_parse_port(pcie, child, slot);
> > +		if (ret)
> > +			return ret;
>=20
> It looks unnecessarily complicated to put each port on a list in
> aspeed_pcie_parse_port() and then iterate over that list in
> aspeed_pcie_init_ports().
>=20
> I think you could just do something like:
>=20
>   aspeed_pcie_parse_port();
>   aspeed_pcie_port_init();
>=20
> and get rid of the list completely.
>=20

Agreed.
We will remove the list and initialize the port directly.

> > +	}
> > +
> > +	if (list_empty(&pcie->ports))
> > +		return dev_err_probe(dev, -ENODEV,
> > +				     "No PCIe port found in DT\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int aspeed_pcie_probe(struct platform_device *pdev) {
> > +	struct device *dev =3D &pdev->dev;
> > +	struct pci_host_bridge *host;
> > +	struct aspeed_pcie *pcie;
> > +	struct resource_entry *entry;
> > +	const struct aspeed_pcie_rc_platform *md;
> > +	int irq, ret;
> > +
> > +	md =3D of_device_get_match_data(dev);
> > +	if (!md)
> > +		return -ENODEV;
> > +
> > +	host =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> > +	if (!host)
> > +		return -ENOMEM;
> > +
> > +	pcie =3D pci_host_bridge_priv(host);
> > +	pcie->dev =3D dev;
> > +	pcie->tx_tag =3D 0;
> > +	platform_set_drvdata(pdev, pcie);
> > +
> > +	pcie->platform =3D md;
> > +	pcie->host =3D host;
> > +	INIT_LIST_HEAD(&pcie->ports);
> > +
> > +	/* Get root bus num for cfg command to decide tlp type 0 or type 1 */
> > +	entry =3D resource_list_first_type(&host->windows, IORESOURCE_BUS);
> > +	if (entry)
> > +		pcie->host_bus_num =3D entry->res->start;
>=20
> s/host_bus_num/root_bus_nr/   to match struct altera_pcie

Agreed.

Thanks,
Jacky


