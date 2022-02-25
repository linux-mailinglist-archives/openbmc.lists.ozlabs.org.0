Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F142E4C3D0C
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 05:25:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4cBk13RBz3bYq
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 15:25:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DOAO5yiZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=DOAO5yiZ; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4cBN4RVhz3bNg
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 15:24:59 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id fc19so5851295qvb.7
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 20:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1LF2myDIlcbvCPXzjY2Na9skCRjs5LmtLz2z25WQDeM=;
 b=DOAO5yiZbP+SWlLEh2xFGspiWNrZLlF7AEuZGNh2i5/xCSU5MUOvrjW/4Fi7Z0mPo6
 WOtwAAVSZ3WOlx0gr+0vF9W0R4QokCkTxI4XC94epcrt34Y8N7h3XL1gzIsdry26zU2Y
 LG+xrw5IXbm17hWrlx5MMM9ax3vi28aw6YiN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1LF2myDIlcbvCPXzjY2Na9skCRjs5LmtLz2z25WQDeM=;
 b=ci0vnBTGdtTF7pjvV2QVC+TD5nX9DnhuTA5GJaIs5y2tqN6QKj/hrt7bsmC/qCKi0D
 hvyo3oj6oBgeEmTuHYectudyysLvv21QchD9mkyZDgw7QBKB/31WeV986wGkF9A0rICc
 VN0ZxDfNTn2jpkfxNQH+aMGJeULRhPKF1od6nPdYLyh8iPlDJ1YYf+xzNeE+tH8atuAN
 w94AIJwqHFAaq+Jv8Y1EZnOhcAKzITH0Ori3Tqfji0w4YWAVS3gfODj60TMQjJzZ1vmy
 BGLPDGC+lrKIYtVZgvCCeGOXo2u5uSV+xcc9qZMmsNiaOIhRYhxAZtsM3731ZEClAmUO
 X5pw==
X-Gm-Message-State: AOAM5333jcew+JGoYu5Jqu2TMSaK6TBNzkKAUfKC6B4xY+7EqaeTE3bm
 SewUau7oVKwYfwMyQ2A2KqtBexju3UPoGTaW3fo=
X-Google-Smtp-Source: ABdhPJyeV19owJaSIMIcpoCeIIkZ5X9QszcQZvRXQxPMiU8bcJiMWlkOnBF0u816SE1gmItosHfeV2JduZh0oUHMxS0=
X-Received: by 2002:a05:6214:628:b0:432:c2db:94e3 with SMTP id
 a8-20020a056214062800b00432c2db94e3mr717891qvx.107.1645763097898; Thu, 24 Feb
 2022 20:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20220225024221.19422-1-potin.lai@quantatw.com>
 <CACPK8XdFGD3wT2C+gnPaVcshnnOgjyq-32qudQWn4VtcHh3SoA@mail.gmail.com>
 <291dfd1a-4519-b130-91d9-af4ea085ff9f@quantatw.com>
In-Reply-To: <291dfd1a-4519-b130-91d9-af4ea085ff9f@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Feb 2022 04:24:45 +0000
Message-ID: <CACPK8Xc-ihjmD_u9H=0Q_sfwjXf9B4zVB3ufDQ7U6r0f3NHw_A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 00/26] Add w25q01jvq and convert flash_info
 format
To: =?UTF-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 25 Feb 2022 at 04:19, Potin Lai (=E8=B3=B4=E6=9F=8F=E5=BB=B7) <Poti=
n.Lai@quantatw.com> wrote:
>
> Joel Stanley =E6=96=BC 2022/2/25 =E4=B8=8B=E5=8D=88 12:01 =E5=AF=AB=E9=81=
=93:

> > This avoids the need to backport the new style flash support from
> > mainline to v5.15. We avoid large backports where possible as it
> > complicates getting fixes: as the patches aren't in mainline v5.15,
> > when fixes are selected for backporting, they will not target v5.15 as
> > the code the fixes want to fix does not exist in that revision.
> > Additionally, large backports carry the risk of regressions, and
> > making our bmc kernel less stable.
>
> I just notice that I missed the reply from Patrick of my question (not su=
re why it was mark as junk mail...), sorry about sending this patch series.

No worries.

> > We still want to do the work to upstream support before adding it to
> > the openbmc tree. That means next time we rebase on a future release,
> > the proper patches will be present. Thanks for doing this.
> >
> > Another tip when submitting upstream: make sure you use
> > --suppress-cc=3Dall, so you don't send the backport emails to the autho=
r
> > of patches you're backporting.

I meant: when submitting backports of upstream patches.

Cheers,

Joel
