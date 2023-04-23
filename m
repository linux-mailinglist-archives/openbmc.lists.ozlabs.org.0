Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEF06EC441
	for <lists+openbmc@lfdr.de>; Mon, 24 Apr 2023 06:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4Wrk4jr4z3ch2
	for <lists+openbmc@lfdr.de>; Mon, 24 Apr 2023 14:10:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kTHd1OPT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kTHd1OPT;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q3lkG33Tsz2ylk
	for <openbmc@lists.ozlabs.org>; Sun, 23 Apr 2023 08:02:29 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ec816d64afso13020224e87.1
        for <openbmc@lists.ozlabs.org>; Sat, 22 Apr 2023 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682200941; x=1684792941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2dGkZFDJrBb5dcOlpUDOnjcit/4DMIiT8lgxh76O1Fc=;
        b=kTHd1OPTWLjdiO0sjUTsgDsPQL1IkmIscMklw6ifSCdcLo6jz6HVZaCkehqdfFJxFG
         AMPUWA+Epr+9/Ql6jnMBEwtlZG4pSii5meYGrWbjBv3tIST/7gX3zedg71xp+iISH/sI
         rIoBSs5bgzPGM5ZbfKj+DQrJbNyUlRAWwke104suSNtsyLWOJ0OnNVr3RawaLQWusvHZ
         MWrUDGHh+tSEqTwgGxF5i4ws48OkYKGldUM1TCUjCCSMbvc2OYbTybjHZgCpq6mzmGyY
         z+EZ3ZvNB3RGi+bCARx83XrUneR4kSh2a4wwdBsl7+tAr16G72fzh9DlVQIG5k7pwxig
         eHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682200941; x=1684792941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dGkZFDJrBb5dcOlpUDOnjcit/4DMIiT8lgxh76O1Fc=;
        b=Yf/x0dxF6S0hb3g1e+zjohSAvShQXeOO/gN4UzbPK9cTGysMm+MTpyl7aiD0Qngk5+
         sRJMJWa7m+QiRoPiB9ppAn9ioLJD+Im5WQ0SlkJEkSJi1CMFTfj0RI8SjbPc/KHNfez4
         dOwFM7lrv6QswCaXD3X7WNLAfAzKMyJSyRiRmmivIedUHkmVWl4zLTJu7KVEsm7BOpjm
         cnt+A9C/AIWK/B01AnEZt3GOCLgcSqaAKGmc6k90ozYTjILiAUcRCL02ulNMOla9lUli
         S0tNLg8ypdccLPvcqmqQf5PXtM10Lqx+bj+AcuI5F7OgomUEfoGgGFWNHZwB0xkHOkH0
         SNcQ==
X-Gm-Message-State: AAQBX9co79jBeKMl1sHsubJgNQ0uWeNSHEaCfO/obYu/au+33cqmSQ+i
	g7e2C21tb342uNVv+HRhssA=
X-Google-Smtp-Source: AKy350YyP9Mx6PKHYDySzsYS4Kng3481t/YYrpHXjc3ubrI6JKgUZryv6iZz/w3Cd/K9xjSzXPQgvA==
X-Received: by 2002:ac2:4c54:0:b0:4d8:86c1:4782 with SMTP id o20-20020ac24c54000000b004d886c14782mr4428578lfk.23.1682200940808;
        Sat, 22 Apr 2023 15:02:20 -0700 (PDT)
Received: from [100.119.4.164] (93-80-67-109.broadband.corbina.ru. [93.80.67.109])
        by smtp.gmail.com with ESMTPSA id w4-20020ac25d44000000b004eb0c51780bsm1043563lfd.29.2023.04.22.15.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 15:02:20 -0700 (PDT)
Message-ID: <38eff1f50343a576edd115be9283f6bd28bd2008.camel@gmail.com>
Subject: Re: [PATCH 3/4] net/ftgmac100: add mac-address-increment option for
 GMA command from NC-SI
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Rob Herring <robh@kernel.org>
Date: Sun, 23 Apr 2023 01:02:17 +0000
In-Reply-To: <20230418185445.GA2111443-robh@kernel.org>
References: <20230413002905.5513-1-fr0st61te@gmail.com>
	 <20230413002905.5513-4-fr0st61te@gmail.com>
	 <20230418185445.GA2111443-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Apr 2023 14:10:20 +1000
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
Cc: devicetree@vger.kernel.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>, Paul Fertser <fercerpav@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2023-04-18 at 13:54 -0500, Rob Herring wrote:
> On Thu, Apr 13, 2023 at 12:29:04AM +0000, Ivan Mikhaylov wrote:
> > Add s32 mac-address-increment option for Get MAC Address command
> > from
> > NC-SI.
> >=20
> > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> > Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/net/ftgmac100.txt | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt
> > b/Documentation/devicetree/bindings/net/ftgmac100.txt
> > index 29234021f601..7ef5329d888d 100644
> > --- a/Documentation/devicetree/bindings/net/ftgmac100.txt
> > +++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
> > @@ -22,6 +22,10 @@ Optional properties:
> > =C2=A0- use-ncsi: Use the NC-SI stack instead of an MDIO PHY. Currently
> > assumes
> > =C2=A0=C2=A0 rmii (100bT) but kept as a separate property in case NC-SI=
 grows
> > support
> > =C2=A0=C2=A0 for a gigabit link.
> > +- mac-address-increment: Increment the MAC address taken by GMA
> > command via
> > +=C2=A0 NC-SI. Specifies a signed number to be added to the host MAC
> > address as
> > +=C2=A0 obtained by the OEM GMA command. If not specified, 1 is used by
> > default
> > +=C2=A0 for Broadcom and Intel network cards, 0 otherwise.
>=20
> This would need to be common. There's been some attempts around how
> to=20
> support a base MAC address with a transform per instance. So far it's
> not clear that something in DT works for everyone. Until there's=20
> something common (if ever), you need platform specific code somewhere
> to=20
> handle this. The nvmem binding has had some extensions to support
> that.
>=20
> Rob

Rob, I agree but unfortunately there isn't a generic option for such
case, maybe something should be added into net/ethernet-
controller.yaml? As example, `mac-address-increment` option using
widely in openwrt project. About nvmem, are we talking `nvmem-cell-
names` option or reverse_mac_address in drivers/nvmem/imx-ocotp.c?

I'll do the transfer into DT schema, that's not a problem but after
naming resolve.

Adding openbmc community, maybe they have some ideas about this one.

Thanks.
