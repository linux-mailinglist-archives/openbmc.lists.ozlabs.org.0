Return-Path: <openbmc+bounces-556-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B9B3F253
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 04:31:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG8r031n0z2yrg;
	Tue,  2 Sep 2025 12:31:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756780272;
	cv=pass; b=jlwUDFyGxk9jmrPSuCZs/BvQl3ESUROO6qSSrA1QBBnnPDcw+8MKFKu8HeVjtucwa76a8oKuArq3OeE8SXmhO4c9EnH0PKc1d901qbKm6v2QKqG6OnotbUoQZid7bZL2RxzfSEHofULM003XMH86mNv56e+NlRV/4VnkRdz2Dus+oaxgzE4og5Ktczl1n+iPnvvsymhJ4mebUF72gQU34aaQ1aupy5BRyGbW5h1wKfJ1UPd0MwwyDKjfvl9YQ3/3KYoYlGIW0yodTc/V/cmPRvfcmER0NlJ7rPP80YqWPcNXX5ype60an1Xfg/xxuboEs6fN6VnB/D5W0LmEf34OmA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756780272; c=relaxed/relaxed;
	bh=HSec+w0wx85QrY6Ca70DjNtUWlbZp6misz7l+JFYhK4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UqkJSYWAjUTxZvhNPIzS4tUaGVE3c0f6Sr2U+3Lh1paE08p8WcJPOoiH71PgTybX93Rk5Cb34EfYUKTCqIR4x4Boi8EpBJWbg6py67LeTx3Zpyg2KnGfu7h3f1yvIbavQEqQ5b5GWpS2HiNH0qRd00GYRBHMTem9b6lz783nIHE4wmBohTga3Rdd9jS+ag+5DfWJOwoYhI63od43g3b90+DoT8aRKMXbSypYwDoenQSmDCLNOGwAzaVkv/kVhG1NCdfKZKPgfigczVnHELmVuaX1XxKtwaVzs7v9m+1sj2VTlnbJPFt0/pdgeDbNnmyl33hNGL0agsN2fDp+5ZRUvw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=W6U56hRW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=W6U56hRW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cG8qx4D4Gz2ySY;
	Tue,  2 Sep 2025 12:31:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1P3a/TXop7wpXU6z1NkO2xg5otffl+7azND9D9rGKSCAS7vWw2OXfvfXK8Cb42ZbNh9CF3O/JUG0X8uLGaFHGxU2pot5QY5fuRt0jLna8uM/kMD3Ydf4muwbop4pmK5lA8ai07eHF3U3whFC7bL/+Hxm92KSDfoWpkMfp6zt8pkC39nUVYOb4Z5Bh+NcaEIzT44IXIZlGRYPOc/OpVHOTdlcVin8ICzMNfqNyl5JsgGnKLDSds+IxAuPSAIzFGZmyJ3KO6bj6Se4pDo7ANXBjuahY5NUh6F+lJz7qvNwEr3gs0au9VNepbvswYYL4XdSqhw9pzz133xjjRxaYHu3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSec+w0wx85QrY6Ca70DjNtUWlbZp6misz7l+JFYhK4=;
 b=IkHSVVn8QkeTARC69T1w5d4HLzOmHhrighgw89mOCdS/hTiwEK8Cbs82blf4KQvm4AO0acYX6mJ9bNviXV7TV+o30AXYW8pnjk6RoIGxhPqUD3F8oNLAt8v1nTtKtp4mT7p577RakGSGaUxfuy8KkBmfAFhGS8nNmcJv/F0/5OsD494f58Ykxiwoi+x8cZuGwOasZdOn5bczSaquBQ2yjNPe4bHDHA1R707KohpbYzJZPe8nEJNDm2hac17EtenHOcSoduAD+L1KnGNI5IX6/K+yakrL0hCF0wsRfVb4YUxU7JBax3VeUbX1YTd2B3nRcP/BNzcoeFlgtA+LED6BSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSec+w0wx85QrY6Ca70DjNtUWlbZp6misz7l+JFYhK4=;
 b=W6U56hRWl3lPOYYY5IdYb44j/6JwCaVp+3EdtBXtos3P7n6PHHnZY2h1sC5HUSRUdYVswPuVVYX4RorIbSMhfDXYxtEz9IooAeX3Zd93vR4SP8j3Dhh9v+2473DOu5bUs0Ne+Nm1uQ+GopQP1iL9ufXQk42X8R/+ArKOERs1fBBA2vzydDuupx4TWvFaP1tbZ5iwIDskycSAqwHsPSvxQr2IJmK55mMCJaOK1MW2bOGMfTqFKAIPK2k/aVC5qe5bFw9zw1VCrJPJ8vDmK6ZK+VmsqMQPoVwg9lISzoC2iXvXg/5Z7muhyYw4rzVsZ0igdNYzamz83S6iDi6aLerwZw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB6249.apcprd06.prod.outlook.com (2603:1096:101:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 02:30:45 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 02:30:45 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH v3 01/10] dt-bindings: soc: aspeed: Add ASPEED PCIe Config
Thread-Topic: [PATCH v3 01/10] dt-bindings: soc: aspeed: Add ASPEED PCIe
 Config
Thread-Index: AQHcGwWVKxr3MrEyR02ZUGF4e42IrLR+NbAAgAD3bpA=
Date: Tue, 2 Sep 2025 02:30:44 +0000
Message-ID:
 <SEYPR06MB513451A9C7BC84560ADA359F9D06A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-2-jacky_chou@aspeedtech.com>
 <451f147b-a193-44e3-b7ca-90136de31a17@kernel.org>
In-Reply-To: <451f147b-a193-44e3-b7ca-90136de31a17@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB6249:EE_
x-ms-office365-filtering-correlation-id: 1a4075d9-fbb5-421e-7d3c-08dde9c8b832
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L004bEUwcFhTK3Y0d2pvWTNJdjZwdVVIWHZxNG9lSVN3WkR2b1FjUXhWbVpB?=
 =?utf-8?B?VGY0N2VLOTUvQkJpK1lhWUFtaGM5SVhhc1lheUtENkF1UW5UbmlSTzJrMVdK?=
 =?utf-8?B?RHJTMlVEVzNmSmY5OGdpd1ZxZTRWRVNmamVVOFhjZGVNN2RZbnFvVjlaNTA5?=
 =?utf-8?B?UTExTlJHZldFa2R3d0xic0h4eHkzOGZRVFhmTGlQeWNmN1VTWlNpbllPMzVz?=
 =?utf-8?B?VW9ZWm96TXNEZ01zMERoZkdhSlVOTzM2Y29aNERMbDV1dWh3dVA2NW42QWdN?=
 =?utf-8?B?NERESE9PMVl5SzdCSzBWSmxUcTBHVEFZMFdlVE52RjV1WjZWd1FRTStBSy9S?=
 =?utf-8?B?Y0RLRGlvK29GKzhBUDRNbVZzWVpJN29valpyY2hHZmJ5MW42RFZUUVVld2d6?=
 =?utf-8?B?anZlbnZZWE05eVd2TGpOS0RpL2hLR01YNEJMTWFHMDd5TkNYTWF1dmxYWmpt?=
 =?utf-8?B?OGpZTHZxM2hyd1NlSXhXb1htZ3RBd0lmQzZqa0ErcERhOExSb3FvY0NlSVk2?=
 =?utf-8?B?K3l5dFNhRzlpSktlTDl5U0JjQXRXUmdqTys5ditZZEc0cHczZGlrVk5GcEdM?=
 =?utf-8?B?WjFhdEJNb3JsTm5jMlloNUt4clBxK2N1R2txN0xaNjM0WjNLQUt5M25HTG43?=
 =?utf-8?B?T2pxNExTMDZ6a1FPOXkyenYyL2RFYWhaOHdrSlpPTkJ0MzgyMENHOUlWZHJ0?=
 =?utf-8?B?eWRLSmwyVWdBb3BVOUFHeW1PVEJxaUpDWlVKMmtvSFgzbUdneUdCbDNIbGlv?=
 =?utf-8?B?NXl3OHc5VWFFL2o5MWFjR0pSL3lqenoyOUVBUStXYUo1Q3JxbTVneGlEUzRo?=
 =?utf-8?B?YTQvN2x1RGdPdEF5cnZaL29JTUFIRFBCWU9MQmJ0aUlmNzlOYlVhKzlkQXJO?=
 =?utf-8?B?V1pqRjlMZ2VPTHYyZnR5VzFRZzhxYldGV29ucGhGRDdjWVhBUTVWZjJZaThH?=
 =?utf-8?B?OVVsWEI2M3hFSnFHVXluQnJEOGZHOTBMQm1GMERVaFJDaXZhRFVacnZNT2VT?=
 =?utf-8?B?S3luME40VzNZNms0RDF2RWZmYit4T3BvYjVjTjVnaXNVM21Nc0xhOXFrbUo3?=
 =?utf-8?B?Z3VzZ3FZTDhUZjVDNkl2SmkrUWVNakF6R2hWZ0xrenF4UFVqU3Z5ZWZpWW5W?=
 =?utf-8?B?UFI4WWdXTGRrRWRsSFlJdUQyTEwvVUhqUkplbHhmUUlMTFZ4b1B5emhiSm5i?=
 =?utf-8?B?M0doa3orUHFXQVc2VHUxblJzVG9jeitkdE1PSS9WU04yVklpWENnL2FUL092?=
 =?utf-8?B?Um43eXVhdjhNdU9YNExucnJ6eTc1b1ZxMmZYanZDSHovYXFKNlhBZGZ6cVVT?=
 =?utf-8?B?UVNRdG9Sc0JVVlFPcGMrWDlJcXF0VmxGOG1ob3plcXpNQVNJUkJlR0VnQkFs?=
 =?utf-8?B?bWEyZmVrY2MzZlA4ZytBeDhZQW9FSldMdmpMWVY5YW5EM3FtUENJYTBLOXJE?=
 =?utf-8?B?N0lHVktnK2pmL21aMXJTNTI1cmlOSmZCYzBuckgvcFd0L1RnSzdsU1F1ZWEx?=
 =?utf-8?B?N2VtRGQ3cUh4L3JuemRrYmdXZm9LWWJJdFhIbTJ5Y3FWdXRqdGp2SjFaL2h6?=
 =?utf-8?B?M3FZWDQ2cE5ReG1sckNNUUUyZzV5b1NZZEFhKzZBTkFHUlV1YTRlU0hqdGVq?=
 =?utf-8?B?RTc0UXcrWVhMK2VjQnFwUlRrWUpIckF3bmdXTzMvWitlbFpVTnBVR0xPOVBJ?=
 =?utf-8?B?Y0kvSWlxWHJPRkx3Wk0xT3VXOHZkejZ1ZUV1MDU0eGNWMFU4SjZZYjFwbUpr?=
 =?utf-8?B?a3Vuak5GWWpnQUFvckFuTVpiKytJaGVBaE4xN2g5SkdqbXh6M1JWZkdNMjJW?=
 =?utf-8?B?eFc0SWlJWlllTFYvdndheG5JNVZlTmJzZy8wK1ZKWU5iSGlabDF0VHNBeDJv?=
 =?utf-8?B?NE82UjRYbFJZbStWSTdMcXNxZW53OXJpTzVaZjNhaFMrQzFhcEZybGYvZ2ND?=
 =?utf-8?B?ZDlrbHlhUTJ0eUQ2K0xudlJFSVBmUjR2SThMdmZkR1lxRVpRMWkrUnpDNzRI?=
 =?utf-8?Q?wD4efU0P362wcxFuUtIupbRca7bI0c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0hYUUlmd3UzazYrWktuMGdsTTYzdGdMdGpLMlNsV1pTdWIya2hVOGZSakhK?=
 =?utf-8?B?RXZ6K0tLdDNFVDY4OWpCOXVkcUpEQUgvTU1NTjZNT1FWN1NvUWN1Qyt6VDVv?=
 =?utf-8?B?STBxTUMrV1ZWMk1TRTU1MHhRVFd0cGY3Z3BYRlBaUEFOMzlkOUYvemZCd1Fo?=
 =?utf-8?B?Y0Ivc3B3bDNkYXRkcWlXbllPK3UySHdPMTJnR0NRdzJKc3l3VStIQ1VyZEdt?=
 =?utf-8?B?SUprelBQbHlndkZKc1U4U1doUXljYUtEWWlMMDdpTld0SHFNYU5vTHFhR1o4?=
 =?utf-8?B?ZTgzc0dCank1MkxGbjJsTCtBRTc3S2JJYWk4elF1dWtDWkxsUFg3RXBpQkRx?=
 =?utf-8?B?TEIwelNDaUx1azJyY29LMVYybG1uMHF1R3hVeGRUWkYyaG1KRWpXdFFHTmVD?=
 =?utf-8?B?WlZQQytjS2FCL1Y2MDd5bVI3N1JXN3hJT2ZNSFFBMnpybWY0NlFiUUlMUnBR?=
 =?utf-8?B?Y1crbjRnck9EN1NzVWhZZVloSFdxcit4UzMxdFFlSjZOM0dqNUY2VDhFVlF2?=
 =?utf-8?B?M1BEY0FSZHBvNGRMWE5xeHR0V1VDcWQ0VkVoNUtwRTNoUHlXbFVIRGpEMmMw?=
 =?utf-8?B?eVV6Sk1URHIxVlVSZHovL2hWK3ZxSG1mbGlVQU41NVBOSUlYdEdnQ2N0TDcw?=
 =?utf-8?B?c0NGVnU1L2N2UFJsNzJMeTRIVFFJRS9GVjdPSDIrM1p4Z1ZPS3llK2d5WG5U?=
 =?utf-8?B?eDhhRHM4SnN6QjRNWU1DRkUwdGIyQ2ZtSmNic2x5Q3plRHNnK3U1YUdJUzEx?=
 =?utf-8?B?NFhpMFArdmtQZjlma0dJdmN1WTdTSVdicTVjNkdFUXRMWmNkR2dEdmNWa2tT?=
 =?utf-8?B?L3RCVnRWeThNVndReGdGR0RheENDdTYvZEFTcC9QUmsyMWtvLzE4Z2dxQ2dt?=
 =?utf-8?B?ai9WV2JNeGt5YkdneFI0b09KWCtCTFpGMHRsSEFVbjJCaml0OXR3Y2JUYWdD?=
 =?utf-8?B?VlpGVC9tN0czWE1vaTVrS25OOUdFeGRXandsL0VZU1BsNnE1Qjh5QzZBNzVW?=
 =?utf-8?B?Q09jclB5RE1wQThFa1crQ1hvbHBTTGNGQnk0MDlqSVFJdVR4NTFsNjBlaTJU?=
 =?utf-8?B?czRBUEtZRmtIdlhPRloyNzNVdFV4Rm14T3Z6QWd6WStVVG8zMytsWURLY1M2?=
 =?utf-8?B?dXhlYXJoUGQvUDJEandNU0ltMXNXbDZQSUYydjNXMkNJMFM3Q3N5THJ4N0l6?=
 =?utf-8?B?b1VpNzJCZURqZStxUlBROEhjTk5jQ1dhUXM5NXMxc0xpTUVrUlVHajFPYnRL?=
 =?utf-8?B?YjlQdTVnQ2VTYUR1RjNzS25ucDdZdjkxTDFhaGN2b0NubCtyTU1jTW13SFdr?=
 =?utf-8?B?Qys0b0xIRC92L0FmWHZTOXpmdERrZzEwbFlyRHp0SW1ZSzh0ZVBKWXpFVFFW?=
 =?utf-8?B?ZFk4NTZmMzhybjFpS0kvR1FEQm5SenczUTN4czV0L3g0S1JZdk5OV1grRnQy?=
 =?utf-8?B?MzFkRHdHZitJQXM2NzAyeSt0b2hDckFWMVFnZUNHbzFEbmlKWHFORXU3R1pp?=
 =?utf-8?B?a3RXVUlBOWNpSnhKNUVINXZpd1VIeW1OQWYzTWdQK0RmaDNWcnp6NDZYay8w?=
 =?utf-8?B?eVFzOWdaMHJCYksycXNzeno2emVXS0Q0ZzYwVTROTFM4SlZ1YlVLSUlNUW81?=
 =?utf-8?B?bmwzNm5zOEltWk5Ibk9zdGxoZ3VveExLeWxpejFaNHZrYmhxM2pQeHVlUUVK?=
 =?utf-8?B?RGJZbVJUaVVScXc4SnNSaHQvZkttaXRyTFNLTElKZ203UStFMDVqSkdVa09l?=
 =?utf-8?B?bXRtZjU4dVhOTXFZakRmQ3ZqZ0VnV0lUSDVrckVaSWVZTXAzT3JtU25iRFpy?=
 =?utf-8?B?eXBhSTJRZDA1M3RHdVRCd1pUaHNlck5tUkxuS1RMVHo0REhyMWR5NElPTHd2?=
 =?utf-8?B?Q3piU080dDJZUi90THIxaG5UaW1MTlRCM0dHSW5pcHUyTTJFRzlWdGZKRDlP?=
 =?utf-8?B?QjZaaEthMDVZa0hRNkNBQk85K0RZOGRlM1VqNnBSL3FkU0lwRXlKdDJxVmpi?=
 =?utf-8?B?aGR5R0V6ZTlINTV3NmZWT1Niamx0LzJ2ODdWVkd6R0hzdkIyMVd0MzdQRmI0?=
 =?utf-8?B?bDFkZFVMdXRjN3VGWHNWVWk4bXpwbTlQS0dOaTNNaEJBZ0hxL0p4dHRoaXJW?=
 =?utf-8?Q?/hfmvCh2luHFGfq+iQW0sn8kG?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4075d9-fbb5-421e-7d3c-08dde9c8b832
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 02:30:44.9120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mltMkxYwAdOu8ra9c2Jd6yvE5tW+8eLKjjntOiSxUH06o+PFZr4n8tqU1CDifgDBT8s/k84uIH3Z3rICMUhSiKRUoE7zcz7rvmJdjgEA5UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6249
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiArcHJvcGVy
dGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0g
ZW51bToNCj4gPiArICAgICAgICAgIC0gYXNwZWVkLGFzdDI3MDAtcGNpZS1jZmcNCj4gDQo+IFdo
eSB0aGlzIGNhbm5vdCBiZSBwYXJ0IG9mIHN0YW5kYXJkIHN5c2NvbiBiaW5kaW5nIGZpbGU/DQo+
IA0KPiA+ICsgICAgICAtIGNvbnN0OiBzeXNjb24NCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsg
ICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJs
ZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UN
Cj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgc29jMCB7DQo+IA0K
PiBzb2Mgew0KPiANCj4gYWx0aG91Z2ggd2h5IGRvIHlvdSBuZWVkIGl0IGluIHRoZSBmaXJzdCBw
bGFjZS4uLg0KPiANCj4gPiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAg
ICNzaXplLWNlbGxzID0gPDE+Ow0KPiA+ICsNCj4gPiArICAgICAgc3lzY29uQDEyYzAyYTAwIHsN
Cj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNzAwLXBjaWUtY2ZnIiwgInN5
c2NvbiI7DQo+ID4gKyAgICAgICAgcmVnID0gPDAgMHgxMmMwMmEwMCAweDgwPjsNCj4gPiArICAg
ICAgfTsNCj4gPiArICAgIH07DQo+IA0KPiANCg0KWW914oCZcmUgcmlnaHQg4oCUIHRoaXMgYmxv
Y2sgZG9lc27igJl0IGhhdmUgYW55IFNvQy1zcGVjaWZpYyBwcm9wZXJ0aWVzIGFuZA0KaXMgb25s
eSB1c2VkIGFzIGEgcmVnbWFwIHByb3ZpZGVyLCBzbyBhIGRlZGljYXRlZCBiaW5kaW5nIGlzIG5v
dCBuZWVkZWQuDQpJ4oCZbGwgZHJvcCB0aGUgWUFNTCBhbmQgcmVseSBvbiB0aGUgZ2VuZXJpYyDi
gJxzeXNjb27igJ0gYmluZGluZy4NCg0KVGhhbmtzLA0KSmFja3kNCg==

