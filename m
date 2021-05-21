Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB038DEDC
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 03:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpKJM3lsnz304N
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 11:24:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=vCPMErP4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febe::71d;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jun-lin.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=vCPMErP4; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::71d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmV336tkqz2yXb
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 11:51:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrXMHEC2PIoIifSRNIuYj82EV0KqbsRdM61eBA4qNMd7pmFpFkN89gp7hA8fv7K+4kBSTWcf8+9V+ferJz6D1SQ0XQr5uY7ejcW+iJ6KVG+bW0W/g+MSuFDZYj/SnVKi4Oy6Earkfa+3qPQQDEpWkEH/R7hEHpPCE58FVZGXo9dHwZdXEDtJzkI/U5ij1X3qxiVB7FCWxxs9JQ6Nz+71GtwlsGspD2ne40V0SdD5wcv4+9wrG5Q+BQIbqEDbVp1dF/k0JVFL1KmmI6YcAELxiMMmOZ7O4m2UPn1ZYWkemK69XwYvzaNLusi1tLzz/SyP+uxNkBTSqWFblAiOHe653w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Q4cMg3Y4A75Rd6oKNu1JlMkz7yC7qQjymkhgGwJhcI=;
 b=lQEWd7B+GQiQFba4zNdUdEGal8fKePv74ZByaB9RvutQhXctjROvbqLRylfOFMHeb5ctfW/BPhmpl+Mm2pb+AGmUdQlVzV8VXIHiX/rUOd72C4eZoUm/a4+idZYMnOCXhdrGEF75m1b+ME3rbj2l7KRxGwIjm3m/11ifxPMtNCuNwraBK3l+TsF65ouR7hZl61RYbx82QOfNYEaUwfhdpkngHYZL1QlJhnDdGUlsEKIXO1MPVrB/oEVRVvmR7thDScBFaYvMtOa9UtFHxwwFHZgFhh3w7GRDahsKfna85TL1yScYiFbgubhSlBZ3F6OvLAnUX0aID2p6BcvQqvKD6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Q4cMg3Y4A75Rd6oKNu1JlMkz7yC7qQjymkhgGwJhcI=;
 b=vCPMErP4G+z+O+H/++vbohQ1Q+0M9bwROTHvin7eaJXNSujlnwf1U+BSwodoD11p3skyv+yszCjMYGIRKTPINK80qXMMw57gZ/hSItaSbb00As60hp/hQr4XaRclWv2ggV2frwY9TiDlL3zwcz3dbxIHZPZdWubqzu2TafMl7kU=
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com (2603:1096:203:87::9)
 by HK2PR0401MB2116.apcprd04.prod.outlook.com (2603:1096:202:7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 01:51:45 +0000
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::2044:8839:c6f9:fa63]) by HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::2044:8839:c6f9:fa63%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 01:51:45 +0000
From: =?big5?B?SnVuLUxpbiBDaGVuICizr6tUwE0p?= <Jun-Lin.Chen@quantatw.com>
To: Ed Tanous <edtanous@google.com>, Nan Zhou <nanzhou@google.com>
Subject: RE: SimpleStorage proposals
Thread-Topic: SimpleStorage proposals
Thread-Index: AddMgrei/Fpr/op3T+CFNeQhuUFj5AAdRARZADsB0XA=
Date: Fri, 21 May 2021 01:51:45 +0000
Message-ID: <HK0PR04MB33460B421AC36D12C1BA9567B1299@HK0PR04MB3346.apcprd04.prod.outlook.com>
References: <HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81Xnpmq7x5S2E=wnRfx=0ob_0zfchA7azks=voVqQ9-Rw@mail.gmail.com>
 <CAOLfGj6ApsbrU9YKvQ4N_VFHkC1jZJ3WPDuLo1KwwSoOCp7HGw@mail.gmail.com>
 <CAH2-KxCEV-vJr0kM9DVa3n+V3nayh_Pq0WkGPahqDimqa6ghnA@mail.gmail.com>
In-Reply-To: <CAH2-KxCEV-vJr0kM9DVa3n+V3nayh_Pq0WkGPahqDimqa6ghnA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0c595cb-6564-4526-b62a-08d91bfafd75
x-ms-traffictypediagnostic: HK2PR0401MB2116:
x-microsoft-antispam-prvs: <HK2PR0401MB2116DE9D13822F9A2CB5F0BFB1299@HK2PR0401MB2116.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wq2do6bcRhXcu7RsocHRPWZjSq23FG65Q2+nkQGJoSrWG/rbNoSjh4cxtHctfHGntNj1p/xY1B2hBMbJktjIDSG0dHvkbm/Rg8P3pc8NO1Mvucp1UB1vWuMTM2m2RGoCWIT0PYTpimUqX59YdTm+jbUzfvlsBDDctE7sEORoh3tu8jg7EPq4NAjMrhhstV96XmaTgrKQC6nhQPJbzTppHh2VoBH9HNfACHOI7hDom9PEqwuwGCSw61QjfFpmFIhbwYYYlL4Ipe7B3inx+8HkhzCX1a2YmSZDygwJiBvMTBvhY5IuZUKw8uoVHVfKwxHKfHBYgvdlY29SdciOkCx/reZXcuBtDOnZHgdg/9Q+r57crACkq71XaXYvUDfDUbUHZUHQe9gXSPEDHl/cyr9vp4OFgBjh5idBu++Y8FBPW0i+PkXTlg5SH97K+Phb5X6AudIwIqHwxlh8jWELBdtSDavRX794CMb4LGpCCBzR+xax/pSMvhB4TPzz+mOpS2S67wOFNR5wJF6MhcMuABgMu3jqtUPLud2NrHclaEI5Hc+tAlOQajrvEQovmmLHm0/1ivmqjAGQGpRM3m7vhZxx5VXtD9TExa8oO/DdzreTFJ05ECQGxRO+xAdkZNKLDnOP3NLnwL/tKLJM9O1HPtx6xFpgjMfEssxrBRj6wiz1yXbHtMY19LCtyYxKmxg7kYEdms2jr7ssBXs+p/zODYwD/6UQ2ZcyIY89gpldGKmEwFY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3346.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(316002)(66556008)(4326008)(186003)(8676002)(66946007)(66476007)(8936002)(9686003)(3480700007)(54906003)(110136005)(76116006)(85182001)(5660300002)(64756008)(2906002)(86362001)(83380400001)(6506007)(53546011)(66446008)(33656002)(7696005)(966005)(478600001)(38100700002)(52536014)(55016002)(26005)(122000001)(7116003)(71200400001)(45080400002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?dHFnUnlHOStBMnNuRENPTENCajdKZXA1TzVFTm1KWGVtcjFTWGltc1p0bk9LZ0wr?=
 =?big5?B?MXVpWm8rTHRuV2Faa0h3L3dZRFM3WGxPYm1SczZ2dGNuQXRRcnBOY2l0b1BhZDNh?=
 =?big5?B?ZDN1VUNUZmRTNmVISDQvZ0VwSHdXQVFxbmUyZ212a1EzUnVLdjZsQ3lvM3A3VktL?=
 =?big5?B?bGNuU3puYXMxVEVkNU9Ndm9Nc0Y4K3p4Mm1mWDJXOUZIbkc2dUZtS3M4NG0yZE9a?=
 =?big5?B?TGEyU2srOUpGVWRXcHhuUUo5UjVyUUhkOWN0eHBvbE9rMGZUeUVyZWx0Mm1XVnpm?=
 =?big5?B?SllRV0EwR0ZQL3lVMzY3Q3FxQksyc3ZLaFJvRVM3RTgva1U0NFdjaitvQk5MTFJj?=
 =?big5?B?Um8rbFZ1M3kxU2FYaEQyZzA5MkhaeXYvSjNNZ2N1RUJWZnlWK0ZFSEZrRWduMWZY?=
 =?big5?B?Rk1HTXk1bEphVzU1WDQ3bFBub0pHQ3JaN1FobC9RRmFMTHFIUE9idjRhZU5zdlR5?=
 =?big5?B?MDlmL1cyUEx5WnEvZ0U0TkRzbkVwTkd2TDdwMG1XbkM0QjVjaFAxSnV6TXc0WEJY?=
 =?big5?B?TTJYMGo4clF2Mks5V20reS9CcG0zV2dYekttd0laWGhGT0RHWS9pRm8xMFREQmNV?=
 =?big5?B?SFlZVjY4ckM2Z21WdXF0U1JyTTZZS0dWaGdmVjFmazBQVlhZL3dpcXEyWVUrcmFT?=
 =?big5?B?UmtmL0x5L2MycW5IQmZabndPbkYwMjhHcmU2USs2ZUl5cjM1YkZVYlpnQkZSd3dh?=
 =?big5?B?d1RvRFZ1MkFOblIreFl2aEVpQVI2Y2doZnBDZENiM1Rnak5lYy80Z1F6SnQwalpQ?=
 =?big5?B?R3NJUU9OdWxTV1dDMGxqa3NSWkJlTXNDakN5Z3plTGI5Q1lIZzRuRE1BVjRlampW?=
 =?big5?B?ZUVER2Q3RHM2eVRjVWtwVllnUEduZEhUZmpVS1lRWGx4QjhOZ1pUZTloYTBaK1JF?=
 =?big5?B?R3pIWmYwbFFqd3h4M3hjN2hRK24wSFRXeGgxb3ltMjFWQjZkakloVGRWSGJkaklo?=
 =?big5?B?K0JybVI5bmE2SzVQQ3NyY1hUVS9ET241bWdnV3YrbHB0RmhoUUMyaVdORG9GelpE?=
 =?big5?B?WlRIQTJScjMvQUlmS0tYczhVQW12Vkk1cTBTUWtPU29qUkhlT3RJUHUxQ0N3Q3Fx?=
 =?big5?B?aTBzRGdtR2RBYVhjTFVDOVROZ3c3Z0dqR01uVjZwTWZrYVNVYm5qeUlzc0VmM2o1?=
 =?big5?B?d0o4V0N6L0sxMmlaWitFNENKcDRRT3RZdEc1OEI5SUlKWWhRZjhSOHhmWnpLbC9B?=
 =?big5?B?M0kwWUpOS0ZJcUI5djRiZG9lYkF5d0R6TCtkU29uTzhHTVhOWkJJZzd0ajI3L2Y5?=
 =?big5?B?Q0FDTnVRZDlkalFwVW5nNGNDQ0ZaeUYvS2xIaEVhQ0E3ZmNaRWdEU1BURHo1eUlr?=
 =?big5?B?MjA1SkMyeVpLWEs5U3plRE9iOENGY3FmaklYZjNoek1WR0xLMXJaanlsclU3bE1t?=
 =?big5?B?aU50T1FkRjk0ckZxY2tqM29UZklTUnJPTkpSdlorTFlSTXdoUGhYM3dyNU9uME1P?=
 =?big5?B?VGxKUmRzbElCbHNzbnE4bFV1U2xhRjRmK09SRHhsb3FKcmpkRWxMNEpGc2p0SFFY?=
 =?big5?B?bjRRK3BmZ2J4Wk43YzdzYVdMOHJLbVVQR1E3d2JhcENKOUZLZzBid1Bua20wZ1Uv?=
 =?big5?B?TzNBeEdDSUhRUFhBNWlhM01SL0RCNjcrcWdFSXQydVYrNVlINkhFRUR3QW5BUkx0?=
 =?big5?Q?BAZs4PrTxk7NENojQ66AwmcOloiaUepK8KibWLOQP5oNBuoJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3346.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c595cb-6564-4526-b62a-08d91bfafd75
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 01:51:45.7400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwcSybA5h05VVXIgYDkYAdMHXgkTL712X+wo5xJvoXe9U48bgouaHA9Moa/OHwpIHpMZiIZXTiI4QTo4orGJYDNDgdjqReglAvxDMiIpuWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2116
X-Mailman-Approved-At: Mon, 24 May 2021 11:24:37 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEVkIFRhbm91cyA8ZWR0YW5vdXNAZ29v
Z2xlLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTWF5IDIwLCAyMDIxIDU6NDEgQU0NClRvOiBOYW4g
WmhvdSA8bmFuemhvdUBnb29nbGUuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsg
SnVuLUxpbiBDaGVuICizr6tUwE0pIDxKdW4tTGluLkNoZW5AcXVhbnRhdHcuY29tPjsgYnJhZGxl
eWJAZnV6emllc3F1aXJyZWwuY29tDQpTdWJqZWN0OiBSZTogU2ltcGxlU3RvcmFnZSBwcm9wb3Nh
bHMNCg0KT24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMjoyNyBQTSBOYW4gWmhvdSA8bmFuemhvdUBn
b29nbGUuY29tPiB3cm90ZToNCj4NCj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBFZCENCj4NCj4+
DQo+PiBZb3UndmUgYWxzbyBvbWl0dGVkIHdoYXQgcHJvcGVydGllcyB5b3UncmUgdHJ5aW5nIHRv
IHRhcmdldC4gIENvdWxkIA0KPj4geW91IHdhbGsgdGhyb3VnaCBhIGxpdHRsZSBiaXQgYWJvdXQg
d2hhdCB5b3UncmUgdHJ5aW5nIHRvIGFjY29tcGxpc2ggDQo+PiB3aXRoIHRoaXM/ICAoYmV5b25k
IGp1c3QgImltcGxlbWVudCB0aGUgcmVkZmlzaCBzY2hlbWFzKS4gIEFyZSB5b3UgDQo+PiB0cnlp
bmcgdG8gZ2V0IHNtYXJ0IGRhdGE/ICBqdXN0IGludmVudG9yeSBpbmZvcm1hdGlvbj8gIERvIHlv
dSBwbGFuIA0KPj4gdG8gcmVwcmVzZW50IGNvbm5lY3Rpb25zPw0KPg0KPg0KPiBBcyBhIGZpcnN0
IHN0ZXAsIHdlIGFyZSBvbmx5IGdvaW5nIHRvIGltcGxlbWVudCB0aHJlZSBwcm9wZXJ0aWVzLCBO
YW1lLCBQcmVzZW5jZSwgYW5kIFBvd2VyU3RhdHVzLiBXZSBkb24ndCBwbGFuIHRvIHJlcHJlc2Vu
dCBjb25uZWN0aW9ucyBhdCB0aGUgbW9tZW50Lg0KDQpJJ20gYXNzdW1pbmcgdGhlc2Ugd2lsbCBi
ZSB0aGUgZGJ1cyBwcm9wZXJ0aWVzIG5hbWVzLCBhcyByZWRmaXNoIGRvZXNuJ3QgcmVhbGx5IGhh
dmUgYSBwcmVzZW5jZSBwcm9wZXJ0eSBvciBhIHBvd2Vyc3RhdHVzIHByb3BlcnR5Lg0KV2l0aCB0
aGF0IHNhaWQsIHRoYXQgc2VlbXMgcmVhc29uYWJsZSB0byBtZSB0byB3YW50IHRvIGRvLCBidXQg
d2UgbmVlZCB0byBtYWtlIHN1cmUgd2UncmUgY2xlYXIgb24gaG93IHRoaXMgZGlmZmVycyBmcm9t
IHRoZSBleGlzdGluZyBEcml2ZSBpbnRlcmZhY2VzLg0KDQpBZnRlciBxdWVzdGlvbiBpbiByZWRm
aXNoIGZvcnVtLCBodHRwczovL3JlZGZpc2hmb3J1bS5jb20vdGhyZWFkLzQ4My9kaWZmZXJlbnQt
c3RvcmFnZS1zaW1wbGVzdG9yYWdlDQpXZSBnb3QgU2ltcGxlU3RvcmFnZSB3YXMgdGhlIGVhcmx5
IG1vZGVsIGluIFJlZGZpc2ggZm9yIHNob3dpbmcgc3RvcmFnZSBkZXZpY2VzLCBhbmQgIkRldmlj
ZXMiIGluIHRoaXMgcmVzb3VyY2UgZG8gZXF1YXRlIHRvIGRyaXZlcy4NCldlIHdvdWxkIHVzZSB4
eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5Ecml2ZSBpbnN0ZWFkIHh5ei5vcGVuYm1jX3By
b2plY3QuSW52ZW50b3J5LlNpbXBsZVN0b3JhZ2UgdG8gcmVwcmVzZW50IG91ciBzdG9yYWdlIGRl
dmljZS4NCg0KPg0KPiBPbiBXZWQsIE1heSAxOSwgMjAyMSBhdCAxOjQzIFBNIEVkIFRhbm91cyA8
ZWRAdGFub3VzLm5ldD4gd3JvdGU6DQo+Pg0KPj4gT24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMTI6
NTcgQU0gSnVuLUxpbiBDaGVuICizr6tUwE0pDQo+PiA8SnVuLUxpbi5DaGVuQHF1YW50YXR3LmNv
bT4gd3JvdGU6DQo+PiA+DQo+PiA+IEhpIGFsbCwNCj4+ID4NCj4+ID4NCj4+ID4NCj4+ID4gSW4g
b3JkZXIgdG8gaW1wbGVtZW50IHRoZSBmZWF0dXJlIHRvIHZpZXcgc2ltcGxlIHN0b3JhZ2UgZGV2
aWNlIHN0YXR1cywgc3VjaCBTQVRBIEhERCBwcmVzZW5jZSBzdGF0dXMuDQo+PiA+DQo+PiA+IFdl
IHByb3Bvc2UgdG8gaW1wbGVtZW50IGl0IG9uIHRoZSBSZWRmaXNoIFNpbXBsZVN0b3JhZ2UgVVJJ
Lg0KPj4gPg0KPj4gPg0KPj4gPg0KPj4gPiBBcyBvdXIgcHJvcG9zYWwgZm9yIFJlZGZpc2ggU2lt
cGxlU3RvcmFnZSwgDQo+PiA+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmcNCj4+ID4gZXJyaXQub3BlbmJtYy1wcm9qZWN0
Lnh5eiUyRmMlMkZvcGVuYm1jJTJGZG9jcyUyRiUyQiUyRjQzMzUyJmFtcDtkYQ0KPj4gPiB0YT0w
NCU3QzAxJTdDSnVuLUxpbi5DaGVuJTQwcXVhbnRhdHcuY29tJTdDZDQxOWVjZTZhOGQzNDRkOTNi
YmIwOGQ5DQo+PiA+IDFiMGVjNWM0JTdDMTc5YjAzMjcwN2ZjNDk3M2FjNzM4ZGU3MzEzNTYxYjIl
N0MxJTdDMCU3QzYzNzU3MDU3MzEyMjUNCj4+ID4gMTYzNjQlN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTA0KPj4gPiBDSkJUaUk2SWsx
aGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPUJ2SGExM0pBb3poaGF1NnF4UXFz
DQo+PiA+IDhYTWUxQlgxak1pMDU3aCUyQkZaNjdsSmslM0QmYW1wO3Jlc2VydmVkPTANCj4+ID4N
Cj4+ID4gQW5kIGFuIG5ldyBkYWVtb24sIA0KPj4gPiBodHRwczovL2FwYzAxLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnDQo+PiA+IGVycml0Lm9w
ZW5ibWMtcHJvamVjdC54eXolMkZjJTJGb3BlbmJtYyUyRmRvY3MlMkYlMkIlMkY0MzM1MSZhbXA7
ZGENCj4+ID4gdGE9MDQlN0MwMSU3Q0p1bi1MaW4uQ2hlbiU0MHF1YW50YXR3LmNvbSU3Q2Q0MTll
Y2U2YThkMzQ0ZDkzYmJiMDhkOQ0KPj4gPiAxYjBlYzVjNCU3QzE3OWIwMzI3MDdmYzQ5NzNhYzcz
OGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc1NzA1NzMxMjI1DQo+PiA+IDI2MzUyJTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUwNCj4+
ID4gQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT1jN1RTR05K
QzVCbE14V3dtRkJRSA0KPj4gPiBYM2dISDh4YlBFdTUzaHNOSHVuMDRKbyUzRCZhbXA7cmVzZXJ2
ZWQ9MA0KPj4gPg0KPj4gPg0KPj4gPg0KPj4gPiBUaGVyZSBhcmUgdHdvIG5ldyBkYnVzLWludGVy
ZmFjZXMgdG8gYmUgcHJvcG9zZWQsDQo+PiA+DQo+PiA+IHh5ei5vcGVuYm1jX3Byb2plY3QuSW52
ZW50b3J5Lkl0ZW0uU3RvcmFnZURldmljZTogaGVyZSBpcyBhbiBlbXB0eSBpbnRlcmZhY2UganVz
dCBtYXJrIHRoZSBkYnVzIHBhdGggdGhhdCBTaW1wbGVTdG9yYWdlIE1hbmFnZXIgc2hvdWxkIGNv
bGxlY3QuDQo+PiA+DQo+PiA+IHh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5Lkl0ZW0uU2lt
cGxlU3RvcmFnZTogaXQgc2hvdWxkIGhhdmUgdGhlIHByb3BlcnRpZXMgcmVkZmlzaCBuZWVkcywg
YW5kIGNhbiBiZSBwYXJzZXIgYnkgYm1jd2ViLg0KPj4NCj4+DQo+PiBIb3cgZG9lcyB0aGlzIGRp
ZmZlciBmcm9tIHh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5Lkl0ZW0uRHJpdmU/DQo+PiBU
aGV5IGxvb2sgZmFpcmx5IHNpbWlsYXI7ICBXZSBnZW5lcmFsbHkgZG9uJ3QgbmFtZSBkYnVzIGlu
dGVyZmFjZXMgDQo+PiBhZnRlciBSZWRmaXNoIGRpcmVjdGx5LiAgV2Ugc2hvdWxkIHJldXNlIHdo
YXQgYWxyZWFkeSBleGlzdHMgd2hlcmUgDQo+PiBwb3NzaWJsZSwgYW5kIG9ubHkgaW52ZW50IG5l
dyB0aGluZ3Mgd2hlcmUgbmVlZGVkLg0KPj4NCj4+IFlvdSd2ZSBhbHNvIG9taXR0ZWQgd2hhdCBw
cm9wZXJ0aWVzIHlvdSdyZSB0cnlpbmcgdG8gdGFyZ2V0LiAgQ291bGQgDQo+PiB5b3Ugd2FsayB0
aHJvdWdoIGEgbGl0dGxlIGJpdCBhYm91dCB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gYWNjb21wbGlz
aCANCj4+IHdpdGggdGhpcz8gIChiZXlvbmQganVzdCAiaW1wbGVtZW50IHRoZSByZWRmaXNoIHNj
aGVtYXMpLiAgQXJlIHlvdSANCj4+IHRyeWluZyB0byBnZXQgc21hcnQgZGF0YT8gIGp1c3QgaW52
ZW50b3J5IGluZm9ybWF0aW9uPyAgRG8geW91IHBsYW4gDQo+PiB0byByZXByZXNlbnQgY29ubmVj
dGlvbnM/DQo+Pg0KPj4gPg0KPj4gPg0KPj4gPg0KPj4gPiBUaGUgZGV0YWlscyBhcmUgaW4gdGhl
IHByb3Bvc2FsLg0KPj4gPg0KPj4gPg0KPj4gPg0KPj4gPiBXZWxjb21lIGFuZCB0aGFuayB5b3Ug
Zm9yIGNvbW1lbnRzIGFuZCBzdWdnZXN0aW9ucw0KPj4gPg0KPj4gPg0KPj4gPg0KPj4gPiBCZXN0
IHJlZ2FyZHMsDQo+PiA+DQo+PiA+IEp1bi1MaW4gQ2hlbg0KPj4gPg0KPj4gPg0K
