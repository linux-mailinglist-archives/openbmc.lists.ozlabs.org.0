Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 167E7242533
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 08:07:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRK3Z1HjyzDqVV
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 16:07:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=jYp1i32s; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRK2j6pRpzDqS0
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 16:06:19 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id t6so899591ljk.9
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 23:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kms1SP86fI9d+gNBI7F5uPxyinvEB60E2XjISaE67XA=;
 b=jYp1i32sVYO/mj3Az9VVd643rFsFGd0eeQ5K4Q1jBh3muCc3ipAIu0M7LFFTrWXQ6f
 5fLsvBJFEejTUu5ntTYLOMeRMIQptfrFTcY63r/pQqN0Z3dzwSe54QAPvt3zVv0lObDE
 RQ5+HS3KxeHw5hJQj8fik67VKgvVkU0iNYxqYV1eF9kvmOh1vbIpS9whbehCA103eKlr
 KpUDL75S+qxpJB8UQ/xrWKsOnMmfp0bJUur0Sr+1e8kY6x+PXa2zTn/klaOuquE4Qj9J
 qBsKD6KNeLNBeuZ/mwm30pukQ/2+8W/1rFhBV7capg7InPE8J3teIc5Y8es+QvVL7Bha
 K/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kms1SP86fI9d+gNBI7F5uPxyinvEB60E2XjISaE67XA=;
 b=TPGPDe8qndyyneFd2G/2F2nb1GZKgnjTw6QGzoc9FGioFiyfX6EOHqZP8NK5g1WCYr
 4DixsI+ZyVqiRTj/+Ihwf1Kq4nSWRvzw7TCfuUhPcqZI5da6IqWeyGbLcEzAQEVsmO1G
 Rp/08jsUTBlSUhnQt+ix4MeihGLXwiWJcXzjza1PPhxf389f3HcVz6A7rhsEx+9xSlZ1
 f+3ESQh9RnzL5+/uMgJvERaqRjq2jz2UnZ2CYAa1f/1zmJ3okybY0TSk+yRRZbfCJDPS
 3dO1O89nclGDov1HlJoIiET2GLtckX3g7+eXmfmWdAs8HC/ylJbDB7e+Z8JwTMEPThjs
 gOVQ==
X-Gm-Message-State: AOAM5328qj9ZHPpTGRkjhvsLZBxvzKL3MxO+qRBaAFSMvge/puzs7wb8
 3tvSfH+nn0HwAGA868Lc/VohOuQWHmxhEXGoDRAH8A==
X-Google-Smtp-Source: ABdhPJyWFIKsLp4bZk4ESHhYXhwxw1s4k/LM11jTZtHOe7t5Hs+YM6xylER/pU0HGFvpM3qCB2RUeSfieRrKqMQvjfA=
X-Received: by 2002:a05:651c:1105:: with SMTP id
 d5mr5005154ljo.267.1597212372876; 
 Tue, 11 Aug 2020 23:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UEhd6KH0676mqN3EUmEAtgJ81NPKboZUffmRUFNBaXV1Q@mail.gmail.com>
 <aa24752bc957748c8c241cee4b24402bb8e6fa1a.camel@fuzziesquirrel.com>
In-Reply-To: <aa24752bc957748c8c241cee4b24402bb8e6fa1a.camel@fuzziesquirrel.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Wed, 12 Aug 2020 14:06:01 +0800
Message-ID: <CAGm54UHBnv6YkFqCGmJE3Jkx_5gTY0ryaUov+kJGMvsb71kacg@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: Request to create new repo
 meta-bytedance
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 2:53 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> On Wed, 2020-07-15 at 14:28 +0800, =E9=83=81=E9=9B=B7 wrote:
> >
> > Could you kindly please help to create the meta-bytedance repo
>
> done!
>
> >  and add it into openbmc as subtree?
>
> I'll do this as soon as there is some content in meta-bytedance.  If I
> forget please remind me.

A kindly reminder, please help to add meta-bytedance into openbmc as
subtree, thanks!


--=20
BRs,
Lei YU
