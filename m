Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28211ED66
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 23:04:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZPpv0lvrzDrLX
	for <lists+openbmc@lfdr.de>; Sat, 14 Dec 2019 09:04:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52e;
 helo=mail-ed1-x52e.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ucK80tDX"; 
 dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZPlr0ZxyzDrK5
 for <openbmc@lists.ozlabs.org>; Sat, 14 Dec 2019 09:02:15 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id j17so360497edp.3
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 14:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=7/5hPFnFSqyJbtj1wjEvFoT4iRWu2Wy2/vJt+0WbDqA=;
 b=ucK80tDX/5mJxPRnt27nb0wsX8XxT3P5LRabmSwYoOQx8jYXYVELzAIfiDn6Ee5f4L
 RyK7y00qrDCa9QiKe2R+dLSg97h2RtGe3Y3J+MghCrrasE6kcBW6m8NTvCB5w78hWiGS
 Xfv/A6MfklK+Y0p/x08PZZ83mAHh+9omh9ys5o54s+pFkxHjEdb/et+LPymLG/ZAb/Ow
 6D8ev0XSq0wm8ns8/7h3DttVZLPc151gjpdBy/KbFygr+zyQjWH1mI8goHLjroP9a9pY
 Pk1oSle0AYKyREPkPCh21gaJ42xOwfbLy94r0d17Qc5sWltDfs1lJto01YehSuezzjLq
 tCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7/5hPFnFSqyJbtj1wjEvFoT4iRWu2Wy2/vJt+0WbDqA=;
 b=MZmDS6WZCZ1+cMUZBlKnr5+96P3zP2rYGGzzMAMmUB4G7sR21hIilYxOSbt6C8LTfo
 4ry1QH+uOEuvtAzfxSVVjgB0TGkBA0lIpO21hJH7aAl3rJjUI0agDUUGOsbVSUxGm9u/
 qRptYswAdik89+BwwfIVGVKOtuTO7oLxhsNhk+CjjjsEUfh653H6THnP/PjkK1RJFfXI
 FbSGYc1kHYzSht0KLsEe+t5cUwYIFWcSA5L4bf6/l5Mheaj0C7w3JA0TQd6QvefL9woL
 6mgMS1uFSPu/xMK5RhcUCnfIo3i5Jmj1aTvbnxoW9c7XVNGSOdIQmMPfDDeC2wSUFy82
 na4g==
X-Gm-Message-State: APjAAAX86TI41Sjr0v7PI0wu2itHnvt9ziaPIslUvfdC6X8in0KqHIbx
 dX0JCnwbY8bgYphFNGNMRvJvWaMgxTIXjB2zvA60MpMGrGJ/gg==
X-Google-Smtp-Source: APXvYqwzC6ieZN6HeUSNm8jbpHaTyRDMwm0d3w+d+tO6UHan5xoAWf28pYZpoaHN1Evos3UGQCmqQAGuFXV8k6haXX0=
X-Received: by 2002:a05:6402:1802:: with SMTP id
 g2mr18140721edy.253.1576274531687; 
 Fri, 13 Dec 2019 14:02:11 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcTua1oHhO62-QZPZdcgFYZWjBg4QAjixiNB5z4zajuzKQ@mail.gmail.com>
In-Reply-To: <CABoTLcTua1oHhO62-QZPZdcgFYZWjBg4QAjixiNB5z4zajuzKQ@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Fri, 13 Dec 2019 17:01:55 -0500
Message-ID: <CABoTLcQ91dxfMO9Zp9cPKbkMjiASfbD9Hpt7HeVMtN52_i1KtA@mail.gmail.com>
Subject: Re: phosphor-networkd clobbering usb0 network config
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000088444e05999d03a8"
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

--00000000000088444e05999d03a8
Content-Type: text/plain; charset="UTF-8"

Ok, I think I found a way forward that's not too hacky and is only a few
lines of code change.

Part 1 is to tell systemd-networkd to always configure the IP address on
the interface even if it doesn't have link. Is there a reason we're not
already doing this? Right now, from what I can tell we lose an IP address
on any interface if its link is not up and the IP address for another
interface gets set or changed and then persisted by phosphor-networkd.

systemd-networkd can be reconfigured by adding the following to the
"[Network]" section of the USB virtual NIC on the BMC:
ConfigureWithoutCarrier=true
IgnoreCarrierLoss=true

This looks as following then:
root@bmc:~# cat /etc/systemd/network/00-bmc-usb0.network
[Match]
Name=usb0
[Link]
MACAddress=bc:46:a:4a:8a:d8
[Network]
LinkLocalAddressing=no
IPv6AcceptRA=false
DHCP=false
Address=169.254.254.254/24


*ConfigureWithoutCarrier=trueIgnoreCarrierLoss=true*[DHCP]
ClientIdentifier=mac
UseDNS=true
UseNTP=true
UseHostname=true
SendHostname=true


However, this alone is not sufficient, since phosphor-networkd still
clobbers the configuration file but without these parameters.

Part 2 is to tell phosphor-networkd to include
"ConfigureWithoutCarrier=true" and "IgnoreCarrierLoss=true" in the
generated configuration files. I'm proposing to make this behavior change
via a configure parameter, similar to what we've done with
--disable-link-local-autoconfiguration.

I'll make the necessary changes and will send a commit for review.

Oskar.

On Tue, Dec 10, 2019 at 1:00 PM Oskar Senft <osk@google.com> wrote:

> Hi everyone
>
> I couldn't find any other mention of this and hope this hasn't been asked
> / answered / solved before.
>
> We're using both an NC-SI based NIC and the USB virtual NIC on a AST2500
> BMC (on the TYAN S7106 mainboard). I found that phosphor-networkd clobbers
> the networking configuration (IP address) for the USB virtual NIC (usb0) in
> the following scenario:
>
>    1. The USB virtual NIC (usb0) has it default IP address hard coded in
>    /etc/systemd/network/00-bmc-usb0.network.
>    2. The host has not yet loaded the USB NIC driver (cdc_ether). In this
>    case the USB NIC on the BMC does not have an IP address assigned (I haven't
>    investigated why that is, but it seems ok).
>    3. A process actively assigns / changes the IP address for the BMC's
>    other NIC (i.e. eth0) via phosphor-networkd, e.g. via IPMI from the host.
>
> At step #3 phosphor-networkd overwrites all files in /etc/systemd/network
> (EthernetInterface::writeConfigurationFile() called from
> Manager::writeToConfigurationFile()). Specifically, it rewrites all files
> with information captured from the running system. Since the USB NIC (usb0)
> doesn't have an IP address at that time, the rewritten file is missing the
> IP address, too.
>
> I can think of various ways to fix this:
>
>    - Make the host explicitly configure usb0 via IPMI before trying to
>    talk with the BMC via the USB NIC. This won't work since we'd like to stop
>    using IPMI from the host completely.
>    - Enhance phosphor-networkd to always explicitly exclude "usb0" as a
>    managed device. I wonder if this could be done by adding a new key/value
>    pair to /etc/systemd/network/00-bmc-usb0.network, e.g. "[PhosphorNetworkD]
>    managed=false". This seems pretty straightforward.
>    - Come up with some "automatic" way to not clobber the configuration
>    file if the running configuration does not match. It feels that this goes
>    against the fundamental design of phosphor-networkd.
>
> Thoughts? Ideas? Opinions?
>
> Thanks
> Oskar.
>

--00000000000088444e05999d03a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ok, I think I found a way forward that&#39;s not too =
hacky and is only=C2=A0a few lines of code change.</div><div><br></div><div=
>Part 1 is to tell systemd-networkd to always configure the IP address on t=
he interface even if it doesn&#39;t have link. Is there a reason we&#39;re =
not already doing this? Right now, from what I can tell we lose an IP addre=
ss on any interface if its link is not up and the IP address for another in=
terface gets set or changed and then persisted by phosphor-networkd.</div><=
div><br></div><div></div><div>systemd-networkd can be reconfigured by addin=
g the following to the &quot;[Network]&quot; section of the USB virtual NIC=
 on the BMC:</div>ConfigureWithoutCarrier=3Dtrue<br>IgnoreCarrierLoss=3Dtru=
e<div><br></div><div>This looks as following then:</div><div><font face=3D"=
monospace">root@bmc:~# cat /etc/systemd/network/00-bmc-usb0.network<br>[Mat=
ch]<br>Name=3Dusb0<br>[Link]<br>MACAddress=3Dbc:46:a:4a:8a:d8<br>[Network]<=
br>LinkLocalAddressing=3Dno<br>IPv6AcceptRA=3Dfalse<br>DHCP=3Dfalse<br>Addr=
ess=3D<a href=3D"http://169.254.254.254/24">169.254.254.254/24</a><br><b>Co=
nfigureWithoutCarrier=3Dtrue<br>IgnoreCarrierLoss=3Dtrue<br></b>[DHCP]<br>C=
lientIdentifier=3Dmac<br>UseDNS=3Dtrue<br>UseNTP=3Dtrue<br>UseHostname=3Dtr=
ue<br>SendHostname=3Dtrue<br></font><div><br></div></div><div><br></div><di=
v>However, this alone is not sufficient, since phosphor-networkd still clob=
bers the configuration file but without these parameters.</div><div><br></d=
iv><div>Part 2 is to tell phosphor-networkd to include &quot;ConfigureWitho=
utCarrier=3Dtrue&quot; and &quot;IgnoreCarrierLoss=3Dtrue&quot; in the gene=
rated configuration files. I&#39;m proposing to make this behavior change v=
ia a configure parameter, similar to what we&#39;ve done with --disable-lin=
k-local-autoconfiguration.</div><div><br></div><div>I&#39;ll make the neces=
sary changes and will send a commit for review.</div><div><br></div><div>Os=
kar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Dec 10, 2019 at 1:00 PM Oskar Senft &lt;<a href=3D"mailto=
:osk@google.com">osk@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi everyone<div><br></div=
><div>I couldn&#39;t find any other mention of this and hope this hasn&#39;=
t been asked / answered / solved before.</div><div><br></div><div>We&#39;re=
 using both an NC-SI based NIC and the USB virtual=C2=A0NIC on a AST2500 BM=
C (on the TYAN S7106 mainboard). I found that phosphor-networkd clobbers th=
e networking configuration (IP address) for the USB virtual NIC (usb0) in t=
he following scenario:</div><div><ol><li>The USB virtual NIC (usb0) has it =
default IP address hard coded in /etc/systemd/network/00-bmc-usb0.network.<=
/li><li>The host has not yet loaded the USB NIC driver (cdc_ether). In this=
 case the USB NIC on the BMC does not have an IP address assigned (I haven&=
#39;t investigated why that is,=C2=A0but it seems ok).</li><li>A process ac=
tively assigns / changes the IP address for the BMC&#39;s other NIC (i.e. e=
th0) via phosphor-networkd, e.g. via IPMI from the host.</li></ol><div>At s=
tep #3 phosphor-networkd overwrites all files in /etc/systemd/network (Ethe=
rnetInterface::writeConfigurationFile() called from Manager::writeToConfigu=
rationFile()). Specifically, it rewrites all files with information capture=
d from the running system. Since the USB NIC (usb0) doesn&#39;t have an IP =
address at that time, the rewritten file is missing the IP address, too.<br=
></div></div><div><br></div><div></div><div>I can think of various ways to =
fix this:<br></div><div><ul><li>Make the host explicitly configure usb0 via=
 IPMI before trying to talk with the BMC via the USB NIC. This won&#39;t wo=
rk since we&#39;d like to stop using IPMI from the host completely.</li><li=
>Enhance phosphor-networkd to always explicitly exclude &quot;usb0&quot; as=
 a managed device. I wonder if this could be done by adding a new key/value=
 pair to=C2=A0/etc/systemd/network/00-bmc-usb0.network, e.g. &quot;[Phospho=
rNetworkD] managed=3Dfalse&quot;. This seems pretty straightforward.<br></l=
i><li>Come up with some &quot;automatic&quot; way to not clobber the config=
uration file if the running configuration does not match. It feels that thi=
s goes against the fundamental design of phosphor-networkd.</li></ul><div>T=
houghts? Ideas? Opinions?</div></div><div><br></div><div>Thanks</div><div>O=
skar.</div></div>
</blockquote></div>

--00000000000088444e05999d03a8--
