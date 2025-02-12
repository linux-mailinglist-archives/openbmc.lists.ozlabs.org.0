Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9DA31EAD
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2025 07:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt7Yd3BbNz3cWb
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2025 17:23:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739341426;
	cv=none; b=f83CsXagqkD9eywYtgt+dveU9R1jcDNPZcW545KeSA5JYUzUaAljU1vYFDcJRYCtKfJMopB887BEvpArgWnRMGa7dzEVd1GI/dos4++uAi/FwdOjsnj7W/2hMKDuEatrXXaax0Dh87JOXbh0xaQj9NoS2GvUK943amhGBEUdRoVt9rpnyzlyFV4IhjlIEV2IV5kMN+lh17MXWecJFlUiv3fQjwBl5A9KlCj54n74YEykH9DTqFp49heIasmv/nAZPBer7KJMS+uC7up8ZMGydNsgaxu2aAkgq0lCCh7AHnHbze8ZrPfVEyYvHDbLm4WlPntIbGw+cn3YRBporqKFog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739341426; c=relaxed/relaxed;
	bh=BfKD3b5S5b3OlqQV+HnWCA8kluNb0tBGoJCrL4sn7lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1pkwB6BBMMHi4u4kayXk4QUOh2PM/gYdTSLgu5apvoYEgU45gE+E4AmX5wFjFCArFUf06dYp74Kvhtkt1O56ybocrB6ZTvZX3IBfZcx4jrXNn4jAw+pTWPjYn5xXIPxkgfuj09ugdwk/SxNw2WV29xoIve3LOvxhiI9YhQHJgr5QrK01x2265Sgq4OiE15OAlu34gKLJdlPjrQnEanQFBYxDc7sBzV9+hyAbKDyG2MUkx/Ejy/oPr7tw73D3w9/ZnLJN9aO+XRPul4XkiyGYin4EHu98pbop9rMS54+tf4ZgUC/zQhxve+1xFRbIk4ZeKpnThSsxwnfZ5EEpymZ5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Qgp4d5SP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Qgp4d5SP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt7YX5whyz2xWL
	for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2025 17:23:43 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so4819751a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2025 22:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739341419; x=1739946219; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfKD3b5S5b3OlqQV+HnWCA8kluNb0tBGoJCrL4sn7lo=;
        b=Qgp4d5SPdKlVp95j90gbXY82LPmPFUjwB8g+BUXSvqrtLzG3b7k4G+idwPFbERhW39
         CtwZ5qD9fshwW/wj1xxJBnrL2VgC5Gvg4LwtAbCasqhkqCABWWKCcMp5zLvGUuJZjQ6s
         4H1FOVXRs7Nv6o79GTKL8ZotoN0ZYz9OJA8U3p4FnjyocoF+FgF0wufVJmgeVQmjZK2s
         ReqQh1bvpSU0qJI+VVZv4rbqbr1X+J1FRbwBoBGv+mOHQ1hfdV3s6/BsCC1bR/nB8Cq8
         5J94lxL2Qg9URbqZUdp6KF2BItCLTLn94K3zPpDF5/PqgvL7Dq54kGynVCuAbe9FRtSB
         DIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739341419; x=1739946219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfKD3b5S5b3OlqQV+HnWCA8kluNb0tBGoJCrL4sn7lo=;
        b=cKBSCWSOwTAonLuEBWsxGal8erkZpxFfqfGCTUZHKhL5Ma0vHMP3+LkCda76ysl0WW
         Op5qMPJYlOOIDJh8cph8LEQwJo9LpI9rH7PwnhIaXaIfMt3dnx6v2HVbVYuOBlGWEHgy
         iFQJ4+PuXubDLyDlAWgfb5Z7V0/faFCKAnUKe46Z3e+dKxquUA3rPQUvyX+7IC+Kfnl7
         w0V7Lex8MeyYmBT0Ei7d5eVr4xmN9NngzADVGLbCKJs+IhoW6c97D/RhaxMf7AKqIh8k
         ujoSX2HDvBboL2v0shKojZTp779mTUareS//mbh41iB2JKAm52ExAqgpuXE4VT7hZvG4
         jpmA==
X-Gm-Message-State: AOJu0YwzVVS6grMvntUWjEhYwQM9TtvWC6JIqVEWVivRrCuPKKNSTmbJ
	6kXq+ZQJ8o0fNpozqqlIICyDXOhrP+ZtYwYIJ+Kc24KHdY3MqBVOCa21o5puQeP2Z3iF4DpgosA
	mM5kn//vOQHe8hLNvjnSBlclJnMMPJaxU+qk3CMjuCtUNqoW/
X-Gm-Gg: ASbGncs6c1tR1LJabG+nxwXubtUFoidtDr6zS+YWNoOLS/ppWXkqCB4Bw94+gIL4an/
	XESOyQvUiVINbBJ6YSptVRnxPHiIhBDWKT9EPOf0AAZb3TRMNuN12cmIjaeVB/ePWKayvvFp+
X-Google-Smtp-Source: AGHT+IEilsy3kcWIDL+FJHKrEUGPgtZUWu73Z9D5Q/l3QsK157Eh8cOU8ugTquMvUS3pYd8QPqxiabJ5xIjKBysRCxo=
X-Received: by 2002:a05:6402:1f11:b0:5dc:c869:da53 with SMTP id
 4fb4d7f45d1cf-5deaddec13amr1598688a12.31.1739341418973; Tue, 11 Feb 2025
 22:23:38 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UHxNhSkzC84hS7fh_s-DpdOuii0g2O=GU4Z1aPQ6YMgKw@mail.gmail.com>
 <Z6v8ivnGwbt1QCDk@heinlein>
In-Reply-To: <Z6v8ivnGwbt1QCDk@heinlein>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 12 Feb 2025 14:23:28 +0800
X-Gm-Features: AWEUYZmVxW3TaVbJoke02FTch1pFwme0vvaqh7Pi4Qo8Amx0RgRh_pBx1yxJ2lE
Message-ID: <CAGm54UG-6wUB7LfC=GR2bJorD9wV-nNYaU5se5+FOL-w17kDyw@mail.gmail.com>
Subject: Re: About meson clang-tidy issue on some repos
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

On Wed, Feb 12, 2025 at 9:42=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz=
> wrote:

> > # The issue
> >
> > With the current meson calling "clang-tidy-fix", it introduces another
> > issue in that it runs **all** the c/c++ like files of the repo, even
> > if it's not configured to be compiled.
> >
> > For example, `phosphor-debug-collector` has the
> > `openpower-dumps-extension` feature disabled by default, and its
> > `dump-extensions.cpp` includes `openpower_dumps_config.h` that is
> > generated when the feature is enabled. By default, it's missing, and
> > it gets a clang-tidy failure on checking this file.
>
> Can we just fix the issues?  We merged the fix for the phosphor-debug-col=
lector
> one already today.

It's not a "fix" but a "workaround". It's always possible for a repo
to have a disabled-by-default config.
Instead, it's more like a bug in meson clang-tidy, that it is not
expected to check the code that is not configured to be built.

>
> >
> > # How to fix
> >
> > I would like to ask how to fix such issues from OpenBMC's perspective.
> >
> > Several potential options to discuss:
> > 1. To fix meson's clang-tidy to run only files from `compile_commands.j=
son`.
> >     Drawback: this way, it will not run clang-tidy on hpp files anymore=
.
>
> I think we/you should discuss this issue upstream with Meson.  I'm also
> surprised they made this change, not because of the hpp, but because of
> dependency issues like the one I fixed in phosphor-debug-collector.

Agreed. It's a meson clang-tidy issue.
What is your comment on this? Which files are expected to be checked
by clang-tidy?
a. **all** the c-like files in a repo
b. or just the files to be built
c. or ideally, the c-like files (including .h/hpp) configured to be built.

--=20
BRs,
Lei YU
