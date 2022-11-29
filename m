Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2EC63BD7E
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 11:07:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLygj4ZMZz30hh
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 21:07:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=eIKPNNi+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f400:fe59::70a; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=eIKPNNi+;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLyg4089Sz30QS
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 21:06:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi4DnN+Cc0JOtRXgCZuU2HkXJALilfOA7hgHVlm19Ius/NtVkZUGtUDgFcwEUep9tNOMAQ7wfDNWk04PteRcT0aNy4bmWJf+A7ucdObHTDWE4sE1E4vD/DCLh8A1qZp4u0J3PSZq/IR0iH/gMdrD0WX6w8W9zKRVZtQngZoXxJzFKxKFGvbZk0argIeFKooJ9/Dy+IX1qBraJuGCb3oK6/1du5DK/Xz6wGPOaPO31C1kyjo/AY1CWXlJW17pCYSOjYzXhFLucmzsgCupluucIfht7y/+zAUmrz/6raysmDZ2Uw+gplhyVlZvxrlr1CdS5RM9C27syXdshJuMvQWcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GVm+KlfclUTQEApE2uUP5u26ctmRgcaQ2ITx+A3tFU=;
 b=nCcbM9TEUH/xDnED5GRVvDHsqHq/YDIN+NGNnJbRRAjBn4i1X5AWh93D2DXY1SpYgqB+5Z/B45mB2dSJmt+9jfZ27W00X985Gl5IdrYk57JotNXUgL+Fqx+CJGqIv1QmuBfMwqhDMUWLT0KmbdjJd59WsB1u7KeKV2V7SOXoi1V8ngc7TYHAOgPgF5zWa4gzf0XGTKCv+kn+VVaECHMIXYSB9tzI1SzXkeQRN2zwe9P5dY+K5DWA4TiMzjSKT8qzszAEcr+B4zY3K5vYWfOyfGHtRJBaPxSpe3MFlVz5PPyyGeoRX6TvVCB7npFsf27CynZrGQ8y9NCGh0MZi59lFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GVm+KlfclUTQEApE2uUP5u26ctmRgcaQ2ITx+A3tFU=;
 b=eIKPNNi+331PgkW+nutZ7Lxp4s0wpuYopcAGFvTiH8UdIq1X3hWoKCVHhtuxplxlbLrruBn6cgWMe8G3lDCgP0Ft/YNXC/s5837ZvWj7XwJht89ONEZreZOjmB9tw42OhAzWGEv1abvqMbCu+PWxLMTKmiRv81pNLr44I302YC4=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 BYAPR01MB5221.prod.exchangelabs.com (2603:10b6:a03:86::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 10:06:32 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 10:06:32 +0000
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Potential high risk for readonly/operator users on BMC console
 access
Thread-Topic: Potential high risk for readonly/operator users on BMC console
 access
Thread-Index: AQHY/ZJ0In3WPdUAoEaCiaLIkG2fZ65VLEuAgACNEAA=
Date: Tue, 29 Nov 2022 10:06:31 +0000
Message-ID: <1AE3EBA0-0E46-47DE-BEF7-B7A0F4275D14@amperemail.onmicrosoft.com>
References: <496697FB-7A80-4F2B-BC4A-8955016082CD@amperemail.onmicrosoft.com>
 <0d89ea81-3f9a-3b59-6b82-5e503596e1a4@linux.ibm.com>
In-Reply-To: <0d89ea81-3f9a-3b59-6b82-5e503596e1a4@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|BYAPR01MB5221:EE_
x-ms-office365-filtering-correlation-id: 07d53290-8a8a-4de6-95bf-08dad1f163ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  407fR+8racSzPA35QTdI9zmWIbCCwE4J3d6wcsk2NMqSZts3xJd6AcDUjY7HhFysVYJKs9qvqn2+fHR7arnf6XORPb/kCpxfB1GHJKvXGTAA42tpHKtZHbI4dyegjiven83R5aqExUMr+QFbKSG9PMzgMCVXp5Dana7M83z/F0wzyyWeDD8JksLtcirCeolGlKxB1Ybq7sq3LgDVjov1rkuCE+cDWHT6ZRLDiJvAFwLxKXekPGkDb9HPayabytWInNhFwVnYM4TBFr4xYSlz/0SM4pTNtU0OT2q3BPQH3n4qsaYHVOzZWjG5B9DrxuObvGFxy+eDjk7FBfsIkG1Cy9v/x3PEqkU+AI3saj/R1jtnh9AynywvItVXO6g4slXNQPkM3KUWDtbsm3qmVK8XcTzdSda/8DhjLWEZ4gkmHKJ8tAAa29T6F2mRuMxurRcqMb4AA/TZieD8eSlQ3N79NXzqWCV+jem5OSKYMSmOP/uJbPawiTDs5dzBTwx/9qAyESFgCxK78kDjrXESNKwgIEJI/0DCjJmq3lY1zQu5UBUAdnya14I6Pfus+iX/FfxH6sztnRprktntt1L6iyNPuQpXrG6lQv0Z5NcZKOMD4SLkJz8L0X1oG3T0At5UpeHKL9Hr9WCZGAZJd+hlqL/UVyxyY4zF9Z5b9cIOm06z2ALyOIwJ+YL7LWAaSsRgTKFDQ3/P+wbnHhgTOE1nvnS6Fy6KWU7ztWSnVh1VYs3EagoHM8WuzMG8wP5WUzbuIxczxdqQc3XJIRa922Cy4lz2uBDlHl8X9kFrFGtIEDBPCLU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39850400004)(451199015)(478600001)(107886003)(966005)(6486002)(71200400001)(6506007)(6512007)(4326008)(66556008)(66476007)(64756008)(8676002)(41300700001)(66446008)(186003)(2616005)(5660300002)(8936002)(26005)(316002)(53546011)(54906003)(6916009)(91956017)(83380400001)(2906002)(38070700005)(86362001)(33656002)(122000001)(66946007)(76116006)(38100700002)(115813001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T2wwMkJVYi84amFKNGpjcFRVcXN3TTlwZ01ESFk5WTVHUWpOTXF3VWNBQmw1?=
 =?utf-8?B?ZnJ6aDFWbDgzVWRaSVNYaVRMNDRKMkZ2blpBWDRRSWtkakZNZjR1MEg5QTE1?=
 =?utf-8?B?dTVvak9pdVlUd09ueVdjb1FMT2RRZTh4VUpjSzIyTDZJbkZOM0FjbnhKNHE3?=
 =?utf-8?B?Y3MybXNkKzdBb29Cb2ZZQUE4dGZWZS9BVDBOVnV1UlB6Y2VRL2tnYWJ3WEJu?=
 =?utf-8?B?blhYeU53NUpQUUc3alRiZjRVTTNOSkoxZVZaUEFUMEtjd1NDZ1BiaHJlT1lR?=
 =?utf-8?B?RFR4U2lTZ1pWY0tDYXR0SGs4SENJVWZwS1hyQmx2a24rOXJPQTFhL2JnUHNL?=
 =?utf-8?B?SGVUemlLeDh1eVNZTWhPd2NSdjBTRjE2Zll6TVJJL1Z4bnhUd2c3RXZsNXFi?=
 =?utf-8?B?QVFxcGE3YzZPREgvTnZWVkxZL0N3UGtvcElIWmcwbHoyS0tESWFKT2Q3TmVU?=
 =?utf-8?B?YklLaEEwVFJrNThKOHhBYlRZc0wyeTdxMUZiZTIyZTk5QVJqUkQ3eVN3aVZK?=
 =?utf-8?B?Q0RsZ3d4UkV6dWtGREFaQ0h2UHhXU3pqREdJenJmRmtJQkYzbFB2bUIvemg0?=
 =?utf-8?B?NFZ5T1dYV3VxelY5MjRlQUlBL1BZemVrcSt3dVhSbDA5SVg2MVFYMmJRUklZ?=
 =?utf-8?B?cHFvOGlsU1VRc3JrRWFRbjB6bmxEa0RFS1NzUHpwYlBHbVZ6WE5EeTlYSkIz?=
 =?utf-8?B?dHh3SC9ZQjhFRXYwZk1yUnlIc05zVFVYUEF3ek93WFdMQXkzcUcycmU2dE80?=
 =?utf-8?B?Y3ltOUZjOGlTeW5BM2dkWDBzcy90Ukg0RXJOY2ZWU2t1MWNWYnJTM2Vub24y?=
 =?utf-8?B?Ujk5YUllWGhhYWRDaVladytoNUpSV3dUcHkwY25NalR3TGZHNDRvZXhacGI2?=
 =?utf-8?B?Y1ZtVXR6THhqck9KMlRSbm9BTXh5NjlyajcydUIrYnVicmRxQW1lazZwcmRK?=
 =?utf-8?B?Z25UREptbzdmeEpnZGF2aFB1UTVsTkprSFByazBDVDZiSDk4Q0J4dTN0Snll?=
 =?utf-8?B?eUNBUU13dU1ycFdSSjcxdmpSanZYNmFZZ2FuMEx1ZjNYVkRSbkt2ZjdMNHhn?=
 =?utf-8?B?ODZIWFdSNHlMMUNlcFZSanRvdktCdHFqbzdLdGY3RE1Hd2lUaWxiWEFGdmV5?=
 =?utf-8?B?Y0ZMZmEyN2t4S3V6OW1EdURlRkZUblZOOUlzbnRVQmZwZ1BHQ2dwMG43cnA4?=
 =?utf-8?B?Y0tVZnM3MmxUYkdWSU1ZVUp3RU5zQkUzNVorTkl4TDhLdTdwczZacGRBZndm?=
 =?utf-8?B?ZkFpNDd0WVJyQ1FPeklJM3hkRCtlWFpYOXlWQ3hDMVI1YkFyaTRlbjhsbzZu?=
 =?utf-8?B?NWJhQmhzRFFGOUVWN0crakxnK0VoUlV1bjhyRHRRQzl5SEtPSytCS2hCQTRE?=
 =?utf-8?B?ejkyTjY0SlAzMGovckVzaERFUmFGdmpSNDJsZ1Z0ejVpUEZSQ1B1QVVMUWxh?=
 =?utf-8?B?akdOZTVwRm9EQlRoeURhSTkzSEZNZkpMcVFmbmdXNTVZSFllNU5HaVBwUjFD?=
 =?utf-8?B?S29oWVdMSHAxeXJwVi93dlNRQSsvSldkQ0V6QnZzRVg2SmM0N3VRaWtFbnJs?=
 =?utf-8?B?UWRndUthTnl5UVhLT21uNHBHYm1oSzNIekhsaU5PVHJmVzRTdVVaN0pEbU1L?=
 =?utf-8?B?L3cvTjZuTU5FZHJWOEtlQVRVejRUTkVYdHcyZ1lCN2pkelBoRld1aE0vVVgv?=
 =?utf-8?B?OUhqUGJSeGNIMS80YmdlUG9neTlGcUJGRXFRV0VVSFI0ZXBObnh4K0ZNRzkz?=
 =?utf-8?B?Z0lMai9zVlVSajQxUXN6YTIreENTMFdDYmE2ajIxYUI2SXJ1M3NuZ2tJRmxX?=
 =?utf-8?B?MDlYcmNvR0dpRlRMT3R2UmsrQTUyYVFSSzJpNUxURWRtNEh5MFhvaU5HK0Zp?=
 =?utf-8?B?SU5BR0RVenVQelMzOEVSMTlZWVU0U3ZwUHJwOTcvM3F0djJZd3NodGVoVXJI?=
 =?utf-8?B?MFVBMDhKeUQ0VGQ4Y1NTdXBvQU9kZVJKbldZbnZlNkpXeTFrTHJpVERJV3JK?=
 =?utf-8?B?ZnlLdEM4b2ZGMTUxQy93NWFlRzRzWXM3UkYrSlN6WWl4SnNuaU9IOFJrWldl?=
 =?utf-8?B?NjAwT091eE1TanF5SmNnSUE0amo0MzlhLzN4OFBWMjFKdzRpMndTZGllbWtK?=
 =?utf-8?B?OVN6SG5OOUNaNm5iUUJ4bEtYOEo0MkxNVEhWSENpYWlCVVYvNGNNMzdMYytJ?=
 =?utf-8?Q?x6srkJH+yuXkuCidbyCL5Rs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6320140B5C4AE49BBFED144509DD7BA@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d53290-8a8a-4de6-95bf-08dad1f163ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 10:06:31.9519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibXgoLwkXG8pg4MJ5LLxIr1+VBCIukhQ8sZaQNr4i2wFqFD8lIseT/kAzZTV++aeAJf9Lbhz+Qb1ZyoDEjr9BSGb8VL5XK31LOS/Ahj6VuPQHvJcIbsRSA7TZ3noQSms
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5221
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
Cc: Phong Vo <pvo@amperecomputing.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Phong Vo OS <phong@os.amperecomputing.com>, Nga Nguyen <nga.nguyen@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KDQo+IE9uIDI5IE5vdiAyMDIyLCBhdCAwODo0MSwg
Sm9zZXBoIFJleW5vbGRzIDxqcmV5QGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPiANCj4gW0VYVEVS
TkFMIEVNQUlMIE5PVElDRTogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gYW4gZXh0ZXJuYWwg
c2VuZGVyLiBQbGVhc2UgYmUgbWluZGZ1bCBvZiBzYWZlIGVtYWlsIGhhbmRsaW5nIGFuZCBwcm9w
cmlldGFyeSBpbmZvcm1hdGlvbiBwcm90ZWN0aW9uIHByYWN0aWNlcy5dDQo+IA0KPiANCj4gT24g
MTEvMjEvMjIgNDoxNyBBTSwgVGhhbmcgTmd1eWVuIE9TIHdyb3RlOg0KPj4gSGksDQo+PiBJIHdv
dWxkIGxpa2UgdG8gaGF2ZSB5b3VyIGNvbW1lbnRzIG9uIGJlbG93IGlzc3VlIHdoaWNoIHdlIHRo
aW5rIGl0IGlzIGhpZ2ggcmlzayBzZWN1cml0eSBpc3N1ZSB3aGljaCBkZXNjcmlwdGlvbiBiZWxv
dzoNCj4+IA0KPj4gQW55IHVzZXIgKHJlYWQtb25seSwgb3BlcmF0b3IsIGFkbWluaXN0cmF0b3Ip
LCB3aGVuIGNyZWF0ZWQsIGhhcyBCTUMgY29uc29sZSBhY2Nlc3MvbG9naW4gYnkgZGVmYXVsdC4g
SGUgY2FuIGxvZ2luIHRvIEJNQyB2aWEgQk1DIGNvbnNvbGUgYW5kIGRvIHRoZSBmb2xsb3dpbmcg
YWN0aW9uczoNCj4+ICAtIFdyaXRlIHRvIGhpcyAvaG9tZS88dXNlcj4gZm9sZGVyIHRvIGZ1bGwu
IFRoaXMgd2lsbCBtYWtlIHRoZSBSb290RlMgZnVsbCBhbmQgbm8gbW9yZSBvcGVyYXRpb24gY2Fu
IGJlIGRvbmUsIHVubGVzcyBkbyBBL0MgcG93ZXIgYW5kIHJlZmxhc2ggdGhlIEJNQyBmcm9tIHUt
Ym9vdC4NCj4+IC0gV3JpdGUgdG8gL3RtcCBmb2xkZXIgdG8gZnVsbCB3aGljaCB3aWxsIG1ha2Ug
bWFueSBhcHBsaWNhdGlvbiBmYWlsIHRvIHdvcmsuDQo+PiBJdCBpcyBnb29kIGZvciBhZG1pbmlz
dHJhdG9yIGFzIGhlIHNob3VsZCBoYXZlIGZ1bGwgcHJpdmlsZWdlLiBIb3dldmVyLCBmb3IgcmVh
ZG9ubHkvb3BlcmF0b3IgdXNlcnMsIGhlIHNob3VsZCBub3QgaGF2ZSBjb25zb2xlIGFjY2Vzcy4g
Tm8gbWF0dGVyIGlmIGhlIG1ha2VzIHRoZSBCTUMgY3Jhc2hlZCBieSBtaXN0YWtlIG9yIGl0IGlz
IGhpcyBpbnRlbnRpb24sIHdlIHNob3VsZCBwcmV2ZW50IGhpcyBoYXBwZW5zLg0KPj4gSXQgaXMg
a25vd24gdGhhdCBtYW55IHByb2R1Y3Rpb24gc3lzdGVtcyBkbyBub3Qgc3VwcG9ydCBCTUMgY29u
c29sZSBidXQgc3RpbGwgaGF2ZSBzb21lIHN1cHBvcnQgYW5kIHNvbWUgY29tcGFuaWVzIGFsbG93
IHJlbW90ZSBhY2Nlc3MgdmlhIEtWTSBvciBjb25zb2xlIHNlcnZlci4gSSB0aGluayB3ZSBzaG91
bGQgZGlzYWJsZSBzaGVsbCBsb2dpbiBmb3Igbm9ybWFsIHVzZXJzIChyZWFkb25seSBhbmQgb3Bl
cmF0b3IpIGJ5IGRlZmF1bHQuDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcmVwb3J0LiAgSGVyZSBh
cmUgbXkgdGhvdWdodHMuDQo+IA0KPiBZb3UgYXJlIGRlc2NyaWJpbmcgcmVzb3VyY2UgZXhoYXVz
dGlvbiwgc29tZXRpbWVzIGRlbm90ZWQgYXMgb25lIG9mOg0KPiAtIENXRS00MDA6IFVuY29udHJv
bGxlZCBSZXNvdXJjZSBDb25zdW1wdGlvbg0KPiAtIENXRS03NzA6IEFsbG9jYXRpb24gb2YgUmVz
b3VyY2VzIFdpdGhvdXQgTGltaXRzIG9yIFRocm90dGxpbmcNCj4gDQo+IEkgYWdyZWUgdGhpcyB3
aWxsIGxlYWQgdG8gdGhlIGZhaWx1cmUgb2YgdmFyaW91cyBCTUMgZnVuY3Rpb25zIGxlYWRpbmcN
Cj4gdG8gZGVuaWFsIG9mIHNlcnZpY2UuDQo+IA0KPiBUaGVyZSBhcmUgdHdvIHdheXMgdG8gYWNj
ZXNzIHRoZSBCTUMgY29tbWFuZCBzaGVsbDoNCj4gDQo+IDEuIEFjY2VzcyB0byB0aGUgQk1DIGNv
bW1hbmQgc2hlbGwgdmlhIFNTSCBwb3J0IDIyLiAgVGhlIGRlZmF1bHQgQk1DDQo+IGNvbmZpZ3Vy
YXRpb24gb25seSBhbGxvd3MgQWRtaW5pc3RyYXRvciB1c2VycyB0byBoYXZlIGFjY2Vzcy4gW2Zv
b3Rub3RlIDFdDQpObyBwcm9ibGVtIHdpdGggU1NILiBPcGVyYXRvciBhbmQgcmVhZC1vbmx5IHVz
ZXJzIGNhbuKAmXQgYWNjZXNzIEJNQyBzaGVsbCBvdmVyIFNTSA0KPiANCj4gMi4gQWNjZXNzIHRv
IHRoZSBCTUMgY29tbWFuZCBzaGVsbCB2aWEgdGhlIEJNQydzIHNlcmlhbCBwb3J0LiAgVGhlDQo+
IHR5cGljYWwgQk1DIHNldHVwIGVpdGhlciBkb2VzIG5vdCBoYXZlIGEgY29uc29sZSBvciBzcGVj
aWZpZXMgdGhhdA0KPiBhY2Nlc3MgdG8gdGhlIEJNQydzIHBoeXNpY2FsIGNvbnNvbGUgcG9ydCBz
aG91bGQgYmUgcHJvdGVjdGVkLg0KPiANCj4gUGxlYXNlIHNlZSBzb21lIHJlbGF0ZWQgYnVpbGQt
dGltZSBjb25maWd1cmF0aW9uIG9wdGlvbnMgaGVyZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvb3BlbmJtYy93aWtpL0NvbmZpZ3VyYXRpb24tZ3VpZGUjYm1jLWNvbnNvbGUtc2hlbGwt
YWNjZXNzDQo+IA0KPiBBbHNvLCB3ZSBjYW4gY29uc2lkZXIgYWRkaW5nIGEgY2hlY2sgc28gdGhh
dCBvbmx5IGFkbWluIHVzZXJzIGFyZQ0KPiBhbGxvd2VkIHRvIGFjY2VzcyB0byBhIEJNQyBjb21t
YW5kIHNoZWxsIHZpYSB0aGUgQk1DJ3Mgc2VyaWFsIGNvbnNvbGUuDQo+IChBbmQgbm9uLWFkbWlu
IHVzZXIgd2lsbCBiZSBsb2dnZWQgb2ZmLikNCkRvIHlvdSB0aGluayB3ZSBzaG91bGQgZGlzYWJs
ZSBjb25zb2xlIGFjY2VzcyBieSBzZXR0aW5nIGZyb20gcGhvc3Bob3ItdXNlci1tYW5hZ2VyIGR1
cmluZyB1c2VyIGNyZWF0aW9uPyBUaGUgYWx0ZXJuYXRpdmUgY29tbWFuZCBmcm9tIEJNQyBzaGVs
bCBpcyB1c2VybW9kZSA8dXNlcj4gLXMgL3NiaW4vbm9sb2dpbg0KPiANCj4gLSBKb3NlcGgNCj4g
DQo+IA0KPiBGb290bm90ZSAxOg0KPiBUaGUgZWZmZWN0IG9mIHRoZSBmb2xsb3dpbmcgaXMgdG8g
Y29uZmlndXJlIHRoZSBkcm9wYmVhciBTU0ggc2VydmVyIHNvDQo+IG9ubHkgdXNlcnMgd2hvIGFy
ZSBpbiB0aGUgcHJpdi1hZG1pbiBMaW51eCBncm91cCBhcmUgYWxsb3dlZCB0byBjb25uZWN0DQo+
IHZpYSBTU0guDQo+IFRoaXMgY29uZmlnIHBhcmFtZXRlcjoNCj4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvb3BlbmJtYy9ibG9iL21hc3Rlci9tZXRhLXBob3NwaG9yL3JlY2lwZXMtY29yZS9k
cm9wYmVhci9kcm9wYmVhci9kcm9wYmVhci5kZWZhdWx0DQo+IElzIGNvbmZpZ3VyZWQgaW50byB0
aGUgaW1hZ2UgZnJvbSBoZXJlOg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1j
L2Jsb2IvbWFzdGVyL21ldGEtcGhvc3Bob3IvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFy
XyUyNS5iYmFwcGVuZA0KPiBhbmQgaXMgdXNlZCBvbiB0aGUgZHJvcGJlYXIgY29tbWFuZCBsaW5l
IGZyb20gaGVyZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy9ibG9iL21h
c3Rlci9wb2t5L21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyL2Ryb3BiZWFyJTQw
LnNlcnZpY2UNCj4gDQo+IA0KPiANCj4gDQo+PiANCj4+IFRoYW5rcywNCj4+IFRoYW5nIFEuIE5n
dXllbiAtDQo+IA0KDQo=
