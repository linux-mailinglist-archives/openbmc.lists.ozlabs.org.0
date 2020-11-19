Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0B62BA208
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 06:50:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cclxn2cKKzDqwV
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 16:50:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=brouer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aFvwhHHD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aFvwhHHD; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcWnk0RHdzDqpC
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 07:42:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605818535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgYqjANhFZVw2xsV1NPryI63UVScbHN7GEpAwzgrcBA=;
 b=aFvwhHHDXDLqbjYYG/3ApYiRDtSZEsAQaUufHsOZI8DJEANFGKf6vv7ptjdSBUpAujdOrE
 uQ+02e0LZvJ0fyvxJeq1jexjMKilhzm87L5mvWOOFEuLRX0A+4GSdCXDOn53XmSzmJPBTz
 d4o/YLkJVIUDX90Uqq1avnCu7l1Gk5U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605818535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgYqjANhFZVw2xsV1NPryI63UVScbHN7GEpAwzgrcBA=;
 b=aFvwhHHDXDLqbjYYG/3ApYiRDtSZEsAQaUufHsOZI8DJEANFGKf6vv7ptjdSBUpAujdOrE
 uQ+02e0LZvJ0fyvxJeq1jexjMKilhzm87L5mvWOOFEuLRX0A+4GSdCXDOn53XmSzmJPBTz
 d4o/YLkJVIUDX90Uqq1avnCu7l1Gk5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-J2xKKEZ6OOWubPMcg1L6iQ-1; Thu, 19 Nov 2020 15:42:10 -0500
X-MC-Unique: J2xKKEZ6OOWubPMcg1L6iQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C76F11005D5C;
 Thu, 19 Nov 2020 20:42:04 +0000 (UTC)
Received: from carbon (unknown [10.36.110.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFF810016F4;
 Thu, 19 Nov 2020 20:41:56 +0000 (UTC)
Date: Thu, 19 Nov 2020 21:41:55 +0100
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: XDP maintainer match (Was  [PATCH v2 0/2] hwmon: (max127) Add
 Maxim MAX127 hardware monitoring)
Message-ID: <20201119214155.5285e2d2@carbon>
In-Reply-To: <20201119095928.01fd10e0@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
 <20201118232719.GI1853236@lunn.ch>
 <20201118234252.GA18681@taoren-ubuntu-R90MNF91>
 <20201119010119.GA248686@roeck-us.net>
 <20201119012653.GA249502@roeck-us.net>
 <20201119074634.2e9cb21b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <20201119173535.1474743d@carbon>
 <088057533a9feb330964bdab0b1b8d2f69b7a22c.camel@perches.com>
 <20201119095928.01fd10e0@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:41:22 +1100
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
Cc: linux-hwmon@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Jean Delvare <jdelvare@suse.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, brouer@redhat.com,
 Tao Ren <rentao.bupt@gmail.com>, taoren@fb.com, Joe Perches <joe@perches.com>,
 bpf@vger.kernel.org, mikechoi@fb.com, "David S .
 Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 19 Nov 2020 09:59:28 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 19 Nov 2020 09:09:53 -0800 Joe Perches wrote:
> > On Thu, 2020-11-19 at 17:35 +0100, Jesper Dangaard Brouer wrote: =20
> > > On Thu, 19 Nov 2020 07:46:34 -0800 Jakub Kicinski <kuba@kernel.org> w=
rote:   =20
> >  =20
> > > I think it is a good idea to change the keyword (K:), but I'm not sure
> > > this catch what we want, maybe it does.  The pattern match are meant =
to
> > > catch drivers containing XDP related bits.
> > >=20
> > > Previously Joe Perches <joe@perches.com> suggested this pattern match,
> > > which I don't fully understand... could you explain Joe?
> > >=20
> > > =C2=A0=C2=A0(?:\b|_)xdp(?:\b|_)   =20
> >=20
> > This regex matches only:
> >=20
> > 	xdp
> > 	xdp_<anything>
> > 	<anything>_xdp_<anything>
> > 	<anything>_xdp
> >  =20
> > > For the filename (N:) regex match, I'm considering if we should remove
> > > it and list more files explicitly.  I think normal glob * pattern
> > > works, which should be sufficient.   =20
> >=20
> > Lists are generally more specific than regex globs. =20
>=20
> Checking like Alexei did it seems Joe's version is faster and better:
>=20
> $ git grep -l -E "[^a-z0-9]xdp[^a-z0-9]" | wc -l
> 295
> $ git grep -l -E '(\b|_)xdp(\b|_)' | wc -l
> 297
> $ time git grep -l -E '(\b|_)xdp(\b|_)' > /tmp/a

Okay, I guess this is the pattern you want: '(\b|_)xdp(\b|_)'

=20
> Joe would you like to send a patch, or should I?

As you noticed I already send out a patch, I can send a new with your
pattern, as it seems to be faster.

--=20
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

