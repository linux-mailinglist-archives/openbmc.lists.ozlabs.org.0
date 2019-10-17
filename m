Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC8DBA38
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 01:36:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vQXb6PM8zDqF1
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 10:36:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vQWj739LzDqgj;
 Fri, 18 Oct 2019 10:35:29 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9HNYwHU020037;
 Thu, 17 Oct 2019 18:34:59 -0500
Message-ID: <b99afb6c88f00279c68979f344a15a2c200ca67e.camel@kernel.crashing.org>
Subject: Re: [PATCH v2] ftgmac100: Disable HW checksum generation on AST2500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Vijay Khemka <vijaykhemka@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Kate Stewart <kstewart@linuxfoundation.org>, Sven
 Van Asbroeck <TheSven73@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bhupesh Sharma <bhsharma@redhat.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date: Fri, 18 Oct 2019 10:34:57 +1100
In-Reply-To: <071cf1eeefcbfc14633a13bc2d15ad7392987a88.camel@kernel.crashing.org>
References: <20191011213027.2110008-1-vijaykhemka@fb.com>
 <3a1176067b745fddfc625bbd142a41913ee3e3a1.camel@kernel.crashing.org>
 <0C0BC813-5A84-403F-9C48-9447AAABD867@fb.com>
 <071cf1eeefcbfc14633a13bc2d15ad7392987a88.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2019-10-18 at 10:14 +1100, Benjamin Herrenschmidt wrote:
> 
> I don't understand what you are saying. You reported a problem with
> IPV6 checksums generation. The HW doesn't support it. What's "not a
> matter of unsupported csum" ?
> 
> Your patch uses a *deprecated* bit to tell the network stack to only do
> HW checksum generation on IPV4.
> 
> This bit is deprecated for a reason, again, see skbuff.h. The right
> approach, *which the driver already does*, is to tell the stack that we
> support HW checksuming using NETIF_F_HW_CSUM, and then, in the transmit
> handler, to call skb_checksum_help() to have the SW calculate the
> checksum if it's not a supported type.
> 
> This is exactly what ftgmac100_prep_tx_csum() does. It only enables HW
> checksum generation on supported types and uses skb_checksum_help()
> otherwise, supported types being protocol ETH_P_IP and IP protocol
> being raw IP, TCP and UDP.
> 
> So this *should* have fallen back to SW for IPV6. So either something
> in my code there is making an incorrect assumption, or something is
> broken in skb_checksum_help() for IPV6 (which I somewhat doubt) or
> something else I can't think of, but setting a *deprecated* flag is
> definitely not the right answer, neither is completely disabling HW
> checksumming.
> 
> So can you investigate what's going on a bit more closely please ? I
> can try myself, though I have very little experience with IPV6 and
> probably won't have time before next week.

I did get that piece of information from Aspeed: The HW checksum
generation is supported if:

 - The length of UDP header is always 20 bytes.
 - The length of TCP and IP header have 4 * N bytes (N is 5 to 15).

Now these afaik are also the protocol limits, so it *should* work.

Or am I missing something or some funky encaspulation/header format
that can be used under some circumstances ?

Cheers,
Ben.


