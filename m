Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9D5BF588
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 06:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXQmR7479z3bl0
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 14:44:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TmlOqhrV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=TmlOqhrV;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXQm019xkz2ypV
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 14:43:43 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id n12so7831147wrx.9
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 21:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=o5jkpmZ18TsYujVOQcReN91A+ivuHam5HFxuCyqT+mA=;
        b=TmlOqhrVC+ZjOPHJovIsPap6yN2+ll3p548BvpwFzLh4SDHdahp6xLOt2zjDHJZnaD
         Z3ZFRUYHlbiupc+fKzFQf8i48E8KNItJSeIlvVMQ36h0iDTkip80sSYt8RcL/0eaW8Lk
         t+dFPyu3qgZfzViNWxzOOdpRoHXNsh2Qwp8UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=o5jkpmZ18TsYujVOQcReN91A+ivuHam5HFxuCyqT+mA=;
        b=eWhcsywfxfrSQly+nZb5cHXNMawgip75ySbduyMoFmHWB2EmBioS/jBOZDz77Sxubv
         cb5nKjhkGzcIcI4blbeAc7I3rtAZc46LwAU6GExCy4PteAHqr8JFYDKg6jGKTljfXYwy
         FlzlPwXEeLdYvEgqesGzB3Mf/8Z/YZR84JpeLVQcPbOrutxzqN6TDcSpsqgekxmjZjpL
         zHx+93TkQvvqYw6jiglZKrh7ydSU2C9Awa+JwfDRJ1HeAKrtXpPWdymyftzZNOmXvjpp
         fYyMx794spc22d9FaLYZVdlsQKhIVoeLhsiUTflQWfbuIoDV8iywqp+X3TNapZ4gnKY7
         Hpwg==
X-Gm-Message-State: ACrzQf01rWQAduQov7IX7LDbj1E45WK00t+b3nea6uw/gLIp3tEAlie8
	gMpzf+aBH7awlr5SN42APp0j2L5YsT97bmq/DPU=
X-Google-Smtp-Source: AMsMyM7vnegQhtuLb55FAhWdfI9+cb4plPlx3Vx8akJ6fVmY+vfU/SHfvsPcnl/pCokflF4FWs+c/Z0BAMce4HV6CCE=
X-Received: by 2002:a5d:4688:0:b0:22a:f718:7f36 with SMTP id
 u8-20020a5d4688000000b0022af7187f36mr9875674wrq.315.1663735416567; Tue, 20
 Sep 2022 21:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220817015949.16946-1-joel@jms.id.au> <20220817015949.16946-2-joel@jms.id.au>
 <69899706-70E7-4FB6-901C-3AE0FE2AAA85@linux.ibm.com>
In-Reply-To: <69899706-70E7-4FB6-901C-3AE0FE2AAA85@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Sep 2022 04:43:24 +0000
Message-ID: <CACPK8Xe7Pu4L1URfyzfqO--eGSf5=oEPDhX=o0LUwwh0VvF_9g@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] aspeed/sdram: Use
 device tree to configure ECC
To: Adriana Kobylak <anoo@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Dylan Hung <dylan_hung@aspeedtech.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 29 Aug 2022 at 18:31, Adriana Kobylak <anoo@linux.ibm.com> wrote:
> > #ifdef CONFIG_ASPEED_ECC
> > -static void ast2600_sdrammc_ecc_enable(struct dram_info *info)
> > +static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 con=
f_size_mb)
> > {
> >       struct ast2600_sdrammc_regs *regs =3D info->regs;
> >       size_t conf_size;
> >       u32 reg;
> >
> > -     conf_size =3D CONFIG_ASPEED_ECC_SIZE * SDRAM_SIZE_1MB;
> > +     conf_size =3D conf_size_mb * SDRAM_SIZE_1MB;
> >       if (conf_size > info->info.size) {
> >               printf("warning: ECC configured %dMB but actual size is %=
dMB\n",
> > -                    CONFIG_ASPEED_ECC_SIZE,
> > +                    conf_size,
>
> This should be =E2=80=9Cconf_size_mb,=E2=80=9D?

Thanks, I've fixed that when applying.

>
> >                      info->info.size / SDRAM_SIZE_1MB);
> >               conf_size =3D info->info.size;
> >       } else if (conf_size =3D=3D 0) {
> > @@ -989,8 +989,14 @@ L_ast2600_sdramphy_train:
> > #endif
