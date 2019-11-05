Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982BEF304
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 02:49:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Xdl53L6zF3Mk
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 12:49:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="laJgtezF"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Xbh27ZGzF41K
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 12:47:27 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id c11so20755373iom.10
 for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2019 17:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M1EoS7OrwlRtEo1oh7+j3hBFolx/4XbhyGNyIok/e7I=;
 b=laJgtezF0twaYcGvU/r0Tf10TaHF8yLNPHHJdHwSDDnyiQgZm9II56L8D24l3eQO6s
 N8cNG3yKj+rTcg+b7ZryPaAGPm5I+GzIT96b/SeE0F120A+iAEy+15eW5VuKl4ZVA0ZT
 zPCXwdlT1KOgd4NFmHfW0i32j/LnVYaxvZCZOqctbYsPykTORlw7RQf2e7n6HuBa4Mij
 e8YRxaag+Z9s1qjJIq88TUqTBf5mQ1Nnp2tXREkcvdzFn5pYu2zhTfjGEJW7vZYfSc7o
 plslA/pypZv42iD8B36Pj4rh5MTpgMf2OmCjoNaeCCYKG49gv8yMP3/VVEQ48rlBIwjX
 VQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1EoS7OrwlRtEo1oh7+j3hBFolx/4XbhyGNyIok/e7I=;
 b=X4lOubg5XiS4cu1UCdrRQMWUyFBO240prOUhe10Xfti+Wk49vbfk8lTdZaNDf3KXBS
 It6W9Qx9ZK3aokCnQ9dlGtqevLFkSk223u3sbOFB94cWMUpZYAACaVkZQYfNEcH9HarD
 8j0KsueHpPyclo1tZfbv/YGUjYG9l5c2mKDnWVYm/ohbuWQEdI04MqXrhOcePT5xM0rm
 wq6IWSf9jWztI0vIkGK7Opwc9k1EqZcXWdUzX8QCqJq0sKO/Pp6vzS8/ljx+vED0bgdq
 A7aTlNQF1gCQb7NQekkupHcn3qDlczIWHLPkTAp4sdQ5UvvB5Q2pIwuChI/hqtxHLwF3
 GKvg==
X-Gm-Message-State: APjAAAVBVltGPrcOqTS06geq4vID1d6DevtmppjkGkeIdVuf2FW3HRms
 v7U3kTvk14pqh4yWDMG8XikutvQgKLomFDbGiyXzZZaBcbs=
X-Google-Smtp-Source: APXvYqygDu0xrOzmHgdwvcIo8ofOcF70SRd/67KOOWvaIDFVvGmawpu2EkUMy9fm5FyzYrMyyMuCmxBa+4TuiBhsD5Q=
X-Received: by 2002:a5d:9a19:: with SMTP id s25mr15773771iol.138.1572918444553; 
 Mon, 04 Nov 2019 17:47:24 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtnas2R+cbdRmUOwDtibt17h=WTBNxvfPue5NVYuAD31Zg@mail.gmail.com>
 <1C10C853-9371-4F83-A205-DF2572CFB3B6@fuzziesquirrel.com>
In-Reply-To: <1C10C853-9371-4F83-A205-DF2572CFB3B6@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 5 Nov 2019 09:47:13 +0800
Message-ID: <CAARXrtkU_0SYLd3VeqsVo-LYkVNHo_F4Ge9oQ=+M37WNJvGeqQ@mail.gmail.com>
Subject: Re: Issue found during installing systemd unit from repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 5, 2019 at 7:05 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Nov 4, 2019, at 12:39 AM, Lei YU <mine260309@gmail.com> wrote:
> >
> > https://github.com/openbmc/openbmc/issues/3627
>
> Hi Lei YU
>
> Do you have a good handle on the resolution to this problem?

The simple way is to "fix" the services in repo:
* Use ${xxx} instead of ${{xxx}}
* Manually expand the "known" variables, e.g. {envfiledir} to /etc

Then we are all good.
I am not sure if that is the *expected* fix though.
