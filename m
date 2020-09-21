Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96802271941
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 04:23:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvpC04J3dzDqjQ
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 12:23:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=antPxcpN; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvpBH4d60zDqdD
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 12:22:47 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id q13so15502383ejo.9
 for <openbmc@lists.ozlabs.org>; Sun, 20 Sep 2020 19:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3C4o2HyQ6wi8xHEmHWIKa74Nm4DfvNX47BPvdKpk7IM=;
 b=antPxcpNkg3pSfRqrJuQhxboMlaxEx+dglkEbGKjRKh6SmiGI80MxCzo4Y/dzVfqBT
 GjbmNH4+PgYbs5Cm3g6ilN/Q7oZZzW5el6uTUsFvOnNLmzxdfAVzzI7sbZpkYDl1hylR
 SQSh+PVB473cGxBloWGQ7JVI24ODkK8oh6ajY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3C4o2HyQ6wi8xHEmHWIKa74Nm4DfvNX47BPvdKpk7IM=;
 b=tEdt1Gr/unBFtnPaH3287J2nLiJ/xLwSNchdklmngKCeLE+aWkHDgoE7VGyfbFdOJ+
 jCOXluOh2DRXOYHPy7W3TX3U9tjv3lybdvPsKBcko6a/08Z5WXsVYyRWweA0yYUlnG4m
 fz6e0CAfyAcyxTHz/tiXtxXtJRvGfoR9UCGFz0su2BESniL2Uw8nOPd4V3Dc2g8hOvtt
 OigLOKynGrTkrxLNEglWBnS9qHBUKlFDJt84tD+bddSET42jA4kuyEDkKYjqeUP67AzH
 JW7pRTUE3PaO767aQkCwT+ukHxts7GtusUygJcoFde85esCdSGAOnAkup2xdVD9JraT2
 q5eA==
X-Gm-Message-State: AOAM530tSrf9M7omn5jqa1b+gG5BMqVIvK1A8/bB2gSLFFLa0mMM0ZCm
 CrWV9CPJxVLjCrI7Le5HxVFHxb7hnpYC9wE5a2wa4qYx
X-Google-Smtp-Source: ABdhPJxXJenPhzJ45JyfnKMD+m5ZKWbBXUDl103x3ygFaIg6kGYtVq5wVyeIHhykrSwwJ2fK2oqHfAXi2Sbwe5zQhiY=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr46271791ejx.215.1600654962541; 
 Sun, 20 Sep 2020 19:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200918163312.18834-1-eajames@linux.ibm.com>
In-Reply-To: <20200918163312.18834-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Sep 2020 02:22:30 +0000
Message-ID: <CACPK8Xe0wGYL8o+602w6BJfyYkHTa_uotwS_NwSB1A9iW6TC7Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] ARM: dts: Aspeed: Rainier: Rename 2U and
 add 4U
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On Fri, 18 Sep 2020 at 16:33, Eddie James <eajames@linux.ibm.com> wrote:
>
> Split the devicetree into 2U and 4U. Rainier 2U has only two PSUs,
> so remove the extras. Also change the fan details for the 4U,
> which has different fans.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Can we consolidate the 4u/2u models by having a common set of nodes,
and overriding the unique ones similar to how we maintained the
witherspoon128 device tree?

Cheers,

Joel
