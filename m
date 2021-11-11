Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FBA44CF51
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 02:56:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqPvN4phyz2yfc
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 12:56:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=GGnLpu6w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febd::70f;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=GGnLpu6w; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqPtl5jJPz2y0G;
 Thu, 11 Nov 2021 12:55:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuA0LwGQ7cBPrFsTxtbTyub+qtBc05rUekTTnZWGu8QhieWuJqUdceB45jYE/iDTmAt34TWSExJZnLCLat/aU16DxFOLI5b6gBIMZYhoOanB8BHjMVnCeNsFCtAiZoMGYnzSzjbkrSNmzgGXLAXEhhe1QAygF9IKRYrOPe3+HZsPAriAec9r8x7/Ls1DUPF1AO/nNtQx4DvHEuRjVowdJbBoEKgnHMcsCCFbo/6irFXshuYfwk3o8TZ6tpiBEPc8UPSs6Ik0ip4TU0RcZH2QZ7Ug6g5P9BtSFSLQaLRaunf8I216zVGiN552Z8MP3bjNT/w/LWrpoagf/6KK8EIJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8qB2A6lRdxGWcHNATYycPKcXUjCOz+a7SnWDbdCIVk=;
 b=PTw7oT6vwHog1UIx7Qsr88EtMPevHXSCpXVv9+Md/0iQ98Svq3N6iLTJE5sTK7GtqIsaO+YXK9h6040IFRm40j0rHyH9kOQeEowCWtiMHH02n38hBzPZJCrUd1M4hpC/SsgnvTTaNjQdDAgtVvBArptAyHz4IXD77Trvnh+sv5nZvZ++m51QosUy+OJAG7Ld/z+Jw0WRrFX6Li1XXamPSP+/OgojetRlXgC4rLx729BouWmRuEtp+2z+U+PvklYgjdYnaWR2IwYg9AqtqU0Ptsp2lZqGQ8qYnYh6jYY87AxC8cWy1lxcpDhXiLqJWFSJzcubPCeskHnGuevbN/2vbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8qB2A6lRdxGWcHNATYycPKcXUjCOz+a7SnWDbdCIVk=;
 b=GGnLpu6wDFOGRPFY/2LpbP7S/0QvgxKxpEdanul1PSklTDy5DYD/X8StFvt/JjbUftxviZfMIUmPK/eU1ZkJqhnXy1+O4daOKFj31iVMxw5tEWiCCmY31jcbUQNN+qRGcbvBIgnWbB7VK6yRbFw21wqev9ynZmPBwLiJOZy2AJN9UdEHaanFx31l1JWR7ekpWdtPQhG1SUd2wf+2edaCt7ua25w3onQhPZ50u+Bef+gaSst31ArNApIsfbh4VMppncO4cMzEwDzbCocQMOWVsnxT1dANDBwsH93Udl/cLoP4xHDwR3Hx5OM3neiJ57lYucn8+Cg4oG5MPh0z72uStA==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1827.apcprd06.prod.outlook.com (2603:1096:202:6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Thu, 11 Nov
 2021 01:55:01 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71%6]) with mapi id 15.20.4690.015; Thu, 11 Nov 2021
 01:55:01 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 4/4] ARM: dts: aspeed: Add eSPI node
Thread-Topic: [PATCH v4 4/4] ARM: dts: aspeed: Add eSPI node
Thread-Index: AQHXnuIAA5h6M5p/p0S7eMEIdjKhnKv9DGuAgADzn8A=
Date: Thu, 11 Nov 2021 01:55:00 +0000
Message-ID: <HK0PR06MB3779D83D1BA4D3E6FB24CEFA91949@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-5-chiawei_wang@aspeedtech.com>
 <1a063a1797fd9247dae3660cd04d1f19b0fc32b8.camel@yadro.com>
In-Reply-To: <1a063a1797fd9247dae3660cd04d1f19b0fc32b8.camel@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ede04bb0-20ea-44fe-9e9f-08d9a4b645c6
x-ms-traffictypediagnostic: HK2PR0601MB1827:
x-microsoft-antispam-prvs: <HK2PR0601MB1827AD5CF9D5CFF69CBC362091949@HK2PR0601MB1827.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MCpXZYQTxR9n3ro1Q9WVB5hKVDkVQ7ef7+1hH21oIj0qO2TPWj4Iy8Gm56v/AZEL8Cr9kluvea6kTO+zCzBY2oWrS4gd3ettcHCiJ3X07E4q60C71aKj2X+ut1vX9tqtOkb1SwSk09cqlawrg2v+0Fw/4KYr3PhWhjARxyxKuLw+y+dNELz7Xc6OuSY8IjQDXc1r8IXjQGYf3PsGg6ckzim/c/4djoMKEBbfZSip7rwCEHHMSDS5oTOFEQoTO7sd7vMnT6ivV8EIXK3B/MDN0bOrVf+qeNH4vXrWZWzBf1wYbu/jZ1kzyyCCuYmEExuI5E/eS92kdtg4hA9tlwCLRZzGYhM/tDW+ug50mo5XxhSB4Dyap6kYb/lECZhUea/SiNr0jZuRqcRQh61NL9ghEH9MnhcxA6QkIKxvaOKrjJ3FEm7NzMsTQ7jSN4Cd1posr504H4sfYjITAjkzmSPPH4g5WOKy+3ORZbDdrdXuOdNSXILHYjU68BRQu8kjUV3Rb4bTJ0Gfx3hzYwHmLLpKdzNby4zo3uC8z1jTdBOfXihSXEOzhmstgoLEgngEhcQkQmg9mXgruM30Ala7/HPmV9exczJeevQxzLsSysYcZCRFc6mfz5dpW5Y2GnLfHGdX4Aa8EnZ/WQMIztZ6PGT2epCN5u0T4QFTE+joASz+eZqcp6IdtRWc1+t6iZBoSbUSgneGvZQNmmDS3m7DihrRNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39840400004)(366004)(396003)(376002)(26005)(122000001)(76116006)(9686003)(66556008)(38070700005)(5660300002)(33656002)(110136005)(38100700002)(7696005)(66476007)(316002)(66946007)(83380400001)(55016002)(508600001)(66446008)(8936002)(2906002)(186003)(86362001)(6506007)(8676002)(71200400001)(107886003)(4326008)(64756008)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEhLWlBNV2lVTCtlWmY0R01vR241OVdFMEFCSUNGWEY4ZXdQdUR5bS9zZ2tx?=
 =?utf-8?B?ZUNVb1c4ZjY2UWpuRjhISFlQTUxQMFJYMy9ST2ZLdTc3elE5cXlGc2cxekFn?=
 =?utf-8?B?My9sMVhrVVFHVGtkYThUNUU3MEs5eDA2ZzhhMjNCN21HMTE3Q0NUQ2ZOMXpH?=
 =?utf-8?B?RGZWMXRmZnRBSzRkL3c3VmNUUE9qNmFUMmtXZWdyRGd5VWRpaHUvYzFzL25B?=
 =?utf-8?B?dmVTTXh4R1crM3NsQnNaMmpsNEhWMVFBRWU1ZEp3Sjc3NlpyK0JDMThjRkpT?=
 =?utf-8?B?TDBlYUliZ05RRzIvRHMwczhlMnQ4Y2tDWFhHcmxycW1ES0JqMlVwVEdZcFU1?=
 =?utf-8?B?Tk9kd05mV0dlK1JaMXR6K3ZhWkRxbkZkVXZiQ0hpOXV2emxMUy9SMy9uYlVR?=
 =?utf-8?B?OFo5aG8ydUV6YlV2Z1BHSG5ZdEhSR3lISm9OZ29JcUEyTzVGdVhRZHVQM205?=
 =?utf-8?B?Y0wzNG41UTB0RlhPNng4UitnTHBGc3VUcUdCZlB4bWcwV2VlcVkrTXl4andG?=
 =?utf-8?B?OTlTYUlPN0NFK0Zna2hCRjBFQ2tEajFiSmhDeDl3NkRiRDRIWnhody9Yc2xa?=
 =?utf-8?B?ZjJmWUJocHR0ZUowVWJNeVNkOWM3QUhmdXk3RjVmY2lGTyt1c0cwWmhjU21E?=
 =?utf-8?B?T3JpTWhRVENFV3h5M0JEblhBL3NWR2lodzhGVzRXcTVtNlBvM2J1WWloYTB5?=
 =?utf-8?B?dkZCWkl2NFZ1TEFndm10NTdpV0hDRmtLWmxjVmhua2VTNG5hWi83R1I2RW1R?=
 =?utf-8?B?aE1ZS0Q4ajVlZUxZeDhWV0N3Q3grcEw4WUROOE5rMUNOYzVMdExnRHEya1hI?=
 =?utf-8?B?WGFBQ1FEUEdhaEpYeUg2cTdtbTl2b3lzM2lCTEVaTTQ2ZGZUSEhXVVgrNCtY?=
 =?utf-8?B?L2xFKzcyV1ZjOXFMNkZuYXFLM2pDUk9mdzZzYUVSaDlmcnJ4SXpRRHBRa1Er?=
 =?utf-8?B?ZnhscXQ3ZDF6RjlNUVVjQkRJWHhWRVZBNndBMUNIVUVES3lYZ3VvSEN5TE03?=
 =?utf-8?B?VXY3Nm8ySjBIbHJnZWdqS1dlUTFsM0RPRVdwYVdwSnV5L3ovWXEvT2JDZE5z?=
 =?utf-8?B?MnIyamhjd2xwZjhyejlPY213RXlWYU50d3R1RWVDLzJDdDMxeUowSWFwanJj?=
 =?utf-8?B?ZXV0a2pBdVZ1eHpCOXZUZDQrWldzYUtZRXdIUzJBa0UyV2FtLzZERWgyY2lD?=
 =?utf-8?B?STFUSmNnRkhCWXZkdVFpMTV5aXJNdWlZR3IyS0poNXVYWlZMTzNLSkg1Qkov?=
 =?utf-8?B?aldXSnQvR0NSejluRUJTT1pqM0krYy92NWY0VnlNV2huQXB2K3ZkdERrZzVO?=
 =?utf-8?B?dlVROFByeTAxbVVHQzJINlVvTTkyaVNvVE12ZElUYWQ2K3JHZ0VaRzNZRGVn?=
 =?utf-8?B?akZnY0oxUXFIK2NKS1J1aUMyVXlVN3N6Y2gweWhybVZDUDBLdGlROGRvSGNT?=
 =?utf-8?B?RVpVR0RlMno4d1hhSThqMkJzeGZ3ODRXZEFZanJZc2puY0VONDN5OVNLcXNt?=
 =?utf-8?B?bS9TdGlaaU84empWanNBc3FDNUhhY0o2YTBsOWdJbWRjaXFpVzRQK3pmdE5N?=
 =?utf-8?B?K0EwcklCcHFXbERDN1FxcXA1Z1I4dnNoaDdoWXZLWXpFbDM3blU3WlNBZE1R?=
 =?utf-8?B?V0pFb0ZlcXF3dW5SOEpjOFJhQ3JFZjlrMDBOL1FSL0VSV3ZzL2h6Z0pIcDhS?=
 =?utf-8?B?czUwWkZ0NUxpNWpyK21sekFHb3lVS1hMeFBHT01ySHRvR1VYL3dHL1VnMDVP?=
 =?utf-8?B?ZWdmc0w0U0t3UEZ6WGc0L09USXd2NFRDd2pQclc1YklncUl0UVVvWFVsa0hx?=
 =?utf-8?B?cjRhY0oyV3RvcnlXbjZENGdoSnhacFh6M0M0TllkWlJaRk80dXh5dE1sd0xl?=
 =?utf-8?B?VlIzWUlORk9LSnhJVDZDU3Rtc0pTRm9JWTdjTVBEMzJCNEE5NlRSQzdnYnJC?=
 =?utf-8?B?YWl5NXlpb2o4M21NQTlzYWorOXBWY1c4VS9henBYUDJhb2FvZXNwRk5adlE0?=
 =?utf-8?B?N2ZYbVZGZGU0V1B2N1JMSThvTk1pY0J4cjUwVTEvSkJiOERKMi9JUVF2bDFK?=
 =?utf-8?B?bmJoaEFrUWJEK2lCMDE0TjZWTVZxb01XSE1MR0tvY0RpRTgwZXpXOEZTME81?=
 =?utf-8?B?QjMyT3ExOUg0MU5RNWpRZE13VXN0cFV4bFJSME1MMjZrcm9EbVZybGtlMGlP?=
 =?utf-8?B?Q0I4ZEthTko5QzVoM3E1UVBUYko0M1FFZDNJSlFpenFHQ0UzeEhjZ2lLVjQ0?=
 =?utf-8?B?aXVaa00yWm4wQVhtMFVhd3lpOThnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede04bb0-20ea-44fe-9e9f-08d9a4b645c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 01:55:00.9394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSWYZZrtgQgI2JX8hrPodK6HJh9wy3CsvjbXGVNg+2i/xhMw0q650W/VdtW2HTqHzX3rr+QUFr0vLh7avJA0fx02a3cdg9hT3wdm7LiFJk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1827
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmVpLA0KDQpUaGUgcGF0Y2ggbWlzc2VzIHRoZSBnNSBwYXJ0Lg0KSSB3aWxsIGZpeCB0
aGlzIGluIHRoZSBuZXh0IHJldmlzaW9uLg0KDQpSZWdhcmRzLA0KQ2hpYXdlaQ0KDQo+IEZyb206
IEFuZHJlaSBLYXJ0YXNoZXYgPGEua2FydGFzaGV2QHlhZHJvLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBOb3ZlbWJlciAxMCwgMjAyMSA3OjIxIFBNDQo+IA0KPiBIaSBDaGlhLVdlaSwNCj4gDQo+
IEhvdyBpcyBpdCBhYm91dCBnNT8gV2h5IGRpZCB5b3UgYWRkIGRlZmluaXRpb24gb25seSBmb3Ig
ZzYgaGVyZT8NCj4gDQo+IA0KPiBPbiBXZWQsIDIwMjEtMDktMDEgYXQgMTE6MzAgKzA4MDAsIENo
aWEtV2VpIFdhbmcgd3JvdGU6DQo+ID4gQWRkIGVTUEkgdG8gdGhlIGRldmljZSB0cmVlIGZvciBB
c3BlZWQgNS82dGggZ2VuZXJhdGlvbiBTb0NzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hp
YS1XZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+IMKg
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kgfCAxNyArKysrKysrKysrKysrKysrKw0K
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0KPiA+IGIvYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWc2LmR0c2kNCj4gPiBpbmRleCBmOTY2MDdiN2I0ZTIuLjQ3ZGMwYjM5OTNk
MSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0KPiA+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpDQo+ID4gQEAgLTM2NCw2ICsz
NjQsMjMgQEANCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Ow0KPiA+DQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlc3BpOiBlc3BpQDFlNmVl
MDAwIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0NCj4gImFzcGVlZCxhc3QyNjAwLWVzcGkiLA0K
PiA+ICJzaW1wbGUtbWZkIiwgInN5c2NvbiI7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4MWU2ZWUwMDAN
Cj4gMHgxMDAwPjsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgI3NpemUtY2VsbHMgPSA8MT47DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmFuZ2VzID0gPDB4MCAweDFlNmVl
MDAwDQo+IDB4MTAwMD47DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVzcGlfY3RybDogZXNwaS1jdHJsQDAg
ew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0NCj4gImFzcGVlZCxhc3Qy
NjAwLQ0KPiA+IGVzcGktY3RybCI7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDww
eDANCj4gMHg4MDA+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHRzID0NCj4g
PEdJQ19TUEkgNDINCj4gPiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgY2xvY2tzID0NCj4gPCZzeXNjb24NCj4gPiBBU1BFRURfQ0xLX0dBVEVfRVNQSUNM
Sz47DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9DQo+ICJkaXNhYmxlZCI7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgfTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoH07DQo+ID4gKw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGdwaW8wOiBncGlvQDFlNzgwMDAwIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2dwaW8tY2Vs
bHMgPSA8Mj47DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdwaW8tY29udHJvbGxlcjsNCj4gDQo+IC0tDQo+IEJlc3Qg
cmVnYXJkcywNCj4gQW5kcmVpIEthcnRhc2hldg0KPiANCg0K
