Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89086CA9B
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 14:49:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CjnZBdGN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlsyg11fgz3vYq
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 00:49:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CjnZBdGN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlsy771Dpz3bWn
	for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2024 00:48:46 +1100 (AEDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-21e9589d4ffso500828fac.1
        for <openbmc@lists.ozlabs.org>; Thu, 29 Feb 2024 05:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709214523; x=1709819323; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSxjc3lNn30irjy6tl3WUcgQ3MCFDe/uUEJxiFibB8E=;
        b=CjnZBdGNsjATyoOCVeSP3CfFtQvPEm6n5dmELT1QDeA21+H4gj4oei93HuXlZmw1Ut
         Y4zlsd7ABGnFlxkaba/Y/7A8TlySiDLJ719gy5fqOmCzl33ynAzVm5uz+TMKs7Zbe9EJ
         aMW98NDFTRFVByQLTAr7hcwfasD12Dv94qxS6uyXJ0RH8O+r+AOQP6r+HdYtvLtV1EFe
         5hgLnpULzXiEgCK6w81WalC/rWRUIxTPVY3z96nlQmmo3em0tSmh7HCDCCjb6t8DlzaS
         vXqjQFmJ1eHIGf5ao+qFoyBwCrrkutZhOHsL2PwNL4PB2/0BFMID+mHstpLgGQffipQd
         MMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709214523; x=1709819323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSxjc3lNn30irjy6tl3WUcgQ3MCFDe/uUEJxiFibB8E=;
        b=P/MxRoE2zJCtYT0I4coK1xpeLOk0z4V7Sbj+MRBAnNkTN1g4zcaZUUOxEbrplyZ9cj
         QxQ8hxb3cl1exsYCmahgo0qNXG1ehsQOq9HW2QnGyN7kNbCibDnBs5185PRLEH/CGVsw
         pdFY4yuAuU3MjNTj2yNvoeIp0HQTZldLOtRKFydzlsje6wRsJJ8RO0CFPC24Y7ul7FlH
         B+GMTUCdn/fUns+VyIw7MbqrSbs0PNO8YaKVGD5XxiX3vQ5rKnTw39XotSVrAGybxPG6
         DCnMNKp7fTxVmzAzUUOGGQQQGHQvMJ03cejE3e7Pf1nZp4AQuBIguK4TQ4PuyKnfwG2q
         cwBQ==
X-Gm-Message-State: AOJu0Yzqn1s/JxJV5Rejs1bkPED7XPJ8btxSa8RSKs5Hh7st0bzB1Qyq
	5v9tvYhQEc9UrDvCJny9Wf7+iqRaMNK6httxaX1bI57iKtIQcWrs7w7sVggvPxrmx92bVH+O4+s
	+TdlI0mgSMNJ0aurdrnFiwYuMiPQDCYXDVak=
X-Google-Smtp-Source: AGHT+IHBq8ad5RqCIHzZCJofyyT4pxMZt7LyZSp1S8TIBhLmUUv82YrRxLqYzEXPeff8z9nZprjIyXzvCTUyOIbbLSM=
X-Received: by 2002:a05:6870:8dcc:b0:220:146a:2c7a with SMTP id
 lq12-20020a0568708dcc00b00220146a2c7amr2376961oab.32.1709214522762; Thu, 29
 Feb 2024 05:48:42 -0800 (PST)
MIME-Version: 1.0
References: <CAMrvLCSAOmNBKBCWSdvbbmWTKMqsLAf1AnvQ_nzJJq6L4wxRaw@mail.gmail.com>
 <CAMrvLCQ8=F8KV2yRrM2r7BWu1Gb9J0p6n9Y5BZ4h16dUy6HD2g@mail.gmail.com>
In-Reply-To: <CAMrvLCQ8=F8KV2yRrM2r7BWu1Gb9J0p6n9Y5BZ4h16dUy6HD2g@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 29 Feb 2024 07:48:27 -0600
Message-ID: <CALLMt=q_0QocTerVF3WGHe9omfc0fzpM+AbMfnsm5B58ozRH5Q@mail.gmail.com>
Subject: Re: CLA signed
To: =?UTF-8?B?w5NtYXIgSMO2Z25pIEd1w7BtYXJzc29u?= <omar@rolla.me>
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

On Tue, Feb 27, 2024 at 8:37=E2=80=AFPM =C3=93mar H=C3=B6gni Gu=C3=B0marsso=
n <omar@rolla.me> wrote:
>
> See attached

Thanks Omar, your CLA has been accepted.

Andrew

>
> Regards
> =C3=93mar H=C3=B6gni Gu=C3=B0marsson
