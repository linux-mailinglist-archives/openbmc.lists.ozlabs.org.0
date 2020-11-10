Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCE2ADCD4
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 18:24:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVvr43GS2zDqW9
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 04:24:52 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=BJZVdzLG; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=BJZVdzLG; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVvpy2PX2zDqWJ
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 04:23:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1605029029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7QruLJvAChnAMJQQaFBRsjYgRijpucNjt7VatyIFwSo=;
 b=BJZVdzLGvP46v4ElQeALyeZIJ+/rf99bZQy1cI5zPeixAuS3io79lPsW+OzBWTGl2GO/Yw
 oUr9iv9SN71tf6EzQ94VAR9YgNrZQoC37g5G+UquEykDOEMSkiwHSlXv8qLyeLO86fmONA
 wnQnrBwYjsfJ65NcS3tFPe9UOs1Fxtc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1605029029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7QruLJvAChnAMJQQaFBRsjYgRijpucNjt7VatyIFwSo=;
 b=BJZVdzLGvP46v4ElQeALyeZIJ+/rf99bZQy1cI5zPeixAuS3io79lPsW+OzBWTGl2GO/Yw
 oUr9iv9SN71tf6EzQ94VAR9YgNrZQoC37g5G+UquEykDOEMSkiwHSlXv8qLyeLO86fmONA
 wnQnrBwYjsfJ65NcS3tFPe9UOs1Fxtc=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-c5HiUd1zPxCBSM3Y769zGQ-1; Tue, 10 Nov 2020 12:23:46 -0500
X-MC-Unique: c5HiUd1zPxCBSM3Y769zGQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 10 Nov 2020 09:23:45 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 10 Nov 2020 09:23:45 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: With phosphor-pid-control OEM-IPMI Commands to talk to
 Phosphor-pid-control Manual Mode
Thread-Topic: With phosphor-pid-control OEM-IPMI Commands to talk to
 Phosphor-pid-control Manual Mode
Thread-Index: Ada3hfR9nYaEL8hRTCS99n2YAsGDTw==
Date: Tue, 10 Nov 2020 17:23:44 +0000
Message-ID: <ded34fbeabec4b59a604726ca9669f6f@SCL-EXCHMB-13.phoenix.com>
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

With phosphor-pid-control OEM-IPMI Commands to talk to Phosphor-pid-control=
 Manual Mode
"that something will be controlling the fans via the other commands."

Do these "other commands" are available anywhere for Manual Mode?

--=20
Bruce

