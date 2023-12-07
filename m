Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63705807CD4
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 01:15:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cgWRyVlJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlvtR5bYxz3cZx
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 11:15:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cgWRyVlJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Slvsr16mKz3c5H
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 11:14:55 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ca02def690so1278951fa.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 16:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1701908092; x=1702512892; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aExrMzseaPCtr7qllg3fK/6skU3hJFI72djJycdLY2w=;
        b=cgWRyVlJx66LO2PCCVmqErZ8GtIsnQtXAYujRW1IvUNG4wb+BF1FRmNSHfIir2Qzwj
         RlYG0skGCH/PMDU5ObAJ7tq0m6zO+syOqod+rc47y1LHg0b97pwG2kqNQjGnWRFMekUs
         LG6+1Mqr00vSGw/LyuZ4Hso1MxI7tWeFnTyUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701908092; x=1702512892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aExrMzseaPCtr7qllg3fK/6skU3hJFI72djJycdLY2w=;
        b=BMp1f1SR0bLieRBK40Ik+bhI88Ds3R6gZT0ovO7n37qNlxGJX4oju5F3IvIRJHDEXp
         tPwVCQRXKgKbLew/Rxk8XRpcGVbHMGannyy1WMnwsjALgdozb6pjGUYEZGvTTGa1TqxV
         lVjzv+3P/fr6iXHJUjusHnkU3qDzfaECEkaeJEKLusGf+8KN7l6Kha3PZdZ61R7Idcfn
         WvtHWI2PG0RGbgVMOWCg35QzUR1vtV8s+KDSGhTbubKnNC3zOPujHDkmmmeMLQjF5tCa
         pjjWBxB5BZwx7ZU3cJ+vFy+Ve6/OaaBMXKvfLfLgNSN5zAVDU9mDPvv0aKLRkrbJsi72
         mYAQ==
X-Gm-Message-State: AOJu0Ywum2RYciq4PWECmsw6d2Ljy5y8nKMutbLMdDqoHQIfeIfcjbWs
	XNoxvtppUT14i7G7dp4um78eGC3omf+vOxTxCL4=
X-Google-Smtp-Source: AGHT+IERCcEncnnkt0Rgjb+0hE28Ryqtdyrz4kJKjTvfFzV8KVXRnrAzmSz/hJ4CB/SA9Xn5laKix1+GOBf0QPYX198=
X-Received: by 2002:a05:651c:2111:b0:2ca:227c:8ec1 with SMTP id
 a17-20020a05651c211100b002ca227c8ec1mr1103560ljq.0.1701908091720; Wed, 06 Dec
 2023 16:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20231122063228.4037027-1-potin.lai@quantatw.com>
In-Reply-To: <20231122063228.4037027-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Dec 2023 10:44:39 +1030
Message-ID: <CACPK8Xc_dUWrkVHuG2ikcWHXtDwQhLpxcycxkjTJtEs-EDzt9Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 0/2] hwmon: (pmbus) MPS mp5990 hsc controller
To: Potin Lai <potin.lai.pt@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 22 Nov 2023 at 17:04, Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> Add MPS mp5990 hot-swap controller.
> Link: https://lore.kernel.org/all/20231113155008.2147090-1-peteryin.openbmc@gmail.com/

Merged into dev-6.6.

Cheers,

Joel
