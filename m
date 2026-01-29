Return-Path: <openbmc+bounces-1294-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLwmNZgBe2n9AQIAu9opvQ
	(envelope-from <openbmc+bounces-1294-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 29 Jan 2026 07:43:36 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA93AC4C0
	for <lists+openbmc@lfdr.de>; Thu, 29 Jan 2026 07:43:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1qNM2sFdz2xpn;
	Thu, 29 Jan 2026 17:43:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769669011;
	cv=pass; b=DR29oLULLdrS6ehDY8u7YlYiopzEwn7+50r6YcvXNt//2Jin994zYd/cyotzSSnTs3r+x15sn79LCUljdDXSk2w0coc9280cU5Zbjw85Z5Z5Yf0KHjWW39rcdRi6YuU+vyK+3roO0IteMCJXDqRjYTWvba/CJFWNuMDwtRD1nKrIFRyQVNEPvlSasx7FQ2BeQ7YW+R1cy6zx8Hsv2Qns+NOeNVitCRhbSI2itIS/2ev0Ncu/Bp0oMlpErvwd8UT288MX/dKcSksQT+1CayFeE7OGP/mvP6nKN3ubQ1vp7yUmZsULe/rtjdZg5oZCdrUdbEvBs78QGHwvx2IwY7Mhyg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769669011; c=relaxed/relaxed;
	bh=mWf3+g1jEd2/Fj8ipM2eYv1+c0G1r0hUhs7TJppYmE0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HlAncsSOJKohLlNmHDNRC+kHmAYNY9uh/lAqbKSq8BVyQkFY3g2+juIvgIhnFOqOHz2TB1+K/VBOIL1QLa4YstmxqxpEO9eR8eZIH31uwiBtg05WzN2CEh9Si0DTI95bIRI7FbK6IoyesWw8bkW0nYyUfHfN8+8YmVDhuTnr4f9vVNayf0xiKPnNDdMnycWGMdVIqcIUFpo2UuIE+kMOqVjTtyqx9OTF+K7Ny4fZmzt2G06XUiJCgHvAG/96nQb83u/KgTsKAZ/r7hwPXJhSAKXG+HowMZ1GIJ6p2FW19rBEwKLDhkB/puC+55CNUsOr/5JQ4++xbxge39JhY3xPlQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=o7Kj9fk+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=o7Kj9fk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1qNK6nnjz2xKh;
	Thu, 29 Jan 2026 17:43:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOlQT3REk7rpHlmLR4COxyr3swdBZ0ViffNQIk7YYdXQ6Za/xQOMD93piN4KGMvoG/7al2pQaKR3DtefDFifp+sC7jSNTZ8uoVwCx6DTCoNrJVmLQ1u/DuG17hZ8u6NC9pi42xv3H301azeTKjtluLF7bzCj4rY3kgyFnt3lI9vtk+6vKuUAHpsSxSNg6C3LrR9Nqp2WEtVVn+jQ9wEYjAjyuVVmGuX7Lt2y6rMUC9A/dUNArUJON9s6CIrXhErmjWCg00tSWwHIhwKBAriB+ccVTgGmnnMwSzO78CIJpnlln04wS4IQjUgve0YWTvE85Wcdedto6bkkcztFCPI9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWf3+g1jEd2/Fj8ipM2eYv1+c0G1r0hUhs7TJppYmE0=;
 b=DhgmMj41TSFJ7+VjwL28kUPYwiqoIv9SuFUVkJkMo0jrHdlDgvRCUiiHRilbz7wZX1FtB+zISbsN7Ew7KyVQ4bBGU7mDRsjq/ISCRRo9EC+ikxNuUB5c3KrtmD5ivypBWoOWP+oT5DEfHznxlpTQfLtUDLrdMzp3k1Gven2p+qUSF6QDRmYfd8tvgqT/MZIMQVqPQz8E1Z4ks6il/npqaPF7saqMv8atOp0/rbDWHlru7HJXWWzlzZn7WpPg5Ai2ly/b9UCGJAYEXqYGjCpGuu+4/VQm1V821AjlBnTPAri3MmAeW6cy5/AIVLSx3mZNAaeX+sDDFpuAeyMid8aSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWf3+g1jEd2/Fj8ipM2eYv1+c0G1r0hUhs7TJppYmE0=;
 b=o7Kj9fk+7aYzoiHiCAE9ThA6ycUv+iU/6oEEWI55x01czVa1NJhU2hbSWDDxu3/dUykbcvxmToGS9YKuHUb3XINVwmO2/ZvItHa6KiRi7YdJhNH3GcscsJIoYHILjXsL29PJiKMXqkRe1TK92OXUEkoHcyd4TaNxWcPypQH6JcLkZuFY2TcNchpFH4A9By7fMZMiD5vmRXdRwOkRf/CbDAahD45mjPy218IQ2+B9m6P0l9o1VAYJLNx+bc6gl5fAEu3TiCSxbzVz94U4iB4hRs0at+aIhjDTj3aUMoVLXcOHiokcu85IthF/mZb3Fq8wKbq4Eg37R16LPSky54rdiw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SE3PR06MB8069.apcprd06.prod.outlook.com (2603:1096:101:2e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 06:43:02 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 06:43:02 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v3 3/3] pinctrl: aspeed: add G7(AST2700) SoC0 pinctrl
 support
Thread-Topic: [PATCH v3 3/3] pinctrl: aspeed: add G7(AST2700) SoC0 pinctrl
 support
Thread-Index: AQHcigH5G3b2Ao842kKgs/YAACJeobVa/C2AgA3DYTA=
Date: Thu, 29 Jan 2026 06:43:02 +0000
Message-ID:
 <OSQPR06MB7252CAA1FCE83EAFF43FECC98B9EA@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
 <20260120-upstream_pinctrl-v3-3-868fbf8413b5@aspeedtech.com>
 <0d8ad41f-a2c4-4a4f-ac1f-68263648c4dc@kernel.org>
In-Reply-To: <0d8ad41f-a2c4-4a4f-ac1f-68263648c4dc@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SE3PR06MB8069:EE_
x-ms-office365-filtering-correlation-id: bc7d72f4-66c8-49c4-ab45-08de5f01a654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bClabx4WaT98KWCQE/7e3eq/+ThcSp0Gk+wzsOl8d97wnxnlF7SPST34Lq?=
 =?iso-8859-1?Q?fproXkyiZ5Nj+vQHMHIy7B/uOTezN8Q0kyA7zS2BFzmkq/8CxbCaDD0wWM?=
 =?iso-8859-1?Q?AwNtW7m8eFvQHZ6lztG1ZjFIC3RaM0tAf/Wvm12erv9U6euDh1/TBURHLQ?=
 =?iso-8859-1?Q?xRj5ZPnKixoVg8R1PSSuJDnIcqLUHpEezHSFBUja1Al/QWpKM3nChGf29U?=
 =?iso-8859-1?Q?zPE9/88dA4xXYctHPgsAyhY3SQzJdmPpEjB5b4n1cg8uKnTeyizd5o2hKH?=
 =?iso-8859-1?Q?x0Fb9pm/jOUWeJk7S5sacaNuczl1sghArje3bDQACWnAMOlm5ghEXgLXgt?=
 =?iso-8859-1?Q?MaTOa7Aroi/o9iZsv1zMi9v8jbs5mqmS3SismfKnR+Bv6oLlCXyV+n8pAM?=
 =?iso-8859-1?Q?WkmMkWOGYMDQ4tZdsCy0qiJVlGHiYXGW+rhisA83Un99TeQiiFaMBH+DXQ?=
 =?iso-8859-1?Q?lNPtp3Lhi5jzUkcc4m0+eADgJRM0B/VwyiIlCOqDkMBxS5ODegcPr7XYM9?=
 =?iso-8859-1?Q?EiVaAvnDWMeZsBiMOsNrrl8Zqn9VilKUrWXYL1Pzvh26IXB7qrp5bV0HwT?=
 =?iso-8859-1?Q?kT+zGvs95bnXg6BdGR5uwg0r3WuqB4tkzRo+mPEvcs0P/I5msWGkRtmE7z?=
 =?iso-8859-1?Q?NFjiZDhw4lkas4WahC8KABr3O/9Tuo/zKH58CvS+cRLqXCrHrqqmJyXyRS?=
 =?iso-8859-1?Q?KGCcD04m6lhFQdvO2eg14uTtiO1gNNdLcDhFba7U3E2GjcEslEuowc9rcd?=
 =?iso-8859-1?Q?YJdA/38FwvKj7MHGC+Tw14h0oY249dzY39Rgk0ojtephGFqzinWfac1UJb?=
 =?iso-8859-1?Q?s42WSfT309sY8bY9fktLuJeqfgA4igwL1cbGsq4CxkWOAF8kGRQo9ksSov?=
 =?iso-8859-1?Q?Q0NEQ6AGgvqj3ABwPVZ3JH89oAZJJr4Q0O7z5ZYni73Bv8U6VPMki67G6c?=
 =?iso-8859-1?Q?Q6ZgSqT8etNdryBr+UeJB0SUZYUb+98UzvLABZ+uwGmiEOApe0dYOd2sVq?=
 =?iso-8859-1?Q?YlCVUEbOyVSNHfw7VDjCs2OkSkbpSH62+QzlNmZbXZ3Cstw2eLuaYqcDYR?=
 =?iso-8859-1?Q?uW21avI2tenZ6/UoW4pHdlJ0wKX8rwimlqt9Elt5p/RIqBb6+1tZkcC0dr?=
 =?iso-8859-1?Q?uenpAGywZDV56En0T69C1a0fzuZJ/edHC3bS2EhOOXaXF+eau3BGTV4hZl?=
 =?iso-8859-1?Q?rGYXNOQ+p4nZQG4dkWLBd4Iuyi83kOulXaj3vPLeEjdqeKWWU2vF3SllI4?=
 =?iso-8859-1?Q?0gRG5dROoDF2aZt97dP5HqdontTkr7RlmmTPdZ6nRU52geGfzNPWvFIyEa?=
 =?iso-8859-1?Q?afJtn/Z1MTIN/Jzw5Zh2rMtTQycL+b6QK+4ODOMWQxNNF73ujkH71KJ/VE?=
 =?iso-8859-1?Q?3MCXfZRcLphO9Ku49R4Z1fWgi+OL26MIWh7bpWaN7pjDoycS7KFWTJAzCz?=
 =?iso-8859-1?Q?kZi2clxvJUdqrZwO+vHJtkO3rghtcJV46sEOo3aZtETUOnxR8fZaFc+mg8?=
 =?iso-8859-1?Q?LNmBqsE1gIUcwWiT35ISx5YOkV/fA6Coy6gG69lznJgGVX1uUPE2VUWxP0?=
 =?iso-8859-1?Q?RK7fvi+ZTsu4Pc52uZTo1n6swxS+Oi+Jr4IxACBMD9V+ymgvQuOQYR5Dk2?=
 =?iso-8859-1?Q?ZhYnJW87uiS+2bGI8Ylg7R8IO5ZPgfkU0Z7GizDwF0NdTE1iH1t2cIQ/DC?=
 =?iso-8859-1?Q?3KVaVT1lzxvMHI3v10Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BxEHUq1zgM1PFQFk7mMfCVQav5P49+h07hx3pt0T+CoBEREay9Q9t3jcYL?=
 =?iso-8859-1?Q?ZWAHXftBi6Ud0dIgPjznasBdj7U0rZxEjb0LKfpIfFaclTcD2XgmG0VNt9?=
 =?iso-8859-1?Q?CttuG/vxaDmvZXnVP6sltjN/6EHYwkU6R3qznwGyNZG6lZN+uyxFpsEK1j?=
 =?iso-8859-1?Q?TBt6mbBrZtEnQKAlrmY/6zClkD2uVNQXawHtnLG/9WVCUtZM9g3HepQ5Ah?=
 =?iso-8859-1?Q?JzjErxFD4rYd2UQetcOR2pUkQRD50l8tBnDLJBd7fkQ53qV1aInq8ociku?=
 =?iso-8859-1?Q?b139q6OtCM4gFZwXCOlBQ1otkCwKNDxxIVaLxRUKHCqpVVLSqa754QtIKi?=
 =?iso-8859-1?Q?3FONMjWqou+O2weNqdo5yxqasQ6gaYP9bzsfLn9+fh7gP1aHgLM+mX7YCU?=
 =?iso-8859-1?Q?7rkhykEZgfzH8tjwpWXwqFkCjVkkL+dt7lEcuVQUdPd3N/cMJk/xSgBWk0?=
 =?iso-8859-1?Q?bo7pyPhReR+7XOxyovqNAAbr7fUJnnyuNC/G8ExSUPoUmTsZirsK8J/DQf?=
 =?iso-8859-1?Q?AiYJCoLnt/g5Xi5mAaTfSvlmCk8f/Sk98X5UQFm3Q78jaVgtko9oxEcYWs?=
 =?iso-8859-1?Q?MkK0NQs8pUfX/6/73SBnBvZlNNK62NgjwwzEChtOS3c2oGdRlI6mB5VAiq?=
 =?iso-8859-1?Q?hMo2X9gipaX8e/yN4jI6BrGEjfUBO97rxn7hv0claUE6iHRBV6Koj4o3lk?=
 =?iso-8859-1?Q?ITELBZStSi/E00XYuaVSp0/+CB2P7iz2r6zl5jdeCgcC/zm0pAy/tyfAk6?=
 =?iso-8859-1?Q?ET9iSakBqAT3zgslWEzsjRoVJTKvPDgKzK0AFfqSsLyflgoLYpyp1wLeAt?=
 =?iso-8859-1?Q?7kBYd/ZS0CwR8mg/IRHT1I9nluutgE/HCzSElHTO0bfESsckWgHGsrJbH2?=
 =?iso-8859-1?Q?nJdrkQGs0nMhZGXVMt6SaHdYnjtwK02vYOe5MlbGl1JHefUGCTnYUqw0/T?=
 =?iso-8859-1?Q?DAl1ybwNak9PJ22TaPQndZk4oV3eBNJ3Ai9+mfut5J3Aczsyo2PJoX6gkU?=
 =?iso-8859-1?Q?0xIORKqenTcT6TilhBYI+g2cWkspsE5Vir9IdsPV9J0lVj/MQCqWsC4IwV?=
 =?iso-8859-1?Q?PTsFx5oP5VJKCtM1iNAoK6Me2Rblqklewq93bY10yxdoVhKSK9xcXJvcnC?=
 =?iso-8859-1?Q?uh5X/mBJv5jxmSEyaPK/f7PnV72l5s0FCYTvefUdoWuu63HI0LMspnP7Cg?=
 =?iso-8859-1?Q?b3b+HP+767EmuAoIaTL//QuDfypKxyahW1Vbz9eWkTgvrWHuFCtqg/EFel?=
 =?iso-8859-1?Q?LNEDBMvrGn6qFg9qOWeaNMSXeoh3unJ07n7vHU6L4XECvAVGK62ZAQDJ3a?=
 =?iso-8859-1?Q?DO2r4u4esxHSdoKaY2mzvm9AUlMpeoG5LDgJFh+vuXYXP6/s4F1OqnrlmZ?=
 =?iso-8859-1?Q?TQSj21DVCXxykrzzihadWH4x8iEbHIK6pzyVIvuU2j2B6IxdhE/71gi1Dm?=
 =?iso-8859-1?Q?D2Y9x2Y3GD79n55pVBMOjM545A1xpeJZUAxq5B8nvjH9urrjEcJhs75cym?=
 =?iso-8859-1?Q?ZqzXo7MttPDqTGHOb3xE4h5Jb5nyo1xiUYIAoGHluOb2NHKptxQPiTsLkX?=
 =?iso-8859-1?Q?6LOKvKti+KAz9S5QDX8TxaDdkvqgnfSpKyt+Wyil0wOqQFfD1bb3GRzGWe?=
 =?iso-8859-1?Q?YUoUtQhM6E/sjWe8taeFrLSHkufW164HXyIpvtzyzhJ9HnJWaVxt41vF3b?=
 =?iso-8859-1?Q?QUe2paM1TKrlH42ltFVN44xFlIN7eB0NW+rHc7Ls7OjRQiFQ9os/HWcfg2?=
 =?iso-8859-1?Q?vkq6qE4Hek/RxZWY5DCpMyubdjJlkLiZCzUkE5WE+Oj887UpCiIMlF75XX?=
 =?iso-8859-1?Q?3ZfV6XjzVg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7d72f4-66c8-49c4-ab45-08de5f01a654
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 06:43:02.3158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JflXfkJQGCjcaf7e34GGeNEeZ6UhQGOT9cF1rGdra2e2w1OC0Md92++ZVm6vYRK9+aNOfxmmKY8nzNGNNkcuXqqWLwiL34lf4YQ2icJm/Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8069
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1294-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:dkim]
X-Rspamd-Queue-Id: 5EA93AC4C0
X-Rspamd-Action: no action

Hi Krzysztof,=0A=
=0A=
> > +=0A=
> > +static const struct aspeed_pinmux_ops aspeed_g7_soc0_ops =3D {=0A=
> > +     .set =3D aspeed_g7_soc0_sig_expr_set,=0A=
> > +};=0A=
> > +=0A=
> > +static struct aspeed_pinctrl_data aspeed_g7_soc0_pinctrl_data =3D {=0A=
=0A=
> Look at your existing drivers - what is missing here and in other places?=
=0A=
=0A=
Based on existing drivers (like pinctrl-aspeed-g6.c), aspeed_pin_group,=0A=
aspeed_pin_function arrays and pinctrl_desc should be const. I will add=0A=
const to aspeed_g7_soc0_groups, aspeed_g7_soc0_functions and=0A=
aspeed_g7_soc0_pinctrl_desc.=0A=
=0A=
However, aspeed_pinctrl_data itself is not const in existing drivers=0A=
(likely because it holds mutable data like regmaps). If you strictly meant=
=0A=
pinctrl_data should be const, please let me know, but I suspect you were=0A=
referring to the referenced arrays and consistency.=0A=
=0A=
Best regards,=0A=
=0A=
Billy Tsai=0A=
=0A=

