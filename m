Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82338620992
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 07:27:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5ynr2FSFz3cLX
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 17:27:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=XgCZsdOv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.101.96; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=XgCZsdOv;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2096.outbound.protection.outlook.com [40.107.101.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5ynC6tXFz3bdC
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 17:27:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V06pmsr4sD2omHXaDVZYvZMn4GAoiYfxYwVPDEkokAsUaI4sEAEKhZtqHJt9qm9AFGFH9mdRPJBGBRX7rLKhmWP6+7lpy5Tr7DyikAQUi+yiCsAEoTHTZaPwFTnVHmqlYfQ9rEd40gTHESp26Rm0zEz5zPwrOpL2Lf8pdppcG/rw2/NUDsK6fhYgH+XVfrM0er/oOm3Mp2y/rIMwoTwq/EYS8LAxC0kNxoj5vXXkhOsUFFofYDyaqoHLkaRsKbjptfj1miP92VYUzruKAAJYXfXvPmFJcsBc35gYlQ0vNFxv29JIhuui/IQUQLXgSJQbBL6Dl7ayr9wiMCmm6UzEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=on0LsEuvznZcGEbzLXzPNoe4UWxk2MjDV9te0TVqIbs=;
 b=RQJKP39j8qCPfnY98KZ8ZnBVaWSYryGMtUvg3Q4eILBHcEZdjkOuZ6II3M9xQ1HAYAMNk0EmFc2u0zdYVOB6z79WNs1AOQVPYQZPd4not6F7rghcc0q1LDOEu3lpjQUtQP/FJbPZU8/T2aLWP3Y58jrSHTuLMs/XgkARGmw23Jh0awS57iB08O7f7/WR/WbLYKD4RF12qhZvthCUAunSERnF0BpHC/qraCRpLHWv/q1VmEb+l12WeqpF7xixXVY8Sp7yGh4Flj7SXuGe2r268NsmX4a4N9N/0iU6ka7Rso0NbkZqG3llEXY/vRdN89bdZilugiai9fHfJtPFndoZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on0LsEuvznZcGEbzLXzPNoe4UWxk2MjDV9te0TVqIbs=;
 b=XgCZsdOvedeZh8UC4xE/CtncdWKld5ZkQqOJMcGKz4KdISfjMhE9WmKf6Rwn5jthJHyUEeF4yENZAISdxI2CYvt+lMag9/+pOK7OsUUMrop14rZdwFmpaa+vGuBWdvXTZfT5Ejs2/6KkIt9GKwpK8JM/w4T40XR0SpX16XMl08w=
Received: from LV2PR01MB7765.prod.exchangelabs.com (2603:10b6:408:172::13) by
 BYAPR01MB5623.prod.exchangelabs.com (2603:10b6:a03:119::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Tue, 8 Nov 2022 06:26:47 +0000
Received: from LV2PR01MB7765.prod.exchangelabs.com
 ([fe80::c4b9:a0ce:5e82:fa97]) by LV2PR01MB7765.prod.exchangelabs.com
 ([fe80::c4b9:a0ce:5e82:fa97%4]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 06:26:47 +0000
From: Thang Nguyen OS <thang@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: project wide changes to maintainer ACLs
Thread-Topic: project wide changes to maintainer ACLs
Thread-Index: AQHY7X19CSleHU+b706IX4VlP5pnaq40QX+AgAANGQCAAEyTAA==
Date: Tue, 8 Nov 2022 06:26:46 +0000
Message-ID: <d27d4bcb-b0eb-9c80-bf22-b68a6fc8aa61@amperemail.onmicrosoft.com>
References: <20221031230552.5ssc33v2xnghooqy@cheese>
 <20221108010549.smzzyma5nzgon76l@cheese>
 <a364a12d-e34f-cef2-56bc-e23aeb2f5684@amperemail.onmicrosoft.com>
In-Reply-To: <a364a12d-e34f-cef2-56bc-e23aeb2f5684@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR01MB7765:EE_|BYAPR01MB5623:EE_
x-ms-office365-filtering-correlation-id: 1e6d0cce-fef6-4d59-776a-08dac1523657
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  cVnVaAxkTtLUsI9noJfp4HbUDZZp4YmzSDKPlHeOslotjUuuSmBqzvCmcFQTRze3xfvpmSN6+GPcLYj0muI5Nx9a+ABnLcmcuUqDyns6RxT3xkbgWV49uuxBhGWOyqUPYAQEwW/sH2HIA1CWZ3JDgKfAer6qjAL6/pF4fGNukWGYRuPf93VgfjcNYTe5OF+0teoXJomwkSLyHDtwHpACF1mLzFLmR7wBnXMFZN3iAfinBiANRNRw+sANETaTZOoQSYV12Hnpxtsio4OFG5FqOk+P2xp1A+H8oq1J31TtBB/ZWQguk6/Qy8Rl6SKAqWQiE1snS09M7huT/Tp29MdBYMMa5DYvozrvGuv2gw2+3FAuZcjUpECjv5vYxgV5RqOsY3o52tw3cpsyUmgtNcjQD2EzoZ8Ic9s4/x3cEThM5/5L61m2xwBBl6S+4puSdpyf4I3PuL72Kb4PnzlL2rvGrBPsKo0r3WfvH7JpMctNRri3j0BDURibM2Oe27hexpjrw8NGu02deSW7ZvnTiQU6XhlzGCHLlAjMtfZzOkO2kx6h2aITbfodTI1szde02nAtp0pXecUKM+jJ9F5dW11bd7qyZPr7WRim74DzbmEJg/YomdCe8cPgl2PdrZBXwuLQQUmKVsmC5ADc/XSpptS8+wXXfqW+Y1LthtGVE40QdIjSNL82T1qkxWb6u70svVGcdEg/VY1MRqADgkqoYbZcfRoAfuWXRmICv9IZzdHop6YHgU1qjMu6ZOvtacEeTLWDeGBjMkvctF1eHW29p0l9MQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR01MB7765.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(451199015)(86362001)(5660300002)(8936002)(2906002)(316002)(38100700002)(6512007)(26005)(38070700005)(53546011)(9686003)(122000001)(6506007)(186003)(91956017)(76116006)(41300700001)(31696002)(8676002)(64756008)(478600001)(66556008)(66476007)(66446008)(66946007)(6486002)(6916009)(71200400001)(31686004)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RG1LY1lWSVk4SldVMm9TRWx2NmpXdjk4bEdJZDN3UElKRm9KOGZENnhFY2FU?=
 =?utf-8?B?eExhWUd4dXJrSGxqb0dUMmt2RVIreEJjb0JCQkxsMXhkZmdRV2ZYOHJpZ3gv?=
 =?utf-8?B?d0FoSU1yUzRXc0RGQXl1ZDdaN2taTkN2dnZJekl0SytqYnFiQmRIRFZMTS8r?=
 =?utf-8?B?YmNJVkRIT3E1RkoxTEFxQUNuczJOa0RxVk8wRnYzWEE1T1k2ZFR4WngxWHQw?=
 =?utf-8?B?NXFKaXRYQ01sNzBnYkdiQ05qVm85dGVCZC94ckVvS0xzVjFhcXFPakNBdXlD?=
 =?utf-8?B?bC9ha3luK0hFdmNrUU1jbzZmdDRZS2MrcWhWK0U4RXg4RkIrd2tiamxhbEVu?=
 =?utf-8?B?WG1sTjFlNjk4ZWNtTGtHRkZLTmN5dmxkYmp1emQ5TFFMWm5FdDdZQitTSTkx?=
 =?utf-8?B?NExKSSswcG5KUWRUSER2MFBTVHhlb1A0OHpvNmVFMmV3SFplclpuOG82eHpR?=
 =?utf-8?B?eVRuNXRKWjhIdVlWeGs1ZWliR0RDRVd5bm5MaktwaXhhak9jWDJDMmE4aTY2?=
 =?utf-8?B?aDNQTzNCUTZESG9DYWpteVlkV3hEckRYSm8xWjhrRGxYVER4Z0FNdnB4cUdZ?=
 =?utf-8?B?SzJxR3NWRFR2ZWZYcFQ1V1JYTGZ4OEN2c2hBcnYwZmhxd253QzE4Mm15YTlV?=
 =?utf-8?B?cVpEL0hzTVE3UXhDdmhWekRvcEFBMVNJenN5TldnVWszUk1OUE02Kzh0ejJG?=
 =?utf-8?B?YXJyWWxYTlJuV1Z1ZFRwcXZ5NkdlQTFwallPa0FxbHpWdFhiYUZSYzdqS3I0?=
 =?utf-8?B?Z3FQTmtzM1R6TitCZTQxQ2dCY1FGR3lMTHQzbHN5ZnVUaFZ4QkNlN081Sm43?=
 =?utf-8?B?VEJ5c0lLYUJwNUlqYzBxRFQ0SnNGTGZrZUR6bzlpb2R6ZW1ubTJvMmtON0Rt?=
 =?utf-8?B?eXJLU3BBR3pxeENzTThKQ0RIeVB6QUg1TUdiSkl2ZkJBL2kzK2Q3bmV1ZEN0?=
 =?utf-8?B?Tm5Ecm9rV3cyWHNRTUpWZmVOQWRwblRleGVRWnB1TmRhcUdqTVpOVk5FanZT?=
 =?utf-8?B?WGEvbEFncVRmOUViUmE0U0ZFNmIxYmhuUUdGblJzU2ZqYWo2U1dQbFNhR0Q0?=
 =?utf-8?B?TGdFSTlYWlJNT2JwU2JtRUtMbmlTaXlULzhFVytGWnIvTm5XSHV2WFdLUjlG?=
 =?utf-8?B?YURTTC9xQkJJT2JEdkNQYkNRVDhSaHE3UDV3NmFlK2V2dGxuWHlPY2xWZzg4?=
 =?utf-8?B?STNkSkg3NlR1NVRZa2xDZXhabG14YlFwWXBuOXk5bGRoOVdUaGJVUkpPTTlL?=
 =?utf-8?B?bTdreUpZWEd1amVUVEZPc0lKd1d6NXNQa1JicEpBbFU5dWo0TW53VW5FZHVD?=
 =?utf-8?B?NVlramk4SXRZUW4vZmxJR2RlekZpdU5RWWx1dWNBL09NMmxUdXpXZldDQ0Rn?=
 =?utf-8?B?dFBxbFk5bVZZVWtLVVdVeEUyanN2akhDaGRnYjhEOUMxL0NBeDB1NnZ6TVBJ?=
 =?utf-8?B?cGp5Q0d3UzR0OGsxakpqaDZDdDZnZFVMU3BQcGZYOTNKYXR6WElXZXRDbDJv?=
 =?utf-8?B?SmY5bVNKUzU4LzlUL2NwS2NMSU0zVER3UEJKaGdGV2ZXV1hVMkt6WDl3UEIw?=
 =?utf-8?B?cXVKbXFFN25JdFpqdlJlN05BcnQzV2xZUTREOXNHQkozSjUvazBid2JZNEZn?=
 =?utf-8?B?cnVBVmkrOTRZdHFMZ2RMekZwWmhacksxbnV0MENXRWxlb3NST2lpcU1qa0s0?=
 =?utf-8?B?VEZ1elFrVGFFNnIrUGpEVzk5RWk1aml4R0g3QlJsbWEzc0t2NTNDY1ZRb1dq?=
 =?utf-8?B?Ukk2UzhMTHMxSUk1MzNWR05kZFh4clA0VE5PQi9PV2dmSjBzUGhUcS9Gc3p6?=
 =?utf-8?B?MGFoWXVtY2paZmtiZWFTRFkwYk1VQndYaUR2MVBycWdDUzAxVFFuWFVPNmI2?=
 =?utf-8?B?Y1lwR25qVi9waDJqTzRrR0c0My9QSU9jMjlHTXVzWXlld2ltMkhtdG5YaE80?=
 =?utf-8?B?VlRrMVlOdkhNVnlxcDYxd051ejFCNXh4T3IrLzNNL2FXaFpiQjRWV1BHZmlz?=
 =?utf-8?B?VFVFdmQxNmdRRG14MVlPWXJhQXA3T1h5a3gwZnZZSkVqS1VLR1dLcXZEZ0Z5?=
 =?utf-8?B?MTROT1BZSjY2djQzZVVNdWVOa2kweVh6UmRCNXdCSGpRWEh1dVN3MkFtSDds?=
 =?utf-8?B?TGQ5bWVHbUNMVHJyMnhLM25hUzZndGlLZ2VSbXY2NHFzZVhyTE54ZTFmdENv?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A5775AFCC03BD48B06AF89CD56DBC10@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7765.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6d0cce-fef6-4d59-776a-08dac1523657
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 06:26:46.8902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2KHhEktiGhUGC5awJ4+Mi/fOMTxiZJL/IumRobV1GtSbXPyOXce2tYL79OqgTMsW6/XDWAM35EYICrP3EyOrsCHokmAsyWNPYnXhXvPS87UsJauMTG4otiuifpymJuL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5623
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

T24gMDgvMTEvMjAyMiAwODo1MiwgVGhhbmcgTmd1eWVuIE9TIHdyb3RlOg0KPiBPbiAwOC8xMS8y
MDIyIDA4OjA1LCBCcmFkIEJpc2hvcCB3cm90ZToNCj4+IE9uIE1vbiwgT2N0IDMxLCAyMDIyIGF0
IDA3OjA1OjUyUE0gLTA0MDAsIEJyYWQgQmlzaG9wIHdyb3RlOg0KPj4+IE9wZW5CTUMgbWFpbnRh
aW5lcnMNCj4+Pg0KPj4+IFRoaXMgY29taW5nIFN1bmRheSwgTm92ZW1iZXIgNnRoLCBhYnNlbnQg
YW55IGZlZWRiYWNrIGhlcmUgSSBhbQ0KPj4+IHBsYW5uaW5nIG9uOg0KPj4+DQo+Pj4gMSAtIFJl
bW92aW5nIGFkbWluIHJlcG9zaXRvcnkgYWNjZXNzIGJ5IDx4eXo+LW1haW50YWluZXJzIGdyb3Vw
cyBmcm9tDQo+Pj4gYWxsIHByb2plY3RzIG9uIEdpdGh1YiB0aGF0IHVzZSB0aGUgT3BlbkJNQyBH
ZXJyaXQgaW5zdGFuY2UgZm9yIHBlZXINCj4+PiByZXZpZXcgKG5vIGNoYW5nZSBmb3IgcHJvamVj
dHMgdGhhdCBkbyBub3QgdXNlIHRoZSBHZXJyaXQgaW5zdGFuY2UNCj4+PiBsaWtlIHRoZSBrZXJu
ZWwsIHUtYm9vdCwgb3IgcWVtdSkuDQo+Pj4gMiAtIENvcHlpbmcgdGhlIHN1Ym1pdCBwcm9sb2cg
cnVsZXMgZnJvbSB0aGUgb3BlbmJtYy9vcGVuYm1jIEdlcnJpdA0KPj4+IHByb2plY3QgdG8gdGhl
IG9wZW5ibWMtYWxsLXJlcG9zIEdlcnJpdCBwcm9qZWN0Lg0KPj4gSGkgYWxsIC0gSSBmb3Jnb3Qg
dG8gZG8gdGhpcyBTdW5kYXkgLSBvb3BzLsKgIEkndmUgZG9uZSBpdCBqdXN0IG5vdywgYXMNCj4+
IGZhciBhcyBJIGNhbiB0ZWxsIHRoZSBvd25lcnMgcGx1Z2luIGlzIHJlYWR5IGZvciB1c2Ugb24g
YWxsDQo+PiByZXBvc2l0b3JpZXMgbm93Lg0KPj4NCj4+IEknbSBzdXJlIHNvbWV0aGluZyB3aWxs
IGJyZWFrIC0gaWYgaXQgZG9lcywgb3IgeW91IGhhdmUgYW55IHRyb3VibGUNCj4+IGFwcHJvdmlu
ZyBhbmQvb3Igc3VibWl0dGluZyBjaGFuZ2VzIG9uIEdlcnJpdCBwbGVhc2UgcmVwbHkgdG8gdGhp
cw0KPj4gbWFpbCBvciBjb21lIGZpbmQgbWUgaW4gRGlzY29yZC4NCj4+DQo+PiBUaGFua3MsDQo+
PiBCcmFkDQo+IEhpIEJyYWQsDQo+DQo+IEkgZG9uJ3QgaGF2ZSArMiBwZXJtaXNzaW9uIGZvciBh
bXBlcmUtaXBtaS1vZW0gYW55bW9yZS4gSG93IGNhbiBJDQo+IGFwcHJvdmUgYW5kIHN1Ym1pdCBj
b21taXRzIGluIHRoaXMgcmVwbz8NCj4NCj4gVGhhbmtzLA0KPg0KPiBUaGFuZyBRLiBOZ3V5ZW4N
Cg0KSGkgQnJhZCwNCg0KSSBjYW4gc2VlICsyIG9wdGlvbiBub3cuIFNvcnJ5IGZvciB5b3VyIGNv
bmZ1c2lvbi4NCg0KVGhhbmtzLA0KVGhhbmcgUS4gTmd1eWVuDQoNCg==
