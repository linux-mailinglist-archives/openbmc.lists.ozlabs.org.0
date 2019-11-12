Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00358F8FE2
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 13:45:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C6sq4tj0zF44D
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 23:45:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=akashgj91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lP/e32lV"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C6qn0dWRzDrtm
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 23:43:48 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id m15so14136643otq.7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=M2yRL5rWUAtqV30VDUT6U67FocbK9cP7lkRfkGaTiyA=;
 b=lP/e32lVPCqFBSh2Ang7fB0GDP+cL63x3kpHVh9LUr/EsgPMNANh5W1k8R6WPxi0iq
 zUz/CbiA/zVYqXXAgh7yMG9wWLL9hyW5+3kXBhiT6Y6gtVhf07BgdxFj6QRMCkECY7ka
 +eTfiiNZbbCaenPBLrPVON121N1pPEBAO4LMwsT+fl8AE+32NHOKuDL+1bR3yERXOYFs
 fDnWP9SyltBYypwCwP2gCu4dmZhMoD5C1TbpcOSmaSmGIqBB+gSDSH/OQqG3tdPxmwM2
 n4t0iq+BKLZveRpA4202tcskdEjxHTLRztjgOAil0r+C4piQkvcVL4WFGZW+uKawlhKF
 WdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=M2yRL5rWUAtqV30VDUT6U67FocbK9cP7lkRfkGaTiyA=;
 b=oAaxVWHIBRycTxrMbSVJOsvTaNXjokQVtRyBsz5RyJpq87xYN48Q+ABe0w50ejUMbF
 eiWljIs04k9/mEcWoNl4XJXO5GQGzOYgIC98yEsqohWATTOrE1sbI9TsH9i2kIDFW14f
 x/bW0RYKqOETaN0qsJWhPPz9b40N2g0MJXRaX+Oduegi8lLUnwGGMY8VvEmRJzobh/w6
 cuXv7cxQlsRMBDKawDS+SHxoLscMxsEwWi0uGKfhkLOK1JmNvxHNVzaiquDkBeomjXli
 Seu9/a9EPGesG6gUQiMePkLaJqWN0Q8hu9W1Q54E28WNoXxs/xMkocox6yuAlcorouU8
 6FVg==
X-Gm-Message-State: APjAAAXMKiSzdSTqaaKYsh1HBaPGi+yXUy/u+UWkRbvC4GRZDitEoKJO
 b1zBNM6xwYx6Mas3bg5Q8BSVtqGy1zTvrbsXoKsRfSpoboI=
X-Google-Smtp-Source: APXvYqwRRKeHGKWv3OQ4C2MTAU0TcfXNry6cAW6oocNARXRxr9x4+8i5/7krzrCN6X+jucyZGnhAYcbPC0fhj2vSIbs=
X-Received: by 2002:a05:6830:1f29:: with SMTP id
 e9mr24176949oth.272.1573562625206; 
 Tue, 12 Nov 2019 04:43:45 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLFmxAxOGze5+rf20w-nBBBqOFzkLu5dbsXsKCWTeV5i0Q@mail.gmail.com>
In-Reply-To: <CAE33tLFmxAxOGze5+rf20w-nBBBqOFzkLu5dbsXsKCWTeV5i0Q@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 12 Nov 2019 18:13:35 +0530
Message-ID: <CAE33tLHjQDyFbuyR8EBEvgjnguFGhxxE8tQg1Ti-40sGqELTTw@mail.gmail.com>
Subject: Re: No login prompt on obmc-console
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004eaf5d0597259929"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004eaf5d0597259929
Content-Type: text/plain; charset="UTF-8"

Through ssh login on CentOS, we set /dev/ttyS0 to work in polling mode by
making its irq=0 using the following command

$ setserial /dev/ttyS0 uart 16550a irq 0

Now we are getting login prompt on serial console.

When we change /dev/ttyS0 back to interrupt mode with irq=4, we are not
getting login prompt over serial console.

We do not have a serial port connected to ttyS0 of BMC. So ttyS4 of BMC is
used as local-tty in obmc-console configuration.

Whether anything is required to be done in OpenBMC firmware to enable irq
mode for serial redirection.

On Wed, Nov 6, 2019 at 7:09 PM AKASH G J <akashgj91@gmail.com> wrote:

> Hi all,
>
> We are using BMC Aspeed AST-2500 in our motherboard with OpenBMC firmware.
> 'obmc-console' is used to get host messages over BMC. obmc-console.conf
> looks like
>
>
>
>
> *lpc-address = 0x3f8sirq = 4local-tty = ttyS4local-tty-baud = 115200*
>
> BIOS serial redirection is enabled over COM port 0 (0x3f8, sirq=4,
> baudrate=115200) for super-IO.
>
> We are getting BIOS debug messages, grub entries on BMC. But Linux booting
> is very slow, it is not printing systemd status messages(OK/FAILED) on
> serial console. Also is not giving login prompt on the serial console over
> BMC.
>
> Please someone help to resolve the problem.
>
>
> Thanks and Regards,
>
> Akash
>

--0000000000004eaf5d0597259929
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:&quot;Times&quot;,&quot;se=
rif&quot;">Through ssh login on CentOS, we set /dev/ttyS0 to work in pollin=
g mode by making its irq=3D0 using the following command <br></span></div><=
div><br><span style=3D"font-family:&quot;Times&quot;,&quot;serif&quot;"></s=
pan></div><div><span style=3D"font-family:&quot;Times&quot;,&quot;serif&quo=
t;"></span></div><span style=3D"font-family:&quot;Times&quot;,&quot;serif&q=
uot;"> $ setserial /dev/ttyS0 uart 16550a irq 0 <br> <br> Now we are gettin=
g login prompt on serial console. <br> <br></span><div><span style=3D"font-=
family:&quot;Times&quot;,&quot;serif&quot;"> When we change /dev/ttyS0 back=
 to interrupt mode with irq=3D4, we are not getting login prompt over seria=
l console.</span></div><div><span style=3D"font-family:&quot;Times&quot;,&q=
uot;serif&quot;"><br></span></div><div><span style=3D"font-family:&quot;Tim=
es&quot;,&quot;serif&quot;">We do not have a serial port connected to ttyS0=
 of BMC. So ttyS4 of BMC is used as local-tty in obmc-console configuration=
.</span></div><div><span style=3D"font-family:&quot;Times&quot;,&quot;serif=
&quot;"><br></span></div><div><span style=3D"font-family:&quot;Times&quot;,=
&quot;serif&quot;">Whether anything is required to be done in OpenBMC firmw=
are to enable irq mode for serial redirection.<br></span></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov =
6, 2019 at 7:09 PM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com">aka=
shgj91@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr">Hi all,<br><br>We are using BMC Aspeed AST=
-2500 in our motherboard with OpenBMC firmware. &#39;obmc-console&#39; is u=
sed to get host messages over BMC. obmc-console.conf looks like <br><br><i>=
lpc-address =3D 0x3f8<br>sirq =3D 4<br>local-tty =3D ttyS4<br>local-tty-bau=
d =3D 115200</i><br><br>BIOS serial redirection is enabled over COM port 0 =
(0x3f8, sirq=3D4, baudrate=3D115200) for super-IO.<br><br>We are getting BI=
OS debug messages, grub entries on BMC. But Linux booting is very slow, it =
is not printing systemd status messages(OK/FAILED) on serial console. Also =
is not giving login prompt on the serial console over BMC.<br><br><div>Plea=
se someone help to resolve the problem.</div><div><br></div><div><br></div>=
<div>Thanks and Regards,</div><div><br></div><div>Akash<br></div></div>
</blockquote></div>

--0000000000004eaf5d0597259929--
