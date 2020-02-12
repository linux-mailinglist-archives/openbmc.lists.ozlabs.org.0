Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CC15AF23
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 18:54:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HnMQ0tB2zDqSK
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 04:54:10 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=kxTrWkVU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HnLj0dsZzDq75
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 04:53:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1581530005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SssjLy/iXbbMuF4BYQNC4QClgouAy0BFget8XXKPcMA=;
 b=kxTrWkVUqCRfJE0m4GobVgJptIcwDGI8Sgn7QJ4R2n1sOKDnnb+NA6uXxhZJXBSps72m+3
 nEh4beRkzEOBhZ/eLdm/UEH1o1SgNZtA2j9G+hnnd/9PQb9zNNi0IKkkbzXHc/HXorBQYD
 GoJRfvzlSntBkWnwJmYwlRkcdKHVbM8=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-rUAcsI6oO9O_oRgTQ7Yv5A-1; Wed, 12 Feb 2020 12:53:22 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 12 Feb 2020 09:52:53 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 12 Feb 2020 09:52:53 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: bmcweb Security issue
Thread-Topic: bmcweb Security issue
Thread-Index: AdXhzSryvWWaO7YzS+OerzqNx34pIA==
Date: Wed, 12 Feb 2020 17:52:52 +0000
Message-ID: <c9b3bf2691d44614a07caedcf35b2541@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: rUAcsI6oO9O_oRgTQ7Yv5A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
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

bmcweb Security issue: according to the The CA/Browser Forum https://cabfor=
um.org/wp-content/uploads/CA-Browser-Forum-BR-1.6.7.pdf ;
Subscriber Certificates issued after 1 March 2018 MUST have a Validity Peri=
od no greater than 825 days.

In bmcweb's ssl_key_handler.hpp we have:
            // Cert is valid for 10 years
            X509_gmtime_adj(X509_get_notAfter(x509),
                            60L * 60L * 24L * 365L * 10L);

I believe we want this changed to the 825 days.

