Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD442B89A2
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 02:35:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc2Lq1Gk0zDqZ9
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 12:35:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc2Bt5JKbzDqfV
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 12:28:52 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kfYkM-007q6N-QM; Thu, 19 Nov 2020 02:28:26 +0100
Date: Thu, 19 Nov 2020 02:28:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v2 0/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring
Message-ID: <20201119012826.GP1804098@lunn.ch>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
 <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, taoren@fb.com, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, mikechoi@fb.com, "David S . Miller" <davem@davemloft.net>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 18, 2020 at 03:42:53PM -0800, Tao Ren wrote:
> On Thu, Nov 19, 2020 at 12:27:19AM +0100, Andrew Lunn wrote:
> > On Wed, Nov 18, 2020 at 03:09:27PM -0800, rentao.bupt@gmail.com wrote:
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > > 
> > > The patch series adds hardware monitoring driver for the Maxim MAX127
> > > chip.
> > 
> > Hi Tao
> > 
> > Why are using sending a hwmon driver to the networking mailing list?
> > 
> >     Andrew
> 
> Hi Andrew,
> 
> I added netdev because the mailing list is included in "get_maintainer.pl
> Documentation/hwmon/index.rst" output. Is it the right command to find
> reviewers? Could you please suggest? Thank you.

Hi Tae

What you are doing is correct. I suspected it was a get_maintainers
problem. Now we know this, we can figure out why it is adding all
these extra addresses which make no sense. Maybe a bug in the
MAINTAINERS file?

       Andrew
