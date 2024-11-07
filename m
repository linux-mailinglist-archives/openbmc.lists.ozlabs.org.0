Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7490E9C07FF
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 14:49:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkk1v24Ymz3cKT
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 00:48:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730987329;
	cv=none; b=Dwx3dSqB1Ibu9pFIral/Um/SUA97Orzcgl9K4Yr4MKwb9pulQ0X78TkSHLeVUhxHolmp6jdhbkf+B+kJ8GanLGAPNG0I3wMRmxRfwlFFcRJo+PcGX11xb8cNuJGRW0PX4AHVvDexPnzwox6nvY+hH4mgYbQPJ2/XvM7B8gcISMR3RQVeaN6m91JAxTWo/yKDK/7fwD4TB/wxfyqbzm11H7b4WzDr0kfdBg8hCRXy5EopPXRzTvUW8bwJoOhfpnXNJzAGaYKeUaji8dNSgD6bTone56ZLvp82fZEBctPJIFE4vU7Tr7pjRbfVMxpqAlSEtJ2dqz+hnNh8b2GfkNMLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730987329; c=relaxed/relaxed;
	bh=1o0PT+VvYeF2Yc1hTEqEhN6nNmR8jwyG9x4O7dGE/Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEQcqT0jvtjZzTi49VJJCcCQkCXCMxXqv7e2aIbI34ES6rLmhlxCuFu51R/G1vJO0F62RPnBR4FE4/ApDcubPby+/6P7KtIATSxhUuDcnCCBkiteOziIRCjzFkOcKUuJak2LzK8MYpxyJtI1j5UPHrWeV/u7ZtOf3GxBTXygdHbEA6lHZvsoArYqipeU72qDbviG32dA/p0ZgLZrHiHVHQEIYEGh9NVmuc9XklOnzvMdVel8O/orNlCPWvTxrIoOIsZR21U6EAzU7MdOwc4ZxOdaKPyK7d3L2NfEiTNIPveWdULewgKy/dIkoV5t9n79sEvWMC7Eg6SXEFQ+MnPknw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=qoPZCD8f; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=qoPZCD8f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 1771 seconds by postgrey-1.37 at boromir; Fri, 08 Nov 2024 00:48:47 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkk1q0Sh8z3bl6
	for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2024 00:48:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=1o0PT+VvYeF2Yc1hTEqEhN6nNmR8jwyG9x4O7dGE/Wk=; b=qo
	PZCD8fmKsuqe8MM0+5HAxgA1V6sLxp1dxWT6dgRzFLKJ+Uj612/2my5BcrbEkzNKu2cGnhqk12oGB
	/a4BAt4NCaZn7xVX092i/qM2JCfjxaohRr5xqBfTcg7hjl+yJ2+6TiiQ3PRLlum+gfT49bcro6kXI
	u2un0pipZbINs5Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t92PO-00CSlH-Qe; Thu, 07 Nov 2024 14:18:46 +0100
Date: Thu, 7 Nov 2024 14:18:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
 <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 07, 2024 at 06:31:26PM +0800, Joey Lu wrote:
> Dear Andrew,
> 
> Thank you for your reply.
> 
> Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
> > > +  phy-mode:
> > > +    enum:
> > > +      - rmii
> > > +      - rgmii-id
> > The phy-mode deepened on the board design. All four rgmii values are
> > valid.
> I will add them.
> > > +
> > > +  tx_delay:
> > > +    maxItems: 1
> > > +    description:
> > > +      Control transmit clock path delay in nanoseconds.
> > > +
> > > +  rx_delay:
> > > +    maxItems: 1
> > > +    description:
> > > +      Control receive clock path delay in nanoseconds.
> > If you absolutely really need these, keep them, but i suggest you drop
> > them. They just cause confusion, when ideally we want the PHY to be
> > adding RGMII delays, not the MAC.
> > 
> > If you do need them, then they should be in pS.
> 
> I will fix it.
> 
> We have customers who use a fixed link instead of a PHY, so these properties
> may be necessary.

That is a legitimate use case which can require the MAC to add delays,
but i generally try to get the switch on the other end to add the
delays, just to keep with the uniform setup.

Also, please take a look at ethernet-controller.yaml, these should be
called rx-internal-delay-ps & tx-internal-delay-ps.

	Andrew
