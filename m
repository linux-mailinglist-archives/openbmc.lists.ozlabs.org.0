Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00C29F2C6
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 18:16:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMXD264ftzDqYM
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 04:16:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=KCQf8ePM; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=KCQf8ePM; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMXCB72Z5zDqWS
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 04:15:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603991747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c7dVWNqjoBHnXK3Cco6fDv8Wn/wkE8BUcbXPQBGP098=;
 b=KCQf8ePMRstiBrb8kYwYGxGQJGlTiLUdFB1pnkAGH0pqbIH/nwDrkyUNfw1xxuJwqkhMCp
 jdMEOGzxQFo3ABAieS1U0UNiG8yNm+GqOMZrJrZk8TFcinDOraYh7lGoP/1j3IyP/dDLo/
 TnMK0q+AkPPKx9F8B2fsu+B+LIFx9vE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603991747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c7dVWNqjoBHnXK3Cco6fDv8Wn/wkE8BUcbXPQBGP098=;
 b=KCQf8ePMRstiBrb8kYwYGxGQJGlTiLUdFB1pnkAGH0pqbIH/nwDrkyUNfw1xxuJwqkhMCp
 jdMEOGzxQFo3ABAieS1U0UNiG8yNm+GqOMZrJrZk8TFcinDOraYh7lGoP/1j3IyP/dDLo/
 TnMK0q+AkPPKx9F8B2fsu+B+LIFx9vE=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-JbkVyLoENVWg6m3GWsjeGg-1; Thu, 29 Oct 2020 13:14:28 -0400
X-MC-Unique: JbkVyLoENVWg6m3GWsjeGg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 29 Oct 2020 10:14:26 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 29 Oct 2020 10:14:26 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Using local git repo for recipe development
Thread-Topic: Using local git repo for recipe development
Thread-Index: AdauFs6ToZT99Bk/To2jUGwd1837ng==
Date: Thu, 29 Oct 2020 17:14:25 +0000
Message-ID: <0bf9e810dbce40bf90d96a4d39e55d68@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.164.179]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
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

I'm creating a new recipe for local development but when I do a 'devtool mo=
dify <recipe>' it always seems to make an empty directory (that contains on=
ly .git.)=20

Here's the relevant lines from my .bb file:
SRC_URI =3D "git:///home/pvoelker/bmc/dev/oem;protocol=3Dfile"
SRCREV =3D "4db17f482b0bdcdcf5658c7d323cc563eb78556a"
inherit autotools

Here's the warning from 'devtool modify':
WARNING: No source unpacked to S - either the phoenix-oem recipe doesn't us=
e any source or the correct source directory could not be determined

If I change either the SRC_URI or the SRCREV to be invalid, I get an error =
instead of a warning so it's definitely finding the local repo.

I can't figure out why none of the files in my commit are making it into th=
e unpack directory.  Any ideas or tips on debugging?  I also tried using  a=
 .tar.gz file instead of a local git repo and had the same result.

