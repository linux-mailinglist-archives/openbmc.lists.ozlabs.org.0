Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95339118F6F
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 19:01:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XSYr4CjtzDqZQ
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 05:01:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aXGNBTSb"; 
 dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XSY775gVzDqZR
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 05:01:14 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id cm12so16745211edb.11
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 10:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lVTgV7lQEVYRlmJxvwmTcyxmqEARdIyp/zwlinBLbTc=;
 b=aXGNBTSbnSra52maJRiuySDtLoLkt2V+6QmPyV379CGTzUFBeiDtOpTHHljaWaOw/p
 9hxD1P8vi+bMlh0h8TYAQYNX1rSsuS+bHto3gvioKxxFW7J6KxAPcRXw8+o/Wrs/jtPV
 Jd+O9jeGLAzHiWOUrcityBqkUPX1KCQKvPDsTbKy7c5WuCvZRBW7bLZUVMah9hOzLd++
 0f3gDXC60bNBbEdNQxhiz4XkTF8154hA+luBbwCAzi4jZypdXKDEEovGS4E5yfNWjEHu
 mBN4e/zkI130aHcyBpf9oz5nZQdeTqgXlyacFfaQQ8BDqb8npDrrBhcrFxgxlDKIdic4
 60iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lVTgV7lQEVYRlmJxvwmTcyxmqEARdIyp/zwlinBLbTc=;
 b=kZMoSpxTKUpOT4M6nfrrQu9ic42BUAO3TjK+e3D4LP4s7pZDJdtPRwYzCtbyEtbdcU
 P4os6YkMZfTiiW2XIMjOziAzdeZC6X03emLS5Wg3sKSCKepL8vAqwOxTt3H5K+B8VigP
 mNJRl3lnVrogyTx5AdOLkl3soOR+wW0Z+Cq67OS41HVqTCJ00oBhugTJiz3+7lnEBm1i
 NSvUMuMwfFSFf/9f1eN7oxWo7hUZygsQBgzPZX/2fCDgPliT3xfUa0yjMEO8cJwenxFS
 Py/rlUT3d/H9iBpX7Z23yaeJwoGLyXYaoFgn4MPce/e27xNYlm1mkEN3E+HkJ4xpdrNC
 GpSg==
X-Gm-Message-State: APjAAAWgILMMLdwGcijE//MPcQLlh3Jd52RDClCBIfklN5qAc8nMqHDO
 ixGx+yqkKLkt1nBf497xEZ9HpME5P1uY6LSvhyP+i/nC89U=
X-Google-Smtp-Source: APXvYqzUzKE4Wny2vN/vuZon5T86UR9sT6d84Qz0wAr0XXSQ9PlXbkPKdoom77Bxnxd4wDOibDV7B6iz56eqDAkZvo4=
X-Received: by 2002:a17:906:2e47:: with SMTP id
 r7mr5098590eji.215.1576000866057; 
 Tue, 10 Dec 2019 10:01:06 -0800 (PST)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Tue, 10 Dec 2019 13:00:50 -0500
Message-ID: <CABoTLcTua1oHhO62-QZPZdcgFYZWjBg4QAjixiNB5z4zajuzKQ@mail.gmail.com>
Subject: phosphor-networkd clobbering usb0 network config
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ca092805995d4b85"
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

--000000000000ca092805995d4b85
Content-Type: text/plain; charset="UTF-8"

Hi everyone

I couldn't find any other mention of this and hope this hasn't been asked /
answered / solved before.

We're using both an NC-SI based NIC and the USB virtual NIC on a AST2500
BMC (on the TYAN S7106 mainboard). I found that phosphor-networkd clobbers
the networking configuration (IP address) for the USB virtual NIC (usb0) in
the following scenario:

   1. The USB virtual NIC (usb0) has it default IP address hard coded in
   /etc/systemd/network/00-bmc-usb0.network.
   2. The host has not yet loaded the USB NIC driver (cdc_ether). In this
   case the USB NIC on the BMC does not have an IP address assigned (I haven't
   investigated why that is, but it seems ok).
   3. A process actively assigns / changes the IP address for the BMC's
   other NIC (i.e. eth0) via phosphor-networkd, e.g. via IPMI from the host.

At step #3 phosphor-networkd overwrites all files in /etc/systemd/network
(EthernetInterface::writeConfigurationFile() called from
Manager::writeToConfigurationFile()). Specifically, it rewrites all files
with information captured from the running system. Since the USB NIC (usb0)
doesn't have an IP address at that time, the rewritten file is missing the
IP address, too.

I can think of various ways to fix this:

   - Make the host explicitly configure usb0 via IPMI before trying to talk
   with the BMC via the USB NIC. This won't work since we'd like to stop using
   IPMI from the host completely.
   - Enhance phosphor-networkd to always explicitly exclude "usb0" as a
   managed device. I wonder if this could be done by adding a new key/value
   pair to /etc/systemd/network/00-bmc-usb0.network, e.g. "[PhosphorNetworkD]
   managed=false". This seems pretty straightforward.
   - Come up with some "automatic" way to not clobber the configuration
   file if the running configuration does not match. It feels that this goes
   against the fundamental design of phosphor-networkd.

Thoughts? Ideas? Opinions?

Thanks
Oskar.

--000000000000ca092805995d4b85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone<div><br></div><div>I couldn&#39;t find any oth=
er mention of this and hope this hasn&#39;t been asked / answered / solved =
before.</div><div><br></div><div>We&#39;re using both an NC-SI based NIC an=
d the USB virtual=C2=A0NIC on a AST2500 BMC (on the TYAN S7106 mainboard). =
I found that phosphor-networkd clobbers the networking configuration (IP ad=
dress) for the USB virtual NIC (usb0) in the following scenario:</div><div>=
<ol><li>The USB virtual NIC (usb0) has it default IP address hard coded in =
/etc/systemd/network/00-bmc-usb0.network.</li><li>The host has not yet load=
ed the USB NIC driver (cdc_ether). In this case the USB NIC on the BMC does=
 not have an IP address assigned (I haven&#39;t investigated why that is,=
=C2=A0but it seems ok).</li><li>A process actively assigns / changes the IP=
 address for the BMC&#39;s other NIC (i.e. eth0) via phosphor-networkd, e.g=
. via IPMI from the host.</li></ol><div>At step #3 phosphor-networkd overwr=
ites all files in /etc/systemd/network (EthernetInterface::writeConfigurati=
onFile() called from Manager::writeToConfigurationFile()). Specifically, it=
 rewrites all files with information captured from the running system. Sinc=
e the USB NIC (usb0) doesn&#39;t have an IP address at that time, the rewri=
tten file is missing the IP address, too.<br></div></div><div><br></div><di=
v></div><div>I can think of various ways to fix this:<br></div><div><ul><li=
>Make the host explicitly configure usb0 via IPMI before trying to talk wit=
h the BMC via the USB NIC. This won&#39;t work since we&#39;d like to stop =
using IPMI from the host completely.</li><li>Enhance phosphor-networkd to a=
lways explicitly exclude &quot;usb0&quot; as a managed device. I wonder if =
this could be done by adding a new key/value pair to=C2=A0/etc/systemd/netw=
ork/00-bmc-usb0.network, e.g. &quot;[PhosphorNetworkD] managed=3Dfalse&quot=
;. This seems pretty straightforward.<br></li><li>Come up with some &quot;a=
utomatic&quot; way to not clobber the configuration file if the running con=
figuration does not match. It feels that this goes against the fundamental =
design of phosphor-networkd.</li></ul><div>Thoughts? Ideas? Opinions?</div>=
</div><div><br></div><div>Thanks</div><div>Oskar.</div></div>

--000000000000ca092805995d4b85--
