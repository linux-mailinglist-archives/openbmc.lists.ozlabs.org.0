Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB2134950
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 18:27:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tGQJ5047zDqVk
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 04:27:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Y23DOwFc"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tGP94lhzzDq67
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 04:26:05 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id 18so3305133oin.9
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 09:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LxPiC2OUlI/+LGgIIS7wjgSOz75jLM03YAv5e/CjJl4=;
 b=Y23DOwFcQlU9KGnZdIXj0cHSzgEKtAqv6bmdZWYQQ1X6IsyZ2YC4PdEma4sYCykuuM
 UeCaB3Hhwh+LwUFarQNSaXmDVy573OlYBpaC9IWFxurvA54ZCq+CYRjL9oC+xVbJ9uuC
 4QohALL63vCX1vdOzCkExIq8GSJ9KAKSI2jSiPSq+sHml14eOA13ocubAk9n7k4F9Ia4
 xNTe5O6j6O7X9yFAp5tnoAFVZWGrcxGv/hiGd43SVDCBNpDAjIJkmEaoPXaAe/n7OfgD
 u+8KtZESSDNa7IMz6gMxJISI0qbMlzjsvUc7PJvkjIVgOJ+Z/8BHPSpUJRzBYi8iJChT
 BUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxPiC2OUlI/+LGgIIS7wjgSOz75jLM03YAv5e/CjJl4=;
 b=NAMlqLN790FHyEX2XrJ6pPiTix3CkvLp9PUe5isSd3lmYuhiJ7JttoKuaphfOBKgkU
 KsJJIhiyuG9MX6tNocDiwFhxAo0BWmxXgvu5uui0+jO521sZVQQem/I6pCybJTV8WSCl
 PklxJL4nB0mbx8JQ8f/dlsa9uC0KEbdA6D4FVxXf3ZLoiohwmb702EXDTVdkXxkymleM
 BT2lAXDhVGKG3oVgDtMLdV+OgaD4to6LqMLBaJ2CYtNG1DSVoAJpbZLHWghz64rRtTtn
 Hhyfg4EeF6HbU0KMa2W/i+5RM1drAFRmAo6rPIn4noi2c1ACShZMz5QXCgq/dvuGm8ry
 vtZw==
X-Gm-Message-State: APjAAAVZtGsM9DA8b2d+4wJmPMhKppeUyPvraeT3Df0bnLNFjS7SWLk2
 X+TFmyPFsbl1Ib3uNDpWcLNt3gLgY46KGl5GbRBcIw==
X-Google-Smtp-Source: APXvYqxRscuzypW8Uzm5xHvcJYOM5c7M1iuEFQy+lW7GALjHT2AYrP9NbeSiM3Ml9DSEEDtNdAD8tm84ikmXNiEok+w=
X-Received: by 2002:aca:f555:: with SMTP id t82mr4150914oih.103.1578504361344; 
 Wed, 08 Jan 2020 09:26:01 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
 <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
In-Reply-To: <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 8 Jan 2020 09:25:49 -0800
Message-ID: <CAA_a9xJQsSjrcjq+=+uoPe4KCkUjWTgEp_cG-0E2FczP=PtBUg@mail.gmail.com>
Subject: Re: Configuring device with I2C mux
To: Milton Miller II <miltonm@us.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000bc6336059ba42f95"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bc6336059ba42f95
Content-Type: text/plain; charset="UTF-8"

Hi Milton,

Yes, the child buses are traceable in the sysfs, but actually my question
is, does entity-manager supports tracing child buses through the sysfs? If
it does, how shall I write the JSON config to take advantage of this
feature?

For example, we have a I2C device sitting at the same level as the mux,
configured as {"Address": "0x40", "Bus": "$bus"}, and now I don't find the
way to add or subtract a certain number to $bus to find a child bus. Do we
have a feature with syntax like {"Address": "0x50", "Bus":
"$bus.mux.0x70.channel.1"} to configure devices on child buses, with mux
sitting on 0x70 of the parent bus?

Thank you!

- Alex Qiu


On Wed, Jan 8, 2020 at 6:43 AM Milton Miller II <miltonm@us.ibm.com> wrote:

> About 01/07/2020 07:14PM in some timezone, Alex Qiu wrote:
> >Hi folks,
> >
> >We have a JSON file configuring I2C devices of a PCIe card which has
> >an 8-channel I2C mux for entity-manager. After we properly configure
> >the mux of the card, we get 8 new I2C buses in sysfs; however, we
> >don't find an arithmetic way to describe the relationship between the
> >new buses and their parent buses.
> >
> >For example, we have a mux on physical BMC I2C bus i2c-8 spawning a
> >couple of child buses including i2c-24 and i2c-26, which are the
> >buses for each PCIe card. The mux on i2c-24 PCIe card spawned 8 buses
> >from i2c-70 to i2c-77, and the mux on i2c-26 PCIe card spawned ones
> >from i2c-62 to i2c-69. We have I2C devices on i2c-76 and i2c-68 needs
> >to be configured together with the PCIe card on i2c-24 and i2c-26
> >separately.
> >
> >How do we implement this in the JSON file? If that's not possible to
> >do it in JSON merely, what's the suggested approach to implement this
> >feature? Device tree? Implement code in entity-manager to walk
> >through the I2C sysfs?
>
>
> I would expect the i2c buses provied by the mux to appear in sysfs
> under the hierarchy of the parent bus.  Explore the sysfs directory
> structure, I'm making this up, but I've now peeked at i2c-mux.c and
> have a better chance getting reality.
>
>
> /sys/bus/i2c/devices/i2c-8 -> /sys/devices/platform/ahb-432000/i2c-8
>
> /sys/bus/i2c/devices/i2c-24 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24
> /sys/bus/i2c/devices/i2c-24 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-25
> /sys/bus/i2c/devices/i2c-24 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26
>
> /sys/bus/i2c/devices/i2c-62 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-62
> /sys/bus/i2c/devices/i2c-63 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-63
> /sys/bus/i2c/devices/i2c-64 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-64
> /sys/bus/i2c/devices/i2c-65 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-65
> /sys/bus/i2c/devices/i2c-66 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-66
> /sys/bus/i2c/devices/i2c-67 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-67
> /sys/bus/i2c/devices/i2c-68 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-68
> /sys/bus/i2c/devices/i2c-69 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-69
> /sys/bus/i2c/devices/i2c-70 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-70
> /sys/bus/i2c/devices/i2c-71 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-71
> /sys/bus/i2c/devices/i2c-72 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-72
> /sys/bus/i2c/devices/i2c-73 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-73
> /sys/bus/i2c/devices/i2c-74 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-74
> /sys/bus/i2c/devices/i2c-75 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-75
> /sys/bus/i2c/devices/i2c-76 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-76
> /sys/bus/i2c/devices/i2c-77 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-77
>
> /sys/bus/i2c/devices/i2c-24/mux_device ->
> /sys/devices/platform/ahb-432000/i2c-8/8-52
> /sys/bus/i2c/devices/i2c-25/mux_device ->
> /sys/devices/platform/ahb-432000/i2c-8/8-52
> /sys/bus/i2c/devices/i2c-26/mux_device ->
> /sys/devices/platform/ahb-432000/i2c-8/8-52
>
> /sys/bus/i2c/devices/8-52/channel-0 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24
> /sys/bus/i2c/devices/8-52/channel-1 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-25
> /sys/bus/i2c/devices/8-52/channel-2 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26
>
> /sys/bus/i2c/devices/24-52/channel-0 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-62
> /sys/bus/i2c/devices/24-52/channel-1 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-63
> /sys/bus/i2c/devices/24-52/channel-2 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-64
> /sys/bus/i2c/devices/24-52/channel-3 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-65
> /sys/bus/i2c/devices/24-52/channel-4 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-66
> /sys/bus/i2c/devices/24-52/channel-5 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-67
> /sys/bus/i2c/devices/24-52/channel-6 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-68
> /sys/bus/i2c/devices/24-52/channel-7 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-69
> /sys/bus/i2c/devices/26-52/channel-0 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-70
> /sys/bus/i2c/devices/26-52/channel-1 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-71
> /sys/bus/i2c/devices/26-52/channel-2 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-72
> /sys/bus/i2c/devices/26-52/channel-3 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-73
> /sys/bus/i2c/devices/26-52/channel-4 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-74
> /sys/bus/i2c/devices/26-52/channel-5 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-75
> /sys/bus/i2c/devices/26-52/channel-6 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-76
> /sys/bus/i2c/devices/26-52/channel-7 ->
> /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-77
>
> The child bus will have a symlink "mux_device" pointing to the mux.
> The mux device node will have n symlinks "channel-1" where 1 is
> the channel id.
>
> Hmm, there is no apparent code to put a "mux_channel" attribute in
> the adapter node.  The adapter name attribute does include the channel
> id, but its long descriptive text.  Regardless, you should be able to
> find the buses from the mux channel-3 symlinks.
>
> Note: I haven't looked at the JSON to see how much it will change once
> your find the bus.  I'm guessing you will have to generate it by taking
> a template and substituting the bus numbers you find to make the slots
> common, alhtough you could just go from the 8-52/channel-3 symlink to
> the adapter bus (the device name will still have the bus number in it).
>
> I hope this helps you,
>
> milton
>
>

--000000000000bc6336059ba42f95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Milton,<div><br></div><div>Yes, the child buses are tra=
ceable=C2=A0in the sysfs, but actually my question is, does entity-manager =
supports tracing child buses through the sysfs? If it does, how shall I wri=
te the JSON config to take advantage of this feature?</div><div><br></div><=
div>For example, we have a I2C device sitting at the same level as the mux,=
 configured as {&quot;Address&quot;: &quot;0x40&quot;, &quot;Bus&quot;: &qu=
ot;$bus&quot;}, and now I don&#39;t find the way to add or subtract=C2=A0a =
certain number to $bus to find a child bus. Do we have a feature with synta=
x like=C2=A0{&quot;Address&quot;: &quot;0x50&quot;, &quot;Bus&quot;: &quot;=
$bus.mux.0x70.channel.1&quot;} to configure devices on child buses, with mu=
x sitting on 0x70 of the parent bus?</div><div><br></div><div>Thank you!</d=
iv><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></=
div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 8, 2020 at 6:43 AM Milton Miller II &lt;<a href=
=3D"mailto:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">About 01/07/2020 07:14PM i=
n some timezone, Alex Qiu wrote:<br>
&gt;Hi folks,<br>
&gt;<br>
&gt;We have a JSON file configuring I2C devices of a PCIe card which has<br=
>
&gt;an 8-channel I2C mux for entity-manager. After we properly configure<br=
>
&gt;the mux of the card, we get 8 new I2C buses in sysfs; however, we<br>
&gt;don&#39;t find an arithmetic way to describe the relationship between t=
he<br>
&gt;new buses and their parent buses.<br>
&gt;<br>
&gt;For example, we have a mux on physical BMC I2C bus i2c-8 spawning a<br>
&gt;couple of child buses including i2c-24 and i2c-26, which are the<br>
&gt;buses for each PCIe card. The mux on i2c-24 PCIe card spawned 8 buses<b=
r>
&gt;from i2c-70 to i2c-77, and the mux on i2c-26 PCIe card spawned ones<br>
&gt;from i2c-62 to i2c-69. We have I2C devices on i2c-76 and i2c-68 needs<b=
r>
&gt;to be configured together with the PCIe card on i2c-24 and i2c-26<br>
&gt;separately.<br>
&gt;<br>
&gt;How do we implement this in the JSON file? If that&#39;s not possible t=
o<br>
&gt;do it in JSON merely, what&#39;s the suggested approach to implement th=
is<br>
&gt;feature? Device tree? Implement code in entity-manager to walk<br>
&gt;through the I2C sysfs?<br>
<br>
<br>
I would expect the i2c buses provied by the mux to appear in sysfs<br>
under the hierarchy of the parent bus.=C2=A0 Explore the sysfs directory<br=
>
structure, I&#39;m making this up, but I&#39;ve now peeked at i2c-mux.c and=
<br>
have a better chance getting reality.<br>
<br>
<br>
/sys/bus/i2c/devices/i2c-8 -&gt; /sys/devices/platform/ahb-432000/i2c-8<br>
<br>
/sys/bus/i2c/devices/i2c-24 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24<br>
/sys/bus/i2c/devices/i2c-24 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-25<br>
/sys/bus/i2c/devices/i2c-24 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26<br>
<br>
/sys/bus/i2c/devices/i2c-62 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-62<br>
/sys/bus/i2c/devices/i2c-63 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-63<br>
/sys/bus/i2c/devices/i2c-64 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-64<br>
/sys/bus/i2c/devices/i2c-65 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-65<br>
/sys/bus/i2c/devices/i2c-66 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-66<br>
/sys/bus/i2c/devices/i2c-67 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-67<br>
/sys/bus/i2c/devices/i2c-68 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-68<br>
/sys/bus/i2c/devices/i2c-69 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-26/i2c-69<br>
/sys/bus/i2c/devices/i2c-70 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-70<br>
/sys/bus/i2c/devices/i2c-71 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-71<br>
/sys/bus/i2c/devices/i2c-72 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-72<br>
/sys/bus/i2c/devices/i2c-73 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-73<br>
/sys/bus/i2c/devices/i2c-74 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-74<br>
/sys/bus/i2c/devices/i2c-75 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-75<br>
/sys/bus/i2c/devices/i2c-76 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-76<br>
/sys/bus/i2c/devices/i2c-77 -&gt; /sys/devices/platform/ahb-432000/i2c-8/i2=
c-24/i2c-77<br>
<br>
/sys/bus/i2c/devices/i2c-24/mux_device -&gt; /sys/devices/platform/ahb-4320=
00/i2c-8/8-52<br>
/sys/bus/i2c/devices/i2c-25/mux_device -&gt; /sys/devices/platform/ahb-4320=
00/i2c-8/8-52<br>
/sys/bus/i2c/devices/i2c-26/mux_device -&gt; /sys/devices/platform/ahb-4320=
00/i2c-8/8-52<br>
<br>
/sys/bus/i2c/devices/8-52/channel-0 -&gt; /sys/devices/platform/ahb-432000/=
i2c-8/i2c-24<br>
/sys/bus/i2c/devices/8-52/channel-1 -&gt; /sys/devices/platform/ahb-432000/=
i2c-8/i2c-25<br>
/sys/bus/i2c/devices/8-52/channel-2 -&gt; /sys/devices/platform/ahb-432000/=
i2c-8/i2c-26<br>
<br>
/sys/bus/i2c/devices/24-52/channel-0 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-62<br>
/sys/bus/i2c/devices/24-52/channel-1 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-63<br>
/sys/bus/i2c/devices/24-52/channel-2 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-64<br>
/sys/bus/i2c/devices/24-52/channel-3 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-65<br>
/sys/bus/i2c/devices/24-52/channel-4 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-66<br>
/sys/bus/i2c/devices/24-52/channel-5 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-67<br>
/sys/bus/i2c/devices/24-52/channel-6 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-68<br>
/sys/bus/i2c/devices/24-52/channel-7 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-24/i2c-69<br>
/sys/bus/i2c/devices/26-52/channel-0 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-70<br>
/sys/bus/i2c/devices/26-52/channel-1 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-71<br>
/sys/bus/i2c/devices/26-52/channel-2 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-72<br>
/sys/bus/i2c/devices/26-52/channel-3 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-73<br>
/sys/bus/i2c/devices/26-52/channel-4 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-74<br>
/sys/bus/i2c/devices/26-52/channel-5 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-75<br>
/sys/bus/i2c/devices/26-52/channel-6 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-76<br>
/sys/bus/i2c/devices/26-52/channel-7 -&gt; /sys/devices/platform/ahb-432000=
/i2c-8/i2c-26/i2c-77<br>
<br>
The child bus will have a symlink &quot;mux_device&quot; pointing to the mu=
x.<br>
The mux device node will have n symlinks &quot;channel-1&quot; where 1 is <=
br>
the channel id.<br>
<br>
Hmm, there is no apparent code to put a &quot;mux_channel&quot; attribute i=
n <br>
the adapter node.=C2=A0 The adapter name attribute does include the channel=
 <br>
id, but its long descriptive text.=C2=A0 Regardless, you should be able to =
<br>
find the buses from the mux channel-3 symlinks.<br>
<br>
Note: I haven&#39;t looked at the JSON to see how much it will change once =
<br>
your find the bus.=C2=A0 I&#39;m guessing you will have to generate it by t=
aking <br>
a template and substituting the bus numbers you find to make the slots<br>
common, alhtough you could just go from the 8-52/channel-3 symlink to<br>
the adapter bus (the device name will still have the bus number in it).<br>
<br>
I hope this helps you,<br>
<br>
milton<br>
<br>
</blockquote></div>

--000000000000bc6336059ba42f95--
