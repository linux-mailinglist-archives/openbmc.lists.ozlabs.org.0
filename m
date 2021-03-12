Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52323346CE8
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 23:27:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4mFG214zz3bcq
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 09:26:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=U27ERb/v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.94.60;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.cy.kao@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=U27ERb/v; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxwvm0hdgz3cJK
 for <openbmc@lists.ozlabs.org>; Sat, 13 Mar 2021 06:33:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2XPD/Qz3lFdtIv16RLwFfJpKVCBBnJp44pdQ3ThTt4TsmiOKvD47+vdsxXGmRXVmppb2XJ/ZCQ1xHuipY3HOkXJO4aH8QPbM23hbNLuQrbfMwTShpWJhrwJXk1FebE1fLGfEMSPKZXEuw2Bc1gcLcXD8cdShdI9JN3s7iUAggN7Jfa/ae3/KADVgDrTmXsvZvEzDtGzSKmGo6VMeXkd7IPfoPpslZUqUg5Z2wa8ecidVPgjWfCm2q5p1g/ybOtf2WMd+Nl0YY0DLicdQgPc7ry+E6uMRJJTd0wkaxm0+GRF8TlllAisVwwru3ScaPg35eEYBPvWfDe9p7E/pQSKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIOZQCYA/PGRqDQJ6CkpcVayiZVMdoxXIZNqEwRsQyQ=;
 b=AUGLhVPxWF0EZgTiQdaSGEh3zbywzJHlQnGTCeSnkFWjBWBd5a9HsadM/nIZjDJN9NjWpvrEHlUQL/ybQ4QDEKqT0g4ubgMUpdL7mlCLolESugxr1qEXL8xqBMjNQIlLW+YWLWrSol3FKv0B7FjsxpI+YtCMIHG6GHExx5Yc8JIpijJhBNN4B28GlAr3Zo5acW2S+1RVL45MEBcMoWUc5S4vk+gs1ffx+Rdtd5sGLLsumCjwZKq8l8zxKcC0owWWIzNnV51PlVwUMsg6+Ay6xXajgeL7V7mpnpCcx+uLOqQulwVNzwf4k0jrg4PShuDHiQ1MLPBKfOSO9eW6l1wUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIOZQCYA/PGRqDQJ6CkpcVayiZVMdoxXIZNqEwRsQyQ=;
 b=U27ERb/v6u9sLi79Fu/wlSYkExWh2s5tb6vNhMiyjKSbvfPkAHAMOPN+UD2zYIssyycqb7TgdD2oOVbuqmgKjbdr61gMcRPZ6c1srDbmxqs5Fwt0b5mxPWAcyOiVelXrNg28r5DL6fIrZniYgX19Q2cbvrb2udsqINe+vkSA6yzcAFIHjUIdz86MlhuGSKsS4uSFOzV17azRX1TKONJevenQhiiAP0hVLEUEo+DGzxUOBkxVo9m3A+XKIVoDMnGfRa98fmLLANM/d61/JFPwE0VLyOb+e2mmoFccGnTZttkx3FJCKQqP4wiP/+bg1bvLiYSBk3qoXZUzFQ0SWZ1jGw==
Received: from SN6PR08MB5087.namprd08.prod.outlook.com (2603:10b6:805:73::11)
 by SN6PR08MB3965.namprd08.prod.outlook.com (2603:10b6:805:21::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 19:32:59 +0000
Received: from SN6PR08MB5087.namprd08.prod.outlook.com
 ([fe80::18be:ce2:a837:e61a]) by SN6PR08MB5087.namprd08.prod.outlook.com
 ([fe80::18be:ce2:a837:e61a%5]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 19:32:59 +0000
From: Lancelot Kao <lancelot.cy.kao@fii-na.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Subject: group for foxconn CI / fii oem repo 
Thread-Topic: group for foxconn CI / fii oem repo 
Thread-Index: AdcXdflGL+FGFMTlSM6XVXSLHUuYWP//nHyA
Date: Fri, 12 Mar 2021 19:32:59 +0000
Message-ID: <988A363C-0A57-4B5D-BDDA-5D6F61B9574A@fii-na.com>
References: <BYAPR08MB5207126C4F83094A41DEE01CF16F9@BYAPR08MB5207.namprd08.prod.outlook.com>
In-Reply-To: <BYAPR08MB5207126C4F83094A41DEE01CF16F9@BYAPR08MB5207.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.46.21021202
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 763bab6e-7054-4028-fb68-08d8e58da539
x-ms-traffictypediagnostic: SN6PR08MB3965:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR08MB3965F1634BD81EF0EB0823E89C6F9@SN6PR08MB3965.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NHS0mg3QnUK80s14PpJvMASYroQWiHI/51QSq0AdqiYkGHsxsoyxnzusc9p0UEZXiFyWk3HvoCT3Ey2xI5uRmtj2kxyMw1jUBEnqmzQUjQbN/8unNs54Ujlh8QnayV0GTLiCh/3kp6Y9Kxmtj5OvY4thBwgFqr/UZz4R3uhSHszAkGzeL1MvpInnEL3e1sX4ZP+eZHHHTP/obK5uVHYIdKCA1vsBWJtaPzcfQ1Zq3Xr9aG1i8ZH8xWONWqzHz5kF8PF4EtjnAUd6X/yW0oG93uMETK4QztzRJ+99Z/JYsJMUSweDepIYUKBRpGRbXUZvrBX0aYaFSNldVuBd0EUE4XeFZGN7ku0WyXhdsUWaSq/raT/iRx/5QsfOyGV9DOORVv/u5idut9184VE7z8mDLP4DJ6ZJ5Jq+KF7I2GeU/16n295meJ2Ou/GAInyX76v7U4XOXMmWCKVIvs1YLRThh6jg1rU7HzeQ0VfQtfDrrbWv3qOlfMZqHP/H9KRasZTaJd6mw8r4Af/bpAIqhmvhYnSlw2EWRk9EeuuBofYlQt2rYXtpo1oRAg71GEOGSIng5rBjDozpT+KcGG2l0QQ/SiLr9Wt0eH+QhWnjNB4kC2GZrbHjFRbcU/lKcUmst8NU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB5087.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(136003)(39860400002)(36756003)(64756008)(2906002)(8936002)(76116006)(66446008)(186003)(4326008)(33656002)(71200400001)(2616005)(66946007)(66476007)(478600001)(26005)(6512007)(316002)(66556008)(5660300002)(558084003)(107886003)(6486002)(4743002)(8676002)(6506007)(86362001)(110136005)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Qmo3OGdOaWxiZ3k2VW5DQ0JvTXd1TFNuTEo5NkhobVIyNytLZXVFZGhuVmZH?=
 =?utf-8?B?MnE5UEdaNlFJRjNWb2xoL0NmL3dITTlaNmUrOTVDck5NcFRMcmFiQUwzUDZw?=
 =?utf-8?B?QXdRZnhHR2w3NTlndWJRT0RHYlpRb2pGaEZWMkxZc2UrSi9uZjc5a0ZsZngv?=
 =?utf-8?B?TjB3Sis1ay9yaGM5bGowbzBlSHJhczBhOElEOHFodHVHN0NYb3pPUTZCazBX?=
 =?utf-8?B?ZXhnT2x1a3NORnZyV3dsQ0d4bG42bTFQeGIzLzNHVG12L3lUaGM5bmpweG1J?=
 =?utf-8?B?cUZIWGNMYWJEbkc3bDlSMVBqOUsrTmtYMklXLzZabWdlNmttVXNab0JqUmp6?=
 =?utf-8?B?UUFxblgwTlJSVzhaNXM1bllIbGFZMktHWjRuekZWNWpES1lxY1J6NWFJSUJ3?=
 =?utf-8?B?V0Nac2JaZGhVSzlXWDhuaENrZEliUjduWWdVRWlpcXhTTHhTWW54cXpjZ0J1?=
 =?utf-8?B?TXBwUElQZDJ4Y1B2ZmU5UEJRMU4xNE53LzBjTnVyNC95RkNWbTRCYmlFVzR0?=
 =?utf-8?B?NHRIM2V6L0U1ZjE3NnVHeW80UkZOVWlsSm5LOFlldEkwemFjMzFaQ0JzU2dK?=
 =?utf-8?B?Q05KYm1UOU1Zb2x4MkljYWFhZEt3T0dOVHFkNnhWblF2WnR4L0dxdVpSR2cw?=
 =?utf-8?B?R0xkL2VoS1FWY08ydTRjZjd5SS9MMHF1MUpUOEFYdDBzcHdXdVYrQmJXa09t?=
 =?utf-8?B?emM2WDlZcWxzNzBoNGlKdnljYzR5SXNRZTF5WUZ3dnhwZXRIa0Zmbi9RTS9n?=
 =?utf-8?B?dC8rRnUzeEExOERiY0VkdTVqQTV3a29odXlyb1Z2T0F4UnNPNmtkcnJLWVY1?=
 =?utf-8?B?dFlXTXRxaXhXZ0ZXdUh5RWNXSnIzWkE1Zk1Wd1o3UWdTdUhtUG9OanV0ZzIx?=
 =?utf-8?B?Qzh4aC9EUDcxSU9lWWVYbVNwUFRUVWhDT2tWRmlDZjFjd3BpSnJJOTNuL1pY?=
 =?utf-8?B?TW9uU2R3V0NSM3ZYaWtNa0luQmoxV0VDMEsxVFJndEJvbXU3ZGYzV0VrK3pF?=
 =?utf-8?B?ay9ZK3FmWkZUcTgzMGk4NE9leUhUdzdyb0grVjV3KzJuaUMwcjNZRDJ3ampL?=
 =?utf-8?B?UDZJZzI5dk5YSC8yS3lvMVdYQjhIWmRUTXlRdHNleGRoNmJBZUxTcDJtT2ly?=
 =?utf-8?B?Znl6Q1RQRG1QNnFoVit4SmdXK240WjZMb0JXaVI2R3ZlUWJVN1hpR3grczVH?=
 =?utf-8?B?NkZES2VBN2hCU0NCejBZNTdwZTV3R0FzakJPRlZ1UU1sYmVZK2xySDVXbU16?=
 =?utf-8?B?R1hKV1VJNVdqUWFMdGRmQVBLMUNiTVJzZVJnZXFtMzFYSUtUcnoya1BVVUhT?=
 =?utf-8?B?c2FsOU82T0ovMVBxZzVKVE9GQmlMYmhIYm9ZbkhGcDliREF4VDlCYU1peVdB?=
 =?utf-8?B?eWxLWmowR0M0ajdMTElSbWxXYWZpcU1NVGNsUWxoUWxtOGhGUVJlYWNqNEIy?=
 =?utf-8?B?Y3NiTEFBdFhPb09RbkNHWFprQUtTSFpxcEpGc05SRXd3dzRMS05hVm43K1BR?=
 =?utf-8?B?anBjdCs3NGZydm5ZdG1aVWJQR2RRT044VDBMYk9XRjlaQVRrWUd0UVEyZ3Vo?=
 =?utf-8?B?ZXNyQ2tuS2ttZ0lLNTBZclVhQ25PMEF2Z093dTJDQXYwdmVhRXp1c09VV1FH?=
 =?utf-8?B?eU51SW9KOFhsMzY2SFB1RFFOWGJYcDV4OThyUHd4dGpVWEsyNElvZjhURE9C?=
 =?utf-8?B?Q0k4T0l6eFJJOXJsTEtYYitWY3NCWnBTZ3dJMmp6UWVxdVROWW9EOHFaTm5H?=
 =?utf-8?B?ZEhKanBORFBiWEFQWEc3dUJYVVRiU1NBQ1doUml1RktwaDFoNUsrQUp2akE0?=
 =?utf-8?B?cW00Vy90N0pocXhhNWRCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23331E77DFC82D43888587B0628ECAF1@namprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5087.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763bab6e-7054-4028-fb68-08d8e58da539
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 19:32:59.6985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hg6vilOm3HUheaUkz/HU1lJCqtjhZYDZlwZW0ZCU1Gj7PXqlK2qL4Nt0PNeRaUjgy0NRLUm6wufWuJAMTDOcESU8vd8uOo4CDNoMxw/jRXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB3965
X-Mailman-Approved-At: Wed, 24 Mar 2021 09:25:27 +1100
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
Cc: XP Chen <Xiao-Peng.Chen@fii-na.com>,
 "vveerach@google.com" <vveerach@google.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCwNCjEuIEhvdyBjYW4gd2UgY3JlYXRlIENpIGdyb3VwIG9uIGdlcnJpdCBhbmQgYWRk
IHBlb3BsZSB0byBpdCANCjIuIHdlIGFsc28gbmVlZCB0byBjcmVhdGUgbmV3IHJlcG8gZm9yIHRo
ZSBGb3hjb25uIGlwbWkgb2VtIA0KwqANCkNhbiB5b3UgcGxlYXNlIGhlbHAgd2l0aCB0aGF0Pw0K
wqANCsKgDQrCoA0KDQo=
