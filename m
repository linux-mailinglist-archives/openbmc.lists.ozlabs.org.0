Return-Path: <openbmc+bounces-17-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17959A9E5F5
	for <lists+openbmc@lfdr.de>; Mon, 28 Apr 2025 03:49:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zm5ws0xS5z2ygH;
	Mon, 28 Apr 2025 11:49:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745804988;
	cv=none; b=Xbi5cRHCvkqwQuwuReHy8DuonS+ivCtCUhtWyFRm2MbkKbX1R2s0Nbmom/VZNBN1BfwBvqiIVEJbrJzgD/SPdPvIE184Bx7/L2DYQUHiwwBDstZTD13296jmAvkp3pC13+swkprX/O/uCbWHCYy9I/T13/havJGqKOukd17Skwyryvq6A7FMPcgsYOB/hnrI+qLCwTLZ6YSK85fjb7JC+bhqxm3R76AxCUY/g770WlOyU5gSUKKHGicK9yNDkR0VIUmqISgeRXcjSLkNqHV4dnN9CNKrTJYXFH9BR9Yniw0wJi8QMzGvdzFkNfH8yeHvonNT15QH9nxb2CLoFMEXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745804988; c=relaxed/relaxed;
	bh=ldY72ppLIqM/OdWTeuDHPOXjUJ9dMcv1cnmMpoWGOb4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G2sSYHPlrznvk/ghsEkVBma9X9sFDogDMuY1LPEJr5HvSF8krhXXqynSknSC5xPsCRERwmP96hNQ6J4hcUbgPBXG+Kl705AlCWhCBOp/MAZWYl5PbQMUfZdkk1dfEwIaYsfGAShhnxK/NXuugd8TPm0Vd+V+MDXrp3XgYSWIg/BDprnWO5hRUA3XZA7cJgEBTWgNZMrybgLy0ghzrsduZeGFYZZv6lGUL3PHaWZPphp0yix2dJoIsXJFoHM5YR3UsOeLE/PuwwQ7D5NERbByMZ+9JIBOG8OSaqhDqDn/Pdo8hHZIudwQXkMHIjBp8lLTLyS5TkDyEFj1V9KmI7jr8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L4GsKg4/; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L4GsKg4/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zm5wq5m3tz2ybR
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 11:49:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1745804635;
	bh=ldY72ppLIqM/OdWTeuDHPOXjUJ9dMcv1cnmMpoWGOb4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=L4GsKg4/C6gU+6oGuadRGyD01D7WJRh41Pd0Adixz6boBIuCjSXYnKgnbbmUorEIR
	 /nR6TIW5cUoMnTsMesPc+SlhjgXBHYiSJYswGf4QGJqfJ1PMeBXvkyifUYIvZGCuH4
	 X1NcDm1z+s/vb1y0fZirNjBvtN6QMvBmon6DJMEl0vol2mLUajhzKG2LwhK36Xj9q1
	 n+uMEIKhON9HX15STj8819fls5dC8OSWx5s11t+7pyEd3rgTVpIrDBw1kD1RwWj9b2
	 McchNQ6LRtC8LVmZpqFhu4blg4RlJ020R3rjAQJQTTiCboJms2XPBeZcbUh3BIuAVj
	 r3bCfUcdtngog==
Received: from [192.168.72.171] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0C7697FA36;
	Mon, 28 Apr 2025 09:43:55 +0800 (AWST)
Message-ID: <b8064801a2f4c50edaf1f69f414751794df87817.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 3/3] net: mctp: usb: Port for kernel 6.6
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Santosh Puranik <santosh.puranik.ibm@gmail.com>,
 openbmc@lists.ozlabs.org,  joel@jms.id.au, andrew@codeconstruct.com.au
Date: Mon, 28 Apr 2025 09:43:54 +0800
In-Reply-To: <20250427153008.3166922-4-santosh.puranik.ibm@gmail.com>
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
	 <20250427153008.3166922-4-santosh.puranik.ibm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Santosh,

> --- a/drivers/net/mctp/mctp-usb.c
> +++ b/drivers/net/mctp/mctp-usb.c
> @@ -48,16 +48,17 @@ static void mctp_usb_out_complete(struct urb *urb)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case -ECONNRESET:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case -ESHUTDOWN:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case -EPROTO:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dev_dstats_tx_dropped(netdev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netdev->stats.tx_dropped++;

Some weird indenting happening here (and with most of the other
additions too).

If we don't want to use dstats, we should also remove

    dev->pcpu_stat_type =3D NETDEV_PCPU_STAT_DSTATS;

Have you checked that the stats look correct in your backport?

> @@ -340,7 +342,7 @@ static int mctp_usb_probe(struct usb_interface *intf,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_DELAYED_WORK(&dev->r=
x_retry_work, mctp_usb_rx_retry_work);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D mctp_register_netdev(ne=
tdev, NULL, MCTP_PHYS_BINDING_USB);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D mctp_register_netdev(ne=
tdev, NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err_free_urbs;

Alternatively, we could consider backporting 580db513b4a9 ("net: mctp:
Expose transport binding identifier via IFLA attribute") too. This would
be user-visible, as we would now have an new IFLA_MCTP_PHYS_BINDING
attribute on netlink update messages, but that should be entirely
backward-compatible for applications.

Cheers,


Jeremy

