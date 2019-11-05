Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA7EF519
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 06:47:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476dwr04RvzF3tG
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 16:47:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XT0tIvAP"; 
 dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476dwF0xQJzF3sT
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 16:47:08 +1100 (AEDT)
Received: by mail-il1-x131.google.com with SMTP id s5so6838871iln.4
 for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2019 21:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=/NArkiUdGq579DJvOSjyonBl+OaK0LPRivK+2v2EkyA=;
 b=XT0tIvAPbDitJv014+rTzWDAJqIhkXGVsL4JMlAuexoCmUj4Pms/3G0iNdeptPOFFQ
 QIeyI4zVAzzfJ9YFeZdCjOLSlvBZ0sNFBbF5Xtra83EUQxP2bJtzYXvB9q8hlemfDvKz
 Fu/FCAQy8f28StXR6aVkLG/0dKyGcFWval3UaQxqQYTn9UqXbbaUXHGPyS5s3ST3KSHv
 gMPk/QobProzGlnFpQXBRFtEk51GO9lcjofoytlm8nS0bBgR/GSFaQHnEDA7NyJXJvI3
 VqZ1BF7JVYUfqX3nQpUQ2TRj2Hzh4R4pcbTzLATsIU2onnQxujP2JnYyCCt41Pf5l970
 Z2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=/NArkiUdGq579DJvOSjyonBl+OaK0LPRivK+2v2EkyA=;
 b=mkpxttnwG2lsPOtgr5WPbsCc+4NGS28uApmfGeHf9OlI3zTXQWJTY0J6GQSImwFN9M
 gf1tvhDgNIXpFCZa3xmX6hMBvh9RuoaW4hZ2ZTrEll7ukG4XzfrGNyreVOLO3iVEaX8T
 9pvdyCtDV3ifjbx9VEo6cCGA+SMQsXO7gFCxvGn2Dxh80h62aRVvfJ/VGDfeMbgRFCl3
 dhZc2tLV109MH5VaQl7fNMW78sPbC3l2l0aXRbndlBvxvJXWkrO5dRdDXPio9293RJ1w
 hL3F3QwZyBF5yh1kiJv9GHsIR7Osk0qnOZPM1q6N6vh1GmGT29Ci1NHaOYXQVtLCt3kO
 PK0A==
X-Gm-Message-State: APjAAAUn1bA8GXl1YpgKpxMlXhZZLJtV1YymWAxPrb79I78Jd33zIMJP
 QWD6hIKtB0weVn4IPok1tUoAoXwFTacxO4U3RIF5TYT3qL8=
X-Google-Smtp-Source: APXvYqxRk0dhoc9jQ6qjKQW0FnqipBHQdOXhiR+uE2NDQaD4eplIeDDQyT44RYJR5Ek8qpWTq1gz3xxz+3eHCUiZECo=
X-Received: by 2002:a92:d484:: with SMTP id p4mr14513736ilg.52.1572932825339; 
 Mon, 04 Nov 2019 21:47:05 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtnsZGaK3jZhDZvRUXTXwf_hJOMVpPjJMEdQuBBf6d8b=g@mail.gmail.com>
In-Reply-To: <CAARXrtnsZGaK3jZhDZvRUXTXwf_hJOMVpPjJMEdQuBBf6d8b=g@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 5 Nov 2019 13:46:54 +0800
Message-ID: <CAARXrt=frxFP7tJ8vzd2dQ7TmqnQz2Ez4CLuegY9Arsb9Xa8NA@mail.gmail.com>
Subject: Re: local-ci: clang-format hangs in bmcweb sometimes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 5, 2019 at 10:11 AM Lei YU <mine260309@gmail.com> wrote:
>
> While trying to run local-ci on bmcweb, it's found that the
> clang-format hangs sometimes.
>
> Top shows it's consuming 100% CPU on a single core and the memory
> consumption is increasing.
>
> Smaple top output:
>
>    PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
>  99536 leiyu     20   0 97.067g 0.095t  19520 R 100.0 10.8  10:39.18
> clang-format-8
>
> You can see it already takes 10 minutes and it consues nearly 100GiB memory.
>
> It does not happen always, and it seems like it's happening when I run
> local-ci for a second time.
> E.g. the first local-ci runs OK on a clean repo, and the second
> local-ci run hits the above issue.
>
> Is that known issue?

It looks like it *always* happens on the second run of local-ci, as
long as the repo is not cleaned.

The root cause could be:
1. YOCTO_DEPENDENCIES is disabled by default, so the local-ci
downloads and extracts 3rd party code, e.g. sdbusplus, boost, etc.
2. In the second run of local-ci, format-code.sh finds all the source
code including 3rd party, and run clang-format, and it hangs badly.

So we could either enable YOCTO_DEPENDENCIES by default or put the 3rd
part code's path into ".clang-ignore", so that it's skipped by
format-code.sh.
Ideas?
