Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB06F7F9C
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 11:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCPzj3MjLz3chl
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 19:10:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DYOyAfhL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DYOyAfhL;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCPz63R3gz30QS
	for <openbmc@lists.ozlabs.org>; Fri,  5 May 2023 19:10:08 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-51b33c72686so958400a12.1
        for <openbmc@lists.ozlabs.org>; Fri, 05 May 2023 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1683277805; x=1685869805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieAA8rq9tsgUWPH1HH7/a2cZxV/oxCUolt5nb6G+XWc=;
        b=DYOyAfhLMRYSzskx1w6VdF4oelXPO0Sv8ZTTapQGUKG4i5Ej0WhDJ8HMgUbY9bNbpI
         PeLgBcXcXa7Yp1mL3PqQN0WbqqaK3R3VGVoxLrgI2m+r9xvLZ1LeMC4MXK2J0BHxuKEU
         DgJqSqxm3pF3rjEiNU5w5VjevqEoMsbk0oTN0824BAPwK/OS6Ual9sW9Mov6sgTXM9Qg
         e1tyoRpj5roiDU7mKV8xsaXV0FxMqxBdrEmyggy0E/lwAhjDF9xLuIsKFX+y47963Nnx
         9jAI9qxGBI4bmfIE43w8yNRnjRNtVe0xlQ0o2dgFDWdEw0mlvMWo/MJ9PW8yx1Nu6eOK
         f/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683277805; x=1685869805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieAA8rq9tsgUWPH1HH7/a2cZxV/oxCUolt5nb6G+XWc=;
        b=PSiJMX1w8WrZEHfQVCR86/wtpKuVAkLkvT8YdbdmTQMPnNeWMdgPpIYRAv9vqiBPkJ
         riPklQ+I7TMOryAiXuqrilcPO5oOTpgFxgCqDzRpoCeDNPffGlbbrCfQ1p/+6LT0JnX7
         H6xQaLx6N7jpYhEi4w9GOZIUgwr/3OF8FFc3bYGIeByhrZxhxnnB4ARYqavPZlS5k/jT
         soGIrug/RgyJzfB01VFlaCpWO/kNPz5vnkOwc4mnRgdgPahQm52YBQ09VsTME0FFUKxF
         JhDjQmRemSz269k6yI2nUOZd2EEsblvOMNarJtSnQAy+uuCFiXxW9b7Bmf6x3SZV5BII
         beMQ==
X-Gm-Message-State: AC+VfDzUwYucpBzlJksoaLKmFUpHBij1S+LlrGP7xnkRxkqOotHNPRbJ
	hSEtUfNzhf3GUE9hw+M6Q2Lh7T4oIffznOYvVuGTNWmP5tTJvt6fro4=
X-Google-Smtp-Source: ACHHUZ79npoZWG0gpg0ZyBmfvk6momaBNdqpug19/TtXokwN5xXkidSEcnQ/lwb7Fy3iaWIHD7gc6k4CeD4kgZxZNPY=
X-Received: by 2002:a17:90a:7ac3:b0:24d:f019:3f7e with SMTP id
 b3-20020a17090a7ac300b0024df0193f7emr829672pjl.28.1683277805437; Fri, 05 May
 2023 02:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <ZFLepbxKKXVGAwRB@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZFLepbxKKXVGAwRB@heinlein.vulture-banana.ts.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 5 May 2023 17:09:53 +0800
Message-ID: <CAGm54UF=8EWwzC0ZONoYFjHV2RagGyNocX3Ob-ftaYACpG9n9Q@mail.gmail.com>
Subject: Re: sdbusplus updates (client-bindings and namespace)
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 4, 2023 at 6:23=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz>=
 wrote:
>
> Greetings,
>
> TL;DR: I have two announcements of changes in sdbusplus:
>
>     1. Async client bindings using C++20 coroutines are now available
>        for experimentation.

Great work!

>     2. The namespace for server bindings has changed, but the old
>        namespace is preserved for a period of ~6 months.
>
> ----
>
> As part of developing the async client bindings, I fixed a mistake I
> made in 2016, which was choosing a terrible convention for the
> namespaces of the generated server bindings:
>
>     Interface: xyz.openbmc_project.Object.Enable
>     Old Class: sdbusplus::xyz::openbmc_project::Object::server::Enable
>     New Class: sdbusplus::server::xyz::openbmc_project::object::Enable
>     Client Class: sdbusplus::client::xyz::openbmc_project::object::Enable

The previous class was using `Object` but now with the new namespace
it becomes `object`, is it intended about the upper-case `O` becoming
the lower-case `o`?
If yes, why the `Enable` still kept the upper-case `E`?
Do we have a rule that all the strings other than the last part should
be lower-case?

> Next steps:
>
>     - Probably some bug fixes as other eyes start using this.
>
>     - Implement something like `async-server.hpp` to create async server
>       bindings to go along with the clients, which will allow a fully
>       async daemon without Boost (and with a lot cleaner code than ASIO
>       callbacks).

Looking forward to the server binding!
--=20
BRs,
Lei YU
