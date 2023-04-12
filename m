Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9A6DED0E
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 09:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxFRQ41lCz3ccn
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 17:57:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=WL6SrhKq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pliops.com (client-ip=2a01:111:f400:7e1a::602; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=liorw@pliops.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=WL6SrhKq;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxFQp2hF8z3c2j
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 17:56:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjquA8erpHH5KiXMn1F26bgd8xc/uYygl7xiFRlu2YFsSoeK1f+0KaYfu/M4ymdBjq5DZ0nOc5FeO9KF7aY1rvPV5Hm2ltSCO+2EjK/vQuQN+l54nT/cRGbvBwPJqYUB6ZlpFwlRqMyGvdoifDBfqz1JSqYNqgjixwcPNHX7LrM7dxcjpiCXIvjeg4IFF6oJYfCBwcfvScP99d861qp+FpI8OM+9KPsLTkuUx+m2sca6QDdWQDLn6GfKSe9AymFg88VKMi+yAxFz3rp8goL58fK/eHiN7YoLGe9rxdSQaRmlzIueUwCrNoGZFizGEqM3+h/BYpUXd3SHTchCl6iisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTd3zKJexwebplNIJ5PTbIL4UkTUe4qjGO7tHR0/uTM=;
 b=QxCrT3ykWx824bKYXqw0e32tkC6DwwNR9tM8GUxVjD3cyxJZ56OzWFJxyhZYJg7XEJ+AfI6IC9fSnNMpwKPOesSNkbhOOSqLpz2nemPfTiePK1msJfOv/Ayx5mVwUgZpE8wC9TDQMUxJrR/Zo/5YCjmqxSFOx3imrdcb5g4zH2LA14OHXEew+r7D5MfRZJMh1Oze1Cf3yovPJyN9jK84txbAvwzzXfxzjthJF1hcZ8oS7GwrpjP2kIfN/WKApAANl2hJqGrZC8ZBxJTxUi3a130TMz9+oB8T1DuNehzQf07E8VYZt+cbcz/695t/3ELVIlnYqQHKEZu7hfLd6mR6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pliops.com; dmarc=pass action=none header.from=pliops.com;
 dkim=pass header.d=pliops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pliops.onmicrosoft.com; s=selector2-pliops-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTd3zKJexwebplNIJ5PTbIL4UkTUe4qjGO7tHR0/uTM=;
 b=WL6SrhKq9oTc696KuNT9Zm7OXSArq82jibLTDKGaVcayzYLYO2f6ra6F7TzLY7MhbPf7jshMS/E5Cxgn56CMioQowjL6yIIOL/q0ZbeLH1nFZVHbOuoydVP+Lt7y+RNr/Y8si6ueMQg2a8DqR8dGk7PMKKwJR6hNgJi5eo4AAk0=
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:30::14)
 by PR3P195MB0713.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:32::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 07:56:10 +0000
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::2376:d467:719a:c91c]) by PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::2376:d467:719a:c91c%9]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 07:56:10 +0000
From: Lior Weintraub <liorw@pliops.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Hao Jiang <jianghao@google.com>
Subject: RE: OpenBMC - Support NVMe drive health monitoring
Thread-Topic: OpenBMC - Support NVMe drive health monitoring
Thread-Index:  AdlpOoX4AoF60PwUTHKE9qP9mDhHLAAC/7IAAAAq+AAADDLuAAAhfEGAAHLcZoAAHbx9wAAf1wEAAAexVgAADNEGQA==
Date: Wed, 12 Apr 2023 07:56:10 +0000
Message-ID:  <PR3P195MB055564DCC17FC45824CD7C86C39B9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
References:  <PR3P195MB055546905D984A24BEB9D474C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <c9adff03-16f4-40d4-8334-6cdbbdea2407@betaapp.fastmail.com>
	 <PR3P195MB0555D8C52C5F2EBE2FA1E299C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <CAB38=p21yk1O8eQvq9Rtq4TuKpoJeU7Zy189KJRmGCcQ0NqyQw@mail.gmail.com>
	 <PR3P195MB05553184971B4F0E15989893C3979@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <CAB38=p0anKYhBGTDxjSOQGDm60XNu+nv399-QoVCsKMxeoOznA@mail.gmail.com>
	 <PR3P195MB05551C7B1C589C972BE03873C39A9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <CAB38=p2VtC14fADDXGjDqGEy5b79tndPP5T-xN2_aeYfVmfg=Q@mail.gmail.com>
 <89dcad45a290fd9ac964b89c014a8fdd6ab11411.camel@codeconstruct.com.au>
In-Reply-To:  <89dcad45a290fd9ac964b89c014a8fdd6ab11411.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pliops.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P195MB0555:EE_|PR3P195MB0713:EE_
x-ms-office365-filtering-correlation-id: d9cac76e-8141-44c4-6502-08db3b2b6116
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZHxkh7LEO9qKcgjhsoQDcPsSFqV/rXzstP2M6emMjEpS6XRrehv06k85/VRs5ajTAeOqrjO2SzmfPPuoLgXVp0G7vEaup5Cefre4Wa0rFYw7+jqjQglTFVHAUkqYVwd43zmy2zqp4mdjp3yLC6JihlyWUJqvic2EUKiSoU7X8Qx67YEf+RqFbuMMM2Ozy9GHPi8cdV2q6oM0CcnX7E8w457VnMuRtkfU9sOjdxJpkBOKHkFTYymN5SLRkWJsGTqXTaP3isBXwCFWQ1dknxtbe0vIPhx2sQ6Aieb49kRjwDZT6F9hclpFW+6d8L12cP+tWEu5bOf785OcpZIw1y0zK/GIEIo5OzhR4Iq/rVIAaGlYUNrh2rB0e/+L4oNRNKd8ofBll8B9fSZP5iyV1IRRog0Lu7wGyMrefiE3WrGjw6EfxWLLVFp85Gc6rJGpM4GownvrnJPly+BwnjPHYlpTqU7j5rmdIqA5Bzc/7hXRo1EsH6JqL3Ixrxo2HAu6kVF5uiB7msRHaV2Q/zR11GCOzUlXN013+YMlWxsu1nCgsFRia24mUKmOvxTmVgZJOIsJJBeDExTw3E54QQzrdymnjee/aM8xEsG8k7CZK8CA5+U=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P195MB0555.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(136003)(39840400004)(396003)(451199021)(76116006)(83380400001)(966005)(478600001)(71200400001)(7696005)(54906003)(26005)(186003)(6506007)(53546011)(110136005)(9686003)(2906002)(52536014)(33656002)(5660300002)(38100700002)(122000001)(66556008)(4326008)(41300700001)(66476007)(66446008)(66946007)(64756008)(8936002)(38070700005)(316002)(55016003)(86362001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d1h0ZVp2STdhdjRqamh6elhtNzgvbnNiVURKRG4xMGNCa3dvWStBT0tsZFNB?=
 =?utf-8?B?ZWg0QklDS3IwYU1LbGVxNXFZc3R3NEJUelRmL05HWWZISEROVWtLVFZoeGZs?=
 =?utf-8?B?bm9nVUJta0Y4QVRlZ2tHZGpoTitxcDNHVVhWUmMwajZZS0txY3EwUXBHUmsx?=
 =?utf-8?B?T1RHOGV3UFNNNERLeFNvNlU1TnZaSCtIaGVaU2NBc2VyZ2drcUJNOFNZaTc2?=
 =?utf-8?B?TFk0K2hOU1NZWnBDdktEN3NkNlN3Q0tzckxId0VEeFdmdDhNQ1BnbG9XWWEv?=
 =?utf-8?B?NkdRem5IbHFJV0QvNEhMd01QSDM0TE1KcDZpWlFDbXg1SFNWajhwclh4YVUw?=
 =?utf-8?B?azd4aGMwSWcrSTZVbXkrOUJtLzFVdm85RmRkeWFET25SNUNUamtla09acU5M?=
 =?utf-8?B?VDlMd1QyME92TDZlNW5wdUs5QU15Sk5zeFZ6bFVXM1NUb3ZiSlZLUWlBUEFH?=
 =?utf-8?B?V005ZDd1ZUhaRGd4ZTFKUm1pQ2k0c0FuUWhJK3Vpc2VmWlBDUHBvYlNHYlhT?=
 =?utf-8?B?TEpKbUJPOGx5cndrWVg3VW9iTmN6cW9SSkR1UDQraThZbnNPTHl6MjNXR25G?=
 =?utf-8?B?LzZqb3RPSG5IQXFPQlQyd1FYU0RINFN4Y2J2UVNHUUpYMlY5Q0RhbEdPMFBq?=
 =?utf-8?B?QzlRc1JIT2JSb3N6QmtwNmo2QVJxelV6R0lFc2taczFxTW1vRkMyOVErRkhQ?=
 =?utf-8?B?ZUdXcmFFZ2RNanU2VG9KVkRGRTNhQ3RDVHJLdm00ZHU2OGE2eDhCakhSUlJC?=
 =?utf-8?B?amJMaE9QK1ZheWE1cFJmcHZ1bjlMOWhyMEJPNm9XUDVpSnh5SjJGb0VxNXFO?=
 =?utf-8?B?OHNZYzVqVEt4NzRLa2JTWnhTZTBQNjJoS0JZWk5hTllGWUFBdk1mZ08vTEZ4?=
 =?utf-8?B?bENrb0tWNWZlY21VUjFMRHliQ3FkUHAzWGpRb1F6VzhZWjRXLzZ2MHRnZVZE?=
 =?utf-8?B?OGZYYytBQU1zdk5oc1lmMmVLV3Z0c2dLV0dQUmdTcWttbGZ1WnhEaDBEUmpw?=
 =?utf-8?B?b2NaK3JORXhWY25RNS92UE42SFJ5VnRSZld5MUFyczg0NmdXZXVDYWRxVmNn?=
 =?utf-8?B?TmF0YU1Cbzk2ZjJud2NUOWpQS0U1VUE2c1RidE1OQmNEWUU3MStjYU8yNnFn?=
 =?utf-8?B?MksyNFBCYzhHbmozTmJUVitRcEdaVVpINlprbHdJOWpkbWFhcXVmblV5dVFR?=
 =?utf-8?B?Y3dxaCtya2NFMXpuVFI4SjUrZjZ0L3NKUUZhU09mQUNiUWpySXRreDQ1MExT?=
 =?utf-8?B?YmlpSkZZeFlGcTJBVXJXeWtVY1lEMGF2WmxWdHlYOGRmMXZRdDYyVDVFR0Yr?=
 =?utf-8?B?bFdRWXp5TExiRVBqNUJSMVJuNWpXcms0VEFneW54Um12QlBiclNyU0MyYVZL?=
 =?utf-8?B?c09FUEFvdEV1cGZVYnE3UnpEd3h2MGxUc0dkQ1RoVG8zWk9ORmZuNzJzU2Yv?=
 =?utf-8?B?dDJON09JR0dMcjBkc0FVR01VY2gzYW9nRjZtS3RaWUhrNVFnU1Fybk9NVTRC?=
 =?utf-8?B?eFYvR29qNGh4ZzFoNCt4dXdzZFYybDV2TTh6L09qK0R2RVo2ZlR3cEtrYWRz?=
 =?utf-8?B?aXhnM1NGSXNObjVVeWJjdmV3V2VMZUpYeExhK01YVUF1QmtNZVREcjQ3ajgr?=
 =?utf-8?B?aHQrc1RQRndrU0tWV25uQVpjUkR2Rm1FRTF2VDNPbzIvenRLQmRtMmJsd2hT?=
 =?utf-8?B?WFliTyswSlljb2hGejFza2hIOXFJZUE2cXBDZDNuVXNSNmZQVFNrMnhlbFc3?=
 =?utf-8?B?eUNUZnpwWEt2NFFVTDFlS2tpY0dtd21DYUtSSWZYN0pIV0hWYlE4MUdXUzUx?=
 =?utf-8?B?R3lBUGFqVDBaLzhuVnByN1BScHBrZGxCNEdtZmIzN2FqcXFLTEZXeVFMaTM3?=
 =?utf-8?B?Z1o0elBsaW1VUUdRaEVtZVROSVdXZmljb2VqQlJiaTZvT0tpNm1IUk1QVUdQ?=
 =?utf-8?B?VVZoYzJvNzNiR1MwZTYwY3krYm56Y2lQeXR0aDAzeXhwdkRvOURNZENlUjZ4?=
 =?utf-8?B?Z2dXYjB6SU9HNGxwQWtFMVBHZU5qOGZxeklON3R1RGVQcHI4eUxlQWFkWEVk?=
 =?utf-8?B?RitBUjhpMXFwZjM5Qm56MjVvZjdUbTl6WFJ6ZSt6RHpLMWRZU21JT08wZVNT?=
 =?utf-8?Q?MevU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: pliops.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cac76e-8141-44c4-6502-08db3b2b6116
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 07:56:10.0962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 40fe8f47-55ac-403a-a5ab-1be3dd209cf8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f44ZMXCqV9abASvNKIbsPkouIFtyt+ypf3SLjMZZD5TI9n3cmtE9ye3Ip35168MxMZFhWDNcuYMRuwdnLKcmag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0713
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
Cc: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, "rashmica@linux.ibm.com" <rashmica@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIEhhbyBhbmQgSmVyZW15IGZvciB5b3VyIGluc2lnaHRzLg0KSSB3aWxsIHRyeSB0byBm
b2xsb3cgeW91ciBhZHZpY2UuDQoNClJlZ2FyZGluZyBLbGF1cydzIHdvcmsgb24gUUVNVToNCkkg
YW0gYWxyZWFkeSBjb3JyZXNwb25kaW5nIHdpdGggaGltIHRyeWluZyB0byByZWNyZWF0ZSBoaXMg
d29yay4NCk9uIGhpcyBwcmVzZW50YXRpb24gaGUgcnVuIGEgIm5vcm1hbCIgTGludXgga2VybmVs
IHRoYXQgd2FzIGJ1aWx0IHdpdGggYnVpbGRyb290IGFuZCBteSBwbGFuIGlzIHRvIHVzZSB0aGlz
IFFFTVUgdG8gcnVuIE9wZW5CTUMgaW1hZ2UgZm9yIGFzdDI2MDAuDQpXZSBvcmRlcmVkIGFuIE9w
ZW5CTUMgZGV2ZWxvcG1lbnQga2l0IGZyb20gUG9ydHdlbGwgYnV0IGl0IHdpbGwgYmUgZGVsaXZl
cmVkIG9ubHkgaW4gMy00IHdlZWtzIHRpbWUuDQpJbiB0aGUgbWVhbnRpbWUgSSBhbSBsZWFybmlu
ZyBldmVyeXRoaW5nIEkgY2FuIHRvIGJldHRlciB1bmRlcnN0YW5kIHRoZSBtZWNoYW5pc20gYW5k
IHByZXBhcmUgYXMgbXVjaCBhcyBJIGNhbiBmb3IgdGhlIGFjdHVhbCBpbnRlZ3JhdGlvbi4NCg0K
UmVnYXJkaW5nIHRoZSBSYXNQaToNCkkgYWxyZWFkeSBoYXZlIGl0IGNvbm5lY3RlZCB0byBvdXIg
UENJZSBkZXZpY2UgYW5kIHVzZWQgaXQgdG8gZGV2ZWxvcCB0aGUgYmFzaWMgc2xhdmUgSTJDIGRl
dmljZSBvbiBvdXIgY2FyZC4NCkV2ZW4gaWYgdGhlIFBhc1BpIGNhbm5vdCBzdXBwb3J0IGRldmlj
ZSBtb2RlLCBJIHRob3VnaHQgSSBjYW4gdXNlIGl0IHRvIHNlbmQgYW4gTlZNZSBNSSBzaW1wbGUg
Y29tbWFuZCAod2l0aG91dCBhIHByb3BlciByZXNwb25zZSkuDQpKdXN0IHNvIG91ciBQQ0llIGNh
cmQgY2FuIGdldCB0aGUgbWVzc2FnZSBhbmQgaGFuZGxlIHRoZSBNQ1RQIHByb3RvY29sLg0KDQpU
aGFua3MgYWdhaW4sDQpMaW9yLiAgDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEplcmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5hdT4gDQpTZW50OiBXZWRuZXNk
YXksIEFwcmlsIDEyLCAyMDIzIDQ6MzEgQU0NClRvOiBIYW8gSmlhbmcgPGppYW5naGFvQGdvb2ds
ZS5jb20+OyBMaW9yIFdlaW50cmF1YiA8bGlvcndAcGxpb3BzLmNvbT4NCkNjOiBBbmRyZXcgSmVm
ZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsgRWQgVGFub3VzIDxlZEB0YW5vdXMubmV0Pjsgb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnOyByYXNobWljYUBsaW51eC5pYm0uY29tDQpTdWJqZWN0OiBSZTog
T3BlbkJNQyAtIFN1cHBvcnQgTlZNZSBkcml2ZSBoZWFsdGggbW9uaXRvcmluZw0KDQpDQVVUSU9O
OiBFeHRlcm5hbCBTZW5kZXINCg0KSGkgTGlvciwNCg0KPiA+IElmIHNvLCBjYW4geW91IHBsZWFz
ZSBndWlkZSBtZSBob3cgdG8gZG8gdGhhdD8NCj4NCj4gVGhlIHByZXJlcXVpc2l0ZSBmb3IgbnZt
ZSBPT0IgaXMgdGhlIG1jdHAgbGF5ZXIsIGluY2x1ZGluZzoNCj4gMS4gbWN0cCBsaW51eCBrZXJu
ZWwgLSBzdGFydGluZyBmcm9tIDUuMTUgMi4gbGlibWN0cCAzLiBtY3RwZA0KPiArIEplcmVteSBh
cyB0aGUgYXV0aG9yIG9mIE1DVFAuDQoNClRoYW5rcyBIYW8hDQoNCkxpb3I6IHRoZSBnZW5lcmFs
IG1ldGhvZCBpbnZvbHZlcyBnZXR0aW5nIHRoZSBNQ1RQIG5ldHdvcmsgZXN0YWJsaXNoZWQgc28g
dGhhdCB3ZSBjYW4gcm91dGUgbWVzc2FnZXMgdG8gdGhlIE5WTWUgZHJpdmUsIGFuZCB0aGVuIHVz
aW5nIGxpYm52bWUNCisgbnZtZS1jbGkgdG8gcGVyZm9ybSBOVk1lIG1lc3NhZ2luZyBvdmVyIHRo
YXQgTUNUUCBjaGFubmVsLg0KDQpJJ3ZlIHB1dCB0b2dldGhlciBhIGJpdCBvZiBhbiBpbnRyb2R1
Y3Rpb24gaGVyZToNCg0KaHR0cHM6Ly9jb2RlY29uc3RydWN0LmNvbS5hdS9kb2NzL252bWUtbWkt
ZmlybXdhcmUtdXBkYXRlLw0KDQotIHRoZSBjb250ZXh0IGZvciB0aGF0IGRvY3VtZW50IGlzIE5W
TWUgZmlybXdhcmUgdXBkYXRlcywgYnV0IHlvdSBjYW4gcGVyZm9ybSBhbnkgb3RoZXIgKHN1cHBv
cnRlZCkgbnZtZS1jbGkgY29tbWFuZHMgdG9vLg0KDQo+ID4gQ2FuIHRoaXMgdG9vbCBiZSB0ZXN0
ZWQgb24gUUVNVSBvciBSYXNwYmVycnlQaSAocnVubmluZyBPcGVuQk1DIA0KPiA+IGltYWdlKT8N
Cj4gSSBhbSBub3Qgc3VyZSBpZiB5b3Ugd2FudCB0byBlbXVsYXRlIGEgbnZtZSBtY3RwIGRldmlj
ZSBpbiBRRU1VLg0KPiBSYXNwYmVycnlQaSBpcyBkb2FibGUgYnV0IHlvdSBuZWVkIHRvIHJld29y
ayB0aGUgcmFpc2VyIGZvciBJMkMgZnJvbSANCj4gUENJZS4NCg0KVGhlcmUgd2VyZSBzb21lIGRp
c2N1c3Npb25zIGFib3V0IGFkZGluZyBhIE5WTWUtTUkgKG92ZXIgaTJjKSBpbnRlcmZhY2UgdG8g
cWVtdTsgS2xhdXMnIHBhdGNoIHNldCBpcyBoZXJlOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9xZW11LWRldmVsLzIwMjIxMTE2MDg0MzEyLjM1ODA4LTEtaXRzQGlycmVsZXZhbnQuZGsvDQoN
CkZvciBSYXNwYmVycnkgUGk6IHRoZSBNQ1RQLW92ZXItaTJjIHRyYW5zcG9ydCByZXF1aXJlcyBh
biBpMmMgY29udHJvbGxlciB0aGF0IHN1cHBvcnRzIGJvdGggY29udHJvbGxlciBhbmQgZGV2aWNl
IG1vZGVzOyBJIHRoaW5rIHRoZSBycGkgaGFyZHdhcmUgb25seSBzdXBwb3J0cyBjb250cm9sbGVy
IG1vZGUuDQoNCkFuZCwgYXMgSGFvIG1lbnRpb25zLCB5b3UnbGwgdGhlbiBuZWVkIHNvbWUgd2F5
IHRvIHJvdXRlIHRob3NlIGkyYyBzaWduYWxzIHRvIHlvdXIgYWN0dWFsIGRldmljZS4NCg0KPg0K
PiA+IElzIHRoZXJlIGEgdG9vbCB0aGF0IHJ1bnMgYXV0byBkaXNjb3ZlcnkgYW5kIHdpbGwgZ2l2
ZSBhIG1hcCBvZiB0aGUgDQo+ID4gZGV2aWNlcyBpdCBmaW5kcz8gKGtpbmQgb2YgbGlrZSBudm1l
IGxpc3QpPw0KPiBUaGF0IGlzIG1jdHBkLiBodHRwczovL2dpdGh1Yi5jb20vQ29kZUNvbnN0cnVj
dC9tY3RwDQoNClllcCwgbWN0cGQgY2FuIGVudW1lcmF0ZSBsb2NhbCBNQ1RQIG5ldHdvcmtzLCBh
bmQgZXhwb3J0cyB0aGUgZW51bWVyYXRpb24gcmVzdWx0cyBvdmVyIGRidXMuIFRoZSBsaWJudm1l
IE1DVFAgaW1wbGVtZW50YXRpb24gY2FuIHRoZW4gdXNlIHRoYXQgZW51bWVyYXRpb24gZGF0YSBm
b3IgdGhlIG9iamVjdCBpdGVyYXRpb24gZnVuY3Rpb25zIHRvIHF1ZXJ5IHRoZSBhdmFpbGFibGUg
c3Vic3lzdGVtcy4NCg0KSG93ZXZlcjogdGhlIGVudW1lcmF0aW9uIG5lZWRzIHRvIGJlIHRyaWdn
ZXJlZCBieSBzb21ldGhpbmc7IHdoZW4gYSBkZXZpY2UgYmVjb21lcyBhdmFpbGFibGUgd2UgbmVl
ZCB0byB0ZWxsIG1jdHBkIHRvIHN0YXJ0IGVudW1lcmF0aW9uIGF0IGEgcGFydGljdWxhciBwaHlz
aWNhbCBhZGRyZXNzLg0KDQpPbiBPcGVuQk1DLCBFbnRpdHkgTWFuYWdlciBwcm92aWRlcyB0aGF0
IGluaXRpYWwgdHJpZ2dlciAoYmFzZWQgb24gZGlzY292ZXJlZCBGUlUgZGF0YSkuIElmIHRoYXQg
ZG9lc24ndCBzdWl0LCBpdCB3b3VsZCBhbHNvIGJlIHBvc3NpYmxlIHRvIHVzZSBvdGhlciBldmVu
dHMgLSBsaWtlIHByZXNlbmNlIHNpZ25hbHMsIG9yIGJ1cy1zcGVjaWZpYyBkaXNjb3ZlcnkgKGVn
LiwgU01CdXMgQVJQKSBmb3IgdGhhdCB0b28uDQoNCklmIGhlIGhhc24ndCBtZW50aW9uZWQgYWxy
ZWFkeTogSGFvIGhhcyBwdXQgdG9nZXRoZXIgdGhlIGhpZ2hlci1sZXZlbCBpbmZyYXN0cnVjdHVy
ZSB0byBleHBvcnQgdGhlIGRpc2NvdmVyZWQgTlZNZSBzdWJzeXN0ZW1zIG92ZXIgc3RhbmRhcmQg
T3BlbkJNQyBkYnVzIGFuZCBSZWRmaXNoLCB3aGljaCBhbGxvd3MgYW4gT3BlbkJNQy1pbnRlZ3Jh
dGVkIGludGVyYWN0aW9uIHdpdGggTlZNZSBkZXZpY2VzLCBzZW5zb3JzLCBldGMuDQoNCkNoZWVy
cywNCg0KDQpKZXJlbXkNCg0KDQo=
