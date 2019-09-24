Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA01BBFC4
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 03:38:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ckPB2XPVzDqQb
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 11:38:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=maxiaochao@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ckNW57ZtzDqMN
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 11:38:14 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id PKK94606
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 09:38:06 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Tue, 24 Sep 2019 09:38:03 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.1591.008; Tue, 24 Sep 2019 09:38:03 +0800
From: =?gb2312?B?WGlhb2NoYW8gTWEgKMLt0KGzrCk=?= <maxiaochao@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Change the password through the REST interface
Thread-Topic: Change the password through the REST interface
Thread-Index: AQHVcnXouNC0a7FzAkmUVfUrqXDZBQ==
Date: Tue, 24 Sep 2019 01:38:03 +0000
Message-ID: <23454dbb362e4d5198d0733d0f49fda9@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.1.52]
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

SGksIGFsbA0KDQpJJ20gdHJ5aW5nIHRvIGNoYW5nZSB0aGUgdXNlcidzIHBhc3N3b3JkIHRocm91
Z2ggdGhlIFJFU1QgaW50ZXJmYWNlLg0KDQpGZWVkYmFjayBpcyAiVGhlIHNwZWNpZmllZCBtZXRo
b2QgY2Fubm90IGJlIGZvdW5kIg0KDQpUaGUnYnVzY3RsIGludHJvc3BlY3QnY29tbWFuZCBhbHNv
IGZhaWxlZCB0byBmaW5kIHRoaXMgbWV0aG9kLg0KDQpXaGF0IG1heSBiZSB0aGUgY2F1c2U/IElz
IHRoZXJlIGFueSBvdGhlciB3YXkgdG8gY2hhbmdlIHBhc3N3b3JkcyB0aHJvdWdoIFJFU1Q/DQoN
CiQgY3VybCAtayAtSCAiWC1BdXRoLVRva2VuOiAkdG9rZW4iIC1IICJDb250ZW50LVR5cGU6IGFw
cGxpY2F0aW9uL2pzb24iDQotZCAie1wiZGF0YVwiOiBbXCIxcWF6QFdTWFwiXSB9IiAtWCBQT1NU
DQpodHRwczovLyR7Ym1jfS94eXovb3BlbmJtY19wcm9qZWN0L3VzZXIveGlhby9hY3Rpb24vU2V0
UGFzc3dvcmQNCnsNCiAgImRhdGEiOiB7DQogICAgImRlc2NyaXB0aW9uIjogIlRoZSBzcGVjaWZp
ZWQgbWV0aG9kIGNhbm5vdCBiZSBmb3VuZCINCiAgfSwNCiAgIm1lc3NhZ2UiOiAiNDA0IE5vdCBG
b3VuZCIsDQogICJzdGF0dXMiOiAiZXJyb3IiDQp9DQoNCg==
