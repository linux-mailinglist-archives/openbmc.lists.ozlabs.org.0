Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ECC5C8E8
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 07:42:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCms1QnWzDq9L
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 15:42:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="eotGDzGh"; 
 dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCgR3HD2zDqSw
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 15:37:38 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id s15so17159336qtk.9
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2019 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEJmJ5bmZu2aUaRsfblZAliRUWVSK99fWOH06JtK9wQ=;
 b=eotGDzGhAcM+XY4+MXihcGaYbbnaftFonGF5qed280h4aysl5yr5zYuxXB++U1ghQH
 YrHYll0s/NPiftF2c/OCgWGpVZ0nLPi91QAB1/+PDKrmkLdHQpeyqQSxnDI6d4H3ewmD
 O0XwQ89v0Qkl622bBj1agpnUDVYOqDHUjROcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEJmJ5bmZu2aUaRsfblZAliRUWVSK99fWOH06JtK9wQ=;
 b=mNm7LM6k5YK1yOYkwYPWxppzbH9CymIZLnMCYgnqA5BCOy9ioCpnMpDDxSYtVeXvpp
 /gQtyShzbxga1TMpDmAHTFuzkA5SwMYGDTXl0N6c2aedbJfbrl8A/liys6t3pxyECs3M
 ig5s0BFTftnjyp1Z5SBcV0Q4dkVo7q26U4Ts5F09WJtNq6F+u58AVmXeMg/RANyqIPgH
 8NzjYsPBZh6lEBQwJuekTdsuNczGIckbwXmgz+T99PBjQP0q4Io//HsivYhB73ms+lAd
 cazR24cHQusf/JgGFMIt8yHei7mJp4d33SFZbPM/WQylUgG/QNhXcyqwVoF9vA8IejTN
 fc3g==
X-Gm-Message-State: APjAAAWUSY7/iMgmaXgsPH/Lui0clQAiYG2RNk8hnsrd7cYXMEVtc1PL
 l7YUO8QHsaaGkXRt7XAjhXrgJiR6upRr05Fxp3k=
X-Google-Smtp-Source: APXvYqyYBwbOrQue7IViATlpTPnF5t792bwNPFqhXDKAgKpaob8U5EXY0FK27g3cB8tcraUUzp7lSZXiKFcHREP4Qow=
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr23685668qta.169.1562045855514; 
 Mon, 01 Jul 2019 22:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <BB3AF06A-F1A5-4999-8D8F-BD58F39D68D3@fb.com>
In-Reply-To: <BB3AF06A-F1A5-4999-8D8F-BD58F39D68D3@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jul 2019 05:37:23 +0000
Message-ID: <CACPK8Xfa_VWRp7_Waxx0x+xKK7kWv+ugjdFNoMcb5MziF3BUwg@mail.gmail.com>
Subject: Re: obmc console history
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jun 2019 at 19:43, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi,
>
> Do we have option of storing obmc console history somewhere which can be referred later on.

obmc-console-server writes a log to /var/log/obmc-console.log

Cheers,

Joel
