Return-Path: <openbmc+bounces-1061-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3ECDB652
	for <lists+openbmc@lfdr.de>; Wed, 24 Dec 2025 06:32:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbgWK6HfDz2xqG;
	Wed, 24 Dec 2025 16:32:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.127.120 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766554365;
	cv=pass; b=YxlQEWG6DutOl74gBUbts9pi9idWMXZZE8ZZ+0f52AFZZZlif/zSnRuuJvAQPpUEh0LOOvehhU76itXCqonvaLKrp1P0J+EutAesgzVVljdei7m0wpUEl8rinJh3RLoGMKIE3gndl1N2qdDKnGoZwgEVJygjQT8YKekkSuA3U0G326LeLN6PJMm9zbjGfU9Es984YxJFwCrakGA6L/OK+H73+HIizFnEaErOJRZO9jRKjsOhcK8ULZSipq5kePfr364uhwfjnaqGJtilsK9KvSb1gh4Z4k1ompb3ArudrGSO6r07my260YSlsxGAak2ScZA07avYpUSmuHstUJW0Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766554365; c=relaxed/relaxed;
	bh=MnupctpBpZx80ILeiUo9M+sDSWIYxASWnF6PmTij0Gg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=leFDn9LnkUe9OA94Xw7hsvIfncuMxnBeTLNg3KNqysHItIpxo4pV1RRkEngqFCMoKd2m0wCcwiHio6lqcwFxgQGIlkRcimrQZC0en/H3T5tUWf+R5yR3M34Wyyn9zUKGVtAe3bkqzpCEULTMTT1aOwNyxDqSgVBm9gAuFZsGhUBqXPQQ/+R+xdDk4WQRw0VqjJya1wPyhenLBW1rflBGlAhKMwT8KVYq/WFe9Smp9nngIWHfEHn/3MaT9KyuccQqwJj7E2RrES+eRbImONsfC8S9hT290oSHv06GSj/TGnD8J2b+Qkg4JCePkP6EM9lykZzoScz9QllnQ/2+Rikp2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=lFgsXZR5; dkim-atps=neutral; spf=pass (client-ip=52.101.127.120; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=lFgsXZR5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=52.101.127.120; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023120.outbound.protection.outlook.com [52.101.127.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbgWH6b0rz2xlM;
	Wed, 24 Dec 2025 16:32:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/iCJR9rz/bcwpX3U9Mf+1Z05QuWnX5speZ2JALIyoa6XRHvCvyLTblaaK/JjO+uM7sX3jY63XWMf85upe+4zj+1nRoa/iq8F51SOI2AVNk7+n9zIXLIXUUGWPx0hjAvAYF4g/EevTkZcytvB0qwOhQ6uL15sL9+whSAQ/EpGYXa8D9rZTbcJGoA20ApCV8OT8Mya5ZtbQQFRUru/2+RZMTN8APkqz7EJhdexRYlmsUBSPBRTQaFge9JlGJesHmzafpNO4XgWSnKY4cIfKd2iGWoASchsv3g0d2eKvX+6u1gCNFhKVzlDMJnNALCunxEW9aWRCo0/uQ5NqrP8VV4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnupctpBpZx80ILeiUo9M+sDSWIYxASWnF6PmTij0Gg=;
 b=c71JJgk34xRQ2ZV3Bsrd+U37+5r0GECBOwwebM51QRUd3z8oNMuUSh2FqrX9uCmjZxtLVzgbikpmQw2/I9cmd+c0GR7BgzHWlR4nqo9D6+/EhHYaXelpvDjh+52FxHYU9MxEP7Fs1WqfCJaw/ywGJY0MCwqEVmGixN0lpfRszbQXXQ/Mjx7IG+TQGGPD53PAhAf+UxFJ/mL2KzcMc2dxYT09GdsZIOTK9IbF0fsCOog77ei/ld0WS0Q/CiRzAF+OiI08m1zqSTpwiVB0hR+Bm0oi8c8ghmsbmqoJy0OA2bOK6bbtQ2HmRsxoeSrId1CoRtgw1C7IyOgXinSc3qEloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnupctpBpZx80ILeiUo9M+sDSWIYxASWnF6PmTij0Gg=;
 b=lFgsXZR5t6E+LRbXeEz1ZHSQjSebvx/+2Z65ZhwWjIozhsAYngquSU3vWIufpEqHpMGHWktDTwFpTRRqVCHuO4wMeBPddYvReHTkjCDagMvtr2G8AIs0wAXc89UWth+8tVYNaJuPggYmeRpQ90ffXnU6d8uUArrtfst5ySk5CzvPVSIPyjflkoaWUyO1iQvGpMdT4asxhnkd117YgdnXOsHGh1K/u3LociU5NWEHSy6I76UPlT7NyWpdDUaTorUU5BtPG2yeAFy7ENhvjcWovzlfpGXvEeA3z2f+GcTq8suAQ9m7JjkWrBxnx4U62VdwJOVKwW7EVJj0kzsiMCki3A==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TY0PR06MB6854.apcprd06.prod.outlook.com (2603:1096:405:10::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 05:32:00 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9412.011; Wed, 24 Dec 2025
 05:32:00 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v7 4/7] PHY: aspeed: Add ASPEED PCIe PHY driver
Thread-Topic: [PATCH v7 4/7] PHY: aspeed: Add ASPEED PCIe PHY driver
Thread-Index: AQHcbi5Sg3H9Wgp35E2Sp8TbUiyc77UvaBQAgADmf4A=
Date: Wed, 24 Dec 2025 05:32:00 +0000
Message-ID:
 <SEYPR06MB51340F64E40B19975A2FD9D79DB2A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <20251216-upstream_pcie_rc-v7-4-4aeb0f53c4ce@aspeedtech.com>
 <aUq3hF7Xfk-f35Nh@vaman>
In-Reply-To: <aUq3hF7Xfk-f35Nh@vaman>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TY0PR06MB6854:EE_
x-ms-office365-filtering-correlation-id: acf746f4-ee2a-455b-b9a8-08de42adc326
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?c3yVevG88P/6vPa6o8eM3Cxj4P8IM1hgr40kAGC5iZ3FvTO3NW/96+Sm9G?=
 =?iso-8859-2?Q?DrQ1XhiJKJYWT6XRrVIDgxiJuyI99nz/RYz7rzLj/jB4G8VGPaos10bGbo?=
 =?iso-8859-2?Q?5zznQwE5X2Q2lrcDvzR0xKq3gZicgcf/NoRH6iIfh+Px+vFsGgkmeHLgsU?=
 =?iso-8859-2?Q?5OeaD7TV3fFo3pDEEmM6Lv2ASDgrEtAIBn7X3kMD27ZNW6Ev0R8IKU5akh?=
 =?iso-8859-2?Q?X7Ox5ZGlHbVs37Et1iMaompAtWejREE4TU9QyUiUcZsWcY7W1Fclp7R0mx?=
 =?iso-8859-2?Q?t+DE2PdlXGOEbNDc8l+CjGm1HIca1RXZwuFnb/sg1sJrCRf8bfy5xJ5c1w?=
 =?iso-8859-2?Q?4KBchSbBIVFaeDBCSdFzHLGjsEzmBRQt+9eH784LE6tsmBfQbk9sZbDc/Q?=
 =?iso-8859-2?Q?xfsDWMmvTNWZoxwslYRv1z6xjdCZ8nheb+/0/BcMy8GG0PMkqrkpL7EXWs?=
 =?iso-8859-2?Q?mwKN0O9aFvJzUMNLJ6IP6sfpE3ZUVLkfsf8S05IEa+fT84DghFkzd//F9M?=
 =?iso-8859-2?Q?XseJecwiNW+PuP/7i8+DWTNBxVshL9cAZTkyVTjYNJ/hBC8R2NqRtnFXSO?=
 =?iso-8859-2?Q?O4R4835lzDbyFtsm9oCBgGcuHtfWiHFsSPsqgXjUJ4iwwz5L/MAK7SJJ5h?=
 =?iso-8859-2?Q?1rpKdUugRLUgkq4ZwR/96N2CWj4mJUmlWf+Lh8lKwjnN0mVj6O9Bq5SbJd?=
 =?iso-8859-2?Q?P2bkP2IHaynfJXfEnIUexjzx6Vbf7LmFJJqkNOAIUqzHfK/faOWTXoQ8sc?=
 =?iso-8859-2?Q?rlMv4fBQXl7gQ7dx6PTD20Wtb8WBNI+801BlnGAX6hmv5jaNr5LN6Ee277?=
 =?iso-8859-2?Q?i0mxEvTHJ6qavJ+3YWkEOhZx6CxxSJrCF+CGeGWIwLsqCOAC8NQcC68z+O?=
 =?iso-8859-2?Q?jV2SKIaHIEh3ccQ8Vmh/O4Xx/6LsDx/u7rZzzSydSHv/3PEBNe5sp9UaHd?=
 =?iso-8859-2?Q?prelKe/nJaG5Xvlk26p+3/9rlbeRkFempWkqUIUzRX4EOL+JgzPZAhBQwn?=
 =?iso-8859-2?Q?hZ3GrFlVh81EjV+7g5t04NhNSab/WpSfmMTAQnpn3KcwuXN0NIWDKdOJLa?=
 =?iso-8859-2?Q?ZEzGC0eKWwTkUGM8O0QCDpHjc5oxx55JXT4bz2AD0234eU/onBKngF/tWP?=
 =?iso-8859-2?Q?4ZFPDBH2SdPeDekpqmXYpoYjKD8pbWlCTTgmeB/DXCKU1Ml93Wd2Taxw41?=
 =?iso-8859-2?Q?18TOIXc6JaooTqUc1nvz8XiQHi1y0Iy20MmlSUwW0W3+7duQhOqe/QEsgx?=
 =?iso-8859-2?Q?jizrxWZ0YCLGiQCMK7AZQlrk7dKmbRWZDn3iVMIGxqRm+IQA8SmmbuoGlQ?=
 =?iso-8859-2?Q?UsoR8XHGFH3376chmlgkru0a9tuBGgGFblltXDtYzmyoGZlwKiVsHkjpbN?=
 =?iso-8859-2?Q?hvFKigThNgOIxmHVvPjJelytBRcRjO0TiSPgzn+cgvaFt7Jlpip09okRpB?=
 =?iso-8859-2?Q?1hdWj7LbLErM0+BKKeW7CC4qLmEeP8g8jmQBy7J/u8qPe+iPy+4wQW+kMh?=
 =?iso-8859-2?Q?B9lrlYMakCkbWcaiwcILU3t/RKqXIA2qnzBrhakBsTlLHjm4RLKlMWvtok?=
 =?iso-8859-2?Q?aBdhRKUxC9lptzR9vBXI9vY6IWwS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?oq03pIl1Bo3FOA1zL85vSDNwvvRGw+56u+c3lkwm2JHWtt8fC0B05gOX7J?=
 =?iso-8859-2?Q?wlYTCKIKbl1oof/qIzFhWq3fMMtU2nZItL27/b08i1zFU6/yr3Y1ntou9q?=
 =?iso-8859-2?Q?8+2jpYw/BNeEFekMacIrUrL34vUzAkN+VuM/ru1TaLhcPpAgTusAlv8JTm?=
 =?iso-8859-2?Q?PDAjubL9uaTUsJS7f2Txgm4yxgwmK5VS9W/qPUtZdYqzLsaDJc4qeqNgjB?=
 =?iso-8859-2?Q?XycUTTCWwYyPmWcHLpK45jSxZw2qWkDTFHbVmb9kta2bYFoqCnzJp/2gXY?=
 =?iso-8859-2?Q?SFprLEtGVEnd26CmQCc87bx3yqBKEnWq1HhWORBc7emqYSVPGnlA9TwSet?=
 =?iso-8859-2?Q?NBKpSc1P7XPdf1N/KafYcVOx1MBEIZDBmVh2I0jXmXojNqQuTP8ais1azm?=
 =?iso-8859-2?Q?i3KkgC19dYkMLU/s67LwdtnYiXjsyrYsGf7sGzdH2pvHBaIEoOc1tvUdTh?=
 =?iso-8859-2?Q?P71kd+8gpRjRsG4I4RJIGXRRiyxBuVKo0GmZpBVKsz+wqq2Jnx82K/nW7H?=
 =?iso-8859-2?Q?jeDoF5ZXt6os5A9bn7KYKzg5lhcF/+KHbx5FoXNpXvHnyR6M88T4xPHVpV?=
 =?iso-8859-2?Q?uCagkHvzjXMlplAH045gUN0YrIBk0qUuBvmg21Yu4Dq7oeXSvJL2cfGm4w?=
 =?iso-8859-2?Q?9IzT2FhFeqnVa3sRJQmNWBHq17G4YWxLyl8UGzVLPI2o/DAmw3vx5xUdSd?=
 =?iso-8859-2?Q?5nBxFHE0IG/71SF6sEJY2/D2mn5i/4zZZ5ZXjiCsu9Yezz/mJMHMVpyEAD?=
 =?iso-8859-2?Q?H3XJEnLJ2cmattkljPO8xUYxI3hg3MQjT7TmDAQIgNUJgCNIaoGTMb6FFV?=
 =?iso-8859-2?Q?JbeLs5kWv16UvhJ5l8qPlVD3ypMjq8N9lMtMGVg6gW//JJ3ygOipG7zshL?=
 =?iso-8859-2?Q?Dn71rQo+nwIItafzVNHn7Z631KaE8hL68JSGYWzaJkle/qHdcdLcKZ3UKy?=
 =?iso-8859-2?Q?CUMt8MwakwY966+RkNH15SQYib3kdtUN0pZAFicWVx0d8TbOl7EAFgbQ0H?=
 =?iso-8859-2?Q?Jel2IfOw2CVy8A/+Iroj8TYZ0AublVhW9F9KpHzb1HxhI+O18FEIsC+gwQ?=
 =?iso-8859-2?Q?z6T9EU/B+bzwI6idnACllYqxH19WwzN9CNlL4PxlM6g+j6uvt7H4LnO/+I?=
 =?iso-8859-2?Q?mzgjealuXs2SHJCWtlHXPijC8v0wUyQNyrB6hamM0ZtHJnXeqpx7Tuwn7v?=
 =?iso-8859-2?Q?TRE6XJ9aJOcaTXq0cvYTl29bXJQ5mLJU5ioKomiKxIm110DgvO4i9W1BK/?=
 =?iso-8859-2?Q?JlXjAAV91OLIWMA/ZbD0NB3bqdqULY0hj62f5K6ICZglkuuf0vwLvIzxAh?=
 =?iso-8859-2?Q?0sdWRQAAsNCwustWK2cCkOp/GaZSCf40DJnxJ5qNZ2SPlTahO2RZBHDFqy?=
 =?iso-8859-2?Q?CeSBHnAf3saUHRN+PATeU8ldGLQeLggtzIC3tG7nRIKl23peHvfOSozceC?=
 =?iso-8859-2?Q?r8dYFc6K98MLPDUwKohsGH2/4J3wFzDrSPUHgcRTc9JTw7r0cS5ufMRTH8?=
 =?iso-8859-2?Q?xW7s8ABJVheAgK6tEjSC7rQ5yqnlXnPyiwMEIQ0yR46DJ/uC1FTbklv74J?=
 =?iso-8859-2?Q?j1ei76no+5NBxOJC2SecbxC4p1OBqg98gCNzsVv0BRdnV84PoNQx2A2YJl?=
 =?iso-8859-2?Q?0BA6zmUtOP0tRAtC0JdlduLYvVzv3me62UPaKSZeixDuSovwepEfpHzMsl?=
 =?iso-8859-2?Q?2kSf55T4YjhXHGB+3/lx6cTAIol3860E9/6OsghO3LbAfeLrGWVU0s4KOo?=
 =?iso-8859-2?Q?Iev7K9jv7/no73YzloVb2n0siTOyndZm5lP0ZpYgwv8vtuB2O5oIpQPI1t?=
 =?iso-8859-2?Q?a2qEnzPh5w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: acf746f4-ee2a-455b-b9a8-08de42adc326
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 05:32:00.3716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmhT+g2tDVcVgHhJBs+M8O27Kb7oGJRv23zt/QWMfKNeGWK15CFhpwswLr0sdEq43qCijhrfD2U1lLe/wWboDql9URUU69bRMcqVPcJsc/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6854
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Vinod,

Thank you for your reply.

> > Introduce support for Aspeed PCIe PHY controller available in
> > AST2600/2700.
>=20
> What is with the uppercase "PHY" in patch title instead of lowercase 'phy=
' as is
> the convention
>=20

Got it. I will change the title to lowercase 'phy' in next version.

> > +++ b/drivers/phy/aspeed/Kconfig
> > @@ -0,0 +1,15 @@
> > +# SPDX-License-Identifier: GPL-2.0-only # # Phy drivers for Aspeed
> > +platforms # config PHY_ASPEED_PCIE
> > +	tristate "ASPEED PCIe PHY driver"
> > +	select GENERIC_PHY
> > +	depends on ARCH_ASPEED
> > +	default y
>=20
> NO! why should this driver be default!
>=20

Agreed - this should not be default.
I'll remove `default y` in the next revision.

> > +	help
> > +	  This option enables support for the ASPEED PCIe PHY driver.
> > +	  The driver provides the necessary interface to control and
> > +	  configure the PCIe PHY hardware found on ASPEED SoCs.
> > +	  It is required for proper operation of PCIe devices on
> > +	  platforms using ASPEED chips.
> > \ No newline at end of file
>=20
> ??
>=20

I'll add the missing newline at end of file in the next revision.

> > diff --git a/drivers/phy/aspeed/Makefile b/drivers/phy/aspeed/Makefile
> > new file mode 100644 index 000000000000..7203152f44bf
> > --- /dev/null
> > +++ b/drivers/phy/aspeed/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_PHY_ASPEED_PCIE)		+=3D phy-aspeed-pcie.o
> > \ No newline at end of file
>=20
> Are we expecting more drivers for aspeed, if not move it to drivers/phy/ =
once
> we have couple of them we can add a directory
>=20

Yes, we are expecting more PHY drivers for ASPEED.

This is the first ASPEED PHY driver, and additional ASPEED-specific
PHY drivers will be submitted later, so having a dedicated
drivers/phy/aspeed/ directory is intentional.

> > diff --git a/drivers/phy/aspeed/phy-aspeed-pcie.c
> > b/drivers/phy/aspeed/phy-aspeed-pcie.c
> > new file mode 100644
> > index 000000000000..3de43a86ac17
> > --- /dev/null
> > +++ b/drivers/phy/aspeed/phy-aspeed-pcie.c
> > @@ -0,0 +1,209 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2025 Aspeed Technology Inc.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
>=20
> why do you need this
>=20
> > +#include <linux/phy/pcie.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h> #include <linux/reset.h>
> > +#include <linux/slab.h>
>=20
>=20
> Do you need all headers here?
>=20

Thanks for pointing this out.

I'll confirm which headers are actually required and clean up
the unused includes in the next revision.

Thanks,
Jacky


