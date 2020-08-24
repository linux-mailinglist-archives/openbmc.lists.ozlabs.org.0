Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F52250AA1
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 23:17:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb4hV1dDHzDqCV
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 07:17:30 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=cWjsfb6N; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=cWjsfb6N; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb4gV2cgPzDq6q
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 07:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598303792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTV4kNNgwLnkChmE7oqADyBxVdVbQismeeJ68khOnH8=;
 b=cWjsfb6NePALHZVAxQDiMaEJzZIdoJ0dzCbuhE0YMP+zLzZZhn4BoG8CXTookowOvdYYVv
 3tWxM9hB0+6PDvlXJ68u0p7TjUQDXU7YTK5mhKtsdub/xErCAnmBNYcHDf7NdKnOxje+zy
 +hob15fmSM9n7+1yi8P5g/9BoKtm7L0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598303792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTV4kNNgwLnkChmE7oqADyBxVdVbQismeeJ68khOnH8=;
 b=cWjsfb6NePALHZVAxQDiMaEJzZIdoJ0dzCbuhE0YMP+zLzZZhn4BoG8CXTookowOvdYYVv
 3tWxM9hB0+6PDvlXJ68u0p7TjUQDXU7YTK5mhKtsdub/xErCAnmBNYcHDf7NdKnOxje+zy
 +hob15fmSM9n7+1yi8P5g/9BoKtm7L0=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-1I-Smc02MKW2zKArikuvoQ-1; Mon, 24 Aug 2020 13:07:57 -0400
X-MC-Unique: 1I-Smc02MKW2zKArikuvoQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 24 Aug 2020 10:07:55 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 24 Aug 2020 10:07:55 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Neil Bradley <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCHCA1A
Date: Mon, 24 Aug 2020 17:07:55 +0000
Message-ID: <9b882b4043804f8bb619f46e94f7e237@SCL-EXCHMB-13.phoenix.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.131]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=ISO-2022-JP
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In addition to what Neil has ask I am find this issue with NC-SI:

Yet Ben Wei's OSFC 2019 "NIC Management and Monitoring in OpenBMC"=20
leads me to believe that NC-SI should be in my image and functioning.
Has something changed since Ben's paper?

root@tiogapass:~#
root@tiogapass:~# uname -a
Linux tiogapass 5.4.39-30079d6 #1 Fri Aug 21 17:14:22 UTC 2020 armv6l GNU/L=
inux
root@tiogapass:~# cat /proc/version
Linux version 5.4.39-30079d6 (oe-user@oe-host) (gcc version 9.3.0 (GCC)) #1=
 Fri Aug 21 17:14:22 UTC 2020
root@tiogapass:~# cat /proc/sys/kernel/version
#1 Fri Aug 21 17:14:22 UTC 2020
root@tiogapass:~# cat /etc/os-release
ID=3Dopenbmc-phosphor
NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION=3D"v00.000.000-45"
VERSION_ID=3Dv00.000.000-45-g645f5cc08
PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)=
 v00.000.000-45"
BUILD_ID=3D"v00.000.000"
OPENBMC_TARGET_MACHINE=3D"tiogapass"
root@tiogapass:~# dmesg | grep -i ncsi
[    1.854939] ftgmac100 1e660000.ethernet: Using NCSI interface
[   17.831827] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for packet t=
ype 0x82 returned -19
[   33.526950] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.535564] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.543813] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.554345] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.562598] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.570958] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.612936] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.629318] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.638683] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.647978] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.657291] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.665690] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.673956] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.682381] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
[   33.690792] ftgmac100 1e660000.ethernet eth0: NCSI: 'bad' packet ignored=
 for type 0x8b
root@tiogapass:~#

From: Neil Bradley=20
Sent: Friday, August 21, 2020 18:36
To: openbmc@lists.ozlabs.org
Cc: Bruce Mitchell; Patrick Voelker
Subject: Tioga Pass OpenBMC 2.8

Greetings fellow BMC folk ? I=1B$B!G=1B(Bm Neil Bradley, Phoenix Technologi=
es=1B$B!G=1B(B BMC architect and have a question for the group.

We are attempting to load OpenBMC 2.8 on a Tioga Pass. This is what we did:

mkdir tiogapass
cd tiogapass
git clone https://github.com/openbmc/openbmc.git
cd openbmc
git checkout 35a774200999ac2fca48693c1c169bf99d2f63ea
export TEMPLATECONF=3Dmeta-facebook/meta-tiogapass/conf
source openbmc-env
bitbake obmc-phosphor-image

The BMC does boot fully, however there are two major problems we=1B$B!G=1B(=
Bve encountered:

1. Host will not power on via the front panel power button
2. BMC Will not obtain or try DHCP even though its set enabled for the prim=
ary LAN channel

I have a couple of questions:

1. Was this built/done correctly? In other words, did I do something wrong =
in this process?
2. Does anyone know the current state of Tioga Pass support in 2.8 or the g=
eneral health therein?

We=1B$B!G=1B(Bre coming up to speed on this quickly, so apologies if these =
are stupid questions. And greetings!

=1B$B"*=1B(BNeil

