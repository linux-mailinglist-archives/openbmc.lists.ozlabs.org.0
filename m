Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E048813A0EC
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 07:22:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xgNn0sf3zDqM4
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 17:22:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PN6tsTQW; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xgM85z4TzDqNV
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 17:21:07 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id x1so5180136qvr.8
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 22:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQ+VKRCTNAjnpnKjRb9gq0oGAif3kxNbN3k0mQNHjWI=;
 b=PN6tsTQW4kDjvF9e23J/EQkiVJM8Mup9C+Gmn3wPXg1dbKUCuvknimkOfNflTwk1Cm
 KfGga2NQhtw4IhEsn8FJAmS29jVY2n0weWwlPtPIY/+vQIqgmUZu39zBF3Yz2cckyvt/
 KdFpbarSQuO0GhoeJLMMLPhVoMIfDaav8GvJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQ+VKRCTNAjnpnKjRb9gq0oGAif3kxNbN3k0mQNHjWI=;
 b=UbfD0oO61gyR4f8vATuC+Q1u4g6JorrKZ1j+jIanMWUHoDB0ny14hTJuA0Nz/ee7hf
 BqGKfJFyNB+wFaouer1FHu3WE6EkySdf4AzoJ9YX8PLYlMRf8FG/AxH6HrNRQZo9GPFS
 5lA36BgNMSI0l4KgkCz64i7ZcP51p94e2rj73Cd2iitHwWNEzxCLNKhsmNSMxKf44+Zi
 pLZiFUPTl+RBbBYRQPvMtZGfhIUstz+IeXlYuDhRuKXPqPbhpZIfDNb3SOWsileHG7jq
 xKD/CibUuYdjDRA6pajKnBpJsccAlQIrQGyzkiTHp30ua4HdDDb+CxyXqhQVHS1QxfRg
 HV+A==
X-Gm-Message-State: APjAAAUfPlhO+a/enTB5WSZz6N8vEQaV0ALXlDHWd9fG8kBzs138c8n/
 +xCXyNmEmWiIvCRT7zf8BCgYmKUUaOdcMifKaXdMZg==
X-Google-Smtp-Source: APXvYqzIQNITwVva/ZofBQyRBa3zh0wglg9YZJRZ3tcjVxUj/KL6nReequcasVtBaBx1bQvOdv2LoJaHu+6e6sB9evQ=
X-Received: by 2002:a0c:ed32:: with SMTP id u18mr19712599qvq.2.1578982864118; 
 Mon, 13 Jan 2020 22:21:04 -0800 (PST)
MIME-Version: 1.0
References: <483d360a-80c0-38f1-ffde-849d01d2597f@linux.intel.com>
In-Reply-To: <483d360a-80c0-38f1-ffde-849d01d2597f@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Jan 2020 06:20:52 +0000
Message-ID: <CACPK8XcThx72j2QOg58mASLg+HKU3vnNkNbiAW9knN85p7UpTQ@mail.gmail.com>
Subject: Re: Aspeed video engine patch
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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

On Mon, 13 Jan 2020 at 18:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel,
>
> Can you please cherry pick this patch from upstream?
> https://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git/commit/drivers/media/platform/aspeed-video.c?id=0e78795e95c540bc49c2e094103932eb6a06e6c8

Done. Thanks for upstreaming your change.

Cheers,

Joel
