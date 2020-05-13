Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B99791D04BE
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 04:19:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MJK35dD0zDqk9
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 12:19:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EH1W1DD3; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MJJN0qPXzDqWy
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 12:18:51 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id l1so9474158qtp.6
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 19:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hr3QuOzAtM9+zDd+q+TY5gb0m5GndcToyiKns04AbtY=;
 b=EH1W1DD3N11+A7f8xqh2/zGsu40VDUWpqfpar3/nLjtEAtBkaxfqOM8lnOQsyx3MEU
 yhH4xkFspIBJYZSLUT4PK8R5gjlmVntTAcaT7d0UTfX61Fqqd+Q3km+XOsGqZNBoD2KE
 1OnY8WXA/aRL9MMrIbvmLR3P6Q89R4YFxSXhxN1Bsv6WDVT8V8NPekJhu8dZ7DdKN7NN
 2h/P/atP61V0g41suQK4jipi8DXAICZBxJ7OcbTM8nt4gi0XIpwmukM6CjzUpa3E/2k8
 ZtJA01dSFix1mXLOi334yZ53qunw42sz6etXGYqjrB5sCq+8Qhk6fkMkxIeWvMehmayN
 a0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hr3QuOzAtM9+zDd+q+TY5gb0m5GndcToyiKns04AbtY=;
 b=tDVxFqiIjyrBpoS7+Kc+ZKszCzKqZTWSlRnSf1qRCnqi5oqHJtK3Oi2XkYzjzG54Nq
 pVoYjE8LeXmURyhjoz4/5YYGMeKimGQl8Zf33Q1cXzRDX+qz5FM1YMu4y9T4sOqbzDCi
 zzDhVDYSCCAbLWHateZduUQLu5xUuXEJ5t8JhlGByAig63LFrcdHv4os7utENF1DIXwf
 T9MSzD3UMp6fHFI/LwxIOA0aBbTq2dISM7ybSM9XH+0SnxJ0qhswBfsJFWgOEdT4Lj4L
 dFkU+TGDb5wQu1VA8k3f4jRN/dGod8t4qtCxv0/u2wPbTnVVmUXwinCX0gAQKIhr0xdr
 MeFQ==
X-Gm-Message-State: AGi0PuZAhEMUozsqjJegWSvT55aQRxzQUtua4v/b6pAlsyfqwuEOjXUi
 GYINDWWefFDiYy0Pn0mIfPHkJfioL6kkFqXMUkqwBQ==
X-Google-Smtp-Source: APiQypJ+bZBTOmjZ/2vxMo8vKS0KNSlS2gQ1lbc1uWPmXJmgfP6mPutwKpvPw5+tuYmqJNaXuIUEbAApWgOdAzFqqIE=
X-Received: by 2002:aed:3f8c:: with SMTP id s12mr25993941qth.248.1589336327460; 
 Tue, 12 May 2020 19:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <d5f9ec4e5c554c2b9588cb7ba2bec581@SCL-EXCHMB-13.phoenix.com>
 <CADKL2t7QZMt21je4RmRDXQtvgmvMP4_oJZDyCoSorjWi-n5AOg@mail.gmail.com>
In-Reply-To: <CADKL2t7QZMt21je4RmRDXQtvgmvMP4_oJZDyCoSorjWi-n5AOg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 12 May 2020 19:18:35 -0700
Message-ID: <CAO=notxrM2HLdE5zW99P-rkL2nr6VjG-4SfLpzKdYiMovpQMig@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash interfaces
To: Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>,
 "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 12, 2020 at 5:51 PM Benjamin Fair <benjaminfair@google.com> wro=
te:
>
> On Tue, 12 May 2020 at 17:18, Patrick Voelker
> <Patrick_Voelker@phoenix.com> wrote:
> >
> > I got a "ipmibt" interface transfer complete and want to move on to one=
 of the faster interfaces to speed up debug since it takes so long to trans=
fer the FW image.
> >
> >
> >
> > For the "ipmilpc" and "ipmipci" interfaces, do those options require AS=
PEED_LPC_CTRL and ASPEED_P2A_CTRL respectively in the BMC's kernel config? =
 Those two configs happen to be disabled in the BMC I'm building and I've b=
een searching for examples on how to configure the memory regions correctly=
 both on the BMC and the host side and am not entirely sure what I'm lookin=
g for.
> >
> >
>
> Yes, you'll need the LPC or P2A drivers on the BMC to make these
> bridges work. You'll also need some extra configuration in the BIOS
> that reserves a memory region in order to use the LPC bridge.
>
> I believe Quanta's Q71L machine uses P2A/ipmipci for updates, so take
> a look at the device tree for an example
> (arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts). I've CC'd Patrick
> Venture, since he worked on this machine and phosphor-ipmi-flash.
> Hopefully he can fill in details if I'm missing them.

You've hit all the details for how to configure the system to use it.
You'll need to provide a configuration on the BMC-side of things on
how to handle the image update as well - for examples and an
explanation: https://github.com/openbmc/phosphor-ipmi-flash/blob/master/bmc=
_json_config.md
