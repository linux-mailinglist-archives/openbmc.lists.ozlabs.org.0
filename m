Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECE2E7625
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 06:10:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5K9V0rt5zDqHP
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 16:10:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=To1yDvzs; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5K8g6wcNzDqGY
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 16:09:39 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id x20so35249637lfe.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 21:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R0TGjIx0F7j27wn+li/YAAhAXy2ifJ3L0V4b5PtNuec=;
 b=To1yDvzsOUVpHZIaK1lXCEScyGYnOdmtVudZP3tbAumkmKFq5DkyB2Td2jiLlAwb91
 maca0cvw7IqnbiafqV49p8nFLc7htrxG4dV1esr0K79Dw1dD6XId+MsqsaY/x5Bl3obe
 HYLLC11T60U3YZKM33bjimbq4uMuBQT4n3qgZ5rpmQsMxl08DHunOiSDdRsbELMvtmTc
 67lLGB/4ZV2Xx37jtQLFgw6DKCd78XhVSACvZ236QWy0Q56fau1onupsn2hBZipKKhNf
 8ZlqrAig6VnZ+2P3sawk5Cfr6bVH82y1wxNZIjZiZdTlJ5GVtVentJF+X8eoJbRkTnUD
 h33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R0TGjIx0F7j27wn+li/YAAhAXy2ifJ3L0V4b5PtNuec=;
 b=nfEQb4DtRHZJWOnDIlx9OJ2W4a1vuen5Hm8EISJPkqzXBcHGEdLLny8SG5bhZCNoom
 f717taAtvmNmpu+S+pNoK6FGPDGSYhtuqzY3G/adQhxNdXawjG4aNLOwXxmArID6HdpT
 0uE5jBhIz5UZ+UEQU2JQR6CO7G3qYkCozzOomjBkkRRfv7nMBgK95l8zJmDD+G/1yQcZ
 4YEIIxKuKpV9Gnt8XX7sO5XYoi+MYtEN3IJ5VNc878sTwv+M63ylAj0Zgh6u/RsnSsf1
 I6TZ7+G/E33geqgvOQlmzPqi6WW8tgf2Dr+Io7kOIP9y7qLmNS+lYgiHSXGYWpW0XPQr
 fTSQ==
X-Gm-Message-State: AOAM530/rIcKBU88U8SmyGDvYDbtWcoGhBqbXR4QHRxY1iMwuCGOrPA+
 8ZAcWX+EEeqDOqKXKU4ZGjW70hPtGV3OS9wsSsmKAtjZ
X-Google-Smtp-Source: ABdhPJxaOLr8r7QJ/E4b9plqb1QEl6ZYHfLrQovv+/Sb5PmMYKPsE3oyVPrsjQSjyYxhjrmxwlFOtO2cNdiNgqf6Peg=
X-Received: by 2002:a2e:5cc6:: with SMTP id
 q189mr24780515ljb.316.1609304974672; 
 Tue, 29 Dec 2020 21:09:34 -0800 (PST)
MIME-Version: 1.0
References: <2cd25ea6-f957-1536-cfb5-ba9aa2a31611@amperemail.onmicrosoft.com>
In-Reply-To: <2cd25ea6-f957-1536-cfb5-ba9aa2a31611@amperemail.onmicrosoft.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Tue, 29 Dec 2020 21:09:23 -0800
Message-ID: <CAJTGxZESn=fr4OxP70JNAM0hnmR5vE7xC11ScbfbdeNiwd5bgA@mail.gmail.com>
Subject: Re: Ipmid not work on eth1 when enable NCSI.
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Content-Type: multipart/alternative; boundary="00000000000059c75905b7a78346"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000059c75905b7a78346
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 23, 2020 at 7:59 AM Thu Nguyen <thu@amperemail.onmicrosoft.com>
wrote:

> Hi All,
>
>
> I'm verifying NCSI with my Mt.Jade platform.
>
> In Mt.Jade platform, we have the shared NIC in eth0 interface and
> dedicated RGMII in eth1 interface.
>
> I used below steps to enable NC-SI in Mt.Jade.
>
> 1. Add definition in DTS for MAC0:
>
> &mac0 {
>        status = "disabled";
>        status = "okay";
>        pinctrl-names = "default";
>        pinctrl-0 = <&pinctrl_rmii1_default>;
>        clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
>                 <&syscon ASPEED_CLK_MAC1RCLK>;
>        clock-names = "MACCLK", "RCLK";
>        use-ncsi;
> };
>
> 2. Add build configure to enable OEM Command to get MAC for NCSI.
>
> CONFIG_NCSI_OEM_CMD_GET_MAC=y
>
> After these steps, My system can detect OCP card, can get MACs and both
> eth0 and eth1 interfaces are up.
>
> I can access BMC Web use both ip of eth0 or eth1. The same for Redfish.
>
> BUT I can only use ipmitool with eth0. Ipmitool command not work with
> eth1 interface.
>
>
> Check the setting of phosphor-ipmid-net in
>
>
> meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_access.json
>
>
> meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.json
>
You have to configure in this file for eth1 as well.

>
> I can see that ipmid is configured to listen on both interface eth0 and
> eth1.
>
How do you make sure it is listening on both interface

>
> Do I miss any configuration here?
>
>
> Check the journal log, I saw some errors and warning from NCSI:
>
> Dec 23 10:14:50 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI:
> Handler for packet type 0x82 returned -19
>
> Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI:
> 'bad' packet ignored for type 0x8b
> Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI:
> 'bad' packet ignored for type 0x8b
> Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI:
> 'bad' packet ignored for type 0x8b
> Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI:
> 'bad' packet ignored for type 0x8b
>
> Because NC-SI interface is up, so I just ignore these errors.
>

These errors can be ignored, it doesn't harm in any communication. We need
to fix this  into the kernel.

>
>
> Regards.
>
> Thu Nguyen.
>
>
>
>

--00000000000059c75905b7a78346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 23, 2020 at 7:59 AM Thu Nguye=
n &lt;<a href=3D"mailto:thu@amperemail.onmicrosoft.com">thu@amperemail.onmi=
crosoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi All,<br>
<br>
<br>
I&#39;m verifying NCSI with my Mt.Jade platform.<br>
<br>
In Mt.Jade platform, we have the shared NIC in eth0 interface and <br>
dedicated RGMII in eth1 interface.<br>
<br>
I used below steps to enable NC-SI in Mt.Jade.<br>
<br>
1. Add definition in DTS for MAC0:<br>
<br>
&amp;mac0 {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D &quot;disabled&quot;;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D &quot;default&quot;;=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_rmii1_d=
efault&gt;;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D &lt;&amp;syscon ASPEED_CLK_=
GATE_MAC1CLK&gt;,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &lt;&amp;syscon ASPEED_CLK_MAC1RCLK&gt;;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D &quot;MACCLK&quot;, &q=
uot;RCLK&quot;;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 use-ncsi;<br>
};<br>
<br>
2. Add build configure to enable OEM Command to get MAC for NCSI.<br>
<br>
CONFIG_NCSI_OEM_CMD_GET_MAC=3Dy<br>
<br>
After these steps, My system can detect OCP card, can get MACs and both <br=
>
eth0 and eth1 interfaces are up.<br>
<br>
I can access BMC Web use both ip of eth0 or eth1. The same for Redfish.<br>
<br>
BUT I can only use ipmitool with eth0. Ipmitool command not work with <br>
eth1 interface.<br>
<br>
<br>
Check the setting of phosphor-ipmid-net in<br>
<br>
meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_access.jso=
n<br>
<br>
meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.jso=
n<br></blockquote><div>You have to configure in this file for eth1 as well.=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I can see that ipmid is configured to listen on both interface eth0 and <br=
>
eth1.<br></blockquote><div>How do you make sure it is listening on both int=
erface=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Do I miss any configuration here?<br>
<br>
<br>
Check the journal log, I saw some errors and warning from NCSI:<br>
<br>
Dec 23 10:14:50 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: <br>
Handler for packet type 0x82 returned -19<br>
<br>
Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: <br>
&#39;bad&#39; packet ignored for type 0x8b<br>
Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: <br>
&#39;bad&#39; packet ignored for type 0x8b<br>
Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: <br>
&#39;bad&#39; packet ignored for type 0x8b<br>
Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0: NCSI: <br>
&#39;bad&#39; packet ignored for type 0x8b<br>
<br>
Because NC-SI interface is up, so I just ignore these errors.<br></blockquo=
te><div><br></div><div>These errors can be ignored, it doesn&#39;t harm in =
any communication. We need=C2=A0</div><div>to fix this=C2=A0 into the kerne=
l.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Regards.<br>
<br>
Thu Nguyen.<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000059c75905b7a78346--
