Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E98D87E7798
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:36:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gv+r1D9y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNHM64stz3cVB
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:36:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gv+r1D9y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRNGp34TZz2yV8
	for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 13:35:45 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9d10f94f70bso259142666b.3
        for <openbmc@lists.ozlabs.org>; Thu, 09 Nov 2023 18:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1699583742; x=1700188542; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DJUfh01EIHtwRrVwYFeUXgIGfR+kF0N4kDWx2BPJ8g=;
        b=gv+r1D9yF0qRW2uNaZ4sSACJ8iJOdvjmFHAOxsFxQpJNC9lkeoSKO7ZG+mzxbjXE22
         Y7HnYfqrKSsI4Agt1t6tTMFSSQrf5HQ+SbR5fti8X/PWsCH3KmBbXsiuCXCO7ZADZCs/
         CULhYuqFHQW1vupb0/zr63CRlXHbp6fhSFgzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699583742; x=1700188542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DJUfh01EIHtwRrVwYFeUXgIGfR+kF0N4kDWx2BPJ8g=;
        b=iqWzxd4Uicnf6REYlg0xTMCVZcUfWnVZFC4MntBqHXkfqYenH9QbeM4r84Ib0A8jr1
         d2+5q7+hPM1rvTczd/eXDnPFkALSl76fVWu+MVw53IN7T4jm6P/yw/AMocPXoYg/nV5g
         fMsEKtrWToKJXLBmCwCIYLzjtELTVHQAsp3grf1+4SF7FT8TsxXX/7rQ/Af92wM59iHs
         dpJmwQ1h3rkDQLvKcRDXdu84bXj7Li3rDtdMzK/mOTR9yNVTNad8KKzgDMncaTlk5pKX
         zKmAXVjqtfMI7/1Ycqejwy8tMHCPovynZA285glxA0v2/xxjp1xwDLT/Uh19Wv7yvmqd
         xL0g==
X-Gm-Message-State: AOJu0YzOrDlbeipoRk2AEp5e5kJGN/fDD5VA1GNXuY2vJN07y8Ca+3I0
	50BClELTi++ebmeqtyb5kHqTDC2NkwcVeXFFchw=
X-Google-Smtp-Source: AGHT+IFDZbXiKxUIFResLsOJR/lKma1ahONHOqIKOMVxfE8zXTt6rE2SsXWS5wVCTcwqTg+mtQsplsPykOSSCk0lYHw=
X-Received: by 2002:a17:907:3606:b0:9b2:982e:339a with SMTP id
 bk6-20020a170907360600b009b2982e339amr4995991ejc.22.1699583741743; Thu, 09
 Nov 2023 18:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com> <CACPK8Xc4NM_F4tBrZZe08r1=RYoe72=DbZNWSaK3E1_i18zjYQ@mail.gmail.com>
In-Reply-To: <CACPK8Xc4NM_F4tBrZZe08r1=RYoe72=DbZNWSaK3E1_i18zjYQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Nov 2023 13:05:29 +1030
Message-ID: <CACPK8Xfb7pG6sTcx3_A8sPAgiC08A6Q8je0R+7c=eUYxuS601w@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Nov 2023 at 21:51, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 8 Nov 2023 at 18:50, Delphine CC Chiu
> <Delphine_CC_Chiu@wiwynn.com> wrote:
> >
> > v4 - Add LTC4286 and LTC4287 binding document
> >    - Add LTC4286 and LTC4287 driver
>
> This is v4, but the first version you've sent to the openbmc list. I
> can't see an upstream v4, and v3 has changes requested.
>
> It would be best if you finished getting review from Guneter, and then
> sent that version to the openbmc list for merging. Include a link to
> the upstream submission in your cover letter so we know what is going
> on.

I didn't get a response from you.

I did see you posted some more patches, both to the upstream list and
to openbmc. It's not helpful, please get your patches reviewed
upstream and once you've got them applied there, then send them to the
openbmc list.

Can you please respond to my mail if this makes sense and you agree.

Cheers,

Joel
