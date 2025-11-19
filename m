Return-Path: <openbmc+bounces-922-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2260C6C600
	for <lists+openbmc@lfdr.de>; Wed, 19 Nov 2025 03:27:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dB5456D7fz2xqr;
	Wed, 19 Nov 2025 13:27:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763519269;
	cv=pass; b=hyr6BvzU5pO3G+mLZCXOkshQys7SfWGcNRPAIF5YQoTiyzt5L8zP2hSnliF1BP6y0G3KwRiv/sRXYutLN+YGMtF6JboPEKRJof3p3astFi/fYwP3Uc1IKTnAxCNgZyHNlh/NPqAgkv+TcO+NG4WOtVDBnHALcVuxGzNgqE0F5V2M99i67sNhQUfE7755DyWbREbcYTrm0jvlluFxIFjcKNJuAPGmyyA/gIwlBJVnWMSFuGLTnQzErYA7GCkVQ/ZfcyNH8kMzoaDSlmlLyeUHp1d17yysc+xWOwIJiPxJPHNR/0d7PK5PSYgrFoepYoW6KJt1lg/RVwVmDGSDbaM+uA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763519269; c=relaxed/relaxed;
	bh=M9qWg364L09Q3J1of4DYNpWPtvtx69nicBOneuMpbtU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FtyK84m+h9vNFYRaheO1+CjlLS68g4J8JgPUZb1BUrTGHBt7dq8UsHxTdDUaJVe1anzpMEugu/02kxlM36cIPqhfm3bBbsz2Ahznx7j3zKgbJ7/azeGx8l2wD06p+l52yy1mtNTLeTtAGoxAiPY89lEf+oJoAjM8wQuzFKElBFH6vAI9jFlVUtGXuyAJRpAyS0bQyVr2vQgICo0YdU18qzviX1QHi1uCh1WSaTIKUaCCLf8VX8QNutgDhSq8JKk08wnbc+18OD+rRqoqBhaTvenUXxKsk1oFjvyblNMaofQkkV1Q3v5nlFjF/wlSwPJs/aj5YtLIRyV3ej5lbX3QMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=BnPU31r7; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=BnPU31r7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dB5441QvJz2xqg;
	Wed, 19 Nov 2025 13:27:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht55eN+MnhkD+qjvI9sOaS7vEcMY8exAF9l+mZ5W/G6yn23bDl8v5Cc17x0GHpPkRt6zUA+sLyZ63KVCKNthxqM4Y+306tU35tzn9doCgK+sDg8FXTJVsy7u3sA2KOc3qjPfFqJnkapgV1a9a+sBD2aI4dIBkVJXoeUVB3GR/7KNcHOiUAgOQ9eZYGB42FC1lFJDqhH8I2yJD3GubsLdMqEkE0De3hbS3gKTJqwz6z3oES9EjnKcfTtmdwWXvO5+ils2B21O6a1dM0oyIEEoNFrxkxpxSCZZWHXCHCauCa2yg2z7ijsudVNp3+c80NPm1sSrqB/wgOv6qHksUoczRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9qWg364L09Q3J1of4DYNpWPtvtx69nicBOneuMpbtU=;
 b=ngEn/+eX+DsE+rwJZ6gfKQH/LxrqJ7X424w+kOv3Iz1+oP2dLrUedO3yKGthNdQ5h9sfKak6r5J0vkdJSvAwPAMxTowuZHdf4KNAANJAPmtQXEVXz6OLVym5sMHmkSuWubOiFRZGS/sYq9OiAMlJRS9qyROFTNt/0bpb5XQeVjnCKFzWtO/LD7RmmX1xkJH8Ynxw8iPYAKnWxdvuYFvvZKYMWDgs79UVNAlCbn4VXx7RAJUErczhIfoL69m8gIO1yv7VgYT1jV3PK6HM2b3WSju5550DE8o7VqhHciArespDJclc2H4TFI4U40JhaeTuwvyvjKxQvsizP51MG8io4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9qWg364L09Q3J1of4DYNpWPtvtx69nicBOneuMpbtU=;
 b=BnPU31r7za4anJ7S1lqiakHsvIYhHFqCn39uvMBV37Ip6xgaYTyyLINsKiRvgdGgxiHlhn4gwlSZR3bPA3h0rGfFmWCCb817S6JqENKzmrbFIvtGrD4LnOV9o4Ve0YiP7ce0fKjF1Q5Ef9JGWylHqJqxc52MQrw3ShrmSWq4CqLGyt+u+LXz5T4afrO4NsVPDET0AhnuipQL8bI6XRhaGZeJPTjVyENcDuEz/nnBy/P3UWha3Wl95y4+tq/W05Qz9DmJFAE1pD+MaHxHLq5/vLXxlQvkjQ1Gncktg+i3zrjcvJ4QCFwArHASjDguJPdMeLjK0cG/2yNr7yVY9OTKRg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB5181.apcprd06.prod.outlook.com (2603:1096:101:8c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 02:27:22 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9320.018; Wed, 19 Nov 2025
 02:27:22 +0000
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
Subject: [PATCH v5 6/8] PCI: Add FMT, TYPE and CPL status definition for TLP
 header
Thread-Topic: [PATCH v5 6/8] PCI: Add FMT, TYPE and CPL status definition for
 TLP header
Thread-Index: AQHcV78oxw3pQAYCo0+MHD1idq0RtbT3H9KAgAIoIzA=
Date: Wed, 19 Nov 2025 02:27:20 +0000
Message-ID:
 <SEYPR06MB51340B04D9423EDEABFE9BA79DD7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251117-upstream_pcie_rc-v5-6-b4a198576acf@aspeedtech.com>
 <20251117172859.GA2466937@bhelgaas>
In-Reply-To: <20251117172859.GA2466937@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB5181:EE_
x-ms-office365-filtering-correlation-id: e7a4cb08-81a0-4be2-3aa4-08de27132ae0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?S/PD1iHEg+ITnyVBPaua2SAZyE8HOi0gsc1if3DLqBdq3DtpIhYQrOcBEt?=
 =?iso-8859-2?Q?YPCNTrMa6sQYAoKT8L3Ygo1ICTNjbgX+M15mEMxfCYgV1pGSon667eEviH?=
 =?iso-8859-2?Q?CCYbjT2h4D8auEE7oaaPY7AVsjlKFfR/y/oM62iEfaKudG5zXPIbogU7Jm?=
 =?iso-8859-2?Q?IOav5fE3yuRdUaeUXekLyCPC+np3zDqJzgrg1UHMrRTESgpTfJdlgTFa0n?=
 =?iso-8859-2?Q?sOwvfDDZv2h/UcJPkI1kimMhYx9EsBpTDUy3wEiWtpn5ce66OqxS6Gk2wJ?=
 =?iso-8859-2?Q?HlVTSQrApRF3TaSaDh4J1CoIuTU1WEsUcwUE/XXtkAmlBn45r+SMvAFatM?=
 =?iso-8859-2?Q?AfHcJ/CA5u4fpGoGGGTuRZsJx5DyzD+B0p4OTGGbi6DPRpzPuNRLrrxQIK?=
 =?iso-8859-2?Q?zjMQNd0SjkWNT9XQF/LsJEmWmivlkva3vfXO0q2mili+I0VtmdZYPfcJ6i?=
 =?iso-8859-2?Q?Zv8cl1K0qQIKP1n0v1N818nUONw1E6OrtE2HbYgVn0r3Z1+tCj4xoc90Om?=
 =?iso-8859-2?Q?BgVfngjPRv7aIsKifeGw+m27Hzk0d8ttiHH6DhOL/2+/p1nh8qDw4WQBF3?=
 =?iso-8859-2?Q?LTn7PNF/oA/ziXJZVtUWJkHPL/hU+iBR05rnySc4nhATPI5qejUk1ZqtdL?=
 =?iso-8859-2?Q?SXRcoXcoGD0z6G0d1BfmKh5jdSp5S6kUwH+MIngbukHJCZp3rtFyuG4F4+?=
 =?iso-8859-2?Q?DijaMkosWid/uZUiRt81QfP4t78qwtGScr1DScyoFRtVT6Wfp9UQoT5L2s?=
 =?iso-8859-2?Q?yv91/l83JxhtgXPOrZMAC4XFQBAlv2v19GpzejVmHRVpKkA2M3L3Yy4ANW?=
 =?iso-8859-2?Q?O+m34XOmcfnJr0ZjEHLDUOYHgCIgVBska1untwIqywymQML/WqlEMXFP0K?=
 =?iso-8859-2?Q?Z2QpA4+WVeVQVuWFj4TpajFW0wb9zvdcA2/j2ZaQfF9Pq58auNZjHJQ74d?=
 =?iso-8859-2?Q?0t3+np5d7EQ/Sa5iWU9n+O7Gmdd3sR57/uLpK+zjnOmH62UO48UvNFDwt8?=
 =?iso-8859-2?Q?tri1hjrP3hX5Uk2wKSqIx6bVTzdh8dT3c0J94aqdvTNxQgAOdVCesq71QE?=
 =?iso-8859-2?Q?JQDIQorsOIAxK5HmFAT+t/qdiOVoIWYILvjGLEQgQNWRQTaLCbapXwc7xO?=
 =?iso-8859-2?Q?DxLJUi6fRLLusauJj2EB0DvkvAPMQvkB40FjxJFLN6yFl2GE5EVWvDfFlV?=
 =?iso-8859-2?Q?RVlahHfTBYcR2p2qFSpLc1yIIx/91l9b2e8aNFg3BfT7zKxcEoUm4HLQFf?=
 =?iso-8859-2?Q?LeuoFue3SSIntk2SdoTENIBm3c5hJWgUr9d+Y3dWz91kPSN2Lcfre2W4su?=
 =?iso-8859-2?Q?mdVq+Zl+N/T6Wx3jaju/e74/q50Egu4pfiWg5nM4tpGEXO5LrVuFkwH9Pg?=
 =?iso-8859-2?Q?LLMbNYR9wIi35FBAi2FuJOt8unCgUI45ME7WU+6jLZQoGEwmQrtr3RmMTt?=
 =?iso-8859-2?Q?WqlSb/c+6xghmifWMIm7hNzc4gwkVYQ4Y92t/owHcemezf5tUEY8v53Don?=
 =?iso-8859-2?Q?uQIHj9T5sPNARlKHmy93OxgzqQ/z+Sn1ZqTExuew9o95Wx7jVg61SNm9HM?=
 =?iso-8859-2?Q?/Vz7NRVJMeT4o30kcH9lEUUPauzY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?UZ3n9gSw7+dwJ02C/sM0Tw3myoMjpLY+elZ8XxZzfmqk96Xi9F+RXMRdFx?=
 =?iso-8859-2?Q?B/QmL5I8sX1oYj58SQf3SLE+9BCPjXLJZUySF3zx/8PpouZh4Sy1Iehqua?=
 =?iso-8859-2?Q?mByu/M1IobKk4+gXcwMtIDo/2CISsbXGN+5mVbR9peVFes5Rbpy15rPh1m?=
 =?iso-8859-2?Q?ya7nv+ZjqwsK+I79DbF+75cM+EZ02aiSDMs9xP/GtejxOUxv60k6FUqhUu?=
 =?iso-8859-2?Q?lqdB9PKoxqGJASmQPL0DfoEIsw6Qv/XIDcgcDAl1zIaJCW8Fazul7DUfq+?=
 =?iso-8859-2?Q?XARNu6vFdZ+IKdVJ3bQh6PVYtNstjcPoV5Yhd2UiUbehdp1iFm+zRVHcfm?=
 =?iso-8859-2?Q?673gYmuv7RCPqubGM5g8/I0g/HJHBHTZPx5imyDHblU+MxYh7joUNx3EV3?=
 =?iso-8859-2?Q?KFEI+sjmuvFLWrZFVQBOYsaflPIHK14VtJ9+QrgspRTGh8h6M83OEimsoF?=
 =?iso-8859-2?Q?k7nC6ZU8uKcBGoPkPIrPXZxh2ytHlqxscF7TqiFWlurC7xdwGL0F0NP48i?=
 =?iso-8859-2?Q?jiAoLGiGbq+C+owBDVdys5eXRHFrBiz5rFRahuZsrb4LpmWlgdafUq/dWN?=
 =?iso-8859-2?Q?UtD+35TmJ8EVxyLu+hnp+8CFj2ATcLYlB1u+amc7XBCCksBhl/NdmqXjy7?=
 =?iso-8859-2?Q?Qnq6CMPd4ZYvcoXAkVMADezYseH387vxISBE07HhzZuLLZEsSz7cI12CJY?=
 =?iso-8859-2?Q?zJlYBoKqKsMtNHTEpGHUZPkjIf0aQGqAlUljE/XQHCpobpH8QZPVUGfb0I?=
 =?iso-8859-2?Q?5AiILUaVAf1etONlXJW9ytjb3G6ba14XZW7uQoAzvmXlH0Giz2paBpUKt5?=
 =?iso-8859-2?Q?Xsb76lYjOQCOoFx/M0WTECbdxQ2aCqoGLfJ2hT8LN9td9+FqB021Ph9QMm?=
 =?iso-8859-2?Q?RGBJL0OV1VxEub2trHaYuy3hmmzw7OcVQykl1dxbAKZKiuQ940v9I8Xikp?=
 =?iso-8859-2?Q?vXmv2oUFERi2jjYFHI6B7NM1lUGs+q9KqBRKBKQKO70zrJS+RbOqzrFBlX?=
 =?iso-8859-2?Q?+oQMHownXU3CJXsFztG+tV/3AODGIBIxgmUP4x8yhwUYR0rT4f8Wbr0p+J?=
 =?iso-8859-2?Q?W4e2s9JHR1suaXe0IilzE1uNdPQnrRLCVSMSESxHXG3VBnaAlmyqmaawF5?=
 =?iso-8859-2?Q?oyJfzQW4Y/DctFZ0Rjn0veBzZFFHKLHgZXVQw6EjnKFWBZhE9pxIu8tdWz?=
 =?iso-8859-2?Q?mjx9i/fuNttwFjJ0kYkpNIVjx74q9xt5uuysn14h84q38BZBSHrlJ9+/+/?=
 =?iso-8859-2?Q?TOVwMWjqKuG8GrM6IMnLxqin4L0ofebkJv9U8ovhsNWXcwuG2S5IuLxzJF?=
 =?iso-8859-2?Q?0g4xkhfimsI7Hif5BvNpNdqf14NLjfOZYBtxYThKu1GWZ5BC45ScWSoCg2?=
 =?iso-8859-2?Q?xM0U2HD3fK7oD9Yb+ZjPThHUdMzvKHabyPm177Ory8nUVhXDJ/y9DO5MlA?=
 =?iso-8859-2?Q?qXdc00MGexWg2t7poDoDNkuCJ+95DTHgCgIc3xyVlHlylGXMWCrWA0tefQ?=
 =?iso-8859-2?Q?ld+Y2a6+wDJQXkoLwg9M3DVgSXDS0dikDb/2LdQllJMcWwBSHYYpyRhsSn?=
 =?iso-8859-2?Q?/19rETpIq9eON5/oODQ6pA4Sm9wV3pyTvJAuz9K02eQMSz14wVGI2qVBXm?=
 =?iso-8859-2?Q?OhdW80RkZtKhq186Q01oYST59RIdRApvNS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a4cb08-81a0-4be2-3aa4-08de27132ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 02:27:20.8850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35d/LTWw4Z0YT3d9LQ3NMm8TPjbd4F1khY+dtvxAcO2CrNdRrBUKN/+jMYPsOE5B2FhQc4ezS4ZEo2O7BMwMwxHGov2UkVjDBjMMotZNi28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5181
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bjorn,

Thank you for your reply.

> > According to PCIe specification, add FMT, TYPE and CPL status
> > definition for TLP header.
> >
> > Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
>=20
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>=20
> OK by me, but it'd be nice to move up a few lines so this is with the oth=
er
> TLP-related items and the unrelated PCI_BUS_BRIDGE_*_WINDOW values
> aren't in the middle.
>=20
> Might even consider moving these to be just above the Message Routing
> constants so things are generally in the order they appear in the spec.
>=20

I'll move these above the Message Routing constants in the next version.
Thanks for the suggestion.

Thanks,
Jacky

