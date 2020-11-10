Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3892ADF1D
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 20:12:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVyCk1sx0zDqXg
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 06:12:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=r80v3VWG; dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVyBy6RXZzDqQY
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 06:11:21 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id j12so15474631iow.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 11:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTSuDNDYSe81ijtHljKfmTmzyHVfo+VIhH7cQOIP0Ho=;
 b=r80v3VWG8SZX0J461hA8M8exnptTvCUMc9rB+P4O8YfW/lFuz1b5Ffw3P14o5e4pIT
 tJ9gJ4j2ljW24r4JjZzrllOfyH342yu1PbUioHsSoR8ZJ9EMBoZpyMBZO/Cy8G+vjJQZ
 AOvig7dQ4F/V0oWb5EnwnaRF1I2YDZwE9LPJWOlE/lzSVPHdhUiW90pu1oD02l27+qAX
 I1tC43k9WjSeE4e3N7XuJSwB8I+zico3gqXBF6a6xC21enJD14x73KI6ci6KtZSJsrki
 Y0/nmXjbVcq7/V3FTavprdNvME/wAPJ0bgkrB3hyaycelrRqbd3x+3b6QCC68rcaPm6Y
 SgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTSuDNDYSe81ijtHljKfmTmzyHVfo+VIhH7cQOIP0Ho=;
 b=EtKTvZIGBdQi/CTjA5cBk2hvZulPAFHCohxEK6jhFBf8mmxb9+qkjLPbvF4pd8nhBW
 R+BXiKPBdB1bcD7/WoQlZUGf83YPifUZJZSAnqiwS5eOvU5Ib3oOg3TI2Tyz+roeUZQJ
 fDGnic5lkRaRQvEjnqxjyRlykP7eoIPMYuJ1TVeF3iXV8MWi2TTCGzIV8nTeIbJ4LbgJ
 crc712WYZ4ZmCUmGWGP4mXHc52TvAPF+QWOO5tTxQHKndwLPGlGYjP4Drx536KBBFsg5
 f2HsDhYkggh7U4q/2SqXTSVTUC0QBhbY7ahhHkWjiiadlPTjhMCq35CHH3m2kS122fhL
 Wvvg==
X-Gm-Message-State: AOAM532v1V3LmzIV6Q0/ZF+5ug6CtpCAMO9RkfKPP34YgV48A/SSu6SU
 dB2qjxYUOEesJLiUtxCNFDUEoVmZbCHrVczxymfagA==
X-Google-Smtp-Source: ABdhPJzCCuajijbnczUXCttS3+TwZyPbLFUjEY7v6ePFPUGD0oLpMKk8Dm2jVVqhh1xyjzbsEFvJnLReGmJD3NRrV/s=
X-Received: by 2002:a5d:9a0e:: with SMTP id s14mr15698345iol.108.1605035474883; 
 Tue, 10 Nov 2020 11:11:14 -0800 (PST)
MIME-Version: 1.0
References: <ded34fbeabec4b59a604726ca9669f6f@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <ded34fbeabec4b59a604726ca9669f6f@SCL-EXCHMB-13.phoenix.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 10 Nov 2020 11:10:37 -0800
Message-ID: <CADKL2t7cxMi1-batxpmL1nyHYrvAfW+k-z5DhLLZG=+ywAoyvQ@mail.gmail.com>
Subject: Re: With phosphor-pid-control OEM-IPMI Commands to talk to
 Phosphor-pid-control Manual Mode
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Bruce,

You can add additional IPMI sensors to directly control the PWM values
of the fans when manual mode is enabled.

There's an example configuration here:
https://github.com/openbmc/meta-quanta/blob/529a8df55b2af8eed0d1eb0594a162cfff631aab/meta-q71l/recipes-phosphor/ipmi/q71l-ipmi-sensor-map/config.yaml#L100

Benjamin

On Tue, 10 Nov 2020 at 09:24, Bruce Mitchell <Bruce_Mitchell@phoenix.com> wrote:
>
> With phosphor-pid-control OEM-IPMI Commands to talk to Phosphor-pid-control Manual Mode
> "that something will be controlling the fans via the other commands."
>
> Do these "other commands" are available anywhere for Manual Mode?
>
> --
> Bruce
>
