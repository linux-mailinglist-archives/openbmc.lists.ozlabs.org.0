Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA88B7335E
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 18:08:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v0dQ16VtzDqPT
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 02:08:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HzG6vz1Q"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v0cs4n9tzDqK5
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 02:08:13 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id g7so35397707oia.8
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8MguNQJK7DJYbSna4AJj155sIlaCl6m8AuUEGRnYDe4=;
 b=HzG6vz1Q5yXxHNJT5ldYLBcR6HwBiDAzt/B2Q4QwGloxZtV8tKY2s1+kJwsheBlvCw
 8xZu6oi1Xom764QF0awSddki76/ZBCApIlALoEKvslS046j1V6OWuyOqfbn6QTIVs7Zu
 MAdgB4ZqDUU3+IloZK4fN18/Wk+7QmTs7dIiTwrOkEfSzMWc7ZpKoWdkarHtH4hXCGeK
 brx7ib3pPEDEtdNvTjeqd35161PdGsyOKf4lJtVe+NgAuNOx+nwYk1d0a27NZ6iThYEG
 3zoWfsxiAk0Q1e4iLYqF3RxEWqPaVsjjR1QxTnZN4EYotdio35HZ6b/F7eV0/iXFTMxM
 j0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8MguNQJK7DJYbSna4AJj155sIlaCl6m8AuUEGRnYDe4=;
 b=Ta7xDvkzrwZc/V8cuo3lvvJbquMc+aTscqp7+EUXhpRvEjWmhTZ2A5ZaVsFn3g4IQ4
 8Bp0tqldewVHF6ggDVM4cIKJ6SufHpXmk/HTTn6K0xcenmoE15GaBhYWk3PxNMggPh5u
 RCbSZyaK0A1lvFRd9LO0BXSTJlc2acPYUk6uC+rGba6w1unnZWeaAc1co5adAEwvgL6W
 aakqgehAvoo/tRD2Man4ka+ZUk1VlAGfApUzmfd77iSjAK/B9nmx+TY6nVxDMetsKH3g
 fIecT25bvOUuHA6f39hSHZYt4ltlS5zKWcC8UWjDnWcrFqgpYWJlEIHBSNEko2j8qpeN
 olhg==
X-Gm-Message-State: APjAAAVYPliQwbAiCyE20TN88vCP/LiCVI2Vr4eEJWZTqi4YQ+qM0DAD
 6qfQP7RRTA0sXt0NhKgz81WvKXgWAKvkNiXkEKMbF9A+
X-Google-Smtp-Source: APXvYqxIg9kM17DX0ACSr/NgaM1Vi9hCbmoLotASSQkFyF8rnvDIVA5nUOfTxawW2hjOsfauAkl11xRM/hOX9JcM0Rs=
X-Received: by 2002:aca:2b10:: with SMTP id i16mr37287373oik.42.1563984489666; 
 Wed, 24 Jul 2019 09:08:09 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 24 Jul 2019 11:07:53 -0500
Message-ID: <CALLMt=p+0oGLzYxcLKmayqZde-yy=8MUsjquwqF1TFrL5ipcoQ@mail.gmail.com>
Subject: Infrastructure Meeting Cancelled Today
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

Nothing hot on the list

Andrew
