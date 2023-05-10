Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC296FE524
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 22:32:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGmsk0d3gz3cjC
	for <lists+openbmc@lfdr.de>; Thu, 11 May 2023 06:32:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aZFBw60I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aZFBw60I;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGms45mPWz3bln
	for <openbmc@lists.ozlabs.org>; Thu, 11 May 2023 06:31:34 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4efe9a98736so8733974e87.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683750690; x=1686342690;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6cJ31Dz8u9AcUhlObGAjcSV4Wb31sZ6inct5YiBtNcQ=;
        b=aZFBw60Icmyf5PAu9Im1gIlr5mMXj6CB5LIt+sR2kvyrsWAWQOJbRwA1fEoaEiI6Wy
         XpCFTp4dIP+LixD5Kp+DOOibcLhU0IJ6KT1BXKpDB+3heCfeSA769iQ2l7uK0ftwl/WA
         rbhq6l8mWxnrm7q0VMr2KEbtVuueCDnMZKJ0o6vMfjhtjKF40JndQtip3Ut0vUa+Vy9D
         QDdNbD8Os/PIv8zKLbJk2qWuQ7oN7bPp1ReTjHpiDoJci4LHKQ+amTR8PYUqPCVN68Rj
         AonF7JvTzsxDJ8z1LqHC7+kI34+zZmL2S23ah7bqfYtOV8nRO9eJvx5ARCdhy8OXHkt3
         4siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683750690; x=1686342690;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cJ31Dz8u9AcUhlObGAjcSV4Wb31sZ6inct5YiBtNcQ=;
        b=NF9O3sW8ue88MDIiom0m5L80FnUmYl3VOQQ8IqfQ1oK9EXhNrtjKNs8eSCFLxviKtw
         8GloEUjF7q6yfe/70zIbJY/i7TVU+zy3g1bIRwy9LFesJWKyC/Axdcld+0Z6J1cLQeUP
         u04M0kV1T9k8x7QNo0nwD8W8Mm7TowkGRms8vs8vgZZ95ZE+aTJIGcva9gjvF5xkZvpI
         ErGSZAHTThj3epegeZ0cQwNOBhBtYxWQgMF9PKHWlHc8bll4ofGLTfOQ1xForsWZ7pPP
         1QvRaigD3Fbpeb/QxuT/uuo1v4x3L0gmcSMEDlLgUVA6yqzj7g28jTHOOpxVOV+nz9kT
         yDqA==
X-Gm-Message-State: AC+VfDyXu5nWfvvOSu9sTeLwzeEBdbN/I8HJLSqkq1FGeazLfqOY2AFr
	SJslbBIX/EyJQFY1ucNGdcA=
X-Google-Smtp-Source: ACHHUZ7BN0N/SM/uFgH1sFjlZDggAPwPRCR6aCGoJbsQ+Vg+fZHaeI92gRzcJPAw8LF0lgrHUuZraA==
X-Received: by 2002:ac2:488c:0:b0:4f1:4086:9384 with SMTP id x12-20020ac2488c000000b004f140869384mr1966232lfc.61.1683750690155;
        Wed, 10 May 2023 13:31:30 -0700 (PDT)
Received: from [100.119.7.139] (95-31-186-150.broadband.corbina.ru. [95.31.186.150])
        by smtp.gmail.com with ESMTPSA id s11-20020a19ad4b000000b004f00d7fcf0fsm849476lfd.26.2023.05.10.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 13:31:29 -0700 (PDT)
Message-ID: <fc3dae42f2dfdf046664d964bae560ff6bb32f69.camel@gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: net: add mac-address-increment
 option
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Samuel
 Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 10 May 2023 23:31:26 +0000
In-Reply-To: <6b5be71e-141e-c02a-8cba-a528264b26c2@linaro.org>
References: <20230509143504.30382-1-fr0st61te@gmail.com>
	 <20230509143504.30382-4-fr0st61te@gmail.com>
	 <6b5be71e-141e-c02a-8cba-a528264b26c2@linaro.org>
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

On Wed, 2023-05-10 at 16:48 +0200, Krzysztof Kozlowski wrote:
> On 09/05/2023 16:35, Ivan Mikhaylov wrote:
> > Add the mac-address-increment option for specify MAC address taken
> > by
> > any other sources.
> >=20
> > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> > Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> > ---
> > =C2=A0.../devicetree/bindings/net/ethernet-controller.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 8
> > ++++++++
> > =C2=A01 file changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-
> > controller.yaml b/Documentation/devicetree/bindings/net/ethernet-
> > controller.yaml
> > index 00be387984ac..6900098c5105 100644
> > --- a/Documentation/devicetree/bindings/net/ethernet-
> > controller.yaml
> > +++ b/Documentation/devicetree/bindings/net/ethernet-
> > controller.yaml
> > @@ -34,6 +34,14 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 6
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 6
> > =C2=A0
> > +=C2=A0 mac-address-increment:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/int32
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the MAC address increment to =
be added to the MAC
> > address.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Should be used in cases when there is a=
 need to use MAC
> > address
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 different from one obtained by any othe=
r level, like u-boot
> > or the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NC-SI stack.
>=20
> We don't store MAC addresses in DT, but provide simple placeholder
> for
> firmware or bootloader. Why shall we store static "increment" part of
> MAC address? Can't the firmware give you proper MAC address?
>=20
> Best regards,
> Krzysztof
>=20

Krzysztof, maybe that's a point to make commit message with better
explanation from my side. At current time there is at least two cases
where I see it's possible to be used:

1. NC-SI
2. embedded

At NC-SI level there is Get Mac Address command which provides to BMC
mac address from the host which is same as host mac address, it happens
at runtime and overrides old one.

Also, this part was also to be discussed 2 years ago in this thread:
https://lore.kernel.org/all/OF8E108F72.39D22E89-ON00258765.001E46EB-0025876=
5.00251157@ibm.com/

Where Milton provided this information:

DTMF spec DSP0222 NC-SI (network controller sideband interface)
is a method to provide a BMC (Baseboard management controller) shared
access to an external ethernet port for comunication to the management
network in the outside world.  The protocol describes ethernet packets=20
that control selective bridging implemented in a host network
controller
to share its phy.  Various NIC OEMs have added a query to find out the=20
address the host is using, and some vendors have added code to query
host
nic and set the BMC mac to a fixed offset (current hard coded +1 from
the host value).  If this is compiled in the kernel, the NIC OEM is=20
recognised and the BMC doesn't miss the NIC response the address is set
once each time the NCSI stack reinitializes.  This mechanism overrides
any mac-address or local-mac-address or other assignment.

DSP0222
https://www.dmtf.org/documents/pmci/network-controller-sideband-interface-n=
c-si-specification-110


In embedded case, sometimes you have different multiple ethernet
interfaces which using one mac address which increments or decrements
for particular interface, just for better explanation, there is patch
with explanation which providing them such way of work:
https://github.com/openwrt/openwrt/blob/master/target/linux/generic/pending=
-5.15/682-of_net-add-mac-address-increment-support.patch

In their rep a lot of dts using such option.

Thanks.
