Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8782401967
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 12:04:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H33sK5S6vz2yL9
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 20:04:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=nl7RM0ru;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.122;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=nl7RM0ru; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310122.outbound.protection.outlook.com [40.107.131.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H33rh5pz8z2xb1
 for <openbmc@lists.ozlabs.org>; Mon,  6 Sep 2021 20:03:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4mUiSBrNOnGIhONots3hwr4xgvFAdaUe+QZyR1cATX4nVZqX7dMV51PiIeF6QfSnrKI8UOD+g1+7yNANsnTRUK/czhy9lmeu3GjU1HQ/u9sBxA5GmkWsk5StdYStAi7VQ0h4kFPhLWOC13wags4R8NHcyqYF+p+GNBUDqfX6+b06s35iyiCwHjPhHZlh39CcT3t2MiI5FwfxA1LBuQMRA8zuXU4aquwx2tI14XhuASLDRx7OSu8NywhMgO9FJzvfKyMDIED/2Mdh4L72bpR+R9DPOGsz7q+tH9ztBot4abgVl9XftBgkqz21e96uCMoRWHjB36SjQGSAgRzFt0S3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pYCylm4qakn2qQRE/s51qQYKpewzTMj0q1sq4++38+Q=;
 b=Ox+9LHRCY4rbyg8jnrLEZBy70kIVmyEw3rq7gFwARl+a6QpfqgLrVL5zHvEtDXnrh5JeHhv/VLhUMwWpF1JBd3P+fF9VJIYH1/HXkW0JVTORLBk6ryn00SeGozIgLLyJxnMDwEWj/Kp7Y3ZqICtNHclLJ50ImMxcOMLptindEjg9hHTu4N4nSGC9A5jyCCQnSpwpPebCCJ8O831hp2KUKmIiQSSCUC33op+fS62FR5rOLSxt4Fs7iVER4Es+Mgk0Y1K+qZ9oGC2BCvEYHCe68JrRLOO4HxqcvNeXrrsXk5/KvGUs+XvSp3NYL4PqPybkDTQupcASG5cJnqZolertiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYCylm4qakn2qQRE/s51qQYKpewzTMj0q1sq4++38+Q=;
 b=nl7RM0ruDVmVf9IHSs6AAfOk1nRAtDQg35ENPAIiwqgEf5pJeBQwgusNQGm2D1a1EIjmGTF7mSiy+Urgzjz0dKZU5RJYKm4i0NRTWNfOFDzUPN3kmq1Q4NWJg9H7fGDnY7j7imSQoi5ljxjyw2Hq4YDwvUwxM7jQ6y9gnXV9fNgBoBnE2+pgBZLx2lZCWUVys8DRuU95th8VHIlEiYs5Fxs1UaPv5mUI6lpBE4TYZkxELWywJWFzFJ1QQcpZoCdjtod0mc+XGqF8xoM++klULM96gYJwUKZ0/PbS0UXv8nfziTqoOMSqOv+qSrzp4Rh9mHRZF/2IG0Tw0oBmWzQEKg==
Received: from TYAPR06MB2158.apcprd06.prod.outlook.com (2603:1096:404:19::21)
 by TYZPR06MB4381.apcprd06.prod.outlook.com (2603:1096:400:66::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 10:03:29 +0000
Received: from TYAPR06MB2158.apcprd06.prod.outlook.com
 ([fe80::d0e0:7dfb:6d70:c31b]) by TYAPR06MB2158.apcprd06.prod.outlook.com
 ([fe80::d0e0:7dfb:6d70:c31b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 10:03:28 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [phosphor-host-ipmid] Questions about IPMI (OEM) command
 development
Thread-Topic: [phosphor-host-ipmid] Questions about IPMI (OEM) command
 development
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJgAAK+5A=
Date: Mon, 6 Sep 2021 10:03:28 +0000
Message-ID: <TYAPR06MB21581702B0E3680A6D9E32D08AD29@TYAPR06MB2158.apcprd06.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: flex.com; dkim=none (message not signed)
 header.d=none;flex.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b9f5d93-4a71-4a09-5c6a-08d9711d9353
x-ms-traffictypediagnostic: TYZPR06MB4381:
x-microsoft-antispam-prvs: <TYZPR06MB438114D22EA82EF59B396E528AD29@TYZPR06MB4381.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rhz7yAfmyqRG65nn64wV2eJkRChweQX0yhQWgUsx2cVD8GRiC/SVbg7jut2jYTfH0Y9JKGsDCu8/rKWPzrCS1/5B400E3nBA3bdCFAg3yiRM15jj+qYRkdcpHp+P76gPd9OgGHWIanzW4Uoh9juGBh6NhfZg/APnmQJQ7qTjGJaOeXiCiQSLuVBkcA3rO/ITRcRt8gsPi/+lhsXoW8ygwkbdyZEGwcTFI06vOVrRi6hA0fe3R6kkigjbribSFsRXU03P/Ir2dmXko7YPLvJwHwF1LVuAIIzHEpYXjgp34xCpzed0EvjG6ramciMR97rIIQcskI81QSuMP8Oe+zQ0LIrar2U70W6Dv/B+SiNgmQsfxUMsY2ifARbjmc9NdSM4Ln8HV7XOZNyq0Wch6ksGnvK6XMk/+yyRnYKQ8UO98df5Ya0NgZTOEd5A6LlRdOjVqV+50jgvCbmlzF7hMf8C8MzJmP47X3cHJu8PWhZu9wN1Xmm6LC2Ll03pV1eyTPNFOu8pIJ/FxlMZCbmchQ9Cog9/mMYaQfkNAkXJblhfWJG7G4TtX9sFFfT4Dg5nIHQY/4rVXZrYqJSLtnpgU4LGIkEXl1tgKxjYulVykyZkJkhseo4a0eZj1pE9r7ZGUTeh6pP/QeTvMdRw8h+Tvma1tyLCyGvq7XSC9rjDz5VCx/Aq3S4Sv6ylovpX/AYjelYw0oGvBF9ut/EFWu5b2CX7JQZlX2KS1mqxuCUMh526wRtL/rHwf6AqNacyCglbFB9NCouhvp7O4Vy+OEE8reBOiOrvh0oq4X05C/CMcCAjabXUpjcEjhEPWt1O+gsOHE0o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR06MB2158.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(396003)(39840400004)(376002)(71200400001)(26005)(86362001)(296002)(186003)(478600001)(55016002)(9686003)(33656002)(52536014)(110136005)(38070700005)(5660300002)(2906002)(122000001)(316002)(8676002)(66476007)(38100700002)(66556008)(8936002)(66446008)(64756008)(6506007)(66946007)(53546011)(76116006)(7696005)(83380400001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk5QNUhhRXFmaVNBKzF1WEZzd3pVMThaZGtseFQ4MnAzNXYrOFcxT01pbVd5?=
 =?utf-8?B?R25MQm5QMldLV0NENTNYdEcya1FnTzgxZmozZjRpK2dsR2FMUkhxV0JHdmJT?=
 =?utf-8?B?WFh4OFRqRTk5cG5sRzBxRFdOcjMyMHRJUHQ1aGlnMkZuZCtTOFUrNW1sYnBI?=
 =?utf-8?B?ekRBQVRoN2hPZmVPZVBaNlJrN25lcGxtTGlxemt1Z1N0SlhJbUhINGx4aG0r?=
 =?utf-8?B?b2lrY0tRNktUQjlndWJwdFRJRSs1V0EwbE1DWVFTaHAzQ2NXWVYrTWwwSTh1?=
 =?utf-8?B?V0VqV013VHJpSEFSTDFsUU5wcWtpT0UzWnNiMEtsSW1OZ25IaFBDdnBiZlFl?=
 =?utf-8?B?MlNzeHBlOG1yZGZEQy9MeTQ5eXBkdHhGUW9jcVNtUmZ0dGRmS3hjK2E3ZFZW?=
 =?utf-8?B?VTE4U01ZWWVCZ0s0N1F1clowbjRZTlZzdjNkVkpVTmkzcmE3c3NBb3YrMkdN?=
 =?utf-8?B?WTB0L1l3aERUc2dpVC91RENnbGNMN3FhSjJUNjN6R0V2VW9rTDkwekhJeXV0?=
 =?utf-8?B?VTdPdnpFVHh5Mm1tNjJXS3J5Tm9PYUY1RUZ4ek5aK2JvT3NLbjlvNmhrc2h4?=
 =?utf-8?B?WkhUbkYwYzQ1QUFTdkxVVEIweVNhSlJiMXdXd1NHUzBMc1dQMkdHTWppWWli?=
 =?utf-8?B?dzNHZlByZFhBMXg3MkRtb25WMXNiS24wME11S1d1V09ObnVxM1p0TjF3d2oz?=
 =?utf-8?B?U3BEV2JmMDVBcVA5ZVhaVnRaVkRjeVNXYlZJaU14WEVLKzdIWTdxZGszV3VH?=
 =?utf-8?B?UDE5YmlWVDZBN3BWb25hS05ra0xkY1d6MFhEb2FPdURJb05QK0tuUWdvakpH?=
 =?utf-8?B?MWtRNXZzZFlxUEV5dEFBUWZsY013bzhCd3VIK0ZmV29tM2VzUFAzRzJSNWds?=
 =?utf-8?B?QVdkUW8xaWdyN3NjR0pKZmdMUTFZNFVnU1Q2MytYeDRaVUpUaGcwVU91UU1t?=
 =?utf-8?B?TGFveGhmanRYNmJjL3FEOE1rTUNoNFN0cFpybW52dURwcnkvQkp5UlBEMUpR?=
 =?utf-8?B?WnYwa2VxYlByc2JGcytGQkdaWnBjUXU4eTV2VHZlKzFSZDBrVXQ0N2dIRFpk?=
 =?utf-8?B?U0Q5QllsM3dsMW1lSlB4UWZZa21SellTZHNwbitobUlOL1llOStITkNMY2pk?=
 =?utf-8?B?Z29zSWtkNklqbG5PZmlWdTZNaGtNL2hMV1hOdmZDR2twM1ZCSjljdmpGNDM2?=
 =?utf-8?B?OWRMTWZOV2pDTldiZDNhbGpydWFONjVlTTNMdW9UV3hxSjlZOUljN0V6TFdI?=
 =?utf-8?B?aWZSSXZGVjI3R1lVNDdPK2lHaUZBWmRSWUwzZkVTd2M3bGlITWVZY1pOTlZT?=
 =?utf-8?B?QWcrVGFrRzdLeHVGUW1NOUNMbWpkaTdQM3ZNQWpZczZETDZXcFFad21QcCta?=
 =?utf-8?B?SEpZbGViOTdDVWVxUzNxN1JyZDdCZjk0WkJNUUxadW56UkpMYllSeURwZysv?=
 =?utf-8?B?OEd3QzVmS24wZEhCUmZEaC8rSFRNVEhFWC91V2hpK255cXNNS3pnVnFQWUZO?=
 =?utf-8?B?YTNrQllhR0lzMU12TlMxbkJZd055eWlFWWFkVEFhSlpxc1lZK2RZdFh2QUFF?=
 =?utf-8?B?WGEvNzQ0WGFEUGxETDkrS0xFVVZXWmdNYWZEQmtWTGQva0tZSUM4WVhGQ24w?=
 =?utf-8?B?a3FBY09aUVRmSnhqc2h3NVN0M2ZvMjFTLzZDNXBzY1VzcFR0T2tRaXRtemMv?=
 =?utf-8?B?b1p2NEhUMEZsRFhOeVVUR2Jhd1FQUGswaml0Zk95bjF4T0hUM0p6MHpjejQ1?=
 =?utf-8?Q?umhQsDm0MqReSfx3jYuwy3ARndHdsUQvD32JgDS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR06MB2158.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9f5d93-4a71-4a09-5c6a-08d9711d9353
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 10:03:28.7740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6q4s5+WoTac1MO33mqPdT9qPQx90ztAZes4jOOpK0YN3XMvANmfSY/lOWGfCcxDRrqyGTHisP6EXIW4zz8el8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4381
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

SGksDQoNClVzaW5nIGBgYGpvdXJuYWxjdGwgLW8ganNvbi1wcmV0dHlgYGAsIHlvdSB3aWxsIHNl
ZSBvdGhlciBlbnRyaWVzIGluIGVhY2ggbG9nLg0KDQpUaGFua3MsDQpUcm95IExlZQ0KDQpGcm9t
OiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdHJveV9sZWU9YXNwZWVkdGVjaC5jb21AbGlzdHMu
b3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIENocmlzIENoZW4gKFRQSSkNClNlbnQ6IE1vbmRheSwg
U2VwdGVtYmVyIDYsIDIwMjEgNTo0MSBQTQ0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0K
U3ViamVjdDog5Zue6KaGOiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVlc3Rpb25zIGFib3V0IElQ
TUkgKE9FTSkgY29tbWFuZCBkZXZlbG9wbWVudA0KDQpIaSBhbGwsDQoNCkkgZ3Vlc3MgdGhpcyBt
YWlsIHdhcyBnb3Qgb3ZlcndoZWxtZWQgYnkgYnVuY2hlcyBvZiBlbWFpbHMsIHNvIHBsZWFzZSBs
ZXQgbWUgcmVzZW5kIGl0IGFuZCBob3BlIHNvbWVvbmUgY291bGQgaGVscCBtZS4gQW5vdGhlciwg
SSBhZGQgb25lIG1vcmUgcXVlc3Rpb24gbWFya2VkICM1IGJlbG93Lg0KDQpUaGFuayB5b3UuDQoN
ClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCuWvhOS7tuiAhTogb3BlbmJtYyA8bWFpbHRvOm9wZW5ibWMtYm91bmNlcytjaHJp
cy5jaGVuMz1mbGV4LmNvbUBsaXN0cy5vemxhYnMub3JnPiDku6PooaggQ2hyaXMgQ2hlbiAoVFBJ
KSA8bWFpbHRvOkNocmlzLkNoZW4zQGZsZXguY29tPg0K5a+E5Lu25pel5pyfOiAyMDIx5bm0Oeac
iDLml6Ug5LiL5Y2IIDA2OjM0DQrmlLbku7bogIU6IG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcgPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQrkuLvml6g6IFtwaG9zcGhv
ci1ob3N0LWlwbWlkXSBRdWVzdGlvbnMgYWJvdXQgSVBNSSAoT0VNKSBjb21tYW5kIGRldmVsb3Bt
ZW50IA0KwqANCkhpIGFsbCwNCg0KSSBoYXZlIHN0dWRpZWQgInBob3NwaG9yLWhvc3QtaXBtaWQi
IHBhY2thZ2UgZm9yIGEgY291cGxlIG9mIHdlZWtzIGFuZCBnb3QgdW5kZXJzdGFuZGluZyB0aGF0
IGl0IGhhcyBpbXBsZW1lbnRlZCBzb21lIG1hbmRhdG9yeSBhbmQgb3B0aW9uYWwgY29tbWFuZHMg
YWxyZWFkeS4gQW5kIEkgYWxzbyBrbmV3IHRoYXQgSSdtIGFibGUgdG8gbGV2ZXJhZ2UgImludGVs
LWlwbWktb2VtIiBwYWNrYWdlIHRvIGdldCBtb3JlIGNvbW1hbmQgaGFuZGxlcnMuIEJ1dCB0aGVy
ZSdyZSBzb21lIHF1ZXN0aW9ucyByYWlzZWQgaW4gbXkgbWluZCwgSSBob3BlIHNvbWVvbmUgY291
bGQgZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25zLg0KMS4gV2hhdCdzIHRoZSBub3JtYWwgZGV2ZWxv
cG1lbnQgcHJvY2VkdXJlIGluIGNhc2UgSSB3YW50IHRvIG1ha2Ugb3VyIG93biBPRU0gY29tbWFu
ZHM/IEkgbWVhbiBkbyB5b3UgZ3V5cyBlbmNvdXJhZ2UgbWUgdG8gY3JlYXRlIGEgbmV3ICJ4eHgt
aXBtaS1vZW0iIHBhY2thZ2Ugb3IgdG8gbGV2ZXJhZ2UgImludGVsLWlwbWktb2VtIiBhbmQgdGhl
biBhZGQgb3VyIG93biBjb21tYW5kcyBpbiBpdD8NCjIuIEkgZm9yIG5vdyBhZGRlZCAiaW50ZWwt
aXBtaS1vZW0iIHBhY2thZ2Ugb25seSBmb3IgdXNpbmcgaXRzICI8Q2hhc3Npcz46PFNldCBGcm9u
dCBQYW5lbCBFbmFibGVzPiIgY29tbWFuZCBiZWNhdXNlIEkgZmlndXJlZCBvdXQgdGhlIHNhbWUg
Y29tbWFuZCBpbiB0aGXCoCJwaG9zcGhvci1ob3N0LWlwbWlkIiBpcyBub3QgYWJsZSB0byBtYXRj
aCB0aGUgZC1idXMgaW50ZXJmYWNlIGluIHRoZSAieDg2LXBvd2VyLWNvbnRyb2wiLiBJJ20gbm90
IHN1cmUgaWYgSSB3aWxsIG5lZWQgb3RoZXIgY29tbWFuZHMgaW4gdGhlICJpbnRlbC1pcG1pLW9l
bSIsIGJ1dCB3aGF0IGlmIEkgZG9uJ3QgbmVlZCBvdGhlciBjb21tYW5kcywgaG93IHRvIHJlbW92
ZSB0aGVtPyB0byB1c2UgdGhlIHdoaXRlbGlzdCBtZWNoYW5pc20/DQozLiBJcyBpdCBva2F5IHRv
IGFkZCBtb3JlIHRoYW4gMSB4eHgtaXBtaS1vbWUgcGFja2FnZXM/IElmIHllcywgaG93IHRvIG1h
bmFnZSB0aGUgd2hpdGVsaXN0IGJldHdlZW4gdGhlc2UgMiBPRU0gcGFja2FnZXM/DQo0LiBBbSBJ
IGFibGUgdG8gdXNlwqAiaW50ZWwtaXBtaS1vZW0iIG9uIGEgcGxhdGZvcm0gdGhhdCBpcyB1c2lu
ZyBBTUQgQ1BVPw0KNS4gSG93IHRvIHByaW50IHRoZSAiZW50cnkoIlNFTkRFUj0lcyIsIHNlbmRl
ci5jX3N0cigpKSIgcGFydHM/IEkgbWVhbiBJIGZvciBub3cgY2FuIHByaW50IG91dCAiU2V0IHVw
IGlwbWkgY29udGV4dCIgc3RyaW5nIGFmdGVyIGZvbGxvd2luZyB0aGUgaW5zdHJ1Y3Rpb24gbGlz
dGVkIGluICJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kvRGVidWdnaW5n
LU9wZW5CTUMjZW5hYmxpbmctYXBwbGljYXRpb24tZGVidWciLCBidXQgSSBkb24ndCBzZWUgIlNF
TkRFUj0iIHdoZW4gSSBleGVjdXRlZCAiam91cm5hbGN0bCAtdCBpcG1pZCIgY29tbWFuZC4NCjYu
IA0KNi4gbG9nPGxldmVsOjpERUJVRz4oIlNldCB1cCBpcG1pIGNvbnRleHQiLCBlbnRyeSgiU0VO
REVSPSVzIiwgc2VuZGVyLmNfc3RyKCkpLCANCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGVudHJ5KCJORVRGTj0weCVYIiwgbmV0Rm4pLCBlbnRyeSgiTFVOPTB4JVgiLCBsdW4pLA0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW50cnkoIkNNRD0weCVYIiwgY21kKSwg
ZW50cnkoIkNIQU5ORUw9JXUiLCBjaGFubmVsKSwNCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGVudHJ5KCJVU0VSSUQ9JXUiLCB1c2VySWQpLA0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgZW50cnkoIlNFU1NJT05JRD0weCVYIiwgc2Vzc2lvbklkKSwNCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudHJ5KCJQUklWSUxFR0U9JXUiLCBzdGF0aWNfY2Fz
dDx1aW50OF90Pihwcml2aWxlZ2UpKSwNCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGVudHJ5KCJSUVNBPSV4IiwgcnFTQSkpOw0KDQoNClRoYW5rIHlvdS4NCg0KDQpSZWdhcmRzLA0K
Q2hyaXMgQ2hlbg0KTGVnYWwgRGlzY2xhaW1lciA6DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLiANCkl0
IGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkg
dG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQgDQpvciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJl
YWRlciBvZiB0aGlzIG1lc3NhZ2UgaXMgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIA0KeW91
IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4g
YW55IGZvcm0sIA0KaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBtZXNzYWdlIGluIGVycm9yLCANCnBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNl
bmRlciBhbmQgZGVsZXRlIG9yIGRlc3Ryb3kgYW55IGNvcHkgb2YgdGhpcyBtZXNzYWdlIQ0K
