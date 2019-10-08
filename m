Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1818DCF147
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 05:31:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nNDC5s6VzDqLC
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 14:31:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nNCP51sTzDqL0
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 14:30:10 +1100 (AEDT)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id ZNL93848
 for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2019 11:29:48 +0800
Received: from jtjnmail201604.home.langchao.com (10.100.2.4) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Tue, 8 Oct 2019 11:29:46 +0800
Received: from jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322])
 by jtjnmail201604.home.langchao.com ([fe80::2830:53ee:1228:5322%5])
 with mapi id 15.01.1591.008; Tue, 8 Oct 2019 11:29:46 +0800
From: =?gb2312?B?WGlhb2NoYW8gTWEgKMLt0KGzrCk=?= <maxiaochao@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Upload firmware through TFTP on REDFISH interface.
Thread-Topic: Upload firmware through TFTP on REDFISH interface.
Thread-Index: AQHVfYZ87ivspmF68k2ROPAplOk+tQ==
Date: Tue, 8 Oct 2019 03:29:46 +0000
Message-ID: <daa541bc6f9344d69f2590b64c875a46@inspur.com>
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

SGksIGFsbC4NCg0KSSdtIHRyeWluZyB0byB1cGRhdGUgZmlybXdhcmUgdXNpbmcgUkVERklTSCBp
bnRlcmZhY2UuDQpJdCBjYW4gc3VjY2Vzc2Z1bGx5IHVwbG9hZCBpbWFnZXMgdGhyb3VnaCBURlRQ
IG9uIHRoZSBCTUN3ZWIuDQpIb3dldmVyLCB0aGUgZmlybXdhcmUgdXBncmFkZSBjb21tYW5kIGlu
DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL1JFREZJU0gtY2hl
YXRzaGVldC5tZA0KZmFpbGVkLihUaHJvdWdoIFRGVFAgbWV0aG9kKQ0KVGhlIFRGVFAgY29tbWFu
ZCBoZXJlIGlzIG5vdCBjb25maWd1cmVkLg0KVGhlIHJlc3VsdHMgb2YgdGhlIGNvbW1hbmQgYXJl
IGFzIGZvbGxvd3M6DQoNCiQgY3VybCAtayAtSCAiWC1BdXRoLVRva2VuOiAkdG9rZW4iIC1YIFBP
U1QgaHR0cHM6Ly8ke2JtY30vcmVkZmlzaC92MS9VcGRhdGVTZXJ2aWNlL0FjdGlvbnMvVXBkYXRl
U2VydmljZS5TaW1wbGVVcGRhdGUgLWQgJ3siVHJhbnNmZXJQcm90b2NvbCI6IlRGVFAiLCJJbWFn
ZVVSSSI6Im9ibWMtcGhvc3Bob3ItaW1hZ2UtZnA1MjgwZzItMjAxOTA5MjQwNDIyNDMuc3RhdGlj
Lm10ZC50YXIifScNCiAgTm90IEZvdW5kDQoNCkhvdyBzaG91bGQgdGhlIGFkZHJlc3Mgb2YgVEZU
UCBiZSBjb25maWd1cmVkPw0KDQo=
