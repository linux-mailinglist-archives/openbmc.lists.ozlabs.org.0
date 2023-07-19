Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B11758DD8
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 08:34:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=cddBzSLc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5QyS50f2z30YL
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 16:34:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=cddBzSLc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Qxt0gXgz2xqB;
	Wed, 19 Jul 2023 16:33:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFaoU1KckSwsbkAZXevH0XK34kzdsMYq4pQFJL52hdGZLZozdeyjGN9ChmQ5xLJt0emUF42TpP/33cdemZ4stU7ZL+6Az7WqsAKpPS+5Rn0wYeEZABXUl48au1ePw1A62Kw3xSdpN/txFaDBgCldviLGWLhoasie49YVrNvfhChD39MmQ2993OJGaVD14z0xv266XEwVtsbag5kuM6gurkyWmb5qUCRMyesmd+jj2AqcMc0ERyyMYm0jyUMHBc5OXMMaUdlMD/gtCPu+3xLw5cxO0p6GYBB3Yw/jM34i8nL4IrYZhNv0y35zMwPsefUlr6YRqza4OCOD+5jDiAdCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQbB9AeJxrvjKq2Af2sz4lX/ZqNpRW1aGmgojZJpt7E=;
 b=b+sBq5reIA2kGvfbrIHHRIGxKzn4ebqSAqvNRhNJEI2MC/dkowuHnC0gNPSrf9hUqFYoFOgszEaeucn3fYRoBmfWrLmEhCvvHSsarCZcJ1nKLkDFsY/1y1hf0IlDnzXKXyN7TDtOc5z4Mw/nQQdTbeN0Wu7Y8EPDR6vPnX2OmlOKbgcdgalaYLK/+FUsUIiwuE2ep28zMzqm8ZYZFSRqPxdLtRn2X8L0D5hH7sN2qQALdtaWdalz99jlCMUXVkKnA+JzI5BDwvnFGNo93QO68JyHAsrrdReCli7HN4+L1zeEeZ2rnhkhuN5ThteIPASgWCW426ErCqmsGQQK+9bYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQbB9AeJxrvjKq2Af2sz4lX/ZqNpRW1aGmgojZJpt7E=;
 b=cddBzSLcZfykKYNwjserqse2JvLHIds6bWyrFNGJj5drgFy9WFeFOthoRguP3uY/88LuHKGbpOA6AKLKBgnNVKycqFZvnJwE+NIlO3ghplPoZlVa0c1qlTzdXYXw4KWn1JluG1cDJSEczkAaAyz2gwU3tTmZVAy/yv7LUXYMhQS5T1hqsJbbUf4yxmZzJCz+ZJIwJdKur3L6CChSsJwV4TCIo0bIs2xXcFsLv8d0OdhURPFqCnPtehLATAJnblqrobcpowRezxrjX3C+03+O5+hgVldv0m5w6m+diqFiW9ItsUVFCyrwxMjcSLkLmzLXfwEg5hL/mSznWJR8N5nElA==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by SI2PR06MB4410.apcprd06.prod.outlook.com (2603:1096:4:15e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 06:33:18 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72f5:eab8:7757:7c49]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72f5:eab8:7757:7c49%6]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:33:18 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v2] media: aspeed: Fix memory overwrite if timing is
 1600x900
Thread-Topic: [PATCH RESEND v2] media: aspeed: Fix memory overwrite if timing
 is 1600x900
Thread-Index: AQHZugrnPAu3uBx5akaz+7fGPVJhRg==
Date: Wed, 19 Jul 2023 06:33:18 +0000
Message-ID:  <TYZPR06MB6568A36C5201185B4D3F80C0F139A@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20230717095111.1957-1-jammy_huang@aspeedtech.com>
 <21e13f35-5caf-6d60-c388-3386e3540834@xs4all.nl>
 <TYZPR06MB6568C3CE08659F86C301787DF139A@TYZPR06MB6568.apcprd06.prod.outlook.com>
In-Reply-To:  <TYZPR06MB6568C3CE08659F86C301787DF139A@TYZPR06MB6568.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|SI2PR06MB4410:EE_
x-ms-office365-filtering-correlation-id: 0642e748-6873-4f04-223b-08db88220a26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NjgC0TbLCCTdYVUm7lxRZNtKNBrHAwEsLnpvX57rof3NfzeZsRK+0K+wCfFTGRX3hCFN4H5lsf0VizKrSwfUXkklysO/RvWT082u1W707t9XU3Xdaq1XjE4xeCiWdykRQKoKhToRagbDmnM0XFiAZzOvxEovyFkSPTqzXkfZ0u1DmVXaPn5wigr/hk3S7t3p4jl34rz9Xnl+SLBmBoKa/kzRlSCTE4cMkQhF6K/g28T4CpJEqbd1bRVWxvyBEorPvN6cxMoDVZGRMgeeQxNo2KRep6KCzuTld5sfQ4PGLYFNAZqxEegVXOMKm+wbwJQ4MylbxyXYWehR4BAnoAihgxEFjXRpOVo3DxxYFTEvSvJZw85l+qBCC9o1nUY/E+xeWaNWoiHF/N0xEdB6muFp2OAQrcLglNt9mhzagb6syOoFegd2urJXdVtrdniVyJum4fhR2h8pV2icIbP9UxyxXOsildn+Yo5tHXd1ILnuyRfQQhmP2Id472+FZXI59rwitbEsKca/jGA5Fzr+3V2XKARqeKlxyL3xlPMxPdAyNsywnTFcS71+C3icPZW+asN5bxiEQdIffDgaSnSQdxrwGHg2ugyEe4O85rlgfpl3Ex+ErYxgNaHKeovDjZwJPFxYEF5S+9dpkvZ3JJblEpzokw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(39850400004)(396003)(346002)(451199021)(38100700002)(7416002)(8676002)(5660300002)(8936002)(41300700001)(52536014)(7696005)(2906002)(316002)(110136005)(478600001)(71200400001)(83380400001)(2940100002)(186003)(6506007)(26005)(9686003)(76116006)(66556008)(66476007)(64756008)(66946007)(66446008)(55016003)(38070700005)(33656002)(86362001)(921005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R0YveFNiaTM1M0s0QTQvcjFXUWRsRjdMcWh4cktwZnJVeXQ4TEZQT1VkK1FG?=
 =?utf-8?B?Vkh3YkNTb2M5THYrQ3ZBdW11WC81M20zVUR5WVZVVmQvVVpGOTc3VlBXeXJH?=
 =?utf-8?B?T0EzdWhyWGhCcWZOQXZWeFVjRVJyOVVJMFh5S0VIYVdoM0VkWlZvSFFUdVgz?=
 =?utf-8?B?WmR1TzltamdrSVQrdGl5RzV6ck5SM3l6aHZ6ZlhNY29OZUNwc1NzWVM0UmVq?=
 =?utf-8?B?ZmVTOUI3cG9rMUs4b3lTQVFNY1FwczNjckVlblErNW92emFZOFBJSVZUMTlL?=
 =?utf-8?B?WUphNklQUXhYMjlUUTE5a09wVEFUZVY3SGpYVnNpbENBaHltUGYrOVM0eEMv?=
 =?utf-8?B?N2xNM2YrVktLaExrOWloMDdCenJwYTlBWjJja3ZJck1IdTZrRUVYb2pnQmFq?=
 =?utf-8?B?ZStoVS85NmJXcE42RzRmdGZTcTFzT1QzdEMreU85MWhuMWc2UnYvZENWdk1F?=
 =?utf-8?B?eFhhcVkyYkNlaDd2QkRWeXU3ZXdBbDZJcjVnNGZaWGN4NytFamtobStqV0M0?=
 =?utf-8?B?MFh6Z1R0L0ZJZ08xV0FtWTYzN0J5bWw1VlZveEtRUFkrWW4yOVRIWnFHdENw?=
 =?utf-8?B?VlMzWnQrVGZHWS9FSCtsWkxyUEIrbklhNjNRYWEzQ05WcFVyVEJkVi9VYXN5?=
 =?utf-8?B?SmZHRTNMY1d4bjErQnpYV0gwSVczZVdxcG1NRTZ4cC8xZzZObFF6RjBkSFNC?=
 =?utf-8?B?MGt0dFpUc1BwSEhCTU9XWU44Y2lTRWlVY3p4K3NzM3FTdjFmWW84VHIrNFdE?=
 =?utf-8?B?QWJHRGtSekhMMzBmTkFUeTYvZnU0cmN1S2hQZmxZc3dSZzU3ZzlkSEJJelhr?=
 =?utf-8?B?MmVkc2kxd2FpdWVLajl0QU9CV2k3VXcxWkZOSkhsQlFNQUFqZWRwZU9jbkNR?=
 =?utf-8?B?TUtCWml5dXhMa0xMc1VIeHJiamVockZZdjlCZ2ZVVWh1TWJHV1pwcXF4Um0w?=
 =?utf-8?B?aG9ldndDdUdzbS9mUVBlNXJQOTg5SlN3VGpQTk5BakZEc08rSmdDQkRTc3Jk?=
 =?utf-8?B?RzNuMlhZdytDVGRIWEk4Uzd2ZGdVR0RFTTdwc25JNWhvRG5zWVZ2b2orbDVP?=
 =?utf-8?B?Y2NUYVorUy9xcCt3R2xzVk94QnM3RjB1QnJqb0VjVHIxUDRjVU0rckZzRTlh?=
 =?utf-8?B?aEhBRTVCWUNnUXBPQ3R2U0RMZGZPL3VFaXdFVWZQMlBmSk96L09sRmxoSEZT?=
 =?utf-8?B?QmdUL00vKzBxZXJxQjNZQVJHaGlGYld2cmFtSzFDV0lqYkpzc2lPcFd4T3Ev?=
 =?utf-8?B?OERuR1NCSFNlcFN1MGFrWTZJYWpoZWhaYnZkWGYyQzMwN0VWODEybFFNMVlt?=
 =?utf-8?B?bVZvZGJZbzFobzh3dXFxM283NFB4QkhJbHhseGRydDRtbDlIZ050V05rUmUy?=
 =?utf-8?B?eTJvQ0lENk92RDd3SHpwQlhlTTBqc3p2OWxaNTRlQThIcGdtZUlTbjV1S1Qz?=
 =?utf-8?B?LzBBUWdxWEN5akk1aFFWa3pUWUhGcnh4RitOWFo5L2FJZFVNdER2RFY3QzYr?=
 =?utf-8?B?N2c5K1V2UjNPMm9hbWxtMC8yMkljVUxkalg5ZHoySTVpeFR6SFY0VXNOVllM?=
 =?utf-8?B?RmpnNWZxQ2x5WDl2ZDlwMVZYZ3RPb2x6Q1RhT1BPRHBnL3NMUEpaR3JQVzZq?=
 =?utf-8?B?QVJhY2FJWEFCc2hKWGhWS1RUdGtvSXhIZDJJVzQrTW4yd0VNbEV0VjZ2T094?=
 =?utf-8?B?WkZFb3pRcXd1bUdHNHBuYUEzcUViR2I2bkRJUVRuQkY5RHpFYWNJZWNLMjBL?=
 =?utf-8?B?OGcrQ1VkV0tsWEd2VkpYNm01ejRBOHNRZEk4YThoWjlza0xwS1Y5UG5GSG0x?=
 =?utf-8?B?T1lmWWhrMmU4bnpMYStiQUJlNVM4QXlQbzYvOUJQV0hnY3hDSlhkTFFSY0xW?=
 =?utf-8?B?WmlxTElaMFVkOC91TWp5TDlEdkxKVXJBNXJyR2U3b0lTdXNhWHRIQXZxQnUx?=
 =?utf-8?B?Vlk1dGV3WmlRYkhzSVlwVEFmazdydy9JSkk5dEpueGRjV3BsRjk4S0VuNzZl?=
 =?utf-8?B?UTJweTQrNnl1Y3RMY3lXTjVtWm9UeFp6NnBSSTV0WGRyeEUySy9aZUN4VWVj?=
 =?utf-8?B?N1dZcFNVRU1OYXF6ZGxpcW1UVWs3ZzJMblQva0pHUlhVUlNkYlR5SDBEWk40?=
 =?utf-8?B?NGJjcEphMnR2V3A3Vzd3Ymg0bVpuQnNnK3VIclFpbjQ4RWwzMGRhZHI1OWRq?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0642e748-6873-4f04-223b-08db88220a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 06:33:18.3402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGLpzfaGfyjJqJIavt8zmKS5P+m/PnumZmX+ij2Q6r23JwvBTI6UFT5fIXgnuFNps0FtF9wmONy5qSrtA3QvIh3T8fdgEfEFNWp+ut4cwiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4410
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

V2hlbiBjYXB0dXJpbmcgMTYwMHg5MDAsIHN5c3RlbSBjb3VsZCBjcmFzaCB3aGVuIHN5c3RlbSBt
ZW1vcnkgdXNhZ2UgaXMNCnRpZ2h0Lg0KDQpUaGUgd2F5IHRvIHJlcHJvZHVjZSB0aGlzIGlzc3Vl
Og0KMS4gVXNlIDE2MDB4OTAwIHRvIGRpc3BsYXkgb24gaG9zdA0KMi4gTW91bnQgSVNPIHRocm91
Z2ggJ1ZpcnR1YWwgbWVkaWEnIG9uIE9wZW5CTUMncyB3ZWINCjMuIFJ1biBzY3JpcHQgYXMgYmVs
b3cgb24gaG9zdCB0byBkbyBzaGEgY29udGludW91c2x5DQogICMhL2Jpbi9iYXNoDQogIHdoaWxl
IFsgWzFdIF07DQogIGRvDQoJZmluZCAvbWVkaWEgLXR5cGUgZiAtcHJpbnRmICciJWgvJWYiXG4n
IHwgeGFyZ3Mgc2hhMjU2c3VtDQogIGRvbmUNCjQuIE9wZW4gS1ZNIG9uIE9wZW5CTUMncyB3ZWIN
Cg0KVGhlIHNpemUgb2YgbWFjcm8gYmxvY2sgY2FwdHVyZWQgaXMgOHg4LiBUaGVyZWZvcmUsIHdl
IHNob3VsZCBtYWtlIHN1cmUNCnRoZSBoZWlnaHQgb2Ygc3JjLWJ1ZiBpcyA4IGFsaWduZWQgdG8g
Zml4IHRoaXMgaXNzdWUuDQoNClNpZ25lZC1vZmYtYnk6IEphbW15IEh1YW5nIDxqYW1teV9odWFu
Z0Bhc3BlZWR0ZWNoLmNvbT4NCi0tLQ0KIHYyIGNoYW5nZXMNCiAgLSBBZGQgaG93IHRvIHJlcHJv
ZHVjZSB0aGlzIGlzc3VlLg0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNw
ZWVkLXZpZGVvLmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3Bl
ZWQvYXNwZWVkLXZpZGVvLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC9hc3BlZWQt
dmlkZW8uYw0KaW5kZXggMzc0ZWI3NzgxOTM2Li4xNDU5NGY1NWE3N2YgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC9hc3BlZWQtdmlkZW8uYw0KKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMNCkBAIC0xMTMwLDcgKzExMzAs
NyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdmlkZW9fZ2V0X3Jlc29sdXRpb24oc3RydWN0IGFzcGVl
ZF92aWRlbyAqdmlkZW8pDQogc3RhdGljIHZvaWQgYXNwZWVkX3ZpZGVvX3NldF9yZXNvbHV0aW9u
KHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZpZGVvKQ0KIHsNCiAJc3RydWN0IHY0bDJfYnRfdGltaW5n
cyAqYWN0ID0gJnZpZGVvLT5hY3RpdmVfdGltaW5nczsNCi0JdW5zaWduZWQgaW50IHNpemUgPSBh
Y3QtPndpZHRoICogYWN0LT5oZWlnaHQ7DQorCXVuc2lnbmVkIGludCBzaXplID0gYWN0LT53aWR0
aCAqIEFMSUdOKGFjdC0+aGVpZ2h0LCA4KTsNCiANCiAJLyogU2V0IGNhcHR1cmUvY29tcHJlc3Np
b24gZnJhbWUgc2l6ZXMgKi8NCiAJYXNwZWVkX3ZpZGVvX2NhbGNfY29tcHJlc3NlZF9zaXplKHZp
ZGVvLCBzaXplKTsNCkBAIC0xMTQ3LDcgKzExNDcsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdmlk
ZW9fc2V0X3Jlc29sdXRpb24oc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pDQogCQl1MzIgd2lk
dGggPSBBTElHTihhY3QtPndpZHRoLCA2NCk7DQogDQogCQlhc3BlZWRfdmlkZW9fd3JpdGUodmlk
ZW8sIFZFX0NBUF9XSU5ET1csIHdpZHRoIDw8IDE2IHwgYWN0LT5oZWlnaHQpOw0KLQkJc2l6ZSA9
IHdpZHRoICogYWN0LT5oZWlnaHQ7DQorCQlzaXplID0gd2lkdGggKiBBTElHTihhY3QtPmhlaWdo
dCwgOCk7DQogCX0gZWxzZSB7DQogCQlhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZFX0NBUF9X
SU5ET1csDQogCQkJCSAgIGFjdC0+d2lkdGggPDwgMTYgfCBhY3QtPmhlaWdodCk7DQoNCmJhc2Ut
Y29tbWl0OiAyNjA1ZTgwZDM0MzhjNzcxOTBmNTViODIxYzY1NzUwNDhjNjgyNjhlDQotLSANCjIu
MjUuMQ0KDQo=
