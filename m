Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08E529DD7
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:21:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Vwr4rrmz3bxr
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 19:21:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=e+oQjDpV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=e+oQjDpV; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2VwT6Jdlz3bpb
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:20:57 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id
 l38-20020a05600c1d2600b00395b809dfbaso916504wms.2
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bcX3jvyky5Zk1BA9CMjUs4Jca7mrgBWVxkDo89CEHzg=;
 b=e+oQjDpVJTotBuHUxen0PIl62GNZJClBrr6ySobqIJkbmgE/BQHXpDYKaHDmJ6A2Bh
 CttzTVPFNmITqU31R8RPcoMY7kvQRjXEuAyj0ks2ifwICACW5p2do4LVrx40zoK0+ck6
 obqDGtSPvQmFvO88eBrDlGKe1UVPStbDzJqx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bcX3jvyky5Zk1BA9CMjUs4Jca7mrgBWVxkDo89CEHzg=;
 b=slNFPOMu7FwSgTM3oFLY3Q/VgXmE7jsrUUTw/jhbGtHDFfRgcTyTvFOUrDi7x7F0z7
 kpm/vFGQG7KnCI2tQ2amEz9vmCBr0pYaLjgbP6542qNqXDn7Wu8CUs0WN+ES5GwZK6U5
 f5clTRwN35+w4ViwQbP1VyzOC8UN1BGKKLJH7n4HBvoOb8cabZ8ERjpsMhwVwpDF4utA
 cNdebIv8rpuGwuNbZdLNYCEoLSV6IQy4caXUbSr/jFzkylEeI9CJ+2oTnTIgxRY6REr1
 GTbAALk4GyZBHISPnA6VI+x2abxVfyBVLuvV1GK9oyV9mcUG38K7Xj7KIXhA0afmMiwS
 x8WA==
X-Gm-Message-State: AOAM5326zPvXoYfqL8dvgj3ytYd7Mj4e7rGMciDXoDniR/QHBehRZZjf
 8T9adI2b+aqoi7/DAsOLlNnEVT4AVfx0bUbyL/E=
X-Google-Smtp-Source: ABdhPJxjyoMaplhahUMc5vmQunZ55IVRht20Aa1fvbTBU8WBhjMtVxgkuh1btiXLCak6T4vSnA5rC7RjSCAsl9k2dGk=
X-Received: by 2002:a05:600c:1c0e:b0:394:66af:ef0f with SMTP id
 j14-20020a05600c1c0e00b0039466afef0fmr30434678wms.48.1652779254607; Tue, 17
 May 2022 02:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220512231938.228651-1-joel@jms.id.au>
 <HK0PR06MB28341F811AD74F52ACA5D19B9CCA9@HK0PR06MB2834.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB28341F811AD74F52ACA5D19B9CCA9@HK0PR06MB2834.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 May 2022 09:20:41 +0000
Message-ID: <CACPK8XfS+orcdGxGtDy4_gjT9Za9B4umELVcWVYAJv1MWhV4qQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ftgmac100: Disable hardware checksum on
 AST2600
To: Dylan Hung <dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Wilder <dwilder@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 David Wilder <wilder@us.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 13 May 2022 at 01:46, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>
> > -----Original Message-----
> > From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel
> > Stanley
> > Sent: Friday, May 13, 2022 7:20 AM
> > To: David S . Miller <davem@davemloft.net>; Jakub Kicinski
> > <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Benjamin
> > Herrenschmidt <benh@kernel.crashing.org>; Dylan Hung
> > <dylan_hung@aspeedtech.com>; David Wilder <dwilder@us.ibm.com>
> > Cc: openbmc@lists.ozlabs.org; netdev@vger.kernel.org;
> > linux-kernel@vger.kernel.org; David Wilder <wilder@us.ibm.com>
> > Subject: [PATCH net v2] net: ftgmac100: Disable hardware checksum on
> > AST2600
> >
> > The AST2600 when using the i210 NIC over NC-SI has been observed to
> > produce incorrect checksum results with specific MTU values. This was first
> > observed when sending data across a long distance set of networks.
> >
> > On a local network, the following test was performed using a 1MB file of
> > random data.
> >
> > On the receiver run this script:
> >
> >  #!/bin/bash
> >  while [ 1 ]; do
> >         # Zero the stats
> >         nstat -r  > /dev/null
> >         nc -l 9899 > test-file
> >         # Check for checksum errors
> >         TcpInCsumErrors=$(nstat | grep TcpInCsumErrors)
> >         if [ -z "$TcpInCsumErrors" ]; then
> >                 echo No TcpInCsumErrors
> >         else
> >                 echo TcpInCsumErrors = $TcpInCsumErrors
> >         fi
> >  done
> >
> > On an AST2600 system:
> >
> >  # nc <IP of  receiver host> 9899 < test-file
> >
> > The test was repeated with various MTU values:
> >
> >  # ip link set mtu 1410 dev eth0
> >
> > The observed results:
> >
> >  1500 - good
> >  1434 - bad
> >  1400 - good
> >  1410 - bad
> >  1420 - good
> >
> > The test was repeated after disabling tx checksumming:
> >
> >  # ethtool -K eth0 tx-checksumming off
> >
> > And all MTU values tested resulted in transfers without error.
> >
> > An issue with the driver cannot be ruled out, however there has been no bug
> > discovered so far.
> >
> > David has done the work to take the original bug report of slow data transfer
> > between long distance connections and triaged it down to this test case.
> >
> > The vendor suspects this this is a hardware issue when using NC-SI. The fixes
> > line refers to the patch that introduced AST2600 support.
> >
> > Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle
> > property")
> > Reported-by: David Wilder <wilder@us.ibm.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>

> Reviewed-by: Dylan Hung <dylan_hung@aspeedtech.com>

Thank you Dylan. I've added your r-b to v3, as the only changes are to
the wrapping of the commit message.
