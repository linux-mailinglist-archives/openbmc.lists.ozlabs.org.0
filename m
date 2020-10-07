Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B52868A0
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 21:53:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C64lK6p2JzDqQ6
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 06:53:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Wmd8sOHn; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C64kN3s85zDqMx
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 06:52:40 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id g7so3694517iov.13
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2TZdq+eVqU+/aY3hRkVaedMvSq93CZ/3/ms9az+LBA=;
 b=Wmd8sOHnlsjO4uHyJrbxcFYio8czSvcfWpa+6ajR2nMBjQGBi4IFQtz0b+viQk6xTo
 HLBCOmLwBMIZV+9x8pkJCLaT6sWDsQKkbyHhBPcXbnk3PHrednvLCVd2lMpcPEF9VkhH
 wRfbAhLJlWfc9Oo9hHpmd/gBWooPrNp1uUMFoQNPJ4U7Z/w6Jzw4jLKemJTXbPmRPWbJ
 sSLUZUKjGj9wtYh0/XbkUR2qXnvO4CrbSaHkzrNUpDa0BPDxGZ9J08GAASTV7WE+SGLL
 OqxjB6RFpYJyUCJjBIJsmm7h+QydOjkrRlk4vRqRTTizO67UKM95ubjw4qDY6/VtWvKj
 M2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2TZdq+eVqU+/aY3hRkVaedMvSq93CZ/3/ms9az+LBA=;
 b=S7rOc3+7mFrcZ7uc9DTOY5Wxgbjgh5C6VS0W8xa0/CnYG1nwtMMjlrNSjuQVEK8T3U
 XNP24bf//QU9//4ViSulLXtEt1jbTmnuK3/GUdPZR9ELMakrOJNCCNR6lJgvimS2DGog
 AufiABNpfEckNPT8uyc7WJ9XzXSYXO69EYZJxZIIKnfHKmXR8YIKM37RjxAutvGL4RnL
 1iL2v8V084AQWK+fB0BbWPxWzwis5KHi6fYHRBgkftCmtr8Oa/V8ReTDXfADOgrQgXec
 xP3dqFHCrIG+JPuGlY8kXIsQYFNwbXnsf/Cejy8bM7KJczRhL3q5iUxXmSfmEJWy/hB5
 I3qg==
X-Gm-Message-State: AOAM533tR7vnXbr5HkPo4UuDnsqFBmtObs96AHRcLEP7HFTeLO00Cv8a
 ip6cqUfZQkSasgZRb93ML6+rK7/Vq/mnrET34Olz2A==
X-Google-Smtp-Source: ABdhPJxwTeuw1wSqsQ9eQzgDBJdkpUaURQRH1ndMEQO8nhQXt0XmiPO5tpLgcJeLeDAQFTHMaW0Dlo5VJfs48ojNR3U=
X-Received: by 2002:a05:6638:2395:: with SMTP id
 q21mr4095457jat.94.1602100356387; 
 Wed, 07 Oct 2020 12:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_34CE0CBCEE22E9E6CF3069506723323E9B06@qq.com>
In-Reply-To: <tencent_34CE0CBCEE22E9E6CF3069506723323E9B06@qq.com>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 7 Oct 2020 21:52:25 +0200
Message-ID: <CADVsX8_9dCbBUdpaAtMpf59cmj9cTSn--mQLZaszFT_PeT-zLg@mail.gmail.com>
Subject: Re: How to change the default output serial
To: =?UTF-8?B?5YaJ6Zuq?= <869883681@qq.com>
Content-Type: multipart/alternative; boundary="000000000000a38aaa05b11a0e0b"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a38aaa05b11a0e0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, sgc.

You should also enable the uart2 in DTS:

arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts

There is a code like:

&uart5 {
    status =3D "okay";
};

Change it to uart2 as well.

About the u-boot changes, it might be better to set:

#define CONFIG_CONS_INDEX 2
and define CONFIG_SYS_NS16550_COM2 value instead.

Which u-boot branch do you use? I've checked with v2016.05, there is only
include/configs/ast-g5.h and no ast-common.h at all.

On Mon, 21 Sep 2020 at 01:27, =E5=86=89=E9=9B=AA <869883681@qq.com> wrote:

> Hello there
> I am trying to use openbmc recently. The board uses uart2 as the output o=
f
> BMC. How can I change the default uart from uart5 to uart2?
> The image I compiled on the basis of romulus, first I modified
> aspeed-bmc-opp-romulus.dts, I opened the uart2 serial port in dts, and
> modified stdout-path=3D&uart2,bootargs =3D "console =3D ttyS1" in chosen.
> Then, I modified the include/config/ast-common.h file in uboot , #define
> CONFIG_SYS_NS16550_COM1 AST_UART2_BASE(whice is AST_UART0_BASE).
> Am I doing something wrong? Do you have any suggestion?
> Thanks!!
> sgc.
>

--000000000000a38aaa05b11a0e0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, sgc.<div><br></div><div>You should also enable the =
uart2 in DTS:</div><div><br></div><div>arch/arm/boot/dts/aspeed-bmc-opp-rom=
ulus.dts=C2=A0<br></div><div><br></div><div>There is a code like:</div><div=
><br></div><div>&amp;uart5 {<br>=C2=A0 =C2=A0 status =3D &quot;okay&quot;;<=
br>};<br></div><div><br></div><div>Change it to uart2 as well.</div><div><b=
r></div><div>About the u-boot changes, it might be better to set:</div><div=
><br></div><div>#define CONFIG_CONS_INDEX 2<br></div><div>and define=C2=A0C=
ONFIG_SYS_NS16550_COM2 value instead.</div><div><br></div><div>Which u-boot=
 branch do you use? I&#39;ve checked with v2016.05, there is only include/c=
onfigs/ast-g5.h and no ast-common.h at all.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 21 Sep 2020 at 01:=
27, =E5=86=89=E9=9B=AA &lt;<a href=3D"mailto:869883681@qq.com">869883681@qq=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div><div>Hello there</div><div>I am trying to use openbmc recently. Th=
e board uses uart2 as the output of BMC. How can I change the default uart =
from uart5 to uart2?</div><div>The image I compiled on the basis of romulus=
, first I modified aspeed-bmc-opp-romulus.dts, I opened the uart2 serial po=
rt in dts, and modified stdout-path=3D&amp;uart2,bootargs =3D &quot;console=
 =3D ttyS1&quot; in chosen.</div><div>Then, I modified the include/config/a=
st-common.h file in uboot , #define CONFIG_SYS_NS16550_COM1 AST_UART2_BASE(=
whice is AST_UART0_BASE).</div><div>Am I doing something wrong? Do you have=
 any suggestion?</div><div>Thanks!!</div><div>sgc.</div></div></blockquote>=
</div>

--000000000000a38aaa05b11a0e0b--
