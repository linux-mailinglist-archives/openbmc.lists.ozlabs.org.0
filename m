Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371887E352
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 06:44:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l+e6R+QF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TykM80DRFz3cCt
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 16:44:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l+e6R+QF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tyc1D6lk6z3by8
	for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 11:58:39 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3668cdfc771so15749915ab.2
        for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2024 17:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710723516; x=1711328316; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3gO3B8juV9rqE5CX6cYNKDzZwtkK2BD97woO9bfZ3o=;
        b=l+e6R+QFlbedpaABelmH0IIIaknEgNeszAOwb7PZsO1zCsaOipXJo81ebSoKFa3DJv
         IK4OdduYNeghgogeOlE0rzE+f2/BTDBgUQ538lTpBAze7d/9Pqva09Kz0ULtLoW+nlVP
         6ami+bAoAaiGDo7iEPocKyYosiTUtmkM58f5afeTAzCwcWe6Bk/XOLiacFqeoekqk3fP
         Bg9MuyMllSqbpu1pnKfEqqZKO4kPThkoPYZC/UNd2tB2QVUM8WcWtLOzIB9c6ZjJ/8Zs
         VsrfMwA6S6e5OpbgTdDil5nx0VXTEXyz8OFqmOj8aamuswIZlQMmkwc3+0TGfvGI4VeK
         HfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710723516; x=1711328316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3gO3B8juV9rqE5CX6cYNKDzZwtkK2BD97woO9bfZ3o=;
        b=jcV0FarFJPdgtAydP6x3T9WzuQ3/6qhL4pJYYqDLy9atKtakacGdPlsiK6oKFkQh1/
         f/+750A1Li8ewRT58AiWodBVzxwgM9mxAfVGUpjeU9PIFl2ct2cglVzKH5jIePdw4vXE
         lX2WZ4mEQ8dRxK/mWgCgEeW9ZBVuSz1A0AuJPmHZH2XU6BYIUJV0OQ3qGLIV1H/fM2ig
         bdO+y39sAbsUPFRXd6W3r28EPBI2D9YT50ax4IlCxRi7SUjRwmWrWi17xWP+RrnfCCQf
         q7raFe50AzBOIUKpSSRptqZmdn+KZIxKh4af+rtFBR84waMS904wBwfdhYHiC/nMXLJ8
         bdJA==
X-Forwarded-Encrypted: i=1; AJvYcCUVBO4ZVcxFzCR6csUOBmVc6HZMQoa4BCPmf/Fh3IpP6Hv3K+/9tqfrdgs353mV6OgMRpHTbXybQDVSbrepZH4fpgLFMexe0DE=
X-Gm-Message-State: AOJu0YyHcQ6yXqD9d1sR23wHaaHAkeRWmRabb0molNVMvKNBHCI+qUsb
	cMFq/LXAeFxpS4D8P2Tj3ImTXzdH2stX/6Y9ZQoTz62xc1JrWkoI44kDhch1UCRrdD+EU95hP72
	eung4GYeCWm3cgzRWRkm1YPJBiF4=
X-Google-Smtp-Source: AGHT+IEWUqkwZJEiSPp20ajC62MQHxGmIR1eTp3InTtHleO4oWkGUN0u7amI5MFyUz2LLxNgHP9dfiKArtIcMhyjwSM=
X-Received: by 2002:a05:6602:1d4b:b0:7ca:f5f5:46b8 with SMTP id
 hi11-20020a0566021d4b00b007caf5f546b8mr11953675iob.11.1710723516147; Sun, 17
 Mar 2024 17:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-2-kcfeng0@nuvoton.com>
 <9c92dac2-2cec-4f66-a8e1-4c0ccd5a3d0e@roeck-us.net>
In-Reply-To: <9c92dac2-2cec-4f66-a8e1-4c0ccd5a3d0e@roeck-us.net>
From: Ban Feng <baneric926@gmail.com>
Date: Mon, 18 Mar 2024 08:58:24 +0800
Message-ID: <CALz278YKxR4d0k7JApd-ojO-6jNoVG=B+SzBqt+ev9GLfWQPeQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Mar 2024 16:44:10 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, Rob Herring <robh@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

ok.

Thanks,
Ban

On Fri, Mar 8, 2024 at 2:53=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 2/26/24 16:56, baneric926@gmail.com wrote:
> > From: Naresh Solanki <naresh.solanki@9elements.com>
> >
> > Add common fan properties bindings to a schema.
> >
> > Bindings for fan controllers can reference the common schema for the
> > fan
> >
> > child nodes:
> >
> >    patternProperties:
> >      "^fan@[0-2]":
> >        type: object
> >        $ref: fan-common.yaml#
> >        unevaluatedProperties: false
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>
> This patch (through its submission with the aspeed-g6 fan driver) is now =
in hwmon-next.
>
> Please do not resend. Any updates should be submitted as follow-up patche=
s.
>
> Guenter
>
