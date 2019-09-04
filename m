Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95FA7AC0
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 07:33:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NXYB3HNLzDqlc
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 15:33:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X0KREG02"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NXXd6kTfzDqWP
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 15:33:05 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id s21so41556929ioa.1
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 22:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDkWM9K5PgujufUN0oXfQrA3LgBSUtfm+j018NtBQBU=;
 b=X0KREG02mX6/CHIaHjk2kxKPzln/TVCDIT+hTwthfL9S1YKqnyRrpF9no/MPWqDp7B
 LuqZ5KqOt1QNmEDKf6Oy2PwUtVpd17MPTuNuvNVRrZ8/ft8hFJHv2tXFDue1VxIOdJLg
 ID6BpIkZAZ3VCwQIAHd9H1OMuXIVtzUsSw+Y5NO+tTBVrilwnKXy/84Cx+6c/WxWzOyY
 fqCULg/Un0LBxm5cu+Cqv9vDp7HCWOLE3BZGFrqJktwENWq+biX7qhTLerkIwFZdXyF8
 ATFMkyzIl3OszV4mWOyW14tqXZtwFtcUqOzq/oeiljB51mH1lP3iZlV1OsheowyOhH+g
 4omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDkWM9K5PgujufUN0oXfQrA3LgBSUtfm+j018NtBQBU=;
 b=cU+5maNJg5fEtkpauVQpU/aByjiHf6Ah+ogsbjunUPDjG45GKMfnK/OnLjCmk7ivKi
 /T8fxuI5B5/tI/fnPqn4vivJHU2QNDru9WGeLlCUBsclPV42k4Lz9Dg1FYVmTyv2ybCP
 S/1mXdwoGG0h1TfDJSHXvEOR67zZzuSKPYckaTwaw6mfCTefM6RSp8rnx+sbmaj3q/Ak
 Ws40gJkjAJY68KuLCpZPJDpq1y+jGgS07CT+eWTCbdOaKiTWkxDoDrqn77paLFpbFjUH
 Bv0VOGN7pw+pqBS4LxTVYXQxlqaqVLlyqGF1PnmSplQBJ2QO478H6NU69LjuKyKXE6Dw
 mpwQ==
X-Gm-Message-State: APjAAAXo3VrVDrvRNvXd+PeE8lg09nMwwkDa3eYVW/amxRYQmfokDNG3
 lcggJx0ROTW4X2t4dF3xB99BptxijbqzlyEGTkg=
X-Google-Smtp-Source: APXvYqyUALhgch+OLTUz07A0OTxQgD/q6ixW6qzD6MLO7EbuipCi9UdsYlUSEj4Nq8JTE5oU72RUa4Vxos/B4n3S6AQ=
X-Received: by 2002:a05:6638:627:: with SMTP id
 h7mr42305030jar.33.1567575182091; 
 Tue, 03 Sep 2019 22:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=o3+h7JpEdyFci7BXzpDyN2XvYvDmxOGLwOxaqn9OneNw@mail.gmail.com>
In-Reply-To: <CALLMt=o3+h7JpEdyFci7BXzpDyN2XvYvDmxOGLwOxaqn9OneNw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 3 Sep 2019 22:32:51 -0700
Message-ID: <CAARXrtkOnosU2N6pvNUCxaRnjbXMBKP=iopC+92Gc0iUmzZL0Q@mail.gmail.com>
Subject: Re: stack overflow tag for openbmc questions?
To: Andrew Geissler <geissonator@gmail.com>
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

On Fri, Aug 30, 2019 at 2:59 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> As a community, we're getting more and more questions via
> IRC, the mailing list, and openbmc github issues. Any thoughts
> on creating a stack overflow tag to try and get a more searchable
> and consistent location for questions (i.e. openbmc)?
>
> Andrew

Done. Tag `openbmc` is created in StackOverflow :)
The wiki needs peer review though:
https://stackoverflow.com/review/suggested-edits/23960865
