Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7E23CCA4
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 18:56:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMHp02CpGzDqfv
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 02:56:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PotYEZ/Q; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMHmz1Z1YzDqMV
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 02:55:30 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id a5so31375702ioa.13
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1YskGxV5FGwzgr+FxKv1oDRtXLLtaocicC0kYR/iHuI=;
 b=PotYEZ/QpgVmh2paPllVwjBGhNc4KIs+jwF16ab+9zSPQN1ZTpEA9Wjzz/7aYMkfpf
 SBQRi82G2q0rAwiPPOgnOQ3aEfNhYP5E2k4jjkmgXZ9pd6LQcp0DZDRvvdDnUuikW2O2
 MMXWdI7+BSUQROKvLQjOLVGdeQil4bmVClv4/MvlmS08z2zYdirPmq8u9yxS68B5V0G2
 2qYDabzhvDcBCD9U8NEesEbn03unURmhBAkJCyLuRqsP2Y8Byjet1uC+FyGTJe9gxN/C
 6vyMrjxarbyF4Qdy1wkHtTUvzZ5fBbuAxvu0NapwJLBymYS6M5apovjoX1LwpZFxBmvp
 0KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1YskGxV5FGwzgr+FxKv1oDRtXLLtaocicC0kYR/iHuI=;
 b=bLvpoA1fwMOE2R2mAZEGYq+uhhUsvHyCGP4GC0OmcW78awZ2uRRlGtrM+s9zHCscr2
 b016IMD9SQh0MD6Qzmtq1X2KCD93/33KW5p1/BOXUPSjsRBa3+hfOp3KWaB0y7PTljyD
 tT3KV0/SipD5fTaCpf+fCp7C3+3TDKNlPOpDWPxHm1tWPgn8j95xKQ1ozAa8PrB/LGXH
 m91NbrDBvP7DdB4D+TkU54gbO0mImWT8kWh6YIXGQBU8t0IioE487B9jWFwDqJY1zx3I
 Ncf94I0ZQfOSsIX1plk+17gylp0LGFh3GdEOfWZ6lBFm4NXtO5Hh5f2ZISy2dRH50BFg
 4Lhw==
X-Gm-Message-State: AOAM530SbULvK9wppXUT4pVWnrKoFV68UyFySpxVLPmLdjHYRsBqMXp9
 43hxjQB6zY3VIxu1gekwXit1TuFVMiUN0ld6h/8=
X-Google-Smtp-Source: ABdhPJy38bv8WsF/jwk93SgCbLB8ZM09qox4U8nFnedQbxYND77aDTXwoAQwR2xExnxwk/6xiSlwCFFPn2zDXKhTPg8=
X-Received: by 2002:a5e:d90e:: with SMTP id n14mr4241973iop.197.1596646527620; 
 Wed, 05 Aug 2020 09:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAFaEeaE+xp89Q4dc0uS_-mdwy=ngb6-1XqnfdtTZ_1CW-GCE_A@mail.gmail.com>
 <1872ef34-0a74-4084-8098-424130f71848@beta.fastmail.com>
 <35326E4D-434F-407D-B79B-641F757C1AF3@gmail.com>
In-Reply-To: <35326E4D-434F-407D-B79B-641F757C1AF3@gmail.com>
From: Sui Chen <suichen6@gmail.com>
Date: Wed, 5 Aug 2020 09:55:16 -0700
Message-ID: <CAFaEeaGF82sTfKMn9PXBevPybbm9gOtEW+xuAES5sQdt-aBVTQ@mail.gmail.com>
Subject: Re: [openbmc-tools] dbus-vis: DBus capture visualization tool
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001c5c3405ac243d16"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001c5c3405ac243d16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

(To Andrew Jeffery)
Yes I had been using the original dbus-pcap since the start of dbus-vis;
dbus-pcap was run twice to obtain both timestamps and JSON outputs. This
approach had been working until I encountered truncated messages, where
dbus-pcap had to be modified a bit so that those truncated messages do not
get discarded.
So far the only modification I need is to keep truncated messages (just
like Wireshark does) and appending timestamps in JSON outputs (so we need
to run dbus-pcap only once.)

(To Andrew Geissler)
In my understanding, the "IPMI" part is OpenBMC-specific, as it's not very
likely that someone runs the IPMI daemon on a regular computer.
This tool was initially intended only for IPMI, so there are functions that
look for text-encoded IPMI-related DBus calls in ipmi_parse.js . dbus-pcap
was added later and it's this addition that enables more generic use.

The question of generic use is an interesting one -- dbus-vis could be used
outside of OpenBMC, and it may complement existing tools due to a few
differences: It started something that resembles a performance analysis
tool, so it focused on showing large amounts of events/information to focus
in a compact way, with limited ability to inspect individual events. DBus
traffic on the OpenBMC can easily reach hundreds of messages per second,
whereas on desktop systems this number is generally a lot lower (based on
my limited experience.) This seems to affect the design of tools as well,
as existing tools like GNU Bustle seem to be designed for showing fewer
messages per second and are more focused on finding the dependency between
DBus function calls.

Thanks,
Sui


On Tue, Jul 28, 2020 at 6:06 AM Andrew Geissler <geissonator@gmail.com>
wrote:

>
>
> > On Jul 24, 2020, at 10:01 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> <snip>
> >
> > I'm also thinking it might be time to start (an) independent repo(s)
> where we can develop the two, what we have is starting to grow a bit beyo=
nd
> the intended scope of openbmc-tools. Looping Brad and Andrew Geissler in
> here to get their thoughts.
>
> Unless there=E2=80=99s a pressing need to move it, I=E2=80=99d vote we ju=
st keep it where
> it is. Once it=E2=80=99s matured a bit, y=E2=80=99all could propose on a =
move to a separate
> repo. I wonder if this even needs to be under the openbmc namespace? Seem=
s
> like a fairly generic D-Bus tool that could be useful outside of openbmc?
>
> >
> > Cheers,
> >
> > Andrew
>
>

--0000000000001c5c3405ac243d16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hello,</div><div class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,helvetica,sans-serif">(To Andrew Jeffery)</div><d=
iv class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"=
>Yes I had been using the original dbus-pcap since the start of dbus-vis; d=
bus-pcap was run twice to obtain both timestamps and JSON outputs. This app=
roach had been working until I encountered truncated messages, where dbus-p=
cap had to be modified a bit so that those truncated messages do not get di=
scarded.</div><div class=3D"gmail_default" style=3D"font-family:arial,helve=
tica,sans-serif">So far the only modification I need is to keep truncated m=
essages (just like Wireshark does) and appending timestamps in JSON outputs=
 (so we need to run dbus-pcap only once.)</div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"g=
mail_default" style=3D"font-family:arial,helvetica,sans-serif">(To Andrew G=
eissler)</div><div class=3D"gmail_default" style=3D"font-family:arial,helve=
tica,sans-serif">In my understanding, the &quot;IPMI&quot; part is OpenBMC-=
specific, as it&#39;s not very likely that someone runs the IPMI daemon on =
a regular computer.</div><div class=3D"gmail_default" style=3D"font-family:=
arial,helvetica,sans-serif">This tool was initially intended=C2=A0only for =
IPMI, so there are functions that look for text-encoded IPMI-related DBus c=
alls in ipmi_parse.js . dbus-pcap was added later and it&#39;s this additio=
n that enables more generic use.</div><div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif">The question of gener=
ic use is an interesting one -- dbus-vis could be used outside of OpenBMC, =
and it may complement existing tools due to a few differences: It started s=
omething that resembles a performance analysis tool, so it focused on showi=
ng large amounts of events/information to focus in a compact way, with limi=
ted ability to inspect individual events. DBus traffic on the OpenBMC can e=
asily reach hundreds of messages per second, whereas on desktop systems thi=
s number is generally a lot lower (based on my limited experience.) This se=
ems to affect the design of tools as well, as existing tools like GNU Bustl=
e seem to be designed for showing fewer messages per second and are more fo=
cused on finding the dependency between DBus function calls.</div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif">Thanks,</div><div class=3D"gmail_default" style=3D"font-family:arial=
,helvetica,sans-serif">Sui</div><div class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif"><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 28, 2020 at 6:06 A=
M Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com">geissonator@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
&gt; On Jul 24, 2020, at 10:01 PM, Andrew Jeffery &lt;<a href=3D"mailto:and=
rew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt; <br>
&lt;snip&gt;<br>
&gt; <br>
&gt; I&#39;m also thinking it might be time to start (an) independent repo(=
s) where we can develop the two, what we have is starting to grow a bit bey=
ond the intended scope of openbmc-tools. Looping Brad and Andrew Geissler i=
n here to get their thoughts.<br>
<br>
Unless there=E2=80=99s a pressing need to move it, I=E2=80=99d vote we just=
 keep it where it is. Once it=E2=80=99s matured a bit, y=E2=80=99all could =
propose on a move to a separate repo. I wonder if this even needs to be und=
er the openbmc namespace? Seems like a fairly generic D-Bus tool that could=
 be useful outside of openbmc?<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Andrew<br>
<br>
</blockquote></div>

--0000000000001c5c3405ac243d16--
