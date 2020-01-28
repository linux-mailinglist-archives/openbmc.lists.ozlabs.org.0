Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EAC14BD98
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 17:21:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486X1V0nYMzDqLj
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 03:21:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=Rp89J9Wc; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486X0d6sbRzDqKZ
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 03:20:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1580228442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmrRCFrChaWMWOQDXJl0Knqssiko7pelZLF5Ux+VVDs=;
 b=Rp89J9WcP+qlpaUpLP5pIKIDupslfnCGH7yAbwUO8ELhd7BS6sUd7e43Ar1knT5yiKAkoE
 NxytIvwsRP2WPdptKbXZwZ3TgirEIxIo0qZBvLpyG0Yz1Lxlxyav7qoCY56348m74zTS8N
 zVfuRvh0A9Dj68JjpNQjEEG3IS7eqc8=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-sfsPEkvDMLynH3FrrT-U0Q-1; Tue, 28 Jan 2020 11:20:40 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 28 Jan 2020 08:20:26 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 28 Jan 2020 08:20:26 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Security workgroup meeting times
Thread-Topic: Security workgroup meeting times
Thread-Index: AQHV1TkuiI2dSVrIgU2C5g2th6mzBqf/v5YA//9/3VCAAStFAP//2FcA
Date: Tue, 28 Jan 2020 16:20:25 +0000
Message-ID: <e6f0bf9e23394e2fbcecadc4f2961da7@SCL-EXCHMB-13.phoenix.com>
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
 <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
 <12e5a999-971b-4edd-b04d-aac018936a77@www.fastmail.com>
 <806158e0db024567b08c97a5b00a37e2@SCL-EXCHMB-13.phoenix.com>
 <98b61672-6f64-d532-3426-18e767d11943@linux.intel.com>
In-Reply-To: <98b61672-6f64-d532-3426-18e767d11943@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: sfsPEkvDMLynH3FrrT-U0Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBhbHNvIGZpbmQgdGhlIHByZXNlbnQgdGltZSBvZiBXZWRuZXNkYXkgYXQgMTA6MDBhbSBQRFQg
KG5vb24gQ0RUKSB3b3JrcyB3ZWxsLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcyticnVjZV9taXRjaGVsbD1waG9lbml4
LmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIFRlcmVzY2hlbmtv
DQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI4LCAyMDIwIDAyOjQyDQpUbzogb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogU2VjdXJpdHkgd29ya2dyb3VwIG1lZXRpbmcgdGlt
ZXMNCg0KDQpPbiAyOC1KYW4tMjAgMDE6NTAsIEJydWNlIE1pdGNoZWxsIHdyb3RlOg0KPiBJZiB5
b3Ugd2FudCB0byBpbmNsdWRlIFNpbGljb24gVmFsbGV5IGl0IHNlZW0gbGlrZSAyMjowMCwgMjM6
MDAsIDAwOjAwLCAwMTowMCwgYW5kIDAyOjAwIFVUQy9HTVQgYXJlIHRoZSBvbmx5IHJlYWwgb3B0
aW9ucy4NCg0KU2hvdWxkIHdlIG1heWJlIHRyeSBzb21ldGhpbmcgbGlrZSBodHRwOi8vd2hlbmlz
Z29vZC5uZXQvIHRvIHNvcnQgb3V0IGEgDQpzbG90IHRoYXQgd29ya3MgZm9yIGV2ZXJ5b25lPw0K
DQpDdXJyZW50IHRpbWUgd29ya3MgZm9yIG1lIEJUVyBhbmQgSSdtIGxvY2F0ZWQgaW4gRXVyb3Bl
IDopDQoNCg==

