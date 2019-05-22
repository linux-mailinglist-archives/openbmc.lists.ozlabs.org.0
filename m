Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29453290B4
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 08:04:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459G6M4RXTzDqfN
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 16:04:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458C8B1W1qzDqLL
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 22:47:19 +1000 (AEST)
X-AuditID: ac1060b2-d3bff700000059e1-ee-5ce544d213f3
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 2B.06.23009.2D445EC5; Wed, 22 May 2019 08:47:14 -0400 (EDT)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0415.000; Wed, 22 May 2019 08:47:14 -0400
From: Hongwei Zhang <Hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [PATCH linux dev-5.0 v3] ARM: dts: aspeed: Add Microsoft
 Olympus BMC
Thread-Topic: [PATCH linux dev-5.0 v3] ARM: dts: aspeed: Add Microsoft
 Olympus BMC
Thread-Index: AQHVEB7qazDq/bWGi0KqHZ0ks6YvDaZ2hluAgABr0wCAACUjIA==
Date: Wed, 22 May 2019 12:47:14 +0000
Message-ID: <14D3C8298A3B0F42A1EB31EE961CFF8230C5DB@atlms1.us.megatrends.com>
References: <1558475264-29119-1-git-send-email-hongweiz@ami.com>
 <d1d3f7b3-b989-4e6e-ad52-239b6ac8aa48@www.fastmail.com>
 <CACPK8Xf6cQJQ+jyxmkveUqAV1jzeo1OePOURtRMdTieO-utxmw@mail.gmail.com>
In-Reply-To: <CACPK8Xf6cQJQ+jyxmkveUqAV1jzeo1OePOURtRMdTieO-utxmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.241]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42JZI5AwQ/eSy9MYg51TlC12XeawWHrzCpvF
 7/N/mS1OtbxgcWDxuNq+i93j9vYmdo+LH48xe5yfsZAxgCWKyyYlNSezLLVI3y6BK2PpesOC
 T5wV25v3MjUwXuDsYuTkkBAwkbj/cjJjFyMXh5DALiaJpcfOsEA4hxklGm5eYwGpYhNQk3j6
 p4EdxBYRcJaYu+IkM4jNLBAjcfLrbEYQW1ggWOL3xQOsEDUhEhOn7WeBsJ0k1syYDFbPIqAq
 8aNjGVicV8BX4uD1Y1DLDjJKTD2wEqyIUyBQYsWGfjYQm1FATOL7qTVMEMvEJW49mc8EcbaA
 xJI955khbFGJl4//sULYShINK/4B1XAA1WtKrN+lD9GqKDGl+yE7xF5BiZMzn7BMYBSdhWTq
 LISOWUg6ZiHpWMDIsopRKLEkJzcxMye93FAvMTdTLzk/dxMjJIo27WBsuWh+iFGAg1GJh3ef
 1tMYIdbEsuLK3EOMEhzMSiK8p089ihHiTUmsrEotyo8vKs1JLT7EKM3BoiTOOyPkcoyQQHpi
 SWp2ampBahFMlomDU6qB8Wl3yvr3VqVcDNOPvzqXxcjBzT/pPqf51pWC0hkH/JY/tP78PTE7
 SubwpdX6Ce2ZMQwz+k9P2nWkw0giVebSJEPN5bbzbQ3ffc79ff+1Lt/6L3Jzj6+61f52e26H
 qtTt0PvbTpRy/Wxa7j3buij9Q9qkG4KXWbeEHFN47rD+YP3dffMqGk8vVlViKc5INNRiLipO
 BABUNzZ6ngIAAA==
X-Mailman-Approved-At: Fri, 24 May 2019 16:03:52 +1000
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhdCdzIGdyZWF0IQ0KVGhhbmtzIGEgbG90IEpvZWwgYW5kIEFuZHJldyBmb3IgeW91ciBmZWVk
YmFjayBhbmQgdGltZSB0byByZXZpZXcgb3VyICBwYXRjaC4NCg0KSSB3aWxsIHVwZGF0ZSBvdXIg
aW5pdGlhbCBwdWxsIHJlcXVlc3Qgb24gdGhlIE9wZW5CTUMgZ2Vycml0IHNpdGUgYWNjb3JkaW5n
bHkuDQpCZXN0IFJlZ2FyZHMsDQotLUhvbmd3ZWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+IA0KU2VudDogV2VkbmVzZGF5
LCBNYXkgMjIsIDIwMTkgMjoyOSBBTQ0KVG86IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQu
YXU+DQpDYzogSG9uZ3dlaSBaaGFuZyA8SG9uZ3dlaXpAYW1pLmNvbT47IE9wZW5CTUMgTWFpbGxp
c3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6
aWVzcXVpcnJlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGxpbnV4IGRldi01LjAgdjNdIEFS
TTogZHRzOiBhc3BlZWQ6IEFkZCBNaWNyb3NvZnQgT2x5bXB1cyBCTUMNCg0KT24gV2VkLCAyMiBN
YXkgMjAxOSBhdCAwMDowMywgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4gd3JvdGU6
DQo+DQo+DQo+DQo+IE9uIFdlZCwgMjIgTWF5IDIwMTksIGF0IDA3OjE4LCBIb25nd2VpIFpoYW5n
IHdyb3RlOg0KPiA+IE9seW1wdXMgaXMgYSBNaWNyb3NvZnQgT0NQIHBsYXRmb3JtIGVxdWlwcGVk
IHdpdGggQXNwZWVkIDEyNTAgb3INCj4gPiAyNDAwIEJNQyBTb0MuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBIb25nd2VpIFpoYW5nIDxob25nd2VpekBhbWkuY29tPg0KPg0KPiBSZXZpZXdlZC1i
eTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4NCg0KVGhhbmtzLCBtZXJnZWQgaW50
byBkZXYtNS4xLg0K
