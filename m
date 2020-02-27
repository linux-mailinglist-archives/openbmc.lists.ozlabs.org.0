Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF51710C1
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 06:57:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ShlH0FWGzDqdT
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 16:57:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AFGunOiD; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ShhT5PxwzDqqJ;
 Thu, 27 Feb 2020 16:54:49 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id l16so1469190qtq.1;
 Wed, 26 Feb 2020 21:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E2Lzw+6DwIXD5wFIdGhdMkBNEqUvLgerW4Hymt2eRxg=;
 b=AFGunOiDTG9tUPYAnoVO+elFcJSM3Whfz90g8CbpJOtUYOijJJZriLWq9n8qE6lJT1
 i4dHPMZdW8OhQtDMX5HxuWkwbDdB0jJnc+s+eMT6QS5whv9ZInYZY9K8S1pOGjMU+Dtf
 tyFC4J9uj5HsUQ0/+A44qRNAPPWY2CCtzm0Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E2Lzw+6DwIXD5wFIdGhdMkBNEqUvLgerW4Hymt2eRxg=;
 b=cupVMbshDme7jy1zWvHBh45v1yF1NOSQ23ZJnaUhIhlbEZ96ZHrMoABXouy+miqB82
 nGinAnXhvVAQ0lXqL4CrtWBCh/XPOEyxQPdf9Nu9ISHflGErYxBSXZyrGqWu6ywZ1saC
 +pFeTK8WXCtfn9KUwRDA0Q7esXhl3UcdjnZf9zQob/iL8HFjZEaTU7UGu5551T5JCYq6
 hNYQVCWk+G77QrcggSQ86JfmmshhdcVW+guc+CZ2Saz7axRxUvoJZuI3J52Et+lRTlUe
 AV/iFfReu1fsMzjupnroPCFPThNu56M1HyeKonGtEzEkHbucrMyF97jFCyhCcdQeGMKa
 Ovkg==
X-Gm-Message-State: APjAAAVooAtxkbCYmvp62X+Tx9iCkRpqg+XvIU2/cyLgoIjmH2Tr8hPw
 qN0+oI1VNQTEWie77XhXrjuQGeBRTq3Ma9SXgpg=
X-Google-Smtp-Source: APXvYqzkUWO9RFM7Di6p87wS+Vk/jUfjgdcxe/+ZDF1v3BDViIFdLlrzgrk/5NcaTxAv+I2EX+x/Rkh3OZXw908Xzio=
X-Received: by 2002:aed:3841:: with SMTP id j59mr3043607qte.220.1582782886154; 
 Wed, 26 Feb 2020 21:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-7-rentao.bupt@gmail.com>
 <83d7b817234f99c92272f7950129c56a58f4de54.camel@kernel.crashing.org>
In-Reply-To: <83d7b817234f99c92272f7950129c56a58f4de54.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Feb 2020 05:54:34 +0000
Message-ID: <CACPK8XdkPLZVJTpAc2u3Q0W0KoRrC4hfHjy27VKpGDRF45JByg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <taoren@fb.com>,
 Tao Ren <rentao.bupt@gmail.com>, Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 27 Feb 2020 at 04:11, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-02-26 at 15:03 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Add "aspeed,vhub-downstream-ports" and "aspeed,vhub-generic-
> > endpoints"
> > properties to describe supported number of vhub ports and endpoints.
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will take this patch through the aspeed tree for 5.7.

Cheers,

Joel

>
>
> > ---
> >  No change in v2/v3/v4.
> >    - It's given v4 to align with the version of the patch series.
> >
> >  arch/arm/boot/dts/aspeed-g4.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
> > b/arch/arm/boot/dts/aspeed-g4.dtsi
> > index 807a0fc20670..8e04303e8514 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -164,6 +164,8 @@
> >                       reg = <0x1e6a0000 0x300>;
> >                       interrupts = <5>;
> >                       clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +                     aspeed,vhub-downstream-ports = <5>;
> > +                     aspeed,vhub-generic-endpoints = <15>;
> >                       pinctrl-names = "default";
> >                       pinctrl-0 = <&pinctrl_usb2d_default>;
> >                       status = "disabled";
>
