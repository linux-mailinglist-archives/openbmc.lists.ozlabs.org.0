Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45547587373
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 23:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxWkr2sFJz2ywl
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 07:40:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SReqEHy3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SReqEHy3;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxWkR1gQPz2xk9
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 07:40:14 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id f11so10767170pgj.7
        for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2022 14:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=ui1y12SZBckJd6e1cisGBw72kNhkj3XTJQTKB+QQw0g=;
        b=SReqEHy3wJhzujH3h0Ch1wt7MjESNLIf4sbaTY8Koknh92z50+SBAonutcsdVL2DfT
         KaNgtoguNGmeG8fJNdaJ51jcnAKJfaFLKy50YdnGqPdQ8Ff8Pa1/DrHKWQfO4TZSVIoQ
         Kl0jc9N8HHLW+sIiVOIUUclHkrfrwKvOXIOYv7aQ3eqnSV8pU/PrqRPYf+DwYTdi1EV2
         LZlJ4HFRKJo/wF/QVQ1J+eGW4sRwWLvUIsbiGYrk1IebsfYRmTnWT4/dcuK2YW2UP2+D
         /zAV7fB/8WGUuOknrHOziM1//XeCqMg+y30o3iR5Edz/yD8lVjMz8vVM8PqHhCYUoKoJ
         V8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=ui1y12SZBckJd6e1cisGBw72kNhkj3XTJQTKB+QQw0g=;
        b=LOIJol6pKdOzOsqauh8dmLEvAWcYwWPE9ZpTydwi8h1hNC4hLeLucPD2qK3LjPbh7P
         FBD2GsfbLLoisc7LIhL53F/lhqjP01l48zjojRYuzcAiLYtv77x/SVIlHsiTdM5gn7JD
         A56itz3xhR+cudAZ7NMVfrCb8V/z8ICzpRZpxpDCaXhf6tC6NR7zrOc8fzH5c7TDqJc+
         g+k8Sbrb7XI+B3roo/TxZuFSdUeNBG5S4KNkqeAbgSI1NlaKEXVrhahs6PY43ZffA+JV
         12xLeP9KgeoHZizw8O9Qp4SJKkTtLFMpisq7O84Vjn2njV6uiSkN9v5nrHIBkSYIzLjY
         Phnw==
X-Gm-Message-State: ACgBeo1WwWRHPSIqp2LN6TdcEDYwpjifxVUTAjvYT0UK8B1YObMOJPsk
	G2PvXGzJUL+Nj+qc6MkXSvfr9uWIf46pELms9lpzquPM8rU=
X-Google-Smtp-Source: AA6agR5Ae3AVbZ/87qB1QiN47vIovc6+Aj0Vktr0SpNnSL3PCldjvmQn/o9UN2KKqqhFvdnWYT6H/q5nhPlN+/SC/E4=
X-Received: by 2002:a63:914a:0:b0:41b:c1f0:d18 with SMTP id
 l71-20020a63914a000000b0041bc1f00d18mr10391651pge.534.1659390011092; Mon, 01
 Aug 2022 14:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com> <7f80cb3f-def3-f9ca-58f2-eebe053dfd89@yadro.com>
In-Reply-To: <7f80cb3f-def3-f9ca-58f2-eebe053dfd89@yadro.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 1 Aug 2022 14:39:59 -0700
Message-ID: <CAH2-KxAWTgmc_C_vEkB-zObOG9La-u5H0=_8YdauCkunaVsefg@mail.gmail.com>
Subject: Re: Can we improve the experience of working on OpenBMC?
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
Cc: Benjamin Fair <benjaminfair@google.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 1, 2022 at 2:27 PM Alexander Amelkin <a.amelkin@yadro.com> wrot=
e:
>
> Hi Andrew!
>
> 27.07.2022 04:22, Andrew Jeffery =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > # Problems
> >
> > 1. Yocto is hard
> >      1. Managing patch stacks is hard
> >      2. Yocto-specific tooling is hard
> >      3. Finding the right recipe file to inspect/modify is hard
> >      4. Yocto has too much documentation
> > 2. OpenBMC has too much documentation
> > 3. Querying design/implementation/bug properties across the project is =
hard
> > 4. Coordinating breaking changes is hard
> > 5. Coordinating tree-wide changes is hard
> > 6. Identifying the right repo to file a bug against is hard
> > 7. Transferring bugs between repos is hard
> > 8. Bug reports are duplicated across repos
> > 9. Bug reports are ignored
> > 10. Working out where to submit a patch is hard
> > 11. Getting patches reviewed is hard
> > 12. New repo requests are bottle-necked
>
> To the list of the problems I would add:
>
> 13. D-Bus is hard for newcomers not familiar with it, best practices are
> not described,
> inter-process synchronization when accessing large d-bus objects (like
> network interfaces)
> is not inherent to d-bus, and auxiliary synchronization using standard
> POSIX means is neither
> explicitly requested/advised, nor controlled/enforced.
> All that may lead
> (and have previously led) to
> races and various other problems. Add to that the long and inconvenient
> prefixing that we've
> discussed earlier in another thread where Brad has supported my point of
> those being useless
> to the project.
>
> 14. D-Bus may become a bottleneck or a slowing factor (due to the
> context switching overhead) for
> the situations when two processes are communicating actively. A standard
> POSIX IPC like pipes,
> mq or shm could become a solution (with d-bus or any other method used
> as an aid to negotiate
> names, keys, or whatever other credentials needed to access a common IPC)=
.

FWIW, in the original context of "a single repo would help with these
things" I don't think either of these would be helped with a
rearrangement of code.

With that said, lots of people dislike dbus.  There are performance
critical things (SOL, KVM, Virtual media) that have completely avoided
it.  If you have a proposal for something better, I'd highly recommend
writing up a design doc.

>
> WBR, Alexander
>
> P.S. All in all, I think d-bus wasn't a good choice of IPC for a system
> running on a low-performance single-core ARM chip.
>

So propose something better that solves the same problem within
OpenBMC?  Or, alternatively, there's u-bmc that from the sounds of
reading your above is closer to your ideal in terms of trade offs (no,
IPC, efficient point to point comms with grpc), it might be worth
looking into for either using directly, or porting some of the ideas
it encompases into OpenBMC.
