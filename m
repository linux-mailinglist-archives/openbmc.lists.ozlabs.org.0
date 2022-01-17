Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC354905C2
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 11:15:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcnpJ6nD8z3bZG
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 21:15:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256 header.s=security header.b=T8RcyRF6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp04.wistron.com;
 envelope-from=lulu_su@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256
 header.s=security header.b=T8RcyRF6; dkim-atps=neutral
Received: from segapp04.wistron.com (segapp02.wistron.com [103.200.3.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcjfj1pnGz2xBk
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 18:08:11 +1100 (AEDT)
Received: from EXCHAPP03.whq.wistron (unknown [10.37.38.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by segapp04.wistron.com (MTA) with ESMTPS id 4Jcjf65gCgzMqWdF;
 Mon, 17 Jan 2022 15:07:42 +0800 (CST)
Received: from EXCHAPP02.whq.wistron (10.37.38.25) by EXCHAPP03.whq.wistron
 (10.37.38.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 15:08:05 +0800
Received: from EXCHAPP02.whq.wistron ([fe80::ddcf:b147:1523:2e1]) by
 EXCHAPP02.whq.wistron ([fe80::ddcf:b147:1523:2e1%6]) with mapi id
 15.01.2375.018; Mon, 17 Jan 2022 15:08:05 +0800
From: <Lulu_Su@wistron.com>
To: <joel@jms.id.au>
Subject: RE: [PATCH linux dev-5.4 v1] hwmon: (pmbus) Add a PMBUS_NO_CAPABILITY
 platform data flag
Thread-Topic: [PATCH linux dev-5.4 v1] hwmon: (pmbus) Add a
 PMBUS_NO_CAPABILITY platform data flag
Thread-Index: AQHYC2uIU4fHQj9flEy0a1fCetEX8qxmwoRg
Date: Mon, 17 Jan 2022 07:08:05 +0000
Message-ID: <83259c613f2c4329acfa8de770c43876@wistron.com>
References: <20220114032708.2532-1-Lulu_Su@wistron.com>
 <CACPK8Xf817U7_6ww9m7Jxa6W9OGpTLGfPpzioW1mzv=PmSMuWA@mail.gmail.com>
In-Reply-To: <CACPK8Xf817U7_6ww9m7Jxa6W9OGpTLGfPpzioW1mzv=PmSMuWA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.37.38.237]
x-tm-snts-smtp: 0C5B3FE5842274518612A191AEAC43F035EB4F779715CDBA67BB61699CB9C9E52000:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalId: qf20HF7gNj014627
x-msw-jemd-newsletter: false
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wistron.com; s=security;
 t=1642403263; bh=E49cBR+KcJ4FSmzozg59EnXXu2uDfac17UDSDk/s8K4=;
 h=From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
 References:In-Reply-To:Accept-Language:Content-Language:
 Content-Type:Content-Transfer-Encoding:MIME-Version;
 b=T8RcyRF6jLaea7pUquqIOiDmY7zNZpYZ0AE1RUDiLJNzr3MT/4XUonTcAUcQgUVsD
 thg/r7rnv4cWd/G3og/qKSIarVOo5ZJmpPg1T3OKiradEL+LSLcaMUSAgAkPDu1tnK
 Q9vyuHd9jZYU9lkpsDYwTzc/SBPZlU1MkXBz/Ons=
X-Mailman-Approved-At: Mon, 17 Jan 2022 21:14:11 +1100
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
Cc: openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoNClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24sIGJ1dCB0aGlzIGJyYW5jaCBoYXMg
YmVlbiB1c2VkIGZvciBvdXIgcGxhdGZvcm0gZm9yIGEgd2hpbGUuDQoNCkFuZHJldyBKZWZmZXJ5
IHN1Z2dlc3RlZCB0aGF0IHdlIGJhY2twb3J0IHRoaXMgY29tbWl0Lg0KKGh0dHBzOi8vZ2l0aHVi
LmNvbS9pYm0tb3BlbmJtYy9vcGVuYm1jL3B1bGwvMjA0Izp+OnRleHQ9VGhlcmUlMjdzJTIwcHJv
cGVyJTIwc3VwcG9ydCUyMGZvciUyMGF2b2lkaW5nJTIwdGhlJTIwQ0FQQUJJTElUWSUyMHJlZ2lz
dGVyJTIwdXBzdHJlYW0uJTIwUGxlYXNlJTIwYmFja3BvcnQlMjBodHRwcyUzQS8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQv
ZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMlM0ZoJTNEdjUuMTYlMkRyYzQlMjZpZCUz
RGU1YmVmYzAyNGNiNDUlMjBhbmQlMjBpbXBsZW1lbnQlMjB0aGUlMjBwYXRjaCUyMGluJTIwdGVy
bXMlMjBvZiUyMHRoYXQuKQ0KDQpDb3VsZCB5b3UgYWdyZWUgdG8gYmFja3BvcnQgdGhpcyBjb21t
aXQ/IFRoYW5rcy4gIA0KDQo+SGVsbG8sDQo+DQo+SSBub3RlIHRoYXQgeW91J3JlIHRhcmdldGlu
ZyB2NS40IGZvciB0aGlzIHBhdGNoLiBJIGRvbid0IGtub3cgYW55b25lIHdvcmtpbmcgb24gbWFp
bnRhaW5pbmcgdGhpcyBrZXJuZWwgdHJlZSBpbiB0aGUgb3BlbmJtYyBwcm9qZWN0Lg0KPg0KPkkg
c3VnZ2VzdCB5b3UgbW92ZSB5b3VyIHBsYXRmb3JtIHRvIHRoZSBsYXRlc3QgTFRTLCB2NS4xNS4g
VGhpcyBwYXRjaCBpcyBhbHJlYWR5IHByZXNlbnQgaW4gdGhhdCB0cmVlLg0KDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClRoaXMgZW1haWwgY29udGFpbnMg
Y29uZmlkZW50aWFsIG9yIGxlZ2FsbHkgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiBhbmQgaXMgZm9y
IHRoZSBzb2xlIHVzZSBvZiBpdHMgaW50ZW5kZWQgcmVjaXBpZW50LiANCkFueSB1bmF1dGhvcml6
ZWQgcmV2aWV3LCB1c2UsIGNvcHlpbmcgb3IgZGlzdHJpYnV0aW9uIG9mIHRoaXMgZW1haWwgb3Ig
dGhlIGNvbnRlbnQgb2YgdGhpcyBlbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLg0KSWYgeW91
IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IG1heSByZXBseSB0byB0aGUgc2Vu
ZGVyIGFuZCBzaG91bGQgZGVsZXRlIHRoaXMgZS1tYWlsIGltbWVkaWF0ZWx5Lg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCg==
