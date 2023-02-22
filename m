Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BB69EC44
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 02:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLytK3c37z3bmH
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 12:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BO7dpGMq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BO7dpGMq;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLysh2K8lz303P
	for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 12:16:23 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id ec43so23811355edb.8
        for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 17:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cRNyEvUuGlvoTt4ZKJzSO58hgnPW7/JqeCmscwI4NQ=;
        b=BO7dpGMqfut0SqOnU9Jf8ci0SiLjqko2MmGwjcVCZ3pBY2k8Iz1NnV66Cw4LHxxoPl
         0a16MSRpZHHSY25hRTu9WSdXvAX/+hPPoPS8R4YdEDlU8ZRlNNpH91IFGy5yBFyRKj8v
         Jijxf5u8X5YpXpRDFifiLVfdx3pTTuz9lYbVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cRNyEvUuGlvoTt4ZKJzSO58hgnPW7/JqeCmscwI4NQ=;
        b=CMkl66hWcNxWxyxHsKugPi2RBCRzmeEk8Tr0IA/OtnW3igAkBFPAvN9hiOYRL+PEYt
         q9MHfSm2C8yp3+npLgJ24d/jn3bQ4sYV+ij5C5HkQ4cde3g+vhkNgWtnVeQKnaw4oc/D
         rRsAf5hywtq9mZDdQfz0xtfX7SJS98cC6YSigejUdh0UiHIVztTHWBnI3othejU9qGti
         5tPY5Gv1ewYPngHvPjucFwuO6Z171qpG3RMqBbxaqTzQoaLzF0NgIC67szkpW9mZpjbp
         SY00aGY6CjNtUV5tuCBHwTyCkcVGb6zxwjq27MG2UPgeNdky47MPcpkHOZfhRDwYLaaY
         3Qsw==
X-Gm-Message-State: AO0yUKXPimySkxSKyh7ZpPRQjknoEIrMdK2E0NHurby/jvt77uXyqh+p
	2855er/w76a1twneP+MDfuA4GVaRe8SqeEI9v48=
X-Google-Smtp-Source: AK7set96/A/GKWhxbkgUdWqOYQ+uXP27zhUXTPWwQyLnRa00PjZ1+/CO5yjyF2/lbZmnEaSo4XYdS4txLH8wvOOwsOY=
X-Received: by 2002:a17:906:fc1b:b0:8b1:78b7:6803 with SMTP id
 ov27-20020a170906fc1b00b008b178b76803mr8146165ejb.4.1677028575189; Tue, 21
 Feb 2023 17:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20221118065109.2339066-1-quan@os.amperecomputing.com> <46a56ab4-fda5-0125-1148-d7f8d7726cdc@os.amperecomputing.com>
In-Reply-To: <46a56ab4-fda5-0125-1148-d7f8d7726cdc@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2023 01:16:02 +0000
Message-ID: <CACPK8XfW0hkLOiO4X34eGVDVaw-TXnQL6ePR8F_y9uwLRyFgzQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade: Add SMPro nodes
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: openbmc@lists.ozlabs.org, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 13 Feb 2023 at 07:43, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> Dear Joel,
>
> Can I ask you for help to pick this patch to openbmc/linux dev-6.0
> branch? This was accepted in linux-next but not yet picked to openbmc repo.

We're moving to 6.1, which includes this change. As 6.0 is EOL from an
upstream stable perspective I won't pick the patch into that tree.

Cheers,

Joel

>
> Thank you for the help.
> - Quan
>
> On 18/11/2022 13:51, Quan Nguyen wrote:
> > Add SMPro nodes to Mt. Jade BMC.
> >
> > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > ---
> >   arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> > index 353359822d7b..0a51d2e32fab 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> > @@ -354,6 +354,14 @@ &i2c1 {
> >
> >   &i2c2 {
> >       status = "okay";
> > +     smpro@4f {
> > +             compatible = "ampere,smpro";
> > +             reg = <0x4f>;
> > +     };
> > +     smpro@4e {
> > +             compatible = "ampere,smpro";
> > +             reg = <0x4e>;
> > +     };
> >   };
> >
> >   &i2c3 {
