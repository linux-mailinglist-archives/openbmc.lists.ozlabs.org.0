Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3592CE51E
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 02:28:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnFT2257dzDrJf
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 12:28:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inspur.com (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=maxiaochao@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 137 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Dec 2020 12:27:13 AEDT
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnFS1486CzDrCB
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 12:27:12 +1100 (AEDT)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id WNC80930
 for <openbmc@lists.ozlabs.org>; Fri, 04 Dec 2020 09:24:30 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 4 Dec 2020 09:24:29 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.2044.007; Fri, 4 Dec 2020 09:24:29 +0800
From: =?gb2312?B?WGlhb2NoYW8gTWEgKMLt0KGzrCk=?= <maxiaochao@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Can't Call BMCweb/JournalEventLogEntryCollection function
Thread-Topic: Can't Call BMCweb/JournalEventLogEntryCollection function
Thread-Index: AQHWydnNEusG7jqD00SmqMpegl91Ew==
Date: Fri, 4 Dec 2020 01:24:29 +0000
Message-ID: <0e0a25dea3074ccdab0fcf57f62cebf4@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.11.13]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

SGkgYWxsDQoNCiAgICBJIHRlc3RlZCB0aGUgSm91cm5hbEV2ZW50TG9nRW50cnlDb2xsZWN0aW9u
IGZ1bmN0aW9uIGluIHRoZSBibWN3ZWIgbW9kdWxlLiBJIGZvdW5kIGl0IHVuZXhwZWN0ZWRseSB0
aGF0IEkgY291bGRuJ3QgdXNlIHRoZSByZXNmaXNoIHVybCB0byBjYWxsIGl0Lg0KDQogICAgTm8g
bWF0dGVyIHdoYXQgSSBjaGFuZ2UgdGhlIG1hY3JvIGRlZmluaXRpb24goa5CTUNXRUJfRU5BQkxF
X1JFREZJU0hfREJVU19MT0dfRU5UUklFU6GvLCB0aGUgREJ1c0V2ZW50TG9nRW50cnlDb2xsZWN0
aW9uIGZ1bmN0aW9uIGlzIGFsd2F5cyBjYWxsZWQuDQoNCg0KDQpUaGUgYm1jd2ViIC0tIHJlZGZp
c2gtY29yZS9pbmNsdWRlL3JlZGZpc2guaHBwo7oNCg0KDQojaWZuZGVmIEJNQ1dFQl9FTkFCTEVf
UkVERklTSF9EQlVTX0xPR19FTlRSSUVTDQpub2Rlcy5lbXBsYWNlX2JhY2soDQpzdGQ6Om1ha2Vf
dW5pcXVlPEpvdXJuYWxFdmVudExvZ0VudHJ5Q29sbGVjdGlvbj4oYXBwKSk7DQpub2Rlcy5lbXBs
YWNlX2JhY2soc3RkOjptYWtlX3VuaXF1ZTxKb3VybmFsRXZlbnRMb2dFbnRyeT4oYXBwKSk7DQpu
b2Rlcy5lbXBsYWNlX2JhY2soc3RkOjptYWtlX3VuaXF1ZTxKb3VybmFsRXZlbnRMb2dDbGVhcj4o
YXBwKSk7DQojZW5kaWYNCg0KLg0KDQouDQoNCi4NCg0KI2lmZGVmIEJNQ1dFQl9FTkFCTEVfUkVE
RklTSF9EQlVTX0xPR19FTlRSSUVTDQpub2Rlcy5lbXBsYWNlX2JhY2soc3RkOjptYWtlX3VuaXF1
ZTxEQnVzTG9nU2VydmljZUFjdGlvbnNDbGVhcj4oYXBwKSk7DQpub2Rlcy5lbXBsYWNlX2JhY2so
c3RkOjptYWtlX3VuaXF1ZTxEQnVzRXZlbnRMb2dFbnRyeUNvbGxlY3Rpb24+KGFwcCkpOw0Kbm9k
ZXMuZW1wbGFjZV9iYWNrKHN0ZDo6bWFrZV91bmlxdWU8REJ1c0V2ZW50TG9nRW50cnk+KGFwcCkp
Ow0KI2VuZGlmDQoNCg0KICAgIEkgbW9kaWZ5IHRoZSBtYWNybyBkZWZpbml0aW9uIGJ5IG1vZGlm
eWluZyBibWN3ZWIvbWVzb25fb3B0aW9ucy50eHQgLg0KDQoNCm9wdGlvbigncmVkZmlzaC1kYnVz
LWxvZycsIHR5cGUgOiAnZmVhdHVyZScsIHZhbHVlIDogJ2Rpc2FibGVkJywgZGVzY3JpcHRpb24g
OiAnRW5hYmxlIERCVVMgbG9nIHNlcnZpY2UgdHJhbnNhY3Rpb25zIHRocm91Z2ggUmVkZmlzaC4u
Li4uDQoNCiAgICBFdmVuIGlmIEkgd3JpdGUgdGhpcyBkZWZpbml0aW9uIGFzJ2Rpc2FibGUnIGlu
IG1ldGEtaW5zcHVyL3JlY2lwZS1waG9zcGhvci9ibWN3ZWIvLi4uYmJhcHBlbmQsIHRoZSBKb3Vy
bmFsRXZlbnRMb2dFbnRyeUNvbGxlY3Rpb24gY2Fubm90IGJlIGNhbGxlZC4NCg0KDQpBcmUgdGhl
cmUgb3RoZXIgY29uZmlndXJhdGlvbnMgdGhhdCB3aWxsIGFmZmVjdCBpdD8NCg==
