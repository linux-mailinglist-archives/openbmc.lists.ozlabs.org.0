Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7C97A9721
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 19:12:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UPnGHFNw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs25d0bWYz3cNK
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 03:12:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=UPnGHFNw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs2504lzVz3c54
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 03:12:02 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-307d20548adso1069267f8f.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 10:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1695316316; x=1695921116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6Z9BJVwoPRHcNsKh8aNFq5mjpLmWXkgvWUKkcawgqA=;
        b=UPnGHFNwheZocqER7ySnrkX7vP+eCiUFPMQkvIRWvN91tvwHlNy/ZNtnR7kfFmIrAA
         rGRwWUN0TzyKwMgiUZXoQaUMxASzODBXwrhOnVTZYn5eWgSQv4nODTSG0fOwC1VAtARr
         WV45jNUSSIc4AsTjR7FHIYxoJ5lbbmgZuV8+4128AzD5lYfMTM+BO39WFAseHC52BZg4
         4R3T7EQjwZzbi3ptGP7sLnJiQnBqBIQTCQ/39pGqMvFyQk0nxBLMkR5QP+5VIaqPWrFe
         07ibNi1cuEANC6Y8mh6Rn7ky+hL8sKez/GbV8BATPONGXEnB/8IgncJBIsDQVA0qUIUi
         X/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316316; x=1695921116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6Z9BJVwoPRHcNsKh8aNFq5mjpLmWXkgvWUKkcawgqA=;
        b=QYgDWmVg3i6G8a/bDG0zPSk7Eml8xoguvC3oPbQVtJ3+ZTgQCwXzWevdARBXNIF8hl
         hMtNxzYGkUV1h3mWP8+TEGOF94a1Rxvg5I+woffsIj1HAJe3wDTg8HIG922+FcmeKMkj
         1VoJFnfVSapz+3D+tah3U7+kg/Ri/MJzVSI6Xa07dmnorA49wsed9VwuWIyNxXZ/FLND
         ofBoGv4F6qDGw+vzejnmA8g7ymCSUkfsy85YIFsbbRXM7ExwFU6BXs2GarNxZovlUJtV
         mwptzg2DwE0WoXBZ3M7x79a2oqF1uLsv9Z77U9dfv9TY0xkZND2pfi0f1ZdhXMKcCfss
         HItQ==
X-Gm-Message-State: AOJu0Yy9HovMcc8yluhlRXiqoSDDIyFTsekzMUJL85H5Ainkm1pVFQ+D
	5pggGLv4MxhGbFuC7SoXM20NrBZqjyVLn+byP/9Wpw==
X-Google-Smtp-Source: AGHT+IH51fnBvZjUcpBiinOYjubX5/wJ+7kSf5utvFB2Oa1Q9OO0gisSSahVAQltUTeL7pEvuGRgXYNA7kzgCr2HeoU=
X-Received: by 2002:a5d:6a82:0:b0:320:bae:2dfd with SMTP id
 s2-20020a5d6a82000000b003200bae2dfdmr5733382wru.5.1695316315674; Thu, 21 Sep
 2023 10:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pST5nX76byef6S4rsskMRD3xvF5gAVqhr2eRefcRa-qA@mail.gmail.com>
In-Reply-To: <CALLMt=pST5nX76byef6S4rsskMRD3xvF5gAVqhr2eRefcRa-qA@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 21 Sep 2023 10:11:44 -0700
Message-ID: <CACWQX83En+xqRAwM9hSwqFsZ_+SA6rqtGC7TenYSdAcxdPvaHg@mail.gmail.com>
Subject: Re: webui by default in openbmc images
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 9:58=E2=80=AFAM Andrew Geissler <geissonator@gmail.=
com> wrote:
>
> Greetings,
>
> I was adding a new system recently and wanted to add the webui into
> it. Doing a quick search[1]
> showed a lot of people adding it in via a RDEPENDS on some other
> unrelated feature.
>
> It felt like something that deserved its own openbmc feature and
> should be in our images by default.
> The following commit does just that:
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/66675
>
> Please feel free to weigh in on the review if you agree or disagree.

The problem a while ago was that the webui is not able to build
offline, and completely bypasses yoctos do_fetch step, so the sources
aren't traceable and make the software bill of materials wrong.  What
exists in the OpenBMC recipe is literally just calling NPM install and
using the NPM registry to build the webui, which isn't able to be
built in an offline cluster.  That, along with issues with some users
proxy configurations why it was never installed by default.  I think
we need to take this up a level, and if we decide that we don't need
the defaults to be built hermetically or traced, and we don't want to
support devs with a weird proxy, that's fine, but it should be a
project level decision on that, not specifically scoped at the webui
as a default.

>
> Thanks,
> Andrew
>
> [1]: https://grok.openbmc.org/search?full=3D%22webui-vue%22&defs=3D&refs=
=3D&path=3D&hist=3D&type=3D&xrd=3D&nn=3D1&si=3Dpath&searchall=3Dtrue&si=3Dp=
ath
