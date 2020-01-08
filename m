Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F41349DA
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 18:55:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tH2s6X8xzDqPS
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 04:55:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oiMv2wKf"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tH251rJqzDqJH
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 04:54:35 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id k4so3439244oik.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 09:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zJ0/7wZeWplGEw0EjNRFstnKQzQVHfQ9fvkkQuzpksI=;
 b=oiMv2wKfbHgKjNXVnxWLaQXMLwJcBFnYH3WvttuCrgoGlQqwUM2mNOVroU8k9siP48
 Q8emM0hCBi1+FC7DIZ/ZLKrPCgz47A89xnRqf84+RSHla1d1OWpYnNnPe/7MZ1vWzM3p
 W5BIpRIFR3jod69Z+2Cw/VuKhx4+Yt+uB3sH0TgtDLKsNe8mkNi17hE0td1AXea4RdPy
 opJAItNcvWTCzNOgE9ZfKyw7MdYNssj/ReBJ1cxvvLsquc02SnTjyZfOHhh9pamg9Wyg
 ydb10Ef+iJWVt0KpAxuTNDjSjZyM45V46ORZqb9vEm1ni/OLcuNv7ui96Eqxc1dYvh0S
 Hsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zJ0/7wZeWplGEw0EjNRFstnKQzQVHfQ9fvkkQuzpksI=;
 b=fhZuTfPqPBNSYp+uR62tdMdaSRjf3qH+yj6pXHfh0tN7aDEOc+b9bmugLPfq3Cnpwn
 Tfc6dqKmohMub6tJeFq3t1/s647O2qJ6F9RreZtBCWSujCTaAClI7hO/HqXLIisJ8MLP
 uYdlBFQdGtH2tOeUkr5VRp4+sZL3a2McUxdkLTwPSGzHORBivjLxBo4FtZL3ogsyR3NW
 Our4OE/80yT5ZoY8eaEwIl2iY8geT5beZVvjD2L+js2p61P/ka44xNyPRHnF8qtBuTho
 27GFf0A8KBB1UfaRT0oqnCpA+GDfrabJzwYXvNvYmwhqczspiki3lyHl70fv02pJ8Acn
 GssA==
X-Gm-Message-State: APjAAAX/kP+uXxFTqVQc1vD9wLykt+uUWLfDHeK7wIq9eGgdvJMnKOpY
 NXTWWu3nCrV1xxLyZuRXbNeYepjGTVTJsBHo3ne1vA==
X-Google-Smtp-Source: APXvYqwNSRAKW60Y6COdFuXPw8W4WQDX7T1JY5K7DPBbr9JvgS8ZPo+Wwb/DbT0WCnxVbeIrk6+3lLNeOV/oQ73C5qs=
X-Received: by 2002:aca:34c1:: with SMTP id b184mr4140643oia.62.1578506071940; 
 Wed, 08 Jan 2020 09:54:31 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
 <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
 <CAA_a9xJQsSjrcjq+=+uoPe4KCkUjWTgEp_cG-0E2FczP=PtBUg@mail.gmail.com>
 <d1069c71-108f-d5e0-f2fa-4af1048386e2@linux.intel.com>
In-Reply-To: <d1069c71-108f-d5e0-f2fa-4af1048386e2@linux.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 8 Jan 2020 09:54:20 -0800
Message-ID: <CAA_a9xKG_qk5sBUZY6T5xH+XG_HQwLXVf2Jy0GXX0Ob+6R1rig@mail.gmail.com>
Subject: Re: Configuring device with I2C mux
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000b20e33059ba495c7"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b20e33059ba495c7
Content-Type: text/plain; charset="UTF-8"

Hi James,

Yes, we have multiple devices sitting behind the mux, and they're onboard
devices instead of standalone FRUs. The parent bus is described as the FRU
for each PCIe card.

After naming the mux channels, can these names be used somehow to config
I2C devices? For example, {"Bus": "$bus", "ChannelNames":
["C0", "C1", "C2", "C3"]} for the mux, and {"Bus": "$bus.C1"} for devices
behind the mux on channel 1.

Thanks!

- Alex Qiu


On Wed, Jan 8, 2020 at 9:47 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 1/8/20 9:25 AM, Alex Qiu wrote:
> > Hi Milton,
> >
> > Yes, the child buses are traceable in the sysfs, but actually my
> > question is, does entity-manager supports tracing child buses through
> > the sysfs? If it does, how shall I write the JSON config to take
> > advantage of this feature?
> >
> > For example, we have a I2C device sitting at the same level as the mux,
> > configured as {"Address": "0x40", "Bus": "$bus"}, and now I don't find
> > the way to add or subtract a certain number to $bus to find a child bus.
> > Do we have a feature with syntax like {"Address": "0x50", "Bus":
> > "$bus.mux.0x70.channel.1"} to configure devices on child buses, with mux
> > sitting on 0x70 of the parent bus?
>
> Do you have a device sitting behind the mux? Generally in most our
> situations we have another FRU behind the mux, and we can use "$bus" to
> describe this.
>
> Second option is you can name the mux channels, like this:
>
> https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/configurations/WFT%20Baseboard.json#L1023
>
> And then in /dev/ you'll get symlinks like this:
>
> root@intel-obmc:~# ls -al /dev/i2c-mux/M2_Mux/
> drwxr-xr-x    2 root     root            80 Jan  1 00:01 .
> drwxr-xr-x    9 root     root           180 Jan  1 00:01 ..
> lrwxrwxrwx    1 root     root            11 Jan  1 00:01 M2Slot1 ->
> /dev/i2c-14
> lrwxrwxrwx    1 root     root            11 Jan  1 00:01 M2Slot2 ->
> /dev/i2c-15
>
> -James
>
>
> >
> > Thank you!
> >
> > - Alex Qiu
> >
> >
> > On Wed, Jan 8, 2020 at 6:43 AM Milton Miller II <miltonm@us.ibm.com
> > <mailto:miltonm@us.ibm.com>> wrote:
> >
> >     About 01/07/2020 07:14PM in some timezone, Alex Qiu wrote:
> >      >Hi folks,
> >      >
> >      >We have a JSON file configuring I2C devices of a PCIe card which
> has
> >      >an 8-channel I2C mux for entity-manager. After we properly
> configure
> >      >the mux of the card, we get 8 new I2C buses in sysfs; however, we
> >      >don't find an arithmetic way to describe the relationship between
> the
> >      >new buses and their parent buses.
> >      >
> >      >For example, we have a mux on physical BMC I2C bus i2c-8 spawning a
> >      >couple of child buses including i2c-24 and i2c-26, which are the
> >      >buses for each PCIe card. The mux on i2c-24 PCIe card spawned 8
> buses
> >      >from i2c-70 to i2c-77, and the mux on i2c-26 PCIe card spawned ones
> >      >from i2c-62 to i2c-69. We have I2C devices on i2c-76 and i2c-68
> needs
> >      >to be configured together with the PCIe card on i2c-24 and i2c-26
> >      >separately.
> >      >
> >      >How do we implement this in the JSON file? If that's not possible
> to
> >      >do it in JSON merely, what's the suggested approach to implement
> this
> >      >feature? Device tree? Implement code in entity-manager to walk
> >      >through the I2C sysfs?
> >
> >
> >     I would expect the i2c buses provied by the mux to appear in sysfs
> >     under the hierarchy of the parent bus.  Explore the sysfs directory
> >     structure, I'm making this up, but I've now peeked at i2c-mux.c and
> >     have a better chance getting reality.
> >
> >
> >     /sys/bus/i2c/devices/i2c-8 -> /sys/devices/platform/ahb-432000/i2c-8
> >
> >     /sys/bus/i2c/devices/i2c-24 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24
> >     /sys/bus/i2c/devices/i2c-24 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-25
> >     /sys/bus/i2c/devices/i2c-24 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26
> >
> >     /sys/bus/i2c/devices/i2c-62 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-62
> >     /sys/bus/i2c/devices/i2c-63 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-63
> >     /sys/bus/i2c/devices/i2c-64 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-64
> >     /sys/bus/i2c/devices/i2c-65 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-65
> >     /sys/bus/i2c/devices/i2c-66 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-66
> >     /sys/bus/i2c/devices/i2c-67 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-67
> >     /sys/bus/i2c/devices/i2c-68 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-68
> >     /sys/bus/i2c/devices/i2c-69 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-69
> >     /sys/bus/i2c/devices/i2c-70 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-70
> >     /sys/bus/i2c/devices/i2c-71 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-71
> >     /sys/bus/i2c/devices/i2c-72 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-72
> >     /sys/bus/i2c/devices/i2c-73 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-73
> >     /sys/bus/i2c/devices/i2c-74 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-74
> >     /sys/bus/i2c/devices/i2c-75 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-75
> >     /sys/bus/i2c/devices/i2c-76 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-76
> >     /sys/bus/i2c/devices/i2c-77 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-77
> >
> >     /sys/bus/i2c/devices/i2c-24/mux_device ->
> >     /sys/devices/platform/ahb-432000/i2c-8/8-52
> >     /sys/bus/i2c/devices/i2c-25/mux_device ->
> >     /sys/devices/platform/ahb-432000/i2c-8/8-52
> >     /sys/bus/i2c/devices/i2c-26/mux_device ->
> >     /sys/devices/platform/ahb-432000/i2c-8/8-52
> >
> >     /sys/bus/i2c/devices/8-52/channel-0 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24
> >     /sys/bus/i2c/devices/8-52/channel-1 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-25
> >     /sys/bus/i2c/devices/8-52/channel-2 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26
> >
> >     /sys/bus/i2c/devices/24-52/channel-0 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-62
> >     /sys/bus/i2c/devices/24-52/channel-1 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-63
> >     /sys/bus/i2c/devices/24-52/channel-2 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-64
> >     /sys/bus/i2c/devices/24-52/channel-3 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-65
> >     /sys/bus/i2c/devices/24-52/channel-4 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-66
> >     /sys/bus/i2c/devices/24-52/channel-5 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-67
> >     /sys/bus/i2c/devices/24-52/channel-6 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-68
> >     /sys/bus/i2c/devices/24-52/channel-7 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-69
> >     /sys/bus/i2c/devices/26-52/channel-0 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-70
> >     /sys/bus/i2c/devices/26-52/channel-1 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-71
> >     /sys/bus/i2c/devices/26-52/channel-2 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-72
> >     /sys/bus/i2c/devices/26-52/channel-3 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-73
> >     /sys/bus/i2c/devices/26-52/channel-4 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-74
> >     /sys/bus/i2c/devices/26-52/channel-5 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-75
> >     /sys/bus/i2c/devices/26-52/channel-6 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-76
> >     /sys/bus/i2c/devices/26-52/channel-7 ->
> >     /sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-77
> >
> >     The child bus will have a symlink "mux_device" pointing to the mux.
> >     The mux device node will have n symlinks "channel-1" where 1 is
> >     the channel id.
> >
> >     Hmm, there is no apparent code to put a "mux_channel" attribute in
> >     the adapter node.  The adapter name attribute does include the
> channel
> >     id, but its long descriptive text.  Regardless, you should be able to
> >     find the buses from the mux channel-3 symlinks.
> >
> >     Note: I haven't looked at the JSON to see how much it will change
> once
> >     your find the bus.  I'm guessing you will have to generate it by
> taking
> >     a template and substituting the bus numbers you find to make the
> slots
> >     common, alhtough you could just go from the 8-52/channel-3 symlink to
> >     the adapter bus (the device name will still have the bus number in
> it).
> >
> >     I hope this helps you,
> >
> >     milton
> >
>

--000000000000b20e33059ba495c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>Yes, we have multiple devices=
 sitting behind the mux, and they&#39;re onboard devices instead of standal=
one FRUs. The parent bus is described as the FRU for each PCIe card.</div><=
div><br></div><div>After naming the mux channels, can these names be used s=
omehow to config I2C devices? For example, {&quot;Bus&quot;: &quot;$bus&quo=
t;, &quot;ChannelNames&quot;: [&quot;C0&quot;,=C2=A0&quot;C1&quot;,=C2=A0&q=
uot;C2&quot;,=C2=A0&quot;C3&quot;]} for the mux, and {&quot;Bus&quot;: &quo=
t;$bus.C1&quot;} for devices behind the mux on channel 1.</div><div><br></d=
iv><div>Thanks!</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">- Alex=
 Qiu</div></div></div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 8, 2020 at 9:47 AM James Feist =
&lt;<a href=3D"mailto:james.feist@linux.intel.com">james.feist@linux.intel.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 1/8/20 9:25 AM, Alex Qiu wrote:<br>
&gt; Hi Milton,<br>
&gt; <br>
&gt; Yes, the child buses are traceable=C2=A0in the sysfs, but actually my =
<br>
&gt; question is, does entity-manager supports tracing child buses through =
<br>
&gt; the sysfs? If it does, how shall I write the JSON config to take <br>
&gt; advantage of this feature?<br>
&gt; <br>
&gt; For example, we have a I2C device sitting at the same level as the mux=
, <br>
&gt; configured as {&quot;Address&quot;: &quot;0x40&quot;, &quot;Bus&quot;:=
 &quot;$bus&quot;}, and now I don&#39;t find <br>
&gt; the way to add or subtract=C2=A0a certain number to $bus to find a chi=
ld bus. <br>
&gt; Do we have a feature with syntax like=C2=A0{&quot;Address&quot;: &quot=
;0x50&quot;, &quot;Bus&quot;: <br>
&gt; &quot;$bus.mux.0x70.channel.1&quot;} to configure devices on child bus=
es, with mux <br>
&gt; sitting on 0x70 of the parent bus?<br>
<br>
Do you have a device sitting behind the mux? Generally in most our <br>
situations we have another FRU behind the mux, and we can use &quot;$bus&qu=
ot; to <br>
describe this.<br>
<br>
Second option is you can name the mux channels, like this: <br>
<a href=3D"https://github.com/openbmc/entity-manager/blob/01542d2af1b1f4533=
5cc8813fffcd3ed07f22989/configurations/WFT%20Baseboard.json#L1023" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openbmc/entity-manager/blob=
/01542d2af1b1f45335cc8813fffcd3ed07f22989/configurations/WFT%20Baseboard.js=
on#L1023</a><br>
<br>
And then in /dev/ you&#39;ll get symlinks like this:<br>
<br>
root@intel-obmc:~# ls -al /dev/i2c-mux/M2_Mux/<br>
drwxr-xr-x=C2=A0 =C2=A0 2 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 80 Jan=C2=A0 1 00:01 .<br>
drwxr-xr-x=C2=A0 =C2=A0 9 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0180 Jan=C2=A0 1 00:01 ..<br>
lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 11 Jan=C2=A0 1 00:01 M2Slot1 -&gt; <br>
/dev/i2c-14<br>
lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 11 Jan=C2=A0 1 00:01 M2Slot2 -&gt; <br>
/dev/i2c-15<br>
<br>
-James<br>
<br>
<br>
&gt; <br>
&gt; Thank you!<br>
&gt; <br>
&gt; - Alex Qiu<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jan 8, 2020 at 6:43 AM Milton Miller II &lt;<a href=3D"mailto:=
miltonm@us.ibm.com" target=3D"_blank">miltonm@us.ibm.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:miltonm@us.ibm.com" target=3D"_blank">mil=
tonm@us.ibm.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0About 01/07/2020 07:14PM in some timezone, Alex Qiu=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;Hi folks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;We have a JSON file configuring I2C devices of=
 a PCIe card which has<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;an 8-channel I2C mux for entity-manager. After=
 we properly configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;the mux of the card, we get 8 new I2C buses in=
 sysfs; however, we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;don&#39;t find an arithmetic way to describe t=
he relationship between the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;new buses and their parent buses.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;For example, we have a mux on physical BMC I2C=
 bus i2c-8 spawning a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;couple of child buses including i2c-24 and i2c=
-26, which are the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;buses for each PCIe card. The mux on i2c-24 PC=
Ie card spawned 8 buses<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;from i2c-70 to i2c-77, and the mux on i2c-26 P=
CIe card spawned ones<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;from i2c-62 to i2c-69. We have I2C devices on =
i2c-76 and i2c-68 needs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;to be configured together with the PCIe card o=
n i2c-24 and i2c-26<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;separately.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;How do we implement this in the JSON file? If =
that&#39;s not possible to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;do it in JSON merely, what&#39;s the suggested=
 approach to implement this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;feature? Device tree? Implement code in entity=
-manager to walk<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;through the I2C sysfs?<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I would expect the i2c buses provied by the mux to =
appear in sysfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0under the hierarchy of the parent bus.=C2=A0 Explor=
e the sysfs directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0structure, I&#39;m making this up, but I&#39;ve now=
 peeked at i2c-mux.c and<br>
&gt;=C2=A0 =C2=A0 =C2=A0have a better chance getting reality.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-8 -&gt; /sys/devices/platf=
orm/ahb-432000/i2c-8<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-24 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-24 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-25<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-24 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-62 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
2<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-63 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
3<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-64 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
4<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-65 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
5<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-66 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
6<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-67 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
7<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-68 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
8<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-69 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-6=
9<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-70 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
0<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-71 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
1<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-72 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
2<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-73 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
3<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-74 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
4<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-75 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
5<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-76 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
6<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-77 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-7=
7<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-24/mux_device -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/8-52<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-25/mux_device -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/8-52<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/i2c-26/mux_device -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/8-52<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/8-52/channel-0 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/8-52/channel-1 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-25<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/8-52/channel-2 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-0 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
2<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-1 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
3<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-2 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
4<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-3 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
5<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-4 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
6<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-5 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
7<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-6 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
8<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/24-52/channel-7 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-24/i2c-6=
9<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-0 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
0<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-1 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
1<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-2 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
2<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-3 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
3<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-4 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
4<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-5 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
5<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-6 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
6<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/bus/i2c/devices/26-52/channel-7 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/sys/devices/platform/ahb-432000/i2c-8/i2c-26/i2c-7=
7<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The child bus will have a symlink &quot;mux_device&=
quot; pointing to the mux.<br>
&gt;=C2=A0 =C2=A0 =C2=A0The mux device node will have n symlinks &quot;chan=
nel-1&quot; where 1 is<br>
&gt;=C2=A0 =C2=A0 =C2=A0the channel id.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hmm, there is no apparent code to put a &quot;mux_c=
hannel&quot; attribute in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the adapter node.=C2=A0 The adapter name attribute =
does include the channel<br>
&gt;=C2=A0 =C2=A0 =C2=A0id, but its long descriptive text.=C2=A0 Regardless=
, you should be able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0find the buses from the mux channel-3 symlinks.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Note: I haven&#39;t looked at the JSON to see how m=
uch it will change once<br>
&gt;=C2=A0 =C2=A0 =C2=A0your find the bus.=C2=A0 I&#39;m guessing you will =
have to generate it by taking<br>
&gt;=C2=A0 =C2=A0 =C2=A0a template and substituting the bus numbers you fin=
d to make the slots<br>
&gt;=C2=A0 =C2=A0 =C2=A0common, alhtough you could just go from the 8-52/ch=
annel-3 symlink to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the adapter bus (the device name will still have th=
e bus number in it).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I hope this helps you,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0milton<br>
&gt; <br>
</blockquote></div>

--000000000000b20e33059ba495c7--
