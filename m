Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F53270FD50
	for <lists+openbmc@lfdr.de>; Wed, 24 May 2023 19:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRJmM0kRFz3fBX
	for <lists+openbmc@lfdr.de>; Thu, 25 May 2023 03:57:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=i4QZFnUU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=i4QZFnUU;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRJlm2LkTz2xl6
	for <openbmc@lists.ozlabs.org>; Thu, 25 May 2023 03:56:35 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6042d60b5so14039435e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 24 May 2023 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684950988; x=1687542988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsIopiw9JoRL8YCNOi6lhLXwDxjqhu+fIQ0k1/S9PFc=;
        b=i4QZFnUUnRM5pMHJD/eF2XZjg4VTcYJ4Yf8g7gpdTitkPOnvmoYZIEElvLLPOs3H9K
         y/CV7vZGPRXhBgXFpd/4QnzQxtiIfoZ5LWVGpVMTbegPPWMKjpef+aoAv8pkyd+TQ95L
         PAbA5m/2t0H43TMRwvX7NGrj6Om6+Thy1qyLtn8gQCYyqUUjFSq9itwEvOU9L0rE1kdh
         2wIJEiG9b2plHYmwgZ1MYNfoxMnDM8zzgpS6K/RhPOENiklZGc48CHPe8ZciXnOL++QQ
         CLSTaqI3wUvH855DoOulviuypuuvF4KQ5hDZQcWbmPQOnLuHqNbIWY3NCyZLff2hgQ2S
         BHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950988; x=1687542988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsIopiw9JoRL8YCNOi6lhLXwDxjqhu+fIQ0k1/S9PFc=;
        b=OHFcZnhS4gX8Oldz1d3+1WIIJFAZ4SYnHnmm8Uy/C90fomEiuJr/in28yL+KWp16pO
         g5GH04NtiHmq57dXy1UGHJNJy85VBRWsMuVbgt0nrr27WyGN/zu4E5rdTasLzkrTn+Fc
         QjPGM8sPTX/t3fDlyzlPw1DZbJCRTFEtaahA7fLm1B1HYvYSbvUxYBCOZ6vjvDFrqWHD
         1c0eaBKeorvAjg1ti46mdOvoKS2yAtcHIHmU+1jcgzIYaQY073u50DQKMsVu7O/cHvXk
         8Qw0B3cXDrnSB+D+gfjnp/P/GNVjv4u/oNNpFp1LeEyLI0oMONNePh1TcL33OSw9eeiz
         Hy6A==
X-Gm-Message-State: AC+VfDw3iQ4WNKnIxl5/HIN+TB4vC7wsIwXlcqErTppNIjGrTETNzgXS
	Esd5kepM+hnCcEAeI1rXYp3zdah4W8u1fmoGDeRh0jTCwNxgC5T7tnOWiXEw
X-Google-Smtp-Source: ACHHUZ6KcFXlItMS5XLSBGvI3RLrOu47xMt07lpQfUaMl4qrV0asYmJmRNUIrAOHJ53T9qIjE0GTaD19tUSDp79HtGA=
X-Received: by 2002:a7b:c414:0:b0:3f6:44e:9d8 with SMTP id k20-20020a7bc414000000b003f6044e09d8mr524503wmi.22.1684950988378;
 Wed, 24 May 2023 10:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxAdhmj98prJ2QCuN4p1ZxRZs3ZFdchxdZ-_A9c-ACpMOQ@mail.gmail.com>
In-Reply-To: <CAH2-KxAdhmj98prJ2QCuN4p1ZxRZs3ZFdchxdZ-_A9c-ACpMOQ@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 24 May 2023 10:56:17 -0700
Message-ID: <CAH2-KxDfqpMLpeFkKn8BHkL2e7nwVBR+o3ziDBvw3KJd6fHwsg@mail.gmail.com>
Subject: Re: Prioritizing URIs with tight performance requirement in openBmc
 with bmcweb
To: Rohit Pai <ropai@nvidia.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 24, 2023 at 9:26=E2=80=AFAM Ed Tanous <edtanous@google.com> wro=
te:
>
> There's likely a few other minor things that would need fixed, but the
> above is the general gist.

I spent an hour or so and put together a simple POC of multithreading
bmcweb.  It's not threadsafe for all the global structures (although I
did one as an example), and has a lot of safety issues we'll need to
work through, but will give us a hint about whether multi-threading
bmcweb will solve your performance problem:
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/63710

PTAL
