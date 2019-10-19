Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C612FDD5A9
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 02:04:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46w36h6MY9zDqnR
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 11:04:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46w35w3pN7zDqhs;
 Sat, 19 Oct 2019 11:03:48 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9J038G6009788;
 Fri, 18 Oct 2019 19:03:10 -0500
Message-ID: <0ef567e985ce3fe821cbd80265f85a35d16be373.camel@kernel.crashing.org>
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
Date: Sat, 19 Oct 2019 11:03:08 +1100
In-Reply-To: <529EF9B4-DFDE-4DB7-BE26-3AED8D814134@fb.com>
References: <20191011213027.2110008-1-vijaykhemka@fb.com>
 <3a1176067b745fddfc625bbd142a41913ee3e3a1.camel@kernel.crashing.org>
 <0C0BC813-5A84-403F-9C48-9447AAABD867@fb.com>
 <071cf1eeefcbfc14633a13bc2d15ad7392987a88.camel@kernel.crashing.org>
 <9AA81274-01F2-4803-8905-26F0521486CE@fb.com>
 <f6d5cb45a9aa167533135c5b218b45b1d210d31a.camel@kernel.crashing.org>
 <529EF9B4-DFDE-4DB7-BE26-3AED8D814134@fb.com>
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

On Fri, 2019-10-18 at 22:50 +0000, Vijay Khemka wrote:
> I don't have much understanding of IP Stack but I went through code details and 
> you are right and found that it should fallback to SW calculation for IPV6 but it doesn't
> happen because ftgmac100_hard_start_xmit checks for CHECKSUM_PARTIAL before
> setting HW checksum and calling ftgmac100_prep_tx_csum function. And in my 
> understanding, this value is set CHECKSUM_PARTIAL in IP stack. I looked up IP stack for
> IPV6, file net/ipv6/ip6_output.c, function __ip6_append_data: here it sets 
> CHECKSUM_PARTIAL only for UDP packets not for TCP packets. Please look at line
>  number 1880. This could be an issue we are seeing here as why
> ftgmac100_prep_tx_csum is not getting triggered for IPV6 with TCP. Please correct
> me if my understanding is wrong.
>     

Not entirely sure. tcp_v6_send_response() in tcp_ipv6.c does set
CHECKSUM_PARTIAL as well. I don't really know how things are being
handled in that part of the network stack though.

From a driver perspective, if the value of ip_summed is not
CHECKSUM_PARTIAL it means we should not have to calculate any checksum.
At least that's my understanding here.

You may need to add some traces to the driver to see what you get in
there, what protocol indication etc... and analyze the corresponding
packets with something like tcpdump or wireshark on the other end.

Cheers,
Ben.


