Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F1F27B11A
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 17:43:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Rd23wgXzDqQY
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 01:43:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=NGh2D9aB; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=QEaRIKts; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0Rbs2cqHzDqD1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 01:42:30 +1000 (AEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1601307745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdfYF+PRhHyl9tiGrvBstFmbnNdMnc4NH7uwLN8grFY=;
 b=NGh2D9aB0HICs5pagyaP3aAYgG5FLEPLUf70FXv7HG4CLO84Gwyc/rFhEU2v29wt+fCH7n
 krCnVjpIVYBUVe3kUneF5NmpU5kIQT3/2C+W3RGufcrenWxrWl1Gk5miVjEWTjGnnPY8Wk
 b/SRJCYOv8Yn3ndHgboLxB7ci0YfRLM=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1601307746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdfYF+PRhHyl9tiGrvBstFmbnNdMnc4NH7uwLN8grFY=;
 b=QEaRIKtsajm9HhBYzO7+3FtdZXRFfjPJy7yfvqAD7uU5EipKlPLN0V2W4lLpLkgGWx+zFe
 +QxRuX7zTp62eyud7IOfUkgxD9avyeifMRPG1D0tznLmquOei2Cmbu33XXUTIeNNUUJnhp
 4YnxwLdN2Egn4RlWAcU8VU6tUQ3Jwlk=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Brt2EZaYOECYfcYocHZh1A-1; Mon, 28 Sep 2020 11:42:21 -0400
X-MC-Unique: Brt2EZaYOECYfcYocHZh1A-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 28 Sep 2020 08:42:19 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 28 Sep 2020 08:42:19 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Ilya Gousev <qweran@gmail.com>
Subject: RE: Tiogapass build
Thread-Topic: Tiogapass build
Thread-Index: AQHWWqIEhcdkSNQE4Umd1HWn9iIPlakJYrmAgAAIOYCAAYQfgIAH7HgAgGvKXCA=
Date: Mon, 28 Sep 2020 15:42:19 +0000
Message-ID: <cca569784a5a49078dd97fe391fe27aa@SCL-EXCHMB-13.phoenix.com>
References: <CACS57oWum6NJghyv8904M+-GzrYy=LD93wvizGo8RagHOkOSZQ@mail.gmail.com>
 <8B3F0342-9917-4929-B955-F226FE8EE0AA@fb.com>
 <CACS57oVN=vvisXABSihcRaxCbzWNbzbkyqX2PB1zRb3yOFi0TA@mail.gmail.com>
 <0186241F-8B9E-44CC-8547-0066D1332A7B@fb.com>
 <21E2092A-4D65-4D1F-A6DE-EC87744ECB12@fb.com>
In-Reply-To: <21E2092A-4D65-4D1F-A6DE-EC87744ECB12@fb.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

SGVsbG8gVmlqYXkgYW5kIElseWEsDQoNCldoYXQgaXMgdGhlIHJpZ2h0IHdheSB0byBhZGQgdGhl
IEFTUEVFRCBBU1QyNTAwICJWaWRlbyBDYXJkIiB0byBUaW9nYSBQYXNzIGZvciBPcGVuQk1DIGFz
IHdlbGwgYXMgdGhlIGhpZGc/DQpUaGUgb2JqZWN0aXZlIGlzIHRvIGhhdmUgYSBmdWxseSBmdW5j
dGlvbmFsIEtWTSBvbiBUaW9nYSBQYXNzLg0KDQpUaGFuayB5b3UhDQoNCi0tIA0KQnJ1Y2UNCg0K
RnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcyticnVjZV9taXRjaGVsbD1waG9l
bml4LmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgVmlqYXkgS2hlbWthDQpTZW50
OiBUdWVzZGF5LCBKdWx5IDIxLCAyMDIwIDExOjM2DQpUbzogSWx5YSBHb3VzZXYNCkNjOiBvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBUaW9nYXBhc3MgYnVpbGQNCg0KSGkg
SWx5YSwNClBsZWFzZSBwdWxsIGZvbGxvd2luZyBjb21taXQgZnJvbSBtYWlubGluZSBsaW51eCBh
bmQgd2l0aCBsYXRlc3Qgb3BlbmJtYyB0cmVlLCANCkV2ZXJ5dGhpbmcgc2hvdWxkIHdvcmsuIFBs
ZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgbmVlZCBhbnkgaGVscCBoZXJlLg0KDQpjb21taXQgZmE0
YzhlYzZmZWFhMzIzN2Y1ZDQ0Y2I4YzZkMGFhMGRmZjZlMWJjYw0KQXV0aG9yOiBBbmRyZXcgSmVm
ZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0KRGF0ZTogwqAgU2F0IEFwciAxMSAxMTo0NDo1OCAyMDIw
ICswOTMwDQoNCsKgIMKgIEFSTTogZHRzOiBhc3BlZWQ6IENoYW5nZSBLQ1Mgbm9kZXMgdG8gdjIg
YmluZGluZw0KwqDCoCDCoA0KwqAgwqAgRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5ncyBmb3Ig
Ym90aCBnNSBhbmQgZzYgU29DczoNCsKgwqAgwqANCsKgIMKgIMKgIMKgIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2FzcGVlZC1nNS5kdHNpOjM3Ni4xOS0zODEuODogV2FybmluZw0KwqAgwqAgwqAgwqAgKHVu
aXRfYWRkcmVzc192c19yZWcpOiAvYWhiL2FwYi9scGNAMWU3ODkwMDAvbHBjLWJtY0AwL2tjczFA
MDogbm9kZQ0KwqAgwqAgwqAgwqAgaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIHByb3BlcnR5
DQrCoMKgIMKgDQrCoCDCoCBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFq
LmlkLmF1Pg0KwqAgwqAgU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5h
dT4NCg0KY29tbWl0IGQ4NWZhNmM2ZjMzN2U3NjhmMjViYTM2MmU1ZDJlYmI3NzY5YWM4YzENCkF1
dGhvcjogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQpEYXRlOiDCoCBNb24gSmFu
IDI3IDE3OjE4OjE3IDIwMjAgLTA4MDANCg0KwqAgwqAgQVJNOiBkdHM6IGFzcGVlZDogdGlvZ2Fw
YXNzOiBBZGQgZ3BpbyBsaW5lIG5hbWVzDQrCoMKgIMKgDQrCoCDCoCBBZGRlZCBHUElPIGxpbmUg
bmFtZXMgZm9yIGFsbCBncGlvIHVzZWQgaW4gdGlvZ2FwYXNzIHBsYXRmb3JtLA0KwqAgwqAgdGhl
c2UgbGluZSBuYW1lcyB3aWxsIGJlIHVzZWQgYnkgbGliZ3Bpb2QgdG8gY29udHJvbCBHUElPcw0K
wqDCoCDCoA0KwqAgwqAgU2lnbmVkLW9mZi1ieTogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBm
Yi5jb20+DQrCoCDCoCBSZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4N
CsKgIMKgIFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQoNCmNv
bW1pdCAzZGNmZmY5NmYxN2E4ZThhOWEzNDZmMGJlZmYxMGQ3NWU3Y2E4ZWRiDQpBdXRob3I6IFZp
amF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPg0KRGF0ZTogwqAgTW9uIEphbiAyNyAxNzox
NzoyOCAyMDIwIC0wODAwDQoNCsKgIMKgIEFSTTogZHRzOiBhc3BlZWQ6IHRpb2dhcGFzczogQWRk
IElQTUIgZGV2aWNlDQrCoMKgIMKgDQrCoCDCoCBBZGRpbmcgSVBNQiBkZXZpY2VzIGZvciBmYWNl
Ym9vayB0aW9nYXBhc3MgcGxhdGZvcm0uDQrCoMKgIMKgDQrCoCDCoCBTaWduZWQtb2ZmLWJ5OiBW
aWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCsKgIMKgIFJldmlld2VkLWJ5OiBKb2Vs
IFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KwqAgwqAgU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFu
bGV5IDxqb2VsQGptcy5pZC5hdT4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCkZyb206IG9wZW5ibWMg
PG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZz4gb24g
YmVoYWxmIG9mIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPg0KRGF0ZTogVGh1cnNk
YXksIEp1bHkgMTYsIDIwMjAgYXQgMTA6MzcgQU0NClRvOiBJbHlhIEdvdXNldiA8cXdlcmFuQGdt
YWlsLmNvbT4NCkNjOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiA8b3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnPg0KU3ViamVjdDogUmU6IFRpb2dhcGFzcyBidWlsZA0KDQpIaSBJbHlhLA0KV2Ug
ZG9u4oCZdCBoYXZlIGFueSB2aWRlbyBjYXJkIHNvIG5vIGxpc3RpbmcgaW4gZGV2aWNlIHRyZWUu
IEtDUyBhbmQgSVBNQiBzaG91bGQgYmUgd29ya2luZyBmaW5lLiANCldlIHVzZSBrY3MxIGFuZCBr
Y3MyIG9ubHkuwqAgSnVzdCBjaGVjayBpZiB5b3UgYXJlIHVzaW5nIGxhdGVzdCBrZXJuZWwgYW5k
IGhhcyBpcG1iIGRyaXZlciBlbnRyeSBpbiBkZXZpY2UgdHJlZS4NCsKgDQpSZWdhcmRzDQotVmlq
YXkNCsKgDQpGcm9tOiBJbHlhIEdvdXNldiA8cXdlcmFuQGdtYWlsLmNvbT4NCkRhdGU6IFdlZG5l
c2RheSwgSnVseSAxNSwgMjAyMCBhdCAxMToyNiBBTQ0KVG86IFZpamF5IEtoZW1rYSA8dmlqYXlr
aGVta2FAZmIuY29tPg0KQ2M6ICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBSZTogVGlvZ2FwYXNzIGJ1aWxkDQrCoA0KSGksIFZp
amF5IQ0KwqANCkFib3V0IEtWTToNCldoZW4gSSB3YXMgYnVpbGQgT3BlbkJNQywgS1ZNIGRpZCBu
b3Qgd29yay4gVGhlcmUgd2FzIG5vIHZodWIgYW5kIHZpZGVvIG5vZGVzIGluIGRldmljZXRyZWUg
ZmlsZS4gSXMgdGhpcyBkb25lIG9uIHB1cnBvc2U/DQoNCg0KUmlnaHQgbm93IEkgaGF2ZSBwcm9i
bGVtIHdpdGggS0NTIEJyaWRnZSwgYnV0IGkgZml4IGl0IHdpdGggdWRldiBydWxlIGxpa2UgdGhp
czoNCktFUk5FTD09ImlwbWkta2NzMyIsIFNZTUxJTksrPSJpcG1pX2tjczMiDQpBbmQgZml4aW5n
IHBob3NwaG9yLWlwbWkta2NzX2dpdC5iYg0KDQoNClJpZ2h0IG5vdyBpIGhhdmUgYSBwcm9ibGVt
IHdpdGggc3RhcnRpbmcgaXBtYiBzZXJ2aWNlLg0KDQoNCg0KRG8geW91IGhhdmUgc3VjaCBwcm9i
bGVtcyB0b28/DQpPciBpcyBpdCBteSBmYXVsdD8NCg0KDQpUaGFua3MsIA0KDQpJbHlhDQoNCg0K
DQrRgdGALCAxNSDQuNGO0LsuIDIwMjAg0LMuINCyIDIwOjU2LCBWaWpheSBLaGVta2EgPHZpamF5
a2hlbWthQGZiLmNvbT46DQpIaSBJbHlhLA0KUGxlYXNlIHNlZSBteSBhbnN3ZXJzIGlubGluZQ0K
wqANCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlz
dHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mIElseWEgR291c2V2IDxxd2VyYW5AZ21haWwuY29t
Pg0KRGF0ZTogV2VkbmVzZGF5LCBKdWx5IDE1LCAyMDIwIGF0IDU6MTggQU0NClRvOiAib3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDog
VGlvZ2FwYXNzIGJ1aWxkDQrCoA0KSGkhDQrCoA0KPkkgaGF2ZSB0cmllZCB0byB0b3VjaCBUaW9n
YXBhc3MgKGJ5IFdpd3luKS7CoA0KR29vZC4NCj5JIGhhdmUgYWRkZWQgdGhlIGRldmljZXMgZm9y
IEtWTS4gQW5kIGl0IHdvcmtzLg0KV2hhdCBhcmUgeW91IHRyeWluZyBmb3IgS1ZNIGhlcmU/DQo+
Tm93IGkgd2FudCB0byBnZXQgaW5mb3JtYXRpb24gYWJvdXQgaGFyZHdhcmUgKGZvciBleGFtcGxl
IENQVSBhbmQgRElNTSBpbWZvcm1hdGlvbiwgbGlrZSBtb2RlbCwgY2xvY2tzLCBldGMuKS4gSG93
IGkgY2FuIGdldCBpdD8gT25seSBmcm9tIElQTUkgc3RhY2sgKGxpa2UgS0NTKT8NClllcyBpdCBj
YW4gYmUgYWNjZXNzZXMgZnJvbSBJUE1JIHN0YWNrIHZpYSBpcG1pIHRvb2xzLCB5b3UgY2FuIHJ1
biBpcG1pdG9vbCBmcm9tIEJNQyBjb25zb2xlIGl0c2VsZi4gQW5kIHRoZXJlIGlzIGEgZmlsZSBp
biAvZXRjL2FwcERhdGEuanNvbiB3aGljaCBzdG9yZXMgYWxsIG9mIHRoZXNlIGRhdGEuDQrCoA0K
SWx5YQ0K

