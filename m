Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC279A56A
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 10:05:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k1H79meI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkfQj4qyMz3c9G
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 18:05:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k1H79meI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkfQ50rwgz3bXH
	for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 18:04:43 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so5401228a12.3
        for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1694419476; x=1695024276; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0nVjsC7I5jxw7PgjDG3HKXNn586jFaDRDKwE8zQ0FA=;
        b=k1H79meIqVSQrUTXW+kF4ANXoBJojFQowtmrrWDa+8D2TsxRbfA8P87n309knk46ZM
         yp70q4YC9+ttqwcFUlmLvrlrpfR41CYV7Wd1LoHte1kqsh1OzxN2u/lCE4pYA07pQME3
         fpZSebTUCdIuoboeCBtEx6XQY2ihUAoRdSyKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694419476; x=1695024276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0nVjsC7I5jxw7PgjDG3HKXNn586jFaDRDKwE8zQ0FA=;
        b=CIgNav7n7CjBhxh3+cbhBHlQfoOd5S9ZGG5dFq61gWNDPUxrLngsiFs8tvEOyLeRgV
         AOVtBbgY5HilSjMzS1VyecnoRQ4lCulpfvUOrfSis/7OI/lBSaOlHA44LePstsu3ulwl
         bSL+DBho/kYqBemyEJAoIoLdVFCAfgYNioFbxMbGOKUtE3g+2ArLNVu6sDEUAu+LjjQF
         w/f8yLdN3mBouJZ6JYdgjTPz2aQGo3iD1bpA22pkXg4k+I03vw9cb4I0xyHtTNQUGeSb
         kGCIhvlyKoeoVc5XRo3ySrRw4SMhIZIAHBjQCRRSZ/b0NeTuON0LU5PuG8SjhD4zmtkx
         Bbgg==
X-Gm-Message-State: AOJu0YzleEt3O6w65GvLX43TQqzHj4t+Hoe7sUXWTWOhDrpjtOdkiUgk
	1SQTfuaerWIRrby96TrMwgKTg8scFeyi2cS4oJo=
X-Google-Smtp-Source: AGHT+IGNOKxxHKGz08wy9DZMz2S+MKPc3MjYI22TEhbpbky4J5LHGZ2j2AYpBjGNFTV+nWews3HjRcFMbWBHUgF1HIg=
X-Received: by 2002:a17:907:75ee:b0:9a9:f14f:7e3b with SMTP id
 jz14-20020a17090775ee00b009a9f14f7e3bmr7669194ejc.16.1694419475485; Mon, 11
 Sep 2023 01:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230905131401.82232-1-stefanb@linux.ibm.com>
In-Reply-To: <20230905131401.82232-1-stefanb@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Sep 2023 08:04:22 +0000
Message-ID: <CACPK8XfECNDdDYfqsJQeUKfEWu-QYb6p2ztd7FjnK3B9rnAgeQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.1 0/5] Backports to support OpenBMC with IMA
To: Stefan Berger <stefanb@linux.ibm.com>
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 5 Sept 2023 at 13:14, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> This series of patches are backports from recent extensions to core Linux
> filesystem code (support for STATX_CHANGE_COOKIE) and subsequent fixes
> to IMA and overlayfs so that IMA can be used by OpenBMC configured with
> overlayfs. Overlayfs is for example used by the p10bmc build.
>
> The patches in this series have been cherry-picked from upstream Linux
> using the following commands:
>
> git cherry-pick 131f4fd2c25a # 3 consecutive patches of longer series
> git cherry-pick a3bb710383cb
> git cherry-pick a1175d6b1bda
> git cherry-pick db1d1e8b9867 # IMA: use vfs_getattr_nosec ...
> git cherry-pick 18b44bc5a672 # ovl: Always reevaluate ...

This is great. My only concern with backporting a bunch of upstream
changes is we miss out on subsequent upstream fixes that modify this
code.

The intent is to move to v6.5 shortly. Do you mind if we wait for
that, and ensure the 6.5 tree has your changes (I assume the delta
will be smaller)?

Cheers,

Joel

>
> Regards,
>    Stefan
>
> Eric Snowberg (1):
>   ovl: Always reevaluate the file signature for IMA
>
> Jeff Layton (4):
>   fs: uninline inode_query_iversion
>   fs: clarify when the i_version counter must be updated
>   vfs: plumb i_version handling into struct kstat
>   IMA: use vfs_getattr_nosec to get the i_version
>
>  fs/libfs.c                        | 36 +++++++++++++++++++
>  fs/overlayfs/super.c              |  2 +-
>  fs/stat.c                         | 17 +++++++--
>  include/linux/iversion.h          | 60 ++++++++++++-------------------
>  include/linux/stat.h              |  9 +++++
>  security/integrity/ima/ima_api.c  |  9 +++--
>  security/integrity/ima/ima_main.c | 12 ++++---
>  7 files changed, 97 insertions(+), 48 deletions(-)
>
> --
> 2.40.1
>
