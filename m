Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B446ACF1
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 23:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JPD6kxnz3fbT
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 09:43:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=C8PGqD4W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=C8PGqD4W; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7JKB2mD2z3cPh
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 09:39:57 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id d2so12755029qki.12
 for <openbmc@lists.ozlabs.org>; Mon, 06 Dec 2021 14:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0dlCpKXDdnB3LdPyRqxmoynTirH+zzLw2AsoXketLHY=;
 b=C8PGqD4WFo5043ppfpJ+22mFPpx9J4+FCsksvGJSjIZy2qGcm2LFrh5x3luh/dmrLL
 5x4P4YchSM3ngUe6Rp4BED3CuaAtHSnf/iDMApCbiNjTWy5buyfbGgP4BYcsCFxPwuCy
 nD+r0zOohf64uWGzNdI+hkmspQFiyRUeIZDPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0dlCpKXDdnB3LdPyRqxmoynTirH+zzLw2AsoXketLHY=;
 b=DkdzEP2rhPrwGcotOMEE6b5Mb3jotECWbzKaWSZtp1w1Zbctk79OA5+wgZPYx1DUqd
 1PvrcHE+C7Mw3uyJrrYzm+iB0gKIch/iLAsGtacnVR8bv2DuV0TuQvV/yEoW5In97fSi
 FrKSChaheG8Y/tQ7n3mrMn2RpsMTmfqPTnyB+SXPCA0SDl/fmOc7r9i+JBOJPsTuZvxU
 QxiBqAbOOiwzhpQWQ2cLUP7rY0hw7K5jhUjlWuCy9dyEFMmDeEN+IhD73EASmQLpExqR
 5X183eVvrm8x8d2XBR2R73aVswbPaKquyEkUoCceeBQVJIlU5zF4W6QEXr62gxKo6BIu
 MAfw==
X-Gm-Message-State: AOAM531RX9x3hgGyfYCGWl03FqCTjrCNmoFiFxZLaEfFnVycFfppSze2
 vk55dlph5I+s2hWFgG3M1g53NJi/HqZFC6FUZZc=
X-Google-Smtp-Source: ABdhPJyb002MRzrnUdhH9jS3C2gNvzDmA6eDyqdysvyoYDDESa1vOVbcFbpObTHjWxRlkJmOBPsnhAY36sZ2EyLoN44=
X-Received: by 2002:a05:620a:4081:: with SMTP id
 f1mr35618826qko.165.1638830393102; 
 Mon, 06 Dec 2021 14:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20211119120057.12118-1-a.kartashev@yadro.com>
 <20211119120057.12118-3-a.kartashev@yadro.com>
 <FA1B4FAF-387D-4D71-952A-D44B493FC67B@gmail.com>
 <368313b889cbadc267b053cd808b080e9f6470a0.camel@yadro.com>
In-Reply-To: <368313b889cbadc267b053cd808b080e9f6470a0.camel@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Dec 2021 22:39:41 +0000
Message-ID: <CACPK8Xcpg+V7BB6vq8oqqu=g7FRoTLLmz7-4G5Cp=hn0ziEuyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for YADRO VEGMAN
 BMC
To: Andrei Kartashev <a.kartashev@yadro.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Nov 2021 at 15:51, Andrei Kartashev <a.kartashev@yadro.com> wrot=
e:
>
> >
> > Can we utilize
> > https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-na=
ming.md
> >  to get some consistent naming across the GPIO=E2=80=99s on OpenBMC mac=
hines?
> >
>
> Some names here are standard for Intel daemons like x86-power-control,
> host-error-monitor, pfr-manager, IntrusionSensor and so on. Other lines
> just called same as in schematics to make it easy for our engineers to
> understand what does it refer to. BTW, most of the lines there not used
> by software and appeared just because dts files are supposed to be
> hardware description and thus we describe all we have in schematics.
>
> We can rename all this according to guide you mention, but are you
> sure, there is any sense to do so?
> Keep in mind, currently there are lot of dts files which also don't
> follow convention, so I believe, it is unnecessary work.

I have a strong preference for using the naming document. It provides
consistency, which makes it easier to review. I'm encouraging that for
any new dts.

If you think it makes the descriptions less useful for your platform
then that's a reasonable reason to not follow the convention.

Cheers,

Joel
