Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3358736F
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 23:35:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxWcp2DGsz304x
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 07:35:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pURqKhYY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pURqKhYY;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxWcR02Lsz2xk9
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 07:35:01 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso16581198pjo.1
        for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2022 14:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=MryxOdvsJF1UMEvagIt0mTNDtgmS9wplCj7CjVVw5go=;
        b=pURqKhYYuzuZ4+LQDXQfTHsQmcagG4mL1d5LkqVQQyebMx8ENJJ3lQshcS/Jip2slg
         bZvs0mwLm2m6fW5+1qGXeEGE0YNtJuhgOiIgfQ6WWHD7WS14FWfGjqMoctj7IsiWdamT
         axTl7Hyxlq89qpZ1Wh2ygSVLDXdy5GCpPUGTaeTbMx+Ez+vXuPwEoC/eXQTw6nvyefH2
         CC52pLcAj+O5zYyq/4DspHVCPm3eTemksviChNLUjq0mhmTBBVD0jkcXgUNTmZnLhvWh
         K0vNj6bt0RbV7wrTo4isW1+4us8ORY8qb2FfdxB1ZjSos71NRS6Yupcm0jKgqwo0VfiP
         gc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=MryxOdvsJF1UMEvagIt0mTNDtgmS9wplCj7CjVVw5go=;
        b=TK+yppzfNYdPab7dCE144a7vpJqUH80tLMafh+qA/e5tPeurMcu4oOKP3JqmhocIM6
         7Qzr37JRN5nBsplKXDFi7ntqv41YnFfjWKXupM8m6XMiWpSK33PtOdD7GS06kM835Wck
         sSQEuNK+/3lDRqoDRyOsj8co4ZWceYgMzCSR3ImteYqWGkyAVXovkvmB0FDTkvYPOs4L
         uLdzeI8Sr1eVIf2KY7zbWtStoptNEPmwFU/kfTcs072Eu9zC8eORjggdCwp4TL8yXxqv
         09ZpstmDjQetWWfq4w4EYvrxKC8gTB+nqzt1+AfPdV1I7y4q/Wsdbhxs81Nfhe42hn0I
         HqSQ==
X-Gm-Message-State: ACgBeo1UhqpTrDLmky7Brwa7n27BYfs8/MRh4dil5W37TZUCias3+agp
	aWpq9mXpxLNyvR+Hvj3hExa06Hr75zM1SI9YmJt7aQ==
X-Google-Smtp-Source: AA6agR6RvRcgQGF8eTVubWUywyeAdiDBXTN/ANTXjbnmX9w36nFLJcSge2wl4alf4m0iQHUm3DSBxWShGh7KevdQw0w=
X-Received: by 2002:a17:902:e886:b0:16e:d785:5a0 with SMTP id
 w6-20020a170902e88600b0016ed78505a0mr10724023plg.36.1659389693851; Mon, 01
 Aug 2022 14:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com> <20220729001058.ec2fpmjrrkn75bf7@cheese>
In-Reply-To: <20220729001058.ec2fpmjrrkn75bf7@cheese>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 1 Aug 2022 14:34:42 -0700
Message-ID: <CAH2-KxB1L=a0G+G798zUh+7iO=XhEaTMYiKPnBQzzCA1Eg_ryg@mail.gmail.com>
Subject: Re: Can we improve the experience of working on OpenBMC?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 28, 2022 at 5:11 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> >2. OpenBMC has too much documentation
>
> =F0=9F=99=82 Really?
>

I suspect this is an overgeneralization of what I intended to say.
OpenBMC has enough documentation to expect that new people on the
project would not be able to read all of it cover to cover before
pushing a patch, and to expect that every workflow is just a matter of
"go document that" or "Write a script to do that" overcomplicates
things for new folks.  This is not to say documentation is bad, or
"too much", but the organization to be able to find relevant
information quickly, and the "correctness" could certainly be improved
(I fully realize it's a difficult problem).  In the context of
monorepo, my point ws that less day-to-day developer documentation is
required, because we fall back to gits documentation, given we'd be
using it in a much simpler way for the end developer.
