Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16470F0B
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 04:17:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45t2DS55V6zDqWJ
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 12:17:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="enwqPukv"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t2Cs1w2czDqS6;
 Tue, 23 Jul 2019 12:16:38 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id r4so29955186qkm.13;
 Mon, 22 Jul 2019 19:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GgnchVxa85kofAIjboqJCKA6VShjGUyfwivNl63GJ8=;
 b=enwqPukvvi2Os0t54GJuz6TCm4CbxxKrSuAL/QdPmtJdzjuFCj+I3xLRmS9ubxIVnU
 BmX3XK1IKQ5Bp0Kt/rsUlcMLdEBkkWjkLRdZWwI1i4MFfM4/gIPrgaFA4uZFUnjSXwTo
 BJKEsm19zmW8OfM4acCvQ/4de/DyLISE1/szE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GgnchVxa85kofAIjboqJCKA6VShjGUyfwivNl63GJ8=;
 b=rAZHRSGQsQxMyq9+fDiBDl+mya7iSdH3aJbydRgz4TkzLhOKiSTq5I8eHi0bDdOfkV
 tUL4ThBJBKFlDIAuUtuQGSsbZhqz/B73UZWrdVZIh161/JZLl4JHp8PYrT8oVm/j3lO9
 +g82Wa8sZ6bI50CbfyW5zZt2+IJPZeRRmlyBCdsaTgD4je6zQM/OsdrWZ74QsS192v/m
 T2l/FWKffZ/Ru/iMwWa6XLOSf67wy1w+RqKJ/ho15xRi1R4oVJgx5/bjkFy/JOFdzdpo
 d9fyOtGo+rIqalokuTjwKx+5MNczW/V57n7jUCGgTt8HKtTzAip4nZ+Lttu8/of4dePe
 zk6g==
X-Gm-Message-State: APjAAAWFBROUJUJ3yK2HqWsLeg7bH7M8/NYUuRaMBNdtzAxGXMmeXLv3
 +iIxvrIiXAiDWEDZteRrdXkAvMz1S+MUYsxAjZU=
X-Google-Smtp-Source: APXvYqxU3suR2c+fS3yT0aq2lqnTUt++7MYnhK9oL6tGmvBmBmm6edtD6GqRPtAqNuBdgfYwI2gPuRDH4KkZOah0kFs=
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr49006146qkn.414.1563848195224; 
 Mon, 22 Jul 2019 19:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190723003216.2910042-1-vijaykhemka@fb.com>
 <a0a8162e-c21b-4b3d-b096-1676c5cc9758@www.fastmail.com>
In-Reply-To: <a0a8162e-c21b-4b3d-b096-1676c5cc9758@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Jul 2019 02:16:23 +0000
Message-ID: <CACPK8XddLM934ArbA13GEN6m9KpgOkQattE5p8qBpv-yL4mJ9Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: tiogapass: Add VR devices
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Vijay Khemka <vijaykhemka@fb.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jul 2019 at 00:40, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 23 Jul 2019, at 10:04, Vijay Khemka wrote:
> > Adds voltage regulators Infineon pxe1610 devices to Facebook
> > tiogapass platform.
> >
> > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, applied to aspeed's dt-for-5.4.

Cheers,

Joel
