Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06526700281
	for <lists+openbmc@lfdr.de>; Fri, 12 May 2023 10:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHhkh2zt7z3fWn
	for <lists+openbmc@lfdr.de>; Fri, 12 May 2023 18:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EFXVT/a3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EFXVT/a3;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHhk73k9Kz3bfw
	for <openbmc@lists.ozlabs.org>; Fri, 12 May 2023 18:28:45 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ad819ab8a9so72980631fa.0
        for <openbmc@lists.ozlabs.org>; Fri, 12 May 2023 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683880119; x=1686472119;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h0STyvDKOt/jPA6CkWmo5ah+D/XtsYoBFrU3Alj5ZsU=;
        b=EFXVT/a30g4w+NUlOkvBYSmMYZuq+2UkSXSY7L5VI9FXK9h6p9sebFV1ZG1n9iAdRo
         TE2TV5vJYHPQv601eshefRx655Pm8ALANm+hIPOzlm/A4ndvayojYfATi8NRrY2f+FSH
         GqoGt18ApNwKW/Wf7YMBhyBFe5+Fe1mIFLoD3TyqDJPdRPjcuF5YAbpvI/sXWv1iEYjI
         tZdfRX7ArJcMrNr3rqZ3OFOlaB8HvZqJEa4Sw53nwwSTBiVQIe43Bh1SIp2IMzaZBHQO
         LeoJ/qvyOspp90dSrlC67d5gCtDbvEFFwR8TfNVNaGDb39JV5w5Jj48XPk1XEnlBmiX8
         YQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683880119; x=1686472119;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0STyvDKOt/jPA6CkWmo5ah+D/XtsYoBFrU3Alj5ZsU=;
        b=SP1ensVwBy8PzF1OGdRnn1Ey8fJ6RG8fpgBR27VZHV9F2D3naGQdwEB4Sli9wB7h+b
         WDxVvioXXq6fvvBGjN3R4cm2LGfXBoTOYPnGTgsuFWiOL6uP3S3Q+3snnwYgppdXCZWX
         SPAq4fW61b/0Ff7bkqPKas85YMuafbernGsu6USnzoIzEvx8jBcC+0T+MxmYhjOlOnud
         KvdzDMU2MfSNwBUUPyIm8evmHDLLgQjZLzmIIG3YP1pg8QjyJ/+v7WRuxDTxikSycAAB
         PJ0YqAP2I66EiEV3/iMFmON3Wtu1AvVamhEQrIcrJ/8w0p4NPiMovyRcNDwIIye54Lxo
         aVIQ==
X-Gm-Message-State: AC+VfDzrKUHtXrwDWbqtsXvJ88ZVMvSR+O9MwRPD4qW6KPddAq/uYzzM
	kyL6CQXdgMghkMZCTT5LndI=
X-Google-Smtp-Source: ACHHUZ6vsL+DKF6BXISXrfmfcFw38us7u5JV3h9YJmohdhzUI31GzrrgI9YuuOkIONqSb4FxiCgvFw==
X-Received: by 2002:a2e:9942:0:b0:2ad:8f4a:4ed5 with SMTP id r2-20020a2e9942000000b002ad8f4a4ed5mr3646719ljj.37.1683880119229;
        Fri, 12 May 2023 01:28:39 -0700 (PDT)
Received: from [100.119.7.139] (95-31-186-77.broadband.corbina.ru. [95.31.186.77])
        by smtp.gmail.com with ESMTPSA id y23-20020a05651c021700b002a8b9570403sm2720044ljn.31.2023.05.12.01.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:28:38 -0700 (PDT)
Message-ID: <be85bef7e144ebe08f422bf53bb81b59a130cb29.camel@gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: net: add mac-address-increment
 option
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Samuel
 Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 12 May 2023 11:28:37 +0000
In-Reply-To: <8de01e81-43dc-71af-f56f-4fba957b0b0b@linaro.org>
References: <20230509143504.30382-1-fr0st61te@gmail.com>
	 <20230509143504.30382-4-fr0st61te@gmail.com>
	 <6b5be71e-141e-c02a-8cba-a528264b26c2@linaro.org>
	 <fc3dae42f2dfdf046664d964bae560ff6bb32f69.camel@gmail.com>
	 <8de01e81-43dc-71af-f56f-4fba957b0b0b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
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
Cc: Paul Fertser <fercerpav@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2023-05-12 at 08:22 +0200, Krzysztof Kozlowski wrote:
> On 11/05/2023 01:31, Ivan Mikhaylov wrote:
> > On Wed, 2023-05-10 at 16:48 +0200, Krzysztof Kozlowski wrote:
> > > On 09/05/2023 16:35, Ivan Mikhaylov wrote:
> > > > Add the mac-address-increment option for specify MAC address
> > > > taken
> > > > by
> > > > any other sources.
> > > >=20
> > > > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> > > > Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> > > > ---
> > > > =C2=A0.../devicetree/bindings/net/ethernet-controller.yaml=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 8
> > > > ++++++++
> > > > =C2=A01 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/ethernet-
> > > > controller.yaml
> > > > b/Documentation/devicetree/bindings/net/ethernet-
> > > > controller.yaml
> > > > index 00be387984ac..6900098c5105 100644
> > > > --- a/Documentation/devicetree/bindings/net/ethernet-
> > > > controller.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/ethernet-
> > > > controller.yaml
> > > > @@ -34,6 +34,14 @@ properties:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 6
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 6
> > > > =C2=A0
> > > > +=C2=A0 mac-address-increment:
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/int32
> > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the MAC address increment=
 to be added to the
> > > > MAC
> > > > address.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Should be used in cases when there =
is a need to use MAC
> > > > address
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 different from one obtained by any =
other level, like u-
> > > > boot
> > > > or the
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NC-SI stack.
> > >=20
> > > We don't store MAC addresses in DT, but provide simple
> > > placeholder
> > > for
> > > firmware or bootloader. Why shall we store static "increment"
> > > part of
> > > MAC address? Can't the firmware give you proper MAC address?
> > >=20
> > > Best regards,
> > > Krzysztof
> > >=20
> >=20
> > Krzysztof, maybe that's a point to make commit message with better
> > explanation from my side. At current time there is at least two
> > cases
> > where I see it's possible to be used:
> >=20
> > 1. NC-SI
> > 2. embedded
> >=20
> > At NC-SI level there is Get Mac Address command which provides to
> > BMC
> > mac address from the host which is same as host mac address, it
> > happens
> > at runtime and overrides old one.
> >=20
> > Also, this part was also to be discussed 2 years ago in this
> > thread:
> > https://lore.kernel.org/all/OF8E108F72.39D22E89-ON00258765.001E46EB-002=
58765.00251157@ibm.com/
>=20
> Which was not sent to Rob though...
>=20
>=20
> >=20
> > Where Milton provided this information:
> >=20
> > DTMF spec DSP0222 NC-SI (network controller sideband interface)
> > is a method to provide a BMC (Baseboard management controller)
> > shared
> > access to an external ethernet port for comunication to the
> > management
> > network in the outside world.=C2=A0 The protocol describes ethernet
> > packets=20
> > that control selective bridging implemented in a host network
> > controller
> > to share its phy.=C2=A0 Various NIC OEMs have added a query to find out
> > the=20
> > address the host is using, and some vendors have added code to
> > query
> > host
> > nic and set the BMC mac to a fixed offset (current hard coded +1
> > from
> > the host value).=C2=A0 If this is compiled in the kernel, the NIC OEM i=
s
> > recognised and the BMC doesn't miss the NIC response the address is
> > set
> > once each time the NCSI stack reinitializes.=C2=A0 This mechanism
> > overrides
> > any mac-address or local-mac-address or other assignment.
> >=20
> > DSP0222
> > https://www.dmtf.org/documents/pmci/network-controller-sideband-interfa=
ce-nc-si-specification-110
> >=20
> >=20
> > In embedded case, sometimes you have different multiple ethernet
> > interfaces which using one mac address which increments or
> > decrements
> > for particular interface, just for better explanation, there is
> > patch
> > with explanation which providing them such way of work:
> > https://github.com/openwrt/openwrt/blob/master/target/linux/generic/pen=
ding-5.15/682-of_net-add-mac-address-increment-support.patch
> >=20
> > In their rep a lot of dts using such option.
>=20
> None of these explain why this is property of the hardware. I
> understand
> that this is something you want Linux to do, but DT is not for that
> purpose. Do not encode system policies into DT and what above commit
> says is a policy.
>=20

Krzysztof, okay then to which DT subsystem it should belong? To
ftgmac100 after conversion?

Thanks.
