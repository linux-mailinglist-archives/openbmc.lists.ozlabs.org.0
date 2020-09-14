Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26B26960D
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 22:08:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqy9B5rWDzDqQc
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 06:08:30 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=HERKJZec; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=HERKJZec; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bqy8339VBzDqLP
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 06:07:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600114045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IMPoB3SfyJNn+keNzdKZvTHH+Ei6/e+FHyG78xYCOPM=;
 b=HERKJZecf3Rkfu7S1p233Y7wwXFYc07IXq2hE0hTMnXcWDBMSVte3/d57Hs78h4Ig/hgAf
 jfzFKlB2r2+gOaXjp5HMUusXATT+8CNXkqqUtfc11gFYv3WHNzvqcnK5Q/VXM3RoqQjA2w
 1lUkbmIOmBQEJuEpEBdDkOjOXORoaZc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600114045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IMPoB3SfyJNn+keNzdKZvTHH+Ei6/e+FHyG78xYCOPM=;
 b=HERKJZecf3Rkfu7S1p233Y7wwXFYc07IXq2hE0hTMnXcWDBMSVte3/d57Hs78h4Ig/hgAf
 jfzFKlB2r2+gOaXjp5HMUusXATT+8CNXkqqUtfc11gFYv3WHNzvqcnK5Q/VXM3RoqQjA2w
 1lUkbmIOmBQEJuEpEBdDkOjOXORoaZc=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-e0q3x1ypMoK-rjtbVaMNSA-1; Mon, 14 Sep 2020 16:07:18 -0400
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 14 Sep 2020 13:07:15 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 14 Sep 2020 13:07:15 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?Windows-1252?Q?CA/Browser_Forum=92s_Ballot_SC31_to_reduce_TLS_certifica?=
 =?Windows-1252?Q?tes_to_398_days_from_the_present_825_days.?=
Thread-Topic: =?Windows-1252?Q?CA/Browser_Forum=92s_Ballot_SC31_to_reduce_TLS_certifica?=
 =?Windows-1252?Q?tes_to_398_days_from_the_present_825_days.?=
Thread-Index: AdaK0lVngurpGvqSQzCip9VVIkLKCQ==
Date: Mon, 14 Sep 2020 20:07:14 +0000
Message-ID: <65076563629a4513b8b6d0002008288a@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
x-mc-unique: e0q3x1ypMoK-rjtbVaMNSA-1
x-crosspremisesheadersfilteredbysendconnector: SCL-EXCHMB-13.phoenix.com
x-organizationheaderspreserved: SCL-EXCHMB-13.phoenix.com
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.0
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

The change to reduce the maximum validity period of TLS certificates to 398=
 days is being discussed in the CA/Browser Forum=92s Ballot SC31
https://github.com/cabforum/documents/pull/195
https://blog.mozilla.org/security/2020/07/09/reducing-tls-certificate-lifes=
pans-to-398-days/


> -----Original Message-----
> From: Bruce Mitchell
> Sent: Wednesday, February 12, 2020 09:53
> To: openbmc@lists.ozlabs.org
> Subject: bmcweb Security issue
>
> bmcweb Security issue: according to the The CA/Browser Forum
> https://cabforum.org/wp-content/uploads/CA-Browser-Forum-BR-
> 1.6.7.pdf ;
> Subscriber Certificates issued after 1 March 2018 MUST have a Validity
> Period no greater than 825 days.
>
> In bmcweb's ssl_key_handler.hpp we have:
>             // Cert is valid for 10 years
>             X509_gmtime_adj(X509_get_notAfter(x509),
>                             60L * 60L * 24L * 365L * 10L);
>
> I believe we want this changed to the 825 days.

