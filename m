Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C9109B30
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 10:23:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mdk85JTbzDqXv
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 20:23:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ovYMWZh7"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MdjQ0HDdzDq6l
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 20:22:46 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id d6so13487957lfc.0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 01:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nP42ri7Gfuyq7+jTSAaeHSR6UUUTuVIMdi0iTbY+h84=;
 b=ovYMWZh7rJIAiQIsOphqx1xCiq5HXT19ucp08A6Hyajw4ROMLr8llSUbHC6t4TQbbK
 ACgpjDob4IqxBrXWeNyQ5DWuHtKzhfrodRgDe4HZf/I2BlO9dhb3KFOYPGGzQqpr4Tzr
 Kl7nncerWp7c7U/GWoDkqcdJA+K99QdIKjNxi/eA7+Yv9A/t6aCYgQZ1FltbxaTzzoTE
 4AsFg2bM2KX0RP0FCJD/O/IG2nDPuPaGlcdLAqqPOOCj4YZLwBtna/a3teKAk5JeJkwa
 k4Y0SxxyKhf06vtLD9Dqg7qh8UPyothUXTyyVUQ2V+T4JeSm4OLreRurbik48BVaGIKV
 G4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nP42ri7Gfuyq7+jTSAaeHSR6UUUTuVIMdi0iTbY+h84=;
 b=Q4H21VBlmoJxzTZBDxZp8wNVBgikp3shNzhBPOAuM075Ex7BfjqAA9vg9ogERdcWSD
 h1RurQSnaDCAJrT7GyrYOG0oJpyHqkUj0smIFn1Al5HLOggq5OiZjeetVEX6n5bzMdAi
 xeh45fnOxDxgjWynZiLOmCjwtkw02NJei3Fx8lUXsCh7aJI/OdOQ3sxQNg7zoBD3YvsK
 bDmghYpP4udSyGsPnFyakZFav6MPmKwmLvqsBK38UXjC0Wsc4HmvKSesMiK5ZvU2tJ7T
 gTRE5cx8MyiWW+4RungeReTuZqjOpzgfwdkcmugMdWeg2d7+aEXd/evSrJkP+otcpfi/
 hlEw==
X-Gm-Message-State: APjAAAWA7aTnzkVTMGP0CYopetLIJ+1aW7S++kDVvOQbrxYiJwopqris
 IRNsv8daCD5PHxuc+T5EXMFAWlA3qsj2pnyNu9c=
X-Google-Smtp-Source: APXvYqxwEoS4JdUZHseRdgXnA2T0ZSH6rIjpNKMLHoZ81qrtdpjff/6z2EOp2yzjzjEVqX1615n2wklv8ouZ3FFfeSM=
X-Received: by 2002:ac2:5283:: with SMTP id q3mr23177580lfm.21.1574760162745; 
 Tue, 26 Nov 2019 01:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20191121095350.158689-1-tali.perry1@gmail.com>
 <20191121095350.158689-3-tali.perry1@gmail.com> <20191125151618.GE2412@kunai>
 <CAHb3i=tGTcu2q15E5CL_od1rDgRDyx=ygoGSCu88AfBrnFn71w@mail.gmail.com>
In-Reply-To: <CAHb3i=tGTcu2q15E5CL_od1rDgRDyx=ygoGSCu88AfBrnFn71w@mail.gmail.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 26 Nov 2019 11:27:54 +0200
Message-ID: <CAHb3i=s+u1gHXwi7j7V_N-c8f8n7c1XB3QhkY8EAJuv6PA5GNw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] i2c: npcm: Add Nuvoton NPCM I2C controller driver
To: Wolfram Sang <wsa@the-dreams.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 syniurge@gmail.com, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

Thanks for your comments.

The NPCM7XX BMC I2C\SMB controller HW module supports both SMB and I2C.
It's main features are:
1. Supports Fast-Mode (400 KHz clock) I2C and Fast-Mode-plus (1 MHz clock) =
I2C
2. Supports the =E2=80=98fairness=E2=80=99 arbitration protocol defined by =
the MCTP
SMBus/I2C Transport Binding Specification v1.0.0
3. 32KB packets : this is an I2C spec limitation. The HW has no limit
on packets size. It has a 16 bytes FIFO which can be reloaded over and
over.
4. w\o size byte (for SMB block protocol).
5. Both master and slave. It can also replace modes in run time
(requirement for IPMB and MCTP).
6. Bus timing is selected to support both specs.

Originally the HW spec stated SMB everywhere .

Should I rename the SMB to I2C all over the driver?

Thanks,
Tali Perry


On Tue, Nov 26, 2019 at 8:47 AM Tali Perry <tali.perry1@gmail.com> wrote:
>
> Hi Wolfram,
>
> Thanks for your comments.
>
> The NPCM7XX BMC I2C\SMB controller HW module supports both SMB and I2C.
> It's main features are:
> 1. Supports Fast-Mode (400 KHz clock) I2C and Fast-Mode-plus (1 MHz clock=
) I2C
> 2. Supports the =E2=80=98fairness=E2=80=99 arbitration protocol defined b=
y the MCTP SMBus/I2C Transport Binding Specification v1.0.0
> 3. 32KB packets : this is an I2C spec limitation. The HW has no limit on =
packets size. It has a 16 bytes FIFO which can be reloaded over and over.
> 4. w\o size byte (for SMB block protocol).
> 5. Both master and slave. It can also replace modes in run time (requirem=
ent for IPMB and MCTP).
> 6. Bus timing is selected to support both specs.
>
> Originally the HW spec stated SMB everywhere .
>
> Should I rename the SMB to I2C all over the driver?
>
> Thanks,
> Tali Perry
>
>
> On Mon, Nov 25, 2019 at 5:16 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>>
>> On Thu, Nov 21, 2019 at 11:53:50AM +0200, Tali Perry wrote:
>> > Add Nuvoton NPCM BMC i2c controller driver.
>> >
>> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>
>> Looking at all this SMB_* naming of the registers and also the quirks,
>> this looks more like an SMBUS controller to me?
>>
>> > +     // currently I2C slave IF only supports single byte operations.
>> > +     // in order to utilyze the npcm HW FIFO, the driver will ask for=
 16bytes
>> > +     // at a time, pack them in buffer, and then transmit them all to=
gether
>> > +     // to the FIFO and onward to the bus .
>> > +     // NACK on read will be once reached to bus->adap->quirks->max_r=
ead_len
>> > +     // sending a NACK whever the backend requests for it is not supp=
orted.
>>
>> This for example...
>>
>> > +static const struct i2c_adapter_quirks npcm_i2c_quirks =3D {
>> > +     .max_read_len =3D 32768,
>> > +     .max_write_len =3D 32768,
>> > +     .max_num_msgs =3D 2,
>> > +     .flags =3D I2C_AQ_COMB_WRITE_THEN_READ
>> > +};
>>
>> ... and this. Like SMBus with the only exception of being able to send
>> 32K in a row. Or?
>>
