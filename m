Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E271F7E778D
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:32:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=2wDzF6UR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNBk5qfCz3cS3
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:32:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=2wDzF6UR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::716; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=jerry.wan@quantatw.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQvgQ5Ngnz3bWQ
	for <openbmc@lists.ozlabs.org>; Thu,  9 Nov 2023 19:06:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMbUBqs+lTi0w38rlQ0NEku17lb9BzlWLaNqgUs/KlddL6nnz7yZmj9Q1O8GgU3Cqg+OeYh2Zz5URM/nNkqeGwm3NGM8DeBY46T8PsukNfRRBa/5L4lcZE4/rhVFLq48LhKwTzp2GIm/49p9Fgxf9G2SU/BSFO7SbhFUxRXa0TEZbIIclqmY1IsjP0Xq+6809NNiT1zIIQcRMS2guus8kA7zzf3Ho/cpbKT0B2NAKRhTQmDNKFscmZPo6JyJmxFPq/DOLVWDBBxfoYJXyF+XLXM98V5pFwvjJAcMUc4P8RlTPLY2hPXSVakcJKaOoOLilJf/8f0F+H9LOvgqjFeKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVuIhgwIzfkkdS03IYPwVcdrd2T44sG4iMhj6Tv0m48=;
 b=V+Au5rktQeXgeZfH2LiATeKCN5fDcFLCxkFhNKLyRzWbbZmAaRTGBvk4hSvic8RV5p5JhNabqPb/mXYYwxskuq51OJLICjOtQksTa8Eu7ANSfhcr0QLMyKb4U6bdpfAwa+uH4yXYCKXvu1CEz2GYOCwC3l0MiZEwn6AkcfzZYtKFseDSBcHh+yYnxBObxOfkcs27eWWiGxMkFbmeTkWUSe8SrllBBQFQRU+SjRtzl4xzCQgCnHihvpNgkvZ+RBftCuRoT6xcBa5bH5ID2km+tBcO0JmyQbmXdNUinc8wLnXBDLKdKghatDeDh9GYQbnq/T3ggkKmn6BHpF6MaJkRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVuIhgwIzfkkdS03IYPwVcdrd2T44sG4iMhj6Tv0m48=;
 b=2wDzF6URfKUZ3Z4WhpwUk71EHUETNqXgppy3qxhs4PR6hmqdVptGUmgPi+m3FPrsHG5huvDMAyTFpN05pZBz8jBCE7Kj+ND3XptJhLVUj74uEzgxo9+Kfj/iefhpJ/nFd7DZHtjEavuZ8pHAUQXVW0FtfxOitc9iFRc6JsYz/BI=
Received: from PUZPR04MB4867.apcprd04.prod.outlook.com (2603:1096:301:b2::5)
 by TY2PR04MB4016.apcprd04.prod.outlook.com (2603:1096:404:8010::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 08:06:36 +0000
Received: from PUZPR04MB4867.apcprd04.prod.outlook.com
 ([fe80::8ac7:be56:7c9a:c944]) by PUZPR04MB4867.apcprd04.prod.outlook.com
 ([fe80::8ac7:be56:7c9a:c944%4]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 08:06:36 +0000
From: =?big5?B?SmVycnkgV2FuICi4Va+nucUp?= <Jerry.Wan@quantatw.com>
To: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>
Subject: ipmi: Inquiry Regarding IPMI User Password Testing
Thread-Topic: ipmi: Inquiry Regarding IPMI User Password Testing
Thread-Index: AQHaEqhJx3V0JTG3/0WH7RYDi1+V6A==
Date: Thu, 9 Nov 2023 08:06:36 +0000
Message-ID:  <PUZPR04MB48670ADEFA76685E7FC585EB88AFA@PUZPR04MB4867.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB4867:EE_|TY2PR04MB4016:EE_
x-ms-office365-filtering-correlation-id: aee235a6-98fc-4cec-f6a1-08dbe0facb7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  m7RPwl50xWu9jV3t8aLIYEEvWsmAcFv0zJIcjManEeriLMBaM1Ktog7uuA//ECfDYkuZVLvvLCh67kSG56MJp65vB2y+pUOTJbQbFM1BgEVaTh5Xcqyv9IhmXjEshCSDX9Y+tFBf6E4AqUxaVHSxYIXYFpBMQg44ozuKyh+CgETwgjX+7kG2uKfQGq54smD84deB6ktsEbfBWJgRHQHJpRnrxdR4oFrpT3eUSQU6luZsLwA/6kRCWkp91aWRfbKjb0gZegnkb1V2/RTZWnI0mpKxGJbF6XtzL7H3XuRwc0jT7+1cbPX+U3AKDWooPp4MzXMHIMdx4TkSovkYZ22jf8BOVCuc2DyGnJ4bEe9/kYwXjKn24+LcgsAlCzwEsDC56R+Bzc6bd5EoMd0AT1ATsW253/+Ps9gcw8HJ3shgpbYKahKtpp4pxmf/qlao3l70oRA4s53w+k1fB54PSt/1wOKscaTbewuVv4WXlFycVfrYP+QH2O/6bxziYk38yyZh5uU4swgse3s2H1UmLKy1jVaUVeJweCsB4QYFxA67FqhAMPU7NmswqmDtZ1rREk0IP1tzfXFJw7VjMaJ8+Hj3EtH0QHdwW7jrFAhH09YWQbNCJVVgDTy+7daY+W0aW2yIk2JuiUw4TA16emlV7vhvlQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB4867.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(136003)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(55016003)(7696005)(6506007)(83380400001)(19627405001)(71200400001)(9686003)(122000001)(66946007)(86362001)(2906002)(41300700001)(33656002)(4326008)(5660300002)(52536014)(66556008)(8676002)(8936002)(85182001)(76116006)(91956017)(6916009)(64756008)(66446008)(54906003)(316002)(26005)(478600001)(3613699003)(66476007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?bXo5b0pzTW5xZ053Q3AxZUhPWldGYkRLU2JQTVozNC81MHJaWC9FNnNTZkl3Ykhx?=
 =?big5?B?bmhBTTNSV3ovQ1hDN3VXbXZOVGpMMGlkSDRpamFlQS9MQld6dGg3VkFOVDhVMlJu?=
 =?big5?B?dld6dmQ4UksrT0h0akhkZGdnVVlVU2thYlg3cXNwV3BtYU9SSHlVS3dCbUo4MnZh?=
 =?big5?B?aVZ6OWl5VXFJM0x1QmJsaml3ZHF3Y2hNVmZTSEYwY21YM0hnSDE0S1lNTU1sU094?=
 =?big5?B?WTB0dk5icTgyNEtSeTNNMWRNUG4yTnN4c1FJVmN4WWtjeHNuWERlRU1FbmJrZDdO?=
 =?big5?B?WmxLNWlFaThVUklLbGQvYWFHOGRYc3JKajFsSTJidXFpSFM1WE51RVd0OEZIV2Nl?=
 =?big5?B?UnRPQUp5bTNTYlZnVUx6bWR4WnNEYTgxM0hHVVJXNjZobG5sZVNzN29JanpZeFB2?=
 =?big5?B?TWZuSlh6TEdPaXQ1MUtQSkRQMEpWTzlQeDBZMHUwZHBtYVZHa0w4VGNrOTkwbWtl?=
 =?big5?B?WmdDY0k1ZFhONDhrdG9FU1JKOVJFd2x5eTZCVjdOQi80RE85VjYwelB0dWVEZ2xw?=
 =?big5?B?OVh1VndweGozckhjODFsUm0xczk0L0VzTWhmNzhrWHM0Vlhid28xazVrYUp6UnZK?=
 =?big5?B?OFRjN2VIcmRaUU1vdTNQQml5WkpqckRzV2RsUktLeTZjeUJYQ0xGNG1nZ1FJcjc4?=
 =?big5?B?MnN3K1RlVmZVN0RES05mVHRSTVVveEN1N3RZVTJkRzdlRHRmd1ZMWE0yU1psQnFG?=
 =?big5?B?QnJjS1ZpM0hiNjdhNEV0R2JBMHJ5bG54bWNOUnlrV2VoS0pOTHh1cnBqNGkvZ1p5?=
 =?big5?B?Qko0dnhjSGJRc05XTW0wcEF4ZnlBNnRhRG04YUUwaDM1eEViU2tpNWp2QkVYZWJO?=
 =?big5?B?c0ZhWm5NYVArU0tGRFkrRUJLc1ZQN3lwalBMTFUvSFV6WXY1RVh5eWs1aDJWTFEx?=
 =?big5?B?Y05CYUNsbmFRSllCODJCK2U1S2lad2xzVzgwT1BRZHAwbDJkNHVVVmtnR1Z3U1Ju?=
 =?big5?B?WTByRkxLZFZzaTVMdTBYbHc2dTlHWmtpS0kxclN4M2tpNmwxM0VMcG1yVzgvUDhi?=
 =?big5?B?WXpFdFRuMDNleFBFWFBIU244TzBhSUZSZklpdk1wN0tsekc4bGZkVFlRVE1jRS9F?=
 =?big5?B?bXB0eGdvYmhwUmlyTnNrVC8vdUhISFRqYVdGRnkzYk00VldOQTk2K3BSTUMxRFg3?=
 =?big5?B?bVJtUm1ZOUM1dXYyQWY5Tk52eFEvdm9SeXVuaUpBOEVIei9yVklhRVpDRnYyZEZJ?=
 =?big5?B?K3VtSm5Qam15aWhoZFFXeEpFR0VsRGx5S2U3aGhsditRU0gxY0V6ZUx0d2JOaEd2?=
 =?big5?B?M1hOWng3Um9yaWhRUzExU3U2ZWxnd1FEL2ZCdGZ6Tm5ENmllTjNHN3VJNXpVYTdP?=
 =?big5?B?cm9pTDBQSHZSN1YvRkdNQU8zc1ZvZWVnVkRhY3dvRXV2eFA4UElmaXRwNGU5dEZO?=
 =?big5?B?NHJZZjNnU1huM1lHQzk3d0JqR1ZTTElVZFJ1YWF3K2tRUTBodlF1d3kvSGJPNDY5?=
 =?big5?B?M1crR1J0Y2gyWGtZV1VKSUtjUFFmb1hBSEg2TFozYy81cW5RU3ErNDFBNDNkbnMz?=
 =?big5?B?eG4yRWVvVUJmRER4eno5UDhJY2VTSTFVSVFKaU9YV2ZKdkpPSzFLaERLRTRpR2ps?=
 =?big5?B?d2lQTW5JcDI0TEhMQW5IQkZNbFdmR1hwTnZSWW1kNFlRT011QTJGMW1VcXIzYVB1?=
 =?big5?B?OExHUGwra0JpTW5LQmVSemJWREhMQ1RsZGVRK3JqMzVLaHpFRVREakEvTk1iMUVW?=
 =?big5?B?ZE5JdUxHNGU3QzYvT3VkNGFPS0lmOGNHb3pJTUVhcy9WaVVXR1ljYjREcmh2MXdN?=
 =?big5?B?SlR2SGtnTlZ1Z0NiVTNreFFaSEJWenpwd0xZREgrQVRidHIwR2Y4QTd6bXJIdGJm?=
 =?big5?B?T2psdUUrTkxEUW5EUFJVSUpLRGozN1hYTUhhU0N6ZlZpV0h3c0lrTFBuMU1Oc2NJ?=
 =?big5?B?bitxV2RicExWRDRhVndvc0ZTMnU2WmJjTmpZVVdibXVORlhFK3pHWjZSOU84Qm1v?=
 =?big5?Q?vMJdj8enpgw6JUMAlq5dzqapKeQpQaYLQjGOBBAvSl4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PUZPR04MB48670ADEFA76685E7FC585EB88AFAPUZPR04MB4867apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB4867.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee235a6-98fc-4cec-f6a1-08dbe0facb7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 08:06:36.2980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPWzE7y/9nPecm+G/VtLmjQUNXPgBSlBHW9xpZRKbu4AYumgraiEGPmAcwZQhARvWa2r4aY6vQ6halbxz8EBlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4016
X-Mailman-Approved-At: Fri, 10 Nov 2023 13:24:09 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PUZPR04MB48670ADEFA76685E7FC585EB88AFAPUZPR04MB4867apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgVmVybm9uLA0KDQoNCldlIHJlY2VudGx5IGNvbmR1Y3RlZCBzb21lIHRlc3RzIG9uIHBob3Nw
aG9yLWlwbWktaG9zdCBhbmQgZm91bmQgdGhhdCB0aGUgdXNlciBwYXNzd29yZCB0ZXN0IGNvbW1h
bmQgZG9lc24ndCBhcHBlYXIgdG8gYmUgY29tcGxpYW50IHdpdGggdGhlIElQTUkgc3BlY2lmaWNh
dGlvbi4NCg0KV2UgdXNlZCBhIDIwLWJ5dGUgcGFzc3dvcmQgdGVzdGluZyBjb21tYW5kIHRvIHZh
bGlkYXRlIGEgMTYtYnl0ZSBwYXNzd29yZCwgYW5kIGl0IHBhc3NlZCB0aGUgdGVzdC4gSG93ZXZl
ciwgYWNjb3JkaW5nIHRvIHRoZSBJUE1JIHNwZWNpZmljYXRpb24sIEkgdGhpbmsgdGhlIGFib3Zl
IHRlc3QgY29tYmluYXRpb24gc2hvdWxkIHJldHVybiBhIGZhaWx1cmUuKFBsZWFzZSByZWZlciB0
byBJUE1JIHNwZWMgMjIuMzAtU2V0IFVzZXIgUGFzc3dvcmQgQ29tbWFuZCwgcGFnZSAzMTMpDQoN
CkhlcmUgaXMgdGhlIHRlc3RpbmcgcHJvY2VkdXJlOg0KDQogIDEuICBDaGFuZ2UgdGhlIHVzZXIg
cGFzc3dvcmQgd2l0aCBhIDE2LWJ5dGUgZmxhZy4NCnJvb3RAZXZiOn4jIGlwbWl0b29sIHVzZXIg
c2V0IHBhc3N3b3JkIDUgUGFzc3cwcmQgMTYNClNldCBVc2VyIFBhc3N3b3JkIGNvbW1hbmQgc3Vj
Y2Vzc2Z1bCAodXNlciA1KQ0KDQogIDIuDQpVc2UgYSAxNi1ieXRlIHRlc3RpbmcgY29tbWFuZCB0
byB2YWxpZGF0ZSB0aGUgY29ycmVjdCBwYXNzd29yZDogUGFzcw0Kcm9vdEBldmI6fiMgaXBtaXRv
b2wgdXNlciB0ZXN0IDUgMTYgUGFzc3cwcmQNClN1Y2Nlc3MNCg0KICAzLg0KVXNlIGEgMjAtYnl0
ZSB0ZXN0aW5nIGNvbW1hbmQgdG8gdmFsaWRhdGUgdGhlIGNvcnJlY3QgcGFzc3dvcmQ6IFBhc3Mg
PD09IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgYSBGYWlsDQpyb290QGdtczp+IyBpcG1pdG9vbCB1
c2VyIHRlc3QgNSAyMCBQYXNzdzByZA0KU3VjY2Vzcw0KDQpDb3VsZCB5b3UgcGxlYXNlIGNvbmZp
cm0gaWYgbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0Pw0KDQpBZGRpdGlvbmFsbHksIGFueSBp
bnNpZ2h0cyBvciBzdWdnZXN0aW9ucyBvbiB0aGlzIG1hdHRlciB3b3VsZCBiZSBncmVhdGx5IGFw
cHJlY2lhdGVkLg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoLg0KDQoNCg0KQmVzdCBSZWdhcmRzDQoN
Cg0KDQpRdWFudGEgQ29tcHV0ZXIgSW5jLg0KDQpzb2Z0d2FyZSBlbmdpbmVlcg0KDQpKZXJyeSBX
YW4NCg0KDQo=

--_000_PUZPR04MB48670ADEFA76685E7FC585EB88AFAPUZPR04MB4867apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; colo=
r: rgb(0, 0, 0);">Hi Vernon,</span><br>
</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"flex-col gap-1 md:gap-3">
<div class=3D"flex flex-grow flex-col max-w-full gap-3 gizmo:gap-0">
<div data-message-author-role=3D"assistant" data-message-id=3D"e8626ac2-e04=
8-41ef-9c92-fadadff56cae" class=3D"min-h-[20px] text-message peer flex flex=
-col items-start gap-3 whitespace-pre-wrap break-words peer-[.text-message]=
:mt-5 overflow-x-auto">
<div class=3D"markdown prose w-full break-words dark:prose-invert dark">
<p class=3D"ContentPasted2 elementToProof"><span style=3D"font-family: &quo=
t;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);">We recently</s=
pan><code class=3D"!whitespace-pre hljs language-vbnet ContentPasted1"><spa=
n style=3D"font-size: 10pt; font-family: &quot;Times New Roman&quot;, Times=
, serif; color: rgb(0, 0, 0);">
</span></code><span style=3D"font-family: &quot;Times New Roman&quot;, Time=
s, serif; color: rgb(0, 0, 0);">conducted some tests on phosphor-ipmi-host =
and found that the user password test command doesn't</span><span class=3D"=
HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span class=3D"ryNqvb" styl=
e=3D"font-family: &quot;Times New Roman&quot;, Times, serif; color: rgb(0, =
0, 0);">
 appear to be compliant with the IPMI specification.</span></span></span></=
p>
<p class=3D"ContentPasted2 elementToProof"><span style=3D"font-family: &quo=
t;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);">We used a 20-b=
yte password testing command to validate a 16-byte password, and it passed =
the test. However, according to the IPMI specification,
 I think the above test combination should return a failure.(Please refer t=
o IPMI spec 22.30-Set User Password Command, page 313)
</span><br>
</p>
<p class=3D"ContentPasted2 elementToProof"><span style=3D"font-family: &quo=
t;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);">Here is the te=
sting procedure:</span></p>
<ol data-listchain=3D"__List_Chain_151">
<li class=3D"ContentPasted2 elementToProof ContentPasted6" style=3D"font-fa=
mily: &quot;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; colo=
r: rgb(0, 0, 0);">Change the user password with a 16-byte flag.</span><br>
<div><span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif;=
 color: rgb(0, 0, 0);">root@evb:~#</span><span style=3D"font-family: &quot;=
Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);"><b> ipmitool use=
r set password 5 Passw0rd 16</b></span><b><br>
</b></div>
<div class=3D"ContentPasted6"><span style=3D"font-family: &quot;Times New R=
oman&quot;, Times, serif; color: rgb(0, 0, 0);">Set User Password command s=
uccessful (user 5)</span></div>
<br>
</li><li class=3D"ContentPasted2 elementToProof ContentPasted4" style=3D"fo=
nt-family: &quot;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);"=
>
<div><span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif;=
 color: rgb(0, 0, 0);">Use a 16-byte testing command to validate the correc=
t password: Pass
</span><br>
</div>
<div><span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif;=
 color: rgb(0, 0, 0);">root@evb:~#</span><span style=3D"font-family: &quot;=
Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);"><b> ipmitool use=
r test 5 16 Passw0rd &nbsp; &nbsp;</b></span><span style=3D"font-family: &q=
uot;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);">
 &nbsp; &nbsp;</span><br class=3D"ContentPasted4">
</div>
<div><span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif;=
 color: rgb(0, 0, 0);">Success</span></div>
<div class=3D"ContentPasted2 elementToProof ContentPasted4" style=3D""><br>
</div>
</li><li class=3D"ContentPasted2 elementToProof ContentPasted5" style=3D"fo=
nt-family: &quot;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);"=
>
<div><span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif;=
 color: rgb(0, 0, 0);">Use a 20-byte testing command to validate the correc=
t password: Pass &lt;=3D=3D I think this should be a Fail</span><br>
</div>
<span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; colo=
r: rgb(0, 0, 0);">root@gms:~#
</span><span style=3D"font-family: &quot;Times New Roman&quot;, Times, seri=
f; color: rgb(0, 0, 0);"><b>ipmitool user test 5 20 Passw0rd</b></span>
<div class=3D"ContentPasted5"><span style=3D"font-family: &quot;Times New R=
oman&quot;, Times, serif; color: rgb(0, 0, 0);">Success</span></div>
</li></ol>
<p class=3D"ContentPasted2 elementToProof"><span style=3D"font-family: &quo=
t;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);">Could you plea=
se confirm if my understanding is correct?&nbsp;</span></p>
<div class=3D"ContentPasted2 elementToProof" style=3D"margin-top: 0px; marg=
in-bottom: 0px;">
<span style=3D"font-family: &quot;Times New Roman&quot;, Times, serif; colo=
r: rgb(0, 0, 0);">Additionally, any insights or suggestions on this matter =
would be greatly appreciated.</span><br>
</div>
<p class=3D"ContentPasted2 elementToProof"><span style=3D"font-family: &quo=
t;Times New Roman&quot;, Times, serif; color: rgb(0, 0, 0);">Thank you very=
 much.</span></p>
</div>
</div>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<div><span><br>
</span></div>
</div>
<div class=3D"elementToProof">
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<p style=3D"font-size:12pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"font-family: Times New Roman, serif; color: black;" lang=3D"en-US=
"><br>
</span></p>
<p style=3D"font-size:12pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"font-family: Times New Roman, serif; color: black;" lang=3D"en-US=
">Best Regards</span></p>
<p style=3D"font-size:12pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"font-family:Times New Roman,serif" lang=3D"en-US">&nbsp;</span></=
p>
<p style=3D"font-size:12pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"font-family:Times New Roman,serif" lang=3D"en-US">Quanta Computer=
 Inc.</span></p>
<p style=3D"font-size:12pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"font-family:Times New Roman,serif" lang=3D"en-US"><span lang=3D"e=
n"><span><span class=3D"ContentPasted0">software engineer</span></span></sp=
an><br>
</span></p>
<p style=3D"font-size:12pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"font-family: Times New Roman, serif; color: black;" lang=3D"en-US=
">Jerry Wan</span></p>
<p style=3D"font-size:12pt; font-family:Calibri,sans-serif; margin:0"><span=
 style=3D"font-family: Times New Roman, serif; color: black;" lang=3D"en-US=
"><br>
</span></p>
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_PUZPR04MB48670ADEFA76685E7FC585EB88AFAPUZPR04MB4867apcp_--
