Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DEA7043DC
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 05:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL1Tx6mbyz3bYW
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 13:11:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com; envelope-from=chen.pj@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 905 seconds by postgrey-1.36 at boromir; Mon, 15 May 2023 17:46:18 AEST
Received: from mail.inventec.com (mail.inventec.com [218.32.67.185])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKWdk4bbBz3bhL
	for <openbmc@lists.ozlabs.org>; Mon, 15 May 2023 17:46:18 +1000 (AEST)
Received: from IEC1-EX2016-03.iec.inventec (10.15.2.59) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 15 May 2023 15:31:02 +0800
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 15 May 2023 15:31:02 +0800
Received: from IEC1-EX2016-01.iec.inventec (IEC1-EX2016-01.iec.inventec [10.15.2.58])
	by IEC1-MSE-FE1.inventec.com with ESMTP id 34F7UwBP019580
	for <openbmc@lists.ozlabs.org>; Mon, 15 May 2023 15:30:58 +0800 (GMT-8)
	(envelope-from Chen.PJ@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-01.iec.inventec (10.15.2.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 15 May 2023 15:30:59 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::ad9c:c1af:d29:f80d]) by
 IEC1-EX2016-01.iec.inventec ([fe80::ad9c:c1af:d29:f80d%7]) with mapi id
 15.01.2507.021; Mon, 15 May 2023 15:30:58 +0800
From: =?big5?B?Q2hlbi5QSiCzr6xmpfQgVEFP?= <Chen.PJ@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Thread-Topic: [PATCH 1/2] dt-bindings: arm: aspeed: add Inventec
 starscream-bmc
Thread-Index: AQHZhv6gl+ubbDd8CE29wjK7+QR5pg==
Date: Mon, 15 May 2023 07:30:58 +0000
Message-ID: <28f0ce0a82464083ae24f9ef2f598425@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: IEC1-EX2016-01.iec.inventec (15.01.2507.021)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.6.245.192]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE1.inventec.com 34F7UwBP019580
X-TM-SNTS-SMTP: 632206068E7C16522BE7CB3B2E1FA2CAAD12BF033F3F378C29230B4444C237C92000:8
X-Mailman-Approved-At: Tue, 16 May 2023 13:02:57 +1000
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
Cc: =?big5?B?WWUuVmljILitpnSyTSBUQU8=?= <ye.vic@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RG9jdW1lbnQgdGhlIG5ldyBjb21wYXRpYmxlcyB1c2VkIG9uIEludmVudGVjIHN0YXJzY3JlYW0t
Ym1jDQoNClNpZ25lZC1vZmYtYnk6IGNoZW4ucGogPGNoZW4ucGpAaW52ZW50ZWMuY29tPg0KLS0t
DQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlh
bWwgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlh
bWwNCmluZGV4IDFiNTg1ZTU1NDc5MS4uZmI0Y2U1ZGYyZmEwIDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVkLnlhbWwNCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1s
DQpAQCAtODIsNiArODIsNyBAQCBwcm9wZXJ0aWVzOg0KICAgICAgICAgICAgICAgLSBpYm0sZXZl
cmVzdC1ibWMNCiAgICAgICAgICAgICAgIC0gaWJtLHJhaW5pZXItYm1jDQogICAgICAgICAgICAg
ICAtIGlibSx0YWNvbWEtYm1jDQorICAgICAgICAgICAgICAtIGludmVudGVjLHN0YXJzY3JlYW0t
Ym1jDQogICAgICAgICAgICAgICAtIGludmVudGVjLHRyYW5zZm9ybWVyLWJtYw0KICAgICAgICAg
ICAgICAgLSBqYWJpbCxyYnAtYm1jDQogICAgICAgICAgICAgICAtIG51dmlhLGRjLXNjbS1ibWMN
Ci0tIA0KMi4yNS4xDQoNCg0K
