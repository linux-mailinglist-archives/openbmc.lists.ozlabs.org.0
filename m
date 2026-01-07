Return-Path: <openbmc+bounces-1097-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5BCFB807
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 01:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dm8Vm6n3Hz2yF1;
	Wed, 07 Jan 2026 11:46:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.75.114 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767746800;
	cv=pass; b=CXwpqJ35LwxBprYxV/Z85xwXMOOs8cKEI+emnpXUe06CFab5CGEmHJ+lTZ2UQ/ZnysQiGcHg65aTvb2coJi91m89Oe6BeEla+YUoxQggQ3ikAgpjK6Zvq4n9v26MSUx2jL51nVQqMmZvlfQpT54fCTWDiqyNxvac/AjH4hQv2/kGLeci0X0mwtTE8cb5srWHpQTCe4x3xjJw4iwXFpfZZEQnD5LCwywjdiVG6T8MT9IoAL38rjxd3RW7FXoZ/Vb8r3D2+eh0coku2vHKOa1Z7d7gcu6p1xSg4Q8XKQbggm5o3NOcsKOohLOvWUdjHZ2KK0urPyveh+UhWC10JNvKEA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767746800; c=relaxed/relaxed;
	bh=/5nqFRw4viMSkVQ7gVt/HKw0sOkNW3lQ6yIJYm1R3ro=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZZMoDAhdaNW6O3Y3S3PuT9yhus1dY9a2CAIOAVwQVUP1eZPCBspgTCi44yEZ5f3pe83tcxdPWFWhwErosg8Wuy5bPSdhOFoLq2yKBhC+KX71c4jbU2dgooLiC7TppjmW9ZHlcRNyyRpMaCfrhrKdRwJyMz4q8iP6mOLRbYJviBmxfhh5GXfMeZy3qs+tRUmNlaIdRhSNr9VlCO/SIJcMCT6lGodjmwa2EmOOxDq2y67qj30MmzTfDGKR/qdluloKsxo2QXtzN/ObPZtUOdzgbtfYh6cC0yi4zxkjF5fi8os4wVoOTF62qawssVdh1XoTKOpD3wCuiQeewspMs5gWSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Tj8khdmz; dkim-atps=neutral; spf=pass (client-ip=40.107.75.114; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Tj8khdmz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.75.114; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022114.outbound.protection.outlook.com [40.107.75.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dm8Vk1ts3z2xHP;
	Wed, 07 Jan 2026 11:46:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpQhe9yyam88gBvyOpW5QV287qglrQPHyc7JvMQvEJDguNS5Si9YplB/DbBQM77ic21oAPYPSsYEHuBX/S52oo/sgbAyirm+uKq/S0uALI3QG7LUm+y+FQCpfVKrCV1k2R3tdu3ODUEPSzugodDnJ/7cewLbBzzbxEXjZpUkp9RlfDNiG72Fxgjkz873VtKWZ4Wh1KddMcDiRbSMP+ZNccW9C/xMvnxEjlNE06X7lmvTcIV+VxTlG7l3BbPMh1YwDkRDOqoNal62aW6xQU+BiZws5aTPDxAM3O/28FKoSG13wD3Z5bVg7UubepmBQSS+DY7WZ6y90PrMJM7VfH4Y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5nqFRw4viMSkVQ7gVt/HKw0sOkNW3lQ6yIJYm1R3ro=;
 b=SagBNrShfE4VB155c1aTDhqStPw7RhN5hRRVO509kB4aaP5B+UmOJOLeU7UvSTUD/uBfn5FqVSyvxohWFjS2vsJGUzi44QnJdMEfrJsGqc8Qh67omUvC3cb7TyqUCoUD8XP/inHIT/x9d+ZrGSN1Se/0KfI1q+S8QeHDmpbWKLKiMUKZGfQifDsU9WpXMW+55gErpwtPLKeflNXZZO25V3+8q7HNHNSnYHcWApMKLRyAVj3WNNT7ydOCwngdSDkcVIVeGav7hrfG/sQjYqKpIDaHYMso5X9/xX3qr4riPq1XKc48FlQ+wRBnuNuskc+U4NFSzncF2GHZ3WU4ygAOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5nqFRw4viMSkVQ7gVt/HKw0sOkNW3lQ6yIJYm1R3ro=;
 b=Tj8khdmzqyp8aUvm7Q8pg8pV6k1aRMktNf6wAPhGxuBrjIKyxc+lyKVWblRw8xbw26hm2hi3cGf4cXcozmubZRBjz3fChOG0gWXZQQRqvMADSRLzF4IiPmNVOagAZJkcUmgbA8Tt6ZMj1pnGEjFHj48zR+m6G5Zko8wF143SIoF8RrCH+/F/q1D4wUCjsJtVhzlZtcZSiFgMkqhhUj9I11zre/qqDq17apwNwGS+9NWps+9prM3cL0nZq91j2a6ijhUQk82M9fs3VZ/3pLXeeXImtdevrLfYMmEgE/8t3ENmQc19+F83UCu/r9JEi5DSO0YC0zr4JRY2qqPZx7FoxA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEZPR06MB5438.apcprd06.prod.outlook.com (2603:1096:101:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 00:45:56 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 00:45:56 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW <BMC-SW@aspeedtech.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Topic: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Index: AQHcWCxbbHqO8nwNMEO6CZ0FnrkxPrVGLRtA
Date: Wed, 7 Jan 2026 00:45:56 +0000
Message-ID:
 <TY2PPF5CB9A1BE6C43CF98422EA2EC83536F284A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
 <20251118014034.820988-4-ryan_chen@aspeedtech.com>
In-Reply-To: <20251118014034.820988-4-ryan_chen@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEZPR06MB5438:EE_
x-ms-office365-filtering-correlation-id: 3bfcba50-a235-412e-717a-08de4d861e81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?nyJ6o2x/c33xN/8LZmz0BMaOnRuEXfz6QTryVoEsNnYumphNIfIfT5ekhb5U?=
 =?us-ascii?Q?DZhpH7diejeoPjHBiP89pvsGasK4KH0+iS71Ir+hqaM69gJKE3nOMeZvSpwo?=
 =?us-ascii?Q?BV4I/GkyWr0e3g4v7hwbzSC+k/VXbhQZDk5EAQoMRqwv/xD0VKgGQdBK5XWy?=
 =?us-ascii?Q?K3sXcvfNqeSij3N3pQgi4FzvS0sP+RsZeGhjAX25EhBu01NnD9lZZ9J+qQUs?=
 =?us-ascii?Q?cuUpO7LD27HewrS7X8rIuYYtc6Uk6UO/Ao7e3HpMZihMcQliNq0z0Ela6eGH?=
 =?us-ascii?Q?qjwx4q7DtytvZCetNAPHkTrhOiP3VsRjzrtHj7Lua18hvoLptGHDrBGwEWXF?=
 =?us-ascii?Q?d8Rimf4zfi8lBHBxBAAXZgS9fw+NYl0NurRWHnDSlkcKpV/SRyXi+DlE7B02?=
 =?us-ascii?Q?k57c8qmBXLsKPo5eBdq8QhXfgv9w0PI14PA32Kj9vXveUaZHamTv2QOWrX+I?=
 =?us-ascii?Q?QZfc15KJL3LeD1vfKfOSzdp4gntIrREQiGIHv+CFM6tsIgTRrtsxdjrxnGPA?=
 =?us-ascii?Q?fm9kyg10CvzVkab8AaRlDKZzYEhBuS5xPh5x6I8StA2iMlw1WHfbe+uxTKY2?=
 =?us-ascii?Q?f3ny3CV6DmRE27qpwSHmY8O6ZOrk2UFnKGZiikbU4X9uIfjo8OOHDhPoFi28?=
 =?us-ascii?Q?mlDziXUqT97yPTG5TxvQ1Ymwpod3ZYmijRTCZLaTVcd6g696gXoIFMClDq1Y?=
 =?us-ascii?Q?p/iWcJp78t3U1CC/cTurMRfJR8E4oBeC7BZ2ojlde8qH4KU5lmvRzmjJ9hia?=
 =?us-ascii?Q?ePIIbIt7wnUqeiaroXid7kSvv4SpWqAP3aZEBHXAgpHBo62UAcTBGShVN7xy?=
 =?us-ascii?Q?UOvPRb5JULxBX2WaXFQMHcCcM0PG3zkb9W2oJ1LhEbWSo7WNQtISxGTVlbi8?=
 =?us-ascii?Q?QWBQc4Fvw5aF7xy87L8oN0x8GRE51urfb2b9oYzWta2EwqCMmvXZK0n1dMXN?=
 =?us-ascii?Q?KuU8Tla2z0LtkGrEtlMe7ubna2+2IjS9BDmDyO0838dofE2SWrHktC8yDCfK?=
 =?us-ascii?Q?wnNaKEHQPh+e1dqKJG9F7Tc1jXy/GBg5BjvCjvKqzGd+GqXWAD4aLeyX9Y0/?=
 =?us-ascii?Q?uXD2R/NdKZRi5Z6bTE5b/Zu8SrkUXdTzwk3h1FG59jp1b5LiQAnteDEVzHpJ?=
 =?us-ascii?Q?LUy5OrMlqRJYj9zVOWu/qVX8mCXjyGyMFOhX94KYPY6cWOdpf+kR1MnjRUAV?=
 =?us-ascii?Q?/UIfRacVlSuVTJiAEmCyRVtTHg3jYbY6FcV/SPmcb9JpTrmoBO9fOb376IJX?=
 =?us-ascii?Q?lJcZYWcCzAMPxo7zgLhqf4klvU6+VhjsF1Ki2CQ4fPAoh3rWZR+N7t1ch9ar?=
 =?us-ascii?Q?hlqjV0Ahv8dUbUn8/4EiE+AIZQQyePfqsH3XyYEptl1FjuOnBf+hdjfkHA8Q?=
 =?us-ascii?Q?YZ8i2r0Ghnsd+L60B7vHfpoiLCIOuz4t5ILQsrcA7rj6n7Ynmi+VCxE6zVtl?=
 =?us-ascii?Q?68zguwyl5b5dSGnAWZYvRgEB0Qg8+Ll22e/DDrNJ2RNZjbHNnr/sJDlAqOaR?=
 =?us-ascii?Q?+SfS7OcWaoUHpP34tW/7bgc5MftDEjJZdKQc75ZEIf7IJ/E5mm0lQqE/OQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8D8JwWyjnKJFDHCOtIo0W3eGa5neHHgV/XlsEgZWBoNNZlRJlTNvtjLToXgB?=
 =?us-ascii?Q?avgepKxN5OYhKSn/+T55APUbv0ws1KEIT38OnZFMdawRqpYloBt/q/m303vR?=
 =?us-ascii?Q?Td9SXI9wYUX5zA5UVeFOOHERLT61RNn5AFlob9z7TCXK6ihIHWjA4eJGEF3q?=
 =?us-ascii?Q?nfHCChxggbiFTGdgixUp2F1ysmu4zZsJFMs4q7H9+sX3jsKL9CmpGADH8Ato?=
 =?us-ascii?Q?POhhdUmyjCSVI9NHElgOKJ057JL+7RAzebSKPQe7NmgVcdDlU1ofeUB9+wcC?=
 =?us-ascii?Q?BVyDUXGlkx4zka9B5ztgoWlyRWkUST6RFj6zp1+wfIC9+9JEAMv4KZy6oi+u?=
 =?us-ascii?Q?t4af0sa5xPxaAwaHSdHoLl2y4gLbLwnHqliLAdJz/4KHMV3NSF7vp/7AcI5l?=
 =?us-ascii?Q?RFp+V/swAMIcMb6F9eb6wEQdfnfaXtMny4vI9YyjQ4ZmXe4NBE+WldrN7qbu?=
 =?us-ascii?Q?eX+ULCGwLwTSWzf6w2egsaF3J4pcZA2/F7wz+/JOjAoa2d7x8t48+STIMPUo?=
 =?us-ascii?Q?CCIQ3U1IMs4KTOvhQcI3y0qpv4XOUIf0L0TC/Rcpo/dFgIz6Lj7Alu1bsCe/?=
 =?us-ascii?Q?qibzT53sSHBksxCirfXjKvFcBqFtJxEgMDKk6UJqH5VUFD16WysACgbQu61/?=
 =?us-ascii?Q?K3BFN4j+anD/66TWbNe33yUfAazkdZl2F0n1tL6QsJPDMeQicwzsllDf09yN?=
 =?us-ascii?Q?xz1vNqTtyaJOYxIMKt8KNh2Oal7nMZBGG/5fZi5DJIoPXMFVFe1Z1wd4DRWF?=
 =?us-ascii?Q?7VHfzrsZc2mYvKNBSM3NVZ4STP+BJU7ezcqVnjQYU1WgfJsnQwHgS8gCMlya?=
 =?us-ascii?Q?SAu9YsMiHDSLpqhF+ap9sp5oN8LTqnyMaPY5SVUgaPq3955EswnPCbBzldpw?=
 =?us-ascii?Q?eDXH30A/cbKHZeLMdU0rHQyihKVUK4TqSBzSsoQnojFYfjBiifcgx9+048Fi?=
 =?us-ascii?Q?zwQeQmxXEjA5WYujNnZu4WHSWECiX4zfI7UgsbOFN7Kfy3K7JCR3kysCsbbA?=
 =?us-ascii?Q?Lo0XDhlosq241CsSAX9cKkCaa0ifNmRz6IC0BOAsH9sNx1gcwnuuKVV3XDmv?=
 =?us-ascii?Q?81SGOJUVrNR7guhEfwP3NKNTLDlp8r82uUFQtAPZP3RZEUZDL+h/oWtVLDsG?=
 =?us-ascii?Q?sZK7+l/2BvfBfL00fNVIgYbZIz+tmHq8DdPBRk2XP+ooLe/zqLXula7RDx5j?=
 =?us-ascii?Q?lG8UBYhRdVqvOCVU8WMOWyCx6GcFq9uoKXeacsPF5q4fJ5Mn2TiR0hXofXdE?=
 =?us-ascii?Q?n0FBYqQzUvLQhoDBzNJqh/pv4sPrqUy8RALwEze868MbpOwAESc2V8Pywxd/?=
 =?us-ascii?Q?SoQR6HHajD77vbU8TOrqRISDRuvYrgMxuTBTsb8gRYx6rj/wTPCtqFadbh/N?=
 =?us-ascii?Q?1ETRyix93WxlG4nxtbneOmjHvJdtrRJ+H6+YOkszqDTNC120ofdCBmZjkoIb?=
 =?us-ascii?Q?xiN01q0006mU7T8yRbSqDJnvLt6XYLWa9juQa6Uizfi0Slv3tQfYc/3gCKAp?=
 =?us-ascii?Q?FzhxiPWtvqw3aZK/cFn7buXOJ9T3jlxqZw06UYMQrf7aTsn6Y55suQ/kZuXF?=
 =?us-ascii?Q?KssR+PcmAoT3xlrXE4h/1kKHU7k2SRmUSDjSBaC9VizRqspZF4vq2kq/bcpg?=
 =?us-ascii?Q?4PrNmFdQUIRysjYE3gVeFkDD0x3LlFjmJqydq5SRCrMoTB3WRhtSNao89TPg?=
 =?us-ascii?Q?kKGtTaLQ1qlsLCJQNFDdOy+SJ45dPFEmJa//IRIHsMkL4kZ42eAlRVyEeSgL?=
 =?us-ascii?Q?fCB1F+82bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfcba50-a235-412e-717a-08de4d861e81
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 00:45:56.5822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+9N+KR8+edVgq8Ai/mmXbvdyJjeFdItoSMFNmvavu2MIfk+CIG18jQSV3qEMKaL9Z2W8frzUISDgOJLufzMdGi3BsyJ3cvRpDu1k1BOdEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5438
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi all,

Just a gentle ping on this patch series.
Any feedback would be greatly appreciated.

Thanks,
Ryan

> -----Original Message-----
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> Sent: Tuesday, November 18, 2025 9:41 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; BMC-SW
> <BMC-SW@aspeedtech.com>; andriy.shevchenko@linux.intel.com;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> benh@kernel.crashing.org; joel@jms.id.au; andi.shyti@kernel.org;
> jk@codeconstruct.com.au; andrew@codeconstruct.com.au;
> p.zabel@pengutronix.de; naresh.solanki@9elements.com;
> linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new regi=
ster
> layout
>=20
> Add i2c-ast2600 new register mode driver to support AST2600 i2c new regis=
ter
> mode. This i2c-ast2600 new driver and the legacy i2c-aspeed driver both
> match the same compatible string "aspeed,ast2600-i2c-bus" because they
> target the same I2C controller IP on AST2600. However, AST2600 SoCs may
> configure the controller instances to operate either in the legacy regist=
er layout
> or the new layout (via global register).
> The new register mode support following.
>=20
> - Add new clock divider option for more flexible and accurate  clock rate
> generation
> - Add tCKHighMin timing to guarantee SCL high pulse width.
> - Add support dual pool buffer mode, split 32 bytes pool buffer  of each =
device
> into 2 x 16 bytes for Tx and Rx individually.
> - Increase DMA buffer size to 4096 bytes and support byte alignment.
> - Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> - Re-define registers for separating controller and target  mode control.
> - Support 4 individual DMA buffers for controller Tx and Rx,  target Tx a=
nd Rx.
>=20
> And following is new register set for package transfer sequence.
> - New Master operation mode:
>   S -> Aw -> P
>   S -> Aw -> TxD -> P
>   S -> Ar -> RxD -> P
>   S -> Aw -> TxD -> Sr -> Ar -> RxD -> P
> - Bus SDA lock auto-release capability for new controller DMA  command
> mode.
> - Bus auto timeout for new controller/target DMA mode.
>=20
> Since the register layout is selected via a global register at runtime an=
d both
> drivers bind to the same compatible string, this patch defines the driver
> selection at build-time using Kconfig, ensuring that only one driver is c=
ompiled
> into the kernel. This approach avoids ambiguity and ensures consistent
> behavior for each platform configuration.
>=20
> The following is two versus register layout.
> Old register mode:
> {I2CD00}: Function Control Register
> {I2CD04}: Clock and AC Timing Control Register
> {I2CD08}: Clock and AC Timing Control Register
> {I2CD0C}: Interrupt Control Register
> {I2CD10}: Interrupt Status Register
> {I2CD14}: Command/Status Register
> {I2CD18}: Slave Device Address Register
> {I2CD1C}: Pool Buffer Control Register
> {I2CD20}: Transmit/Receive Byte Buffer Register
> {I2CD24}: DMA Mode Buffer Address Register
> {I2CD28}: DMA Transfer Length Register
> {I2CD2C}: Original DMA Mode Buffer Address Setting
> {I2CD30}: Original DMA Transfer Length Setting and Final Status
>=20
> New Register mode
> {I2CC00}: Master/Slave Function Control Register
> {I2CC04}: Master/Slave Clock and AC Timing Control Register
> {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
> {I2CC0C}: Master/Slave Pool Buffer Control Register
> {I2CM10}: Master Interrupt Control Register
> {I2CM14}: Master Interrupt Status Register
> {I2CM18}: Master Command/Status Register
> {I2CM1C}: Master DMA Buffer Length Register
> {I2CS20}: Slave~ Interrupt Control Register
> {I2CS24}: Slave~ Interrupt Status Register
> {I2CS28}: Slave~ Command/Status Register
> {I2CS2C}: Slave~ DMA Buffer Length Register
> {I2CM30}: Master DMA Mode Tx Buffer Base Address
> {I2CM34}: Master DMA Mode Rx Buffer Base Address
> {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
> {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
> {I2CS40}: Slave Device Address Register
> {I2CM48}: Master DMA Length Status Register
> {I2CS4C}: Slave  DMA Length Status Register
> {I2CC50}: Current DMA Operating Address Status
> {I2CC54}: Current DMA Operating Length  Status
>=20
> Add a new core file(i2c-aspeed-core.c) to avoid device tree ABI break, al=
low
> both old and new device trees using the same compatible string
> "aspeed,ast2600-i2c-bus" to function correctly.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/Makefile          |    2 +-
>  drivers/i2c/busses/i2c-aspeed-core.c |   89 +++
>  drivers/i2c/busses/i2c-aspeed-core.h |   19 +
>  drivers/i2c/busses/i2c-aspeed.c      |   43 +-
>  drivers/i2c/busses/i2c-ast2600.c     | 1018 ++++++++++++++++++++++++++
>  5 files changed, 1136 insertions(+), 35 deletions(-)  create mode 100644
> drivers/i2c/busses/i2c-aspeed-core.c
>  create mode 100644 drivers/i2c/busses/i2c-aspeed-core.h
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
>=20
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile in=
dex
> fb985769f5ff..606b35196960 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -37,7 +37,7 @@ obj-$(CONFIG_I2C_POWERMAC)	+=3D i2c-powermac.o
>  obj-$(CONFIG_I2C_ALTERA)	+=3D i2c-altera.o
>  obj-$(CONFIG_I2C_AMD_MP2)	+=3D i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
>  obj-$(CONFIG_I2C_AMD_ASF)	+=3D i2c-amd-asf-plat.o
> -obj-$(CONFIG_I2C_ASPEED)	+=3D i2c-aspeed.o
> +obj-$(CONFIG_I2C_ASPEED)	+=3D i2c-aspeed.o i2c-ast2600.o i2c-aspeed-core=
.o
>  obj-$(CONFIG_I2C_AT91)		+=3D i2c-at91.o
>  i2c-at91-y			:=3D i2c-at91-core.o i2c-at91-master.o
>  i2c-at91-$(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL)	+=3D i2c-at91-slave.o
> diff --git a/drivers/i2c/busses/i2c-aspeed-core.c
> b/drivers/i2c/busses/i2c-aspeed-core.c
> new file mode 100644
> index 000000000000..a2878e1273ed
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-aspeed-core.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ASPEED I2C core driver
> + *
> + * Copyright (C) ASPEED Technology Inc.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +
> +#include "i2c-aspeed-core.h"
> +
> +struct aspeed_i2c_core_priv {
> +	void (*remove)(struct platform_device *pdev);
> +	void *bus_data;
> +};
> +
> +static const struct of_device_id aspeed_i2c_of_match[] =3D {
> +	{
> +		.compatible =3D "aspeed,ast2400-i2c-bus",
> +		.data =3D (const void *)AST2400_I2C
> +	},
> +	{
> +		.compatible =3D "aspeed,ast2500-i2c-bus",
> +		.data =3D (const void *)AST2500_I2C
> +	},
> +	{
> +		.compatible =3D "aspeed,ast2600-i2c-bus",
> +		.data =3D (const void *)AST2600_I2C
> +	},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, aspeed_i2c_of_match);
> +
> +static int aspeed_i2c_core_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct aspeed_i2c_core_priv *priv;
> +	const struct of_device_id *match;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	match =3D of_match_device(aspeed_i2c_of_match, dev);
> +	if (!match)
> +		return -ENODEV;
> +
> +	if (device_is_compatible(dev, "aspeed,ast2600-i2c-bus") &&
> +	    device_property_present(dev, "aspeed,global-regs")) {
> +		ret =3D ast2600_i2c_probe(match, pdev);
> +		priv->remove =3D ast2600_i2c_remove;
> +	} else {
> +		ret =3D aspeed_i2c_probe_bus(match, pdev);
> +		priv->remove =3D aspeed_i2c_remove_bus;
> +	}
> +
> +	priv->bus_data =3D platform_get_drvdata(pdev);
> +	platform_set_drvdata(pdev, priv);
> +	return ret;
> +}
> +
> +static void aspeed_i2c_core_remove(struct platform_device *pdev) {
> +	struct aspeed_i2c_core_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	if (!priv || !priv->remove)
> +		return;
> +
> +	platform_set_drvdata(pdev, priv->bus_data);
> +	return priv->remove(pdev);
> +}
> +
> +static struct platform_driver aspeed_i2c_driver =3D {
> +	.probe  =3D aspeed_i2c_core_probe,
> +	.remove =3D aspeed_i2c_core_remove,
> +	.driver =3D {
> +		.name           =3D "i2c-aspeed-core",
> +		.of_match_table =3D aspeed_i2c_of_match,
> +	},
> +};
> +module_platform_driver(aspeed_i2c_driver);
> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_DESCRIPTION("Unified ASPEED I2C driver
> +(AST24xx/AST25xx/AST2600)"); MODULE_LICENSE("GPL");
> diff --git a/drivers/i2c/busses/i2c-aspeed-core.h
> b/drivers/i2c/busses/i2c-aspeed-core.h
> new file mode 100644
> index 000000000000..6e0091018985
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-aspeed-core.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */ #ifndef _I2C_ASPEED_CORE_H
> +#define _I2C_ASPEED_CORE_H
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +enum i2c_version {
> +	AST2400_I2C,
> +	AST2500_I2C,
> +	AST2600_I2C,
> +	AST2700_I2C,
> +};
> +
> +int aspeed_i2c_probe_bus(const struct of_device_id *match, struct
> +platform_device *pdev); void aspeed_i2c_remove_bus(struct
> +platform_device *pdev); int ast2600_i2c_probe(const struct of_device_id
> +*match, struct platform_device *pdev); void ast2600_i2c_remove(struct
> +platform_device *pdev); #endif
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index a26b74c71206..8466c98b6c7b 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -25,6 +25,8 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>=20
> +#include "i2c-aspeed-core.h"
> +
>  /* I2C Register */
>  #define ASPEED_I2C_FUN_CTRL_REG				0x00
>  #define ASPEED_I2C_AC_TIMING_REG1			0x04
> @@ -978,26 +980,9 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus
> *bus)
>  	return ret;
>  }
>=20
> -static const struct of_device_id aspeed_i2c_bus_of_table[] =3D {
> -	{
> -		.compatible =3D "aspeed,ast2400-i2c-bus",
> -		.data =3D aspeed_i2c_24xx_get_clk_reg_val,
> -	},
> -	{
> -		.compatible =3D "aspeed,ast2500-i2c-bus",
> -		.data =3D aspeed_i2c_25xx_get_clk_reg_val,
> -	},
> -	{
> -		.compatible =3D "aspeed,ast2600-i2c-bus",
> -		.data =3D aspeed_i2c_25xx_get_clk_reg_val,
> -	},
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
> -
> -static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> +int aspeed_i2c_probe_bus(const struct of_device_id *match,
> +			 struct platform_device *pdev)
>  {
> -	const struct of_device_id *match;
>  	struct aspeed_i2c_bus *bus;
>  	struct clk *parent_clk;
>  	int irq, ret;
> @@ -1033,12 +1018,10 @@ static int aspeed_i2c_probe_bus(struct
> platform_device *pdev)
>  		bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>=20
> -	match =3D of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
> -	if (!match)
> +	if ((enum i2c_version)(uintptr_t)match->data =3D=3D AST2400_I2C)
>  		bus->get_clk_reg_val =3D aspeed_i2c_24xx_get_clk_reg_val;
>  	else
> -		bus->get_clk_reg_val =3D (u32 (*)(struct device *, u32))
> -				match->data;
> +		bus->get_clk_reg_val =3D aspeed_i2c_25xx_get_clk_reg_val;
>=20
>  	/* Initialize the I2C adapter */
>  	spin_lock_init(&bus->lock);
> @@ -1081,8 +1064,9 @@ static int aspeed_i2c_probe_bus(struct
> platform_device *pdev)
>=20
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(aspeed_i2c_probe_bus);
>=20
> -static void aspeed_i2c_remove_bus(struct platform_device *pdev)
> +void aspeed_i2c_remove_bus(struct platform_device *pdev)
>  {
>  	struct aspeed_i2c_bus *bus =3D platform_get_drvdata(pdev);
>  	unsigned long flags;
> @@ -1099,16 +1083,7 @@ static void aspeed_i2c_remove_bus(struct
> platform_device *pdev)
>=20
>  	i2c_del_adapter(&bus->adap);
>  }
> -
> -static struct platform_driver aspeed_i2c_bus_driver =3D {
> -	.probe		=3D aspeed_i2c_probe_bus,
> -	.remove		=3D aspeed_i2c_remove_bus,
> -	.driver		=3D {
> -		.name		=3D "aspeed-i2c-bus",
> -		.of_match_table	=3D aspeed_i2c_bus_of_table,
> -	},
> -};
> -module_platform_driver(aspeed_i2c_bus_driver);
> +EXPORT_SYMBOL_GPL(aspeed_i2c_remove_bus);
>=20
>  MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
> MODULE_DESCRIPTION("Aspeed I2C Bus Driver"); diff --git
> a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-ast2600.c
> new file mode 100644
> index 000000000000..04cb38e018a6
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1018 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ASPEED AST2600 new register set I2C controller driver
> + *
> + * Copyright (C) ASPEED Technology Inc.
> + */
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-smbus.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/minmax.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +#include <linux/string_helpers.h>
> +#include <linux/unaligned.h>
> +
> +#include "i2c-aspeed-core.h"
> +
> +#define AST2600_I2CG_ISR			0x00
> +#define AST2600_I2CG_SLAVE_ISR		0x04
> +#define AST2600_I2CG_OWNER		0x08
> +#define AST2600_I2CG_CTRL		0x0C
> +#define AST2600_I2CG_CLK_DIV_CTRL	0x10
> +
> +#define AST2600_I2CG_SLAVE_PKT_NAK	BIT(4)
> +#define AST2600_I2CG_M_S_SEPARATE_INTR	BIT(3)
> +#define AST2600_I2CG_CTRL_NEW_REG	BIT(2)
> +#define AST2600_I2CG_CTRL_NEW_CLK_DIV	BIT(1)
> +#define AST2600_GLOBAL_INIT	\
> +	(AST2600_I2CG_CTRL_NEW_REG | AST2600_I2CG_CTRL_NEW_CLK_DIV)
> +/*
> + * APB clk : 100Mhz
> + * div	: scl		: baseclk [APB/((div/2) + 1)] : tBuf [1/bclk * 16]
> + * I2CG10[31:24] base clk4 for i2c auto recovery timeout counter (0xC6)
> + * I2CG10[23:16] base clk3 for Standard-mode (100Khz) min tBuf 4.7us
> + * 0x3c : 100.8Khz	: 3.225Mhz					  : 4.96us
> + * 0x3d : 99.2Khz	: 3.174Mhz					  : 5.04us
> + * 0x3e : 97.65Khz	: 3.125Mhz					  : 5.12us
> + * 0x40 : 97.75Khz	: 3.03Mhz					  : 5.28us
> + * 0x41 : 99.5Khz	: 2.98Mhz					  : 5.36us (default)
> + * I2CG10[15:8] base clk2 for Fast-mode (400Khz) min tBuf 1.3us
> + * 0x12 : 400Khz	: 10Mhz						  : 1.6us
> + * I2CG10[7:0] base clk1 for Fast-mode Plus (1Mhz) min tBuf 0.5us
> + * 0x08 : 1Mhz		: 20Mhz						  : 0.8us
> + */
> +#define I2CCG_DIV_CTRL 0xC6411208
> +
> +/* 0x00 : I2CC Controller/Target Function Control Register  */
> +#define AST2600_I2CC_FUN_CTRL		0x00
> +#define AST2600_I2CC_SLAVE_ADDR_RX_EN		BIT(20)
> +#define AST2600_I2CC_MASTER_RETRY_MASK		GENMASK(19, 18)
> +#define AST2600_I2CC_MASTER_RETRY(x)		(((x) & GENMASK(1, 0)) <<
> 18)
> +#define AST2600_I2CC_BUS_AUTO_RELEASE		BIT(17)
> +#define AST2600_I2CC_M_SDA_LOCK_EN			BIT(16)
> +#define AST2600_I2CC_MULTI_MASTER_DIS		BIT(15)
> +#define AST2600_I2CC_M_SCL_DRIVE_EN			BIT(14)
> +#define AST2600_I2CC_MSB_STS				BIT(9)
> +#define AST2600_I2CC_SDA_DRIVE_1T_EN		BIT(8)
> +#define AST2600_I2CC_M_SDA_DRIVE_1T_EN		BIT(7)
> +#define AST2600_I2CC_M_HIGH_SPEED_EN		BIT(6)
> +/* reserver 5 : 2 */
> +#define AST2600_I2CC_SLAVE_EN			BIT(1)
> +#define AST2600_I2CC_MASTER_EN			BIT(0)
> +
> +/* 0x04 : I2CC Controller/Target Clock and AC Timing Control Register #1=
 */
> +#define AST2600_I2CC_AC_TIMING		0x04
> +#define AST2600_I2CC_TTIMEOUT(x)			(((x) & GENMASK(4, 0)) <<
> 24)
> +#define AST2600_I2CC_TCKHIGHMIN(x)			(((x) & GENMASK(3, 0))
> << 20)
> +#define AST2600_I2CC_TCKHIGH(x)			(((x) & GENMASK(3, 0)) <<
> 16)
> +#define AST2600_I2CC_TCKLOW(x)			(((x) & GENMASK(3, 0)) <<
> 12)
> +#define AST2600_I2CC_THDDAT(x)			(((x) & GENMASK(1, 0)) <<
> 10)
> +#define AST2600_I2CC_TOUTBASECLK(x)			(((x) & GENMASK(1, 0))
> << 8)
> +#define AST2600_I2CC_TBASECLK(x)			((x) & GENMASK(3, 0))
> +
> +/* 0x08 : I2CC Controller/Target Transmit/Receive Byte Buffer Register *=
/
> +#define AST2600_I2CC_STS_AND_BUFF		0x08
> +#define AST2600_I2CC_TX_DIR_MASK			GENMASK(31, 29)
> +#define AST2600_I2CC_SDA_OE				BIT(28)
> +#define AST2600_I2CC_SDA_O				BIT(27)
> +#define AST2600_I2CC_SCL_OE				BIT(26)
> +#define AST2600_I2CC_SCL_O				BIT(25)
> +
> +#define AST2600_I2CC_SCL_LINE_STS			BIT(18)
> +#define AST2600_I2CC_SDA_LINE_STS			BIT(17)
> +#define AST2600_I2CC_BUS_BUSY_STS			BIT(16)
> +
> +#define AST2600_I2CC_GET_RX_BUFF(x)			(((x) >> 8) &
> GENMASK(7, 0))
> +
> +/* 0x0C : I2CC Controller/Target Pool Buffer Control Register  */
> +#define AST2600_I2CC_BUFF_CTRL		0x0C
> +#define AST2600_I2CC_GET_RX_BUF_LEN(x)      (((x) & GENMASK(29, 24))
> >> 24)
> +#define AST2600_I2CC_SET_RX_BUF_LEN(x)		(((((x) - 1) & GENMASK(4,
> 0)) << 16) | BIT(0))
> +#define AST2600_I2CC_SET_TX_BUF_LEN(x)		(((((x) - 1) & GENMASK(4,
> 0)) << 8) | BIT(0))
> +#define AST2600_I2CC_GET_TX_BUF_LEN(x)      ((((x) & GENMASK(12, 8))
> >> 8) + 1)
> +
> +/* 0x10 : I2CM Controller Interrupt Control Register */
> +#define AST2600_I2CM_IER			0x10
> +/* 0x14 : I2CM Controller Interrupt Status Register   : WC */
> +#define AST2600_I2CM_ISR			0x14
> +
> +#define AST2600_I2CM_PKT_TIMEOUT			BIT(18)
> +#define AST2600_I2CM_PKT_ERROR			BIT(17)
> +#define AST2600_I2CM_PKT_DONE			BIT(16)
> +
> +#define AST2600_I2CM_BUS_RECOVER_FAIL		BIT(15)
> +#define AST2600_I2CM_SDA_DL_TO			BIT(14)
> +#define AST2600_I2CM_BUS_RECOVER			BIT(13)
> +#define AST2600_I2CM_SMBUS_ALT			BIT(12)
> +
> +#define AST2600_I2CM_SCL_LOW_TO			BIT(6)
> +#define AST2600_I2CM_ABNORMAL			BIT(5)
> +#define AST2600_I2CM_NORMAL_STOP			BIT(4)
> +#define AST2600_I2CM_ARBIT_LOSS			BIT(3)
> +#define AST2600_I2CM_RX_DONE			BIT(2)
> +#define AST2600_I2CM_TX_NAK				BIT(1)
> +#define AST2600_I2CM_TX_ACK				BIT(0)
> +
> +/* 0x18 : I2CM Controller Command/Status Register   */
> +#define AST2600_I2CM_CMD_STS		0x18
> +#define AST2600_I2CM_PKT_ADDR(x)			(((x) & GENMASK(6, 0)) <<
> 24)
> +#define AST2600_I2CM_PKT_EN				BIT(16)
> +#define AST2600_I2CM_SDA_OE_OUT_DIR			BIT(15)
> +#define AST2600_I2CM_SDA_O_OUT_DIR			BIT(14)
> +#define AST2600_I2CM_SCL_OE_OUT_DIR			BIT(13)
> +#define AST2600_I2CM_SCL_O_OUT_DIR			BIT(12)
> +#define AST2600_I2CM_RECOVER_CMD_EN			BIT(11)
> +
> +#define AST2600_I2CM_RX_DMA_EN			BIT(9)
> +#define AST2600_I2CM_TX_DMA_EN			BIT(8)
> +/* Command Bit */
> +#define AST2600_I2CM_RX_BUFF_EN			BIT(7)
> +#define AST2600_I2CM_TX_BUFF_EN			BIT(6)
> +#define AST2600_I2CM_STOP_CMD			BIT(5)
> +#define AST2600_I2CM_RX_CMD_LAST			BIT(4)
> +#define AST2600_I2CM_RX_CMD				BIT(3)
> +
> +#define AST2600_I2CM_TX_CMD				BIT(1)
> +#define AST2600_I2CM_START_CMD			BIT(0)
> +
> +/* 0x1C : I2CM Controller DMA Transfer Length Register	 */
> +#define AST2600_I2CM_DMA_LEN		0x1C
> +/* Tx Rx support length 1 ~ 4096 */
> +#define AST2600_I2CM_SET_RX_DMA_LEN(x)	((((x) & GENMASK(11, 0)) <<
> 16) | BIT(31))
> +#define AST2600_I2CM_SET_TX_DMA_LEN(x)	(((x) & GENMASK(11, 0)) |
> BIT(15))
> +
> +/* 0x20 : I2CS Target Interrupt Control Register   */
> +#define AST2600_I2CS_IER			0x20
> +/* 0x24 : I2CS Target Interrupt Status Register	 */
> +#define AST2600_I2CS_ISR			0x24
> +
> +#define AST2600_I2CS_ADDR_INDICATE_MASK	GENMASK(31, 30)
> +#define AST2600_I2CS_SLAVE_PENDING			BIT(29)
> +
> +#define AST2600_I2CS_WAIT_TX_DMA			BIT(25)
> +#define AST2600_I2CS_WAIT_RX_DMA			BIT(24)
> +
> +#define AST2600_I2CS_ADDR3_NAK			BIT(22)
> +#define AST2600_I2CS_ADDR2_NAK			BIT(21)
> +#define AST2600_I2CS_ADDR1_NAK			BIT(20)
> +
> +#define AST2600_I2CS_ADDR_MASK			GENMASK(19, 18)
> +#define AST2600_I2CS_PKT_ERROR			BIT(17)
> +#define AST2600_I2CS_PKT_DONE			BIT(16)
> +#define AST2600_I2CS_INACTIVE_TO			BIT(15)
> +
> +#define AST2600_I2CS_SLAVE_MATCH			BIT(7)
> +#define AST2600_I2CS_ABNOR_STOP			BIT(5)
> +#define AST2600_I2CS_STOP				BIT(4)
> +#define AST2600_I2CS_RX_DONE_NAK			BIT(3)
> +#define AST2600_I2CS_RX_DONE			BIT(2)
> +#define AST2600_I2CS_TX_NAK				BIT(1)
> +#define AST2600_I2CS_TX_ACK				BIT(0)
> +
> +/* 0x28 : I2CS Target CMD/Status Register   */
> +#define AST2600_I2CS_CMD_STS		0x28
> +#define AST2600_I2CS_ACTIVE_ALL			GENMASK(18, 17)
> +#define AST2600_I2CS_PKT_MODE_EN			BIT(16)
> +#define AST2600_I2CS_AUTO_NAK_NOADDR		BIT(15)
> +#define AST2600_I2CS_AUTO_NAK_EN			BIT(14)
> +
> +#define AST2600_I2CS_ALT_EN				BIT(10)
> +#define AST2600_I2CS_RX_DMA_EN			BIT(9)
> +#define AST2600_I2CS_TX_DMA_EN			BIT(8)
> +#define AST2600_I2CS_RX_BUFF_EN			BIT(7)
> +#define AST2600_I2CS_TX_BUFF_EN			BIT(6)
> +#define AST2600_I2CS_RX_CMD_LAST			BIT(4)
> +
> +#define AST2600_I2CS_TX_CMD				BIT(2)
> +
> +#define AST2600_I2CS_DMA_LEN		0x2C
> +#define AST2600_I2CS_SET_RX_DMA_LEN(x)	(((((x) - 1) & GENMASK(11, 0))
> << 16) | BIT(31))
> +#define AST2600_I2CS_SET_TX_DMA_LEN(x)	((((x) - 1) & GENMASK(11, 0))
> | BIT(15))
> +
> +/* I2CM Controller DMA Tx Buffer Register   */
> +#define AST2600_I2CM_TX_DMA			0x30
> +/* I2CM Controller DMA Rx Buffer Register	*/
> +#define AST2600_I2CM_RX_DMA			0x34
> +/* I2CS Target DMA Tx Buffer Register   */
> +#define AST2600_I2CS_TX_DMA			0x38
> +/* I2CS Target DMA Rx Buffer Register   */
> +#define AST2600_I2CS_RX_DMA			0x3C
> +
> +#define AST2600_I2CS_ADDR_CTRL		0x40
> +
> +#define	AST2600_I2CS_ADDR3_MASK		GENMASK(22, 16)
> +#define	AST2600_I2CS_ADDR2_MASK		GENMASK(14, 8)
> +#define	AST2600_I2CS_ADDR1_MASK		GENMASK(6, 0)
> +
> +#define AST2600_I2CM_DMA_LEN_STS		0x48
> +#define AST2600_I2CS_DMA_LEN_STS		0x4C
> +
> +#define AST2600_I2C_GET_TX_DMA_LEN(x)		((x) & GENMASK(12, 0))
> +#define AST2600_I2C_GET_RX_DMA_LEN(x)        (((x) & GENMASK(28,
> 16)) >> 16)
> +
> +/* 0x40 : Target Device Address Register */
> +#define AST2600_I2CS_ADDR3_ENABLE			BIT(23)
> +#define AST2600_I2CS_ADDR3(x)			((x) << 16)
> +#define AST2600_I2CS_ADDR2_ENABLE			BIT(15)
> +#define AST2600_I2CS_ADDR2(x)			((x) << 8)
> +#define AST2600_I2CS_ADDR1_ENABLE			BIT(7)
> +#define AST2600_I2CS_ADDR1(x)			(x)
> +
> +#define I2C_TARGET_MSG_BUF_SIZE		256
> +
> +#define AST2600_I2C_DMA_SIZE		4096
> +
> +#define CONTROLLER_TRIGGER_LAST_STOP
> 	(AST2600_I2CM_RX_CMD_LAST | AST2600_I2CM_STOP_CMD)
> +#define TARGET_TRIGGER_CMD	(AST2600_I2CS_ACTIVE_ALL |
> AST2600_I2CS_PKT_MODE_EN)
> +
> +#define AST_I2C_TIMEOUT_CLK		0x1
> +
> +enum xfer_mode {
> +	BYTE_MODE,
> +	BUFF_MODE,
> +	DMA_MODE,
> +};
> +
> +struct ast2600_i2c_bus {
> +	struct i2c_adapter	adap;
> +	struct device		*dev;
> +	void __iomem		*reg_base;
> +	struct regmap		*global_regs;
> +	struct clk		*clk;
> +	struct i2c_timings	timing_info;
> +	struct completion	cmd_complete;
> +	struct i2c_msg		*msgs;
> +	u8			*controller_dma_safe_buf;
> +	dma_addr_t		controller_dma_addr;
> +	u32			apb_clk;
> +	u32			timeout;
> +	int			irq;
> +	int			cmd_err;
> +	int			msgs_index;
> +	int			msgs_count;
> +	int			controller_xfer_cnt;
> +	size_t			buf_index;
> +	size_t			buf_size;
> +	enum xfer_mode		mode;
> +	bool			multi_master;
> +	/* Buffer mode */
> +	void __iomem		*buf_base;
> +	struct i2c_smbus_alert_setup	alert_data;
> +};
> +
> +static void ast2600_i2c_ac_timing_config(struct ast2600_i2c_bus
> +*i2c_bus) {
> +	unsigned long base_clk[16];
> +	int baseclk_idx =3D 0;
> +	int divisor =3D 0;
> +	u32 clk_div_reg;
> +	u32 scl_low;
> +	u32 scl_high;
> +	u32 data;
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL,
> +&clk_div_reg);
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(base_clk); i++) {
> +		if (i =3D=3D 0)
> +			base_clk[i] =3D i2c_bus->apb_clk;
> +		else if (i < 5)
> +			base_clk[i] =3D (i2c_bus->apb_clk * 2) /
> +			   (((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
> +		else
> +			base_clk[i] =3D base_clk[4] >> (i - 4);
> +
> +		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <=3D 32) {
> +			baseclk_idx =3D i;
> +			divisor =3D DIV_ROUND_UP(base_clk[i],
> i2c_bus->timing_info.bus_freq_hz);
> +			break;
> +		}
> +	}
> +	baseclk_idx =3D min(baseclk_idx, 15);
> +	divisor =3D min(divisor, 32);
> +	scl_low =3D min(divisor * 9 / 16 - 1, 15);
> +	scl_high =3D (divisor - scl_low - 2) & GENMASK(3, 0);
> +	data =3D (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | basecl=
k_idx;
> +	if (i2c_bus->timeout) {
> +		data |=3D AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
> +		data |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> +	}
> +
> +	writel(data, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING); }
> +
> +static int ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus) {
> +	u32 state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	int ret =3D 0;
> +	u32 ctrl;
> +	int r;
> +
> +	dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr,
> +state);
> +
> +	ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	/* Disable controller */
> +	writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) |
> AST2600_I2CC_MASTER_EN,
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	i2c_bus->cmd_err =3D 0;
> +
> +	/* Check 0x14's SDA and SCL status */
> +	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> AST2600_I2CC_SCL_LINE_STS)) {
> +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base +
> AST2600_I2CM_CMD_STS);
> +		r =3D wait_for_completion_timeout(&i2c_bus->cmd_complete,
> i2c_bus->adap.timeout);
> +		if (r =3D=3D 0) {
> +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> +			writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +			return -ETIMEDOUT;
> +		} else if (i2c_bus->cmd_err) {
> +			dev_dbg(i2c_bus->dev, "recovery error\n");
> +			ret =3D -EPROTO;
> +		}
> +	}
> +
> +	/* Recovery done */
> +	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> +		ret =3D -EPROTO;
> +	}
> +
> +	/* restore original controller setting */
> +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	return ret;
> +}
> +
> +static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus
> +*i2c_bus) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len =3D msg->len - i2c_bus->controller_xfer_cnt;
> +	int ret;
> +
> +	cmd |=3D AST2600_I2CM_PKT_EN;
> +
> +	if (xfer_len > AST2600_I2C_DMA_SIZE)
> +		xfer_len =3D AST2600_I2C_DMA_SIZE;
> +	else if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> +		cmd |=3D AST2600_I2CM_STOP_CMD;
> +
> +	if (cmd & AST2600_I2CM_START_CMD) {
> +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> +		if (xfer_len) {
> +			i2c_bus->controller_dma_safe_buf =3D
> i2c_get_dma_safe_msg_buf(msg, 1);
> +			if (!i2c_bus->controller_dma_safe_buf)
> +				return -ENOMEM;
> +			i2c_bus->controller_dma_addr =3D
> +				dma_map_single(i2c_bus->dev,
> i2c_bus->controller_dma_safe_buf,
> +					       msg->len, DMA_TO_DEVICE);
> +			ret =3D dma_mapping_error(i2c_bus->dev,
> i2c_bus->controller_dma_addr);
> +			if (ret) {
> +
> 	i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf, msg,
> +							 false);
> +				i2c_bus->controller_dma_safe_buf =3D NULL;
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	if (xfer_len) {
> +		cmd |=3D AST2600_I2CM_TX_DMA_EN | AST2600_I2CM_TX_CMD;
> +		writel(AST2600_I2CM_SET_TX_DMA_LEN(xfer_len - 1),
> +		       i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> +		writel(i2c_bus->controller_dma_addr + i2c_bus->controller_xfer_cnt,
> +		       i2c_bus->reg_base + AST2600_I2CM_TX_DMA);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus
> +*i2c_bus) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len =3D msg->len - i2c_bus->controller_xfer_cnt;
> +	u32 wbuf_dword;
> +	int i;
> +
> +	cmd |=3D AST2600_I2CM_PKT_EN;
> +
> +	if (xfer_len > i2c_bus->buf_size)
> +		xfer_len =3D i2c_bus->buf_size;
> +	else if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> +		cmd |=3D AST2600_I2CM_STOP_CMD;
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if (xfer_len) {
> +		cmd |=3D AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
> +		/*
> +		 * The controller's buffer register supports dword writes only.
> +		 * Therefore, write dwords to the buffer register in a 4-byte aligned,
> +		 * and write the remaining unaligned data at the end.
> +		 */
> +		for (i =3D 0; i < xfer_len; i +=3D 4) {
> +			int xfer_cnt =3D i2c_bus->controller_xfer_cnt + i;
> +
> +			switch (min(xfer_len - i, 4) % 4) {
> +			case 1:
> +				wbuf_dword =3D msg->buf[xfer_cnt];
> +				break;
> +			case 2:
> +				wbuf_dword =3D get_unaligned_le16(&msg->buf[xfer_cnt]);
> +				break;
> +			case 3:
> +				wbuf_dword =3D get_unaligned_le24(&msg->buf[xfer_cnt]);
> +				break;
> +			default:
> +				wbuf_dword =3D get_unaligned_le32(&msg->buf[xfer_cnt]);
> +				break;
> +			}
> +			writel(wbuf_dword, i2c_bus->buf_base + i);
> +		}
> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_byte_tx(u32 cmd, struct ast2600_i2c_bus
> +*i2c_bus) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +
> +	xfer_len =3D msg->len - i2c_bus->controller_xfer_cnt;
> +
> +	cmd |=3D AST2600_I2CM_PKT_EN;
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if ((i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count) &&
> +	    ((i2c_bus->controller_xfer_cnt + 1) =3D=3D msg->len))
> +		cmd |=3D AST2600_I2CM_STOP_CMD;
> +
> +	if (xfer_len) {
> +		cmd |=3D AST2600_I2CM_TX_CMD;
> +		writel(msg->buf[i2c_bus->controller_xfer_cnt],
> +		       i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_dma_rx(u32 cmd, struct ast2600_i2c_bus
> +*i2c_bus) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len =3D msg->len - i2c_bus->controller_xfer_cnt;
> +	int ret;
> +
> +	cmd |=3D AST2600_I2CM_PKT_EN | AST2600_I2CM_RX_DMA_EN |
> +AST2600_I2CM_RX_CMD;
> +
> +	if (msg->flags & I2C_M_RECV_LEN)
> +		xfer_len =3D 1;
> +	else if (xfer_len > AST2600_I2C_DMA_SIZE)
> +		xfer_len =3D AST2600_I2C_DMA_SIZE;
> +	else if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count)
> +		cmd |=3D CONTROLLER_TRIGGER_LAST_STOP;
> +
> +	writel(AST2600_I2CM_SET_RX_DMA_LEN(xfer_len - 1),
> i2c_bus->reg_base +
> +AST2600_I2CM_DMA_LEN);
> +
> +	if (cmd & AST2600_I2CM_START_CMD) {
> +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> +		i2c_bus->controller_dma_safe_buf =3D
> i2c_get_dma_safe_msg_buf(msg, 1);
> +		if (!i2c_bus->controller_dma_safe_buf)
> +			return -ENOMEM;
> +		if (msg->flags & I2C_M_RECV_LEN)
> +			i2c_bus->controller_dma_addr =3D
> +				dma_map_single(i2c_bus->dev,
> i2c_bus->controller_dma_safe_buf,
> +					       I2C_SMBUS_BLOCK_MAX + 3,
> DMA_FROM_DEVICE);
> +		else
> +			i2c_bus->controller_dma_addr =3D
> +				dma_map_single(i2c_bus->dev,
> i2c_bus->controller_dma_safe_buf,
> +					       msg->len, DMA_FROM_DEVICE);
> +		ret =3D dma_mapping_error(i2c_bus->dev,
> i2c_bus->controller_dma_addr);
> +		if (ret) {
> +			i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf,
> msg, false);
> +			i2c_bus->controller_dma_safe_buf =3D NULL;
> +			return -ENOMEM;
> +		}
> +	}
> +	writel(i2c_bus->controller_dma_addr, i2c_bus->reg_base +
> +AST2600_I2CM_RX_DMA);
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_buff_rx(u32 cmd, struct ast2600_i2c_bus
> +*i2c_bus) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len =3D msg->len - i2c_bus->controller_xfer_cnt;
> +
> +	cmd |=3D AST2600_I2CM_PKT_EN | AST2600_I2CM_RX_BUFF_EN |
> +AST2600_I2CM_RX_CMD;
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		dev_dbg(i2c_bus->dev, "smbus read\n");
> +		xfer_len =3D 1;
> +	} else if (xfer_len > i2c_bus->buf_size) {
> +		xfer_len =3D i2c_bus->buf_size;
> +	} else if (i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count) {
> +		cmd |=3D CONTROLLER_TRIGGER_LAST_STOP;
> +	}
> +	writel(AST2600_I2CC_SET_RX_BUF_LEN(xfer_len), i2c_bus->reg_base +
> +AST2600_I2CC_BUFF_CTRL);
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_byte_rx(u32 cmd, struct ast2600_i2c_bus
> +*i2c_bus) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +
> +	cmd |=3D AST2600_I2CM_PKT_EN | AST2600_I2CM_RX_CMD;
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |=3D AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		dev_dbg(i2c_bus->dev, "smbus read\n");
> +	} else if ((i2c_bus->msgs_index + 1 =3D=3D i2c_bus->msgs_count) &&
> +		   ((i2c_bus->controller_xfer_cnt + 1) =3D=3D msg->len)) {
> +		cmd |=3D CONTROLLER_TRIGGER_LAST_STOP;
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +
> +	/* send start */
> +	dev_dbg(i2c_bus->dev, "[%d] %s %d byte%s %s 0x%02x\n",
> +		i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
> +		msg->len, str_plural(msg->len),
> +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);
> +
> +	i2c_bus->controller_xfer_cnt =3D 0;
> +	i2c_bus->buf_index =3D 0;
> +
> +	if (msg->flags & I2C_M_RD) {
> +		if (i2c_bus->mode =3D=3D DMA_MODE)
> +			return ast2600_i2c_setup_dma_rx(AST2600_I2CM_START_CMD,
> i2c_bus);
> +		else if (i2c_bus->mode =3D=3D BUFF_MODE)
> +			return ast2600_i2c_setup_buff_rx(AST2600_I2CM_START_CMD,
> i2c_bus);
> +		else
> +			return ast2600_i2c_setup_byte_rx(AST2600_I2CM_START_CMD,
> i2c_bus);
> +	} else {
> +		if (i2c_bus->mode =3D=3D DMA_MODE)
> +			return ast2600_i2c_setup_dma_tx(AST2600_I2CM_START_CMD,
> i2c_bus);
> +		else if (i2c_bus->mode =3D=3D BUFF_MODE)
> +			return ast2600_i2c_setup_buff_tx(AST2600_I2CM_START_CMD,
> i2c_bus);
> +		else
> +			return ast2600_i2c_setup_byte_tx(AST2600_I2CM_START_CMD,
> i2c_bus);
> +	}
> +}
> +
> +static int ast2600_i2c_irq_err_to_errno(u32 irq_status) {
> +	if (irq_status & AST2600_I2CM_ARBIT_LOSS)
> +		return -EAGAIN;
> +	if (irq_status & (AST2600_I2CM_SDA_DL_TO |
> AST2600_I2CM_SCL_LOW_TO))
> +		return -EBUSY;
> +	if (irq_status & (AST2600_I2CM_ABNORMAL))
> +		return -EPROTO;
> +
> +	return 0;
> +}
> +
> +static void ast2600_i2c_controller_package_irq(struct ast2600_i2c_bus
> +*i2c_bus, u32 sts) {
> +	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +	int i;
> +
> +	sts &=3D ~AST2600_I2CM_PKT_DONE;
> +	writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> +	switch (sts) {
> +	case AST2600_I2CM_PKT_ERROR:
> +		i2c_bus->cmd_err =3D -EAGAIN;
> +		complete(&i2c_bus->cmd_complete);
> +		break;
> +	case AST2600_I2CM_PKT_ERROR | AST2600_I2CM_TX_NAK: /* a0 fix for
> issue */
> +		fallthrough;
> +	case AST2600_I2CM_PKT_ERROR | AST2600_I2CM_TX_NAK |
> AST2600_I2CM_NORMAL_STOP:
> +		i2c_bus->cmd_err =3D -ENXIO;
> +		complete(&i2c_bus->cmd_complete);
> +		break;
> +	case AST2600_I2CM_NORMAL_STOP:
> +		/* write 0 byte only have stop isr */
> +		i2c_bus->msgs_index++;
> +		if (i2c_bus->msgs_index < i2c_bus->msgs_count) {
> +			if (ast2600_i2c_do_start(i2c_bus)) {
> +				i2c_bus->cmd_err =3D -ENOMEM;
> +				complete(&i2c_bus->cmd_complete);
> +			}
> +		} else {
> +			i2c_bus->cmd_err =3D i2c_bus->msgs_index;
> +			complete(&i2c_bus->cmd_complete);
> +		}
> +		break;
> +	case AST2600_I2CM_TX_ACK:
> +	case AST2600_I2CM_TX_ACK | AST2600_I2CM_NORMAL_STOP:
> +		if (i2c_bus->mode =3D=3D DMA_MODE)
> +			xfer_len =3D
> AST2600_I2C_GET_TX_DMA_LEN(readl(i2c_bus->reg_base +
> +							  AST2600_I2CM_DMA_LEN_STS));
> +		else if (i2c_bus->mode =3D=3D BUFF_MODE)
> +			xfer_len =3D
> AST2600_I2CC_GET_TX_BUF_LEN(readl(i2c_bus->reg_base +
> +							   AST2600_I2CC_BUFF_CTRL));
> +		else
> +			xfer_len =3D 1;
> +
> +		i2c_bus->controller_xfer_cnt +=3D xfer_len;
> +
> +		if (i2c_bus->controller_xfer_cnt =3D=3D msg->len) {
> +			if (i2c_bus->mode =3D=3D DMA_MODE) {
> +				dma_unmap_single(i2c_bus->dev,
> i2c_bus->controller_dma_addr,
> +						 msg->len, DMA_TO_DEVICE);
> +
> 	i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf, msg,
> +							 true);
> +				i2c_bus->controller_dma_safe_buf =3D NULL;
> +			}
> +			i2c_bus->msgs_index++;
> +			if (i2c_bus->msgs_index =3D=3D i2c_bus->msgs_count) {
> +				i2c_bus->cmd_err =3D i2c_bus->msgs_index;
> +				complete(&i2c_bus->cmd_complete);
> +			} else {
> +				if (ast2600_i2c_do_start(i2c_bus)) {
> +					i2c_bus->cmd_err =3D -ENOMEM;
> +					complete(&i2c_bus->cmd_complete);
> +				}
> +			}
> +		} else {
> +			if (i2c_bus->mode =3D=3D DMA_MODE)
> +				ast2600_i2c_setup_dma_tx(0, i2c_bus);
> +			else if (i2c_bus->mode =3D=3D BUFF_MODE)
> +				ast2600_i2c_setup_buff_tx(0, i2c_bus);
> +			else
> +				ast2600_i2c_setup_byte_tx(0, i2c_bus);
> +		}
> +		break;
> +	case AST2600_I2CM_RX_DONE:
> +	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
> +		/* do next rx */
> +		if (i2c_bus->mode =3D=3D DMA_MODE) {
> +			xfer_len =3D
> AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +								    AST2600_I2CM_DMA_LEN_STS));
> +		} else if (i2c_bus->mode =3D=3D BUFF_MODE) {
> +			xfer_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +								     AST2600_I2CC_BUFF_CTRL));
> +			for (i =3D 0; i < xfer_len; i++)
> +				msg->buf[i2c_bus->controller_xfer_cnt + i] =3D
> +					readb(i2c_bus->buf_base + 0x10 + i);
> +		} else {
> +			xfer_len =3D 1;
> +			msg->buf[i2c_bus->controller_xfer_cnt] =3D
> +				AST2600_I2CC_GET_RX_BUFF(readl(i2c_bus->reg_base +
> +						     AST2600_I2CC_STS_AND_BUFF));
> +		}
> +
> +		if (msg->flags & I2C_M_RECV_LEN) {
> +			u8 recv_len =3D
> AST2600_I2CC_GET_RX_BUFF(readl(i2c_bus->reg_base
> +						       + AST2600_I2CC_STS_AND_BUFF));
> +			msg->len =3D min_t(unsigned int, recv_len,
> I2C_SMBUS_BLOCK_MAX);
> +			msg->len +=3D ((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
> +			msg->flags &=3D ~I2C_M_RECV_LEN;
> +			if (!recv_len)
> +				i2c_bus->controller_xfer_cnt =3D 0;
> +			else
> +				i2c_bus->controller_xfer_cnt =3D 1;
> +		} else {
> +			i2c_bus->controller_xfer_cnt +=3D xfer_len;
> +		}
> +
> +		if (i2c_bus->controller_xfer_cnt =3D=3D msg->len) {
> +			if (i2c_bus->mode =3D=3D DMA_MODE) {
> +				dma_unmap_single(i2c_bus->dev,
> i2c_bus->controller_dma_addr,
> +						 msg->len, DMA_FROM_DEVICE);
> +
> 	i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf,
> +							 msg, true);
> +				i2c_bus->controller_dma_safe_buf =3D NULL;
> +			}
> +
> +			i2c_bus->msgs_index++;
> +			if (i2c_bus->msgs_index =3D=3D i2c_bus->msgs_count) {
> +				i2c_bus->cmd_err =3D i2c_bus->msgs_index;
> +				complete(&i2c_bus->cmd_complete);
> +			} else {
> +				if (ast2600_i2c_do_start(i2c_bus)) {
> +					i2c_bus->cmd_err =3D -ENOMEM;
> +					complete(&i2c_bus->cmd_complete);
> +				}
> +			}
> +		} else {
> +			if (i2c_bus->mode =3D=3D DMA_MODE)
> +				ast2600_i2c_setup_dma_rx(0, i2c_bus);
> +			else if (i2c_bus->mode =3D=3D BUFF_MODE)
> +				ast2600_i2c_setup_buff_rx(0, i2c_bus);
> +			else
> +				ast2600_i2c_setup_byte_rx(0, i2c_bus);
> +		}
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled sts %x\n", sts);
> +		break;
> +	}
> +}
> +
> +static int ast2600_i2c_controller_irq(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 sts =3D readl(i2c_bus->reg_base + AST2600_I2CM_ISR);
> +	u32 ctrl;
> +
> +	sts &=3D ~AST2600_I2CM_SMBUS_ALT;
> +
> +	if (AST2600_I2CM_BUS_RECOVER_FAIL & sts) {
> +		writel(AST2600_I2CM_BUS_RECOVER_FAIL, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> +		ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		i2c_bus->cmd_err =3D -EPROTO;
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	if (AST2600_I2CM_BUS_RECOVER & sts) {
> +		writel(AST2600_I2CM_BUS_RECOVER, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> +		i2c_bus->cmd_err =3D 0;
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	i2c_bus->cmd_err =3D ast2600_i2c_irq_err_to_errno(sts);
> +	if (i2c_bus->cmd_err) {
> +		writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CM_ISR);
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	if (AST2600_I2CM_PKT_DONE & sts) {
> +		ast2600_i2c_controller_package_irq(i2c_bus, sts);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ast2600_i2c_bus_irq(int irq, void *dev_id) {
> +	struct ast2600_i2c_bus *i2c_bus =3D dev_id;
> +
> +	return IRQ_RETVAL(ast2600_i2c_controller_irq(i2c_bus));
> +}
> +
> +static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct
> +i2c_msg *msgs, int num) {
> +	struct ast2600_i2c_bus *i2c_bus =3D i2c_get_adapdata(adap);
> +	unsigned long timeout;
> +	int ret;
> +
> +	if (!i2c_bus->multi_master &&
> +	    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
> AST2600_I2CC_BUS_BUSY_STS)) {
> +		ret =3D ast2600_i2c_recover_bus(i2c_bus);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	i2c_bus->cmd_err =3D 0;
> +	i2c_bus->msgs =3D msgs;
> +	i2c_bus->msgs_index =3D 0;
> +	i2c_bus->msgs_count =3D num;
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	ret =3D ast2600_i2c_do_start(i2c_bus);
> +	if (ret)
> +		goto controller_out;
> +	timeout =3D wait_for_completion_timeout(&i2c_bus->cmd_complete,
> i2c_bus->adap.timeout);
> +	if (timeout =3D=3D 0) {
> +		u32 ctrl =3D readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +		dev_dbg(i2c_bus->dev, "timeout isr[%x], sts[%x]\n",
> +			readl(i2c_bus->reg_base + AST2600_I2CM_ISR),
> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +		if (i2c_bus->multi_master &&
> +		    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
> +		    AST2600_I2CC_BUS_BUSY_STS))
> +			ast2600_i2c_recover_bus(i2c_bus);
> +
> +		ret =3D -ETIMEDOUT;
> +	} else {
> +		ret =3D i2c_bus->cmd_err;
> +	}
> +
> +	dev_dbg(i2c_bus->dev, "bus%d-m: %d end\n", i2c_bus->adap.nr,
> +i2c_bus->cmd_err);
> +
> +controller_out:
> +	if (i2c_bus->mode =3D=3D DMA_MODE) {
> +		if (i2c_bus->controller_dma_safe_buf) {
> +			struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> +
> +			if (msg->flags & I2C_M_RD)
> +				dma_unmap_single(i2c_bus->dev,
> i2c_bus->controller_dma_addr,
> +						 msg->len, DMA_FROM_DEVICE);
> +			else
> +				dma_unmap_single(i2c_bus->dev,
> i2c_bus->controller_dma_addr,
> +						 msg->len, DMA_TO_DEVICE);
> +			i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf,
> msg, true);
> +			i2c_bus->controller_dma_safe_buf =3D NULL;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void ast2600_i2c_init(struct ast2600_i2c_bus *i2c_bus) {
> +	struct platform_device *pdev =3D to_platform_device(i2c_bus->dev);
> +	u32 fun_ctrl =3D AST2600_I2CC_BUS_AUTO_RELEASE |
> AST2600_I2CC_MASTER_EN;
> +
> +	/* I2C Reset */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	i2c_bus->multi_master =3D device_property_read_bool(&pdev->dev,
> "multi-master");
> +	if (!i2c_bus->multi_master)
> +		fun_ctrl |=3D AST2600_I2CC_MULTI_MASTER_DIS;
> +
> +	/* Enable Controller Mode */
> +	writel(fun_ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	/* disable target address */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +
> +	/* Set AC Timing */
> +	ast2600_i2c_ac_timing_config(i2c_bus);
> +
> +	/* Clear Interrupt */
> +	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CM_ISR); }
> +
> +static u32 ast2600_i2c_functionality(struct i2c_adapter *adap) {
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
> I2C_FUNC_SMBUS_BLOCK_DATA;
> +}
> +
> +static const struct i2c_algorithm i2c_ast2600_algorithm =3D {
> +	.xfer =3D ast2600_i2c_controller_xfer,
> +	.functionality =3D ast2600_i2c_functionality, };
> +
> +int ast2600_i2c_probe(const struct of_device_id *match, struct
> +platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct reset_control *rst;
> +	const char *xfer_mode;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret;
> +
> +	i2c_bus =3D devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;
> +
> +	i2c_bus->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c_bus->reg_base))
> +		return PTR_ERR(i2c_bus->reg_base);
> +
> +	rst =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst), "Missing reset ctrl\n");
> +
> +	i2c_bus->global_regs =3D
> +		syscon_regmap_lookup_by_phandle(dev_of_node(dev),
> "aspeed,global-regs");
> +	if (IS_ERR(i2c_bus->global_regs))
> +		return PTR_ERR(i2c_bus->global_regs);
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CTRL, &global_ctrl);
> +	if ((global_ctrl & AST2600_GLOBAL_INIT) !=3D AST2600_GLOBAL_INIT) {
> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CTRL,
> AST2600_GLOBAL_INIT);
> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL,
> I2CCG_DIV_CTRL);
> +	}
> +
> +	i2c_bus->dev =3D dev;
> +	i2c_bus->mode =3D BUFF_MODE;
> +	if (!device_property_read_string(dev, "aspeed,transfer-mode",
> &xfer_mode)) {
> +		if (!strcmp(xfer_mode, "dma"))
> +			i2c_bus->mode =3D DMA_MODE;
> +		else if (!strcmp(xfer_mode, "byte"))
> +			i2c_bus->mode =3D BYTE_MODE;
> +		else
> +			i2c_bus->mode =3D BUFF_MODE;
> +	}
> +
> +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> +		i2c_bus->buf_base =3D
> devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> +		if (IS_ERR(i2c_bus->buf_base))
> +			i2c_bus->mode =3D BYTE_MODE;
> +		else
> +			i2c_bus->buf_size =3D resource_size(res) / 2;
> +	}
> +
> +	/*
> +	 * i2c timeout counter: use base clk4 1Mhz,
> +	 * per unit: 1/(1000/1024) =3D 1024us
> +	 */
> +	ret =3D device_property_read_u32(dev, "i2c-scl-clk-low-timeout-us",
> &i2c_bus->timeout);
> +	if (!ret)
> +		i2c_bus->timeout /=3D 1024;
> +
> +	init_completion(&i2c_bus->cmd_complete);
> +
> +	i2c_bus->irq =3D platform_get_irq(pdev, 0);
> +	if (i2c_bus->irq < 0)
> +		return i2c_bus->irq;
> +
> +	platform_set_drvdata(pdev, i2c_bus);
> +
> +	i2c_bus->clk =3D devm_clk_get(i2c_bus->dev, NULL);
> +	if (IS_ERR(i2c_bus->clk))
> +		return dev_err_probe(i2c_bus->dev, PTR_ERR(i2c_bus->clk), "Can't
> get
> +clock\n");
> +
> +	i2c_bus->apb_clk =3D clk_get_rate(i2c_bus->clk);
> +
> +	i2c_parse_fw_timings(i2c_bus->dev, &i2c_bus->timing_info, true);
> +
> +	/* Initialize the I2C adapter */
> +	i2c_bus->adap.owner =3D THIS_MODULE;
> +	i2c_bus->adap.algo =3D &i2c_ast2600_algorithm;
> +	i2c_bus->adap.retries =3D 0;
> +	i2c_bus->adap.dev.parent =3D i2c_bus->dev;
> +	device_set_node(&i2c_bus->adap.dev, dev_fwnode(dev));
> +	i2c_bus->adap.algo_data =3D i2c_bus;
> +	strscpy(i2c_bus->adap.name, pdev->name);
> +	i2c_set_adapdata(&i2c_bus->adap, i2c_bus);
> +
> +	ast2600_i2c_init(i2c_bus);
> +
> +	ret =3D devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
> +			       dev_name(dev), i2c_bus);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq %d\n",
> +i2c_bus->irq);
> +
> +	writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +	       i2c_bus->reg_base + AST2600_I2CM_IER);
> +
> +	ret =3D devm_i2c_add_adapter(dev, &i2c_bus->adap);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ast2600_i2c_probe);
> +
> +void ast2600_i2c_remove(struct platform_device *pdev) {
> +	struct ast2600_i2c_bus *i2c_bus =3D platform_get_drvdata(pdev);
> +
> +	/* Disable everything. */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER); }
> +EXPORT_SYMBOL_GPL(ast2600_i2c_remove);
> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_DESCRIPTION("ASPEED AST2600 I2C Controller Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1


