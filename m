Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F387AF1ED2
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 20:32:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477cBT5kglzF5jg
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 06:32:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.b="CsteK8eD"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477c9n2gd6zF5gd
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 06:32:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1573068725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OnM4B1n7nGWVykqpPt0Z3NOFdRQpkg7/+/ftt83cqGA=;
 b=CsteK8eDFTN1AI43ChGguhjGKkz4KtCnh1HjDEEBYWBtvsWeuD5PJRxsTQHn218EKyiqgb
 5iM9LhUW0BaBQp/1GYRZ7mYT9FTLy4Q4EHFaCmThuGgQ0FLY20m+6A+A5ATzX5bd65JXJY
 0ozwFwvwvJ3glS0rFQXAIuKoC7dIYlU=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-rdmEmq5QMfmTLO5HsMXbaA-1; Wed, 06 Nov 2019 14:32:03 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 6 Nov 2019 11:31:56 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 6 Nov 2019 11:31:56 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC and https Vulnerable issue.
Thread-Topic: OpenBMC and https Vulnerable issue.
Thread-Index: AdWU2NcOn6r8XDKvQaCrtSIOdXMZIA==
Date: Wed, 6 Nov 2019 19:31:55 +0000
Message-ID: <44ddb5d76e734cb8bcc7354e1c0e0081@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: rdmEmq5QMfmTLO5HsMXbaA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
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

From my investigations on TLS there seems to be 2 issues that could be corr=
ected with OpenBMC's https:
  1  Secure Client-Initiated Renegotiation     VULNERABLE (NOT ok), DoS thr=
eat
  2  LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE, uses=
 cipher block chaining (CBC) ciphers with TLS=20
     and xc023   ECDHE-ECDSA-AES128-SHA256         ECDH 521   AES         1=
28      TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256

Present standard of practice seems to be to not allow Secure Client-Initiat=
ed Renegotiation and to not allow CBC ciphers.

Is this your understanding as well?

Thank you!

--=20
Bruce Mitchell

