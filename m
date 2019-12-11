Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C911A39B
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 05:57:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xl6l09wRzDqH5
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 15:57:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=bonnie_lo@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.b="XVjxIv3m"; 
 dkim-atps=neutral
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Xl5q4Qw7zDqjc
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 15:56:53 +1100 (AEDT)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by
 TWNHUMSW2.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id
 <Tdc01714ebfc0a816701c6c@TWNHUMSW2.wistron.com>; 
 Wed, 11 Dec 2019 12:56:48 +0800
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP02.whq.wistron
 (10.37.38.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 12:56:45 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.37.38.71) by
 mail.wistron.com (10.37.38.26) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Dec 2019 12:56:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni9SdGmm/JWr0RbHCKUS2f96ipoAIdYl9Xi7ILD8CuyFf1kB6Jk41PHeD8+j5qaswQbksdKASeUZnLl833FDGv4n71MQijugi/bwO0IGwGESpNxtFgv972pB6dXWXy8FjpA8D4Z0GFe1S2UHle4Wiu6eUWU5z1XcDOKJ8lfMtf1QWanOmZhwrf5WvPEsUySArMc/sOpm0vTGoDWQWWraBq18Fz14rkmRG01P2cFwrKq65ueXnrnuCP2WurOaXDPWVP6yKY9NJRMwTaZLCfHNz+xAfXVnxssP4e7n90tguT7WQ4kel9t+VdmlhOZ+zEvd4S+WqKyUVc/rjROtwty6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciP4PkHuvKcnBt8/kRRwvJxj+g43n5lbPnjwA/xQOYM=;
 b=dLTdSwMz1C3pq7CLlZAwQ9JamI6nauGY4ZaYz9DjXfWYkOpjOWy9rNCfpIejo8PUbjoEbrRF0J9cNU0gRjRlwhjiRLUZPLrJ9XZ3dOujmWb6rpbJlNur1dl+wlOtMvCUaDQMsWyBZ00tGE96gpMTAXt4rZ3XDViPO1Mk/ZueAp21LOgHJ5qTkxHc2TIP5jlvecEJ3TJxGT/QkEkTdfNgN1ZTU+bsnvmbsW3EBYo26KOKD7WASOWXC/1+kQgdRZYGk60ceuSteLsDNDwkPQVCKtDT/JNcuG6c3oLWqjcCqSdyKUKezPRxzdN3Im14Is9zx2A4mZ13ohnZS2wRyWnwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciP4PkHuvKcnBt8/kRRwvJxj+g43n5lbPnjwA/xQOYM=;
 b=XVjxIv3mBhzJilq/v8wgv6lo2iz542nBfqkAlY5Ff5EryQbbomZCWS7Moezc1SfDC0fcmcxl0PAqiRwxc9CB271dNXtiFPivP2qjg5y7AW+FR7PPsHnokLvptTUB3JqFIuSR1Ce1NSapuC5ESnIanbB1nZZacYCs6dASHSe7RSw=
Received: from HK0PR02MB2787.apcprd02.prod.outlook.com (20.177.27.143) by
 HK0PR02MB2739.apcprd02.prod.outlook.com (20.177.27.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 04:56:41 +0000
Received: from HK0PR02MB2787.apcprd02.prod.outlook.com
 ([fe80::c060:69c:e444:f64a]) by HK0PR02MB2787.apcprd02.prod.outlook.com
 ([fe80::c060:69c:e444:f64a%3]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 04:56:41 +0000
From: Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Neeraj Ladkani
 <neladk@microsoft.com>, Alexander Tereschenko
 <aleksandr.v.tereschenko@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Patrick Venture <venture@google.com>
Subject: RE: [EXTERNAL] Re: BMC update via TFTP
Thread-Topic: [EXTERNAL] Re: BMC update via TFTP
Thread-Index: AQHVqdIbgwscok6sWE2rTV4j0s5t+6eolVYAgAAPrQCAAC5/gIABTQcAgABhsgCAAOHdAIAAwVEAgAEC1ICAAJPWgIAE4gaEgAElygCAACUVgIAAJJsQ
Importance: high
X-Priority: 1
Date: Wed, 11 Dec 2019 04:56:41 +0000
Message-ID: <HK0PR02MB27870548BFF1A91BC86ADC19F85A0@HK0PR02MB2787.apcprd02.prod.outlook.com>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
 <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
 <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
 <DM6PR21MB1388F87CA03203F0C5F9F331C85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <b13a3d03-333b-e5b7-b6b1-28159f233a2d@linux.ibm.com>
In-Reply-To: <b13a3d03-333b-e5b7-b6b1-28159f233a2d@linux.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Bonnie_Lo@wiwynn.com; 
x-originating-ip: [50.225.11.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6726157-f2db-4437-d5c9-08d77df68368
x-ms-traffictypediagnostic: HK0PR02MB2739:|HK0PR02MB2739:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR02MB2739A43C344D8A99478C1A60F85A0@HK0PR02MB2739.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(39840400004)(136003)(189003)(199004)(13464003)(7696005)(45080400002)(86362001)(53546011)(478600001)(66476007)(2906002)(66446008)(966005)(64756008)(66946007)(110136005)(66556008)(54906003)(316002)(15650500001)(186003)(8936002)(5660300002)(4326008)(107886003)(6506007)(81156014)(81166006)(8676002)(55016002)(52536014)(33656002)(76116006)(26005)(9686003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK0PR02MB2739;
 H:HK0PR02MB2787.apcprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wiwynn.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ETfK6XwI3ri+5gyfsnzEfTabgmIgXlLM+igbYnpNEwH2F3WMF6H9BrTmlK23o1lQdVbQjE8fDrEYkJIPacKBn7QIuaBaWx9Vss8mo3nbWPkQNTMt364Z2RygBf+FbNLp0HZDViY3Tp7JmBfWOSR+3lpqna6YnhwxICccDew/7znwhrtTY7GUZh0z3gt4bsFzl2LexAIQgpDjGIQUdLh53X/Dj8EcokP5ZPMsk9SYyXST3QsSku/j1mYjTLD5c3Ce+ZXx6IPO+mmN/wKLF1Cs/G7vzmdQoloODOXDmdaH9pegOc6+gpYbm/pnjho+u+rKb9Ei6ybfB1bpkkj4nYhs/gzo5Td+1rkufwoYVAliP2YZMV3gzbrFhbrbbHji5NlGSzvxR+HM5fOzSKTuP5/muHa2i9fwbkabVEXJ9g8jsMPSOJXj95Osfl/DA9gQPeiM0zoBdtvfvT2zLwIPkV4Bp9sw/JNLEX2JLpnZt7N4UDwLKq8cfWm3e5PmSSZ2JC8B35K9wgGZJrJjRqnwp5sDxwHuS5+CsUTkHSTubpiBnxI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b6726157-f2db-4437-d5c9-08d77df68368
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 04:56:41.4987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RDSpZsc+j5cvD/+tOEK/ogmcTX3xSN55xNPM2FvQZKHRFiOIcU2KW/Hwk8SYLHyli142kzgCHGECM9coPCCeCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2739
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: 64CDC9A5AE08B85BCE4AD00921DE470E2EEDC993908F4305E1F4D3CCAE7DB1F62000:8
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
Cc: Aldofo Lin/WYHQ/Wiwynn <ALDOFO_LIN@wiwynn.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RGVhciBKb3NlcGgsDQoNCkluIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBCTUMgZmlybXdhcmUgdXBk
YXRlIGZsb3cgaXMgYXMgYmVsb3c6DQoxLiBUcmlnZ2VyIHJlYm9vdCANCjIuIFN5c3RlbWQgc3Rv
cCBhbGwgc2VydmljZQ0KMy4gVW5tb3VudCBmaWxlIHN5c3RlbQ0KNC4gaW1hZ2UgaXMgaW4gL3J1
bi9pbml0cmFtZnMgDQo1LiBEbyB0aGUgZmxhc2hjcCBjb21tYW5kIHRvIHVwZGF0ZSB0aGUgZmxh
c2ggDQoNCklmIHRoZXJlIGlzIGFueSBtaXN1bmRlcnN0YW5kaW5nLCBwbGVhc2UgY29ycmVjdCBt
ZS4NCg0KQmFzZWQgb24gdGhlIGRpc2N1c3Npb24gd2l0aCBOZWVyYWouDQpXZSB3YW50IHRvIGJl
IGFibGUgdG8gdXBkYXRlIEJNQyBmaXJtd2FyZSB3aXRob3V0IGhhdmluZyB0byB0cmlnZ2VyIHRo
ZSBCTUMgcmVib290IGNvbW1hbmQgYmVmb3JlIHRoZSBzeXN0ZW0gZG8gZmxhc2hjcCBjb21tYW5k
Lg0KSXQgbWVhbnMgdGhhdCB3ZSBjYW4gZG8gdGhlIGZsYXNoY3AgZmlyc3QuIElmIHRoZSBmbGFz
aGNwIGNvbW1hbmQgY29tcGxldGUgYW5kIHN1Y2Nlc3MsIHRoZW4gd2UgZG8gdGhlIHJlc2V0IG1h
bnVhbGx5Lg0KSXMgaXQgd29ya2FibGUgb24gY3VycmVudCB1cHN0cmVhbSBjb2RlPw0KSWYgbm90
LCB3aHk/IEkgbWVhbnMgaXMgdGhlcmUgYW55IGFkdmFudGFnZSB0byB0cmlnZ2VyIHRoZSByZWJv
b3QgYmVmb3JlIHdlIGRvIHRoZSBmbGFzaGNwLg0KDQpUaGFua3MsDQpCb25uaWUNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytib25u
aWVfbG89d2l3eW5uLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgSm9zZXBoIFJl
eW5vbGRzDQpTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDExLCAyMDE5IDU6MTEgQU0NClRvOiBO
ZWVyYWogTGFka2FuaSA8bmVsYWRrQG1pY3Jvc29mdC5jb20+OyBBbGV4YW5kZXIgVGVyZXNjaGVu
a28gPGFsZWtzYW5kci52LnRlcmVzY2hlbmtvQGxpbnV4LmludGVsLmNvbT47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZzsgUGF0cmljayBWZW50dXJlIDx2ZW50dXJlQGdvb2dsZS5jb20+DQpTdWJq
ZWN0OiBSZTogW0VYVEVSTkFMXSBSZTogQk1DIHVwZGF0ZSB2aWEgVEZUUA0KDQpPbiAxMi8xMC8x
OSAxMjo1OCBQTSwgTmVlcmFqIExhZGthbmkgd3JvdGU6DQo+IEFyZSB0aGVyZSBhbnkgdGhvdWdo
dHMgdG8gZ2V0IHJpZCBvZiBCTUMgcmVzZXQgdG8gdHJpZ2dlciBGVyB1cGRhdGU/IEkgdW5kZXJz
dGFuZCBGVyByZXNldCBpcyByZXF1aXJlZCBhZnRlciB0aGUgdXBkYXRlLg0KDQpJJ20gbm90IHN1
cmUgSSB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbi7CoCBJIHRoaW5rIHRoZSBhbnN3ZXIgZGVwZW5k
cyBvbiB0aGUgW1NvZnR3YXJlLlZlcnNpb25QdXJwb3NlXVsxXS4NCkZvciBWZXJzaW9uUHVycG9z
ZT1CTUMgb3IgU3lzdGVtLCB0aGUgQk1DIG11c3QgYmUgcmVzZXQuDQpGb3IgVmVyc2lvblB1cnBv
c2U9SG9zdCwgUFNVLCBvciBPdGhlciwgSSBkb24ndCBrbm93IHdoeSB0aGUgQk1DIHdvdWxkIG5l
ZWQgdG8gYmUgcmVzZXQuDQoNCkRvIHlvdSB3YW50IHRvIGJlIGFibGUgdG8gdXBkYXRlIG5vbi1C
TUMgZmlybXdhcmUgd2l0aG91dCBoYXZpbmcgdG8gcmVzZXQgdGhlIEJNQz8NCg0KLSBKb3NlcGgN
Cg0KWzFdOiANCmh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGcGhvc3Bob3ItZGJ1cy1p
bnRlcmZhY2VzJTJGYmxvYiUyRm1hc3RlciUyRnh5eiUyRm9wZW5ibWNfcHJvamVjdCUyRlNvZnR3
YXJlJTJGVmVyc2lvbi5pbnRlcmZhY2UueWFtbCZhbXA7ZGF0YT0wMiU3QzAxJTdDQm9ubmllX0xv
JTQwd2l3eW5uLmNvbSU3QzlkNTZkNzAyY2VhNTRlNTJlMjk4MDhkNzdkYjYzMGExJTdDZGUwNzk1
ZTBkN2MwNGVlYmI5YmJiYzk0ZDg5ODBkM2IlN0MxJTdDMCU3QzYzNzExNjA5Mzc2ODk0Nzc5MyZh
bXA7c2RhdGE9dkFoM2tEejJvbnE4YjAlMkZseDFBeVBOeUZuZ3lQTGFnN2dvJTJGcnV3OW5FdFUl
M0QmYW1wO3Jlc2VydmVkPTANCg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29mdC5jb21AbGlzdHMu
b3psYWJzLm9yZz4gDQo+IE9uIEJlaGFsZiBPZiBKb3NlcGggUmV5bm9sZHMNCj4gU2VudDogTW9u
ZGF5LCBEZWNlbWJlciA5LCAyMDE5IDU6MjUgUE0NCj4gVG86IEFsZXhhbmRlciBUZXJlc2NoZW5r
byA8YWxla3NhbmRyLnYudGVyZXNjaGVua29AbGludXguaW50ZWwuY29tPjsgDQo+IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBCTUMgdXBkYXRlIHZp
YSBURlRQDQo+DQo+IE9uIDEyLzkvMTkgMTA6MDYgQU0sIEFsZXhhbmRlciBUZXJlc2NoZW5rbyB3
cm90ZToNCj4+IE9uIDA2LURlYy0xOSAyMzo1MiwgSm9zZXBoIFJleW5vbGRzIHdyb3RlOg0KPj4+
IEkgd2FzIHRoaW5raW5nIGFsb25nIHRoZSBsaW5lcyBvZiBhZGRpbmcgW1NGVFBdW10gKG9yIFND
UCkgc3VwcG9ydCANCj4+PiBhbmQgdGhlbiBtaWdyYXRpbmcgZXhpc3RpbmcgVEZUUCB1c2VycyB0
byB0aGUgbmV3IHNlY3VyZSBzb2x1dGlvbi4NCg0KWy4uLnNuaXAuLi5dDQoNCj4+IFllcywgdGhh
dCBjb3VsZCBiZSBhIHNvbHV0aW9uIGZvciB0aGUgcHJvYmxlbSB3ZSBkaXNjdXNzLCBwcm92aWRp
bmcgDQo+PiBib3RoIGludGVncml0eSBhbmQgY29uZmlkZW50aWFsaXR5LCB3aXRob3V0IGFueSBt
YWpvciBPcGVuQk1DIA0KPj4gZGV2ZWxvcG1lbnQgbmVjZXNzYXJ5IC0gYnV0IGl0IHdvdWxkIG1l
YW4gbW9yZSBvcGVyYXRpb25hbCBidXJkZW4gZm9yIA0KPj4gQk1DIGFkbWlucy4gVGhlIHByb2Js
ZW0gd2l0aCBTQ1AvU0ZUUCBpbiB0aGlzIGNvbnRleHQgaXMgdGhhdCBmb3IgDQo+PiB0aGlzIHRv
IHdvcmsgaW4gdGhlIHNhbWUgbWFubmVyIGFzIFRGVFAsIHRoZSBCTUMgbXVzdCBiZSBhbiBTU0gg
DQo+PiBjbGllbnQgLSBpLmUuIGhhdmUgc29tZSBzb3J0IG9mIGlkZW50aXR5L2NyZWRlbnRpYWxz
IGZvciB0aGUgU0NQL1NGVFAgDQo+PiBzZXJ2ZXIgcHJvdmlzaW9uZWQgZmlyc3QuIFRoYXQgbWln
aHQgbm90IGJlIHRoZSBlYXNpZXN0IHNvbHV0aW9uIHRvIA0KPj4gc2V0dXAsIGJ1dCBpdCdzIG9m
IGNvdXJzZSBwb3NzaWJsZSBhbmQgY2FuIGJlIGF1dG9tYXRlZCBpZiBPcGVuQk1DIA0KPj4gcHJv
dmlkZXMgcmVzcGVjdGl2ZSBjb25maWcga25vYnMuDQo+Pg0KPj4gRXhpc3Rpbmcgd2F5cyB3ZSBo
YXZlIGluIGNvZGUtdXBkYXRlLm1kIGVpdGhlciBkb24ndCByZXF1aXJlIA0KPj4gY3JlZGVudGlh
bHMgKFRGVFApLCBzbyBiZWluZyBhIGNsaWVudCBpcyBlYXN5LCBvciBhcmUgbm90IG1ha2luZyBh
IA0KPj4gImNsaWVudCIgZnJvbSBCTUMsIGl0J3MgdGhlIGFkbWluIHdobyB1cGxvYWRzIHN0dWZm
IChTQ1AvUkVTVCkuDQo+IFllcywgdGhhdCdzIHdoYXQgSSB3YXMgdGhpbmtpbmcuwqAgKEFuZCBu
bywgSSBhbSBub3QgZ29pbmcgdG8gcmVjb21tZW5kIA0KPiBzZXR0aW5nIHVwIGEgU0NQIG9yIFNG
VFAgc2VydmVyIHRoYXQgYWxsb3dzIGFub255bW91cyBhY2Nlc3MuKQ0KPg0KPiBUaGlzIGhpZ2hs
aWdodCB0aGUgbmVlZCBmb3IgT3BlbkJNQyB0byBwdXQgdG9nZXRoZXIgYSBndWlkZSB0byBwcm92
aXNpb25pbmcgeW91ciBCTUMuwqDCoMKgIFN1Y2ggYXMgZ3VpZGUgd291bGQgZ2l2ZSB1cyBhIHBs
YWNlIHRvIHRhbGsgYWJvdXQgdXBsb2FkaW5nIHRvIHRoZSBCTUMgU1NIIGNsaWVudCBjZXJ0aWZp
Y2F0ZXMgbmVlZGVkIHRvIGFjY2VzcyBhbmQgZG93bmxvYWQgdGhlIGZpcm13YXJlIGltYWdlcy4N
Cj4NCj4gLSBKb3NlcGgNCj4NCj4+IHJlZ2FyZHMsDQo+PiBBbGV4YW5kZXINCj4+DQoNCg==
