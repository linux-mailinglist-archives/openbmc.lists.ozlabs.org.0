Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58531529DC5
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Vvt1jHgz3byG
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 19:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kiu/iECm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kiu/iECm; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2VvS3dT1z3bYy
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:20:03 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so911266wme.4
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5/To3q1iix39r0lCQ+hhuwUqkdpFvOMo3ijNMqcdH64=;
 b=kiu/iECmQxpFDXj3H3uLLN100wIRqg8E8311/LlhcNSFiQmy18ebSvnt9ct+FVv6Zn
 hSt+mkPDxQDPhd/o+oBS7Rw8YazWmLE3uvixG85ukYIZoONIipM3R24UIpQe6FcU4T09
 oUqKxrJRbJ9J3YkxIT2iVYCSSYXqcsU2Z2Fjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5/To3q1iix39r0lCQ+hhuwUqkdpFvOMo3ijNMqcdH64=;
 b=4qHXR4CREv6WHEuz45nhlRWywR1ULgUq9WEVNuceFrpfeAckz7KBtrizmbbplIvLdz
 kP+CLSWkCHuCWfufCxGn93m2YLlvY9Mjl1/KpLvwDJUDUnVT/CTG7JX2XlQC81HWdbQw
 faAMukbmMmJ5DnExla2LtjdltemOLRgLmLA1ICTKcn2LxdrQNOD1/FrZnBVbl9kFmbDs
 6wO4IKyXnwepYPuZt1+i0rr366gnDOPGVqL0oQEc6BcqcmEWYa2eJyzmgmFH3jeIgB/E
 9MejJLYvhYKIWnwxkVZNBEvAu1VyLzuLYPrRmPs4l4ItttboESIMpK5TQlT/THMID8/b
 emww==
X-Gm-Message-State: AOAM531jJ0EU7G68ZqOyrnGUA5mp52Js2aFTTctbgQVWxgcpocugSrrQ
 zOC5KvZmw7obtZuEesffC4pD/GvfqBacxUJzWtY=
X-Google-Smtp-Source: ABdhPJy1rSqL48gyvRhmpjpN8GuHXjUytsXO0NGJntsr0tTAcsfAMsqLvBb8AQIyi9ayddqeP56N5IkuzIzJV/x8CEk=
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr19878367wmj.171.1652779199500; Tue, 17
 May 2022 02:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220512231938.228651-1-joel@jms.id.au>
 <b6da2e5a-eb85-d3cf-d4c3-ca9c0f0c04a4@molgen.mpg.de>
In-Reply-To: <b6da2e5a-eb85-d3cf-d4c3-ca9c0f0c04a4@molgen.mpg.de>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 May 2022 09:19:47 +0000
Message-ID: <CACPK8XchZcjXjkhDEa=RnnbD3PycwM7Hu5x2tB3A4g0v4964_w@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ftgmac100: Disable hardware checksum on
 AST2600
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, David Wilder <wilder@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 13 May 2022 at 05:11, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Joel,
>
>
> Am 13.05.22 um 01:19 schrieb Joel Stanley:
> > The AST2600 when using the i210 NIC over NC-SI has been observed to
> > produce incorrect checksum results with specific MTU values. This was
> > first observed when sending data across a long distance set of networks.
> >
> > On a local network, the following test was performed using a 1MB file of
> > random data.
> >
> > On the receiver run this script:
> >
> >   #!/bin/bash
> >   while [ 1 ]; do
> >          # Zero the stats
> >          nstat -r  > /dev/null
> >          nc -l 9899 > test-file
> >          # Check for checksum errors
> >          TcpInCsumErrors=$(nstat | grep TcpInCsumErrors)
> >          if [ -z "$TcpInCsumErrors" ]; then
> >                  echo No TcpInCsumErrors
> >          else
> >                  echo TcpInCsumErrors = $TcpInCsumErrors
> >          fi
> >   done
> >
> > On an AST2600 system:
> >
> >   # nc <IP of  receiver host> 9899 < test-file
> >
> > The test was repeated with various MTU values:
> >
> >   # ip link set mtu 1410 dev eth0
> >
> > The observed results:
> >
> >   1500 - good
> >   1434 - bad
> >   1400 - good
> >   1410 - bad
> >   1420 - good
>
> Sort the values? As some MTUs are good, should a allow list for these
> values be added?

No.

>
> > The test was repeated after disabling tx checksumming:
> >
> >   # ethtool -K eth0 tx-checksumming off
> >
> > And all MTU values tested resulted in transfers without error.
> >
> > An issue with the driver cannot be ruled out, however there has been no
> > bug discovered so far.
> >
> > David has done the work to take the original bug report of slow data
> > transfer between long distance connections and triaged it down to this
> > test case.
> >
> > The vendor suspects this this is a hardware issue when using NC-SI. The fixes line refers
> > to the patch that introduced AST2600 support.
>
> Please wrap the line after 75 characters.
>
> Can the problem be reproduced with QEMU?

It can not. If you wanted to try you could modify the model to corrupt
tx checksums, but I would consider this of limited value.

>
> > Fixes: 39bfab8844a0 ("net: ftgmac100: Add support for DT phy-handle property")
> > Reported-by: David Wilder <wilder@us.ibm.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Should the intel-wired-lan folks be put in Cc?

No, as all evidence points towards this being an AST2600 problem.

ASPEED did not report the issue relates to the i210 doing anything
wrong. The issue is not seen from the host PCIe interface, and the
i210 is in widespread use with other BMCs without issue.

>
> > ---
> > v2 updates the commit message with confirmation form the vendor that
>
> from
>
> > this is a hardware issue, and clarifes why the commit used in the fixes
>
> clarifies
>
> > tag was chosen.
> >
> >   drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> > index caf48023f8ea..5231818943c6 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -1928,6 +1928,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
> >       /* AST2400  doesn't have working HW checksum generation */
> >       if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
> >               netdev->hw_features &= ~NETIF_F_HW_CSUM;
> > +
> > +     /* AST2600 tx checksum with NC-SI is broken */
>
> Does ASPEED have an internal bug for this, so should there be new
> revisions of the AST2600, the bug can be fixed?

There are no plans to fix it that I'm aware of.

>
> > +     if (priv->use_ncsi && of_device_is_compatible(np, "aspeed,ast2600-mac"))
> > +             netdev->hw_features &= ~NETIF_F_HW_CSUM;
> > +
>
> I would fancy a note or even warning about this hardware issue.

I don't see the need to clutter up the kernel logs.

We've had a similar workaround for the 2400 since support was added
for the aspeed part. It doesn't affect the operation of the system; in
fact it improves it as without this we see degraded throughput due to
retransmissions.

We have git history for detailed notes on why a change was made.

>
> >       if (np && of_get_property(np, "no-hw-checksum", NULL))
> >               netdev->hw_features &= ~(NETIF_F_HW_CSUM | NETIF_F_RXCSUM);
> >       netdev->features |= netdev->hw_features;
>
>
> Kind regards,
>
> Paul
