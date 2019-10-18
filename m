Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934ADBAEC
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 02:34:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vRqN6DjwzDr1G
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 11:34:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vRpb1HRXzDqfv;
 Fri, 18 Oct 2019 11:33:26 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9I0Wvrx022950;
 Thu, 17 Oct 2019 19:32:58 -0500
Message-ID: <f6d5cb45a9aa167533135c5b218b45b1d210d31a.camel@kernel.crashing.org>
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
Date: Fri, 18 Oct 2019 11:32:57 +1100
In-Reply-To: <9AA81274-01F2-4803-8905-26F0521486CE@fb.com>
References: <20191011213027.2110008-1-vijaykhemka@fb.com>
 <3a1176067b745fddfc625bbd142a41913ee3e3a1.camel@kernel.crashing.org>
 <0C0BC813-5A84-403F-9C48-9447AAABD867@fb.com>
 <071cf1eeefcbfc14633a13bc2d15ad7392987a88.camel@kernel.crashing.org>
 <9AA81274-01F2-4803-8905-26F0521486CE@fb.com>
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

On Fri, 2019-10-18 at 00:06 +0000, Vijay Khemka wrote:
> 
>     > This is not a matter of unsupported csum, it is broken hw csum. 
>     > That's why we disable hw checksum. My guess is once we disable
>     > Hw checksum, it will use sw checksum. So I am just disabling hw 
>     > Checksum.
>     
>     I don't understand what you are saying. You reported a problem with
>     IPV6 checksums generation. The HW doesn't support it. What's "not a
>     matter of unsupported csum" ?
>     
>     Your patch uses a *deprecated* bit to tell the network stack to only do
>     HW checksum generation on IPV4.
>     
>     This bit is deprecated for a reason, again, see skbuff.h. The right
>     approach, *which the driver already does*, is to tell the stack that we
>     support HW checksuming using NETIF_F_HW_CSUM, and then, in the transmit
>     handler, to call skb_checksum_help() to have the SW calculate the
>     checksum if it's not a supported type.
> 
> My understanding was when we enable NETIF_F_HW_CSUM means network 
> stack enables HW checksum and doesn't calculate SW checksum. But as per
> this supported types HW checksum are used only for IPV4 and not for IPV6 even
> though driver enabled NETIF_F_HW_CSUM. For IPV6 it is always a SW generated
> checksum, please correct me here.

Have you actually read the comments in skbuff.h that I pointed you to ?

And the rest of my email for that matter ?

>     This is exactly what ftgmac100_prep_tx_csum() does. It only enables HW
>     checksum generation on supported types and uses skb_checksum_help()
>     otherwise, supported types being protocol ETH_P_IP and IP protocol
>     being raw IP, TCP and UDP.
> 
>     
>     So this *should* have fallen back to SW for IPV6. So either something
>     in my code there is making an incorrect assumption, or something is
>     broken in skb_checksum_help() for IPV6 (which I somewhat doubt) or
>     something else I can't think of, but setting a *deprecated* flag is
>     definitely not the right answer, neither is completely disabling HW
>     checksumming.
>     
>     So can you investigate what's going on a bit more closely please ? I
>     can try myself, though I have very little experience with IPV6 and
>     probably won't have time before next week.
>     
>     Cheers,
>     Ben.
>     
>     >     The driver should have handled unsupported csum via SW fallback
>     >     already in ftgmac100_prep_tx_csum()
>     >     
>     >     Can you check why this didn't work for you ?
>     >     
>     >     Cheers,
>     >     Ben.
>     >     
>     >     > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>     >     > ---
>     >     > Changes since v1:
>     >     >  Enabled IPV4 hw checksum generation as it works for IPV4.
>     >     > 
>     >     >  drivers/net/ethernet/faraday/ftgmac100.c | 13 ++++++++++++-
>     >     >  1 file changed, 12 insertions(+), 1 deletion(-)
>     >     > 
>     >     > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
>     >     > b/drivers/net/ethernet/faraday/ftgmac100.c
>     >     > index 030fed65393e..0255a28d2958 100644
>     >     > --- a/drivers/net/ethernet/faraday/ftgmac100.c
>     >     > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
>     >     > @@ -1842,8 +1842,19 @@ static int ftgmac100_probe(struct
>     >     > platform_device *pdev)
>     >     >  	/* AST2400  doesn't have working HW checksum generation */
>     >     >  	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
>     >     >  		netdev->hw_features &= ~NETIF_F_HW_CSUM;
>     >     > +
>     >     > +	/* AST2500 doesn't have working HW checksum generation for IPV6
>     >     > +	 * but it works for IPV4, so disabling hw checksum and enabling
>     >     > +	 * it for only IPV4.
>     >     > +	 */
>     >     > +	if (np && (of_device_is_compatible(np, "aspeed,ast2500-mac")))
>     >     > {
>     >     > +		netdev->hw_features &= ~NETIF_F_HW_CSUM;
>     >     > +		netdev->hw_features |= NETIF_F_IP_CSUM;
>     >     > +	}
>     >     > +
>     >     >  	if (np && of_get_property(np, "no-hw-checksum", NULL))
>     >     > -		netdev->hw_features &= ~(NETIF_F_HW_CSUM |
>     >     > NETIF_F_RXCSUM);
>     >     > +		netdev->hw_features &= ~(NETIF_F_HW_CSUM |
>     >     > NETIF_F_RXCSUM
>     >     > +					 | NETIF_F_IP_CSUM);
>     >     >  	netdev->features |= netdev->hw_features;
>     >     >  
>     >     >  	/* register network device */
>     >     
>     >     
>     > 
>     
>     
> 

