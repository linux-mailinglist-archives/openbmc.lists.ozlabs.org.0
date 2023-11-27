Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A67FA42E
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 16:12:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JMW9Ng/y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf8GD15n3z2ygx
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 02:12:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JMW9Ng/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf8Fb0cfzz3cRq
	for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2023 02:12:01 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc9b626a96so30916385ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2023 07:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701097918; x=1701702718; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A14//g2UoXkLcdPQSx/k3Kefdj+ue5KGp8TIARcBONU=;
        b=JMW9Ng/yoGNKFWu8vmQcU1UoRlehZyizs7xFTXfI7PRzrWrk8faMDBFM8gS8HobQgv
         vYDlmhN91kJOFN6+YVG3yBq22+Z6OokhmW8nGfE0wHzpegYUrW8CWRjyKWn2Mf8qKs4z
         1uhi4T5cXaJcbm59RTwp+xnKIvhhEBfeaYspPQaIZ7gssIRXN4FnMYFTJBZKXvNOeexJ
         lPDf/pfi25A7E8GE7MbtNqSrXwF6ffUay8xklDVt9ARcSw2PIMBakaT4NTzAdGNqSbPz
         VEwqavcfOKYyPKHh/6kDr6QM9w4/E/J2iOqs71F/EO9w872X+FuOyynshILS2N4iZzvq
         7zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701097918; x=1701702718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A14//g2UoXkLcdPQSx/k3Kefdj+ue5KGp8TIARcBONU=;
        b=OP3nXuU/VPdhHCdXff67yP8KqARZVsTwad6CZHNDnpmsuD0Hure24IngoDvmYR5Om4
         lGCzfq6F9hn3TgjvXOr0Hy95mQgNM9jVuc5loz/lXKINgYWpAadef93ajzl5qFPrIemk
         WJItzfPI8Sb5E+8AjYObFS3omPJED54ORZH1ZRI1o4fIX70//yoxIHYAEO8Ycu778YBR
         4AzKlZ0MwXxS5QvmEjEkuyV9O+KzA0JAwEv2WLJw5VL7HU0mbg39qihpa+aUfiKy8vJm
         oAznwi7MFRn66R10ZAAO3BpJrhPswZVqQtdVTewSewGwuqlVzh6J3nf6BqHJeCTiloRE
         YKlA==
X-Gm-Message-State: AOJu0YyHDNzGoPhSJ/qAhe3EV5NqdNVFT9vXX5wcN5iEXq0cg5Fj6p2K
	IM1PVc4JILFLOnlmUlnrHNSQgI5XEcKkgypGoWFx7HVbf8Q=
X-Google-Smtp-Source: AGHT+IFD5Yhlfu1wvzt/S0Z6RQjPCozzczGVg6VzXL32NvqafhWv5m2ewDPmpfJRhWrDAzc1Y5Sk8oPfeca2QTWxtBk=
X-Received: by 2002:a5b:201:0:b0:d9a:3bee:2eeb with SMTP id
 z1-20020a5b0201000000b00d9a3bee2eebmr12061112ybl.60.1701097530941; Mon, 27
 Nov 2023 07:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
 <ZVzy227f3cIiTmtE@smile.fi.intel.com> <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
 <ZWCJP48WopQdCp6h@smile.fi.intel.com>
In-Reply-To: <ZWCJP48WopQdCp6h@smile.fi.intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Nov 2023 17:05:19 +0200
Message-ID: <CAP6Zq1jrX+Mg70mWA3hEQDBYBU5PmDPdLPPEOZ5o+fSKw053rA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Linus,

On Fri, 24 Nov 2023 at 13:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Nov 24, 2023 at 11:09:07AM +0100, Linus Walleij wrote:
> > On Tue, Nov 21, 2023 at 7:11=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:
> >
> > > > The pin control header provides struct pingroup and PINCTRL_PINGROU=
P() macro.
> > > > Utilize them instead of open coded variants in the driver.
> > >
> > > Linus, I dunno if you are going to apply this sooner (assuming Jonath=
an is okay
> > > with the change), but I have a bigger pending series where this will =
be a
> > > prerequisite. So, when I will be ready and if it's not being applied =
(yet),
> > > I'll include it into the bigger series as well.
> >
> > No answer from Jonathan but I just applied another Nuvoton patch from
> > Tomer, so maybe Tomer can look at/test this patch?
Sorry, but I do not have wpcm450 board to test this patch.
In general, the patch looks fine.
>
> Jonathan acked it  in the reincarnation in the series (see my big one).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Sorry I couldn't help.

Best regards,

Tomer
