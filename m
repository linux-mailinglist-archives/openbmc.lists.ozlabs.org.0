Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02D3750FB
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 10:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbRmq6hTRz301s
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 18:38:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=uu01gIQz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.133;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=uu01gIQz; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310133.outbound.protection.outlook.com [40.107.131.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbRmX11C0z2yxm
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 18:38:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ6jlYHLQ/+VRTaOErcA7SbfkciyZhZgRBPFDlrLuxGMVqaSnsss6OkZqEq9VRSj5vIK2j7S+O0PR5NDC2OPqvhCYRNeW4CDCN8MK2MaURli1fDxHNSlN2il/JuJb4pN1XIWWdNfZSUwcMjg2lKyjmjYysFsJeJnzggMxNvqQTxGsHhufyFo6JA0UO/auYt447KpGqkVfprJPl1mag8UYKwT4iilQJIoi1S78ylZekPCYLmEqQdkOOS8f4NC0yYpDtLLWk1apFs0O7a77+IyeSPgmKQX9FNBhRgn/QJYT/crSpk2P11Kaxsxlm6g6fHQrq7AroPRb+qAJvAjEmJh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d3IWFNWQE4hObE/h3YesOTHiGlj6ArtTb8WO5zMzIc=;
 b=e6fM78Hz8iS3vpJdIZx2Iy1WSIT/B/Nwi/zTAYnN/fUN8VDLlhClN0cQth7Rp/DHUuKBZfessS0y0ayykKng3bQ1lJNQDtRr7JwDKAmYW5JkCVBxU19Na4jJvGHLD5gGlyAR7rzBH5ETXz/wH5lfCCFhjR1snHChGDdeJntmVa9ojKnvdv0iaF4LsT6IHjnbTyQBt02hXrntIKYlLGBeqjpKl5P3TmEN56jdAC9wATV/GgqFdQCzyAh1DFFt7T7fyG1eZAdUMT9LHiTCLOA/WLgZN8UT4q6glnU35p4zWSw/sJF+L+sC6g18RMPXHQsfXH+KbUgAi4COcfyGKSaoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d3IWFNWQE4hObE/h3YesOTHiGlj6ArtTb8WO5zMzIc=;
 b=uu01gIQzMKnXGw+MN1x1RIjXKUpmJVuwxpJcmELDTRvv1VwE1ZsCkjJDOaWOem5gDtzvZBoMMT+nFqdF8Kk7wOMSA+m6u4owT+U+RtOnpRjOYvcuiiO0gxqicBVbJUd6oS5qaKvbwP3rDsylt1/a5ZOKCbhN+1EjOsIPC+fy6Z0=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HKAPR04MB4100.apcprd04.prod.outlook.com (2603:1096:203:de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 08:37:50 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::b561:2087:a4ef:54a0]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::b561:2087:a4ef:54a0%7]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 08:37:50 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: Nan Zhou <nanzhou@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Host Serial Console Logs via Redfish
Thread-Topic: Host Serial Console Logs via Redfish
Thread-Index: AQHXFGRmMf7l2V/JAkegO/w0o87HhqrWe4RA
Date: Thu, 6 May 2021 08:37:50 +0000
Message-ID: <HK0PR04MB329988AFBBD67CB71300390EE4589@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
In-Reply-To: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce21f200-d932-458d-a4bb-08d9106a3bb6
x-ms-traffictypediagnostic: HKAPR04MB4100:
x-microsoft-antispam-prvs: <HKAPR04MB410016AF0F64C66B4B7A01A8E4589@HKAPR04MB4100.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sxus6FcLvmg9zle4L8oXpaqnmS3QF5hJT4P0nL3cGUihwAJCQd6F2QRbQsIMzjIK0I9x9va8nSHgI/hG3Q6iHAQTohXJRsGpwXLwTHTn9czEQNIZzDJOvQXOK6OE0T59bWe6LU36F32QE1TTiIY4RAYbbkUMeJc/0Se7Tizs4pRy6Dxriy7SnjNJZJ+P+SMtUZXe5jlYPu88Xz5PJKZyHFpPv9Ivo+lQp/BVMe9VFnH0d5oZlwbezs04qeYSS4WfpPkQUOfsUfH2CJynjULFcR+UGoh/NQmO0g787db6yvOe09/+tXvekuPUnTCKIqK+tbeuADnt8V0u2Es/kZkbPYtTWns1zjZ5ikrz+lZXaqYSWD0grlhYwYQHjEeCtNJPKdCeLTXs47rDsiz1vOGMrdxoyD8oHJ32ohNPce6Q1rlPH/45n3DNHXt5xOOnWdh11FyUvkRLk8M4zjBZy2a2DSQpbufh/pmfKUqpWQoQ6x8+MmrdLIuhB1v7JRznKokf1igbPmLGmwzFxCZ8PzKJVfIz+1lJkHCNAHiduMgetGaf5Hau0uvlfaliACkBS6UsW2crprZ4CXSZjtKmFJWEwft8hs91f2eK1LKGny52xofOuUWlXaC1HheD1eaVohWl/wJ7z9+VBTVFtAlUH2AaWwEPSA5UsiUZjKpBMldRb80=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(8936002)(478600001)(76116006)(2906002)(71200400001)(316002)(66946007)(55016002)(7696005)(110136005)(966005)(85182001)(26005)(186003)(83380400001)(4326008)(66556008)(64756008)(66446008)(6506007)(53546011)(8676002)(86362001)(54906003)(122000001)(33656002)(52536014)(5660300002)(9686003)(38100700002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?Njc1K2VVMUtUWUt5QndmOEk4UlBkZ3VtL3dvL1h5QzRHVzNDNDhobzlUWTBWYS95?=
 =?big5?B?K3c4alVzTEZONkRXL0ZIczNUSUpnZlhtRmpDTnNVVldKK2JGbERhdFRvT1ZpZ3Jw?=
 =?big5?B?L3QyUzAvWW1hNXFibzJuRXlOWHlKV2lxaC8wWnBnd1F6a3Q2eWcwYnB3cUtwditK?=
 =?big5?B?eG9BWjNEcXRkMWFKMzNoMFAzMkovTHlIN25OOE13elhUd0syaWw1V0w5OEg2Vmoy?=
 =?big5?B?eFlXbzgzb0JXcWhRSDNUbGFtYkJBYlV1aDBiajl1a21nSTIrSE9Qa2l3WEx4enpW?=
 =?big5?B?SndDTnRLK3QzK0RCU0xXUEoxaTNOOE1HZzlLTjRleDZwVWdVUGp4bVRoYlNXRHBi?=
 =?big5?B?MVdhSGdqZ3RoWCsxNkpFQzd1cXhNeDlkZ1RCT21zbmx0bUdHWmRDcEJDbE9NZmJ0?=
 =?big5?B?R1ZyU2FuZzRDbGhrVlJiN25oWkFCemVISloxSkhpUzZ6eHRkSGhlM3NIbktCcUI4?=
 =?big5?B?R2xFQXRmV3JrbzJldElxSEV5bE84T1U0ZGZtcmIvdkVwQjZiYWgvaGRVMjNuREZM?=
 =?big5?B?OXAwMi9yWkNMUE9IejMxLzkvTzZNWmJuZWpaalJ1V1ZORXdISWlGTUlwMXFTVkFt?=
 =?big5?B?a0dlTXd4RlhHZFZjNlZJR0M3MnhUOUo5bkpaVTR3SVFObkJPTHU3dEhwY3FtL2NJ?=
 =?big5?B?Mkx0N2ZIZ0VXaUdHRnovSFlJcTgxNkRFNktMSlpCRks5M3ZDQXVqTzVpNmh2YkJm?=
 =?big5?B?a2UxV2ZDK0ZIV1JWVTJmQlY5N2ZPa2JERmZMV3lvWnZVTDZqaWJ0aks5TmhYVXBo?=
 =?big5?B?M0ZKQStvdDNZWTd6UHI5UjJUZDRuL0dyVW52am1EYlRlbTBOYzJGZjc5a3lSbmpO?=
 =?big5?B?Q0l4SFJMVVJFWG8yRDNVWGIvZC9MZFVtZk1nTjBLSCtleGJ4bzRJcEhsVlZLK2JZ?=
 =?big5?B?OTllaHJIcXZTM3M3VDFjZklJU3VZYTBmTVpIZDliTDJUSFV1UFpKVjZvZUpUcjYx?=
 =?big5?B?R2l1Yy9rWk5IVitSMm42cHlSM2c2bEN0WFpQWkZQUlhNWkVzOEZwc1ZzaS9IVDdW?=
 =?big5?B?Yk8xamM5bFFiRWUyTGJpVjRHVXhDUzByOUx1dkRlakwzZWY4WnlBUkNnY2xVVmF6?=
 =?big5?B?VnNrOGJWVkNreUQ2YXZ4a3pOQUEvajB5S3lBYWdXbXFpbG1ON0pKS2VWWmZyTzQv?=
 =?big5?B?OUdRNjNTaytQY3FLWGxJbURqTUV2STNERmsxRVhrMW5wWGtmeHFVRzB4WEtXck5r?=
 =?big5?B?aVA2UU4zK1QzTXNFTGNMYlV0d2liNFNqLzJ4WVJLc0N1eEZJTUJDNDVWbnovbDM2?=
 =?big5?B?b25jV3BHaS9Sa05La3ZsVWg3M2hLWmhEOUZIVGRCYjJ4MUltcG81eEdsQXgyUGRz?=
 =?big5?B?eUd3NmNhVEVDekpWUGhnSnNNZllQcFpqUEhxTm1BRWxuMk1pRXUyUlArQ0wzTEtn?=
 =?big5?B?SVBPMkxnb3FZVWdlR0pJWmxuTlJxY2V0bUluSnRXRVhKZzhJK0hiTGw1eGM1cndi?=
 =?big5?B?ZWhLY2lGZWo3dXFxQlpKcmFmNjAvY1NRZnRQNkgwQWk2MUkyTXUrYUxSMUYwMG1N?=
 =?big5?B?ZVNKUFpmSTJNcHRlQU9ROGJXenY4MThmdHRyL3NadytXRUZ3WXRpd1JkT1E1azV5?=
 =?big5?B?TTdLd1dBU3ZwWktEcFhrUU5IY3F3Y3RDeDRsVVJSOUdWYVFYa21kZWhhRHljZHZ2?=
 =?big5?Q?MIbSPIJw6zJUZhooO8SjOSFCDrzFAsS0K0ZdjO6w/qZOCYa4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce21f200-d932-458d-a4bb-08d9106a3bb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 08:37:50.2526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysY1x8A8A8Vr9vmvVqNIwNT5oJdjK95nHPvsLVjtoRASsHkQTiGc2dOrLG5E5/I+hTpB+2C4+TnWmHObQxgSwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB4100
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
Cc: Justin Chen <juschen@google.com>,
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 Ofer Yehielli <ofery@google.com>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>,
 Spencer Ku <spencer.ku@quanta.corp-partner.google.com>,
 Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KV2UgZmluYWxseSBjaG9vc2UgbWV0aG9kIDQgKHBob3NwaG9yLWhvc3Rsb2dnZXIg
KyBqb3VybmFsICsgcnN5c2xvZyArIGJtY3dlYikgdG8gaW1wbGVtZW50IHRoZSBmZWF0dXJlLg0K
SSBhbHJlYWR5IHB1c2ggdGhlIGNvZGUgdG8gcGhvc3Bob3ItaG9zdGxvZ2dlciBhbmQgYm1jd2Vi
LCBwbGVhc2UgdGFrZSBhIGxvb2sgZm9yIHRob3NlIFBScy4NClBsZWFzZSBsZXQgdXMga25vdyBp
ZiB0aGVyZSdzIGFueSBpc3N1ZSwgdGhhbmsgeW91IQ0KDQpTaW5jZXJlbHksDQpTcGVuY2VyIEt1
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYw0KPiA8b3Bl
bmJtYy1ib3VuY2VzK3NwZW5jZXIua3U9cXVhbnRhdHcuY29tQGxpc3RzLm96bGFicy5vcmc+IE9u
IEJlaGFsZiBPZg0KPiBOYW4gWmhvdQ0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCA5LCAyMDIxIDU6
NDUgQU0NCj4gVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBDYzogU3BlbmNlciBLdSA8
c3BlbmNlci5rdUBxdWFudGEuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+OyBMaXR6dW5nIENoZW4N
Cj4gPGxpdHp1bmcuY2hlbkBxdWFudGEuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+OyBPZmVyIFll
aGllbGxpDQo+IDxvZmVyeUBnb29nbGUuY29tPjsgRWQgVGFub3VzIDxlZHRhbm91c0Bnb29nbGUu
Y29tPjsgUmljaGFyZCBIYW5sZXkNCj4gPHJoYW5sZXlAZ29vZ2xlLmNvbT47IEp1c3RpbiBDaGVu
IDxqdXNjaGVuQGdvb2dsZS5jb20+OyBaaGVuZmVpIFRhaQ0KPiA8enRhaUBnb29nbGUuY29tPg0K
PiBTdWJqZWN0OiBIb3N0IFNlcmlhbCBDb25zb2xlIExvZ3MgdmlhIFJlZGZpc2gNCj4gDQo+IEhp
IEFsbCwNCj4gDQo+IFdlIGFyZSBkZXNpZ25pbmcgYW5kIGltcGxlbWVudGluZyBhIG5ldyBsb2dn
aW5nIHNlcnZpY2UgaW4gUmVkZmlzaCB0bw0KPiBleHBvc2UgaG9zdCBzZXJpYWwgY29uc29sZSBs
b2dzLiBUaGUgZ29hbCBpcyB0aGF0IGNsaWVudHMgY2FuIHRhbGsgdG8gYm1jIHZpYQ0KPiBSZWRm
aXNoIGFuZCBnZXQgYSByZWFsLXRpbWUgY29uc29sZSAoanVzdCBsaWtlIGEgcmVhZC1vbmx5IHNl
cmlhbCBjb25zb2xlKS4gSXQgd2lsbA0KPiBpbXByb3ZlIHRoZSBkZWJ1Z2dhYmlsaXR5IG9mIEJN
Q3MuDQo+IA0KPiBXZSBkaXZpZGUgdGhlIHdvcmsgaW50byB0d28gcGhhc2VzLiBQaGFzZSAxIGlz
IHRvIHVzZSB0aGUgcHVsbCBtb2RlbC4gVGhhdCBpcywNCj4gY2xpZW50cyBkbyBwZXJpb2RpY2Fs
IHB1bGwgYWdhaW5zdCB0aGUgUmVkZmlzaCBzZXJ2ZXIuIEluIFBoYXNlIDIsIHdlIHdpbGwNCj4g
Y29uc2lkZXIgdGhlIHBvc3QgbW9kZWwgdmlhIFJlZGZpc2ggRXZlbnRzIGFuZCBzdWJzY3JpcHRp
b25zLg0KPiANCj4gSW1wbGVtZW50YXRpb24gZm9yIFBoYXNlIDEgaXMgaW4NCj4gaHR0cHM6Ly9n
ZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvYm1jd2ViLysvMzkwOTMNCj4gPGh0
dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmdlcnJpdC5vDQo+IHBlbmJtYy1wcm9qZWN0Lnh5eiUyRmMlMkZvcGVuYm1jJTJGYm1j
d2ViJTJGJTJCJTJGMzkwOTMmZGF0YT0wNA0KPiAlN0MwMSU3Q1NwZW5jZXIuS3UlNDBxdWFudGF0
dy5jb20lN0M5OWJmNzk0MzEwYTk0NjM2MzY5OTA4ZDhlMjdiDQo+IDg1OTAlN0MxNzliMDMyNzA3
ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0MwJTdDNjM3NTA4MzY3NDcxDQo+IDk5MjU2MyU3
Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdQ0K
PiBNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZzZGF0YT15NHl1cyUy
RmhUZTdFaEYwYQ0KPiBhV2xIcEVSeVRVJTJCYTRxdzh1TXYwN0g4cmglMkYyRSUzRCZyZXNlcnZl
ZD0wPiAuIEl0IGlzIGJhc2VkIG9uDQo+IG9ibWMtY29uc29sZSwgcGhvc3Bob3ItaG9zdGxvZ2dl
ciwgYW5kIGJtY3dlYi4gVGhlIGJhc2ljIGlkZWEgaXMgdGhhdA0KPiBwaG9zcGhvci1ob3N0bG9n
Z2VyIGNvbGxlY3RzIGhvc3Qgc2VyaWFsIGNvbnNvbGUgbG9ncyB2aWEgb2JtYy1jb25zb2xlIGFu
ZA0KPiBnZW5lcmF0ZXMgdGFyYmFsbHMgaW4gYSByb3RhdGlvbiBtYW5uZXIuIFRoZXNlIHRhcmJh
bGxzIGFyZSB0aGVuIGNvbnN1bWVkIGFuZA0KPiBleHBvc2VkIGJ5IGEgbmV3IG5vZGUgaW4gYm1j
d2ViIGxvZyBzZXJ2aWNlLg0KPiANCj4gV2UgZm91bmQgdGhlcmUgYXJlIHNvbWUgaW1wcm92ZW1l
bnRzIGFzIGxpc3RlZCBiZWxvdywNCj4gDQo+ICoJTG9ncyBhcmUgbm90IGV4cG9zZWQgdG8gUmVk
ZmlzaCB1bnRpbCB0aGV5IHJlYWNoIEJVRl9NQVhTSVpFIG9yDQo+IEJVRl9NQVhUSU1FIChkZWZp
bmVkIGluIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWhvc3Rsb2dnZXINCj4g
PGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmdpdGh1Yi5jDQo+IG9tJTJGb3BlbmJtYyUyRnBob3NwaG9yLWhvc3Rsb2dnZXIm
ZGF0YT0wNCU3QzAxJTdDU3BlbmNlci5LdSU0MHENCj4gdWFudGF0dy5jb20lN0M5OWJmNzk0MzEw
YTk0NjM2MzY5OTA4ZDhlMjdiODU5MCU3QzE3OWIwMzI3MDdmYzQ5Nw0KPiAzYWM3MzhkZTczMTM1
NjFiMiU3QzElN0MwJTdDNjM3NTA4MzY3NDcxOTkyNTYzJTdDVW5rbm93biU3Q1QNCj4gV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dp
TENKWA0KPiBWQ0k2TW4wJTNEJTdDMTAwMCZzZGF0YT0wOGllc21rYkZjcXdDcThWd2hqOUx4TzhM
UjF4ZDlTdSUyQm9wbA0KPiAxVnhLRzdZJTNEJnJlc2VydmVkPTA+ICksIGJ1dCB3ZSB3YW50IHRv
IGFjaGlldmUgYSBzdHJlYW0tbGlrZSBjb25zb2xlLg0KPiBXZSBjb3VsZCBzZXQgQlVGX01BWFNJ
WkUgdG8gMSBvciBCVUZfTUFYVElNRSB0byBhIHZlcnkgc2hvcnQgaW50ZXJ2YWwsIGJ1dA0KPiBp
dCB3aWxsIGFtcGxpZnkgdGhlIG92ZXJoZWFkIG9mIGNvbXByZXNzaW9uIGFuZCBkZWNvbXByZXNz
aW9uLg0KPiAqCVBlcnNpc3RlbmNlIGlzbqGmdCBvcHRpb25hbC4gcGhvc3Bob3ItaG9zdGxvZ2dl
ciBkb2VzbqGmdCBleHBvc2UgYW55IElQQw0KPiBpbnRlcmZhY2UuIGJtY3dlYiBjYW4gb25seSB0
YWxrIHRvIHBob3NwaG9yLWhvc3Rsb2dnZXIgdmlhIHppcCBmaWxlcywgd2hpY2gNCj4gbWFrZXMg
cGVyc2lzdGVuY2Ugb2YgbG9ncyBhIG5lY2Vzc2FyeSBjb25kaXRpb24uDQo+IA0KPiBXZSBwcm9w
b3NlIHRoZSBmb2xsb3dpbmcgbWV0aG9kcyB0byBpbXByb3ZlIGl0Lg0KPiANCj4gDQo+ICoJTWV0
aG9kIDE6IEQtQnVzIFNpZ25hbDsgcGhvc3Bob3ItaG9zdGxvZ2dlciBpbXBsZW1lbnRzIGFuIGlu
dGVyZmFjZQ0KPiB3aGljaCBjb250YWlucyBhIHNpZ25hbC4gVGhlIHBheWxvYWQgb2YgdGhlIHNp
Z25hbCBzaG91bGQgY29udGFpbiB0aW1lc3RhbXBzDQo+IGFuZCBsb2cgbWVzc2FnZXMuICBCbWNX
ZWIgcmVnaXN0ZXJzIGFzIGEgbGlzdGVuZXIgYW5kIG9uY2UgaXQgcmVjZWl2ZXMgYQ0KPiBzaWdu
YWwsIGl0IHBvcHVsYXRlcyBhIG5ldyBMb2dFbnRyeS4gQm1jV2ViIHNob3VsZCBpbXBsZW1lbnQg
aXRzIG93bg0KPiBjb25maWd1cmFibGUgcmluZyBidWZmZXIgdG8gc3RvcmUgbG9nIGVudHJpZXMg
cmVjZWl2ZWQgZnJvbSBELUJ1cy4NCj4gKglNZXRob2QgMjogRmlsZSBXYXRjaGVyOyBhZGQgZmls
ZSB3YXRjaGVycyBpbiBCbWNXZWIgdG8gbW9uaXRvciB0aGUgbG9nDQo+IGZpbGVzIHByb2R1Y2Vk
IGJ5IHBob3NwaG9yLWhvc3Rsb2dnZXIuIFRoaXMgbWV0aG9kIGlzIHNpbWlsYXIgdG8gbWV0aG9k
IDEuIEJ1dA0KPiBwZXJzaXN0ZW5jZSBpcyBzdGlsbCBhIG5lY2Vzc2FyeSBjb25kaXRpb24uDQo+
ICoJTWV0aG9kIDM6IG9ibWMtY29uc29sZSArIGJtY3dlYjogaW5zdGFsbCB0aGUgY29uc29sZSBj
b2xsZWN0aW9uIGFuZA0KPiByaW5nIGJ1ZmZlciBwYXJ0cyBvZiBwaG9zcGhvci1ob3N0bG9nZ2Vy
IGFzIGEgbGlicmFyeS4gVXNlIHRoZSBsaWJyYXJ5IGRpcmVjdGx5IGluDQo+IEJtY1dlYiB0byBj
b2xsZWN0IGNvbnNvbGUgbG9ncy4NCj4gKglNZXRob2QgNDogcGhvc3Bob3ItaG9zdGxvZ2dlciAr
IGpvdXJuYWwgKyByc3lzbG9nICsgYm1jd2ViOiB0aGlzDQo+IGFyY2hpdGVjdHVyZSBpcyB2ZXJ5
IHNpbWlsYXIgdG8gd2hhdCB0aGUgY3VycmVudCBPcGVuQk1DIHVzZXMgZm9yDQo+IHJlZGZpc2gt
ZXZlbnQNCj4gPGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jDQo+IG9tJTJGb3BlbmJtYyUyRmRvY3MlMkZibG9i
JTJGbWFzdGVyJTJGYXJjaGl0ZWN0dXJlJTJGcmVkZmlzaC1sb2dnaW4NCj4gZy1pbi1ibWN3ZWIu
bWQmZGF0YT0wNCU3QzAxJTdDU3BlbmNlci5LdSU0MHF1YW50YXR3LmNvbSU3Qzk5YmY3OQ0KPiA0
MzEwYTk0NjM2MzY5OTA4ZDhlMjdiODU5MCU3QzE3OWIwMzI3MDdmYzQ5NzNhYzczOGRlNzMxMzU2
MWIyJTcNCj4gQzElN0MwJTdDNjM3NTA4MzY3NDcyMDAyNTU4JTdDVW5rbm93biU3Q1RXRnBiR1pz
YjNkOGV5SldJam9pTQ0KPiBDNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhh
V3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJg0KPiBzZGF0YT03c1ZMaU9EZldzJTJGVm1mQTUlMkZK
d1M2RzZ0NUwlMkZvN0pmeSUyQjh6cTNnYm9KM3MlM0QmcmVzDQo+IGVydmVkPTA+IC4gQWRkIGEg
bmV3IHNjaGVtYSBmb3IgbG9nIGVudHJpZXMuIFB1Ymxpc2ggam91cm5hbCBsb2dzIGluDQo+IHBo
b3NwaG9yLWhvc3Rsb2dnZXIuIEFkZCBmaWxlIHdhdGNoZXJzIGluIEJtY1dlYiB0byBtb25pdG9y
IHRoZSBsb2cgZmlsZXMNCj4gcHJvZHVjZWQgYnkgcnN5c2xvZy4gcnN5c2xvZyBzaG91bGQgaGF2
ZSBsb2cgcm90YXRpb24gZW5hYmxlZC4gUGVyc2lzdGVuY2UgaXMNCj4gc3RpbGwgYSBuZWNlc3Nh
cnkgY29uZGl0aW9uLg0KPiANCj4gQmVmb3JlIHdlIG1vdmUgZm9yd2FyZCwgd2Ugd291bGQgbGlr
ZSB0byBzZWUgd2hhdCB5b3VyIHByZWZlcmVuY2UgaXMuIFdlIGFyZQ0KPiB3aWxsaW5nIHRvIHNl
ZSBvdGhlciBzdWdnZXN0aW9ucyBhbmQgYWx0ZXJuYXRpdmVzIGFzIHdlbGwuIFRoYW5rcyENCj4g
DQo+IFNpbmNlcmVseSwNCj4gTmFuDQo=
