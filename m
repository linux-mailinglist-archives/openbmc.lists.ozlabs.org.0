Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6C511CBE
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 20:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpRTN3BcTz3bcZ
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 04:04:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Dq/6b7n+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12e;
 helo=mail-il1-x12e.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Dq/6b7n+; dkim-atps=neutral
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpRSx4QCdz2yK2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 04:03:44 +1000 (AEST)
Received: by mail-il1-x12e.google.com with SMTP id e1so477708ile.2
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 11:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+48C9yh+uLQ2UirtasW9FUJBiRq3efcmbVlqp3gHvZo=;
 b=Dq/6b7n+HIUyd8VxwHEpnRB8hUjQ0dhmSkcdGZP23nSwf8+iUTOAlBBy9EC6sMObCC
 ablwMk2s5uq1s7u/VRBvlv5F+Ptqmc0kPADi8vq79NArfO8f/xIzK8tBkIgiDWR0PPfE
 biv0NTvjaIe9EQtIyScZM+jWDDKUYb+JmCb9UCliqw9sUbdZYVAknJXwZBeWq0KixU5C
 0a09lJ09nQxiYRLLXAjTV78wqJbCA9e/Pun0StmtXN67c/sl0NuwZcR2IwsxDAZGkqqB
 rRwNJxoh8qxZfc7LY/vNvco2iXvF+Qfe+IUenBWIGDseqYC8kFq808oOOQ3gZNgBcOhg
 cTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+48C9yh+uLQ2UirtasW9FUJBiRq3efcmbVlqp3gHvZo=;
 b=WMOFATsEGaFNACi8y+bepC8yPXbGi0ui+t/kip0yeK0pBvw4XKbptoviwF9S3Z5aU6
 kfWVWn6/TXuMGOYawM2SUwHUBfE7VUjO0C07uKMMbNj42RvcUhIUIoRE07IkjyxWITwX
 8UGsXjO3cRW5u1h+5m/DwBGcp85O440Gpw6znoJ0ueLyfIlXd3ediZF31x7uVct9locx
 R3XcEBZyDXiMDwECyf7cJl9/1QT/bPWPhG/Eo4nbSBZ3Dr7peb9NQ7Mv+aFajRfGs3b6
 LgEcbjsGMclE7py6F9du0o9q/JwzlNkU8aF9TD4BQlIcwyyMID+XJoQDF7snXGEiLDtu
 LorA==
X-Gm-Message-State: AOAM530WgpJO9TyOscF6cLdk64+fm+BJqI8SVM6DfGo9kvOlXRgXUTuy
 51PertvSvxIajwJF8dXgksxqwGjVHQetOlmN6eSzX0cK6bRURGe+
X-Google-Smtp-Source: ABdhPJw6XGlzfEah7/0zatBawVAlOzVSfDuuJJR0cuVlHQX8Pql3sJjfZ1PKKPKDOlhNizdChw+eYcxwyct2oWXthNI=
X-Received: by 2002:a05:6e02:1b83:b0:2cd:a44a:aa6a with SMTP id
 h3-20020a056e021b8300b002cda44aaa6amr5068774ili.277.1651082620943; Wed, 27
 Apr 2022 11:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <CALGRKGMgs4m=h6udakL_hcUugrPFyvTt+RefBjyVinE9ReGXyQ@mail.gmail.com>
In-Reply-To: <CALGRKGMgs4m=h6udakL_hcUugrPFyvTt+RefBjyVinE9ReGXyQ@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 27 Apr 2022 11:03:29 -0700
Message-ID: <CALGRKGMPDZXh8kZSifJ+XLKbi96LRHcYyJ=Jt9KGHPMmPWk+OQ@mail.gmail.com>
Subject: Re: Request to create 2 new repositories for
 "bios-bmc-smm-error-logger"
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
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
Cc: Ed Tanous <edtanous@google.com>, Kasun Athukorala <kasunath@google.com>,
 Willy Tu <wltu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone,

Just wanted to bump this thread since it's been a week since I sent
out the request. Let me know if the community would prefer I create a
GitHub Issue in the TOF repo
(https://github.com/openbmc/technical-oversight-forum/issues) instead.

Thanks,
Brandon


On Wed, Apr 20, 2022 at 3:36 PM Brandon Kim <brandonkim@google.com> wrote:
>
> Hello,
>
> Following the design doc review here:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/52109/12
>
> I would like to request 2 new repositories as listed in the new
> "Organizational" section of the design template that I filled out
> here: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/53169/2
>
> bios-bmc-smm-error-logger
>   - This repository will implement the daemon described in this document
>   - Proposed maintainer: wltu@google.com , brandonkim@google.com
>
> libbej
>   - This repository will follow the PLDM RDE specification as much as possible
>     for RDE BEJ decoding (initially, encoding may come in the future) and will
>     host a library written in C
>   - Proposed maintainer: wltu@google.com , brandonkim@google.com
>
> Thank you,
> Brandon
