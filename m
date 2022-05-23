Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8F5308EB
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:41:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65mx4DwCz3bsP
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:41:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NttK1SU1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NttK1SU1; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65mK3tbcz3bkt
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 15:41:20 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id r23so19689594wrr.2
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 22:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BG1/fzDpHenPJmkgl9u+VQSGIeJA/usktCfvERNdvBY=;
 b=NttK1SU1uQGzaS1CLb4HTCTv/kENWH7fc3L6eskfIZHIBoxSZVD3gC9T3y2FX3alxi
 gQy2/wrEhQCrpTwdaZ31RMvL4iYAZlCFOstF7QmxmQCbSyH8vVyX5Ck+ghuNNC/jE5+r
 mA5esv56HHeTihI29D6UepXuY4BIutJhG+ZUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BG1/fzDpHenPJmkgl9u+VQSGIeJA/usktCfvERNdvBY=;
 b=BfH7R+IZAQv3Hrd2JvfRh8h9awzTcWD4cZZfoIrJGZSF9ks2XGHkZEmgsrf0SK+SAI
 +DAiWh+5ONp0eT5gZu2qM3RO0/zl/9V4m7E2RTb/U3b2A1rYVfhTe40Za31JDC22Ujwc
 gVkbVtLp3sowpO81d9/BODNxdbEVwyal7PDpPyV71qfUCbiYaP8B6LUO7LZGfxQLIQ/6
 xy7DZIAXAGV4YnLd68V7mYvc50GOs975Hzg/DKurvIfOTPIPTSzg/Zq7UgPFo9mc7ecd
 cifyLmI5LEY1R5kYtWrZ4ZUmODjXklUOtU/rOuy4yO/dizIysysw+SPTxEdJO1TKfd2B
 f71w==
X-Gm-Message-State: AOAM532miE/1rOZ4L/a7ZdL5T7mUWkUMhz+GocWmLVDc2rIjNxQ5hXMs
 mb1elVckqThFGzV77KH9qrll01mT5UJPTLz6lLQ=
X-Google-Smtp-Source: ABdhPJyhlVAQaNPxtMSXtRuHBJaYkcJOJ8nRa/3NDiu3FcfkGfhOSvLiBektuHNnghFa4hFeYBOQNLLS+cPKWQkIwcg=
X-Received: by 2002:a5d:595f:0:b0:20d:97d:4d14 with SMTP id
 e31-20020a5d595f000000b0020d097d4d14mr17125843wri.549.1653284472033; Sun, 22
 May 2022 22:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <E6809659-C4B1-45FF-A19A-3DF59B598F2D@gmail.com>
 <3E12FF01-9770-4281-B3E5-33A62426FF1B@gmail.com>
 <6B50C209-4CB6-40DD-B2A0-50B5B207598D@gmail.com>
In-Reply-To: <6B50C209-4CB6-40DD-B2A0-50B5B207598D@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 May 2022 05:40:59 +0000
Message-ID: <CACPK8XdOdO17kmHgWXbW-zW4AsxM43PghOTzya0Ttq1AytLfKQ@mail.gmail.com>
Subject: Re: Gerrit and Jenkins server transition May 20th (Today)
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 23 May 2022 at 00:06, Andrew Geissler <geissonator@gmail.com> wrote=
:
>
> ok, jenkins and gerrit are back up and fairly functional. Still a few kin=
ks
> to be worked out in the #infrastructure discord channel. Please report
> any issues there or to me on the mailing list.
>
> Autoassign of reviewers does not seem to be working in gerrit so
> for now you=E2=80=99ll have to manually add reviewers to new reviews.
>
> I need to work with the Linux Foundation to add a SPF record
> for the gerrit.openbmc.org domain to help make the emails not
> look like spam to people.
>
> I=E2=80=99ll work on getting opengrok back up and going sometime this wee=
k.
>
> During this maintenance window I moved the apps to a different server,
> I upgraded gerrit and jenkins to the latest stable versions, and I
> moved our gerrit server to the gerrit.openbmc.org domain. This way
> we=E2=80=99ve now got gerrit, jenkins, and opengrok on the same domain.
> The old gerrit domain should still work fine (I just redirect it to
> the new domain)

Thanks for your work maintaining our services Andrew.

It's a minor detail but I think it's helpful that these services are
on the same domain now.

Cheers,

Joel
