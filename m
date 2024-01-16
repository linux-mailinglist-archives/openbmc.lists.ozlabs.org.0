Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C782F597
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 20:40:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IuwrS5wV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDzrG4TcFz3cWZ
	for <lists+openbmc@lfdr.de>; Wed, 17 Jan 2024 06:40:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IuwrS5wV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDzqf07R9z2xPb
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 06:39:57 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5f254d1a6daso104948907b3.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 11:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705433995; x=1706038795; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/TXrWyHiiSTgpveq6sOiQ38RhpDY6Y4heRubaDLwPmE=;
        b=IuwrS5wVTrcLUagsCa+NwnIybyFkiKoEIwfUBiKRmQT2qBaG495nYbGUkJJbZwGv5G
         3/hKouAT6D3R2y5l4RZb38P2txMybBe8EtjhACMDQGgQxAG+brwMwqE9o6JKp/hH8emj
         igqY7Q6Z4Ld7psW1fFiqChhJAE+QDp1P9Twy3v72KX2uUbbS342GS2MVvTM/QWFLiiS5
         vcqEwu/GB1PI9lzmv1O3e9I1bW+tHtDlzXKEwwxSb5AmJezFsk288tMprvlRg7UD6L4Y
         2V0hpP6HDl2o75TcotqqXXVw94UHfMuLaMSZDMiEHXpbJr4/T17dJQVwXVeUgigWJevK
         uqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705433995; x=1706038795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TXrWyHiiSTgpveq6sOiQ38RhpDY6Y4heRubaDLwPmE=;
        b=dsS+AD0FSMOYhRiN3hwnQCXmQrvtCGyNkuIMF1h9EH584/Loo1q5XJqvDzI8LxJ40D
         WpsHwEG2nrBMlTVKBRd4hYXljNdlh5gDMSVRGRaO4Qk4XT/3Muqda/2nEvGfdxifbEnm
         iaRCBekwDHFelZSFk+WTk5tAN2yB08gzpFtf5TfrG7n30tE0yDBV0v3w78HCPCSlID4+
         bBYoN79ttn7vkda9nWnmeGve6g+OK/3k6EGaiG5IadwOW5uLFE+9SxHDY9IdrjQnIKGd
         3ZExBXCb1Nx/ZlUM0JBhmp5Rz3rHM+H/78upeHH5VuZ7nK5s/vRoFbXjeF/Kyt8EMEUz
         yZGQ==
X-Gm-Message-State: AOJu0Ywh82n4ZtT5ZvaSfpbBYvMdK1vgLiyAF0uRTMmFnlhB4zJx9VOP
	ksQcUOnHkQ1XQyNf0U201K4mDqKDrJEob45CAvM=
X-Google-Smtp-Source: AGHT+IHl7pQB/4BopFUtAbosETyvinXpzrfJUa2QsBn7qAYwOuBOVtdkXkA/phlJcO5qEAjLc6AKbVoymoezexRzl3E=
X-Received: by 2002:a05:690c:f90:b0:5ff:56b4:263e with SMTP id
 df16-20020a05690c0f9000b005ff56b4263emr1259306ywb.101.1705433995037; Tue, 16
 Jan 2024 11:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-8-tmaimon77@gmail.com>
 <23fdd643-ae30-474b-93b0-fb98edeb0071@linaro.org>
In-Reply-To: <23fdd643-ae30-474b-93b0-fb98edeb0071@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jan 2024 21:39:44 +0200
Message-ID: <CAP6Zq1i88mx8hfE-Ui_yMDOUxB5YofyyRSygBY8zuPq71ptHqg@mail.gmail.com>
Subject: Re: [PATCH v22 7/8] arm64: dts: nuvoton: npcm8xx: replace reg with
 syscon property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comment.

On Wed, 10 Jan 2024 at 22:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/01/2024 14:54, Tomer Maimon wrote:
> > Replace reg with syscon property since the clock registers handle the
> > reset registers as well.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
>
> NAK for the same reasons as previous patch.
Will explain more in the commit message
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
