Return-Path: <openbmc+bounces-975-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EEECABE54
	for <lists+openbmc@lfdr.de>; Mon, 08 Dec 2025 04:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPmwP72y5z2yCL;
	Mon, 08 Dec 2025 14:01:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765162901;
	cv=pass; b=UmDsOFtmvHCEsmaPnGDFGxSyvSaNnXBkaA/yHgLzs+4BEKW5gbUg8Z65Exez4NUkSxS9AngaUAGw2eZ0ibX9XBiIp+pIThMufbndoAFY74AnAoUagxuOSD7Xp8p00ZsfYUD7NIUzrAOeG0D5SQSdLEUTjjXeD2r70r3eKQDhR+PSmANKVw/3Q5W7yZ7NstwAmfZ4RrysS32ev5nPe7VCRW8vPYx4AIZT4rbHMbzEqoztFQfVNppwfEkW6FYYfFzmn4t5BromTv+STpmlaM/vgbtkcFL6Yg5npR/EjWPd2SIyy8k3KtIa74B7yCHr5BljPiGlwwdcUo6POS8GYfBFvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765162901; c=relaxed/relaxed;
	bh=3I9dKimTgugioqie75MSgImFGG7/wA1ZV/Sd8PMYly0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KIJ7p2WpVBmDNiaP9dJ4DYJdYIr6K7/PYqxJPS/vUAeIc9Z7DnrfN5rUSCxREd0h8zPMcmOC/KE00RNdhabsIWfgYrfSAyDiVsc1Dm+p37HuDr7pOYUJyYTCJ1CbfwuuHg80ANISwIfYLIxVvB0k3MAix4kPU4qlBlhDv4PkD8S1oC6tD2I8bfhSVxgXW8v2TUbE32YJ8JlBqsscD7+NrLJSk23U9NTVjXMF4wOdjP6phI+NBltX//0fc/jZbvqKRjCPS+aYEapGtT+GHV940/5iF9Udh8Y6ACuVyZJSxLOkiTLsccwl9n7/5O2aP/WSiMETMq17gFGDeZvXwMdeZA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=aMLMyKX7; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=aMLMyKX7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPmwM5zcPz2xrk;
	Mon, 08 Dec 2025 14:01:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdO7b5d5h4yP5YzeSKzCFXJP3z435ZsrusZhgYOMhQqH+QYpzH3ooYnD1/eJS8+vGR78/Syo5SCl4pKB594yK3ki6fanTrsmfhYzcCf7qePI99YW+zdX+55Vf2+qKbgjuiA6coN98bJuXCfyo9ks/cgroA2jgMHXpFILUPPj05Hh1vtgABNrPGVlljWmdJyzC9SzUlHanyLeHzLxJYG6AHf4VGPxWQc6DuvfVUgjwAL83mYJ7Y3tzMnaVcnkRwOkpakxQbadrIhlUoOb0DSuN4OlHboof02eYgqvhieHnt5KDwjD+LqHW1M5u4adOaPEd9VZV4uSMScDEDP3/0MOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I9dKimTgugioqie75MSgImFGG7/wA1ZV/Sd8PMYly0=;
 b=ft3dBxPiBnuAA8HFea7iTNkCFR6OL5/67RMRPOX5avD/JVv/K1Q4mWW2vSv06mE7UOMHVEsL6MJJvf/lkGFzfGP78J/mTS0uQUG7fqlxwFWhb7S7GzOtabSiTiCnmKcuGVDr4MaGRF56L91OsCE9Q1s8oyd4Vm1ZvTIOqTdTlURPwWjJFjH9EohL9sHoYPj9lbuOtT4vchYBrKE+Ii6JFWeSBBCOt7z7/hioDKcMAkESSkyiqKimu3ndWETQUW7vqBIucyjfMqXXN9Ji7dKKIzZz9PxNqn+4+hOLkU2Y0GtKBYJbjEng9I6ZEUq4pfVhJE+F4FThJeLAAeKb7zEqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3I9dKimTgugioqie75MSgImFGG7/wA1ZV/Sd8PMYly0=;
 b=aMLMyKX7CVI2bta4bvrXUf2E5fUBTRlk3BIKFj05Ib4jIgEZ4WfQ1UxDsVyPjfNDZOtu3E38aE8V0aOqe8a2gCPxm1G0L4LfIbalOWEXOb34ufbMr5K+TGH5P1Z5ym0ztz/bZnw0gTh2rXUC00ZY2Nirs9VywLZZWPUnVceNGdhNUS8rgjhgeDIjsONo7rKusNUKo8COcFajMDxWPBhRKxp5GWgWYRLhBkiU2vF1Vx3PtWZ4s7OpstuM68nyl5yUrq6/RxMDeT1GcI03AMUFfCVk9Fh0uzknLKzYKzWgDv5eeaYmZ3tG4sFfR2itlbgRR60CwoiNJ78+VMnh9GbApw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR06MB5969.apcprd06.prod.outlook.com (2603:1096:820:ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 03:01:12 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9388.009; Mon, 8 Dec 2025
 03:01:10 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Thread-Topic: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Thread-Index: AQHcYovTiOKpFL2Yzky+VI550x/5ybUR6lmAgABEAbCAAZVZAIADVKuw
Date: Mon, 8 Dec 2025 03:01:10 +0000
Message-ID:
 <SEYPR06MB5134B4BF81E81717379797649DA2A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
 <20251204195355.GA1975043-robh@kernel.org>
 <SEYPR06MB5134D0D5911E3C86D869151E9DA7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <20251206000806.GA969079-robh@kernel.org>
In-Reply-To: <20251206000806.GA969079-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR06MB5969:EE_
x-ms-office365-filtering-correlation-id: 6d84798e-9e95-45f6-5373-08de36060a9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?yndl0PeFMBYCZzCuar0ELV71htupn4Y5Ez5TABjezM8KyeoAJ4OuoVQw8X?=
 =?iso-8859-2?Q?DdFFMLPjeNts2nwctEwz8WU7wbE0IgHl9DvQ8nwuRjUq1x3T3FXG+THgHr?=
 =?iso-8859-2?Q?ZMW54TLuUXmHyt3hgCXXv0+jJPXMVwRKFqB9xfvv9O2FVHEVMJgfGK+LGB?=
 =?iso-8859-2?Q?B/KuXCa329NiUALkLZuOH+nfiHl5/iJdUTd48hx1FRAlrmDYVv7WcqmlwY?=
 =?iso-8859-2?Q?QRKcoiWBZrMtjSWOUbd9M1aqt8KIQHrZ0fEInC9OXFd5efbcvJjBJL9/FG?=
 =?iso-8859-2?Q?/9gvNa8RRsilwDsJISZNtDR473KRlWeAzNzln487Y2VG0Btz9Q/RWs9jXt?=
 =?iso-8859-2?Q?8Y1TVO8Vb8SCrhdJauoYpklH/dJbd6aWSl8Tbr+b2LimmFqv5ePZUx8VEC?=
 =?iso-8859-2?Q?p2A45DsYDsKOrZVMGsq410t3+FzjoWLQWlJqNtiZbc9ZDnx8FrsFuE/J/p?=
 =?iso-8859-2?Q?2LKS1jRu0Jh2HzvAUuzm6R/89h1G4cpfavS1vgPhi4ufIaFGi852yA2VyC?=
 =?iso-8859-2?Q?igylDhg+PqVuQmEfQWcGKTJN2qKdSnmfC3KyRDeXn5VO+WEnWvLFz+odY0?=
 =?iso-8859-2?Q?OHuMTDQQ5sQvUUnxaJD8+1EzLIXjOYh79p6mcXuDKl116Sd9ZHexr9N3zd?=
 =?iso-8859-2?Q?kSZr+Lz+BZ+LgcPwJ6n6h4STp4tBi8Ey6gOdIkyl0goCTFU11HaJBEmya1?=
 =?iso-8859-2?Q?DVOJ+7L1zHG/yKnazH+0BzKkMDGY9N0XgunLVnTssLS1WrOX/b5zMvNor8?=
 =?iso-8859-2?Q?ddcvqJZ12Wx/vMMtu80Kh52VLxyyfL5BoVe/SGYHNyHHLOr4yhNXZd7/da?=
 =?iso-8859-2?Q?U9D4UJTkoebOLOOrB84bkpdQZWzKc06f76V4yZXryJsBNcqyOZFRZ9Gw/A?=
 =?iso-8859-2?Q?fGunGiupQVdfyZxCQ+HrK7zDUrwzbpi0EwW9R4AQv/zUmiIIMdFADvjpFw?=
 =?iso-8859-2?Q?AMarH+GwIhjLMMhy2b4sFLhwQCrBeDYEEz84Y0LVjyg5LkHOMOBSjR7E0Y?=
 =?iso-8859-2?Q?i3Ep0JUq0qbnbooGk9rjWYOa9KFrrkXPIA7WKQWld++PYAM0MtLI1bRDhp?=
 =?iso-8859-2?Q?e8A4V/C9SIMPE98e7UO30LPy5+9VehCV6wM72D0HwHrb6Z+KJFkvX8yuNx?=
 =?iso-8859-2?Q?qRQWihGC19nj/7I2mofdkBOF0rDhzEsZtMOMAyXaymQ/2LBvdPb5ypof1v?=
 =?iso-8859-2?Q?M6+yhxrbVsxGu+nYHYutvgfYBf5ZwsHWxEurt3c2hEm0A4RLpRfza4m3s2?=
 =?iso-8859-2?Q?NoYhDA1EJSykq29CE/eOxbF/wAbt5zaklHWdmx6ewYq0FZ5JrWQABZHy6W?=
 =?iso-8859-2?Q?qVPWNvZvR9bb9haR/y6blhUURxAeP7zD6HVkmm6z+/DKlsZ5N86ofh6XsS?=
 =?iso-8859-2?Q?HEzUBRQv/wtxWkQXKeRx9JSnghQ4xzA7LOv5OMg90lL9R5Vr5acKIgagbN?=
 =?iso-8859-2?Q?/oCBuoRZyMaHfKfHxdskNRaUlxWJ7dNmtEBQrDeRuQ38aWiP1zLJHJNx2D?=
 =?iso-8859-2?Q?j3zfMF56WTqYZVU6evVqlNGEdOv1q635oh1hBo+rjBzlbqDPrW/IlU4pnA?=
 =?iso-8859-2?Q?CZgDbDI7VJG9FpA9vGXLlDk81y9B?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?hanIPWLPuGxjAdrrf3ZZYacyPCcyzmWZZNbD7nALcezJiEGjDz4bBPNtfj?=
 =?iso-8859-2?Q?eaw+aMsC+lHJo8+ieuFpFUn9YXWt6B7rP3xzxIKIokGP/6uZ8ucG+Gzihm?=
 =?iso-8859-2?Q?+R9a6FmqP5lmBLveJII+ZZsqMrmt0DDQW3hLk0I6cNxD16Mfm2JKPbQTHW?=
 =?iso-8859-2?Q?HwCQsGrz2k9Fg3zbf+vBIODvF2hlxg8nsoKf6lyjSJrJqwczo0W2QSp2sz?=
 =?iso-8859-2?Q?ENlgG1/J1mzaL7MoGBvXg/Wyg+lGQzuVKEvKcbB54sWqPLC+KvTXbuhVVM?=
 =?iso-8859-2?Q?C2SRXiCDVD4fGBVakggOCwZc1zVDpgWJmQZwb0y2ik6dZIeAHvGp2J1o9U?=
 =?iso-8859-2?Q?GEokymeTcHH34Wws//cArQAWlzNrF2b7UowU6TScRg77Fm2J4Fja7MrD06?=
 =?iso-8859-2?Q?G/luq+WixuoObY3ZGT79TzxyKrYOU/MVhprCUPv7A0sr50/Y685G9IZ/hv?=
 =?iso-8859-2?Q?Rta7MJHe6JImODCqvaj0Dl5EMqWd7A0SH4SEfCAV6dPdX+4+ZzKeu5nGPV?=
 =?iso-8859-2?Q?1C3DmyAX0X4ZqsFlVQEpkA9gGpB0+a3RthD/hmBE0MI6lsZ+STSBLrw/3w?=
 =?iso-8859-2?Q?Xje9mIw7UowmIjQR0rHzpOE/d4IKurezXbeq1Z+Bfhv4vxUjwj0EXpNHX1?=
 =?iso-8859-2?Q?LOJw29r5DH9A+2lq9srmmFKVefqeudc/FG336GRxt6KryGkCoDm1mpyA+A?=
 =?iso-8859-2?Q?N6ZmW9YboBRJOkmMSJE7FxIWYUUyBzjrdiz9GMOkXkzOewRUovZH3yPELP?=
 =?iso-8859-2?Q?i1xIfvRUON24tT9LTJMUgtJWXqcX62H4XAeVEzB3Dz5SLPtPtdTOGUg7OL?=
 =?iso-8859-2?Q?4AZyQHJXYkZWObKt8oaf6oB8CvXdXasqjQH9PWPWOdJPGLRmH4odeRjKnj?=
 =?iso-8859-2?Q?0plAA8qlqo+Whvj6dttmbwb9LeMMbkFEfWCvtybCzD65xzkpJQ8jbhdQX1?=
 =?iso-8859-2?Q?4gmr9eoUXVZtO11tfwNiG2UQqjWfU9vpdv7B5yimM0WGpp/AoU4Taeu9mr?=
 =?iso-8859-2?Q?Bu147ShF8Vxs9bAnDNj2WsQG1obD2HHa4LB8W6y6V33FxmUcMEB8kugfjz?=
 =?iso-8859-2?Q?rvwk01ZWmc8wJcim8aDfOZ2O4nW+qKyAfPM/q3arEoD+MAKoQS4kwWXLlJ?=
 =?iso-8859-2?Q?UenUxByG8IvQFoZ0D4F1JPSIsLXFocOWYVJGoHH0v+ufAz47vBkb8XwqHp?=
 =?iso-8859-2?Q?2rmz0kO/YSvkm5uLy6t+yIWLQw9kN+MLVokKpLroivPhbVxTGnCjS179ue?=
 =?iso-8859-2?Q?1h4xDbi9x98322uGMa9jPC4ukk/EuUhWQF/pPaLMMyTjjXzBtb3Iy+pY9U?=
 =?iso-8859-2?Q?Gwrs1kjVaCVmaCQpKxr43Gm6bVzX3SG9bUdy6UGOtq+vl4sboq6PVpmaAU?=
 =?iso-8859-2?Q?zbxAM/a2rQ89e2Kc6ZzyYeaS4bK+I7UNlUmxY2ho5QSiYGDkk7Y/8CmPxY?=
 =?iso-8859-2?Q?snVxmVAM1xRas1L02NBt6YoDo2yAcp9FsvGOyrUPBfyPfaCkfcCEPQtl/D?=
 =?iso-8859-2?Q?MgbAszkIO8Ur0bcvcEVm5prUZ67HTB1GUkUKutjzp//tDvsJ3MaihpYLpC?=
 =?iso-8859-2?Q?qL1y5g15+mHLFTg/5M8Lb7vZhStUJ+ZWbF+686IMuZZ/4F2BszjrrHo0XB?=
 =?iso-8859-2?Q?zC6x6SLp9d/8RZmHuvyhIrG9zW1WOKTTMW?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d84798e-9e95-45f6-5373-08de36060a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 03:01:10.8594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKHpnT6eacba53+JKRriRNq5Sm20mdc0ZY9xeVbvZVOkE95yr8L0pFimBcd1YIJN/cnbGGylg+Tze2zjSW4NCbLLcZKudjvpW1EzLfzO2Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5969
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > May I confirm whether the pcie@8,0 in aspeed-g6.dtsi is not considered
> > the root port? From my understanding, that node represents the root
> > port, so I want to make sure I'm aligning with your expectation before
> updating the binding.
>=20
> I believe you told me it was the root port.
>=20
> > Could you help clarify how you would like the root port and its
> > properties to be described in the schema?
>=20
> properties:
>   pcie@8,0:
>     $ref: /schemas/pci/pci-pci-bridge.yaml#
>     unevaluatedProperties: false
>=20
>     properties:
>=20
> And then add all the properties you have which are not defined in
> pci-pci-bridge.yaml (and pci-device.yaml by reference) (i.e. clocks, rese=
ts, phys,
> etc.).
>=20

I understand your point now. I will update the binding and the correspondin=
g DT=20
node accordingly in the next revision.

Thanks again for your guidance.

Thanks,
Jacky

