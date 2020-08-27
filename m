Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3367254FBD
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 22:07:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcv0q2mVDzDqkR
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 06:07:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=c72o2ZPx; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=c72o2ZPx; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bctyz6r4yzDqpr
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 06:06:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598558776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4wzR4uipcqhLCcNshYKrxgUBZfgaVrgpqPz5q+UOhqw=;
 b=c72o2ZPxicazwC5LA0qMXQaSSCBf563dSALE4KfO9Q4iJlT7j50zHYe7OWs/ykdHCh2cYd
 ssKB963QaxE8VnwshTaz1P70+L3ywnH8VIEzUYRUeYieFgq0woWHWGykMGpUeF5WS68wtf
 yNh9UxXkc9iI92Z/a22OVZ6JZJqkGbY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598558776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4wzR4uipcqhLCcNshYKrxgUBZfgaVrgpqPz5q+UOhqw=;
 b=c72o2ZPxicazwC5LA0qMXQaSSCBf563dSALE4KfO9Q4iJlT7j50zHYe7OWs/ykdHCh2cYd
 ssKB963QaxE8VnwshTaz1P70+L3ywnH8VIEzUYRUeYieFgq0woWHWGykMGpUeF5WS68wtf
 yNh9UxXkc9iI92Z/a22OVZ6JZJqkGbY=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-QZxMsLojNIa1H1D5XBjA1g-1; Thu, 27 Aug 2020 16:06:14 -0400
X-MC-Unique: QZxMsLojNIa1H1D5XBjA1g-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 27 Aug 2020 13:06:12 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 27 Aug 2020 13:06:12 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Looking to do multiple platform ports uniformly with the ability to
 easily add more to follow.
Thread-Topic: Looking to do multiple platform ports uniformly with the ability
 to easily add more to follow.
Thread-Index: AdZ8rYI+aL15o6qDRKG4658L6my7NA==
Date: Thu, 27 Aug 2020 20:06:11 +0000
Message-ID: <92e6ad599b10400885d44e9d6b9c28ef@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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


Our desire is to have our own platform ports for Wolf Pass and Tioga Pass, =
with more to come, with a consistent unified meta-phoenix/meta-<platform>
And looking to choose the best know methods and (re-)starting point(s).
Need to row with the OpenBMC community and get it correct from the start.

Thanks!

--=20
Bruce


