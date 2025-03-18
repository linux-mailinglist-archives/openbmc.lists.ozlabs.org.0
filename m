Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18DA67A19
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 17:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHHxd59Bkz3c97
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 03:54:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742316866;
	cv=none; b=FjLNxw5tN7Dun7wIKLc6ZoEYdlsPHJ9pmca4Gt+9WgOUtACBJFlbFzDi18dgs1ofcQMJbiMZWamxtSTCqj3K/fqZgVK7kKC+1GgkdNeEDeTznlZnpFEc01vUcAPLXqU1wmPpQM88WAMuIJRp810asK4KWn7Tzpnu8fZMMBpD4dX66vGMSBbnWbcDP5BxvcfzCQFPvU3/WpvgQ8YiJ6Pu6TGVWTAxY4TKMVXIRIj1GD5eMyYTz2qDni78GAqbJ7MWkKZOaAFiSidlGQc6wDF6/aaNGEr0g+wLCeshj5uyfpfq5LHnfcP3dYIDol+L8nmtz9RdjBK9cknwGfLsMR1piA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742316866; c=relaxed/relaxed;
	bh=Cu8WjOKvjc7xER6FBh5x1tsTM5cnZ9iM06KfKZsppec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5NM9hGtM+dEpxVRO+iQxIfEvbhp4Lrl+wjQRinOjaovC7SFNd3WQSM3y6wmGrUr9rGX8L844FDHl1SNV0rXBhOdxRQKX2ztN6/cbz9SPBsHCWVNhBYVrjEt67FN1ncPe6Ozcxiui20q8oojsona/NqwU7L4jXeXH95GklTyx9J4XvT85DHaKC6tWkUCpqYUnFj8HOmne0m0Mv3Qbx1NQjlio/d4zmcabqLhJNSNpXndhfSrwucYZOycn8Zif9950WBwRPOIXxhzrNsBV5zjqZAnus4EPTmlBOTjs2Qy3OGfuWUse6vmbka4SCz96eT/2MvbR/MdRjK0CiQhLsnfNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=yCNbrA8X; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=yCNbrA8X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHHxX4q1bz2yKn;
	Wed, 19 Mar 2025 03:54:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Cu8WjOKvjc7xER6FBh5x1tsTM5cnZ9iM06KfKZsppec=; b=yCNbrA8XKXcgrihH6JvsnO+10G
	Uvq5lfXLMOkRw64d+Wm+k7JhW55u2hRBpbkA/9kOBslNZtOqKVWXKSsgdj6R5Be1G9Y2VGCJ9SSrN
	ckwVAmG6G0JYvfrc9QF4tFzrsb9EvamSZ8gxh/wUAPdnsyh3eNY0bQEacQd+K1VK7lyc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuaCc-006Hsy-Mr; Tue, 18 Mar 2025 17:54:06 +0100
Date: Tue, 18 Mar 2025 17:54:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rajaganesh Rathinasabapathi <rrathina@amd.com>
Subject: Re: [PATCH v3 2/2] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Message-ID: <6ca63f35-05c4-472d-a412-74e5c7ffeefb@lunn.ch>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
 <fdd969cb-aa2d-4d55-949e-e2631757221e@lunn.ch>
 <ab74593d-a3be-4283-ad83-3525cb6d7dd1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab74593d-a3be-4283-ad83-3525cb6d7dd1@amd.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, jothayot@amd.com, Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>, robh+dt@kernel.org, joel@jms.id.au, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 18, 2025 at 10:18:46PM +0530, Rajaganesh Rathinasabapathi wrote:
> On 3/18/25 19:38, Andrew Lunn wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> >> +&mac3 {
> >> +     status = "okay";
> >> +     phy-mode = "rgmii";
> > 
> > Does the PCB have extra long clock lines to insert the 2ns RGMII
> > delay? Or are you another victim of aspeeds broken MAC/SCU driver?
> > 
> >        Andrew
> We're following Aspeed SDK and referred other dts based on ast2600.

Which are all broken.

At the moment, you are joining NVIDIA and IBM waiting for Aspeed to
sort out this mess. Maybe you can apply some pressure...

     Andrew
