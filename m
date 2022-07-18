Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A3457897F
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 20:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmr3y1kDnz3bw4
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 04:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NahQkqpL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NahQkqpL;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmr3b38Ktz3050
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 04:24:58 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id f11so11338087pgj.7
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XYgWNBKyznGTl/hdjEZ8e0/fK5WKYtnepNIzq668AoI=;
        b=NahQkqpLoX/NE4BYC80oXl/D6nKh+3GbVqHXdX+ZIcQuING0TPqMYU4eaBGOrm7LB+
         X1nZm4lyRfnjseb1UZ/Qh1BF+WgzoBUJku+CD2cW5HHoTKmgCek2jkzHmxXeTBzsJoSk
         wX8pTqRwCgoMn+U4ART7QQ48GeF5AiAnAZO3acUtiWsY2J5LNC+jkF+uuCoOGMQDRNm0
         ETzcrPhhmZBOfo3WdOiO9lChxnoYemf+XuYkc5D2jRzrubI+mu0g4+Ja//5hKY3rtKg0
         mxvjQXgOn8+JydSlVYjf+vmhQOr4Koc/zeEMDc+OGjBks6GMAQB8ff5GsbQklVk7MHAH
         BKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XYgWNBKyznGTl/hdjEZ8e0/fK5WKYtnepNIzq668AoI=;
        b=qVC2QkF5MQfhKyiQTloyLA1IbVWxs/ElBOz9WXuuM5DpchDIYJGqKUhMIRZhEsn1o2
         rtZxNXaXxtnZ1Q1Jd20Flq934Lw+ZBY2BUfMg5JdA8S0KGQ0KT8RxvvvCF2lPAFnA2jD
         wt7CcHYfOpk3fwOm/MN6DK0Th4HtAGehzosMc8Xdq3ktGiW4eQRU5esz0RcaSuWhELYZ
         oxr/dFzh2Eb8Qw3rtjYqg1efL4Khqw4pCdv8xD9mFxLkpDr2x4cqwA9owaieqX93ftRR
         Vjuwmn0BPqfWhWE+iodH59eYaeWLkzWwcxi6tCHgi5vQHlwmn4vhyrGbNRDLZrE/HaB5
         2Lyg==
X-Gm-Message-State: AJIora+dotRDzLGzUcCN59B0lXrNAYJs7fdX6t2ErWNhpL6cyqQFervZ
	HkkWaeEm9dRPhZQUYPhj/3+BGeulkXEzav9Xt9YC92tXlGeH7ESH
X-Google-Smtp-Source: AGRyM1sAg2Sbxu69S+Nk9JNIXWOmvWL0X70SqvEU6T/laanj7xghStnTwq7dqXvY7Fb7HQhJvoOtK9lQzhyruVCiiBo=
X-Received: by 2002:a63:6b84:0:b0:410:702f:88d8 with SMTP id
 g126-20020a636b84000000b00410702f88d8mr26370723pgc.534.1658168695349; Mon, 18
 Jul 2022 11:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <4fd07678.20a7.181be531f49.Coremail.geratul@163.com>
In-Reply-To: <4fd07678.20a7.181be531f49.Coremail.geratul@163.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 18 Jul 2022 11:24:44 -0700
Message-ID: <CAH2-KxCmhpZK-KqtouBJfN72-tph=QYdXdZ1xq_CAyEDwciNXw@mail.gmail.com>
Subject: Re: about webui-vue vue version
To: Yang <geratul@163.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 2:08 AM Yang <geratul@163.com> wrote:
>
> Hello
>
>     I am a web developer.I want to ask if you have any plan to upgrade the vue framework of webui-vue to vue3.x. If yes ,when do you begin to do this.

The short answer is: Whenever someone needs it enough to send the
patch in and test it.  With that said, I spent about an hour on this
last week, and the (untested) progress I made is here:
https://gerrit.openbmc.org/c/openbmc/webui-vue/+/55438

Feel free to use it as a starting point if it's something you want to
see happen on master.  I think right now the last build-thing that
needs to occur before we can start testing is moving the unit tests
over to the vue-tools 3 style.

>
> Thank you very much !
