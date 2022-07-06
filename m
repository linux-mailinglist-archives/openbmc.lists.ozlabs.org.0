Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E56569414
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 23:16:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdXR11Ddrz3c2n
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 07:16:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qxZxOVue;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qxZxOVue;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdXQd55z2z3bjX
	for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2022 07:16:08 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id eq6so20791242edb.6
        for <openbmc@lists.ozlabs.org>; Wed, 06 Jul 2022 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hThyagx/3gO75R3ByObu2jcXCn9gsg8eLIOZEOFTgW0=;
        b=qxZxOVueXL4xlVup4HqnHuiID4ylYROtcIuMl/Z9Mo0Y57haMDDPOImjOILx8fPqt1
         k6leDDEur87IiyUGE53yyulvaw0GG6VKKGKtC5TW74SIRBupHfYMrbhWton1G/KnqORy
         Vo8KeFFXMqVBr7tP8UiplZ9ls+YJYM5Y24fTkbZVIxZ5SybAUUJGxNmObIIV8U8HW/Gd
         IYIUjRvth7RP3GtrWLzmNsMl1vQPCgBoGHad5roS56vxNwWFlt94iAMdufbaKZZP73Xs
         /lgqaSE/9c+5UqZmchyK7DTRYBZunag3dRo3yGYzMSfRvdmxdC1DDlGqGsMXCpIL4MNU
         HVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hThyagx/3gO75R3ByObu2jcXCn9gsg8eLIOZEOFTgW0=;
        b=CAGqe8Vf/xEW8vc5e7QRvaqPJAjn8hlz8yPjIMan/+nuPQ+nzwnw2uJAHjlr/+xNLf
         dC1xn+3U8zPF6aKUHL56dJiEMvuGcwBuW3yfcShjPhxbI6DOp7H1XPxklF2berbzeqVa
         TUXkYfm/is90r+XmbOjUo4RiBbuwjyO5D4KNaeivlP9BMH7u+Yl/cwtLIY4pMt2HSgQm
         r8wPOoraUQMfux7kz6Fah4MvmICg16MqIW2v39k4hwr94g9n6Oo2EFwkVj+oRn6xWlFQ
         hDcV4Y8geBZulqO41gpNmzhL9H61FOfbOd5yVFPGnJTivSkEEzZKv644GpyhXHeI4pGi
         Eg9g==
X-Gm-Message-State: AJIora83QcnexVoA1eYdxR4Wpb09gRNZ6P2Vh1mEeFhMyTEdpxeaiB5e
	DIxYYbPQu/E43ae3BJGvKhuaXILtgVs4eGQEjQuuqQ==
X-Google-Smtp-Source: AGRyM1sPbJFOfgds1z44L+2x0LeSz+WDXIcXmrmRGKcnUJOHvArk6m1Yo9JIVaHoclX4irKL2BmvvO9xvoY4Zp4J2ko=
X-Received: by 2002:a05:6402:90a:b0:439:c144:24cd with SMTP id
 g10-20020a056402090a00b00439c14424cdmr33905014edz.209.1657142164310; Wed, 06
 Jul 2022 14:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-3-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-3-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 6 Jul 2022 17:15:53 -0400
Message-ID: <CAFd5g46ftDZwaPDdr8p2tRsd86uEQhFGfv+y6S3EVDtHCEa4zg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] kunit: flatten kunit_suite*** to kunit_suite** in .kunit_test_suites
To: David Gow <davidgow@google.com>
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Greg KH <gregkh@linuxfoundation.org>, Daniel Latypov <dlatypov@google.com>, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 25, 2022 at 1:10 AM 'David Gow' via KUnit Development
<kunit-dev@googlegroups.com> wrote:
>
> From: Daniel Latypov <dlatypov@google.com>
>
> We currently store kunit suites in the .kunit_test_suites ELF section as
> a `struct kunit_suite***` (modulo some `const`s).
> For every test file, we store a struct kunit_suite** NULL-terminated arra=
y.
>
> This adds quite a bit of complexity to the test filtering code in the
> executor.
>
> Instead, let's just make the .kunit_test_suites section contain a single
> giant array of struct kunit_suite pointers, which can then be directly
> manipulated. This array is not NULL-terminated, and so none of the test
> filtering code needs to NULL-terminate anything.
>
> Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> Co-developed-by: David Gow <davidgow@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
