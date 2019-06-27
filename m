Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 664FD57C4E
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 08:39:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z9Gd5XZJzDqS9
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 16:39:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z9Ft5M3wzDqN6
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 16:38:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="rD8AcenP"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Z9Ft0mQbz9s4Y;
 Thu, 27 Jun 2019 16:38:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1561617506; bh=3CZ2q550WEhSvFfuqh884wAo9ghAHW8ivfphUhXGrhg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=rD8AcenPSer35xTZS3/OcdZmX88gitpQBL2I9pPE9wZsvqqLJ/KZUNCJswqMytSzG
 KweilN3WuXMM1rdBYCjffqBxNlAQ7WudV+QdDl8/Gb9waJBdmbwFXl5x4SdvBabsV9
 Twn/q7hWoOWIRuPQOwq3iwphhy6ME4l9/1cd9J+3XulSjXgxN2mhO/conYJhbISc6C
 nBhZNGsrf4iWfWFM8ORkNYjydLZyADA8X76KEw9/MgH05EqlW3TO+dRLLMHHaESBR5
 J1h0kDHBE3lUBMuxIlrtwt/ThYzycWXOApD/huOS8Z8+tTp6JmoBD/pMeQblA7by6w
 c3P2GEntq4E1A==
Message-ID: <e42cb9d5bbf059844ad37cd69cb79f9da1dc44e7.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.1] fsi: core: Fix NULL dereference issue
From: Jeremy Kerr <jk@ozlabs.org>
To: Lei YU <mine260309@gmail.com>
Date: Thu, 27 Jun 2019 14:38:25 +0800
In-Reply-To: <CAARXrtmqkYeHiE9rr4uYL_b3YtK=-hsnmR3DJtdy1_ZVLKWtUQ@mail.gmail.com>
References: <20190614071643.18607-1-mine260309@gmail.com>
 <b75c57a9f3ac3c6e91c470d69dcd2ab6a4f6ee03.camel@ozlabs.org>
 <CAARXrtmqkYeHiE9rr4uYL_b3YtK=-hsnmR3DJtdy1_ZVLKWtUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei

> > 
> > It looks like this will leak memory (through the struct fsi_slave)
> > that
> > has been kzalloc()ed. After device_register, we need to call
> > put_device() to free the struct fsi_slave, but there's no mechanism
> > for
> > that to happen if we remove it from fsi_slave_init().
> 
> The memory is "leaked" in this function, that the slave device is not
> freed
> here. But eventually, it will be freed in fsi_slave_release() (if I
> understand
> the code correctly), so there is no leak, eventually.

But there's no way for fsi_slave_release() to be called, as the device
isn't registered with the core (d1dcd67825 effectively removed the
device_add from the slave device init).

I think that the BUG_ON that we're hitting in the release path is
through the cdev parent release, which brings the refcount down to 0,
then we do another put_device().

This could just be a matter of correcting the registration of the slave
to the device core - I'll take a look here.

Cheers,


Jeremy

