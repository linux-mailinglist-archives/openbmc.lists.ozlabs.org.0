Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD290809D08
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 08:26:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xt0rvb7Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmjP2178Xz3dC0
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 18:26:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xt0rvb7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmjNL3fZrz2yG9
	for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2023 18:25:36 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bffb64178so2008586e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2023 23:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702020328; x=1702625128; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zFWzRoEr8M/oRrGJPmJRqk2/Ntrz7fpxdLO3Ith+0qg=;
        b=Xt0rvb7Y65iqLXjErhEdiouDN/0j71kE0YEhgfnyActtrpRmkET//WpXuSDQzwXYc5
         l9hVo7PyoDOtZYfR3NpcY5G6Jrh4BO6vQ7ADg+378fGokRJwIgSyVmQ/21WiO3HPysWP
         O/r2qkG/43x2OQj7wVd456laV6HP7VPdkQbyG790/1pkb+g1BY5sM4oEadScPAr1yByo
         zYIVkVDTDbloeMHeSg29pES6rR7QWTNhEWa/VKeyUxbV2X2wPpWjnOwpdOMn25FKeVx+
         HHJj5LSea3hT1LU4Gt00Bix7BooeFUvU95IU8unP0dxlCE/PNrnqOjwQwrNe7ftdOEY5
         Cg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702020328; x=1702625128;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFWzRoEr8M/oRrGJPmJRqk2/Ntrz7fpxdLO3Ith+0qg=;
        b=h5FPP9ORLSUHRFY21dDmveL8msC6MJ9O1/ZsudTLB1e5sBMedCHFxhwamXAh7fY2/l
         AEFXSgNWT3e6OeV4Gn3QXKxxto7pqyJDLhIT1gs+jYPU4v3usHwXUc1TRkbuL5sFC6tv
         ICZEb56ruupwLN0ZtSRk/FBpZARo/gdxXtGvaUqU4ejzhTHXbRRlfJE4iflKpBRZddsT
         C7OUAjiP3fKiyd5O95EJpBPmSHocyb8fOkk2DI+8lyqeQSTXxt/0rI7uKJnoB3K/eWzX
         yf7yWLVwZHRq2RYS2QGDEZf1TgpN28rwXGJ0gFi4cFvpKQiJvKIOwqaYLduNL8zrHmv+
         HGPQ==
X-Gm-Message-State: AOJu0YyfyZboaBRX8iqLfNu+f/HsgudrSihs6Azj2vqOu/H9h23jQNVG
	dFjFaOGGFTq9F5Ue6tW9n9U=
X-Google-Smtp-Source: AGHT+IGF0wcQrVpeebF/3oglMOacZEhr2UcgbKvtn48jCM4/wmK8lYkI6SCqQfp5IPKxwV0vEJGxiw==
X-Received: by 2002:a05:6512:3b2a:b0:50b:f6d7:ab95 with SMTP id f42-20020a0565123b2a00b0050bf6d7ab95mr2743877lfv.30.1702020328131;
        Thu, 07 Dec 2023 23:25:28 -0800 (PST)
Received: from [192.168.1.161] ([81.200.16.167])
        by smtp.gmail.com with ESMTPSA id d12-20020a0565123d0c00b0050d12f0bba6sm91245lfv.97.2023.12.07.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:25:27 -0800 (PST)
Message-ID: <5e6b2312d54a2ce030cff6270e2d547a3be93cb5.camel@gmail.com>
Subject: Re: [PATCH dev-5.6 3/3] net/ncsi: Add NC-SI 1.2 Get MC MAC Address
 command
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Fri, 08 Dec 2023 10:25:26 +0300
In-Reply-To: <ZXG3ru0LmEveGqEA@heinlein.vulture-banana.ts.net>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
	 <20231205234843.4013767-3-patrick@stwcx.xyz>
	 <6abc879a2c29cc8b8044c5c483bff5a01750695b.camel@gmail.com>
	 <ZXFHdtNDvBshKQap@heinlein.vulture-banana.ts.net>
	 <e735c41f9eb2985a46fa63fb0d0b477513a227f0.camel@gmail.com>
	 <ZXG3ru0LmEveGqEA@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, Peter Delevoryas <peter@pjd.dev>, "David S.
	Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2023-12-07 at 06:16 -0600, Patrick Williams wrote:
> On Thu, Dec 07, 2023 at 10:44:05AM +0300, Ivan Mikhaylov wrote:
> > On Wed, 2023-12-06 at 22:17 -0600, Patrick Williams wrote:
> > > On Thu, Dec 07, 2023 at 12:23:38AM +0300, Ivan Mikhaylov wrote:
> > > >=20
> > > >=20
> > > > Patrick, I've the fix about ndo_set_mac_address not so long in
> > > > the
> > > > past
> > > > https://lore.kernel.org/all/20230828101151.684010399@linuxfoundatio=
n.org/
> > > >=20
> > > > ndo_set_mac_address do not notify network layer about mac
> > > > change.
> > >=20
> > > Hello Ivan,
> > >=20
> > > I think you're suggesting there is a bug in the code that was
> > > applied
> > > to
> > > net-next here?=C2=A0 If so, we'll need to get a fix into net-next.=C2=
=A0
> > > These
> > > commits are just a backport request to the OpenBMC tree of the
> > > code
> > > that
> > > was already applied to net-next.
> > >=20
> >=20
> > Patrick, yes, there is a bug, I'll write to the thread
> > today/tomorrow
> > with that commit about that problem. Need to think how to make a
> > fix
> > for this problem, reverting and make it right until it in net-next
> > or
> > fix above that commit.
>=20
> Is this the fix?
>=20
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index bee290d0f48b..b02e663e56dc 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -1115,7 +1115,9 @@ static int ncsi_rsp_handler_gmcma(struct
> ncsi_request *nr)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < rsp->address=
_count; i++) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 memcpy(saddr.sa_data, &rsp->addresses[i], ETH_ALEN);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D ndev->netdev_ops->ndo_set_mac_address(ndev,
> &saddr);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 rtnl_lock();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D dev_set_mac_address(ndev, &saddr, NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 rtnl_unlock();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (ret < 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netdev_w=
arn(ndev, "NCSI: Unable to assign %pM
> to device\n",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 saddr.sa_da=
ta);
>=20

Patrick, yes, this is the fix. Difference in calling of
call_netdevice_notifiers from dev_set_mac_address to make sure that
everybody aware about mac change which using this interface.

Thanks.
