Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F632135650
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 10:56:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47thNK46dQzDqZD
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 20:56:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=maciej.lawniczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=Ok+1wUyR; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47thMQ44LHzDqY2
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 20:55:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 01:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; d="scan'208";a="423200959"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2020 01:55:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 9 Jan 2020 01:55:42 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 9 Jan 2020 01:55:42 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 9 Jan 2020 01:55:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 9 Jan 2020 01:55:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBRTLS7CvATAnNhBEt72mWPcqcULWvZ5ZHfGiINUcBHCx4pGfd2uqXWDCPkKKlZNoLtw0h+/82pe+rFTuZ1tOVrUpKypCmniC2nDf/S1onjUTvDC3NLYE8hQtJDd/okA/A0MvruWkuT6ACKK7JoE6txunHJRu4VhtTQO/BcVzv2pwdQGr+vTT9dqGEgB5yNYRprW8ijr7I3gq6zWC8QvQA8Do8o5vk1vfC5E882SsoHoMMHRqjV1Ds0Pn58LCL684W1qVN2tx/L3bFEyw4A2FOdMFM908+S7NMcZvf0kntTLFg5hGo/0p8vHev8C6GmOnEpTkaQyqbMqFhV5gqW9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGl+ogrNWqeSFax3S6nMcFyfWhEdOEjFNTf8YAq9ra0=;
 b=P7t5iZ9iq4tdYO2cguxmJpLAOfCYWouOTfllCkh4eDaTPUn2qfhp8cn1HKvUacsLwp0CWB5sXvOZdbK140RLZEbtkELcqQFN9OZze08L/hwQkqBhkUAP7rsGmuHMJHcAOL1hjbmOxgrhmr5T0bozs3shwsKuRA+i0ln2Ly7ZmC3EDYDztCQNHl3aI7vSlHqesOmUdufc3MSs0yRA7aqeoIBRyPd0EkSbnPjQx34DrApUns1w1UCe9LuCs+6v6BacFHnL3cCrSU8iQAcmogsJoCGiUUMHqOlBUlK81GccvSoiif8KqIZtQGpOWZJipZr6k2YRPnLJrpyExa+d6IYAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGl+ogrNWqeSFax3S6nMcFyfWhEdOEjFNTf8YAq9ra0=;
 b=Ok+1wUyRSYiXCwXyVyqE01eIVt7gq/SV5MFK5VBaCEjA9RIuppb80H1RPDMNZ7+hQw5T1ghvNmGrQNfofa7TGrJR/nvQdGIh9ZHAG3TKI/9rP3gdWzIWoq85siqlXIjhXal2uz8VlwpVdFs4z1jU+cEBMaq5GBupZTnS05D5bJM=
Received: from DM5PR1101MB2332.namprd11.prod.outlook.com (10.173.173.140) by
 DM5PR1101MB2204.namprd11.prod.outlook.com (10.174.108.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 09:55:39 +0000
Received: from DM5PR1101MB2332.namprd11.prod.outlook.com
 ([fe80::c117:1588:923c:9769]) by DM5PR1101MB2332.namprd11.prod.outlook.com
 ([fe80::c117:1588:923c:9769%3]) with mapi id 15.20.2602.018; Thu, 9 Jan 2020
 09:55:39 +0000
From: "Lawniczak, Maciej" <maciej.lawniczak@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>
Subject: RE: Redfish Dump Service Proposal
Thread-Topic: Redfish Dump Service Proposal
Thread-Index: AQHVr0vtlDl8w6pdzUSeBojN5AuYeqe2FviAgAEqjQCAAFEWgIAA7vQAgCjdigCAAAqnAIAAKkCAgACZjRA=
Date: Thu, 9 Jan 2020 09:55:39 +0000
Message-ID: <DM5PR1101MB23326D3C31109ED246E1D8C786390@DM5PR1101MB2332.namprd11.prod.outlook.com>
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
 <B3B51CCE-D255-489C-9C4C-57DB2F962B31@fuzziesquirrel.com>
 <8ee2690f-0149-3ac3-118a-5489b48afd79@linux.intel.com>
 <E196EA8B-B261-4D5C-BE48-C86112145D73@fuzziesquirrel.com>
In-Reply-To: <E196EA8B-B261-4D5C-BE48-C86112145D73@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWJhZjk1NzMtODY5Mi00OWRhLTgxMzMtMGRhNzIxMzIzYTE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSE1ZMTlmQ1ViMmg4dmRhNm1nb3NZR1hMR2g3XC9LSmEwTVY4dnJ5aFZOY05cL1BEdFJqSFJZZ1dkZURXZnBNYzRuIn0=
x-ctpclassification: CTP_NT
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maciej.lawniczak@intel.com; 
x-originating-ip: [134.191.221.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da57a44d-4008-4c4f-cee6-08d794ea1566
x-ms-traffictypediagnostic: DM5PR1101MB2204:
x-microsoft-antispam-prvs: <DM5PR1101MB2204F4F10C528060F83FBD8A86390@DM5PR1101MB2204.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(376002)(39860400002)(136003)(189003)(199004)(7696005)(478600001)(4326008)(6506007)(316002)(53546011)(966005)(5660300002)(86362001)(186003)(52536014)(26005)(8936002)(81156014)(9686003)(2906002)(3480700007)(55016002)(76116006)(66946007)(66446008)(33656002)(66556008)(64756008)(66476007)(81166006)(110136005)(71200400001)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1101MB2204;
 H:DM5PR1101MB2332.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BRzTgL7oHCcQJTOwd1pzBP4GVow4ahQfBoo2Grpppl7t2xHdp/pHxBw7FrJRen5qE1oFC88gUcZs7bWMQgcc1O82pmIag4qKsz5y+guOWrdr6JFYEJDXVfaJ4uLwu5H/tcMUcyBVMMeaSWs9IUeVPpDxIkwycvoWpegBuDD99YU0EHYQJT43vPUNyLUBpi7vupd/41aPfYarvHcFrnpewGOqpL8Q2FxIDHxxNztZ+BM9MhMhWkzveJK48wV+Y1x82b9UaQrku2UzR1YxxWg5ImqOZmyG62QrSU9N2REOw71AY+6bmDHX0Nilnq1vkSUA+U8bliP7n9vk/ukaT6CFB3jdaYr+tQiYv8M/EY05Mh5xKYNi2T/nVORci4UvO1LfbRKF9zIxMEdPje5RyEvpmkKCC+kGV+RDxU0u8q1jTvtLqDigRVe6RTEgnwFbKUtQNnKJZUeAMjtK1efFE9dQsvKuRqmhFWLu4P/1IEgDzjIlKurg5qeDu7HdM7E8NPfBdrcbrUVNCiXy5ghbKARl7w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da57a44d-4008-4c4f-cee6-08d794ea1566
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 09:55:39.6732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q00ZH6tFLUZ6zUbR4MOa7/BdJTJHvh75mm8naG3CTI8uOy0o9OUQXXzusg1Q5mIn5sIUURbwW8oW60MVSUsLIKyO03PmH8LPmbcogvo64Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2204
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgZ3V5cywNCg0KRmV3IHJlbWFya3Mgb24gYmVsb3cgdG9waWMuDQoNCkN1cnJlbnQgc29sdXRp
b24gd2lsbCBub3QgYWxsb3cgZm9yIGNvbmZpZ3VyYXRpb24gb2Ygc3BlY2lmaWMgZHVtcCBhcHBs
aWNhdGlvbnMgZS5nLjoNCi0gbnVtYmVyIG9mIGR1bXBzIHN0b3JlZCAtIHRoaXMgY2FuIGRpZmZl
ciBiZXR3ZWVuIGVhY2ggZHVtcCB0eXBlcyAod2UgY2FuIHNldCBoaWdoZXIgbGltaXQgZm9yIHNt
YWxsZXIgZHVtcHMgYW5kIHNtYWxsZXIgZm9yIGJpZyBvbmVzKQ0KLSB0eXBlIG9mIGRhdGEgZ2F0
aGVyZWQgLSBpbiBzb21lIHVzZSBjYXNlcyB0eXBlIG9mIHRyaWdnZXIgZGVmaW5lcyB3aGF0IGtp
bmQgb2YgZGF0YSBzaG91bGQgYmUgZ2F0aGVyZWQuIENvcnJlbGF0aW9uIGJldHdlZW4gdHJpZ2dl
ciBhbmQgZGF0YSBnYXRoZXJlZCBjYW4gYmUgY29uZmlndXJhYmxlLg0KLSB0cmlnZ2VycyB0byBz
dGFydCBkdW1wIGNvbGxlY3Rpb24gLSB1c2VyIHNob3VsZCBoYXZlIGFuIG9wdGlvbiB0byBzZXQg
d2hpY2gga2luZCBvZiB0cmlnZ2VycyB3aWxsIGNhdXNlIGR1bXAgY29sbGVjdGlvbg0KDQpEdW1w
IFNlcnZpY2UgY291bGQgYmUgY29sbGVjdGlvbiBvZiBkZXZpY2Ugc3BlY2lmaWMgZHVtcCBzZXJ2
aWNlcyBlYWNoIHdpdGggaXRzIG93biBjb25maWd1cmF0aW9uLg0KVGhlc2UgY29uZmlndXJhdGlv
biBvcHRpb25zIChhbmQgbWF5YmUgb3RoZXJzKSBjb3VsZCBiZSBpbmNsdWRlZCBpbiBjb25maWd1
cmF0aW9uIHBhcnQgb2YgZWFjaCBzcGVjaWZpYyBkdW1wIHNlcnZpY2UuDQoNClR5cGUgb2YgRHVt
cCBhcyBhbiBlbnVtIGZpZWxkIGNhbiBicmluZyBzb21lIGNoYWxsZW5nZXMgYmVjYXVzZSB0aGVy
ZSB3aWxsIGJlIG1vcmUgZGV2aWNlcyBpbiBmdXR1cmUgdGhhdCB3ZSB3aWxsIGJlIGFibGUgdG8g
Y29sbGVjdCBkdW1wcyBmcm9tLg0KQ2hhbmdpbmcgdGhpcyBmaWVsZCBpbiBETVRGIGV2ZXJ5IHRp
bWUgZm9yIG5ldyBkZXZpY2UgdHlwZSB3aWxsIGFkZCBleHRyYSB3b3JrIG9uIGJvdGggT3BlbkJN
QyBhbmQgRE1URiBzaWRlLg0KSXMgdGhlcmUgYSByZWFzb24gd2h5IHRoaXMgZmllbGQgY291bGQg
bm90IGJlIGEgc3RyaW5nPyBXZSB3aWxsIHN0aWxsIHVzZSBzb21lIGJhc2ljIHR5cGVzIGFzIEhv
c3Qgb3IgQk1DIGJ1dCBpdCB3aWxsIGFsbG93IHRvIGFkZCBkdW1wcyBmcm9tIGRpZmZlcmVudCBw
bGF0Zm9ybSBjb21wb25lbnRzIGVhc2lseS4NCg0KUmVnYXJkcywNCk1hY2llag0KDQo+IE9uIEph
biA4LCAyMDIwLCBhdCAzOjQyIFBNLCBCaWxscywgSmFzb24gTSA8amFzb24ubS5iaWxsc0BsaW51
eC5pbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxLzgvMjAyMCAxMjowNCBQTSwg
QnJhZCBCaXNob3Agd3JvdGU6DQo+Pj4gT24gRGVjIDEzLCAyMDE5LCBhdCAzOjAxIFBNLCBCaWxs
cywgSmFzb24gTSA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPj4+IA0K
Pj4+IEkgbGlrZSB0aGlzIGFzIHdlbGwuICBJJ20gdHJ5aW5nIHRvIHN1cHBvcnQgYSBDUFUgY3Jh
c2hkdW1wIHRoYXQgd291bGQgZml0IHBlcmZlY3RseSB3aXRoIHRoaXMgcHJvcG9zYWwuDQo+PiBI
aSBKYXNvbg0KPj4gQ291bGQgeW91IHNheSBhIGZldyB3b3JkcyBhYm91dCBob3cgeW91ciBjcmFz
aCBkdW1wIHNlcnZpY2Ugd29ya3M/ICBJ4oCZbSBhc2tpbmcgYmVjYXVzZSBEaHJ1diBpcyB3b3Jr
aW5nIG9uIGFuIGltcGxlbWVudGF0aW9uIG9mIHRoaXMgcHJvcG9zYWw6DQo+IA0KPiBTdXJlLg0K
PiANCj4gSSBoYXZlIGEgc2VydmljZSBjYWxsZWQgaG9zdC1lcnJvci1tb25pdG9yIHRoYXQgd2F0
Y2hlcyBmb3IgZXJyb3Igc2lnbmFscyBmcm9tIHRoZSBob3N0LiAgV2hlbiBhIENQVSBmYXRhbCBl
cnJvciBvY2N1cnMsIHRoZSBob3N0LWVycm9yLW1vbml0b3IgdHJpZ2dlcnMgYSBjcmFzaGR1bXAg
ZnJvbSB0aGUgY3Jhc2hkdW1wIHNlcnZpY2UuDQo+IA0KPiBUaGUgY3Jhc2hkdW1wIHNlcnZpY2Ug
aXRzZWxmIGlzIHZlcnkgbWluaW1hbCB0b2RheS4gIEl0IGhhcyB0d28gdHJpZ2dlciBtZXRob2Rz
IG9uIERCdXMuICBPbmUgaXMgdG8gdHJpZ2dlciBhIGxvZyBmb3IgYSByZWFsIGVycm9yIHRoYXQg
bWF5IG5lZWQgdG8gYmUgc3RvcmVkIG9uIHRoZSBCTUMuICBUaGUgb3RoZXIgaXMgdG8gdHJpZ2dl
ciBhIG1hbnVhbCBsb2cgdGhhdCBkb2VzIG5vdCBuZWVkIHRvIHBlcnNpc3QuDQo+IA0KPiBXaGVu
IHRyaWdnZXJlZCwgdGhlIEJNQyByZWFkcyB0aGUgY3Jhc2ggZGF0YSBmcm9tIHRoZSBDUFUgdXNp
bmcgUEVDSS4gQWZ0ZXIgYSBsb2cgaGFzIGJlZW4gY29tcGxldGVkLCBpdCBpcyBhZGRlZCB0byBE
QnVzIGFzIGEgbmV3IG9iamVjdCB3aXRoIGEgJ0xvZycgcHJvcGVydHkgd2hpY2ggaG9sZHMgdGhl
IGNvbnRlbnRzIG9mIHRoZSBsb2cgYXMgYSBzdHJpbmcuDQo+IA0KPiBUaGUgaG9zdC1lcnJvci1t
b25pdG9yIHNvdXJjZSBpcyBzaGFyZWQgaGVyZTogaHR0cHM6Ly9naXRodWIuY29tL0ludGVsLUJN
Qy9ob3N0LWVycm9yLW1vbml0b3IuDQo+IFRoZSBjcmFzaGR1bXAgc291cmNlIGlzIG5vdCBjdXJy
ZW50bHkgbGljZW5zZWQgZm9yIHB1YmxpYyBhY2Nlc3MuDQoNClRoYW5rcyBmb3Igc2hhcmluZyEN
Cg0KPiANCj4+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2Rv
Y3MvKy8yODI2MA0KPj4gUmlnaHQgbm93IGl0IGxvb2tzIHByZXR0eSBQT1dFUi1jZW50cmljIGJ1
dCBkZXBlbmRpbmcgb24gaG93IHlvdXIgY29kZSB3b3JrcyBJ4oCZbSB3b25kZXJpbmcgd2hpY2gg
bWFrZXMgbW9yZSBzZW5zZToNCj4+IDEgLSBhIHNpbmdsZSBpbXBsZW1lbnRhdGlvbiB3aXRoIOKA
lC1lbmFibGUtcG93ZXIg4oCULWVuYWJsZS14ODYgdHlwZSBjb25maWd1cmUgb3B0aW9ucy4NCj4+
IC1vci0NCj4+IDIgLSB0d28gY29tcGxldGVseSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25zIHdp
dGggdGhlIHNhbWUgZGJ1cyBpbnRlcmZhY2VzLg0KPiBJIHRoaW5rIHRoaXMgaXMgcHJvYmFibHkg
dGhlIHNpbXBsZXN0IGFwcHJvYWNoLiAgSXQgd2lsbCBhbGxvdyB1cyB0byBzdGFuZGFyZGl6ZSB0
aGUgUmVkZmlzaCBpbnRlcmZhY2Ugd2l0aG91dCB3b3JyeWluZyBhYm91dCB0aGUgYWN0dWFsIGxv
ZyBjb2xsZWN0aW9uLg0KDQpPaywgc291bmRzIGdvb2QuICBJZiB5b3UgYXJlIGFibGUgdG8gZmlu
ZCB0aGUgdGltZSBpdCB3b3VsZCBiZSBnb29kIGlmIHlvdSBjb3VsZCBsb29rIGF0IERocnV2cyBw
cm9wb3NhbCBqdXN0IGZyb20gYSBEQnVzIGludGVyZmFjZSBwZXJzcGVjdGl2ZS4gIFRoYXQgd2F5
IHdlIGFsbCBkb27igJl0IGhhdmUgdG8gZGVhbCB3aXRoIHR3byBkaWZmZXJlbnQgREJ1cyBkYXRh
IG1vZGVscyBmb3IgZ2F0aGVyaW5nIGR1bXBzIGluIGJtY3dlYiB3aGVuIHlvdSBlbmQgdXAgaW1w
bGVtZW50aW5nIHRoZSB4ODYgdmVyc2lvbi4NCg0KPiANCj4gSSBhbHNvIHRoaW5rIHdlIGNhbiBt
b3ZlIGZyb20gdGhpcyB0b3dhcmQgb3B0aW9uIDEgaWYgd2UgZmluZCBhIGxvdCBvZiBjb21tb25h
bGl0aWVzIGluIHRoZSBmdXR1cmUuDQoNCkF3ZXNvbWUhDQoNCnRoeCAtIGJyYWQNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCgpJbnRlbCBUZWNobm9sb2d5IFBvbGFuZCBzcC4geiBvLm8uCnVsLiBTbG93YWNraWVnbyAx
NzMgfCA4MC0yOTggR2RhbnNrIHwgU2FkIFJlam9ub3d5IEdkYW5zayBQb2xub2MgfCBWSUkgV3lk
emlhbCBHb3Nwb2RhcmN6eSBLcmFqb3dlZ28gUmVqZXN0cnUgU2Fkb3dlZ28gLSBLUlMgMTAxODgy
IHwgTklQIDk1Ny0wNy01Mi0zMTYgfCBLYXBpdGFsIHpha2xhZG93eSAyMDAuMDAwIFBMTi4KClRh
IHdpYWRvbW9zYyB3cmF6IHogemFsYWN6bmlrYW1pIGplc3QgcHJ6ZXpuYWN6b25hIGRsYSBva3Jl
c2xvbmVnbyBhZHJlc2F0YSBpIG1vemUgemF3aWVyYWMgaW5mb3JtYWNqZSBwb3VmbmUuIFcgcmF6
aWUgcHJ6eXBhZGtvd2VnbyBvdHJ6eW1hbmlhIHRlaiB3aWFkb21vc2NpLCBwcm9zaW15IG8gcG93
aWFkb21pZW5pZSBuYWRhd2N5IG9yYXogdHJ3YWxlIGplaiB1c3VuaWVjaWU7IGpha2lla29sd2ll
awpwcnplZ2xhZGFuaWUgbHViIHJvenBvd3N6ZWNobmlhbmllIGplc3QgemFicm9uaW9uZS4KVGhp
cyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0
ZXJpYWwgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBJZiB5
b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2Vu
ZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllczsgYW55IHJldmlldyBvciBkaXN0cmlidXRpb24gYnkK
b3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuCg==

