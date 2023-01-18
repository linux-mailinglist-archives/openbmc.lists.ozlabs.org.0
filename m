Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8C67111D
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 03:25:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxV3l3wSCz3cgm
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 13:25:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eGbqeg88;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eGbqeg88;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxV381PJ6z3bXQ
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 13:25:06 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id a14-20020a17090a70ce00b00229a2f73c56so845285pjm.3
        for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 18:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TjGxBsJrN+0FfYQ57FyOT9nguF8pOF/5JnhnePWfGek=;
        b=eGbqeg88yJWl6VO+T3/S9X/VEc0FayLbJ2ecUA3TrPg69GQT4bHX7d293OOB1YFn7J
         uM6ebrI1tKlG3V/sBe4JzQ+1sFA7NHiYAc4P875Xse4LChbrP1VMYB2dNpg/N7/+nSVz
         9wd7DKv+Hnpd96FgXy5BUlWLgnT92g40HrW/xBZGd3gb2C2ezJsGDvFnMDMSOFUenx6o
         AaVBYnqV9isHtRGqtNLH6XHAA08GLS5ui30xMtsb7mmRgEt9XN7Kt5hp6Di9iLGcqGNN
         I1BccXXZf7IGRqEVv2P9QcHT/0gFGSci35cNPMgF6jDK036Y/qXERM4UzOfRsBd9r7ng
         quzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjGxBsJrN+0FfYQ57FyOT9nguF8pOF/5JnhnePWfGek=;
        b=1wCChd2g4SjoKFn52egIwLdro5cXo458PTfkfoBuJknNTiFQehWqbUtqduDmCsnl85
         bN2DGmhVDlAovNcoVzksdA2tKY0BfwT3JKED2h4LRS7jC7PmHb5r8zBJR2vq/uI8GZCY
         +RR0nKYj2kNusb3+K3X43/lmL1dW8jyRPFbVVh4UxD7MxfXbztJUnXQYnd/4rEn4PVSt
         bog/Nm8bSN0zvC6X7/Sh888bpxtclt64QMCIAMyUpUsLoyGGk9dJ9gcwcCawxnL5d0ms
         9Ne0R0nvC7VV/Giv2KUhBOmY2FPoav0vAprfw5TDf/gZ5GQNZ9oe9yC3PiF/fBr8WMk5
         Ms5w==
X-Gm-Message-State: AFqh2kqTixVYW7nF9L0mXpteHf9J70JP3yyHaERonYhDKYFQXoqU2H4Z
	ziV9a44ibhPiY4V787jhtFeOCvov3RXP+kPft5qp5A==
X-Google-Smtp-Source: AMrXdXvfdTyNOESL5Px3GYZCfjAddnGI536fB/sXpPy/0K7nrgy7yTUfkoGED+zGlBqlo9nIUdUMB7IpUJAwnmtqASw=
X-Received: by 2002:a17:902:864b:b0:189:6a7f:3046 with SMTP id
 y11-20020a170902864b00b001896a7f3046mr570402plt.88.1674008703954; Tue, 17 Jan
 2023 18:25:03 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
 <27195.1673986900@localhost>
In-Reply-To: <27195.1673986900@localhost>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 18 Jan 2023 10:24:52 +0800
Message-ID: <CAGm54UF=PXKSobFtEi+S7qRw_Uo=YsCinbA5YVgTR-zD0-kwnQ@mail.gmail.com>
Subject: Re: BMC image generation without private key
To: Michael Richardson <mcr@sandelman.ca>, Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 4:22 AM Michael Richardson <mcr@sandelman.ca> wrote:
>
>
> Lei Yu <yulei.sh@bytedance.com> wrote:
>     > For dev builds, it uses the insecure development key in the tree.
>     > For release builds, it requires the `SIGNING_KEY` env to point to a
>     > secure key to sign the image.
>
>     > It is considered insecure because it requires the build server to
>     > access the private key.
>
> The build server requires authorization from the holder of the private key to
> create signatures.   One way is have direst access to the private key.
> I think that if the build server is so untrusted, then maybe there are other
> problems :-)
>
> I didn't find where SIGNING_KEY is used.
> I suspect that the signature is generated by an openssl command, and so
> actually it could be directed to an engine/HSM.

By `SIGNING_KEY` I was referring to below recipes:
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phosphor.bbclass#L79
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/flash/phosphor-image-signing.bb#L9

>
> BUT, in some cases the process is to build something as a devel-ish build,
> and then if QA approves, it is signed with the release key afterwards, and so
> your process would make sense.

Be noted that in `phosphor-image-signing.bb`, it installs the public
key to `${D}${sysconfdir}/activationdata/${SIGNING_KEY_TYPE}"`.
This means the BMC image will use this public key to verify the image
to be updated.

If we use a dev-build and sign it with release key, we get a signed
image, that contains the dev public key, which is not expected.
The expected image should be signed with the release key, and contains
the release public key.

That's why my proposal is to define a new `SIGNING_PUBLIC_KEY` to get
the above build.

>
>     > An alternative is proposed:
>     > * A new `SIGNING_PUBLIC_KEY` env is defined to point to a public key.
>     > * The above key is default to empty, and the behavior is the same as
>     > before, using the insecure development key to generate and sign the
>     > image.
>     > * With a valid `SIGNING_PUBLIC_KEY`:
>     > * The public key is installed into the BMC image.
>     > * The generated tarball is not signed, only containing the MANIFEST
>     > and the image.
>     > * A new `gen-bmc-tar` tool will be introduced to sign the above
>     > tarball, like `gen-bios-tar`.
>     > * If both `SIGNING_PUBLIC_KEY` and `SIGNING_KEY` is set, throw an error.
>
> There is a chain of custody concern between building tarbar and running gen-bmc-tar.
> So, I'd always sign with the development key, and I'd validate that signature
> and then replace it.

The `gen-bmc-tar` will have a `-s` option to point to a release key,
that will be executed in a secure environment, so that we could get a
signed image with the release key.
