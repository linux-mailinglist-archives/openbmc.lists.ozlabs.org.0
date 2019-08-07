Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C6A85318
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 20:42:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463gNZ0wNpzDqx0
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 04:42:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="3tdidtw8"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463gMq65twzDqpv
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 04:41:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nRrL2RrmXJ4qDuv3jGu0S0UxnxABuwo+AIt33hOFMyE=; b=3tdidtw83xdpeFJz683w+s0zR9
 wznZMEN1+N9GVJsyFYckUaTvFg2Obu97K0yPcjC3ZgTt+s6+DYZDe5RaObfU893ocEYI6/Z765FMb
 BCNKh12tGoIwIJ9K+gPMjo2LERE6JX+TSV0d4WfXqURF8JuRONn5UwyQi6itMcDD1vec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hvQsZ-0006zX-AB; Wed, 07 Aug 2019 20:41:43 +0200
Date: Wed, 7 Aug 2019 20:41:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Message-ID: <20190807184143.GE26047@lunn.ch>
References: <20190807002118.164360-1-taoren@fb.com>
 <20190807112518.644a21a2@cakuba.netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807112518.644a21a2@cakuba.netronome.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2019 at 11:25:18AM -0700, Jakub Kicinski wrote:
> On Tue, 6 Aug 2019 17:21:18 -0700, Tao Ren wrote:
> > Currently BMC's MAC address is calculated by adding 1 to NCSI NIC's base
> > MAC address when CONFIG_NCSI_OEM_CMD_GET_MAC option is enabled. The logic
> > doesn't work for platforms with different BMC MAC offset: for example,
> > Facebook Yamp BMC's MAC address is calculated by adding 2 to NIC's base
> > MAC address ("BaseMAC + 1" is reserved for Host use).
> > 
> > This patch adds NET_NCSI_MC_MAC_OFFSET config option to customize offset
> > between NIC's Base MAC address and BMC's MAC address. Its default value is
> > set to 1 to avoid breaking existing users.
> > 
> > Signed-off-by: Tao Ren <taoren@fb.com>
> 
> Maybe someone more knowledgeable like Andrew has an opinion here, 
> but to me it seems a bit strange to encode what seems to be platfrom
> information in the kernel config :(

Yes, this is not a good idea. It makes it impossible to have a 'BMC
distro' kernel which you install on a number of different BMCs.

A device tree property would be better. Ideally it would be the
standard local-mac-address, or mac-address.

  Andrew
