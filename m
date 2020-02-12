Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B615B36A
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:11:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hv4G15ZhzDqLt
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:11:26 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=QIPnfS6e; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hv3Y3DyXzDqHd
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 09:10:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1581545444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVVChRuY6Dol0Zty2VpR3+NI6n+1zaxf3SZ/3LZDvQQ=;
 b=QIPnfS6etTaIkeLSEHkFXuLNBnmvOjw+w3bAdg/VdCLd8TLL5CZCqOv4JNxAepEQrfwxlX
 nQmKEZnP9NeULMoPmU0Cksdyx65fhCk0w/YxFzTIShdh+F6zXMvt0woXTyzozXfT+5tzYC
 Km4XbPwXmCfgDWN4kF8Fo6CcNwkTrCc=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-tmIOin5kPW6zV8vTvIaEQw-1; Wed, 12 Feb 2020 17:10:42 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 12 Feb 2020 14:10:34 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 12 Feb 2020 14:10:34 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: RE: bmcweb Security issue
Thread-Topic: bmcweb Security issue
Thread-Index: AdXhzSryvWWaO7YzS+OerzqNx34pIAAYfjmAAA9/x+A=
Date: Wed, 12 Feb 2020 22:10:34 +0000
Message-ID: <4c55bb2c38e3489ca802467fef3e4d53@SCL-EXCHMB-13.phoenix.com>
References: <c9b3bf2691d44614a07caedcf35b2541@SCL-EXCHMB-13.phoenix.com>
 <20200212213150.GG1676@mauery.jf.intel.com>
In-Reply-To: <20200212213150.GG1676@mauery.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: tmIOin5kPW6zV8vTvIaEQw-1
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

So Vernon, you are saying it could easily be way shorter than 10 years or e=
ven 825 days, correct?

-----Original Message-----
From: Vernon Mauery [mailto:vernon.mauery@linux.intel.com]=20
Sent: Wednesday, February 12, 2020 13:34
To: Bruce Mitchell
Cc: openbmc@lists.ozlabs.org
Subject: Re: bmcweb Security issue

On 12-Feb-2020 05:52 PM, Bruce Mitchell wrote:
>bmcweb Security issue: according to the The CA/Browser Forum https://cabfo=
rum.org/wp-content/uploads/CA-Browser-Forum-BR-1.6.7.pdf ;
>Subscriber Certificates issued after 1 March 2018 MUST have a Validity Per=
iod no greater than 825 days.
>
>In bmcweb's ssl_key_handler.hpp we have:
>            // Cert is valid for 10 years
>            X509_gmtime_adj(X509_get_notAfter(x509),
>                            60L * 60L * 24L * 365L * 10L);
>
>I believe we want this changed to the 825 days.

Self-signed certificates are not subscriber certificates.

This is a self-signed certificate, so really that is a bigger issue than=20
the length of time that it is valid for. This certificate should only be=20
trusted on a direct physical connection with no other machines. It is=20
there only to facilitate uploading a valid key/certificate to the BMC.

It is not intended to be used for any amount of time.

--Vernon

