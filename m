Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4851217BEA
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 01:50:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1fMC1bQ0zDr0R
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 09:50:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=S4xCAHk+; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1fLQ73PPzDqJV
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 09:49:50 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id di5so14740778qvb.11
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2020 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PNuQcqQAiNEH25O8bvwYiFp2xOfB+cPmi6Rti9WiFjA=;
 b=S4xCAHk+KBnxzxER7Mde0yDWIx8eBBpcV0QGoG10c0sOxycn6JopaapBN8merocXuE
 OtxKTqUEayer+4OuBmpfHXNuwTPCkPvYwKXD8Br2+QdUyJ3O95jl2QZouP7IblMMYig4
 i/LuJORGmjtEfFGGmEWTdZ0m7lp91NkzVtkwaAw3jFD1ex/6Hrccb5JxR+/xO4wqIEju
 SUZt11dzy8+zkgq2YMtDNbJ+NV62lHMlh112AR1utaBQHH8FxPQWB+CX+WgRVCqtUO3Y
 Z+k9JZmsljz7P+y60Tlx/9R6SvXVFqyak8gaGCRcfJU2CfzR3jExef7Gc2bwRzxuNCNq
 FdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PNuQcqQAiNEH25O8bvwYiFp2xOfB+cPmi6Rti9WiFjA=;
 b=eMYrt8aRPsZywwsdH3+uzi4w6BJkwPvDiEiiFMHm0kQBCI3tIjIyVsS/yrArVswlLU
 p+LgbjRqZgcPTqR0rC6wfemTf2afouXmS/CTtKtUAUO2nL9fYQqwcikdde5RaM/7JSxz
 9TH8t83ZhbZm1usc9vjy905OsAVmugh9OSK+knUIQRzuZGU8JQwk9EoFwylRgWg2jSAs
 Ub9QmwRvQzIBazda0qj1fft05jUGnYr9Rvz3BkcB0SUCjbWqEFNiZ+XUcssSE3RII7co
 kQuBvgsC2g8SwCrM7Z2OfkNOaQxn8zNvApGI5j4DON2Y2niQEUyZsK/4k1MxQGDBxNus
 N66Q==
X-Gm-Message-State: AOAM5324+QG4bHiOafKTWv19Jl8OzpEKHgCIe1+/DjY3UgHk41Q5hvOK
 9FHXSR1LEm+UF6J2DWEGpBJ4vicfi5e2mZpNVvKC3w==
X-Google-Smtp-Source: ABdhPJyWlK/oA0CPtF2OwiB+WZM91WSADA3SdLCMdzuVirhGEE4ar4/2FmDj4LdEw7vos8q4ZagRXtyBK5/i7w8c+hU=
X-Received: by 2002:a0c:f307:: with SMTP id j7mr29958989qvl.55.1594165785903; 
 Tue, 07 Jul 2020 16:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXKcxdbDG3c1hE6nFOs9kxejzWEPDw2J1xYo5emoxcr9A@mail.gmail.com>
In-Reply-To: <CAHBbfcXKcxdbDG3c1hE6nFOs9kxejzWEPDw2J1xYo5emoxcr9A@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 7 Jul 2020 16:49:34 -0700
Message-ID: <CAO=notxk6prforcTO02_P-5VkcmpP-Qk2zhfH8sU5Q0YksusFQ@mail.gmail.com>
Subject: Re: phosphor-pid-control: dbus tuning interface
To: Jason Ling <jasonling@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 7, 2020 at 4:35 PM Jason Ling <jasonling@google.com> wrote:
>
> Apologies if this has already been discussed but..
> Would the community benefit from the addition of a dbus tuning interface =
for phosphor-pid-control?
>
> To get things going:
>
> initial thoughts would be to have the details of each thermal/fan PID con=
trol pushed onto dbus with loop parameters being r/w.
>
> I'm not sure about whether the output or input to the loops should be pub=
lished as properties.
>
> Have this capability compiled out or runtime disabled by default
>
> Things I worry about:
>
> If the phosphor-pid-loop updates the PID output/input/error to dbus on ev=
ery evaluation cycle will it bring adversely affect dbus performance or bri=
ng a system to its knees? is it better to just implement the querying of pi=
d loop updates as a dbus method?

James and I have talked about this type of feature in the past.
Effectively making the PID control object a dbus object.  I think it
would be fine if it when it updated its own values, they weren't
broadcast - IIRC< that's an easy thing to implement, there is a
separate parameter for this.  Then it would be queryable and somewhat
tunable.  Currently the tuning is done by writing to a file, which is
how the scripts are set up - but presumably something more
programmatic or thorough could provide some value.

>
>
