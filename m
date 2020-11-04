Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3A2A6DC7
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 20:24:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRGmk2c6DzDqdG
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 06:24:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tgm953Sw; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRGm00KmjzDqZk
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 06:23:40 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id s9so23272128wro.8
 for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2020 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=klwiHJmlQL2u9eZWS3nEX4G0CtkOvBEdzzq3OG4cFp0=;
 b=tgm953SwZeN5omjZ4HV8gbBuqiNBcYmR92ivTIWHAy0tSwth8q6bEkwziN67GCTqWI
 MvadUigP48Kyuc9xjzkhBV9ZA6DvXEYYO7+UK75+BKjQl5oXwfp6knuqip7rxJtGAB3R
 nUIQqlEYo4VFzhOo6rUpWFEFR4fuQRZCZxMOTbrWx49tA6O7TZAOYKG/zRt3J+Bbq5om
 FjJcPKGk71LZe5cT9RRdho8gDu+iFJxmYbmFdA3M0Wn/lIoOflSnkMfNQf6/fFMGR28F
 LjgDmB1ejpC1ggaWuXkuCpNaq9WU26208oZGpJ82Zk62BhPYz1oxtk9EsGoQRreyPC5u
 CLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=klwiHJmlQL2u9eZWS3nEX4G0CtkOvBEdzzq3OG4cFp0=;
 b=UISMXhlDhK0Uth3WMvePKrtHFL739MSQlVodiCRKGVkEhBg6ei6Z9RlYPA4nZy7S8f
 Cx/YrMOHSWLbgG2+LUyzEMYWJLlIZ5FYsg4E6D3vMk+XC/Ipy5V13RORYLXuEtapZxxf
 MV0pcoc4l0ZSiLtQoefaQjssoV5tfCg2+iTcYPeoioa7AJdz7+7PmF0LDnmQk65FYNyj
 hPua5rQLysdYIE/Up9cd0d1vBKPNu1dWOID88u7PPBxZpZIvSO2+Agv+T40kVx5SEPM/
 MMaeeYDwKlv3a2uUnykSypU1LZsQ1svJPiLDl8fWHthUTPJTvjPLTmkELkVbbR7NU1D4
 N2/w==
X-Gm-Message-State: AOAM532G+DdTlcZzFDtQftVXcCMfOY0oUfRGbs3NhU2J5blZrWH2ZfUE
 ixOGOJgc42k6tLAsS8rXD1r9zg7PgLQRMte8iqdA1A==
X-Google-Smtp-Source: ABdhPJy1xhtC1zfxaAh4qiIUkI9zC1ni+4WDXdieYUYVujw9oZMNZBIiKNJSHQY08Ehe9GuKUzqG0dAb2CMtpTNFTV0=
X-Received: by 2002:adf:f4c2:: with SMTP id h2mr33645075wrp.407.1604517814680; 
 Wed, 04 Nov 2020 11:23:34 -0800 (PST)
MIME-Version: 1.0
References: <ce9e26973b2349739e7b8f8d7eb77282@quantatw.com>
In-Reply-To: <ce9e26973b2349739e7b8f8d7eb77282@quantatw.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 4 Nov 2020 11:23:23 -0800
Message-ID: <CAH2-KxBbJ5zDcNnPs+MHtwCL_c6neT0JgcQCLiP0u7v_-5BjjA@mail.gmail.com>
Subject: Re: Question for psusensor.
To: =?UTF-8?B?U2Nyb24gQ2hhbmcgKOW8teS7suW7tik=?= <Scron.Chang@quantatw.com>
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
Cc: "jamwang@google.com" <jamwang@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 3, 2020 at 11:09 PM Scron Chang (=E5=BC=B5=E4=BB=B2=E5=BB=B6)
<Scron.Chang@quantatw.com> wrote:
>
> Hi all,
>
>   I got a problem in creating json file for PSUSensor. Would you give me =
some suggestions for that?
>
>   It seems PSUSensor only support the ability to customize the scaling fa=
ctor for each sensor. However, in our situation, we want some fields, like =
"gain" and "offset", in json to calibrate reading value. And I noticed this=
 has been discussed in last year (https://lists.ozlabs.org/pipermail/openbm=
c/2019-October/018718.html).
>
>   Thus, I wonder whether those fields would be implemented in the future =
?

I have not seen any patches to do this at this time.  Feel free to put
one together, and I'd be happy to review it.

In the future, this question is relatively easy to answer yourself by
looking in gerrit at the open reviews for the repo in question:
https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fdbus-sensors+statu=
s:open
