Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EE929D152
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 18:27:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLwWT3tBzzDqSw
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 04:27:49 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=bnFb3DWg; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=bnFb3DWg; 
 dkim-atps=neutral
X-Greylist: delayed 96 seconds by postgrey-1.36 at bilbo;
 Thu, 29 Oct 2020 04:27:06 AEDT
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLwVf5W3pzDqCB
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 04:27:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603906023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JdJs3OfCEWEhSrOfIQWnRyJgp3irE8N7R1/VaufOp5k=;
 b=bnFb3DWggiIhW0xmH/8mWrEIrCGh5F8crrWT27RSNJVRfUnH63FxHN99Md/yYWH3rYvXqz
 sznEYgqOI5wEUUBFiAGyyhwUB46I3AHVzYYRilawVQCXipowePxFlJExSYFzYCXGhfO4+V
 9UOeBoghzz4vr6DpcTaOk2YKAf7lhvE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603906023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JdJs3OfCEWEhSrOfIQWnRyJgp3irE8N7R1/VaufOp5k=;
 b=bnFb3DWggiIhW0xmH/8mWrEIrCGh5F8crrWT27RSNJVRfUnH63FxHN99Md/yYWH3rYvXqz
 sznEYgqOI5wEUUBFiAGyyhwUB46I3AHVzYYRilawVQCXipowePxFlJExSYFzYCXGhfO4+V
 9UOeBoghzz4vr6DpcTaOk2YKAf7lhvE=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-WAr353ojOD2c2-x24ELWog-1; Wed, 28 Oct 2020 13:25:22 -0400
X-MC-Unique: WAr353ojOD2c2-x24ELWog-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 28 Oct 2020 10:25:20 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 28 Oct 2020 10:25:20 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: With webui-vue Firmware version on Overview vs Hardware status BMC
 manager not always matching.
Thread-Topic: With webui-vue Firmware version on Overview vs Hardware status
 BMC manager not always matching.
Thread-Index: AdatTyI5t5CLRj2MQ0iaFWWZIGQPrA==
Date: Wed, 28 Oct 2020 17:25:20 +0000
Message-ID: <2332af3cb404478cbd7bc0902167c7ea@SCL-EXCHMB-13.phoenix.com>
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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

With webui-vue Firmware version on Overview vs Hardware status BMC manager =
not always matching.

These are screen shots.

I find Romulus is not having this issue:
=09Overview - https://bmc-bruce.github.io/Romulus_Overview_Firmware-version=
.png
=09Hardware status - https://bmc-bruce.github.io/Romulus_Hardware-status_Fi=
rmware-version.png

Where our build does show this issue:
=09Overview - https://bmc-bruce.github.io/Phoenix_Overview_Firmware-version=
.png
=09Hardware status - https://bmc-bruce.github.io/Phoenix_Hardware-status_Fi=
rmware-version.png

I am curious as to how Hardware status gets the (BMC) Firmware version as c=
ompared to how Overview gets the (BMC) Firmware version.

Thank you.

--=20
Bruce

