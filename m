Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1905ED2F0
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 04:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McgDH2ZFVz3bqC
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 12:19:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nefqe+Fz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nefqe+Fz;
	dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc7kV5hLVz3bWD;
	Tue, 27 Sep 2022 15:40:16 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id p89so3180204uap.12;
        Mon, 26 Sep 2022 22:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QTN9woxXFcZ1B22TaNt+M2OlK5+NuCKF6rneg/pTS8k=;
        b=nefqe+Fzu7FL67p7NmZlmHkExpdYpDN58pj800AojlVmCbxVq/4C3xCZLp2/qeoEav
         q+5hXd25ruYXF0zU11P2OyB8SSctH0EhNRG4BQvHbcicLoNBqiDXjq6+8micctvBL7N7
         RdVpV+jM0s1ZBVHRwHHyXYNV7M++2H20xGUA75zttY7h9Uy3QrtXgRKMtJ8VnVSadPF4
         r1DG8A3sxxUtKdq3KKYURdTmG8rPbV5t7yrGhHNvaK9vAiY2B2JeVPvICC1a1b6lUwhg
         l6OC3jsVaKSrDsj8Wwa/8w8VccSe8FcpM8wiTfxAeXmnIb7MUcX92GuV2lSCiRZdKQZ7
         cGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QTN9woxXFcZ1B22TaNt+M2OlK5+NuCKF6rneg/pTS8k=;
        b=ZJ0tcILq0+o2TF1eQwhPB7zrOgMx5e6EZxrDZktX3RwZS+OIcPyQmDVPUMa7OKhQ+O
         PPPJiVXbHPEl0aKuzOuD2f7H3IxVcMOrhzd5tm6dW8enz6GSwTzNWvoj2eVtPoe5nPA7
         TgxgV0ZPDPwUaUeizN9gc0crhVuozYXEbutRMTkbAKrFOhYGBS1CWGVoWB0Furd9E3M6
         dGM3kfEZjuBSWI6tXcbcjsxuD8+re92FWTCAQRGWuNYHy2RQ9emSNfiMnWDeRjAa5RhD
         rRbEiTISMZKbUuu52vnYhugsWRuDTEAXpQamX3mivkDcgj21D+HFTPnfrckjizOEQCwb
         Eq9Q==
X-Gm-Message-State: ACrzQf0/UXZT2/3cQ3HbTnGvwJRTzcLtvtQpijq9bIkDUfFI+qLMnlGY
	8MP097Jyg0/uK5EGxXAWm20c0QYHHsFcG/yr7vI=
X-Google-Smtp-Source: AMsMyM7npJglADKz4LBSl01MdihNLIEVPirVQlcbX0pPsSWRAvmG6KVW5oXnfVQaktSTpfjNOjThHptlYFCbjadj+fo=
X-Received: by 2002:ab0:6602:0:b0:3c5:9b66:4cd2 with SMTP id
 r2-20020ab06602000000b003c59b664cd2mr10208649uam.8.1664257212813; Mon, 26 Sep
 2022 22:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220926124313.GA8400@hcl-ThinkPad-T495> <20220927015130.GG30806@packtop>
In-Reply-To: <20220927015130.GG30806@packtop>
From: karthikeyan P <pkarthikeyan1509@gmail.com>
Date: Tue, 27 Sep 2022 11:09:59 +0530
Message-ID: <CA+ezb7hdM7KZrEVVFHGQmMbeFe-5-WXKnnVOzR6p+=SGW1mMvg@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="000000000000fc140f05e9a2130c"
X-Mailman-Approved-At: Wed, 28 Sep 2022 12:19:09 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000fc140f05e9a2130c
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Tue, Sep 27, 2022 at 7:21 AM Zev Weiss <zweiss@equinix.com> wrote:

> On Mon, Sep 26, 2022 at 05:43:13AM PDT, Karthikeyan Pasupathi wrote:
> >Added IPMB-13 channel for Debug Card communication.
> >which improves the readability of the machine and makes
> >it easier to debug the server and it will display some
> >pieces of information about the server like "system info",
> >"Critical sensors" and "critical sel".
> >
> >---
> >--- v5- Updated commit message
> >--- v4- Resolved syntax error
> >--- v3- Updated the title and commit
> >--- v2- Updated the title
> >--- v1- Initial draft
> >---
> >
>
> Note that git treats a '---' line as a separator, so everything past the
> first one above will be discarded when this patch is applied (e.g. via
> 'git am')...
>
> >Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
>
> ...including your S-O-B line here.
>
> If you're aiming to do something like what Joel describes on his blog
> (https://shenki.github.io/git-patch-workflow/), you should make sure put
> your first '---' line and any non-commit-message notes *after* your
> S-O-B and any other tags.
>
> >---
> > arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> >
> >diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> >index 8864e9c312a8..84236df522dc 100644
> >--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> >+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> >@@ -215,6 +215,17 @@
> >       };
> > };
> >
> >+&i2c13 {
> >+      status = "okay";
> >+      // Debug Card
> >+      multi-master;
> >+      ipmb13@10 {
> >+              compatible = "ipmb-dev";
> >+              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> >+              i2c-protocol;
> >+      };
> >+};
> >+
> > &pwm_tacho {
> >       status = "okay";
> >       //FSC
> >--
> >2.17.1
> >

--000000000000fc140f05e9a2130c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! <br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Sep 27, 2022 at 7:21 AM Zev Weiss &lt=
;<a href=3D"mailto:zweiss@equinix.com">zweiss@equinix.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep 26, 20=
22 at 05:43:13AM PDT, Karthikeyan Pasupathi wrote:<br>
&gt;Added IPMB-13 channel for Debug Card communication.<br>
&gt;which improves the readability of the machine and makes<br>
&gt;it easier to debug the server and it will display some<br>
&gt;pieces of information about the server like &quot;system info&quot;,<br=
>
&gt;&quot;Critical sensors&quot; and &quot;critical sel&quot;.<br>
&gt;<br>
&gt;---<br>
&gt;--- v5- Updated commit message<br>
&gt;--- v4- Resolved syntax error<br>
&gt;--- v3- Updated the title and commit<br>
&gt;--- v2- Updated the title<br>
&gt;--- v1- Initial draft<br>
&gt;---<br>
&gt;<br>
<br>
Note that git treats a &#39;---&#39; line as a separator, so everything pas=
t the<br>
first one above will be discarded when this patch is applied (e.g. via<br>
&#39;git am&#39;)...<br>
<br>
&gt;Signed-off-by: Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeyan=
1509@gmail.com" target=3D"_blank">pkarthikeyan1509@gmail.com</a>&gt;<br>
<br>
...including your S-O-B line here.<br>
<br>
If you&#39;re aiming to do something like what Joel describes on his blog<b=
r>
(<a href=3D"https://shenki.github.io/git-patch-workflow/" rel=3D"noreferrer=
" target=3D"_blank">https://shenki.github.io/git-patch-workflow/</a>), you =
should make sure put<br>
your first &#39;---&#39; line and any non-commit-message notes *after* your=
<br>
S-O-B and any other tags.<br>
<br>
&gt;---<br>
&gt; arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++<=
br>
&gt; 1 file changed, 11 insertions(+)<br>
&gt;<br>
&gt;diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arc=
h/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt;index 8864e9c312a8..84236df522dc 100644<br>
&gt;--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt;+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt;@@ -215,6 +215,17 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; };<br>
&gt;<br>
&gt;+&amp;i2c13 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 // Debug Card<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 multi-master;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ipmb13@10 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ipmb-dev&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;(0x10 | I=
2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-protocol;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt; &amp;pwm_tacho {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0//FSC<br>
&gt;-- <br>
&gt;2.17.1<br>
&gt;</blockquote></div>

--000000000000fc140f05e9a2130c--
