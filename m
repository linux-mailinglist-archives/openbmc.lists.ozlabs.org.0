Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E440A99B
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 10:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7xqf16n9z2xYd
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 18:49:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c5tPyY+f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=c5tPyY+f; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7xqC1Vc9z2xYL;
 Tue, 14 Sep 2021 18:49:27 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id jo30so2942889qvb.3;
 Tue, 14 Sep 2021 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kZbfoEVulrDx1Gl910iornRBFREc6lBaGxEiImtHPGA=;
 b=c5tPyY+fKzhyRWLi59c3P1kuVz+l1lwjCZXF+vLWeNOF6KTW742ARrsJ3Df2Ns25kk
 iP5NXmlb5XvtMY4kcv/go7Tj1YQLybdlraZr88WdBGtSQ0IKDgCKtKTQ8j5b+ljNKWYp
 Kyfbr1TAFb3Lgtz0HGt/0vjH6e3z4UoNdi4iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kZbfoEVulrDx1Gl910iornRBFREc6lBaGxEiImtHPGA=;
 b=KHrpIhJYxqnFGkq0MihCFQYgkWXhTES0TGFw/vOQ4UCh3AyhqQQYjpn2uMRMPZH8oX
 j0S6Z+nIqT4jP3QqC/2A8jV+SPc5epP0y3C16OeuUYtUP6eTD8RRvDrtxwvNXiJ8nBuL
 Ptzvp6DDsFTHvW/A8XR9Df2R9oe/A5BQYViePqsLuVv7TrR3iEgU2t46yFS+NiEYTycv
 py7wszWlAi71ch3xIYp6QRuhfZNfnhLJhzqtGs8Z/Y6XseXS7P8tSbka87y/YG2POfVX
 psmrFgkJCIWdk72qq8LNZxPq4SNomNMFRPhxXtNrW2mw+oZaI7FSdkZUxt0cFZZRrz5F
 8e5Q==
X-Gm-Message-State: AOAM533N3BGPZEQWFTdfuzDgqUOyYv3AGW0VdVuPfFecbeNShND9ih09
 kI4yA1SWYkZe+3dRj+ASLJoXSiFiT/RSeF62BPF/jB0V84E=
X-Google-Smtp-Source: ABdhPJxaZwn5Ez8Pe62lyucUiHQWWy3KKIefn4dH2Md0iaC6mYB/VzAanRaac5LTghEnKuQvccj6MFfoYay9CMmFl2Q=
X-Received: by 2002:ad4:522c:: with SMTP id r12mr4008625qvq.17.1631609363775; 
 Tue, 14 Sep 2021 01:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210910195417.2838841-1-anoo@linux.ibm.com>
In-Reply-To: <20210910195417.2838841-1-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Sep 2021 08:49:11 +0000
Message-ID: <CACPK8XfjF+aiEMLocscMEOw8ebKoT2MK8djvv4voyFOBjumXRg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: rainier: Add N_MODE_VREF gpio
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>, Derek Howard <derekh@us.ibm.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 Brandon Wyman <bjwyman@gmail.com>, shawnmm@us.ibm.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Sept 2021 at 19:54, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The N_MODE_VREF gpio is designed to be used to specify how many power
> supplies the system should have (2 or 4).  If enough power supplies fail
> so that the system no longer has redundancy (no longer n+1), the
> hardware will signal to the Onboard Chip Controller that the system may
> be oversubscribed, and performance may need to be reduced so the system
> can maintain it's powered on state. This gpio is on a 9552, populate all
> the gpios on that chip for completeness.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>
> v2: Update commit message.
>
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 103 +++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 6fd3ddf97a21..d5eea86dc260 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -1502,6 +1502,109 @@ eeprom@51 {
>                 reg = <0x51>;
>         };
>
> +       pca_pres3: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "",
> +                       "APSS_RESET_N",
> +                       "", "", "", "",
> +                       "P10_DCM0_PRES",
> +                       "P10_DCM1_PRES",
> +                       "", "",
> +                       "N_MODE_CPU_N",
> +                       "",
> +                       "PRESENT_VRM_DCM0_N",
> +                       "PRESENT_VRM_DCM1_N",
> +                       "N_MODE_VREF",

Should any (all?) of these names be documented?

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md


> +                       "";
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
>         pca_pres2: pca9552@61 {
>                 compatible = "nxp,pca9552";
>                 reg = <0x61>;
> --
> 2.25.1
>
