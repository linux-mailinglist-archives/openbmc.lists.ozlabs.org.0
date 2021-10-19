Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D25DF432C3F
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 05:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYJz92hg5z3cND
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 14:25:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=n4WthMNQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.120;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=n4WthMNQ; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300120.outbound.protection.outlook.com [40.107.130.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYJyg1XCtz2xX4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 14:24:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHLbpM/l3yvI2TlNQDQMepK31fspJHwmIpE6PzkrRhAt4NmJDpkaZMv/DUcMMYDtBcY4brN6ThYS+AWV6ngVon2UKU6XC1ut1sX1pZmAst7degTQup3E+LlgHsWBbdQzFT19kuxzbLlO0g9iqdu8QjEv2XceZlBvxuA81EYsQ9u3HlL5pQu+4baG3GI6uc3Qog4IVx8780QOxty7cYIPqJ4jbYsvFJqPa+NthAJABaibmJVaOPOqGAcMXsm9PsSNNNvcMKgOI3c1PcMzzR+nP1Ms4Lz3ojwt4mkV5sRSyRZ6s0ZsiNnebNQPhmW8EeV7DRvzDfmp2eagsNbco47UwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4XdKSFyyZGyUGNzscH1zeJ91yq8/4al0bsD6I8jV0s=;
 b=P+80CH9f98bOB/1rKXg7xPXgkmxy9hK60Y3z3Vv2xDFXULOJa5pH8jUoA3IJ1rlCZu9IhCeKQVb1M8juhWiIkwnmvX1VFKjMMVCRgOdej6bhJfr0vs3kQU5PwRdK9PsaZaVh3DLruO9dGNxQW0uBjsdzaiceeciJOvuxqGDCQLtOFldWHX4k3xZEbttN/scP1gztDByPuSr3VsWkrnzr/L2t9oVDowtjf7P/SOsdGl6n8SdAQRvoGpBjFEDdFyQNu+SD1UowFnr36eztjX/6GcYFLQV+tm/lMVF5TEHYPap2sZ1yXvKB8W69pYwslktiDtrewOOwRywUJwcv0b50gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4XdKSFyyZGyUGNzscH1zeJ91yq8/4al0bsD6I8jV0s=;
 b=n4WthMNQHySeU08J++a92twZUnLgJXnSIAzTi3ankm6WVTHMHzUQ9/jsNum3su4p56Qe5+FgEVjHX4UAWyzhNm7eZyB5S93YI6IIfIhKH2ebImXcM1mWtUtSDy+amRg93/Ec2fTohVlBv+vdUOdpHWRVeaHWuLSoXhKClp957u4=
Received: from HK0PR04MB3058.apcprd04.prod.outlook.com (2603:1096:203:8d::11)
 by HK0PR04MB3106.apcprd04.prod.outlook.com (2603:1096:203:8b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 03:24:37 +0000
Received: from HK0PR04MB3058.apcprd04.prod.outlook.com
 ([fe80::517b:d054:1ce3:ef40]) by HK0PR04MB3058.apcprd04.prod.outlook.com
 ([fe80::517b:d054:1ce3:ef40%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 03:24:37 +0000
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: RE: Expected response table for ipmi standard commands used for
 verification
Thread-Topic: Expected response table for ipmi standard commands used for
 verification
Thread-Index: Ade/WNbNdxPEHNQBS3mjwGoKhU9yjwE1BHCAABrNqAA=
Date: Tue, 19 Oct 2021 03:24:37 +0000
Message-ID: <HK0PR04MB30587B9CDC059B25E38D993FE6BD9@HK0PR04MB3058.apcprd04.prod.outlook.com>
References: <HK0PR04MB305832327CA30B3FB2D70985E6B69@HK0PR04MB3058.apcprd04.prod.outlook.com>
 <CAAMkS12rPtK9QJJxz8nTmhocyhZJ7R-Zi8T9BCU5KUKjahCBZw@mail.gmail.com>
In-Reply-To: <CAAMkS12rPtK9QJJxz8nTmhocyhZJ7R-Zi8T9BCU5KUKjahCBZw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e136d22-5e93-442d-5048-08d992affade
x-ms-traffictypediagnostic: HK0PR04MB3106:
x-microsoft-antispam-prvs: <HK0PR04MB310688D9722976D916383501E6BD9@HK0PR04MB3106.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MLLs9qozVQ4ZrF0l3lwcxGz+5v2lUDQssFfMQl+aOLR4okjXBco9yqur24QejmMKQp7n1bK7/8nWEb3v5dnDDw6v14iNjKUxLqkjbhTfv3oZOJ72J3cEMo4GK++tyaYAkhl/VJS5P7or3tCtV5Q/hU8zYZwztTtlLz5eT6dOnLzqaxdd555V37ajlNZrGtzUIkT+Jo+ugN3qaCvXUpxfzaZLM2RQqJL8iTzAptDYLx0kaB6bmQl5Oo36PC1Nscxl+90+tE89jPO+NAzcvHlfawVAfBx+iiop+ORha5rx5i8i5GIoKgy+X30vsoJX0nehC6FDRynuwBWUX/RzpEjX3f2lrUD5NARESNDxIK9yiN7cZtHcCtuj85bnxO/g+y3BcRQHK1rgrPhFm4IhOJ6sPHwbzdPBcl4sfTtxD0YULzd+G9FFrGxaEaJMh2vY2R3jMAoSLYxrKbre+3OjzIVcjq0i8UgW41jP9tA740YiBBGi6ll8WiXMDRLs+pnoh9Ss9GrVFSYPQtcetp+MEfNYAhjcMwMELQk3uAGIiTZ22bARxA4T12TpE64djOqD1aC+KLDImLibTfO1vSfkK/2/nohLVrcHdlhXvmecRoRBIuOb0YG0Gv9XnhN+DDQcqJKuLpfYLiERqoAoX7Jj5gcw2PnKAbT7Fw5v4vYtvOfQd3cUo4z22psztKZHKK7I/j5hYLIY/A4MEUnrBzdXj6hGMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3058.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(5660300002)(15650500001)(53546011)(6506007)(64756008)(508600001)(66446008)(66476007)(38070700005)(4326008)(66946007)(54906003)(52536014)(6916009)(122000001)(26005)(83380400001)(86362001)(9686003)(76116006)(38100700002)(66556008)(85182001)(316002)(55016002)(8936002)(2906002)(186003)(7696005)(33656002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHhja0tvVWphWnZkZEhPYUxXeEpxSDdiYytjaTYxL1Y4QVhoc0dyNjV1dk1N?=
 =?utf-8?B?SkFTaXZXbXVuK3ZZRVVqOTgyanIzK1dreDkxcld2ZklkenFjVGRmZCtKVW96?=
 =?utf-8?B?N2h5Y1l0ajZjQlkwYTA4aXNDb1FPMEpiK3h3eHBwdHR0OFUwakNoVWs4TFIr?=
 =?utf-8?B?QjZaWEszNDR4UENLY1FtWnNiS0hFSzluNXF5cjczTXhKZThXbnRHK2ZMK0tR?=
 =?utf-8?B?anlncXp1Ujl4RFpOeUlGSkU0ajVWWlVUT3Z5Z3VyeDFLaDBHSHJTREJYSXkx?=
 =?utf-8?B?WFhhRGkzV1Z6QjRjci9CWUh6VTRpSytZTW1QZnJPdWRWSjFxVG5vNWwvYkRy?=
 =?utf-8?B?REVZR1pib1dvT2F4Um9rcDF2NDBJcVFRaGNwY1hlc2hiZlBwUnNCbTg1MGVV?=
 =?utf-8?B?TEloUmtVZ0tLMmthdkZQYlYxRFZCelBZU2Yrd3BYelhhY2RJbVNjbFhpVTQx?=
 =?utf-8?B?c0htLzRVdGs0VFYrV1R6SjNKTndZbjEveG54cC9iRXRGbE5UMWtDRGNGM1NO?=
 =?utf-8?B?ejY4NnlZZytTdDBWaW1Ib3lQZTVJc3pHTHpnR1hPM09YVGZqUmJ6MzVxUzNE?=
 =?utf-8?B?UTczL2JkS1I3RlZBQWxtTDgxWUNlR1JKU04yV1h3a3lSelN0L2ZiTGdKb3M4?=
 =?utf-8?B?L1E4WmVHeWdmRXc4OVl5QzZ2Q0FLMUpTWDhoM2NKdmw5VG0wQ1o2MkFYbVJG?=
 =?utf-8?B?cUZ0bHhFbW5oa29XQnJqbEFkb0ltL25HYS9ySDlmMkRuSm0raTdFTXlrTU5K?=
 =?utf-8?B?ZlBUR3Rza0M2eU5iS24ycFpFRXVCdlZNdUJIYUxFRHJGVUtWKzlhQkJXbHB2?=
 =?utf-8?B?TGpza3FCVkZoNHB5cDg1b09qNEEzTlVHVFkzUWV3WkM0bHorUzZJRENsOUJ3?=
 =?utf-8?B?VkF6Ui9nbTVma28zeTJTTDI4VGF0a05XaEtrVDRweWQvY3ZlMVRwQnIxcjVz?=
 =?utf-8?B?TFk3ZE9QdEFHTVdJcktaZnpPTW5OR2ZPUVlicVNDSXMrQldNM3EweWhTT29u?=
 =?utf-8?B?cTNuaW5ZeENOUHZGeFpUVkNyVWordUxuMjZsc2F6TTlySm9vdTZrMExQSldF?=
 =?utf-8?B?Qm9RVzRaMnFDSXd0czVmQThsWStaVkRxSzlnRnZrU1VrSVRtWXVQWHhIT0lk?=
 =?utf-8?B?d1FPaXYyblV2VWh5ZkRnd3c2eklaTnZONWdHTDBGMGdrcDE2NzRCRG1EQTNT?=
 =?utf-8?B?MjRmZS8xWkR1KzhUN3F5aWRtWTRVT3AyNkgrRll5Z2RsQ1RmQjllV3Z3VTJ2?=
 =?utf-8?B?VXB2aC9hMG0zbU9MVi9KY3V6SGNXbmhRTmdxY3JtM3FoSlloclFJL2gzQVov?=
 =?utf-8?B?eU9ocnYyNWhFYVNZRkhKZlFKblRpak11YjZESHE5SisrUEwvcmgwRjFodTlu?=
 =?utf-8?B?RlhlNEdNcExKRnZrQlAyZGc4WkZnQXJkOVdQbUM3Q3FRc3BNYkRzMlJ2dERB?=
 =?utf-8?B?VGN5dDlrYkZLV3RxUWg5YWsrbVJSWGVyR1ZuNHcyOFZOS05XdWdwUWtTUHVM?=
 =?utf-8?B?Zm1TWTZQeVNxb0JoU21kY1pMVlVjQlJueExtZmRhYkRPWHV1QjU5aU5nOEZD?=
 =?utf-8?B?M2w4VHUrSE1teFRDZ0hyaWp4WDJtMWlVMXJkTkdJRjZpOHRROURPYk8wSFNN?=
 =?utf-8?B?Sm9kVmljUWFHeHhYWGppY0VYRUljQXZ0Mk9uVnQrRU9OcXRWTGdyQ25XakQ4?=
 =?utf-8?B?bHRreEN5RFpnWFV6eXcxRHpabTJyM3VSSjcwTHgrWEllWm5BclFwRkVBWGt1?=
 =?utf-8?Q?4R047gHU4qIdcdvFulx4e5ifP/KWMGsSvIwIdM4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3058.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e136d22-5e93-442d-5048-08d992affade
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 03:24:37.4631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KL3aSEK9MmLlaCk2H0WkYa7UPbBWmYSxm+FgsQ0hUlemgmnETSfGwgPdGL/i+63P6SxcW5ga2aXgeytD16XxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3106
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
Cc: openbmc <openbmc@lists.ozlabs.org>, George Keishing <gkeishin@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUmFodWwsDQoNCk9LLCBJIHdpbGwgZ2l2ZSBhIHNhbXBsZSBmaWxlLiBUaGFua3MgZm9yIHlv
dXIgcmVwbHkuDQoNCkZyb206IFJhaHVsIE1haGVzaHdhcmkgPHJhaHVsbWFoZXNod2FyaTAxQGdt
YWlsLmNvbT4gDQpTZW50OiBNb25kYXksIE9jdG9iZXIgMTgsIDIwMjEgMTA6MzIgUE0NClRvOiBU
b255IExlZSAo5p2O5paH5a+MKSA8VG9ueS5MZWVAcXVhbnRhdHcuY29tPg0KQ2M6IEdlb3JnZSBL
ZWlzaGluZyA8Z2tlaXNoaW5AaW4uaWJtLmNvbT47IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZz4NClN1YmplY3Q6IFJlOiBFeHBlY3RlZCByZXNwb25zZSB0YWJsZSBmb3IgaXBtaSBz
dGFuZGFyZCBjb21tYW5kcyB1c2VkIGZvciB2ZXJpZmljYXRpb24NCg0KSGkgVG9ueSwNCg0KSXQg
d291bGQgYmUgYmV0dGVyIGlmIHlvdSBjYW4gY29tZSB1cCB3aXRoIGEgc2FtcGxlIGZpbGUgd2l0
aCB0aGUgcmVxdWlyZWQgZmllbGRzIGZvciBJUE1JIHN0YW5kYXJkIGNvbW1hbmRzLiBBbmQgdGhl
IHNhbXBsZSBmaWxlIGNhbiBoYXZlIHRoZSB0YWJsZSB3aGljaCB5b3UgaGF2ZSBzdWdnZXN0ZWQg
ZXhjZXB0IHRoZSBtYWNoaW5lwqBmaWVsZC4gTGF0ZXIgY29tbWFuZCB1c2FnZSBmb3IgcmVxdWly
ZWQgSVBNSSBzdGFuZGFyZCBjb21tYW5kcyBjYW4gYmUgY2hhbmdlZCBpbiBJUE1JIHN1aXRlLiBP
dGhlcnMgY2FuIHVzZSB0aGUgc2FtZSBzYW1wbGUgZmlsZSB0byBjcmVhdGUgb25lIGZvciB0aGVp
ciBzcGVjaWZpYyBzeXN0ZW0gYW5kIHVzZSBpdC4NCg0KVGhhbmtzDQpSYWh1bA0KDQoNCk9uIFR1
ZSwgT2N0IDEyLCAyMDIxIGF0IDQ6NDkgUE0gVG9ueSBMZWUgKOadjuaWh+WvjCkgPG1haWx0bzpU
b255LkxlZUBxdWFudGF0dy5jb20+IHdyb3RlOg0KSGkgR2VvcmdlLA0KDQpJIHdvdWxkIGxpa2Ug
dG8gYWRkIGEgdGFibGUgd2hpY2ggc2ltaWxhciB0byBkYXRhL2lwbWlfcmF3X2NtZF90YWJsZS5w
eSBmb3IgaXBtaSBzdGFuZGFyZCBjb21tYW5kcy4NCg0KRm9yIGV4YW1wbGUsIGluIHRoZSB0ZXN0
ICJWZXJpZnlfU0RSX0luZm8iLg0KVGhlIG91dHB1dCBvZiB0aGUgU0RSIGluZm8gY29tbWFuZCBj
b3VsZCBiZSBkaWZmZXJlbnQgZm9yIGRpZmZlcmVudCBtYWNoaW5lcy4NCg0KVGhlIHRhYmxlIHdp
bGwgYmUgbGlrZToNCicnJw0KaXBtaV9zdGFuZGFyZF9jbWRfcmVzcF9tYXAgPSB7DQrCoCDCoCAi
JHttYWNoaW5lfSI6IHsNCsKgIMKgIMKgIMKgICJzZHJfaW5mbyI6IHsNCsKgIMKgIMKgIMKgIMKg
IMKgICJmcmVlX3NwYWNlIjogInVuc3BlY2lmaWVkIiwNCsKgIMKgIMKgIMKgIMKgIMKgICJtb3N0
X3JlY2VudF9hZGRpdGlvbiI6ICIwMS8wMS8xOTcwIDAwOjAwOjU5IiwNCsKgIMKgIMKgIMKgIMKg
IMKgICJtb3N0X3JlY2VudF9lcmFzZSI6ICIwMS8wMS8xOTcwIDAwOjAwOjU5IiwNCsKgIMKgIMKg
IMKgIMKgIMKgICJzZHJfb3ZlcmZsb3ciOiAieWVzIiwNCsKgIMKgIMKgIMKgIMKgIMKgICJzZHJf
cmVwb3NpdG9yeV91cGRhdGVfc3VwcG9ydCI6ICJ1bnNwZWNpZmllZCIsDQrCoCDCoCDCoCDCoCDC
oCDCoCAiZGVsZXRlX3Nkcl9zdXBwb3J0ZWQiOiAibm8iLA0KwqAgwqAgwqAgwqAgwqAgwqAgInBh
cnRpYWxfYWRkX3Nkcl9zdXBwb3J0ZWQiOiAibm8iLA0KwqAgwqAgwqAgwqAgwqAgwqAgInJlc2Vy
dmVfc2RyX3JlcG9zaXRvcnlfc3VwcG9ydGVkIjogInllcyIsDQrCoCDCoCDCoCDCoCDCoCDCoCAi
c2RyX3JlcG9zaXRvcnlfYWxsb2NfaW5mb19zdXBwb3J0ZWQiOiAieWVzIg0KwqAgwqAgwqAgwqAg
fSwNCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICIke2lwbWlfc3RhbmRhcmRfY21kfSI6ew0KDQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuLi4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0NCsKg
IMKgIH0NCicnJw0KDQpEb2VzIHRoaXMgc2VlbSBmZWFzaWJsZSB0byB5b3U/DQoNClRoYW5rcw0K
QmVzdCBSZWdhcmRzLA0KVG9ueQ0K
