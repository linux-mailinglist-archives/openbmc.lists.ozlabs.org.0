Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49055704824
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 10:48:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL8yT1cw7z3f5F
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 18:48:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=c/mlcl+s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=c/mlcl+s;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL8xs6TNmz3bm9
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 18:47:29 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4eff4ea8e39so15889164e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684226840; x=1686818840;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pIs7xrpXMUe39rrvrGOq+duHo9PtLlvjA/J+15gmNUM=;
        b=c/mlcl+sDW2dCiuSBhRV0vh1HdyD/q5u+7JcwUfC0prnFCZGvu5XVOY2kFCgPiE1TP
         n3l9jjx/CLiwAWkj4jW7uFKBurZ2Gu01FfclJZiRMjmkwqtEvpUDjtyfWC2dvFznQRJK
         fciX6lJxS8kmKV/vCgNSWsUNVnpytxqGFFVQADkFmcROFhYI2gnlNeMtsBtTEiickae2
         4867l05/oQWrOEFFMXFRgDwfuRDwxKavpYtVtsaOAOlkxO3LYmYuHu/TywKnGSOvosJq
         Rj03H2JL8srZbQPLf5V2LAoUPRMPjcVf+uogFqQkVZOO2XOz6tzazhKNMlg0MsvSa3d6
         /XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684226840; x=1686818840;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pIs7xrpXMUe39rrvrGOq+duHo9PtLlvjA/J+15gmNUM=;
        b=c6PZw9laTcu4C98EF8YSAkkW0Q7w9cCS1c5MLczeQ7y4b0qUptU03WE/9pwYkK0w/M
         pA0JojJUR51pX3BqNPYqGXnsHZkBWF+rrkJ1j/QO6yS8NyDFrp3o0YLgw+F8pHGyoUbM
         ICyJbkK7jR6KNCO9OzJYDL/rJ54O9ExdlEFv4u/GOqDy6dqEe68xrs1kl/fedQdyfO3p
         C7vUtT45Fzyc2tr0SZ1hBT1IESwQCOLB5/Rb5qVtEFZENNYxuD9lwUkEWj0w4IZhV4V7
         q9MrHw6BnSIVWPJGQPsG8rSDDBnPi/hNlFHQ3P/jKSGyKKNrYmgspay3NoTCkqlFuiGK
         KRhw==
X-Gm-Message-State: AC+VfDyi1AD6N6t1mPlDzfQCVBacuAWFTtDGzUGyxih5SBdbmj6jD013
	vDrP0pc57bppusUvF+f3dpA=
X-Google-Smtp-Source: ACHHUZ6eGlsrqTErXAX7ikC8ZXUz16DB7kO0+AP6R4MKOd88jLadIORj03U/3MHBGIl2VpjKYVG4yQ==
X-Received: by 2002:ac2:5a03:0:b0:4ed:c7cc:6f12 with SMTP id q3-20020ac25a03000000b004edc7cc6f12mr6675761lfn.34.1684226840062;
        Tue, 16 May 2023 01:47:20 -0700 (PDT)
Received: from [100.119.125.242] (93-80-67-66.broadband.corbina.ru. [93.80.67.66])
        by smtp.gmail.com with ESMTPSA id o8-20020ac24348000000b004d5a6dcb94fsm2900210lfl.33.2023.05.16.01.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 01:47:19 -0700 (PDT)
Message-ID: <e6247cb39cc16a9328d9432e0595745b67c0aed5.camel@gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: net: add mac-address-increment
 option
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Samuel
 Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 16 May 2023 11:47:17 +0000
In-Reply-To: <5b826dc7-2d02-d4ed-3b6a-63737abe732b@linaro.org>
References: <20230509143504.30382-1-fr0st61te@gmail.com>
	 <20230509143504.30382-4-fr0st61te@gmail.com>
	 <6b5be71e-141e-c02a-8cba-a528264b26c2@linaro.org>
	 <fc3dae42f2dfdf046664d964bae560ff6bb32f69.camel@gmail.com>
	 <8de01e81-43dc-71af-f56f-4fba957b0b0b@linaro.org>
	 <be85bef7e144ebe08f422bf53bb81b59a130cb29.camel@gmail.com>
	 <5b826dc7-2d02-d4ed-3b6a-63737abe732b@linaro.org>
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

On Fri, 2023-05-12 at 11:24 +0200, Krzysztof Kozlowski wrote:
> On 12/05/2023 13:28, Ivan Mikhaylov wrote:
> > On Fri, 2023-05-12 at 08:22 +0200, Krzysztof Kozlowski wrote:
> > > On 11/05/2023 01:31, Ivan Mikhaylov wrote:
> > > > On Wed, 2023-05-10 at 16:48 +0200, Krzysztof Kozlowski wrote:
> > > > > On 09/05/2023 16:35, Ivan Mikhaylov wrote:
> > > > > > Add the mac-address-increment option for specify MAC
> > > > > > address
> > > > > > taken
> > > > > > by
> > > > > > any other sources.
> > > > > >=20
> > > > > > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> > > > > > Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> > > > > > ---
> > > > > > =C2=A0.../devicetree/bindings/net/ethernet-controller.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > | 8
> > > > > > ++++++++
> > > > > > =C2=A01 file changed, 8 insertions(+)
> > > > > >=20
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/net/ethernet-
> > > > > > controller.yaml
> > > > > > b/Documentation/devicetree/bindings/net/ethernet-
> > > > > > controller.yaml
> > > > > > index 00be387984ac..6900098c5105 100644
> > > > > > --- a/Documentation/devicetree/bindings/net/ethernet-
> > > > > > controller.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/net/ethernet-
> > > > > > controller.yaml
> > > > > > @@ -34,6 +34,14 @@ properties:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 6
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 6
> > > > > > =C2=A0
> > > > > > +=C2=A0 mac-address-increment:
> > > > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/int3=
2
> > > > > > +=C2=A0=C2=A0=C2=A0 description:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the MAC address incre=
ment to be added to
> > > > > > the
> > > > > > MAC
> > > > > > address.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Should be used in cases when th=
ere is a need to use
> > > > > > MAC
> > > > > > address
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 different from one obtained by =
any other level, like
> > > > > > u-
> > > > > > boot
> > > > > > or the
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NC-SI stack.
> > > > >=20
> > > > > We don't store MAC addresses in DT, but provide simple
> > > > > placeholder
> > > > > for
> > > > > firmware or bootloader. Why shall we store static "increment"
> > > > > part of
> > > > > MAC address? Can't the firmware give you proper MAC address?
> > > > >=20
> > > > > Best regards,
> > > > > Krzysztof
> > > > >=20
> > > >=20
> > > > Krzysztof, maybe that's a point to make commit message with
> > > > better
> > > > explanation from my side. At current time there is at least two
> > > > cases
> > > > where I see it's possible to be used:
> > > >=20
> > > > 1. NC-SI
> > > > 2. embedded
> > > >=20
> > > > At NC-SI level there is Get Mac Address command which provides
> > > > to
> > > > BMC
> > > > mac address from the host which is same as host mac address, it
> > > > happens
> > > > at runtime and overrides old one.
> > > >=20
> > > > Also, this part was also to be discussed 2 years ago in this
> > > > thread:
> > > > https://lore.kernel.org/all/OF8E108F72.39D22E89-ON00258765.001E46EB=
-00258765.00251157@ibm.com/
> > >=20
> > > Which was not sent to Rob though...
> > >=20
> > >=20
> > > >=20
> > > > Where Milton provided this information:
> > > >=20
> > > > DTMF spec DSP0222 NC-SI (network controller sideband interface)
> > > > is a method to provide a BMC (Baseboard management controller)
> > > > shared
> > > > access to an external ethernet port for comunication to the
> > > > management
> > > > network in the outside world.=C2=A0 The protocol describes ethernet
> > > > packets=20
> > > > that control selective bridging implemented in a host network
> > > > controller
> > > > to share its phy.=C2=A0 Various NIC OEMs have added a query to find
> > > > out
> > > > the=20
> > > > address the host is using, and some vendors have added code to
> > > > query
> > > > host
> > > > nic and set the BMC mac to a fixed offset (current hard coded
> > > > +1
> > > > from
> > > > the host value).=C2=A0 If this is compiled in the kernel, the NIC
> > > > OEM is
> > > > recognised and the BMC doesn't miss the NIC response the
> > > > address is
> > > > set
> > > > once each time the NCSI stack reinitializes.=C2=A0 This mechanism
> > > > overrides
> > > > any mac-address or local-mac-address or other assignment.
> > > >=20
> > > > DSP0222
> > > > https://www.dmtf.org/documents/pmci/network-controller-sideband-int=
erface-nc-si-specification-110
> > > >=20
> > > >=20
> > > > In embedded case, sometimes you have different multiple
> > > > ethernet
> > > > interfaces which using one mac address which increments or
> > > > decrements
> > > > for particular interface, just for better explanation, there is
> > > > patch
> > > > with explanation which providing them such way of work:
> > > > https://github.com/openwrt/openwrt/blob/master/target/linux/generic=
/pending-5.15/682-of_net-add-mac-address-increment-support.patch
> > > >=20
> > > > In their rep a lot of dts using such option.
> > >=20
> > > None of these explain why this is property of the hardware. I
> > > understand
> > > that this is something you want Linux to do, but DT is not for
> > > that
> > > purpose. Do not encode system policies into DT and what above
> > > commit
> > > says is a policy.
> > >=20
> >=20
> > Krzysztof, okay then to which DT subsystem it should belong? To
> > ftgmac100 after conversion?
>=20
> To my understanding, decision to add some numbers to MAC address does
> not look like DT property at all. Otherwise please help me to
> understand
> - why different boards with same device should have different
> offset/value?
>=20
> Anyway, commit msg also lacks any justification for this.
>=20
> Best regards,
> Krzysztof
>=20

Krzysztof, essentially some PCIe network cards have like an additional
*MII interface which connects directly to a BMC (separate SoC for
managing a motherboard) and by sending special ethernet type frames
over that connection (called NC-SI) the BMC can obtain MAC, get link
parameters etc. So it's natural for a vendor to allocate two MACs per
such a board with PCIe card intergrated, with one MAC "flashed into"
the network card, under the assumption that the BMC should
automatically use the next MAC. So it's the property of the hardware as
the vendor designs it, not a matter of usage policy.

Also at the nvmem binding tree is "nvmem-cell-cells" which is literally
the same as what was proposed but on different level.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/D=
ocumentation/devicetree/bindings/nvmem?id=3D7e2805c203a6c8dc85c1cfda205161e=
d39ae82d5


Thanks.
