Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DF265F26
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 14:02:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnvWt0qm4zDqdk
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 22:02:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=sQGO190S; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnvW26NMtzDqc2
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 22:01:46 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id u8so5582003lff.1
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hjB5uthQ0vCk9k/dAMlbO7I1Dcc8NjupWbKnPPzU/Nk=;
 b=sQGO190SMuuAKFUhveq+tsU1xVuqBhVp/B1hKA1vXBDiooKtvJ1UH4AT+JSIET/EnX
 TMrGddy7lGkxuyx5/xroZ0Dcs53x07ZDhwlykypPl+bo93YN5XUCwqMKC3FllGVlCBHz
 pkAP5pKxyqx+psnWlEzBv6+ySUblnSeyjcmHQUwcGe+LjFH/NzRiqQavY3SMxm4mEu0Y
 HXv+K6kXZAzhgriIk+1BJ7H9wL9WgfARpyQnhr5MgPA8oRG+olGTTvBIXECvOlTpkhzV
 qwOGwRQ4zDbG1ZLJvQ53PnHkuSoquFf9XdYpCXwNMfGV0pn8XLsceGlvVkJXhsQNeu0g
 uxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hjB5uthQ0vCk9k/dAMlbO7I1Dcc8NjupWbKnPPzU/Nk=;
 b=SmgYB5VnU/gtls9y9akoeT2E83GWPgsLWR6KinQ29NmK0KYt1TAE2knAhUDQFiQdZg
 tcsxIk//WvtIWaQgYQzFQGsLTXs7Xijea6Cd8SyzLgjT+9Nr8KEdnk4CGzyKSUPIjTlx
 OZGA1oPUJTOEvSx5USrgghzObV/m278bhGfrzSSbZQHAfPUAfUpQ4hEy8+EpGK0a7sjd
 jJIGxrZCDdmJYHWDeM1IAlkfZ0+5V7vwBlEr+2qYZh+9bm9hXFq8Bu0LEFmZsRfZJwna
 C4jJkYOxELW7a987UtdEsqTPyCkOhLedazKOEej+SbM6zTOlOidVLvZzly3k5TfY6WkV
 52Nw==
X-Gm-Message-State: AOAM532JBhkz5x/t7040KmKgwvutak2Hoe0E7hLaopE3iUAW81FCzqGF
 yWBM8uTek1dmyTxZJMqegPXtLXJv1+WpZR8K4ByEhA==
X-Google-Smtp-Source: ABdhPJwjXuSCDcHIWwarJ0KdgDSO95ukggEn71NVhw948GxLNI6/drWAMqwHmXsbQli13lBRdLU7SI4xFoyyjFoY94M=
X-Received: by 2002:a19:ec1a:: with SMTP id b26mr176505lfa.530.1599825699796; 
 Fri, 11 Sep 2020 05:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
In-Reply-To: <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 11 Sep 2020 20:01:28 +0800
Message-ID: <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
Subject: Re: Design proposal for dual BMC flash with "golden image"
To: Alexander Amelkin <a.amelkin@yadro.com>
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 7:48 PM Alexander Amelkin <a.amelkin@yadro.com> wro=
te:
>
> Hi Lei!
>
> 11.09.2020 11:49, Lei Yu =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > We are working on a system that has two BMC chips, and one of them is
> > designed to be used as a golden image.
> >
> > The current OpenBMC does not support this usage, so a design proposal
> > is sent to gerrit, please help to review if you are interested.
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/36407
> >
> > Thanks!
>
> We have this support implemented for YADRO VESNIN in our private reposito=
ry.
>

That's good to know! Could you comment on the design doc and see how
much difference it has?
Also, may I ask if Yadro's implementation could be open sourced or not?

> Ivan will send a description of how it is implemented for us.

Thanks.


--=20
BRs,
Lei YU
